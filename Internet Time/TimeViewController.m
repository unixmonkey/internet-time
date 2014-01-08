//
//  TimeViewController.m
//  Internet Time
//
//  Created by David Jones on 1/7/14.
//  Copyright (c) 2014 David Jones. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set up local notification service so we can update the badge number
    self.localNotification = [[UILocalNotification alloc] init];
    
    // set up timer to run every 1000th of a beat
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.864 // 1/100th of a .beat is 0.864 seconds
                                     target:self
                                   selector:@selector(updateInternetTime:) userInfo:nil
                                    repeats:YES];
    
}

- (void)updateInternetTime:(NSTimer *)timer
{
    // Get the number of seconds of the day in UTC/GMT
    // Add 3600 seconds
    // Get modulo to 8400 (seconds in a day)
    // Divide by 86.4 to get swatch time!
    float beats = (((time(NULL)+3600) % 86400) / 86.4);
    
    [self.localNotification setApplicationIconBadgeNumber:beats];
    
    NSString *labelValue = [NSString stringWithFormat:@"\@%.2f .beats", beats];
    [internetTime setText:labelValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
