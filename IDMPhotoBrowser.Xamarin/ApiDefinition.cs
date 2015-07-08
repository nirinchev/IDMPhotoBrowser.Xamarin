using System;
using Foundation;
using UIKit;

namespace IDMPhotoBrowserBinding
{
	[BaseType (typeof (NSObject))]
	interface IDMPhoto
	{
		[Export ("initWithURL:")]
		IntPtr Constructor (NSUrl url);

		[Export ("caption")]
		string Caption { get; set; }
	}

	[BaseType (typeof (UIViewController))]
	interface IDMPhotoBrowser
	{
		[Export ("initWithPhotos:animatedFromView:")]
		IntPtr Constructor (IDMPhoto[] photos, UIView view);

		[Export ("initWithPhotos:")]
		IntPtr Constructor (IDMPhoto[] photos);

		[Export ("displayToolbar")]
		bool DisplayToolbar { get; set; }

		[Export ("usePopAnimation")]
		bool UsePopAnimation { get; set; }

		[Export ("scaleImage")]
		UIImage ScaleImage { get; set; }
	}
}