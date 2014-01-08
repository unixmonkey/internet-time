//
//  TimeViewController.h
//  Internet Time
//
//  Created by David Jones on 1/7/14.
//  Copyright (c) 2014 David Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
{
    IBOutlet UILabel *internetTime;
    
}

- (void)updateInternetTime:(NSTimer *)timer;

@property UILocalNotification *localNotification;

@end
