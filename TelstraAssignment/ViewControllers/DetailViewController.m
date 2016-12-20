//
//  DetailViewController.m
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property(nonatomic, strong)NSArray *detailArray;
@property(nonatomic, strong)NSString *titleHeader;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DetailsService *detailService = [DetailsService new];
    [detailService fetch:nil];
    [detailService setDelegate:self];

}

- (void)detailResultHandler:(NSArray *)detailInfo :(NSString *)titleHeader
{
    _titleHeader = titleHeader;
    _detailArray = detailInfo;
    dispatch_async(dispatch_get_main_queue(),^{
        [self setUI];
    });
}

- (void)onError:(NSError *)error
{
    UIAlertView *statusUpdatedAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error Occured" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [statusUpdatedAlert show];
    statusUpdatedAlert = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setUI
{
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, NavigationBar_Height)];
    UINavigationItem *navItem = [UINavigationItem alloc];
    navItem.title = _titleHeader;
    [navbar pushNavigationItem:navItem animated:false];
    [self.view addSubview:navbar];
    
    infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, NavigationBar_Height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - NavigationBar_Height)];
    infoTable.delegate =self;
    infoTable.dataSource = self;
    [infoTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:infoTable];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _detailArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InfoCustomCell *cell;
    static NSString *CellIdentifier = @"Cell";
    
    cell = (InfoCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[InfoCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 2)];
    separatorLineView.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:separatorLineView];
    
    TableInfo *dataObject = [_detailArray objectAtIndex:indexPath.row];
    
    NSString *urlString = [[NSString alloc]initWithFormat:@"%@",dataObject.imgUrl];
    NSString *title = [[NSString alloc]initWithFormat:@"%@",dataObject.title];
    NSString *description = [[NSString alloc]initWithFormat:@"%@",dataObject.descriptionDetail];
    
    cell.thumbNailImage.image = [UIImage imageNamed:@"defaultImages"];
    [cell.spinner startAnimating];
    [cell setThumbnailUrlString:urlString];
    cell.title.text = title;
    cell.descriptionDetail.text = description;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize constraint = CGSizeMake([UIScreen mainScreen].bounds.size.width - 70, CGFLOAT_MAX);
    CGSize size;
    
    TableInfo *dataObject = [_detailArray objectAtIndex:indexPath.row];
    NSString *description = [[NSString alloc]initWithFormat:@"%@",dataObject.descriptionDetail];
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [description boundingRectWithSize:constraint
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:DescriptionFont}
                                                   context:context].size;
    
    size = CGSizeMake((boundingBox.width), (boundingBox.height));
    if(size.height > MaxHeight)
        return size.height + CellPadding;
    else
        return DefaultCell_Height;
}

@end
