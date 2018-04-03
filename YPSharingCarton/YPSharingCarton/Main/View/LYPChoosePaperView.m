//
//  LYPChoosePaperView.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/4/3.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPChoosePaperView.h"

@interface LYPChoosePaperView()

@property (nonatomic, strong) NSArray *titleArr;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (nonatomic, assign) CGFloat length;
@end

@implementation LYPChoosePaperView

- (IBAction)sureClick:(id)sender {
    if (self.paperLength) {
        self.paperLength(self.length);
    }
    [self.superview.superview removeFromSuperview];
}


+(instancetype)aweakFromXib{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:self options:nil][0];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self.pickerView selectRow:0 inComponent:0 animated:YES];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleArr = @[@"80",@"100",@"120"];
   
    self.pickerView.layer.masksToBounds = YES;
    self.pickerView.layer.cornerRadius = 5.0f;
    self.containView.layer.masksToBounds = YES;
    self.containView.layer.cornerRadius = 5.0f;
     self.length = 80;
    
    [self.pickerView reloadAllComponents];
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.titleArr.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.titleArr[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.length = [self.titleArr[row] floatValue];
    NSLog(@"%@",self.titleArr[row]);
}


@end
