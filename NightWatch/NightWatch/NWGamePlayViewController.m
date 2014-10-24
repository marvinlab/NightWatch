//
//  NWGamePlayViewController.m
//  NightWatch
//
//  Created by Marvin Labrador on 10/22/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import "NWGamePlayViewController.h"
#import "NWGhost.h"
#import "NWCross.h"


const int CROSS_POSITION_Y = 250;

@interface NWGamePlayViewController ()

@property (retain, nonatomic) IBOutlet UILabel *highScoreLbl;

@property (retain, nonatomic) NWCross *cross;
@property (retain, nonatomic) NWGhost *ghost;

@property (assign, nonatomic) BOOL crossIsTouched;

@end

@implementation NWGamePlayViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _cross = [[[NWCross alloc]init]autorelease];
    _cross.frame = _cross.Cframe;
    _cross.userInteractionEnabled = TRUE;
    [self.view addSubview:_cross];

    NSTimer *ghostFirer;
    
    ghostFirer = [NSTimer timerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(ghostsArrive:)
                                       userInfo:nil
                                        repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:ghostFirer forMode:NSDefaultRunLoopMode];

}

- (void)viewWillAppear:(BOOL)animated
{

    
//    [self ghostsArrive];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    if ([touch.view isKindOfClass: NWCross.class]) {
        _crossIsTouched = TRUE;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_crossIsTouched){
            UITouch *touch = [[event allTouches]anyObject];
            CGPoint touchPoint = [touch locationInView:self.view];
            CGRect crossFrame = CGRectMake(touchPoint.x - (_cross.CROSS_WIDTH/2),
                                           touchPoint.y - (_cross.CROSS_HEIGHT/2),
                                           _cross.CROSS_WIDTH,
                                           _cross.CROSS_HEIGHT);
        _cross.frame = crossFrame;
        [self checkCollision];
        
        
    }
    

    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_crossIsTouched) {
        _cross.frame = CGRectMake(_cross.CROSS_POSITION_X, [[_cross randomPositions:_cross.arrayPositions] intValue],
                                  _cross.CROSS_WIDTH, _cross.CROSS_HEIGHT);
    }
    _crossIsTouched = FALSE;
}


- (void)dealloc
{
    [_highScoreLbl release];
    [super dealloc];
}

-(void)checkCollision
{
    CGRect incoming = [_ghost.layer.presentationLayer frame];
    
    if (CGRectIntersectsRect(_cross.frame, incoming)) {
        NSLog(@"Intersecting");
    }

}

-(void)ghostsArrive:(NSTimer *)timer
{
    _ghost = [[[NWGhost alloc]init]autorelease];
    _ghost.frame = _ghost.ghostFrame;
    [self.view addSubview:_ghost];
    NSLog(@"Ghost Created");

}

@end
