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

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *infoTable;
    ConnectionHandler *connectionHandler;

}
@end

