//
//  DCSliderDemoViewController.h
//
//  Copyright 2011 Domestic Cat Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "DCSlider.h"

@interface DCSliderDemoViewController : UIViewController <DCControlDelegate>
{
	UILabel *cornerRadiusLabel;
	UILabel *heightLabel;
	UISlider *heightSlider;
	UILabel *handleSizeLabel;
	UISlider *handleSizeSlider;
	UISlider *widthSlider;
}

@property (nonatomic, retain) DCSlider *slider;
@property (nonatomic, retain) IBOutlet UIView *sliderContainer;
@property (nonatomic, retain) IBOutlet UIScrollView *controlScrollView;
@property (nonatomic, retain) IBOutlet UILabel *backgroundAlphaLabel;
@property (nonatomic, retain) IBOutlet UILabel *widthLabel;
@property (nonatomic, retain) IBOutlet UISlider *widthSlider;
@property (nonatomic, retain) IBOutlet UILabel *heightLabel;
@property (nonatomic, retain) IBOutlet UISlider *heightSlider;
@property (nonatomic, retain) IBOutlet UILabel *handleSizeLabel;
@property (nonatomic, retain) IBOutlet UISlider *handleSizeSlider;
@property (nonatomic, retain) IBOutlet UISlider *sizeSlider;
@property (nonatomic, retain) IBOutlet UILabel *cornerRadiusLabel;
@property (nonatomic, retain) IBOutlet UILabel *fontSizeLabel;

- (IBAction)horizontalDidChange:(id)sender;
- (IBAction)biDirectionalDidChange:(id)sender;
- (IBAction)colorDidChange:(id)sender;
- (IBAction)backgroundAlphaDidChange:(id)sender;
- (IBAction)widthDidChange:(id)sender;
- (IBAction)heightDidChange:(id)sender;
- (IBAction)handleSizeDidChange:(id)sender;
- (IBAction)cornerRadiusDidChange:(id)sender;
- (IBAction)displayValueChanged:(id)sender;
- (IBAction)labelTextSizeDidChange:(id)sender;
- (IBAction)labelTextColorDidChange:(id)sender;

@end
