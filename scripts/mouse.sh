#!/bin/sh
# mouse speed
device="Logitech M505/B605"
xinput --set-prop "$device" "Device Accel Constant Deceleration" 1.25
# scroll speed
xinput --set-prop "$device" "Device Accel Constant Deceleration" 3
