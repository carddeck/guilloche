//
//  ViewController.m
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//

#import "ViewController.h"
#import "ZCSHoldProgress.h"
#import <QuartzCore/QuartzCore.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()

@property (strong, nonatomic) UIView *whiteScreen;

- (void)saveToLibrary:(UIGestureRecognizer *)gestureRecognizer;
- (void)fullScreenGuillocheView:(id)sender;
- (void)flashScreen;

@end

@implementation ViewController

bool guillocheIsFullScreen = false;

- (void)viewDidLoad {
	[super viewDidLoad];
	ZCSHoldProgress *longPressGestureRecognizer = [[ZCSHoldProgress alloc] initWithTarget:self action:@selector(saveToLibrary:)];
	longPressGestureRecognizer.minimumPressDuration = 1.0f;
	[self.guillocheView addGestureRecognizer:longPressGestureRecognizer];
	UITapGestureRecognizer *singleTapGestureRecognizer =
		[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fullScreenGuillocheView:)];
	[singleTapGestureRecognizer requireGestureRecognizerToFail:longPressGestureRecognizer];
	[self.guillocheView addGestureRecognizer:singleTapGestureRecognizer];
	self.whiteScreen = [[UIView alloc] initWithFrame:self.view.frame];
	self.whiteScreen.layer.opacity = 0.0f;
	self.whiteScreen.layer.backgroundColor = [[UIColor whiteColor] CGColor];
	[self.view addSubview:self.whiteScreen];
	// Init Slider Labels
	self.scaleSliderLabel.text = [NSString stringWithFormat:@"Scale: %f", self.scaleSlider.value];
	self.stepsSliderLabel.text = [NSString stringWithFormat:@"Steps: %f", self.stepsSlider.value];
	self.multiplierSliderLabel.text = [NSString stringWithFormat:@"Multiplier: %f", self.multiplierSlider.value];
	self.majorRippleSliderLabel.text = [NSString stringWithFormat:@"Major: %f", self.majorRippleSlider.value];
	self.minorRippleSliderLabel.text = [NSString stringWithFormat:@"Minor: %f", self.minorRippleSlider.value];
	self.radiusSliderLabel.text = [NSString stringWithFormat:@"Radius: %f", self.radiusSlider.value];
	self.opacitySliderLabel.text = [NSString stringWithFormat:@"Opacity: %f", self.opacitySlider.value];
	self.lineThicknessSliderLabel.text = [NSString stringWithFormat:@"Thickness: %f", self.lineThicknessSlider.value];

	self.guillocheView.lineColors = @[ [UIColor blackColor] ];
}

- (void)saveToLibrary:(UIGestureRecognizer *)gestureRecognizer {
	if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
			UIGraphicsBeginImageContextWithOptions(self.guillocheView.bounds.size, NO, [UIScreen mainScreen].scale);
		else
			UIGraphicsBeginImageContext(self.guillocheView.bounds.size);
		[self.guillocheView.layer renderInContext:UIGraphicsGetCurrentContext()];
		UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];

		[library writeImageToSavedPhotosAlbum:[image CGImage]
					  orientation:(ALAssetOrientation)[image imageOrientation]
				      completionBlock:^(NSURL *assetURL, NSError *error) {
					      if (error) {
						      // TODO: error handling
					      } else {
						      // TODO: success handling
						      [self flashScreen];
					      }
				      }];
	}
}

- (void)fullScreenGuillocheView:(id)sender {
	if (guillocheIsFullScreen) {
		self.controlsView.hidden = NO;
		self.guillocheView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.controlsView.frame.origin.y);
	} else {
		self.controlsView.hidden = YES;
		self.guillocheView.frame = self.view.frame;
	}
	[self.guillocheView setNeedsDisplay];
	guillocheIsFullScreen = !guillocheIsFullScreen;
}

- (void)flashScreen {
	CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
	NSArray *animationValues = @[ @0.8f, @0.0f ];
	NSArray *animationTimes = @[ @0.3f, @1.0f ];
	id timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	NSArray *animationTimingFunctions = @[ timingFunction, timingFunction ];
	[opacityAnimation setValues:animationValues];
	[opacityAnimation setKeyTimes:animationTimes];
	[opacityAnimation setTimingFunctions:animationTimingFunctions];
	opacityAnimation.fillMode = kCAFillModeForwards;
	opacityAnimation.removedOnCompletion = YES;
	opacityAnimation.duration = 0.4;

	[self.whiteScreen.layer addAnimation:opacityAnimation forKey:@"animation"];
}

- (void)sliderValueChanged:(id)sender {
	if (sender == self.scaleSlider) {
		self.guillocheView.scale = self.scaleSlider.value;
		self.scaleSliderLabel.text = [NSString stringWithFormat:@"Scale: %f", self.scaleSlider.value];
	} else if (sender == self.stepsSlider) {
		self.guillocheView.steps = self.stepsSlider.value;
		self.stepsSliderLabel.text = [NSString stringWithFormat:@"Steps: %f", self.stepsSlider.value];
	} else if (sender == self.multiplierSlider) {
		self.guillocheView.multiplier = self.multiplierSlider.value;
		self.multiplierSliderLabel.text = [NSString stringWithFormat:@"Multiplier: %f", self.multiplierSlider.value];
	} else if (sender == self.majorRippleSlider) {
		self.guillocheView.majorRipple = self.majorRippleSlider.value;
		self.majorRippleSliderLabel.text = [NSString stringWithFormat:@"Major: %f", self.majorRippleSlider.value];
	} else if (sender == self.minorRippleSlider) {
		self.guillocheView.minorRipple = self.minorRippleSlider.value;
		self.minorRippleSliderLabel.text = [NSString stringWithFormat:@"Minor: %f", self.minorRippleSlider.value];
	} else if (sender == self.radiusSlider) {
		self.guillocheView.radius = self.radiusSlider.value;
		self.radiusSliderLabel.text = [NSString stringWithFormat:@"Radius: %f", self.radiusSlider.value];
	} else if (sender == self.opacitySlider) {
		self.guillocheView.opacity = self.opacitySlider.value;
		self.opacitySliderLabel.text = [NSString stringWithFormat:@"Opacity: %f", self.opacitySlider.value];
	} else if (sender == self.lineThicknessSlider) {
		self.guillocheView.lineThickness = self.lineThicknessSlider.value;
		self.lineThicknessSliderLabel.text = [NSString stringWithFormat:@"Thickness: %f", self.lineThicknessSlider.value];
	}
}

@end
