//
//  ViewController.m
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) sliderValueChanged:(id)sender {
	if (sender == self.scaleSlider) {
		self.guillocheView.scale = self.scaleSlider.value;
	}
	else if (sender == self.stepsSlider) {
		self.guillocheView.steps = self.stepsSlider.value;
	}
	else if (sender == self.multiplierSlider) {
		self.guillocheView.multiplier = self.multiplierSlider.value;
	}
	else if (sender == self.majorRippleSlider) {
		self.guillocheView.majorRipple = self.majorRippleSlider.value;
	}
	else if (sender == self.minorRippleSlider) {
		self.guillocheView.minorRipple = self.minorRippleSlider.value;
	}
	else if (sender == self.radiusSlider) {
		self.guillocheView.radius = self.radiusSlider.value;
	}
	else if (sender == self.opacitySlider) {
		self.guillocheView.opacity = self.opacitySlider.value;
	}
	else if (sender == self.lineThicknessSlider) {
		self.guillocheView.lineThickness = self.lineThicknessSlider.value;
	}
}

@end
