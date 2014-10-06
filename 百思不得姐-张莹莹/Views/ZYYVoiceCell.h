//
//  ZYYVoiceCell.h
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-10-3.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYYVoiceCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *topBackView;
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong,nonatomic)UILabel *midLabel;
@property (strong,nonatomic)UIImageView *midImage;
@property (nonatomic,strong)UIView *longView;
@property (nonatomic,strong)UIButton *loveButton;
@property (nonatomic,strong)UILabel *loveLabel;
@property (nonatomic,strong)UIView *leftView;
@property (nonatomic,strong)UIButton *hateButton;
@property (nonatomic,strong)UILabel *hateLabel;
@property (nonatomic,strong)UIView *midView;
@property (nonatomic,strong)UIButton *forwardButton;
@property (nonatomic,strong)UILabel *forwardLabel;
@property (nonatomic,strong)UIView *rightView;
@property (nonatomic,strong)UIButton *commentButton;
@property (nonatomic,strong)UILabel *commentLabel;
@property (nonatomic,strong)UILabel *playCountLabel;
@property (nonatomic,strong)UILabel *playTimeLabel;
@property (nonatomic,strong)UIButton *voiceButton;
//@property (nonatomic,strong)UIImageView *buttonImage;
@property (nonatomic,strong)UIView *backView;
@property (nonatomic,strong)UISlider *slider;
@property (nonatomic,strong)UILabel *playTime;

@end
