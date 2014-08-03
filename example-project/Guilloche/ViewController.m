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
