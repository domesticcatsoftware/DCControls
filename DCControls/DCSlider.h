//
//  DCSlider.h
//
//  Copyright 2011 Domestic Cat. All rights reserved.
//

#import "DCControl.h"

@interface DCSlider : DCControl
{
	CGFloat touchHandleOffset;
}

@property CGFloat handleSize;				// default: longest side / 6 (minimum of 35.0)
@property CGFloat cornerRadius;				// default: 3.0
@property BOOL isHorizontalSlider;			// default: NO
@property BOOL biDirectional;				// default: NO

/////////////////////////
// Init/Custom Setters //
/////////////////////////

- (id)initWithDelegate:(id)aDelegate;

////////////////////
// Touch Handling //
////////////////////

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

////////////////////////
// Handle Positioning //
////////////////////////

- (CGRect)rectForHandle;

@end
