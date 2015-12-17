//
//  Defines.h
//  demoDynamicView
//
//  Created by KhiemND on 12/16/15.
//  Copyright © 2015 KhiemND. All rights reserved.
//



typedef NS_ENUM(int, TYPE_CONTROL) {
    BOOLEAN = 0,
    INTEGER,
    DOUBLE,
    TEXT
};


#if __has_feature(objc_arc)
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
+ (classname *)shared##classname\
{\
static classname *shared##classname = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##classname = [[classname alloc] init];\
});\
return shared##classname;\
}
#else
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
static classname *shared##classname = nil; \
+ (void)cleanupFromTerminate \
{ \
classname *temp = shared##classname; \
shared##classname = nil; \
[temp dealloc]; \
} \
+ (void)registerForCleanup \
{ \
[[NSNotificationCenter defaultCenter] addObserver:self \
selector:@selector(cleanupFromTerminate) \
name:UIApplicationWillTerminateNotification \
object:nil]; \
} \
+ (classname *)shared##classname \
{ \
static dispatch_once_t p; \
dispatch_once(&p, \
^{ \
if (shared##classname == nil) \
{ \
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; \
shared##classname = [[self alloc] init]; \
[self registerForCleanup]; \
[pool drain]; \
} \
}); \
return shared##classname; \
} \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t p; \
__block classname* temp = nil; \
dispatch_once(&p, \
^{ \
if (shared##classname == nil) \
{ \
temp = shared##classname = [super allocWithZone:zone]; \
} \
}); \
return temp; \
} \
- (id)copyWithZone:(NSZone *)zone { return self; } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return NSUIntegerMax; } \
- (oneway void)release { } \
- (id)autorelease { return self; }
#endif

/**
 * sharedInstance method
 */
#if __has_feature(objc_arc)
#define SYNTHESIZE_SINGLETON_INSTANCE_FOR_CLASS(classname) \
+ (classname *)sharedInstance\
{\
static classname *shared##classname = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##classname = [[classname alloc] init];\
});\
return shared##classname;\
}
#else
#define SYNTHESIZE_SINGLETON_INSTANCE_FOR_CLASS(classname) \
static classname *sharedInstance = nil; \
+ (void)cleanupFromTerminate \
{ \
classname *temp = shared##classname; \
sharedInstance = nil; \
[temp dealloc]; \
} \
+ (void)registerForCleanup \
{ \
[[NSNotificationCenter defaultCenter] addObserver:self \
selector:@selector(cleanupFromTerminate) \
name:UIApplicationWillTerminateNotification \
object:nil]; \
} \
+ (classname *)sharedInstance \
{ \
static dispatch_once_t p; \
dispatch_once(&p, \
^{ \
if (sharedInstance == nil) \
{ \
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; \
sharedInstance = [[self alloc] init]; \
[self registerForCleanup]; \
[pool drain]; \
} \
}); \
return sharedInstance; \
} \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t p; \
__block classname* temp = nil; \
dispatch_once(&p, \
^{ \
if (sharedInstance == nil) \
{ \
temp = sharedInstance = [super allocWithZone:zone]; \
} \
}); \
return temp; \
} \
- (id)copyWithZone:(NSZone *)zone { return self; } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return NSUIntegerMax; } \
- (oneway void)release { } \
- (id)autorelease { return self; }
#endif
