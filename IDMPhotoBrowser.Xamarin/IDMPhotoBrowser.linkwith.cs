using ObjCRuntime;

[assembly: LinkWith ("IDMPhotoBrowser.a", LinkTarget.Simulator | LinkTarget.ArmV7 | LinkTarget.Simulator64 | LinkTarget.Arm64, SmartLink = true, ForceLoad = true, Frameworks = "MessageUI QuartzCore SystemConfiguration MobileCoreServices Security")]