//
//  ConnectionHandler.h
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//
#import <Foundation/Foundation.h>
#import "TableInfo.h"
#import "DetailsService.h"
#import "ServiceLayerProtocol.h"

@interface ConnectionHandler : NSObject

+ (void)makeConnection:(NSURLRequest *)request callingService:(id)service;

@end
