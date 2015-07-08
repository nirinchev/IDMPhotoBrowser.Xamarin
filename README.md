# IDMPhotoBrowser.Xamarin
Xamarin Bindings for https://github.com/ideaismobile/IDMPhotoBrowser

The binding is fairly incomplete as we don't need heavy customizations. Sample usage:

```
var photo1 = new IDMPhoto (new NSUrl ("http://example.com/photo1.jpg"))
{
  Caption = "Amazing photo"
};

var photo2 = new IDMPhoto (new NSUrl ("http://example.com/photo2.jpg"))
{
  Caption = "My cat"
};

var browser = new IDMPhotoBrowser (new[] { photo1, photo2});
// Alternatively:
// var browser = new IDMPhotoBrowser (new[] { photo1, photo2 }, myImageView);

browser.DisplayToolbar = false;
browser.UsePopAnimation = true;

this.PresentViewController (browser, true, null);
```
