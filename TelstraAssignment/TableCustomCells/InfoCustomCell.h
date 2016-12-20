//
//  InfoCustomCell.h
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface InfoCustomCell : UITableViewCell

@property(nonatomic, retain) UILabel *title;
@property(nonatomic, retain) UILabel *descriptionDetail;
@property(nonatomic, retain) UIImageView *thumbNailImage;
@property(nonatomic, strong) NSString *thumbnailUrlString;
@property(nonatomic, strong) UIActivityIndicatorView *spinner;

-(void)setThumbnailUrlString:(NSString *)urlString;

@end
