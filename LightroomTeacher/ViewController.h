//
//  ViewController.h
//  LightroomTeacher
//
//  Created by Jesse Angelo on 3/17/15.
//  Copyright (c) 2015 Hollow Leg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController : UIViewController

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;



- (IBAction)playHTTPMovie:(id)sender;
- (IBAction)playLocalMovie:(id)sender;

@end

