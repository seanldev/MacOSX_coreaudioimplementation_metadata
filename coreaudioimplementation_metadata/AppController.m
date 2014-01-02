//
//  AppController.m
//
//
//  Created by Sean Liu on 10/21/13.
//  Copyright (c) 2013 Sean Liu. All rights reserved.
//

#import "AppController.h"
#import <AudioToolbox/AudioToolbox.h>


@implementation AppController

@synthesize Seq1, Seq2, Seq3;
@synthesize audioFilePath;
@synthesize audioURL;



-(IBAction)Sequence:(id)sender{
    
    //Your audio files will be installed differently. You can enter their path here:
    
    NSString *newconstant = @"/Users/sean/Documents/xcodeprojects/macos_applications/coreaudioimplementation_metadata/coreaudioimplementation_metadata/k425.wav";
    
    const char *constant = [newconstant UTF8String];
    
    audioFilePath = [[NSString stringWithUTF8String:constant] stringByExpandingTildeInPath];
    audioURL = [NSURL fileURLWithPath:audioFilePath];
    
    [self printSongInfo];
    
    Seq1 = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"k425" ofType:@"wav"] byReference:NO];
    
    [Seq1 stop];
    [Seq1 play];

}

-(IBAction)Sequence2:(id)sender{
    
    //Your audio files will be installed differently. You can enter their path here:
    
    NSString *newconstant = @"/Users/sean/Documents/xcodeprojects/macos_applications/coreaudioimplementation_metadata/coreaudioimplementation_metadata/k550.wav";
    
    const char *constant = [newconstant UTF8String];
    
    audioFilePath = [[NSString stringWithUTF8String:constant] stringByExpandingTildeInPath];
    audioURL = [NSURL fileURLWithPath:audioFilePath];
    
    [self printSongInfo];

    Seq2 = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"k550" ofType:@"wav"] byReference:NO];
    
    [Seq2 stop];

    [Seq2 play];

    
}
-(IBAction)Sequence3:(id)sender{
    
    //Your audio files will be installed differently. You can enter their path here:
    
    NSString *newconstant = @"/Users/sean/Documents/xcodeprojects/macos_applications/coreaudioimplementation_metadata/coreaudioimplementation_metadata/k552.wav";
    
    const char *constant = [newconstant UTF8String];
    
    audioFilePath = [[NSString stringWithUTF8String:constant] stringByExpandingTildeInPath];
    audioURL = [NSURL fileURLWithPath:audioFilePath];

    
    [self printSongInfo];
    
    Seq3 = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"k552" ofType:@"wav"] byReference:NO];
    
    [Seq3 stop];

    [Seq3 play];
    
}


-(IBAction)Stop:(id)sender{
    [label setStringValue:@"Wav Samples Stopped"];

        [Seq1 stop];
        [Seq2 stop];
        [Seq3 stop];
    
        //to stop a second time:
        [Seq1 stop];
        [Seq2 stop];
        [Seq3 stop];
    
}

-(void) printSongInfo {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; 
    
    AudioFileID audioFile;
    

    OSStatus theErr = noErr;
    
    
    theErr = AudioFileOpenURL((CFURLRef) audioURL,
                              kAudioFileReadPermission,
                              0,
                              &audioFile);
    assert (theErr == noErr); 
    
    UInt32 dictionarySize = 0;
    
    theErr = AudioFileGetPropertyInfo (audioFile,
                                       kAudioFilePropertyInfoDictionary,
                                       &dictionarySize,
                                       0);
    assert (theErr == noErr);
    
    CFDictionaryRef dictionary;
    theErr = AudioFileGetProperty (audioFile,
                                   kAudioFilePropertyInfoDictionary,
                                   &dictionarySize,
                                   &dictionary);
    assert (theErr == noErr);
    

    
    NSDictionary *displayable = (__bridge NSDictionary*)dictionary;

    NSString *displayable2 =[NSString stringWithFormat:@"%@", displayable];
    
    
       
    [label setStringValue:displayable2];
    CFRelease (dictionary);
    theErr = AudioFileClose (audioFile);
    assert(theErr == noErr);
    
    
    [pool drain]; 

}

 
@end
