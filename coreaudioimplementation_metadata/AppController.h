//
//  AppController.h
//
//  Created by Sean Liu on 10/21/13.
//  Copyright (c) 2013 Sean Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Appkit/Appkit.h>
#import <AudioToolbox/AudioToolbox.h>


@interface AppController : NSObject{
@private
    IBOutlet NSTextField *label;
    
}

@property (strong) NSSound *Seq1,
                           *Seq2,
                           *Seq3;

@property (retain) NSString *audioFilePath;
@property (retain) NSURL *audioURL;


-(IBAction)Sequence:(id)sender;
-(IBAction)Sequence2:(id)sender;
-(IBAction)Sequence3:(id)sender;
-(IBAction)Stop:(id)sender;

-(void) printSongInfo;
@end
