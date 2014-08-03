//
//  ViewController.h
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuillocheView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet GuillocheView *guillocheView;

@property (nonatomic, strong) IBOutlet UISlider *scaleSlider;
@property (nonatomic, strong) IBOutlet UISlider *stepsSlider;
@property (nonatomic, strong) IBOutlet UISlider *multiplierSlider;
@property (nonatomic, strong) IBOutlet UISlider *majorRippleSlider;
@property (nonatomic, strong) IBOutlet UISlider *minorRippleSlider;
@property (nonatomic, strong) IBOutlet UISlider *radiusSlider;
@property (nonatomic, strong) IBOutlet UISlider *opacitySlider;
@property (nonatomic, strong) IBOutlet UISlider *lineThicknessSlider;

- (IBAction) sliderValueChanged:(id)sender;

@end
