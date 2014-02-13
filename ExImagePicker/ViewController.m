//
//  ViewController.m
//  ExImagePicker
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 5

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate> {
	NSInteger don;
}
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UILabel *lucky;

@end

@implementation ViewController

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return MAX_NUM;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
	return 64;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
	NSString *imagePath = [NSString stringWithFormat:@"sns%d.png",row];
	UIImage *img = [UIImage imageNamed:imagePath];
	
	UIImageView *imageView;
	if(nil == view) {
		imageView = [[UIImageView alloc] initWithImage:img];
		imageView.frame = CGRectMake(0, 0, 100, 60);
	} else {
		imageView = (UIImageView *)view;
		imageView.image = img;
	}
	return imageView;	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectRandom:(id)sender {
	NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
	[f setNumberStyle:NSNumberFormatterDecimalStyle];
	NSNumber * myNumber = [f numberFromString:self.money.text];
	don = [myNumber intValue];
	
	int r1 = arc4random() % MAX_NUM;
	int r2 = arc4random() % MAX_NUM;
	int r3 = arc4random() % MAX_NUM;
	
	if(r1==r2 || r1==r3 || r2==r3) {
		self.lucky.text = [NSString stringWithFormat:@"%d", don*10];
	} else if(r1==r2 && r1==r3) {
		self.lucky.text = [NSString stringWithFormat:@"%d", don*100];
	} else {
		self.lucky.text = @"빵";
	}
	
	
	[self.picker selectRow:r1 inComponent:0 animated:YES];
	[self.picker selectRow:r2 inComponent:1 animated:YES];
	[self.picker selectRow:r3 inComponent:2 animated:YES];
}
@end






















