//
//  ZYYVoiceCell.m
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-10-3.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "ZYYVoiceCell.h"

@implementation ZYYVoiceCell

- (UILabel *)midLabel{
    
    if (_midLabel == nil) {
        self.midLabel  = [[UILabel alloc] init];
        _midLabel.font = [UIFont systemFontOfSize:14];
        _midLabel.textAlignment = NSTextAlignmentLeft;
        _midLabel.numberOfLines = 0;
        _midLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.midLabel];
    }
    return _midLabel;
}
- (UIImageView *)midImage{
    
    if (_midImage == nil) {
        self.midImage = [[UIImageView alloc] init];
        _midImage.userInteractionEnabled = YES;
        _midImage.contentMode = UIViewContentModeScaleAspectFit;//图片不失真
        [self.contentView addSubview:_midImage];
    }
    return _midImage;
}
- (UIView *)longView{
    
    if (_longView == nil) {
        self.longView = [[UIView alloc] init];
        _longView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.longView];
    }
    return _longView;
}

- (UIButton *)loveButton{
    
    if (_loveButton == nil) {
        self.loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loveButton setImage:[UIImage imageNamed:@"contributeDingN.png"] forState:UIControlStateNormal];
        [_loveButton setImage:[UIImage imageNamed:@"contributeDingClickN.png"] forState:UIControlStateHighlighted];
        [self.contentView addSubview:self.loveButton];
    }
    return _loveButton;
}

- (UILabel *)loveLabel{
    
    if (_loveLabel == nil) {
        self.loveLabel = [[UILabel alloc] init];
        _loveLabel.font = [UIFont systemFontOfSize:10];
        _loveLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.loveLabel];
    }
    return _loveLabel;
}
- (UIView *)leftView{
    
    if (_leftView == nil) {
        self.leftView = [[UIView alloc] init];
        _leftView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.leftView];
    }
    return _leftView;
}
- (UIButton *)hateButton{
    
    if (_hateButton == nil) {
        self.hateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hateButton setImage:[UIImage imageNamed:@"contributeCaiN.png"] forState:UIControlStateNormal];
        [_hateButton setImage:[UIImage imageNamed:@"contributeCaiClickN.png"] forState:UIControlStateHighlighted];
     [self.contentView addSubview:self.hateButton];
    }
    return _hateButton;
}
- (UILabel *)hateLabel{
    
    if (_hateLabel == nil) {
        self.hateLabel = [[UILabel alloc] init];
        _hateLabel.font = [UIFont systemFontOfSize:10];
        _hateLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.hateLabel];
    }
    return _hateLabel;
}
- (UIView *)midView{
    
    if (_midView == nil) {
        self.midView = [[UIView alloc] init];
        _midView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.midView];
    }
    return _midView;
}
- (UIButton *)forwardButton{
    if (_forwardButton == nil) {
        self.forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forwardButton setImage:[UIImage imageNamed:@"comment-repost-icon.png"] forState:UIControlStateNormal];
        [_forwardButton setImage:[UIImage imageNamed:@"comment-repost-click-icon.png"] forState:UIControlStateHighlighted];
        [self.contentView addSubview:self.forwardButton];
    }
    return _forwardButton;
}

- (UILabel *)forwardLabel{
    if (_forwardLabel == nil) {
        self.forwardLabel = [[UILabel alloc] init];
        _forwardLabel.font = [UIFont systemFontOfSize:10];
        _forwardLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.forwardLabel];
    }
    return _forwardLabel;
}
- (UIView *)rightView{
    if (_rightView == nil) {
        self.rightView = [[UIView alloc] init];
        _rightView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.rightView];
    }
    return _rightView;
}
- (UIButton *)commentButton{
    if (_commentButton == nil) {
        self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setImage:[UIImage imageNamed:@"mainCellCommentN.png"] forState:UIControlStateNormal];
        [_commentButton setImage:[UIImage imageNamed:@"mainCellCommentClickN.png"] forState:UIControlStateHighlighted];
        [self.contentView addSubview:self.commentButton];
    }
    return _commentButton;
}
- (UILabel *)commentLabel{
    if (_commentLabel == nil) {
        self.commentLabel = [[UILabel alloc] init];
        _commentLabel.font = [UIFont systemFontOfSize:10];
        _commentLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.commentLabel];
    }
    return _commentLabel;
}
- (UILabel *)playCountLabel{
    if (_playCountLabel == nil) {
        self.playCountLabel = [[UILabel alloc] init];
        _playCountLabel.font = [UIFont systemFontOfSize:10];
        _playCountLabel.textAlignment = NSTextAlignmentCenter;
        _playCountLabel.backgroundColor = [UIColor lightGrayColor];
        _playCountLabel.alpha = 0.8;
        _playCountLabel.textColor = [UIColor whiteColor];
        [self.midImage addSubview:self.playCountLabel];
    }
    return _playCountLabel;
}
- (UILabel *)playTimeLabel{
    if (_playTimeLabel == nil) {
        self.playTimeLabel = [[UILabel alloc] init];
        _playTimeLabel.font = [UIFont systemFontOfSize:10];
        _playTimeLabel.textAlignment = NSTextAlignmentCenter;
        _playTimeLabel.backgroundColor = [UIColor lightGrayColor];
        _playTimeLabel.alpha = 0.8;
        _playTimeLabel.textColor = [UIColor whiteColor];
      [self.midImage addSubview:_playTimeLabel];
    }
    return _playTimeLabel;
}

- (UIButton *)voiceButton{
    if (_voiceButton == nil) {
        self.voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.midImage addSubview:self.voiceButton];
    }
    return _voiceButton;
}

//- (UIImageView *)buttonImage{
//
//    if (_buttonImage == nil) {
//        self.buttonImage = [[UIImageView alloc] init];
//        [_buttonImage setImage:[UIImage imageNamed:@"playButton.png"]];
//        _buttonImage.userInteractionEnabled = YES;
//        [self.midImage addSubview:self.buttonImage];
//    }
//    return _buttonImage;
//}
- (UIView *)backView{
    if (_backView == nil) {
        self.backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.3;
        [self.midImage insertSubview:self.backView belowSubview:self.voiceButton];
    }
    return _backView;
}
- (UISlider *)slider{
    if (_slider == nil) {
        self.slider = [[UISlider alloc] init];
        _slider.minimumValue = 0;
        _slider.maximumValue = 1;
        _slider.minimumTrackTintColor = [UIColor purpleColor];
        [self.backView addSubview:self.slider];
    }
    return _slider;
}
- (UILabel *)playTime{
    if (_playTime == nil) {
        self.playTime = [[UILabel alloc] init];
        _playTime.font = [UIFont systemFontOfSize:10];
        _playTime.textAlignment = NSTextAlignmentCenter;
        _playTime.textColor = [UIColor whiteColor];
        _playTime.backgroundColor = [UIColor lightGrayColor];
        _playTime.alpha = 0.8;
        [self.backView addSubview:self.playTime];
    }
    return _playTime;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
           
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
