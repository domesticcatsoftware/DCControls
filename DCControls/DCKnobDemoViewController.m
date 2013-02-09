//
//  DCKnobDemoViewController.m
//
//  Copyright 2011 Domestic Cat Software. All rights reserved.
//

#import "DCKnobDemoViewController.h"

@implementation DCKnobDemoViewController
@synthesize knob;
@synthesize knobContainer;
@synthesize controlScrollView;
@synthesize doubleTapValueLabel;
@synthesize tripleTapValueLabel;
@synthesize ringBackgroundAlphaLabel;
@synthesize sizeLabel;
@synthesize sizeSlider;
@synthesize arcStartLabel;
@synthesize cutoutSizeLabel;
@synthesize ringWidthLabel;
@synthesize fontSizeLabel;
@synthesize labelOffsetXLabel;
@synthesize labelOffsetYLabel;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.controlScrollView.contentSize = CGSizeMake(320.0, self.controlScrollView.frame.size.height);
	self.controlScrollView.frame = CGRectMake(0.0, self.knobContainer.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.knobContainer.frame.size.height);
	[self.view insertSubview:self.controlScrollView belowSubview:self.knobContainer];

	self.knobContainer.layer.shadowColor = [UIColor blackColor].CGColor;
	self.knobContainer.layer.shadowOffset = CGSizeZero;
	self.knobContainer.layer.shadowRadius = 9.0;
	self.knobContainer.layer.shadowOpacity = 1.0;

	self.knob = [[DCKnob alloc] initWithDelegate:self];
	CGFloat initialKnobSize = 100.0;
	self.knob.frame = CGRectMake(floorf((self.knobContainer.frame.size.width - initialKnobSize) / 2),
								 floorf((self.knobContainer.frame.size.height - initialKnobSize) / 2),
								 initialKnobSize,
								 initialKnobSize);
	self.knob.labelFont = [UIFont boldSystemFontOfSize:16.0];
	self.knob.color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
	self.knob.backgroundColor = self.knobContainer.backgroundColor;
	self.knob.min = 10.0;
	self.knob.max = 11.0;
	self.knob.doubleTapValue = 50.0;
	self.knob.tripleTapValue = 100.0;
	self.knob.value = 0.0;
	self.knob.value = 10.5;
	[self.knobContainer addSubview:knob];
}

- (void)viewDidUnload
{
    [self setControlScrollView:nil];
	[self setKnobContainer:nil];
	[self setKnob:nil];

	[self setRingBackgroundAlphaLabel:nil];
	[self setSizeLabel:nil];
	[self setCutoutSizeLabel:nil];
	[self setRingWidthLabel:nil];
	[self setFontSizeLabel:nil];
	[self setLabelOffsetXLabel:nil];
	[self setLabelOffsetYLabel:nil];
	[self setArcStartLabel:nil];
	[self setSizeSlider:nil];
	[self setDoubleTapValueLabel:nil];
	[self setTripleTapValueLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)controlValueDidChange:(float)value sender:(id)sender
{
//	NSLog(@"Knob Value: %f", value);
}

#pragma Actions

- (IBAction)biDirectionalDidChange:(id)sender
{
	UISwitch *switchControl = (UISwitch *)sender;
	self.knob.biDirectional = switchControl.on;
	[self.knob setNeedsDisplay];
}

- (IBAction)doubleTapValueDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.doubleTapValue = slider.value;
	self.doubleTapValueLabel.text = [NSString stringWithFormat:@"Double Tap Value: %.0f%%", slider.value];
}

- (IBAction)tripleTapValueDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.tripleTapValue = slider.value;
	self.tripleTapValueLabel.text = [NSString stringWithFormat:@"Triple Tap Value: %.0f%%", slider.value];
}

- (IBAction)colorDidChange:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	switch (segmentedControl.selectedSegmentIndex)
	{
		case 0: self.knob.color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; break;
		case 1: self.knob.color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]; break;
		case 2: self.knob.color = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0]; break;
		case 3: self.knob.color = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0]; break;
	}

	if (segmentedControl.selectedSegmentIndex == 0)
	{
		self.knobContainer.backgroundColor = [UIColor whiteColor];
		self.knob.backgroundColor = [UIColor whiteColor];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
	}
	else
	{
		self.knobContainer.backgroundColor = [UIColor blackColor];
		self.knob.backgroundColor = [UIColor blackColor];
		[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
	}

	[self.knob setNeedsDisplay];
}

- (IBAction)ringBackgroundAlphaDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.backgroundColorAlpha = slider.value;
	[self.knob setNeedsDisplay];

	self.ringBackgroundAlphaLabel.text = [NSString stringWithFormat:@"Ring Background Alpha: %.2f", slider.value];
}

- (IBAction)sizeDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	CGFloat newSize = floorf(slider.value);
	self.knob.frame = CGRectMake(floorf((self.knobContainer.frame.size.width - newSize) / 2),
								 floorf((self.knobContainer.frame.size.height - newSize) / 2),
								 newSize,
								 newSize);
	[self.knob setNeedsDisplay];
	
	self.sizeLabel.text = [NSString stringWithFormat:@"Size: %.0f x %.0f", slider.value, slider.value];
}

- (IBAction)arcStartDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.arcStartAngle = slider.value;
	[self.knob setNeedsDisplay];

	self.arcStartLabel.text = [NSString stringWithFormat:@"Arc Start Angle: %.0f°", slider.value];
}

- (IBAction)cutoutSizeDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.cutoutSize = slider.value;
	[self.knob setNeedsDisplay];
	
	self.cutoutSizeLabel.text = [NSString stringWithFormat:@"Cutout Size: %.0f°", slider.value];
}

- (IBAction)ringWidthDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.valueArcWidth = slider.value;
	[self.knob setNeedsDisplay];
	
	self.ringWidthLabel.text = [NSString stringWithFormat:@"Arc Width: %.2f", self.knob.valueArcWidth];
}

- (IBAction)displayValueChanged:(id)sender
{
	UISwitch *switchControl = (UISwitch *)sender;
	self.knob.displaysValue = switchControl.on;
	[self.knob setNeedsDisplay];
}

- (IBAction)labelTextSizeDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.labelFont = [UIFont boldSystemFontOfSize:slider.value];
	[self.knob setNeedsDisplay];
	
	self.fontSizeLabel.text = [NSString stringWithFormat:@"Font Size: %.1f", slider.value];
}

- (IBAction)labelTextColorDidChange:(id)sender
{
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	switch (segmentedControl.selectedSegmentIndex)
	{
		case 1: self.knob.labelColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]; break;
		case 2: self.knob.labelColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]; break;
		default: self.knob.labelColor = nil; break;
	}

	[self.knob setNeedsDisplay];
}

- (IBAction)labelOffsetXDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.labelOffset = CGPointMake(slider.value, self.knob.labelOffset.y);
	[self.knob setNeedsDisplay];
	
	self.labelOffsetXLabel.text = [NSString stringWithFormat:@"Label Offset X: %.0f", slider.value];
}

- (IBAction)labelOffsetYDidChange:(id)sender
{
	UISlider *slider = (UISlider *)sender;
	self.knob.labelOffset = CGPointMake(self.knob.labelOffset.x, slider.value);
	[self.knob setNeedsDisplay];

	self.labelOffsetYLabel.text = [NSString stringWithFormat:@"Label Offset Y: %.0f", slider.value];
}

@end
