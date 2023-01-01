//
//  Person.h
//  TableViewDemo
//
//  Created by Adham Samer on 28/12/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property NSString *name;
@property int phone;
@property int age;
@property NSString *email;
@property NSString *address;
@property NSString *imgURL;

-(void) setFriend_WithName:(NSString*)name andEmail:(NSString*)email andAge:(int)age andPhone:(int)phone andAddress:(NSString*)address;


@end

NS_ASSUME_NONNULL_END
