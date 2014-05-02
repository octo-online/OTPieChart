// Copyright 2013 OCTO Technology
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


/**
 * @author RVI
 *
 * @section Description
 * Pie8ViewController implementation
 */

#import "Pie9ViewController.h"

#import "OTSlice.h"

@implementation Pie9ViewController

/**************************************************************************************************/
#pragma mark - Birth

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:@"ContentViewController" bundle:nibBundleOrNil];
	if (self) {
		self.values = [NSArray arrayWithObjects:
		               [NSNumber numberWithFloat:0.10],
		               [NSNumber numberWithFloat:0.1],
		               [NSNumber numberWithFloat:0.1],
		               [NSNumber numberWithFloat:0.10],
		               [NSNumber numberWithFloat:0.10],
		               [NSNumber numberWithFloat:0.1],
		               [NSNumber numberWithFloat:0.1],
		               [NSNumber numberWithFloat:0.10],
		               [NSNumber numberWithFloat:0.1],
		               [NSNumber numberWithFloat:0.1],
		               nil];

		self.colors = [NSArray arrayWithObjects:
		               UIColorFromRGB(0x1a4ada),
		               UIColorFromRGB(0x3d40be),
		               UIColorFromRGB(0x6035a3),
		               UIColorFromRGB(0x832b87),
		               UIColorFromRGB(0xa6206c),
		               UIColorFromRGB(0xc91650),
		               UIColorFromRGB(0xec0b35),
		               UIColorFromRGB(0xea5601),
		               UIColorFromRGB(0xfeb003),
		               UIColorFromRGB(0xeacb01),
		               nil];
	}

	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.slices = [[NSMutableArray alloc] init];

	for (int i = 0; i < self.values.count; i++) {
		CGFloat value = [[self.values objectAtIndex:i] floatValue];
		UIColor *color = [self.colors objectAtIndex:i];

		NSString *label = nil;

		if (!self.labels) {
			label = [NSString stringWithFormat:@"Value : %.2f %%", value * 100];
		}
		else {
			label = [self.labels objectAtIndex:i];
		}

		OTSlice *slice = [[OTSlice alloc] initWithLabel:label percentageValue:value color:color];
		slice.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
		slice.view.backgroundColor = [UIColor purpleColor];
		[self.slices addObject:slice];
	}

	[self.pie loadPieChart];
}

@end
