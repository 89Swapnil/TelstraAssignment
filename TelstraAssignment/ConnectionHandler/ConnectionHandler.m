//
//  ConnectionHandler.m
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import "ConnectionHandler.h"

@implementation ConnectionHandler

+ (void)makeConnection:(NSURLRequest *)aRequest callingService:(id)aService
{    
    NSURLSession *tSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *tPostRequestTask = [tSession dataTaskWithRequest:aRequest
                                                         completionHandler:^(NSData *tData, NSURLResponse *tResponse, NSError *tError) {
                                                             
                                                             if(tError == nil) {
                                                                 if([aService conformsToProtocol:@protocol(ServiceLayerProtocol)]) {
                                                                     [aService onDataReceived:tData];
                                                                 }
                                                                 [tSession finishTasksAndInvalidate];
                                                             }
                                                             else {
                                                                 if([aService conformsToProtocol:@protocol(ServiceLayerProtocol)]) {
                                                                     [aService onError:tError];
                                                                 }
                                                                 [tSession finishTasksAndInvalidate];
                                                             }
                                                             
                                                         }];
    [tPostRequestTask resume];
}
@end
