#iOS Coding Guidelines

##General Coding Guidelines

###Dotted Notation

You should **only** use the dotted notation when you’re dealing with properties.

```objc
self.prop = [[NSObject alloc] init];
_ivar = [[NSObject alloc] init];
[self methodWithoutParam];
```

###Code Casing

####Methods
Methods **always** start with lower case and should be camel cased.
```objc
[self methodWithoutParam];
- (void)methodwithParam:(id)param secondParam:(id)param;
```

####Classes
Classes **always** start with upper case and should be camel cased.
```objc
PersonObject *person;
@implementation HomeViewController
```

####Types
Types **always** start with upper case and should be camel cased.
```objc
typedef NSString *String;
```

####Variables
Variables **always** start with lower case and should be camel cased.
```objc
float currentScaleFactor;
NSString *subString;
```

####Macros
Macros are **always** upper case and words should be separated by an underscore.
```objc
#define MAX(x, y) x > y ? x : y
```

####Constants
Constants are **always** upper case and words should be separated by an underscore.
```objc
static const NSInteger NUM_THREADS = 4;
```

####Enumerations
Enumerations values **always** start with upper case, they are camel cased and prefixed with the type name.
```objc
typedef NS_ENUM(NSUInteger, Priority) {
    PriorityLow = 1,
    PriorityMedium,
    PriorityHigh
};
```

###Indentation
Indentation in code should **never** be tabs, and always **four spaces**.

###Brackets
Opening brackets should be placed on the **same line**, with a leading space.
Closing brackets should be on a **new line** with the same indent as the start of the scope.
```objc
- (void)methodWithoutParam {
    if ([a isEqual:b]) {

    }
} 
```

