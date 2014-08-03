//
//  GuillocheView.h
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuillocheView : UIView

@property (nonatomic) float scale;
@property (nonatomic) float steps;
@property (nonatomic) float	multiplier;
@property (nonatomic) float majorRipple;
@property (nonatomic) float minorRipple;
@property (nonatomic) float radius;
@property (nonatomic) float opacity;
@property (nonatomic) float lineThickness;
@property (nonatomic, strong) UIColor *lineColor1;
@property (nonatomic, strong) UIColor *lineColor2;

@end
