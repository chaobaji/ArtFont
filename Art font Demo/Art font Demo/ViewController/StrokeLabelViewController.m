//
//  StrokeLabelViewController.m
//  Art font Demo
//
//  Created by 超八机 on 2017/9/2.
//  Copyright © 2017年 Hacky. All rights reserved.
//

#import "StrokeLabelViewController.h"
#import "CBJStrokeLabel.h"

@interface StrokeLabelViewController ()

@property (weak, nonatomic) IBOutlet UISlider *outlineWidthSlider;
@property (weak, nonatomic) CBJStrokeLabel *strokeLabel;

@end


@implementation StrokeLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.colorView addSegmentControl:@[@"OutlineColor",@"FontColor"]];
    
    CBJStrokeLabel *strokeLabel = [[CBJStrokeLabel alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 100)];
    strokeLabel.textAlignment = NSTextAlignmentCenter;
    strokeLabel.font = [UIFont systemFontOfSize:60.f];
    strokeLabel.text = @"STROKE";
    self.strokeLabel = strokeLabel;
    
    [self.view addSubview:self.strokeLabel];
    
    
    self.outlineWidthSlider.value = strokeLabel.outlineWidth;
    [self.outlineWidthSlider addTarget:self action:@selector(slideValueChange:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)slideValueChange:(UISlider *)slider
{
    self.strokeLabel.outlineWidth = slider.value;
    [self updateInfo];
}

- (void)didSelectColor:(UIColor *)color forKey:(NSString *)key
{
    if ([key isEqualToString:@"OutlineColor"]) {
        
        self.strokeLabel.outlineColor = color;
        
    }else{
        
        self.strokeLabel.textColor = color;
        
    }
    [self updateInfo];
}

- (NSString *)getStyleString
{
    NSString *outlineColor = [self hexStringFromColor:self.strokeLabel.outlineColor];
    NSString *textColor = [self hexStringFromColor:self.strokeLabel.textColor];
    NSString *style = [NSString stringWithFormat:@"StrokeLabel \n OutlineColor: %@ \n FontColor: %@ \n OutLineWidth: %f", outlineColor, textColor, self.strokeLabel.outlineWidth];
    return style;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
