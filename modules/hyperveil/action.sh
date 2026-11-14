#!/system/bin/sh
# HyperVeil - status report (Run action)
echo "== Advanced Textures / Blur props =="
getprop persist.sys.background_blur_supported
getprop persist.sys.advanced_visual_release
getprop persist.sys.computility.cpulevel
getprop persist.sys.computility.gpulevel
echo ""
echo "== Icon animation level (deviceLevelList) =="
settings get system deviceLevelList
echo ""
echo "== Home screen app name hiding (miui_home_no_word_model) =="
settings get system miui_home_no_word_model
echo ""
echo "== Show touches =="
settings get system show_touches
echo ""
echo "== Stay awake while charging =="
settings get global stay_on_while_plugged_in
echo ""
echo "== Private DNS =="
settings get global private_dns_mode
settings get global private_dns_specifier
echo ""
echo "== Force resizable apps =="
settings get global force_resizable_activities
echo ""
echo "== Textures backup =="
[ -f /data/local/tmp/hyperveil_textures.bak ] && echo "present (original values saved)" || echo "none"
echo ""
echo "Open the module's WebUI to change settings."
