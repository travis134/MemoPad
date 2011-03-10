//
//  EditAudioNoteViewController.h
//  MemoPad
//
//  Created by travis sein on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Note.h"
#import "AudioNote.h"

@interface EditAudioNoteViewController : UIViewController {
	AVAudioPlayer *audioPlayer;
	AVAudioRecorder *audioRecorder;
	int recordEncoding;
	enum
	{
		ENC_AAC = 1,
		ENC_ALAC = 2,
		ENC_IMA4 = 3,
		ENC_ILBC = 4,
		ENC_ULAW = 5,
		ENC_PCM = 6,
	} encodingTypes;
	UITextField *noteTitle;
	UIButton *recordButton;
	UIButton *stopButton;
	AudioNote *audioNote;
}

@property (nonatomic, retain) IBOutlet UITextField *noteTitle;
@property (nonatomic, retain) AudioNote *audioNote;
@property (nonatomic, retain) IBOutlet UIButton *recordButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;

-(IBAction) startRecording;
-(IBAction) stopRecording;
-(IBAction) playRecording;
-(IBAction) stopPlaying;

@end