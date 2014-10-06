//
//  ZYYPictureLatestController.m
//  百思不得姐-张莹莹
//
//  Created by lanou3g on 14-10-3.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "ZYYPictureLatestController.h"


static NSInteger pageLatest = 1;
@interface ZYYPictureLatestController ()

@property (strong, nonatomic) NSMutableArray *array;
@property(nonatomic,retain)UIImageView *imageView;


@end

@implementation ZYYPictureLatestController


- (UIImageView *)imageView{
    if (_imageView == nil) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 64)/2, self.view.frame.size.width, 0)];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;//图片不失真
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidesImageViewLatest)];
        [self.imageView addGestureRecognizer:tapGesture];
        
    }
    return _imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self latestNaviLayout];
    
    [self afhttpLatestRequest];
    [self collectionLayoutLatest];
    [self setupLatestRefresh];

}
- (void)latestNaviLayout{
    //自定义返回按钮
    UIImage *backButtonImage = [[UIImage imageNamed:@"fanhui.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    label.text = @"最新";
    label.font = [UIFont systemFontOfSize:22];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    self.navigationController.navigationBar.barTintColor = RGBA(120, 0, 140, 1);
}
- (void)afhttpLatestRequest{
    self.array = [NSMutableArray array];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kPictureLatestAPI parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *dataArray = [responseObject objectForKey:@"list"];
        for (NSMutableDictionary *dic in dataArray) {
            ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.array addObject:model];
            
            
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数据请求失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
        
    }];
    
}
- (void)setupLatestRefresh{
    
    [self.tableView addHeaderWithTarget:self action:@selector(headerLatestRereshing)];
    [self.tableView headerBeginRefreshing];
    [self.tableView addFooterWithTarget:self action:@selector(footerLatestRereshing)];
}
- (void)headerLatestRereshing{
    
    //    [self.dataArray removeAllObjects];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self afhttpLatestRequest];
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
    });
    
}
- (void)footerLatestRereshing{
    
    pageLatest++;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *picture = [NSString stringWithFormat:@"http://api.budejie.com/api/api_open.php?a=newlist&appname=baisibudejie&asid=D61CBE97-3958-400E-8B23-4D971A0CF676&c=data&client=iphone&device=iTouch%205&from=ios&jbk=0&mac=02%3A00%3A00%3A00%3A00%3A00&market=&maxtime=1412336497&openudid=2b5e2843bdf303c7713e36604fa34c8cdffea8c3&page=%ld&per=20&type=10&udid=&ver=3.0",pageLatest];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:picture parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSMutableArray *dataArray = [responseObject objectForKey:@"list"];
            for (NSMutableDictionary *dic in dataArray) {
                ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.array addObject:model];
                
            }
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数据请求失败" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView footerEndRefreshing];
    });
    
}
- (void)collectionLayoutLatest{
    
    UIView *collectionView = [[UIView alloc] initWithFrame:CGRectMake(320, self.view.frame.size.height-200, 320, 200)];
    collectionView.backgroundColor = RGBA(225, 225, 225, .9);
    collectionView.tag = 100;
    
    UIButton *collection = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    collection.frame = CGRectMake(110, 30, 100, 40);
    [collection setTitle:@"收藏" forState:UIControlStateNormal];
    collection.titleLabel.font = [UIFont systemFontOfSize:20];
    [collectionView addSubview:collection];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(110, 70, 100, 40);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(handleCancelButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:20];
    
    
    [collectionView addSubview:cancelButton];
    [self.view addSubview:collectionView];
    
    UIView *blackView = [[UIView alloc] initWithFrame:self.view.bounds];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = .5;
    blackView.tag = 500;
    blackView.hidden = YES;
    [self.view insertSubview:blackView belowSubview:collectionView];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    static NSString *cellIndetifier = @"cell";
    ZYYPictureCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
        cell = [[ZYYPictureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    ZYYHomeModel *model = [[ZYYHomeModel alloc] init];
    model = [self.array objectAtIndex:indexPath.row];
    //头像照片
    NSURL *url = [NSURL URLWithString:model.profile_image];
    [cell.photoImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"shoppingDefaultLogo.png"]];
    //名字
    cell.nameLabel.text = model.screen_name;
    //时间
    cell.timeLabel.text = model.created_at;
    //内容
//    ZYYHomeModel *model = [self.array objectAtIndex:indexPath.row];
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0]};
    self.textSize = [model.text boundingRectWithSize:CGSizeMake(294, 100000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;

    cell.midTextLabel.frame = CGRectMake(5, 33, 294, self.textSize.height);
    cell.midTextLabel.text = model.text;
    //中间的图片
    cell.textImage.frame = CGRectMake(5, 38+self.textSize.height,294, model.height*294/model.width);
    NSURL *urlImage = [NSURL URLWithString:model.image0];
    [cell.textImage setImageWithURL:urlImage placeholderImage:[UIImage imageNamed:@"reviewEssayNetErrorClick.png"]];
    [cell.textImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureLatest:)]];
    SingLetonMethod *sing = [SingLetonMethod shareSingleton];
    sing.singleImage = cell.textImage;
    //长线
    cell.longView.frame = CGRectMake(5, 42+self.textSize.height+model.height*294/model.width, 294, 0.3);
    //赞的数量
    cell.loveButton.frame = CGRectMake(21.5, 50.5+self.textSize.height+model.height*294/model.width, 15, 15);
    [cell.loveButton addTarget:self action:@selector(handleLoveButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    cell.loveLabel.frame = CGRectMake(37, 50.5+self.textSize.height+model.height*294/model.width, 25, 15);
    cell.loveLabel.text = model.love;
    
    //左边线
    cell.leftView.frame = CGRectMake(78.5, 45.5+self.textSize.height+model.height*294/model.width, 0.3, 25);
    //差的数量
    cell.hateButton.frame = CGRectMake(95, 50.5+self.textSize.height+model.height*294/model.width, 15, 15);
    [cell.hateButton addTarget:self action:@selector(handleHateButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    cell.hateLabel.frame = CGRectMake(110.5, 50.5+self.textSize.height+model.height*294/model.width, 25, 15);
    cell.hateLabel.text = model.hate;
    
    //中间线
    cell.midView.frame = CGRectMake(151.5, 45.5+self.textSize.height+model.height*294/model.width, 0.3, 25);
    //分享的数量
    cell.forwardButton.frame = CGRectMake(168.5, 50.5+self.textSize.height+model.height*294/model.width, 15, 15);
    [cell.forwardButton addTarget:self action:@selector(handleForwardButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    cell.forwardLabel.frame = CGRectMake(184, 50.5+self.textSize.height+model.height*294/model.width, 25, 15);
    cell.forwardLabel.text = model.forward;
    //右边线
    cell.rightView.frame = CGRectMake(225, 45.5+self.textSize.height+model.height*294/model.width, 0.3, 25);
    //评论的数量
    cell.commentButton.frame = CGRectMake(241.5, 50.5+self.textSize.height+model.height*294/model.width, 15, 15);
    [cell.commentButton addTarget:self action:@selector(handleCommentButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    cell.commentLabel.frame = CGRectMake(257, 50.5+self.textSize.height+model.height*294/model.width, 25, 15);
    cell.commentLabel.text = model.comment;
    //背面的Label
    cell.bigBackLabel.frame = CGRectMake(8, 5, 304, 75.5+self.textSize.height+model.height*294/model.width);
    
    //收藏按钮
    [cell.collectionButton addTarget:self action:@selector(handleCollectionButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}
- (void)handleTapGestureLatest:(UITapGestureRecognizer *)sender{
    [self.view addSubview:self.imageView];
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
        self.imageView.backgroundColor = [UIColor blackColor];
        self.imageView.image = ((UIImageView *)sender.view).image;
    }];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(270, 470, 40, 40);
    button.tag = 300;
    [button setImage:[UIImage imageNamed:@"down_img_btn_pressed.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"down_img_btn_pressed@2x.png"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(handleDownloadButtonLatest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)handleDownloadButtonLatest:(UIButton *)sender{
    SingLetonMethod *sing = [SingLetonMethod shareSingleton];
    UIImageWriteToSavedPhotosAlbum([sing.singleImage image], nil, nil,nil);
}
- (void)hidesImageViewLatest{
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.frame = CGRectMake(0, (self.view.frame.size.height - 64)/2, self.view.frame.size.width, 0);
        self.imageView.backgroundColor = [UIColor lightGrayColor];
    }];
    UIButton *button = (UIButton *)[self.view viewWithTag:300];
    [button removeFromSuperview];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYYHomeModel *model = [self.array objectAtIndex:indexPath.row];
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0]};
    self.textSize = [model.text boundingRectWithSize:CGSizeMake(294, 100000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return  80.5+self.textSize.height+model.height*294/model.width+ 10;
}
- (void)handleCollectionButtonLatest:(UIButton *)sender{
    UIView *view = [self.view viewWithTag:100];
    UIView *blackView = [self.view viewWithTag:500];
    if (view.frame.origin.x == self.view.frame.size.width) {
        [UIView animateWithDuration:0.3 animations:^{
            blackView.hidden = NO;
            view.frame = CGRectMake(0, self.view.frame.size.height-200, 320, 200);
        }];
        
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            view.frame = CGRectMake(320, self.view.frame.size.height-200, 320, 200);
            blackView.hidden = YES;
        }];
    }
    
    
    
}

- (void)handleCancelButtonLatest:(UIButton *)sender{
    
    UIView *view = [self.view viewWithTag:100];
    UIView *blackView = [self.view viewWithTag:500];
    if (view.frame.origin.x == self.view.frame.size.width) {
        [UIView animateWithDuration:0.3 animations:^{
            blackView.hidden = NO;
            view.frame = CGRectMake(0, self.view.frame.size.height-200, 320, 200);
        }];
        
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            view.frame = CGRectMake(320, self.view.frame.size.height-200, 320, 200);
            blackView.hidden = YES;
        }];
    }
    
}
- (void)handleLoveButtonLatest:(UIButton *)sender{
    ZYYPictureCell *cell = (ZYYPictureCell *)sender.superview.superview.superview;
    if (!sender.selected) {
        [sender setImage:[UIImage imageNamed:@"contributeDingClickN.png"] forState:UIControlStateNormal];
        cell.loveLabel.text = [NSString stringWithFormat:@"%d",[cell.loveLabel.text intValue]+1];
        sender.selected = YES;
    }else{
        [sender setImage:[UIImage imageNamed:@"contributeDingN.png"] forState:UIControlStateNormal];
        cell.loveLabel.text = [NSString stringWithFormat:@"%d",[cell.loveLabel.text intValue]-1];
        sender.selected = NO;
    }
}
- (void)handleHateButtonLatest:(UIButton *)sender{
    ZYYPictureCell *cell = (ZYYPictureCell *)sender.superview.superview.superview;
    if (!sender.selected) {
        [sender setImage:[UIImage imageNamed:@"contributeCaiClickN.png"] forState:UIControlStateNormal];
        cell.hateLabel.text = [NSString stringWithFormat:@"%d",[cell.hateLabel.text intValue]+1];
        sender.selected = YES;
    }else{
        [sender setImage:[UIImage imageNamed:@"contributeCaiN.png"] forState:UIControlStateNormal];
        cell.hateLabel.text = [NSString stringWithFormat:@"%d",[cell.hateLabel.text intValue]-1];
        sender.selected = NO;
    }
    
}
- (void)handleForwardButtonLatest:(UIButton *)sender{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToFacebook,UMShareToTwitter, nil]
                                       delegate:nil];
    
}
- (void)handleCommentButtonLatest:(UIButton *)sender{
    UINavigationController *commentList = [[UMSocialControllerServiceComment defaultControllerService] getSocialCommentListController];
    [self presentModalViewController:commentList animated:YES];
    
}


@end
