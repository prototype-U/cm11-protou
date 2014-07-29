# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/protou/device.mk)

#Languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

# This file simply inherits from all the know language packs.
$(call inherit-product, external/svox/pico/lang/PicoLangDeDeInSystem.mk)
$(call inherit-product, external/svox/pico/lang/PicoLangEnGBInSystem.mk)
$(call inherit-product, external/svox/pico/lang/PicoLangEnUsInSystem.mk)
$(call inherit-product, external/svox/pico/lang/PicoLangEsEsInSystem.mk)

# Device naming
PRODUCT_DEVICE := protou
PRODUCT_NAME := cm_protou
PRODUCT_BRAND := htc_europe
PRODUCT_MODEL := HTC Desire X
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=protou BUILD_FINGERPRINT=htc_europe/protou/protou:4.1.1/JRO03C/162361.5:user/release-keys PRIVATE_BUILD_DESC="2.20.401.5 CL162361 release-keys" BUILD_NUMBER=162361

# Release name
PRODUCT_RELEASE_NAME := protou

# Boot animation
TARGET_SCREEN_WIDTH  := 480
TARGET_SCREEN_HEIGHT := 800

-include vendor/cm/config/common_versions.mk
