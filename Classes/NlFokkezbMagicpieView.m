/**
 * Module developed by Napp ApS
 * www.napp.dk
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "NlFokkezbMagicpieView.h"

@implementation NlFokkezbMagicpieView

-(void)dealloc
{
    RELEASE_TO_NIL(pieLayer);
    RELEASE_TO_NIL(pieWrapperView);
    
    [super dealloc];
}

-(UIView *)pieWrapperView
{
    if(pieLayer == nil){
        
        // create chart
        pieLayer = [[PieLayer alloc] init];
        pieLayer.frame = [self bounds];
        [self.layer insertSublayer:pieLayer atIndex:0];
        
        // touch listener
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
    }
    
    return self;
}


- (void)handleTap:(UITapGestureRecognizer*)tap
{
    
    if(tap.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint pos = [tap locationInView:tap.view];
    NappPieElement* tappedElem = (NappPieElement*)[pieLayer pieElemInPoint:pos];
    
    if(!tappedElem)
        return;
    
    if(tappedElem.centrOffset > 0)
        tappedElem = nil;
    
    if([self.proxy _hasListeners:@"selected"]){
        NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:
                               NUMFLOAT(tappedElem.val),@"value",
                               tappedElem.title,@"title",
                               tappedElem.itemId,@"itemid",
                               nil];
        [self.proxy fireEvent:@"selected" withObject:event];
    }
    
    
}

-(void)render
{
    [self pieWrapperView];
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    [self setFrame:bounds];
    [super frameSizeChanged:frame bounds:bounds];
    
    if(pieLayer != nil){
        pieLayer.frame = [self bounds];
    }
}


-(void)setValues_:(id)args
{
    ENSURE_UI_THREAD(setValues_, args);
    
    NSMutableArray *elements = [[NSMutableArray alloc] init];
    for (NSDictionary *object in args) {
        
        // create pie chart item
        NappPieElement *item = [NappPieElement pieElementWithValue: [TiUtils floatValue:@"value" properties:object def:1.0f] color:[[TiUtils colorValue:@"color" properties:object] _color]];
        
        // add title
        item.title = [TiUtils stringValue:@"title" properties:object def:@""];
        
        // add itemId
        item.itemId = [TiUtils stringValue:@"itemid" properties:object def:@""];
        
        // push it
        [elements addObject:item];
        
    }
    [pieLayer addValues:elements animated:NO];
}


-(void)addValues:(id)args
{
    ENSURE_UI_THREAD(addValues, args);
    
    NSMutableArray *elements = [[NSMutableArray alloc] init];
    for (NSDictionary *object in args) {
        
        // create pie chart item
        NappPieElement *item = [NappPieElement pieElementWithValue: [TiUtils floatValue:@"value" properties:object def:1.0f] color:[[TiUtils colorValue:@"color" properties:object] _color]];
        
        // add title
        item.title = [TiUtils stringValue:@"title" properties:object def:@""];
        
        // add itemId
        item.itemId = [TiUtils stringValue:@"itemid" properties:object def:@""];
        
        // push it
        [elements addObject:item];
    }
    [pieLayer addValues:elements animated:NO];
}


-(void)deleteValues:(id)args
{
    ENSURE_UI_THREAD(deleteValues, args);
    
    NSMutableArray *elements = [[NSMutableArray alloc] init];
    for (NSDictionary *object in args) {
        int index = [TiUtils intValue:@"index" properties:object def:1];
        [elements addObject:pieLayer.values[index]];
    }
    
    [pieLayer deleteValues:elements animated:YES];
    
}


-(void)setAngles_:(id)args
{
    ENSURE_UI_THREAD(setAngles_, args);
    [pieLayer setStartAngle:[TiUtils floatValue:@"startAngle" properties:args def:0.0f] endAngle:[TiUtils floatValue:@"endAngle" properties:args def:360.0f] animated:[TiUtils boolValue:@"animated" properties:args def:YES]];
}

-(void)setMaxRadius_:(id)args
{
    ENSURE_UI_THREAD(setMaxRadius_, args);
    [pieLayer setMaxRadius:[TiUtils floatValue:args def:100.0f]];
}

-(void)setMinRadius_:(id)args
{
    ENSURE_UI_THREAD(setMinRadius_, args);
    [pieLayer setMinRadius:[TiUtils floatValue:args def:0.0f]];
}

-(void)setAnimationDuration_:(id)args
{
    ENSURE_UI_THREAD(setAnimationDuration_, args);
    [pieLayer setAnimationDuration:[TiUtils floatValue:args def:0.5f]];
}

-(void)setShowTitles_:(id)args
{
    ENSURE_UI_THREAD(setShowTitles_, args);
    [pieLayer setShowTitles:[TiUtils intValue:args def:1]];
}


-(void)refresh:(id)unused
{
    [pieLayer setNeedsDisplay];
}


@end