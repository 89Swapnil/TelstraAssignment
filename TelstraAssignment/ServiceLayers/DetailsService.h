//
//  DetailsService.h
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//
#import <Foundation/Foundation.h>
#import "ConnectionHandler.h"
#import "ServiceLayerProtocol.h"
#import "TableInfo.h"

@protocol DetailServiceProtocol <NSObject>

- (void)detailResultHandler:(NSArray *)detailInfo :(NSString *)titleHeader;
- (void)onError:(NSError *)error;

@end

@interface DetailsService : NSObject <ServiceLayerProtocol>

@property (nonatomic, weak) id delegate;


@end
