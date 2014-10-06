//
//  ZYYPictureCell.h
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-9-30.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYYPictureCell : UITableViewCell

@property (nonatomic,strong)UILabel *bigBackLabel;
@property (nonatomic,strong)UIImageView *photoImage;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UIButton *collectionButton;
@property (nonatomic,strong)UILabel *midTextLabel;
@property (nonatomic,strong)UIImageView *textImage;
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
@property (nonatomic,assign) CGSize size;
@property (nonatomic,strong)UIImageView *urlImage;

@end
