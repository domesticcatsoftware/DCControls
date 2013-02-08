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

@property (nonatomic, strong) DCKnob *knob;
@property (nonatomic, strong) IBOutlet UIView *knobContainer;
@property (nonatomic, strong) IBOutlet UIScrollView *controlScrollView;
@property (nonatomic, strong) IBOutlet UILabel *doubleTapValueLabel;
@property (nonatomic, strong) IBOutlet UILabel *tripleTapValueLabel;
@property (nonatomic, strong) IBOutlet UILabel *ringBackgroundAlphaLabel;
@property (nonatomic, strong) IBOutlet UILabel *sizeLabel;
@property (nonatomic, strong) IBOutlet UISlider *sizeSlider;
@property (nonatomic, strong) IBOutlet UILabel *arcStartLabel;
@property (nonatomic, strong) IBOutlet UILabel *cutoutSizeLabel;
@property (nonatomic, strong) IBOutlet UILabel *ringWidthLabel;
@property (nonatomic, strong) IBOutlet UILabel *fontSizeLabel;
@property (nonatomic, strong) IBOutlet UILabel *labelOffsetXLabel;
@property (nonatomic, strong) IBOutlet UILabel *labelOffsetYLabel;

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
