//
//  ZYYVoiceViewController.m
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-9-30.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "ZYYVoiceViewController.h"


static NSInteger voicePage = 1;

@interface ZYYVoiceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *voiceTableView;

@property (strong, nonatomic) REMenu *menu;
@property (strong, nonatomic) NSMutableArray *voiceArray;
@property (strong,nonatomic) AVPlayer *player;
@end

@implementation ZYYVoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.barTintColor = RGBA(120, 0, 140, 1);

    [self voiceAfhttpRequest];
    [self setupRefresh];
    
}
- (void)voiceAfhttpRequest{
    
    self.voiceArray = [NSMutableArray array];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kVoiceEssenceAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dataArray = [responseObject objectForKey:@"list"];
        for (NSMutableDictionary *dic in dataArray) {
            ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.voiceArray addObject:model];
            
            
        }
        [self.voiceTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数据请求失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
        
    }];
    

}
- (void)setupRefresh{
    
    [self.voiceTableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [self.voiceTableView headerBeginRefreshing];
    [self.voiceTableView addFooterWithTarget:self action:@selector(footerRereshing)];
}
- (void)headerRereshing{
    
    //    [self.dataArray removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self voiceAfhttpRequest];
        // 刷新表格
        [self.voiceTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.voiceTableView headerEndRefreshing];
    });
    
}
- (void)footerRereshing{
    
    voicePage++;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *picture = [NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=list&appname=baisibudejie&asid=D61CBE97-3958-400E-8B23-4D971A0CF676&c=voice&client=iphone&device=iTouch%205&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&maxtime=1412481301&openudid=2b5e2843bdf303c7713e36604fa34c8cdffea8c3&page=%d&per=20&type=31&udid=&ver=3.0",voicePage];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:picture parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSMutableArray *dataArray = [responseObject objectForKey:@"list"];
            for (NSMutableDictionary *dic in dataArray) {
                ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.voiceArray addObject:model];
                
                
            }
            [self.voiceTableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数据请求失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }];
        
        // 刷新表格
        [self.voiceTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.voiceTableView footerEndRefreshing];
    });
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return self.voiceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYYVoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYYVoiceCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
    model = [self.voiceArray objectAtIndex:indexPath.row];
    //头像照片
    NSURL *url = [NSURL URLWithString:model.profile_image];
    [cell.photoImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"shoppingDefaultLogo.png"]];
    
    //名字
    cell.nameLabel.text = model.screen_name;
    //时间
    cell.timeLabel.text = model.created_at;
    //内容
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0]};
    self.textSizeVoice = [model.text boundingRectWithSize:CGSizeMake(294, 100000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    cell.midLabel.frame = CGRectMake(5, 63, 294, self.textSizeVoice.height);
    cell.midLabel.text = model.text;
    //中间的图片
    cell.midImage.frame = CGRectMake(5, 68+self.textSizeVoice.height,294, model.height*294/model.width);
    NSURL *urlImage = [NSURL URLWithString:model.image0];
    [cell.midImage setImageWithURL:urlImage placeholderImage:[UIImage imageNamed:@"reviewEssayNetErrorClick.png"]];
    
    //长线
    cell.longView.frame = CGRectMake(5, 72+self.textSizeVoice.height+model.height*294/model.width, 294, 0.3);
    //赞的数量
    cell.loveButton.frame = CGRectMake(21.5, 80.5+self.textSizeVoice.height+model.height*294/model.width, 15, 15);
    [cell.loveButton addTarget:self action:@selector(handleLoveButtonVoice:) forControlEvents:UIControlEventTouchUpInside];
    cell.loveLabel.frame = CGRectMake(37, 80.5+self.textSizeVoice.height+model.height*294/model.width, 25, 15);
    cell.loveLabel.text = model.love;
    cell.loveLabel.tag = 1000;
    //左边线
    cell.leftView.frame = CGRectMake(78.5, 75.5+self.textSizeVoice.height+model.height*294/model.width, 0.3, 25);
    //差的数量
    cell.hateButton.frame = CGRectMake(95, 80.5+self.textSizeVoice.height+model.height*294/model.width, 15, 15);
    [cell.hateButton addTarget:self action:@selector(handleHateButtonVoice:) forControlEvents:UIControlEventTouchUpInside];
    cell.hateLabel.frame = CGRectMake(110.5, 80.5+self.textSizeVoice.height+model.height*294/model.width, 25, 15);
    cell.hateLabel.text = model.hate;
    cell.hateLabel.tag = 2000;
    //中间线
    cell.midView.frame = CGRectMake(151.5, 75.5+self.textSizeVoice.height+model.height*294/model.width, 0.3, 25);
    //分享的数量
    cell.forwardButton.frame = CGRectMake(168.5, 80.5+self.textSizeVoice.height+model.height*294/model.width, 15, 15);
    [cell.forwardButton addTarget:self action:@selector(handleForwardButtonVoice:) forControlEvents:UIControlEventTouchUpInside];
    cell.forwardLabel.frame = CGRectMake(184, 80.5+self.textSizeVoice.height+model.height*294/model.width, 25, 15);
    cell.forwardLabel.text = model.forward;
    //右边线
    cell.rightView.frame = CGRectMake(225, 75.5+self.textSizeVoice.height+model.height*294/model.width, 0.3, 25);
    //评论的数量
    cell.commentButton.frame = CGRectMake(241.5, 80.5+self.textSizeVoice.height+model.height*294/model.width, 15, 15);
    [cell.commentButton addTarget:self action:@selector(handleCommentButtonVoice:) forControlEvents:UIControlEventTouchUpInside];
    cell.commentLabel.frame = CGRectMake(257, 80.5+self.textSizeVoice.height+model.height*294/model.width, 25, 15);
    cell.commentLabel.text = model.comment;
    //播放次数
    cell.playCountLabel.frame = CGRectMake(230, 5, 60, 20);
    cell.playCountLabel.text = [NSString stringWithFormat:@"%d次播放",model.playcount];
    //播放时间
    cell.playTimeLabel.frame = CGRectMake(250, model.height*294/model.width-25, 40, 20);
    NSLog(@"++++++++%@",[model valueForKeyPath:@"voicetime"]);
    int timeLength = [model.voicetime intValue];
    int minute = timeLength / 60;
    int second = timeLength % 60;
    cell.playTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",minute,second];
    //播放按钮
    cell.voiceButton.frame = CGRectMake(122, model.height*294/model.width-50, 50, 50);
    [cell.voiceButton setBackgroundImage:[UIImage imageNamed:@"playButton.png"] forState:UIControlStateNormal];
    [cell.voiceButton setImage:[UIImage imageNamed:@"playButtonPlay.png"] forState:UIControlStateNormal];
    [cell.voiceButton addTarget:self action:@selector(handleVoiceButton:) forControlEvents:UIControlEventTouchUpInside];
    //slider的背景
    cell.backView.frame = CGRectMake(0, model.height*294/model.width-40, 250, 40);
    
    cell.backView.hidden = YES;
    //slider
    cell.slider.frame = CGRectMake(50, 0, 200, 25);
    //当前播放时间
    cell.playTime.frame = CGRectMake(50, 28, 40, 12);
    
    return cell;
}
- (void)handleVoiceButton:(UIButton *)sender{
//    listonButtonNumber++;
//    ZYYVoiceCell *cell = (ZYYVoiceCell *)sender.superview.superview.superview.superview;
    ZYYVoiceCell *cell = [self findBtnSuperCell:sender];
    NSIndexPath *indexPath = [self.voiceTableView indexPathForCell:cell];
    ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
    model = [self.voiceArray objectAtIndex:indexPath.row];
//    NSLog(@"%d",indexPath.row);
        if (!sender.selected) {
        [sender setImage:[UIImage imageNamed:@"playButtonPause.png"] forState:UIControlStateNormal];
        sender.frame = CGRectMake(0, sender.frame.origin.y, 50, 50);
            cell.backView.hidden = NO;
            
            NSLog(@"**********%@",model.voiceuri);
            NSURL * url = [NSURL URLWithString:model.voiceuri];
            NSLog(@"**********--------%@",url);
            self.player = [[AVPlayer alloc] initWithURL:url];
            [self.player play];

        sender.selected = YES;
    }else{
        [sender setImage:[UIImage imageNamed:@"playButtonPlay.png"] forState:UIControlStateNormal];
        sender.frame = CGRectMake(122, sender.frame.origin.y, 50, 50);
        cell.backView.hidden = YES;
        [self.player pause];
        sender.selected = NO;
    }
    
}
- (ZYYVoiceCell *)findBtnSuperCell:(UIButton *)btn
{
    UIView * superView = btn.superview;
    while (1)
    {
        if ([superView isMemberOfClass:[ZYYVoiceCell class]])
        {
            return (ZYYVoiceCell *)superView;
        }
        else
        {
            superView = superView.superview;
        }
    }
}


#pragma mark -UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYYHomeModel *model = [self.voiceArray objectAtIndex:indexPath.row];
    
    return  105.5+self.textSizeVoice.height+model.height*294/model.width+ 10;
}




