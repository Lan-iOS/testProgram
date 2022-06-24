//
//  MyGreeter_Improved.h
//  test
//
//  Created by Lan on 2022/6/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface MyGreeter_Improved : NSObject

/*!**生成单例***/
+ (MyGreeter_Improved *)sharedVariables;

+ (void)sendMessage;

@end

NS_ASSUME_NONNULL_END
