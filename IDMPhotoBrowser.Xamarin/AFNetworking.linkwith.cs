using ObjCRuntime;

[assembly: LinkWith ("AFNetworking.a", LinkTarget.Simulator | LinkTarget.ArmV7 | LinkTarget.Simulator64 | LinkTarget.Arm64, SmartLink = true, ForceLoad = true, Frameworks = "MobileCoreServices CoreGraphics Security SystemConfiguration")]