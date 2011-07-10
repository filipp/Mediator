//
//  Convert into QuickTime.h
//  Convert into QuickTime
//
//  Created by Filipp Lepalaan on 10.7.2011.
//  Copyright (c) 2011 __MyCompanyName__, All Rights Reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

@interface Convert_into_QuickTime : AMBundleAction 
{
}

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
