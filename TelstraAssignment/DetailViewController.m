//
//  DetailViewController.m
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import "DetailViewController.h"

#define NavigationBar_Height 50

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI
{
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, NavigationBar_Height)];
    UINavigationItem *navItem = [UINavigationItem alloc];
    navItem.title = @"Test";
    [navbar pushNavigationItem:navItem animated:false];
    [self.view addSubview:navbar];
    
    infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, NavigationBar_Height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50)];
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
    return 10;
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
    
    cell.thumbNailImage.image = [UIImage imageNamed:@"defaultImages"];
    cell.title.text = @"AS";
    cell.descriptionDetail.text = @"ASA";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

@end
