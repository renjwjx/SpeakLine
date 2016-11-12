//
//  AppDelegate.m
//  SpeakLine
//
//  Created by jinren on 12/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (id)init
{
    self = [super init];
    if (self) {
        self.synth = [[NSSpeechSynthesizer alloc] init];
        [self.synth setDelegate:self];
    }
    return self;
}

- (IBAction)sayIt:(id)sender {
    [self.synth startSpeakingString:self.textField.stringValue];
    [self.startBtn setEnabled:NO];
    [self.stopBtn setEnabled:YES];
}

- (IBAction)stopIt:(id)sender {
    [self.synth stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
    [self.startBtn setEnabled:YES];
    [self.stopBtn setEnabled:NO];
}

@end
