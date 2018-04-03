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
#import "LYPMainViewController.h"

#define timeOut 60

@interface LYPLoginVC ()<UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UITextField *vercodeTextF;
@property (weak, nonatomic) IBOutlet UIButton *getVerCodeBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneLabelWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textPhoneLabelWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passWViewWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginButtonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginButtonConstainHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *descripLabelConstainHeight;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation LYPLoginVC
{
    dispatch_source_t _timer;
}
- (IBAction)dismissVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)getVercodebtn:(id)sender {
    if ([StringEXtension isBlankString:self.phoneTextF.text]) {
        [SVStatusHUD showWithStatus:@"请填写手机号码"];
        return;
    }else{
        
        LYPLonginNetworkTool *tool = [[LYPLonginNetworkTool alloc]init];
        
        int ctype = 3;
        
        NSDictionary *parames = [NSDictionary dictionaryWithObjectsAndKeys:self.phoneTextF.text,@"mobile",@(ctype),@"ctype", nil];
        [tool getVerificationCodeWithDic:parames success:^(id responseData, NSInteger responseCode) {
            LYPloginModel *model = [LYPloginModel mj_objectWithKeyValues:responseData];
            if (![StringEXtension isBlankString:model.error.msg]) {
                [SVStatusHUD showWithStatus:@"获取验证码失败"];
                dispatch_resume(_timer);
            }
        } failure:^(id responseData, NSInteger responseCode) {
            [SVStatusHUD showWithStatus:@"获取验证码失败"];
            dispatch_resume(_timer);
        }];
        
        __block int timeout = timeOut; //倒计时时间
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            if(timeout<0){ //倒计时结束，关闭
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    
                    self.timeLabel.hidden = YES;
                    self.getVerCodeBtn.userInteractionEnabled = YES;
                });
            }else{
                int seconds = timeout % 61;
                //                NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    
                    self.timeLabel.hidden = NO;
                    self.timeLabel.backgroundColor = [UIColor lightGrayColor];
                self.getVerCodeBtn.userInteractionEnabled = NO;
                    self.timeLabel.text = [NSString stringWithFormat:@"%.2ds重新获取",seconds];
                    
                    self.timeLabel.textColor = [UIColor whiteColor];
                    self.timeLabel.textAlignment = NSTextAlignmentCenter;
                    self.timeLabel.font = [UIFont systemFontOfSize:14];
                    self.timeLabel.layer.masksToBounds = YES;
                    self.timeLabel.userInteractionEnabled = NO;
                });
                timeout--;
            }
        });
        dispatch_resume(_timer);
        
    }
    
    
}

- (IBAction)loginButton:(id)sender {
    
    LYPLonginNetworkTool *longinTool = [[LYPLonginNetworkTool alloc]init];
    if ([StringEXtension isBlankString:self.phoneTextF.text] || [StringEXtension isBlankString:self.vercodeTextF.text]) {
        [SVStatusHUD showWithStatus:@"请输入正确的信息"];
        return;
    }
        NSDictionary *dic = @{@"mobile":self.phoneTextF.text,@"code":self.vercodeTextF.text,@"deviceToken":[LYPUserSingle shareUserSingle].deviceToken,@"ios":@(1)};
        [longinTool userLoginWithUserDic:dic Success:^(id responseData, NSInteger responseCode) {
            NSLog(@"login=%@",responseData);
            LYPloginModel *model = [LYPloginModel mj_objectWithKeyValues:responseData];
            if (![StringEXtension isBlankString:model.error.msg]) {
                [SVStatusHUD showWithStatus:model.error.msg];
            }else{

                if (![StringEXtension isBlankString:model.data.token]) {
                    //                写入本地
                    [LYPSavePList saveTokenPlistWith:model.data.token];
                    [LYPSavePList savePassWAndUser:dic];
                }
                [SVStatusHUD showWithStatus:@"登录成功"];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        } failue:^(id responseData, NSInteger responseCode) {
            NSLog(@"errlogin=%@",responseData);
        }];

}
- (IBAction)loginQQ:(id)sender {
    
}
- (IBAction)loginWechat:(id)sender {
    
}
- (IBAction)resetPassWButton:(id)sender {
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"LYPLoginVC" bundle:nil];
    LYPRegisterVC *registerVC = [board instantiateViewControllerWithIdentifier:@"LYPRegisterVC"];
    registerVC.isregister = NO;
    [self presentViewController:registerVC animated:YES completion:nil];
}
- (IBAction)registerButton:(id)sender {
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"LYPLoginVC" bundle:nil];
    LYPRegisterVC *registerVC = [board instantiateViewControllerWithIdentifier:@"LYPRegisterVC"];
    registerVC.isregister = YES;
    [self presentViewController:registerVC animated:YES completion:nil];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    NSDictionary *userDic = [LYPSavePList readUserInfo];
//    if (userDic) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupForDismissKeyboard];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
  
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
  self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT-20);
  
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    CGFloat witdh = 345 *SCREENWIDTH/375;
    self.phoneLabelWidth.constant = witdh;
     self.textPhoneLabelWidth.constant = witdh;
     self.phoneViewWidth.constant = witdh;
     self.passWViewWidth.constant = witdh;
     self.loginButtonWidth.constant = witdh;
    
    self.loginButtonConstainHeight.constant = 80 *SCREENHEIGHT/667 - 10;
    self.descripLabelConstainHeight.constant = 35 * SCREENHEIGHT/667;
    
}

-(void)keyboardWillShow:(NSNotification*)notification
{
   
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    // 在这里调整UI位置
    CGPoint pt = [_loginButton convertPoint:CGPointMake(0, 0) toView:[UIApplication sharedApplication].keyWindow];
    float txDistanceToBottom = SCREENHEIGHT - pt.y - _loginButton.frame.size.height;   // 距离底部多远
    if( txDistanceToBottom >= kbSize.height )  // 键盘不会覆盖
        return;
    
    self.scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width, _scrollView.contentSize.height + kbSize.height); //原始滑动距离增加键盘高度
    
    // 差多少
    float offsetY = txDistanceToBottom - kbSize.height - 40;  // 补一些给各种输入法
    [_scrollView setContentOffset:CGPointMake(0, _scrollView.contentOffset.y - offsetY) animated:YES];
}

-(void)keyboardWillHide:(NSNotification*)notification
{
    NSDictionary *info = [notification userInfo];
    
    CGFloat animationDurationValue = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:animationDurationValue animations:^{
        
        self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, 0);
    }];
}

#pragma mark UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}

@end
