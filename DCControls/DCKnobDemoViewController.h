//
//  DCKnobDemoViewController.h
//
//  Copyright 2011 Domestic Cat Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "DCKnob.h"

@interface DCKnobDemoViewController : UIViewController <DCControlDelegate>
{
}

@property (nonatomic, retain) DCKnob *knob;
@property (nonatomic, retain) IBOutlet UIView *knobContainer;
@property (nonatomic, retain) IBOutlet UIScrollView *controlScrollView;
@property (nonatomic, retain) IBOutlet UILabel *doubleTapValueLabel;
@property (nonatomic, retain) IBOutlet UILabel *tripleTapValueLabel;
@property (nonatomic, retain) IBOutlet UILabel *ringBackgroundAlphaLabel;
@property (nonatomic, retain) IBOutlet UILabel *sizeLabel;
@property (nonatomic, retain) IBOutlet UISlider *sizeSlider;
@property (nonatomic, retain) IBOutlet UILabel *arcStartLabel;
@property (nonatomic, retain) IBOutlet UILabel *cutoutSizeLabel;
@property (nonatomic, retain) IBOutlet UILabel *ringWidthLabel;
@property (nonatomic, retain) IBOutlet UILabel *fontSizeLabel;
@property (nonatomic, retain) IBOutlet UILabel *labelOffsetXLabel;
@property (nonatomic, retain) IBOutlet UILabel *labelOffsetYLabel;

- (IBAction)biDirectionalDidChange:(id)sender;
- (IBAction)doubleTapValueDidChange:(id)sender;
- (IBAction)tripleTapValueDidChange:(id)sender;
- (IBAction)colorDidChange:(id)sender;
- (IBAction)ringBackgroundAlphaDidChange:(id)sender;
- (IBAction)sizeDidChange:(id)sender;
- (IBAction)arcStartDidChange:(id)sender;
- (IBAction)cutoutSizeDidChange:(id)sender;
- (IBAction)ringWidthDidChange:(id)sender;
- (IBAction)displayValueChanged:(id)sender;
- (IBAction)labelTextSizeDidChange:(id)sender;
- (IBAction)labelTextColorDidChange:(id)sender;
- (IBAction)labelOffsetXDidChange:(id)sender;
- (IBAction)labelOffsetYDidChange:(id)sender;

@end
