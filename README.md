# Guilloche #

Guilloche creates [Guilloché Patterns](http://en.wikipedia.org/wiki/Guilloch%C3%A9) in UIViews. It's based heavily on [Tom Beddard](http://www.subblue.com/about)'s AS3 source code and [Guilloche Pattern Generator](http://www.subblue.com/projects/guilloche). We use it to generate unique backs for each deck of cards.

## Usage ##

```

#import 'GuillocheView.h'

GuillocheView *guillocheView = [[GuillocheView alloc] initWithFrame:self.view.frame]; // Creates a full view Guilloche pattern with default values
[self.view addSubview:guillocheView]; // add to the current view

```

## Attributes ##

GuillocheView supports the following attributes:

```
float scale;
float steps;
float	multiplier;
float majorRipple;
float minorRipple;
float radius;
float opacity;
float lineThickness;
NSArray *lineColors;

```

The view updates live when one of its attribute properties changes.

```
guillocheView.scale = 3.0; // guillocheView re-renders automatically
```
## Resizing ##

Resizing is not performed automatically by the class, however it's very easy to do:

```
// init
GuillocheView *guillocheView = [[GuillocheView alloc] initWithFrame:self.view.frame];
[self.view addSubview:guillocheView];
// update size to full width, 100px wide
guillocheView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 100.0);
// re-render
[guillocheView setNeedsDisplay];

```