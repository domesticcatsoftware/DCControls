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

@property (nonatomic, strong) DCSlider *slider;
@property (nonatomic, strong) IBOutlet UIView *sliderContainer;
@property (nonatomic, strong) IBOutlet UIScrollView *controlScrollView;
@property (nonatomic, strong) IBOutlet UILabel *backgroundAlphaLabel;
@property (nonatomic, strong) IBOutlet UILabel *widthLabel;
@property (nonatomic, strong) IBOutlet UISlider *widthSlider;
@property (nonatomic, strong) IBOutlet UILabel *heightLabel;
@property (nonatomic, strong) IBOutlet UISlider *heightSlider;
@property (nonatomic, strong) IBOutlet UILabel *handleSizeLabel;
@property (nonatomic, strong) IBOutlet UISlider *handleSizeSlider;
@property (nonatomic, strong) IBOutlet UISlider *sizeSlider;
@property (nonatomic, strong) IBOutlet UILabel *cornerRadiusLabel;
@property (nonatomic, strong) IBOutlet UILabel *fontSizeLabel;

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
