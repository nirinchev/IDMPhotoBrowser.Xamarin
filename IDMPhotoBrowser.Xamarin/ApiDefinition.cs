using System;
using Foundation;
using UIKit;
using ObjCRuntime;

namespace IDMPhotoBrowserBinding
{
	[BaseType (typeof (NSObject))]
	interface IDMPhoto
	{
		[Export ("initWithURL:")]
		IntPtr Constructor (NSUrl url);

		[Export ("initWithImage:")]
		IntPtr Constructor (UIImage image);

		[Export ("caption")]
		string Caption { get; set; }

		[Export ("placeholderImage")]
		UIImage Placeholder { get; set; }
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

		[Wrap ("WeakDelegate")]
		IDMPhotoBrowserDelegate Delegate { get; set; }

		[NullAllowed, Export ("delegate", ArgumentSemantic.Assign)]
		NSObject WeakDelegate { get; set; }
	}

	[Model, Protocol, BaseType (typeof (NSObject))]
	interface IDMPhotoBrowserDelegate
	{
		[Export ("photoBrowser:didDismissAtPageIndex:")]
		void OnDismissed (IDMPhotoBrowser controller, nuint index);
	}
}