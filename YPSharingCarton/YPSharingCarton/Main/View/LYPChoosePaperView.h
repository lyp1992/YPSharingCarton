//
//  LYPChoosePaperView.h
//  YPSharingCarton
//
//  Created by laiyp on 2018/4/3.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^takeLength)(CGFloat paperLength);

@interface LYPChoosePaperView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) takeLength paperLength;

+(instancetype)aweakFromXib;

@end
