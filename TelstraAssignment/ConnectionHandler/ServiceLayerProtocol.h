//
//  ServiceLayerProtocol.h
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//
#import <Foundation/Foundation.h>

//Service layer Protocol: Each service call will confirm to a set list of protocol methods which are mandatory for handling network call output
@protocol ServiceLayerProtocol <NSObject>

- (void)fetch:(NSDictionary*)aRequestDictionary;
- (void)onDataReceived:(NSData *)aResponseData;
- (void)onError:(NSError *)error;

@end
