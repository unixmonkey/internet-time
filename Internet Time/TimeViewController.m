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
    // cancel all existing local notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    // set up local notification service so we can update the badge number
    self.localNotification = [[UILocalNotification alloc] init];
    
    // timer to update internet time every 1000th of a beat
    [NSTimer scheduledTimerWithTimeInterval:0.864 // 1/100th of a .beat is 0.864 seconds
                                     target:self
                                   selector:@selector(updateInternetTime:)
                                   userInfo:nil
                                    repeats:YES];
    
    // timer to update local time every second
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(updateLocalTime:)
                                   userInfo:nil
                                    repeats:YES];
    
    [self createLocalNotifications];
    
}

- (void)createLocalNotifications
{
    float timeInBeats      = self.getTimeInBeats;
    float secondsInOneBeat = 86.4;
    int   notifyLimit      = 64;
    NSLog(@"Beats is now %f", timeInBeats);
    
    // Schedule first notification to happen at the next beat transition
    float internetTimeUntilNextBeat = (1 - fmodf(timeInBeats, 1.0));
    float secondsUntilNextBeat      = (internetTimeUntilNextBeat * secondsInOneBeat);
    NSLog(@"Time until next beat transition: %f .beats %f seconds", internetTimeUntilNextBeat, secondsUntilNextBeat);
    
    // set up local notifications for every .beat from now to Apple's limit of notifications
    NSDate *now = [NSDate date];
    NSDate *nextBeatTime = [now dateByAddingTimeInterval:secondsUntilNextBeat];
    NSLog(@"Last Beat Time: %@", nextBeatTime);
    
    for (int i = 1; i <= notifyLimit; i++) {
        float beatTime   = (timeInBeats + internetTimeUntilNextBeat + i);
        NSDate *clockTime = [NSDate dateWithTimeInterval:secondsInOneBeat*i // add a beat
                                            sinceDate:nextBeatTime];
        NSLog(@"Scheduling notify %d for %f at %@", i, beatTime, clockTime);
        if (i == notifyLimit) {
            self.localNotification.alertBody = @"Your internet timepiece is winding down!\nLaunch now!";
        }
        if (beatTime > 1000) {
            beatTime = (beatTime - 1000.0);
        }
        self.localNotification.applicationIconBadgeNumber = beatTime; // remainder is automatically dropped
        self.localNotification.fireDate = clockTime;
        [[UIApplication sharedApplication] scheduleLocalNotification:self.localNotification];
    }
}

- (float)getTimeInBeats
{
    // Get the number of seconds of the day in UTC/GMT
    // Add 3600 seconds
    // Get modulo to 84000 (seconds in a day)
    // Divide by 86.4 to get swatch time!
    float beats = (((time(NULL)+3600) % 86400) / 86.4);
    return beats;
}

- (void)updateInternetTime:(NSTimer *)timer
{
    float beats = self.getTimeInBeats;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber: beats];
    NSString *labelValue = [NSString stringWithFormat:@"\@%.2f .beats", beats];
    [internetTime setText:labelValue];
}

- (void)updateLocalTime:(NSTimer *)timer
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterLongStyle];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    [localTime setText:currentTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
