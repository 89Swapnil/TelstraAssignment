//
//  DetailsService.m
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//
#import "DetailsService.h"

@implementation DetailsService

- (void)fetch:(NSDictionary *)aRequestDictionary
{

    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/746330/facts.json"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    [ConnectionHandler makeConnection:request callingService:self];
}

- (void)onDataReceived:(NSData *)aResponseData {
    

    NSString *string = [[NSString alloc] initWithData:aResponseData encoding:NSASCIIStringEncoding];
    NSData* mainData = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:mainData options:NSJSONReadingAllowFragments error:nil];
    NSArray *dataArray = [jsonData valueForKey:@"rows"];
    NSString *titleHeader = [jsonData valueForKey:@"title"];
    
    NSMutableArray *detailDataArray = [self getDetailsArray:dataArray];
    
    [self.delegate detailResultHandler:detailDataArray :titleHeader];
}

-(NSMutableArray *)getDetailsArray:(NSArray *)dataArray
{
     NSMutableArray *detailDataArray = [[NSMutableArray alloc]init];
    for(NSDictionary *tempDict in dataArray)
    {
        TableInfo *infoData = [[TableInfo alloc]init];
        if(!(([tempDict objectForKey:@"title"] == [NSNull null]) && ([tempDict objectForKey:@"description"] == [NSNull null]) && ([tempDict objectForKey:@"imageHref"] == [NSNull null])))
        {
            [infoData setData:tempDict];
            [detailDataArray addObject:infoData];
        }
    }
    return detailDataArray;
}

- (void)onError:(NSError *)aError
{
    [self.delegate onError:aError];
}

@end
