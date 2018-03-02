//
//  LYPLoginVC.m
//  YPSharingCarton
//
//  Created by laiyp on 2018/3/1.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "LYPLoginVC.h"
#import "LYPLonginNetworkTool.h"
#import "LYPRegisterVC.h"
#import "LYPSavePList.h"
#import "LYPloginModel.h"
#import "LYPUserSingle.h"
#import "LYPRegisterVC.h"

@interface LYPLoginVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;

@property (weak, nonatomic) IBOutlet UITextField *passWTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LYPLoginVC
- (IBAction)dismissVC:(id)sender {
    
}
- (IBAction)loginButton:(id)sender {
    
    LYPLonginNetworkTool *longinTool = [[LYPLonginNetworkTool alloc]init];
    if ([StringEXtension isBlankString:self.phoneTextF.text] || [StringEXtension isBlankString:self.passWTextF.text]) {
        [SVProgressHUD showWithStatus:@"请输入正确的信息"];
        return;
    }
        NSDictionary *dic = @{@"mobile":self.phoneTextF.text,@"password":self.passWTextF.text,@"deviceToken":[LYPUserSingle shareUserSingle].deviceToken,@"ios":@(0)};
        [longinTool userLoginWithUserDic:dic Success:^(id responseData, NSInteger responseCode) {
            NSLog(@"login=%@",responseData);
            LYPloginModel *model = [LYPloginModel mj_objectWithKeyValues:responseData];
            if (![StringEXtension isBlankString:model.error.msg]) {
                [SVProgressHUD showWithStatus:model.error.msg];
            }else{
                
                if (![StringEXtension isBlankString:model.data.token]) {
                    //                写入本地
                    [LYPSavePList saveTokenPlistWith:model.data.token];
                }
                
            }
        } failue:^(id responseData, NSInteger responseCode) {
            NSLog(@"errlogin=%@",responseData);
        }];

}
- (IBAction)loginQQ:(id)sender {
    
}
- (IBAction)loginWechat:(id)sender {
    
}
- (IBAction)registerButton:(id)sender {
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"LYPLoginVC" bundle:nil];
    LYPRegisterVC *registerVC = [board instantiateViewControllerWithIdentifier:@"LYPRegisterVC"];
    
    [self presentViewController:registerVC animated:YES completion:nil];
    
//      LYPLonginNetworkTool *longinTool = [[LYPLonginNetworkTool alloc]init];
//        NSDictionary *regisDic = @{@"mobile":@"13522652010",@"password":@"3D4F2BF07DC1BE38B20CD6E46949A1071F9D0E3D",@"deviceToken":@"525688FEdade",@"ios":@(0)};
//        [longinTool userLoginRegisterWithDic:regisDic success:^(id responseData, NSInteger responseCode) {
//            NSLog(@"Register=%@",responseData);
//        } failre:^(id responseData, NSInteger responseCode) {
//            NSLog(@"errRegister=%@",responseData);
//        }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}


@end
