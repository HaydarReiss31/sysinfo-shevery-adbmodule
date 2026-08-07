#!/system/bin/sh
# Sys Info - manual action: quick text dump (WebUI has the full interactive view)
echo "module=$SHIZUKU_MODULE_ID"
echo "mode=$SHIZUKU_MODULE_MODE"
echo "----- DEVICE -----"
getprop ro.product.manufacturer
getprop ro.product.model
getprop ro.build.version.release
getprop ro.build.version.sdk
echo "----- CPU -----"
nproc
echo "----- RAM -----"
grep -E "MemTotal|MemAvailable" /proc/meminfo
echo "----- BATTERY -----"
dumpsys battery | grep -E "level|status|temperature|health"
echo "----- STORAGE -----"
df -h /data /sdcard 2>/dev/null
echo "Done. Open the WebUI for the full interactive panel."
