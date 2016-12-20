//
//  DetailViewController.m
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import <UIKit/UIKit.h>
#import "InfoCustomCell.h"
#import "TableInfo.h"
#import "Constant.h"
#import "ConnectionHandler.h"
#import "Utility.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DetailServiceProtocol>
{
    UITableView *infoTable;
    ConnectionHandler *connectionHandler;
    UIRefreshControl *refreshControl;
    UIActivityIndicatorView *loadingIndicator;
}
@end

