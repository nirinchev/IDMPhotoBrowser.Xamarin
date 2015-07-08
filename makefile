XBUILD=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
PROJECT_ROOT=./XCodeProject/Demo
PROJECT=$(PROJECT_ROOT)/PhotoBrowserDemo.xcworkspace
TARGET=PhotoBrowserDemo
OUTPUT=./Output

all: IDMPhotoBrowser.a Pop.a AFNetworking.a DACircularProgress.a

Build-i386:
	$(XBUILD) -workspace $(PROJECT) -scheme $(TARGET) -sdk iphonesimulator -derivedDataPath $(PROJECT_ROOT)/build/386 -configuration Release clean build

IDMPhotoBrowser-i386.a: Build-i386
	-mv $(PROJECT_ROOT)/build/386/Build/Products/Release-iphonesimulator/libPods-PhotoBrowserDemo-IDMPhotoBrowser.a $@

Pop-i386.a: Build-i386
	-mv $(PROJECT_ROOT)/build/386/Build/Products/Release-iphonesimulator/libPods-PhotoBrowserDemo-pop.a $@

AFNetworking-i386.a: Build-i386
	-mv $(PROJECT_ROOT)/build/386/Build/Products/Release-iphonesimulator/libPods-PhotoBrowserDemo-AFNetworking.a $@

DACircularProgress-i386.a: Build-i386
	-mv $(PROJECT_ROOT)/build/386/Build/Products/Release-iphonesimulator/libPods-PhotoBrowserDemo-DACircularProgress.a $@

Build-armv7:
	$(XBUILD) -workspace $(PROJECT) -scheme $(TARGET) -sdk iphoneos -derivedDataPath $(PROJECT_ROOT)/build/v7 -arch armv7 -configuration Release clean build 

IDMPhotoBrowser-armv7.a: Build-armv7
	-mv $(PROJECT_ROOT)/build/v7/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-IDMPhotoBrowser.a $@

Pop-armv7.a: Build-armv7
	-mv $(PROJECT_ROOT)/build/v7/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-pop.a $@

AFNetworking-armv7.a: Build-armv7
	-mv $(PROJECT_ROOT)/build/v7/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-AFNetworking.a $@

DACircularProgress-armv7.a: Build-armv7
	-mv $(PROJECT_ROOT)/build/v7/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-DACircularProgress.a $@

Build-arm64:
	$(XBUILD) -workspace $(PROJECT) -scheme $(TARGET) -sdk iphoneos -derivedDataPath $(PROJECT_ROOT)/build/64 -arch arm64 -configuration Release clean build 

IDMPhotoBrowser-arm64.a: Build-arm64
	-mv $(PROJECT_ROOT)/build/64/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-IDMPhotoBrowser.a $@

Pop-arm64.a: Build-arm64
	-mv $(PROJECT_ROOT)/build/64/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-pop.a $@

AFNetworking-arm64.a: Build-arm64
	-mv $(PROJECT_ROOT)/build/64/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-AFNetworking.a $@

DACircularProgress-arm64.a: Build-arm64
	-mv $(PROJECT_ROOT)/build/64/Build/Products/Release-iphoneos/libPods-PhotoBrowserDemo-DACircularProgress.a $@

IDMPhotoBrowser.a: IDMPhotoBrowser-i386.a IDMPhotoBrowser-armv7.a IDMPhotoBrowser-arm64.a
	xcrun -sdk iphoneos lipo -create -output $(OUTPUT)/$@ $^
	-rm -f $^

Pop.a: Pop-i386.a Pop-armv7.a Pop-arm64.a
	xcrun -sdk iphoneos lipo -create -output $(OUTPUT)/$@ $^
	-rm -f $^

AFNetworking.a: AFNetworking-i386.a AFNetworking-armv7.a AFNetworking-arm64.a
	xcrun -sdk iphoneos lipo -create -output $(OUTPUT)/$@ $^
	-rm -f $^

DACircularProgress.a: DACircularProgress-i386.a DACircularProgress-armv7.a DACircularProgress-arm64.a
	xcrun -sdk iphoneos lipo -create -output $(OUTPUT)/$@ $^
	-rm -f $^

clean:
	-rm -f *.a *.dll $(OUTPUT)/*.a