- (IBAction)handleVoiceCollection:(id)sender {
    UIView *view = [self.view viewWithTag:200];
    UIView *blackView = [self.view viewWithTag:600];
    if (view.frame.origin.y == self.view.frame.size.height) {
        [UIView animateWithDuration:0.3 animations:^{
            blackView.hidden = NO;
            view.frame = CGRectMake(0, self.view.frame.size.height-200, 320, 200);
        }];
        
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            view.frame = CGRectMake(0, self.view.frame.size.height, 320, 200);
            blackView.hidden = YES;
        }];
    }
    [self collectionLayoutVoice];

}
- (void)collectionLayoutVoice{
    
    UIView *collectionView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 200)];
    collectionView.backgroundColor = RGBA(225, 225, 225, .9);
    collectionView.tag = 200;
    
    UIButton *collection = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    collection.frame = CGRectMake(110, 30, 100, 40);
    [collection setTitle:@"收藏" forState:UIControlStateNormal];
    collection.titleLabel.font = [UIFont systemFontOfSize:20];
    [collectionView addSubview:collection];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(110, 70, 100, 40);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(handleCancelButtonVoice:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    
    [collectionView addSubview:cancelButton];
    [self.view addSubview:collectionView];
    
    UIView *blackView = [[UIView alloc] initWithFrame:self.view.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = .5;
    blackView.tag = 600;
    blackView.hidden = YES;
    [self.view insertSubview:blackView belowSubview:collectionView];
    
}
- (void)handleCancelButtonVoice:(UIButton *)sender{
    
    UIView *view = [self.view viewWithTag:200];
    UIView *blackView = [self.view viewWithTag:600];
    if (view.frame.origin.y == self.view.frame.size.height) {
        [UIView animateWithDuration:0.3 animations:^{
            blackView.hidden = NO;
            view.frame = CGRectMake(0, self.view.frame.size.height-200, 320, 200);
        }];
        
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            view.frame = CGRectMake(0, self.view.frame.size.height, 320, 200);
            blackView.hidden = YES;
        }];
    }
    
}
- (void)handleLoveButtonVoice:(UIButton *)sender{
    UILabel *loveLabel = (UILabel *)[self.view viewWithTag:1000];
    if (!sender.selected) {
        [sender setImage:[UIImage imageNamed:@"contributeDingClickN.png"] forState:UIControlStateNormal];
        loveLabel.text = [NSString stringWithFormat:@"%d",[loveLabel.text intValue]+1];
        sender.selected = YES;
    }else{
        [sender setImage:[UIImage imageNamed:@"contributeDingN.png"] forState:UIControlStateNormal];
        loveLabel.text = [NSString stringWithFormat:@"%d",[loveLabel.text intValue]-1];
        sender.selected = NO;
    }
}
- (void)handleHateButtonVoice:(UIButton *)sender{
    UILabel *hateLabel = (UILabel *)[self.view viewWithTag:2000];
    if (!sender.selected) {
        [sender setImage:[UIImage imageNamed:@"contributeCaiClickN.png"] forState:UIControlStateNormal];
        hateLabel.text = [NSString stringWithFormat:@"%d",[hateLabel.text intValue]+1];
        sender.selected = YES;
    }else{
        [sender setImage:[UIImage imageNamed:@"contributeCaiN.png"] forState:UIControlStateNormal];
        hateLabel.text = [NSString stringWithFormat:@"%d",[hateLabel.text intValue]-1];
        sender.selected = NO;
    }
    
}
- (void)handleForwardButtonVoice:(UIButton *)sender{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToFacebook,UMShareToTwitter, nil]
                                       delegate:nil];
    
}
- (void)handleCommentButtonVoice:(UIButton *)sender{
    UINavigationController *commentList = [[UMSocialControllerServiceComment defaultControllerService] getSocialCommentListController];
    [self presentModalViewController:commentList animated:YES];
    
}


