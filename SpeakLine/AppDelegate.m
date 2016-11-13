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
        _synth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        [_synth setDelegate:self];
        _voices = [NSSpeechSynthesizer availableVoices];
        [_voiceTableView setDataSource:self];
        [_voiceTableView setDelegate:self];
        
    }
    return self;
}

- (void)awakeFromNib
{
    NSString *voiceStr = [NSSpeechSynthesizer defaultVoice];
    NSInteger row = [_voices indexOfObject:voiceStr];
    NSIndexSet *indexVoice = [NSIndexSet indexSetWithIndex:row];
    [_voiceTableView selectRowIndexes:indexVoice byExtendingSelection:NO];
    [_voiceTableView scrollRowToVisible:row];
}

#pragma mark table view delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.voices count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSDictionary *v = [NSSpeechSynthesizer attributesForVoice:self.voices[row]];
    return [v objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [self.voiceTableView selectedRow];
    [_synth setVoice:self.voices[row]];
}

- (IBAction)sayIt:(id)sender {
    [self.synth startSpeakingString:self.textField.stringValue];
    [self.startBtn setEnabled:NO];
    [self.stopBtn setEnabled:YES];
    [self.voiceTableView setEnabled:NO];
}

- (IBAction)stopIt:(id)sender {
    [self.synth stopSpeaking];
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
    [self.startBtn setEnabled:YES];
    [self.stopBtn setEnabled:NO];
    [self.voiceTableView setEnabled:YES];
}

@end
