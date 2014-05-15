# Titanium Send image to Instagram App

## Description

With this module you can send images to instagram App
the image min size is 612px x 612px

The module is licensed under the MIT license.


## Quick Start

### Get it [![gitTio](http://gitt.io/badge.png)](http://gitt.io/component/it.scsoft.opentoinstagram)
Download the latest distribution ZIP-file and consult the [Titanium Documentation](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_a_Module) on how install it, or simply use the [gitTio CLI](http://gitt.io/cli):

`$ gittio install it.scsoft.opentoinstagram`


## Community Driven

I encourage everyone to send Pull Requests - keeping this module flying with new features.


## Author

**Samuele Coppede'**  
web: http://www.scsoft.it  
email: samuele@scsoft.it
twitter: @samuele81



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
        view:view, //This is the Main View Container
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





## License

	Titanium Port for the Library [MGInstagram](https://github.com/mglagola/MGInstagram) by mglagola
	
    Copyright (c) 2010-2014 Samuele Coppede

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
    


------------------------------