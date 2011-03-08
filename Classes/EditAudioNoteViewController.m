#import "EditAudioNoteViewController.h"

@implementation EditAudioNoteViewController

@synthesize noteTitle, audioNote, recordButton, stopButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self.view setBackgroundColor:[UIColor colorWithRed:.992 green:.886 blue:.286 alpha:.50]];
	
	self.noteTitle.text = [audioNote title];
	
    recordEncoding = ENC_AAC;
}

-(IBAction) startRecording
{
	NSLog(@"startRecording");
	[audioRecorder release];
	audioRecorder = nil;
	
	// Init audio with record capability
	AVAudioSession *audioSession = [AVAudioSession sharedInstance];
	[audioSession setCategory:AVAudioSessionCategoryRecord error:nil];
	
	NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] initWithCapacity:10];
	if(recordEncoding == ENC_PCM)
	{
		[recordSettings setObject:[NSNumber numberWithInt: kAudioFormatLinearPCM] forKey: AVFormatIDKey];
		[recordSettings setObject:[NSNumber numberWithFloat:44100.0] forKey: AVSampleRateKey];
		[recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
		[recordSettings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
		[recordSettings setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
		[recordSettings setObject:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];   
	}
	else
	{
		NSNumber *formatObject;
		
		switch (recordEncoding) {
			case (ENC_AAC): 
				formatObject = [NSNumber numberWithInt: kAudioFormatMPEG4AAC];
				break;
			case (ENC_ALAC):
				formatObject = [NSNumber numberWithInt: kAudioFormatAppleLossless];
				break;
			case (ENC_IMA4):
				formatObject = [NSNumber numberWithInt: kAudioFormatAppleIMA4];
				break;
			case (ENC_ILBC):
				formatObject = [NSNumber numberWithInt: kAudioFormatiLBC];
				break;
			case (ENC_ULAW):
				formatObject = [NSNumber numberWithInt: kAudioFormatULaw];
				break;
			default:
				formatObject = [NSNumber numberWithInt: kAudioFormatAppleIMA4];
		}
		
		[recordSettings setObject:formatObject forKey: AVFormatIDKey];
		[recordSettings setObject:[NSNumber numberWithFloat:44100.0] forKey: AVSampleRateKey];
		[recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
		[recordSettings setObject:[NSNumber numberWithInt:12800] forKey:AVEncoderBitRateKey];
		[recordSettings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
		[recordSettings setObject:[NSNumber numberWithInt: AVAudioQualityHigh] forKey: AVEncoderAudioQualityKey];
	}
	
	NSError *error = nil;
	audioRecorder = [[ AVAudioRecorder alloc] initWithURL:[audioNote body] settings:recordSettings error:&error];
	
	if ([audioRecorder prepareToRecord] == YES){
		[audioRecorder record];
	}else {
		int errorCode = CFSwapInt32HostToBig ([error code]); 
		NSLog(@"Error: %@ [%4.4s])" , [error localizedDescription], (char*)&errorCode); 
	}
	NSLog(@"recording to: %@", [audioNote body]);
}

-(IBAction) stopRecording
{
	NSLog(@"stopRecording");
	[audioRecorder stop];
	NSLog(@"stopped");
}

-(IBAction) playRecording
{
	NSLog(@"playRecording");
	// Init audio with playback capability
	AVAudioSession *audioSession = [AVAudioSession sharedInstance];
	[audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[audioNote body] error:&error];
	audioPlayer.numberOfLoops = 0;
	[audioPlayer play];
	NSLog(@"playing from: %@", [audioNote body]);
}

-(IBAction) stopPlaying
{
	NSLog(@"stopPlaying");
	[audioPlayer stop];
	NSLog(@"stopped");
}

- (void) viewWillAppear:(BOOL)animated
{
	self.noteTitle.text = [audioNote title];
}

- (void) viewWillDisappear:(BOOL)animated
{
	[audioNote setTitle: noteTitle.text];
}

- (void)viewDidUnload {
    [audioNote setTitle: noteTitle.text];
	[super viewDidUnload];    
}

- (void)dealloc
{
	[audioPlayer release];
	[audioRecorder release];
	[super dealloc];
}

@end