//
//  NWCross.h
//  NightWatch
//
//  Created by Marvin Labrador on 10/23/14.
//  Copyright (c) 2014 Marvin Labrador. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NWCross : UIImageView

@property (assign, nonatomic) CGRect crossFrame;
@property (retain, nonatomic) NSNumber *CROSS_POSITION_Y1;
@property (retain, nonatomic) NSNumber *CROSS_POSITION_Y2;
@property (retain, nonatomic) NSNumber *CROSS_POSITION_Y3;
@property (assign, nonatomic) NSInteger CROSS_HEIGHT;
@property (assign, nonatomic) NSInteger CROSS_WIDTH;
@property (assign, nonatomic) NSInteger CROSS_POSITION_X;
@property (assign, nonatomic) NSInteger randomPosition;
@property (assign, nonatomic) NSMutableArray *arrayPositions;

- (NSInteger)randomPositions:(NSMutableArray *)array;

@end
