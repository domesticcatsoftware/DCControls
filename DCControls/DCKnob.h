//
//  DCKnob.h
//
//  Copyright 2011 Domestic Cat. All rights reserved.
//

#import "DCControl.h"

#define kDCKnobRatio (M_PI * ((360.0 - self.cutoutSize) / 360.0))

static inline CGFloat angleBetweenPoints(CGPoint first, CGPoint second)
{
	CGFloat height = second.y - first.y;
	CGFloat width = first.x - second.x;
	CGFloat rads = atan2(height, width);
	return rads;
}

@interface DCKnob : DCControl
{
	CGAffineTransform initialTransform;
	CGPoint lastPoint;
	CGFloat initialAngle;
}

@property BOOL biDirectional;					// default: NO
@property CGFloat arcStartAngle;				// default: 90 (degrees)
@property CGFloat cutoutSize;					// default: 60 (degrees)
@property CGFloat valueArcWidth;				// default: 15.0

@property CGFloat doubleTapValue;				// default: 0%
@property CGFloat tripleTapValue;				// default: 0%

/////////////////////////
// Init/Custom Setters //
/////////////////////////

- (id)initWithDelegate:(id)aDelegate;
- (void)setFrame:(CGRect)frame;

////////////////////
// Touch Handling //
////////////////////

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

////////////////////
// Helper Methods //
////////////////////

- (CGAffineTransform)initialTransform;
- (CGFloat)newValueFromTransform:(CGAffineTransform)transform;

@end