- (IBAction)handleVoiceMenuButton:(UIButton *)sender {
    
    if (_menu.isOpen)
        return [_menu close];
    
    // Sample icons from http://icons8.com/download-free-icons-for-ios-tab-bar
    //
    
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"精华"
                                                    subtitle:nil
                                                       image:[UIImage imageNamed:@"nav-order-newest-click"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          
                                                      }];
    
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"最新"
                                                       subtitle:nil
                                                          image:[UIImage imageNamed:@"nav-order-new-click"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             ZYYVoiceLatestController *latest = [[ZYYVoiceLatestController alloc] init];
                                                             [self.navigationController pushViewController:latest animated:YES];
                                                         }];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"穿越"
                                                        subtitle:nil
                                                           image:[UIImage imageNamed:@"nav-order-random-click"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              ZYYVoiceThroughController *through = [[ZYYVoiceThroughController alloc] init];
                                                              [self.navigationController pushViewController:through animated:YES];
                                                          }];
    
    homeItem.tag = 0;
    exploreItem.tag = 1;
    activityItem.tag = 2;
    
    
    _menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem]];
    _menu.cornerRadius = 4;
    _menu.backgroundColor = [UIColor lightGrayColor];
    _menu.shadowColor = [UIColor blackColor];
    _menu.shadowOffset = CGSizeMake(0, 1);
    _menu.shadowOpacity = 1;
    _menu.imageOffset = CGSizeMake(5, -1);
    
    [_menu showFromNavigationController:self.navigationController];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
