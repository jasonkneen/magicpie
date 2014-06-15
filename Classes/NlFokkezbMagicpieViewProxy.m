/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "NlFokkezbMagicpieViewProxy.h"
#import "NlFokkezbMagicpieView.h"

@implementation NlFokkezbMagicpieViewProxy


-(id)init
{
    [(NlFokkezbMagicpieView*)[self view] render];
	return [super init];
}

# pragma public interface

-(void)addValues:(id)args {
    TiThreadPerformOnMainThread(^{[(NlFokkezbMagicpieView*)[self view] addValues:args];}, NO);
}

-(void)deleteValues:(id)args {
    TiThreadPerformOnMainThread(^{[(NlFokkezbMagicpieView*)[self view] deleteValues:args];}, NO);
}


@end