Titanium Send image to Instagram App
------------------------------


With this module you can send images to instagram App
the image min size is 612px x 612px

# Example 

```javascript
var TiOpenToInstagram = require('it.scsoft.opentoinstagram');
var w = Ti.UI.createWindow({
   width:Ti.UI.FILL,
   height:Ti.UI.FILL,
   backgroundColor:'#FFF'
});

var view = Ti.UI.createView({
   width:Ti.UI.FILL,
   height:Ti.UI.FILL
});

var image = Ti.UI.createImageView({
    width:Ti.UI.FILL,
    height:Ti.UI.SIZE,
    image:"wheel.jpg"
});

image.addEventListener('click',function(){
    TiOpenToInstagram.postInstagramImage({
        image:image.toBlob(),
        view:view,
        caption:'Test description and #hashtag',
        error:function(e){
            alert('Error Instagram not installed or image error');
        }
    });
});
view.add(image);
w.add(view);
w.open();

```

* IOS Only
