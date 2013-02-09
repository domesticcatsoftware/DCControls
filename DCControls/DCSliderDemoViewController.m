//
//  DCSliderDemoViewController.m
//
//  Copyright 2011 Domestic Cat Software. All rights reserved.
//

#import "DCSliderDemoViewController.h"

@implementation DCSliderDemoViewController
@synthesize slider;
@synthesize sliderContainer;
@synthesize controlScrollView;
@synthesize backgroundAlphaLabel;
@synthesize widthLabel;
@synthesize widthSlider;
@synthesize heightLabel;
@synthesize heightSlider;
@synthesize handleSizeLabel;
@synthesize handleSizeSlider;
@synthesize sizeSlider;
@synthesize cornerRadiusLabel;
@synthesize fontSizeLabel;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.controlScrollView.contentSize = CGSizeMake(320.0, self.controlScrollView.frame.size.height);
	self.controlScrollView.frame = CGRectMake(0.0, self.sliderContainer.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.sliderContainer.frame.size.height);
	[self.view insertSubview:self.controlScrollView belowSubview:self.sliderContainer];

	self.sliderContainer.layer.shadowColor = [UIColor blackColor].CGColor;
	self.sliderContainer.layer.shadowOffset = CGSizeZero;
	self.sliderContainer.layer.shadowRadius = 9.0;
	self.sliderContainer.layer.shadowOpacity = 1.0;

	self.slider = [[DCSlider alloc] initWithDelegate:self];
	CGFloat initialsliderSize = 200.0;
	self.slider.frame = CGRectMake(floorf((self.sliderContainer.frame.size.width - 40.0) / 2),
								 floorf((self.sliderContainer.frame.size.height - initialsliderSize) / 2),
								 40.0,
								 initialsliderSize);
	self.slider.labelFont = [UIFont boldSystemFontOfSize:14.0];
	self.slider.labelColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	self.slider.color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
	self.slider.backgroundColor = self.sliderContainer.backgroundColor;
	self.slider.min = 50.0;
	self.slider.max = 100.0;
	self.slider.value = 0.0;
	self.slider.value = 33.0;
	self.slider.backgroundColorAlpha = 0.4;
	[self.sliderContainer addSubview:slider];
}

- (void)viewDidUnload
{
    [self setControlScrollView:nil];
	[self setSliderContainer:nil];
	[self setSlider:nil];

	[self setBackgroundAlphaLabel:nil];
	[self setWidthLabel:nil];
	[self setHeightLabel:nil];
	[self setFontSizeLabel:nil];
	[self setSizeSlider:nil];
	[self setCornerRadiusLabel:nil];
	[self setWidthSlider:nil];
	[self setHeightSlider:nil];
	[self setHandleSizeLabel:nil];
	[self setHandleSizeSlider:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)controlValueDidChange:(float)value sender:(id)sender
{
//	NSLog(@"Slider Value: %f", value);
}

#pragma Actions

- (IBAction)horizontalDidChange:(id)sender
{
	UISwitch *switchControl = (UISwitch *)sender;
	CGFloat newSize = (self.slider.isHorizontalSlider) ? self.slider.frame.size.width : self.slider.frame.size.height;
	self.slider.isHorizontalSlider = switchControl.on;

	if (self.slider.isHorizontalSlider)
	{
		self.slider.frame = CGRectMake(floorf((self.sliderContainer.frame.size.width - newSize) / 2),
									   floorf((self.sliderContainer.frame.size.height - 40.0) / 2),
									   newSize,
									   40.0);
	}
	else
	{
		self.slider.frame = CGRectMake(floorf((self.sliderContainer.frame.size.width - 40.0) / 2),
									   floorf((self.sliderContainer.frame.size.height - newSize) / 2),
									   40.0,
									   newSize);
	}

	self.widthSlider.value = self.slider.frame.size.width;
	self.heightSlider.value = self.slider.frame.size.height;
	self.widthLabel.text = [NSString stringWithFormat:@"Width: %.0f", self.slider.frame.size.width];
	self.heightLabel.text = [NSString stringWithFormat:@"Height: %.0f", self.slider.frame.size.height];
	[self.slider setNeedsDisplay];
}

- (IBAction)biDirectionalDidChange:(id)sender
{
	UISwitch *switchControl = (UISwitch *)sender;
	self.slider.biDirectional = switchControl.on;
	[self.slider setNeedsDisplay];
}

- (IBAction)colorDidChange:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	switch (segmentedControl.selectedSegmentIndex)
	{
		case 0: self.slider.color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; break;
		case 1: self.slider.color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]; break;
		case 2: self.slider.color = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0]; break;
		case 3: self.slider.color = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0]; break;
	}

	if (segmentedControl.selectedSegmentIndex == 0)
	{
		self.sliderContainer.backgroundColor = [UIColor whiteColor];
		self.slider.backgroundColor = [UIColor whiteColor];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
	}
	else
	{
		self.sliderContainer.backgroundColor = [UIColor blackColor];
		self.slider.backgroundColor = [UIColor blackColor];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
	}

	[self.slider setNeedsDisplay];
}

