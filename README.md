# Guilloche #

Guilloche creates [Guilloché Patterns](http://en.wikipedia.org/wiki/Guilloch%C3%A9) in UIViews. It's based heavily on [Tom Beddard](http://www.subblue.com/about)'s AS3 source code and [Guilloche Pattern Generator](http://www.subblue.com/projects/guilloche). We use it to generate unique backs for each deck of cards.

## Usage ##

```

#import 'GuillocheView.h'

GuillocheView *guillocheView = [[GuillocheView alloc] init]; // Creates a Guilloche pattern randomly
[self.view addSubview:guillocheView]; // add to the current view

```
