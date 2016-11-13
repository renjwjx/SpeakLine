//
//  AppDelegate.h
//  SpeakLine
//
//  Created by jinren on 12/11/2016.
//  Copyright © 2016 jinren. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSSpeechSynthesizerDelegate, NSTableViewDataSource, NSTableViewDelegate>
@property (weak) IBOutlet NSTextField *textField;

@property (strong) NSSpeechSynthesizer *synth;

@property (weak) IBOutlet NSButton *startBtn;
@property (weak) IBOutlet NSButton *stopBtn;

@property (strong) NSArray *voices;
@property (strong) IBOutlet NSTableView *voiceTableView;

@end