- (IBAction)backgroundAlphaDidChange:(id)sender
{
	UISlider *sliderControl = (UISlider *)sender;
	self.slider.backgroundColorAlpha = sliderControl.value;
	[self.slider setNeedsDisplay];

	self.backgroundAlphaLabel.text = [NSString stringWithFormat:@"Background Alpha: %.2f", sliderControl.value];
}

- (IBAction)widthDidChange:(id)sender
{
	UISlider *sliderControl = (UISlider *)sender;
	CGRect sliderFrame = self.slider.frame;
	sliderFrame.size.width = floorf(sliderControl.value);
	sliderFrame.origin.x = floorf((self.sliderContainer.frame.size.width - sliderFrame.size.width) / 2.0);
	self.slider.frame = sliderFrame;
	[self.slider setNeedsDisplay];

	self.widthLabel.text = [NSString stringWithFormat:@"Width: %.0f", self.slider.frame.size.width];
	self.heightLabel.text = [NSString stringWithFormat:@"Height: %.0f", self.slider.frame.size.height];
	self.handleSizeLabel.text = [NSString stringWithFormat:@"Handle Size: %.0f", self.slider.handleSize];
	self.handleSizeSlider.value = self.slider.handleSize;
}

- (IBAction)heightDidChange:(id)sender
{
	UISlider *sliderControl = (UISlider *)sender;
	CGRect sliderFrame = self.slider.frame;
	sliderFrame.size.height = floorf(sliderControl.value);
	sliderFrame.origin.y = floorf((self.sliderContainer.frame.size.height - sliderFrame.size.height) / 2.0);
	self.slider.frame = sliderFrame;
	[self.slider setNeedsDisplay];

	self.widthLabel.text = [NSString stringWithFormat:@"Width: %.0f", self.slider.frame.size.width];
	self.heightLabel.text = [NSString stringWithFormat:@"Height: %.0f", self.slider.frame.size.height];
	self.handleSizeLabel.text = [NSString stringWithFormat:@"Handle Size: %.0f", self.slider.handleSize];
	self.handleSizeSlider.value = self.slider.handleSize;
}

- (IBAction)handleSizeDidChange:(id)sender
{
	UISlider *sliderControl = (UISlider *)sender;
	self.slider.handleSize = floorf(sliderControl.value);
	[self.slider setNeedsDisplay];

	self.handleSizeLabel.text = [NSString stringWithFormat:@"Handle Size: %.0f", self.slider.handleSize];
}

- (IBAction)cornerRadiusDidChange:(id)sender
{
	UISlider *sliderControl = (UISlider *)sender;
	self.slider.cornerRadius = floorf(sliderControl.value);
	[self.slider setNeedsDisplay];

	self.cornerRadiusLabel.text = [NSString stringWithFormat:@"Corner Radius: %.0f", self.slider.cornerRadius];
}

- (IBAction)displayValueChanged:(id)sender
{
	UISwitch *switchControl = (UISwitch *)sender;
	self.slider.displaysValue = switchControl.on;
	[self.slider setNeedsDisplay];
}

- (IBAction)labelTextSizeDidChange:(id)sender
{
	UISlider *sliderControl = (UISlider *)sender;
	self.slider.labelFont = [UIFont boldSystemFontOfSize:sliderControl.value];
	[self.slider setNeedsDisplay];

	self.fontSizeLabel.text = [NSString stringWithFormat:@"Font Size: %.1f", sliderControl.value];
}

- (IBAction)labelTextColorDidChange:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	switch (segmentedControl.selectedSegmentIndex)
	{
		case 0: self.slider.labelColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]; break;
		case 1: self.slider.labelColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; break;
	}

	[self.slider setNeedsDisplay];
}

@end
