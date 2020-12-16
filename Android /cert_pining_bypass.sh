#Download cert and push to the device

if [ "$1" != "" ]; then

	wget http://127.0.0.1:8080/cert
	adb push cert /sdcard/cert-der.crt
	adb shell 'su -c mv /sdcard/cert-der.crt /data/local/tmp/cert-der.crt'
	adb shell 'su -c chmod 644 /data/local/tmp/cert-der.crt'
	rm cert

	#Download frida-server, push to the device
	wget https://github.com/frida/frida/releases/download/14.1.3/frida-server-14.1.3-android-arm64.xz
	unxz frida-server-14.1.3-android-arm64.xz
	adb push frida-server-14.1.3-android-arm64 /sdcard/frida-server-14.1.3-android-arm64
	adb shell 'su -c mv /sdcard/frida-server-14.1.3-android-arm64 /data/local/tmp/frida-server-14.1.3-android-arm64'
	adb shell 'su -c chmod +x /data/local/tmp/frida-server-14.1.3-android-arm64'

	rm frida-server-14.1.3-android-arm64*

	adb shell 'su -c /data/local/tmp/frida-server-14.1.3-android-arm64 &' || echo 'frida server already running'

	#bypass cert pining with frida
	frida --codeshare pcipolloni/universal-android-ssl-pinning-bypass-with-frida -U -f $1 --no-pause
	
else
    printf "Please provide the app package as the argument: \n ./cert_bypass.sh com.appname \n"
fi

