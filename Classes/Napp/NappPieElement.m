/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "NappPieElement.h"

@implementation NappPieElement

- (id)copyWithZone:(NSZone *)zone
{
    NappPieElement *copyElem = [super copyWithZone:zone];
    copyElem.title = self.title;
    copyElem.itemId = self.itemId;
    
    return copyElem;
}

@end