###White lines
As a general rule you should never have more that 1 white line in your classes.
For an example of white lines in your code take a look at the [Example Class](#example-class) section.

###Initialisation
To avoid that your class is not correctly initialise you should create a method that will setup your object and call the method in all the entry point of your class.
For example in UIViewController you should always call your setup method in the init method and the awakeFromNib method. As they are both entry points to initialising your class.
The naming convention for this setup method is **_setupClassName**. e.g.
```objc
- (id)init {
    self = [super init];
    if (self) {
        [self _setupClassName];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self _setupClassName];
}

- (void)_setupClassName {
    ...;
}
```

###Project structure
We prefer that you create folders for each group you create in Xcode/AppCode. (AppCode will do this for you)
```
📁 Model
    📁 Core Data
        📄 xcdatamodel
        📄 NSManagedObject*
        📁 Adaptor
            📄 NSManagedObject subclass Adaptor categories*
        📁 Transient
            📄 NSManagedObject subclass Transient categories*
    📄 Other model classes*
📁 View
    📁 Theme
    📁 TableView
        📁 Header
        📁 Cell
        📁 Footer
    📁 CollectionView
        📁 Header
        📁 Cell
        📁 Footer
        📁 Supplementary
    📁 Custom Control
    📁 Custom View
        📄 UIView subclasses*
📁 Controller
    📄 UIViewControllers*
📁 Categories
    📁 UIKit
    📁 Foundation
📁 Assets
    📄 storyboards*
    📄 xibs*
    📄 xcasset
📁 Services
    📄 services*
    📁 Remote
        📄 protocols
        📁 REST (Group named after implementation) 


* If your project is large you should divide these files into sub groups
```


##Class
###.h
The header file should be empty or very limited, only public properties, public methods and public adaptation of protocols should be in this file.
This means that you only move declarations to the header file if there is no other solution.

Protected properties and methods should be provide through a category on your class to the subclasses.
This category should be called **“ClassName+ForSubclassesOnly”** and only a subclass of that class should import the header of this category.

Imports should only be done for the Super class and for adopted protocols. All other references to protocols or classes should not be imported. These should be reference thru forward declaration. e.g.
```objc
@class SomeClass
@protocol SomeProtocol
```

###.m
####Private Members
Private ivars, properties and privately adopted protocols are declared in the class extension. We **prefer** the use of **ivars over properties**. All private members should start with an underscore. This also includes methods. 

If you do want to use properties you should synthesize your properties as **_propertyName**. e.g.
```objc
@synthesize _propertyName = _propertyName;
```
####Pragma Marks
Pragma marks are **always** with a dash and you insert one per protocol adoption.

Other pragma mark are Actions and Accessors.
```objc
#pragma mark - Object lifecycle
	-init;
	-dealloc;
#pragma mark - View lifecycle //Only UIViewControllers
	-viewWillAppear;
	-viewDidAppear;
#pragma mark - Actions
	-didTapButton;
#pragma mark - Accessors
	-setProperty;
	-getProperty;
```

###Example Class
####.h
```objc
#import <NSFoundation/NSFoundation.h>
#import "ProtocolA.h"
#import "ProtocolB.h"

@class ObjectX;
@protocol ProtocolC; 

typedef NSString *(^BlockName)(NSString *str);
typedef id<Proto> (^BlockName)(NSString *str);
typedef id (^BlockName)(NSString *str);

typedef NS_ENUM(NSUInteger, Priority) {
    PriorityLow = 1,
    PriorityMedium,
    PriorityHigh
};

@interface ClassName : NSObject <ProtocolA, ProtocolB>

@property(nonatomic, strong) ObjectX<ProtocolC> *instanceX;

/**
 * Appledoc comments are preceded by a white line
 */
@property(nonatomic, strong) ObjectX<ProtocolC> *instanceY; 

+ (NSString *)stringForX:(NSObject *)x withY:(NSObject *)y;
+ ...

- (NSObject *)objectX:(NSObject *)x;
- ...

@end
```
####.m
```objc
//imports

//typedefs, enums

@interface ClassName() <CustomObjectDelegate, ...> {
    NSString *_ivarName;
    NSObject *_other;
    id<Foo, Bar> _aOther;
    id<Foo> _xxx;
    NSObject<Bar> *_bOther;
}

@property(nonatomic, weak) NSStream *_stream;

@end

@implementation ClassName

@synthesize _stream = _stream;

#pragma mark - Object lifecycle
- (id)init {
    self = [super init];
    if (self) {
        [self _setupClassName];
    }
    return self;
}

- (void)dealloc {

}

- (void)_setupClassName {

}

#pragma mark - CustomObject delegate

+ (NSString *)stringForX:(NSObject *)x withY:(NSObject *)y {

}

+ (void)foo {
    id<Proto> (^varID)() = ^id<Proto>() {
    
    };
    NSString *aString = @"";
    id idVar = nil;
    int x = 1 + 2 + (5 + 8);
}

- (NSObject *)objectX:(NSObject *)x {
    if ([x isEqual:x]) {    
        if (x != _other) {
            [self foo];
        }
    } else {
        NSLog("%@",[self stringForX:x withY:_other]);
    }
    return x;
}

@end
```

##Categories
Categories are **always** in a separate header and implementation file.

For utilities the naming convention is **ClassName+Util.h**.

For Theming of UIKit (UIColor/UIFont) the naming convention is **UIColor+ProjectNameTheme**.

##Protocols
Protocols may be defined in the file where they are referred.

```objc
#import <NSFoundation/NSFoundation.h>
#import "ProtoB.h"

@class ClassX;
@protocol ProtoC;

@protocol ProtocolA <NSObject, ProtoB>
- (id)method:(ClassX<ProtoC>)x;

@optional
- (id)methodB;

@end
```

##DRYFramework
If you notice code that is reusable for other projects internal or in open sources projects by people outside of AppFoundry you should add this to the AppFoundry Framework code.

All Framework code **always** has the **prefix DRY** so Classnames, type names, protocol names,… always start with DRY.
Normal coding conventions still apply, so for example, **methods** will begin with **dry is stead of DRY**.

```objc
@protocol DRYClassName
- (void)dryMethodWithoutParms;
```


