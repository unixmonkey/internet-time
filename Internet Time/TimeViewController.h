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
    IBOutlet UILabel *localTime;
}

- (void)updateInternetTime:(NSTimer *)timer;
- (void)updateLocalTime:(NSTimer *)timer;
- (void)createLocalNotifications;
- (float)getTimeInBeats;

@property UILocalNotification *localNotification;

@end
