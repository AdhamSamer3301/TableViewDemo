//
//  Person.m
//  TableViewDemo
//
//  Created by Adham Samer on 28/12/2022.
//

#import "Person.h"

@implementation Person
- (void)setFriend_WithName:(NSString *)name andEmail:(NSString *)email andAge:(int)age andPhone:(int)phone andAddress:(NSString *)address{
    
    [self setAddress:address];
    [self setName:name];
    [self setEmail:email];
    [self setAge:age];
    [self setPhone:phone];
}
@end
