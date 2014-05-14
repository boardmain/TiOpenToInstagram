// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
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