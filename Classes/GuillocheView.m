//
//  GuillocheView.m
//  Guilloche
//
//  Created by Zane Shannon on 8/2/14.
//  Copyright (c) 2014 smiles+laughs co. All rights reserved.
//  Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
//
//  Credits
//  Inspired by:
//  http://www.subblue.com/projects/guilloche
//  Originally Inspired by:
//  http://ministryoftype.co.uk/words/article/guilloches/
//  http://mathworld.wolfram.com/GuillochePattern.html
//

#import "GuillocheView.h"

@interface GuillocheView()

- (void) setDefaultValues;

@end

@implementation GuillocheView

int _section_length = 10;

@synthesize scale = _amplitude, steps = _steps, multiplier = _m, majorRipple = _R, minorRipple = _r, radius = _p, opacity = _opacity, lineThickness = _thickness, lineColor1 = _lineColor1, lineColor2 = _lineColor2;

- (void)drawRect:(CGRect)rect {
	// We need the offset to center the pattern in the rect
	float offsetX = rect.size.width / 2.0f;
	float offsetY = rect.size.height / 2.0f;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, _thickness);
	float x;
	float y;
	float ox = 0.0;
	float oy = 0.0;
	int sl = 0;
	float theta = 0.0;
	float thetaStep = 2 * M_PI / _steps;
	float s = (_R + _r) / _r;
	float rR = _r + _R;
	float rp = _r + _p;
	
	for (int t = 0; t <= _steps; t++) {
		x = rR * cos(_m * theta) + rp * cos(s * _m * theta);
		y = rR * sin(_m * theta) + rp * sin(s * _m * theta);
		
		x *= _amplitude;
		y *= _amplitude;
		
		if (sl == 0) {
			// TODO: change the line color here
			if (t == 0) {
				CGContextMoveToPoint(context, x + offsetX, y + offsetY);
			}
			else {
				CGContextMoveToPoint(context, ox + offsetX, oy + offsetY);
				CGContextAddLineToPoint(context, x + offsetX, y + offsetY);
			}
		}
		else {
			CGContextAddLineToPoint(context, x + offsetX, y + offsetY);
		}
		
		ox = x;
		oy = y;
		sl++;
		theta += thetaStep;
		
		if (sl == _section_length) sl = 0;
	}
	CGContextStrokePath(context);
}

#pragma mark - Initilization Methods

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		[self setDefaultValues];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
    if (self) {
		[self setDefaultValues];
    }
    return self;
}

- (void) setDefaultValues {
	_amplitude = 2.5f;
	_steps = 970.0f;
	_m = 1.0f;
	_R = 49.0f;
	_r = 0.25f;
	_p = 33.0f;
	_opacity = 0.3f;
	_thickness = 1.0f;
	_lineColor1 = [UIColor blackColor];
	_lineColor2 = [UIColor blackColor];
}

# pragma mark - Instance Variable Setters

- (void) setScale:(float)scale {
	// TODO: should be between 1-15
	_amplitude = scale;
	[self setNeedsDisplay];
}

- (void) setSteps:(float)steps {
	// TODO: should be between 10-3000
	_steps = steps;
	[self setNeedsDisplay];
}

- (void) setMultiplier:(float)multiplier {
	// TODO: should be between 0.1-5
	_m = multiplier;
	[self setNeedsDisplay];
}

- (void) setMajorRipple:(float)majorRipple {
	// TODO: should be between 0-100
	_R = majorRipple;
	[self setNeedsDisplay];
}

- (void) setMinorRipple:(float)minorRipple {
	// TODO: should be between 0-0.5
	_r = minorRipple;
	[self setNeedsDisplay];
}

- (void) setRadius:(float)radius {
	// TODO: should be between 0-100
	_p = radius;
	[self setNeedsDisplay];
}

- (void) setOpacity:(float)opacity {
	// TODO: should be between 0-1
	_opacity = opacity;
	[self setNeedsDisplay];
}

- (void) setLineThickness:(float)lineThickness {
	// TODO: should be between 1-30
	_thickness = lineThickness;
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
