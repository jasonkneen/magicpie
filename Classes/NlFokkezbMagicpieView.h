/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "TiBase.h"
#import "TiUIView.h"
#import "MagicPieLayer.h"
#import "NappPieElement.h"

@interface NlFokkezbMagicpieView : TiUIView {
    PieLayer *pieLayer;
    UIView *pieWrapperView;
}

-(void)render;
-(void)addValues:(id)args;
-(void)deleteValues:(id)args;

@end