//
//  MyProtocol.h
//  TableViewDemo
//
//  Created by Adham Samer on 28/12/2022.
//

#import <Foundation/Foundation.h>
#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MyProtocol <NSObject>

-(Person*) getPerson;

@end

NS_ASSUME_NONNULL_END
