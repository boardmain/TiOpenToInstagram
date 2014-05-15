/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ItScsoftOpentoinstagramModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiApp.h"
#import "TiUtils.h"
#import "TiViewProxy.h"
#import "MGInstagram.h"

@implementation ItScsoftOpentoinstagramModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"09017ace-a67f-441f-8ebf-0f45b19a8120";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"it.scsoft.opentoinstagram";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}


#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}


#pragma Public APIs

- (void) postInstagramImage:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    TiBlob *blob = [args objectForKey:@"image"];
    UIImage *image = [[UIImage alloc] initWithData:[blob data]];
    TiViewProxy *viewProxy = [args objectForKey:@"view"];
    NSString *caption = [TiUtils stringValue:@"caption" properties:args def:@""];
    KrollCallback *errorCallback = [args objectForKey:@"error"];

    if(image == nil){
        if(errorCallback){
            [self _fireEventToListener:@"error" withObject:nil listener:errorCallback thisObject:nil];
        }
    }else{
        if ([MGInstagram isAppInstalled] && [MGInstagram isImageCorrectSize:image]){
//            [MGInstagram postImage:image withCaption:caption inView:viewProxy.view];
            TiThreadPerformOnMainThread(^(void){
                 [MGInstagram postImage:image withCaption:caption inView:viewProxy.view];
            }, NO);

        }else{
            if(errorCallback && [self _hasListeners:@"error"]){
                [self _fireEventToListener:@"error" withObject:nil listener:errorCallback thisObject:nil];
            }
        }
    }
    
    
    
    
}

@end
