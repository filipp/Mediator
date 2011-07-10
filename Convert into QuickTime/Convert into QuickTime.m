//
//  Convert into QuickTime.m
//  Convert into QuickTime
//
//  Created by Filipp Lepalaan on 10.7.2011.
//  Copyright (c) 2011 __MyCompanyName__, All Rights Reserved.
//

#import "Convert into QuickTime.h"

@implementation Convert_into_QuickTime

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{
	// Add your code here, returning the data to be passed to the next action.
	
	NSMutableArray *returnArray = [NSMutableArray arrayWithCapacity:[input count]];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSString *ffmpeg = [[self bundle] pathForResource:@"ffmpeg" ofType:nil];
	NSString *uuid = [[NSProcessInfo processInfo] globallyUniqueString];
	NSLog(@"Using ffmpeg from %@", ffmpeg);
	NSString *outFolder = [NSString stringWithFormat:@"%@/%@", NSTemporaryDirectory(), uuid];
	[fileManager createDirectoryAtPath:outFolder withIntermediateDirectories:NO attributes:nil error:NULL];
	NSLog(@"Output set to: %@", outFolder);
	
	NSUInteger i, count = [input count];
	for (i = 0; i < count; i++)
	{
		NSString *inFile = [input objectAtIndex:i];
		NSString *fileName = [[inFile pathComponents] lastObject];
		NSString *outFile = [NSString stringWithFormat:@"%@/%@.mov", outFolder, fileName];
		NSArray *args = [NSArray arrayWithObjects:@"-y", @"-i", inFile,
						 @"-vcodec", @"copy", @"-acodec", @"alac", outFile, nil];
		NSTask *t = [NSTask launchedTaskWithLaunchPath:ffmpeg arguments:args];
		[t waitUntilExit];
		[returnArray addObject:outFile];
	}
	
	return returnArray;
	
}

@end
