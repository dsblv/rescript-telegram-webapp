echo "# TelegramWebApp" > API_REFERENCE.md

yarn rescript-tools doc src/WebApp.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/WebAppAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/Global.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/Accelerometer.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/AccelerometerAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/BackButton.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/BackButtonAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/BiometricManager.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/BiometricManagerAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/BottomButton.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/BottomButtonAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/CloudStorage.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/CloudStorageAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/DeviceOrientation.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/DeviceOrientationAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/DeviceStorage.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/DeviceStorageAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/Gyroscope.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/GyroscopeAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/HapticFeedback.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/HapticFeedbackAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/LocationManager.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/LocationManagerAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/SecureStorage.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/SecureStorageAPI.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/SettingsButton.res | node docs-to-md.js >> API_REFERENCE.md
yarn rescript-tools doc src/SettingsButtonAPI.res | node docs-to-md.js >> API_REFERENCE.md

yarn prettier --write API_REFERENCE.md
