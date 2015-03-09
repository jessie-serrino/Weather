//
//  ImageDownloader.h
//  Weather
//
//  Created by Jessie Serrino on 3/9/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageDownloader : NSObject

+ (void) imageWithURL: (NSString *) url
      completionBlock: (void (^) (UIImage * image)) completionBlock;

@end
