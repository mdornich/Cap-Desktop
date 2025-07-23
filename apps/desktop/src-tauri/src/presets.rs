use cap_project::{ProjectConfiguration, TimelineConfiguration};
use serde::{Deserialize, Serialize};
use serde_json::json;
use specta::Type;
use tauri::{AppHandle, Wry};
use tauri_plugin_store::StoreExt;
use tracing::error;

#[derive(Serialize, Deserialize, Type, Debug, Default)]
#[serde(rename_all = "camelCase")]
pub struct PresetsStore {
    presets: Vec<Preset>,
    default: Option<u32>,
}

#[derive(Serialize, Deserialize, Type, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Preset {
    name: String,
    pub config: ProjectConfiguration,
}

impl PresetsStore {
    fn get(app: &AppHandle<Wry>) -> Result<Option<Self>, String> {
        match app.store("store").map(|s| s.get("presets")) {
            Ok(Some(store)) => {
                // Handle potential deserialization errors gracefully
                match serde_json::from_value(store) {
                    Ok(settings) => Ok(Some(settings)),
                    Err(_) => {
                        error!("Failed to deserialize presets store");
                        Ok(None)
                    }
                }
            }
            _ => Ok(None),
        }
    }

    pub fn get_default_preset(app: &AppHandle<Wry>) -> Result<Option<Preset>, String> {
        let Some(this) = Self::get(app)? else {
            return Ok(None);
        };

        let Some(default_i) = this.default else {
            return Ok(None);
        };

        Ok(this.presets.get(default_i as usize).cloned())
    }

    pub fn update(app: &AppHandle, update: impl FnOnce(&mut Self)) -> Result<(), String> {
        let Ok(store) = app.store("store") else {
            return Err("Store not found".to_string());
        };

        let mut settings = Self::get(app)?.unwrap_or_default();
        update(&mut settings);
        store.set("presets", json!(settings));
        store.save().map_err(|e| e.to_string())
    }
}

pub fn create_builtin_presets(app: &AppHandle<Wry>) -> Result<(), String> {
    let existing = PresetsStore::get(app)?;

    // Only create builtin presets if none exist
    if existing.is_some() {
        return Ok(());
    }

    let u_shape_corporate = Preset {
        name: "U-Shape Corporate".to_string(),
        config: ProjectConfiguration {
            aspect_ratio: None,
            background: cap_project::BackgroundConfiguration {
                source: cap_project::BackgroundSource::Gradient {
                    from: [0x0B, 0x55, 0x7A], // #0B557A - Upper left brand color
                    to: [0xA3, 0xDD, 0xFB],   // #A3DDFB - Lower right brand color  
                    angle: 135, // Diagonal gradient from upper-left to lower-right
                },
                blur: 0.0,
                padding: 25.0,
                rounding: 20.0,
                inset: 0,
                crop: None,
                shadow: 80.0,
                advanced_shadow: Some(cap_project::ShadowConfiguration {
                    size: 80.0,
                    opacity: 25.0,
                    blur: 60.0,
                }),
            },
            camera: cap_project::Camera {
                hide: false,
                mirror: false,
                position: cap_project::CameraPosition {
                    x: cap_project::CameraXPosition::Left,
                    y: cap_project::CameraYPosition::Bottom,
                },
                size: 22.0,
                zoom_size: None,
                rounding: 12.0,
                shadow: 60.0,
                advanced_shadow: Some(cap_project::ShadowConfiguration {
                    size: 70.0,
                    opacity: 20.0,
                    blur: 50.0,
                }),
                shape: cap_project::CameraShape::Square,
            },
            audio: cap_project::AudioConfiguration {
                mute: false,
                improve: true, // Enable audio improvement for corporate use
                mic_volume_db: 0.0,
                mic_stereo_mode: cap_project::StereoMode::Stereo,
                system_volume_db: 0.0,
            },
            cursor: cap_project::CursorConfiguration::default(),
            hotkeys: cap_project::HotkeysConfiguration::default(),
            timeline: None,
            captions: None,
        },
    };

    PresetsStore::update(app, |store| {
        store.presets.push(u_shape_corporate);
        store.default = None; // Don't set as default automatically
    })?;

    Ok(())
}

impl Preset {
    fn resolve(&self, timeline: TimelineConfiguration) -> ProjectConfiguration {
        let mut ret = self.config.clone();
        ret.timeline = Some(timeline);
        ret
    }
}
