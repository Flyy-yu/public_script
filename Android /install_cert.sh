# Download the Burp Cert
wget http://127.0.0.1:8080/cert

# Convert the format to pem
openssl x509 -inform DER -in cert -out cacert.pem

# Change the cert file name to satisfied the Android cert name requirement 
mv cacert.pem 9a5ba575.0

# push to the sdcard
adb push 9a5ba575.0 /sdcard/

# install Burp cert in Trusted credentials-USER
adb shell 'su -c cp /sdcard/9a5ba575.0 /data/misc/user/0/cacerts-added/9a5ba575.0'
adb shell 'su -c chmod 644 /data/misc/user/0/cacerts-added/9a5ba575.0'

# install Burp cert in Trusted credentials-SYSYEM
adb shell 'su -c mount -o rw,remount /system'
adb shell 'su -c cp /sdcard/9a5ba575.0 /system/etc/security/cacerts/9a5ba575.0'
adb shell 'su -c chmod 644 /system/etc/security/cacerts/9a5ba575.0'

# remove temporary files
rm 9a5ba575.0

# reboot
adb reboot