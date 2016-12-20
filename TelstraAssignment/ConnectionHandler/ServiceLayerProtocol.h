//
//  ServiceLayerProtocol.h
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//
#import <Foundation/Foundation.h>

@protocol ServiceLayerProtocol <NSObject>

- (void)fetch:(NSDictionary*)aRequestDictionary;
- (void)onDataReceived:(NSData *)aResponseData;
- (void)onError:(NSError *)error;

@end
