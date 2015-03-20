//
//  ViewController.m
//  LightroomTeacher
//
//  Created by Jesse Angelo on 3/17/15.
//  Copyright (c) 2015 Hollow Leg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSBundle *mainBundle;
NSString *myFile;
NSURL *myFileURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSURL *vidPath = [[NSURL alloc]initFileURLWithPath:@"TNG.mp4"];
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:vidPath];
    
    [player prepareToPlay];
    [player.view setFrame: CGRectMake(0, 0, 544, 400)];  // player's frame must match parent's
    [self.view addSubview: player.view];
    
    [player play];
     */
    mainBundle = [NSBundle mainBundle];
    myFile = [mainBundle pathForResource: @"movie" ofType: @"mov"];
    myFileURL = [[NSURL alloc]initFileURLWithPath:myFile];
    //NSLog(@"Main bundle path: %@", mainBundle);
    //NSLog(@"myFile path: %@", myFile);
}

-(void)playMovie:(id)sender
{

    //NSURL *url = [NSURL URLWithString: @"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];
    //_moviePlayer =  [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    //NSURL *url = [[NSURL alloc]initFileURLWithPath: @"../movie.mov"];
    _moviePlayer =  [[MPMoviePlayerController alloc] initWithContentURL:myFileURL];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_moviePlayer];
    
    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    _moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:_moviePlayer.view];
    [_moviePlayer setFullscreen:YES animated:YES];
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
