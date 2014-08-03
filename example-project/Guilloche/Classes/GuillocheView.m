//
//  GuillocheView.m
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//

#import "GuillocheView.h"

@implementation GuillocheView

static void * GVContext = &GVContext;

@synthesize scale = _scale, steps = _steps, multiplier = _multiplier, majorRipple = _majorRipple, minorRipple = _minorRipple, radius = _radius, opacity = _opacity, lineThickness = _lineThickness, lineColor1 = _lineColor1, lineColor2 = _lineColor2;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// Set default values
		_scale = 2.5;
		_steps = 970;
		_multiplier = 1;
		_majorRipple = 49;
		_minorRipple = 0.25;
		_radius = 33;
		_opacity = 0.3;
		_lineThickness = 1;
		_lineColor1 = [UIColor blackColor];
		_lineColor2 = [UIColor blackColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
	// TODO: implement drawing alogrithm
	[super drawRect:rect];
}

# pragma mark - Instance Variable Setters

- (void) setScale:(float)scale {
	// TODO: should be between 1-15
	_scale = scale;
	[self setNeedsDisplay];
}

- (void) setSteps:(float)steps {
	// TODO: should be between 10-3000
	_steps = steps;
	[self setNeedsDisplay];
}

- (void) setMultiplier:(float)multiplier {
	// TODO: should be between 0.1-5
	_multiplier = multiplier;
	[self setNeedsDisplay];
}

- (void) setMajorRipple:(float)majorRipple {
	// TODO: should be between 0-100
	_majorRipple = majorRipple;
	[self setNeedsDisplay];
}

- (void) setMinorRipple:(float)minorRipple {
	// TODO: should be between 0-0.5
	_minorRipple = minorRipple;
	[self setNeedsDisplay];
}

- (void) setRadius:(float)radius {
	// TODO: should be between 0-100
	_radius = radius;
	[self setNeedsDisplay];
}

- (void) setOpacity:(float)opacity {
	// TODO: should be between 0-1
	_opacity = opacity;
	[self setNeedsDisplay];
}

- (void) setLineThickness:(float)lineThickness {
	// TODO: should be between 1-30
	_lineThickness = lineThickness;
	[self setNeedsDisplay];
}

- (void) setLineColor1:(UIColor *)lineColor1 {
	_lineColor1 = lineColor1;
	[self setNeedsDisplay];
}

- (void) setLineColor2:(UIColor *)lineColor2 {
	_lineColor2 = lineColor2;
	[self setNeedsDisplay];
}

@end
