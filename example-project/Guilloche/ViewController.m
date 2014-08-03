//
//  ViewController.m
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) fullScreenGuillocheView:(id)sender;

@end

@implementation ViewController

bool guillocheIsFullScreen = false;

- (void)viewDidLoad {
    [super viewDidLoad];
	UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fullScreenGuillocheView:)];
	[self.guillocheView addGestureRecognizer:singleTapGestureRecognizer];
	// Init Slider Labels
	self.scaleSliderLabel.text = [NSString stringWithFormat:@"Scale: %f", self.scaleSlider.value];
	self.stepsSliderLabel.text = [NSString stringWithFormat:@"Steps: %f", self.stepsSlider.value];
	self.multiplierSliderLabel.text = [NSString stringWithFormat:@"Multiplier: %f", self.multiplierSlider.value];
	self.majorRippleSliderLabel.text = [NSString stringWithFormat:@"Major: %f", self.majorRippleSlider.value];
	self.minorRippleSliderLabel.text = [NSString stringWithFormat:@"Minor: %f", self.minorRippleSlider.value];
	self.radiusSliderLabel.text = [NSString stringWithFormat:@"Radius: %f", self.radiusSlider.value];
	self.opacitySliderLabel.text = [NSString stringWithFormat:@"Opacity: %f", self.opacitySlider.value];
	self.lineThicknessSliderLabel.text = [NSString stringWithFormat:@"Thickness: %f", self.lineThicknessSlider.value];
}

- (void) fullScreenGuillocheView:(id)sender {
	if (guillocheIsFullScreen) {
		self.controlsView.hidden = NO;
		self.guillocheView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.controlsView.frame.origin.y);
	}
	else {
		self.controlsView.hidden = YES;
		self.guillocheView.frame = self.view.frame;
	}
	[self.guillocheView setNeedsDisplay];
	guillocheIsFullScreen = !guillocheIsFullScreen;
}

- (void) sliderValueChanged:(id)sender {
	if (sender == self.scaleSlider) {
		self.guillocheView.scale = self.scaleSlider.value;
		self.scaleSliderLabel.text = [NSString stringWithFormat:@"Scale: %f", self.scaleSlider.value];
	}
	else if (sender == self.stepsSlider) {
		self.guillocheView.steps = self.stepsSlider.value;
		self.stepsSliderLabel.text = [NSString stringWithFormat:@"Steps: %f", self.stepsSlider.value];
	}
	else if (sender == self.multiplierSlider) {
		self.guillocheView.multiplier = self.multiplierSlider.value;
		self.multiplierSliderLabel.text = [NSString stringWithFormat:@"Multiplier: %f", self.multiplierSlider.value];
	}
	else if (sender == self.majorRippleSlider) {
		self.guillocheView.majorRipple = self.majorRippleSlider.value;
		self.majorRippleSliderLabel.text = [NSString stringWithFormat:@"Major: %f", self.majorRippleSlider.value];
	}
	else if (sender == self.minorRippleSlider) {
		self.guillocheView.minorRipple = self.minorRippleSlider.value;
		self.minorRippleSliderLabel.text = [NSString stringWithFormat:@"Minor: %f", self.minorRippleSlider.value];
	}
	else if (sender == self.radiusSlider) {
		self.guillocheView.radius = self.radiusSlider.value;
		self.radiusSliderLabel.text = [NSString stringWithFormat:@"Radius: %f", self.radiusSlider.value];
	}
	else if (sender == self.opacitySlider) {
		self.guillocheView.opacity = self.opacitySlider.value;
		self.opacitySliderLabel.text = [NSString stringWithFormat:@"Opacity: %f", self.opacitySlider.value];
	}
	else if (sender == self.lineThicknessSlider) {
		self.guillocheView.lineThickness = self.lineThicknessSlider.value;
		self.lineThicknessSliderLabel.text = [NSString stringWithFormat:@"Thickness: %f", self.lineThicknessSlider.value];
	}
}

@end
