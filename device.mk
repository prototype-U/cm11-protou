#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_EU_SUPL:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/protou/ramdisk/init:root/init \
    device/htc/protou/ramdisk/fstab.protou:root/fstab.protou \
    device/htc/protou/ramdisk/init.target.rc:root/init.target.rc \
    device/htc/protou/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/htc/protou/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/htc/protou/ramdisk/init.protou.usb.rc:root/init.protou.usb.rc \
    device/htc/protou/ramdisk/ueventd.target.rc:root/ueventd.target.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/protou/protou-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=4.1_r4 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.kernel.android.checkjni=0 

DEVICE_PACKAGE_OVERLAYS += device/htc/protou/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/voicemail-conf.xml:system/etc/voicemail-conf.xml

# HTC blobs for recovery

PRODUCT_COPY_FILES += \
    device/htc/protou/recovery/init.protou.rc:recovery/root/init.protou.rc \
    device/htc/protou/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/protou/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/protou/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/protou/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/protou/recovery/sbin/rmt_storage:recovery/root/sbin/rmt_storage \
    device/htc/protou/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# Graphics 
PRODUCT_PACKAGES += \
    copybit.msm7627a \
    gralloc.msm7627a \
    hwcomposer.msm7627a \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libqdMetaData


# Video decoding
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libI420colorconvert \
    libmm-omxcore \
    libstagefrighthw \
    libOmxCore \
    libdashplayer \
    qcmediaplayer

# Camera
PRODUCT_PACKAGES += \
    camera.msm7627a \
    libsurfaceflinger_client

# Bluetooh
PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    libbluedroid

PRODUCT_PACKAGES += \
    libnetcmdiface

# Lights & Sensors
PRODUCT_PACKAGES += \
    lights.msm7627a \
    lights.protou \
    sensors.default

# GPS
PRODUCT_PACKAGES += \
    gps.default

# Power HAL
PRODUCT_PACKAGES += \
    power.msm7627a \
    power.default

# HDMI
PRODUCT_PACKAGES += \
    hdmid

# Torch
PRODUCT_PACKAGES += \
    Torch
    
# Enable Apps
PRODUCT_PACKAGES += \
    PerformanceControl \
    LegacyCamera

# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Other
PRODUCT_PACKAGES += \
    librpc

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Post boot service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init/init.post_boot.sh:system/etc/init.post_boot.sh

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh

# Adreno config
PRODUCT_COPY_FILES += device/htc/protou/configs/adreno_config.txt:system/etc/adreno_config.txt

# QC thermald config
PRODUCT_COPY_FILES += device/htc/protou/configs/thermald.conf:system/etc/thermald.conf

# Vold config
PRODUCT_COPY_FILES += device/htc/protou/configs/vold.fstab:system/etc/vold.fstab

# Calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/calibration:/system/etc/calibration \
    $(LOCAL_PATH)/configs/calibration_EMEA:/system/etc/calibration_EMEA

# HTC BT Audio tune
PRODUCT_COPY_FILES += device/htc/protou/dsp/AudioBTID.csv:system/etc/AudioBTID.csv

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/protou/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/protou/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/protou/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/protou/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/protou/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/protou/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    device/htc/protou/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/htc/protou/prebuilt/etc/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    device/htc/protou/prebuilt/etc/AudioPara4.csv:system/etc/AudioPara4.csv \
    device/htc/protou/prebuilt/etc/AudioPara4_WB.csv:system/etc/AudioPara4_WB.csv \
    device/htc/protou/prebuilt/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    device/htc/protou/prebuilt/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    device/htc/protou/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# Media
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/protou/configs/media_codecs.xml:system/etc/media_codecs.xml

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/protou/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/protou/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/protou/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/htc/protou/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/protou/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/protou/keylayout/sr_touchscreen.kl:system/usr/keylayout/sr_touchscreen.kl \
    device/htc/protou/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/htc/protou/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/htc/protou/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/htc/protou/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/htc/protou/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/htc/protou/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/htc/protou/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/htc/protou/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl 

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/protou/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/protou/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/protou/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/protou/idc/qwerty.idc:system/usr/idc/qwerty.idc

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    device/htc/protou/bluetooth/a2dp_avrcp.conf:system/etc/bluetooth/a2dp_avrcp.conf

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Additional default properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=adb \
    persist.service.adb.enable=1 \
    ro.secure=0 \
    ro.adb.secure=0

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# common qcom configs

# htc audio settings
$(call inherit-product, device/htc/protou/media_htcaudio.mk)
$(call inherit-product, device/htc/protou/media_a1026.mk)

# call inherit Dalvik
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/protou/device-vendor.mk)
