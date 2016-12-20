//
//  TableInfo.h
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import <Foundation/Foundation.h>

@interface TableInfo : NSObject

@property(nonatomic, retain) NSString* title;
@property(nonatomic, retain) NSString* descriptionDetail;
@property(nonatomic, retain) NSString* imgUrl;

-(id) setData:(NSDictionary *)infoDict;

@end
