//
//  ZYYPictureCell.m
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-9-30.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "ZYYPictureCell.h"

@implementation ZYYPictureCell

- (UIImageView *)photoImage{

    if (_photoImage == nil) {
        self.photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2, 30, 30)];
       
    }
    return _photoImage;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 2, 200, 15)];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}
- (UILabel *)timeLabel{

    if (_timeLabel == nil) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 200, 15)];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UIButton *)collectionButton{

    if (_collectionButton == nil) {
        self.collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _collectionButton.frame = CGRectMake(279, 2, 20, 20);
        [_collectionButton setImage:[UIImage imageNamed:@"cellmorebtnnormal.png"] forState:UIControlStateNormal];
        [_collectionButton setImage:[UIImage imageNamed:@"cellmorebtnclick.png"] forState:UIControlStateHighlighted];
        
    }
    return _collectionButton;
}
- (UILabel *)midTextLabel{

    if (_midTextLabel == nil) {
        self.midTextLabel  = [[UILabel alloc] init];
        _midTextLabel.font = [UIFont systemFontOfSize:14];
        _midTextLabel.textAlignment = NSTextAlignmentLeft;
        _midTextLabel.numberOfLines = 0;
        _midTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    }
    return _midTextLabel;
}
- (UIImageView *)textImage{

    if (_textImage == nil) {
        self.textImage = [[UIImageView alloc] init];
        _textImage.userInteractionEnabled = YES;
        _textImage.contentMode = UIViewContentModeScaleAspectFit;//图片不失真
    }
    return _textImage;
}
- (UIView *)longView{

    if (_longView == nil) {
        self.longView = [[UIView alloc] init];
        _longView.backgroundColor = [UIColor lightGrayColor];
    }
    return _longView;
}

- (UIButton *)loveButton{

    if (_loveButton == nil) {
        self.loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loveButton setImage:[UIImage imageNamed:@"contributeDingN.png"] forState:UIControlStateNormal];
        [_loveButton setImage:[UIImage imageNamed:@"contributeDingClickN.png"] forState:UIControlStateHighlighted];
        
    }
    return _loveButton;
}

- (UILabel *)loveLabel{

    if (_loveLabel == nil) {
        self.loveLabel = [[UILabel alloc] init];
        _loveLabel.font = [UIFont systemFontOfSize:10];
        _loveLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _loveLabel;
}
- (UIView *)leftView{

    if (_leftView == nil) {
        self.leftView = [[UIView alloc] init];
        _leftView.backgroundColor = [UIColor lightGrayColor];
    }
    return _leftView;
}
- (UIButton *)hateButton{

    if (_hateButton == nil) {
        self.hateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hateButton setImage:[UIImage imageNamed:@"contributeCaiN.png"] forState:UIControlStateNormal];
        [_hateButton setImage:[UIImage imageNamed:@"contributeCaiClickN.png"] forState:UIControlStateHighlighted];
        
    }
    return _hateButton;
}
- (UILabel *)hateLabel{

    if (_hateLabel == nil) {
        self.hateLabel = [[UILabel alloc] init];
        _hateLabel.font = [UIFont systemFontOfSize:10];
        _hateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hateLabel;
}
- (UIView *)midView{

    if (_midView == nil) {
        self.midView = [[UIView alloc] init];
        _midView.backgroundColor = [UIColor lightGrayColor];
    }
    return _midView;
}
- (UIButton *)forwardButton{
    if (_forwardButton == nil) {
        self.forwardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forwardButton setImage:[UIImage imageNamed:@"comment-repost-icon.png"] forState:UIControlStateNormal];
        [_forwardButton setImage:[UIImage imageNamed:@"comment-repost-click-icon.png"] forState:UIControlStateHighlighted];
    }
    return _forwardButton;
}

- (UILabel *)forwardLabel{
    if (_forwardLabel == nil) {
        self.forwardLabel = [[UILabel alloc] init];
        _forwardLabel.font = [UIFont systemFontOfSize:10];
        _forwardLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _forwardLabel;
}
- (UIView *)rightView{
    if (_rightView == nil) {
        self.rightView = [[UIView alloc] init];
        _rightView.backgroundColor = [UIColor lightGrayColor];
    }
    return _rightView;
}
- (UIButton *)commentButton{
    if (_commentButton == nil) {
        self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentButton setImage:[UIImage imageNamed:@"mainCellCommentN.png"] forState:UIControlStateNormal];
        [_commentButton setImage:[UIImage imageNamed:@"mainCellCommentClickN.png"] forState:UIControlStateHighlighted];
    }
    return _commentButton;
}
- (UILabel *)commentLabel{
    if (_commentLabel == nil) {
        self.commentLabel = [[UILabel alloc] init];
        _commentLabel.font = [UIFont systemFontOfSize:10];
        _commentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _commentLabel;
}

- (UILabel *)bigBackLabel{
    
    if (_bigBackLabel == nil) {
        self.bigBackLabel = [[UILabel alloc] init];
        _bigBackLabel.userInteractionEnabled = YES;
        _bigBackLabel.layer.borderWidth = 1.0;
        _bigBackLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _bigBackLabel;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self.bigBackLabel addSubview:self.photoImage];
        [self.bigBackLabel addSubview:self.nameLabel];
        [self.bigBackLabel addSubview:self.timeLabel];
        [self.bigBackLabel addSubview:self.collectionButton];
        [self.bigBackLabel addSubview:self.midTextLabel];
        [self.bigBackLabel addSubview:self.textImage];
        [self.bigBackLabel addSubview:self.longView];
        [self.bigBackLabel addSubview:self.loveButton];
        [self.bigBackLabel addSubview:self.loveLabel];
        [self.bigBackLabel addSubview:self.leftView];
        [self.bigBackLabel addSubview:self.hateButton];
        [self.bigBackLabel addSubview:self.hateLabel];
        [self.bigBackLabel addSubview:self.midView];
        [self.bigBackLabel addSubview:self.forwardButton];
        [self.bigBackLabel addSubview:self.forwardLabel];
        [self.bigBackLabel addSubview:self.rightView];
        [self.bigBackLabel addSubview:self.commentButton];
        [self.bigBackLabel addSubview:self.commentLabel];
        [self addSubview:self.bigBackLabel];
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
