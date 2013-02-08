//
//  DCControl.h
//
//  Copyright 2011 Domestic Cat. All rights reserved.
//

#define	kDCControlIsPhone (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
#define kDCControlDegreesToRadians(x) (M_PI * (x) / 180.0)
#define kDCControlRadiansToDegrees(x) ((x) * 180.0 / M_PI)

@protocol DCControlDelegate <NSObject>

@required

- (void)controlValueDidChange:(float)value sender:(id)sender;

@end

@interface DCControl : UIView
{
}

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) UIColor *color;			// default: black
@property CGFloat backgroundColorAlpha;					// default: 0.3
@property (nonatomic, strong) UIColor *deselectedColor; // default: nil

@property (nonatomic, strong) UIFont *labelFont;		// default: bold, system, 12.5
@property (nonatomic, strong) UIColor *labelColor;		// default: use self.color
@property CGPoint labelOffset;							// default: CGPointZero

@property CGFloat min;									// default: 0.0
@property CGFloat max;									// default: 1.0
@property (nonatomic) CGFloat value;					// default: 0.0

@property BOOL displaysValue;							// default: YES
@property BOOL allowsGestures;							// default: YES

- (id)initWithDelegate:(id)aDelegate;

/////////////////////
// Drawing Methods //
/////////////////////

- (void)context:(CGContextRef)context addRoundedRect:(CGRect)rect cornerRadius:(float)cornerRadius;

@end
