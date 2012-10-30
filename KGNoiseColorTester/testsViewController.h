//
//  testsViewController.h
//  KGNoiseColorTester
//
//  Created by Eric Ellett on 10/28/12.
//  Copyright (c) 2012 Eric Ellett. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface testsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSel;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *opSlider;
@property (weak, nonatomic) IBOutlet UISlider *noSlider;

@property (weak, nonatomic) IBOutlet UILabel *redVal;
@property (weak, nonatomic) IBOutlet UILabel *greenVal;
@property (weak, nonatomic) IBOutlet UILabel *blueVal;
@property (weak, nonatomic) IBOutlet UILabel *opVal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bgTypeSel;
@property (weak, nonatomic) IBOutlet UILabel *noVal;

@property CGFloat BGR;
@property CGFloat BGG;
@property CGFloat BGB;
@property CGFloat BGO;
@property CGFloat ABGR;
@property CGFloat ABGG;
@property CGFloat ABGB;
@property CGFloat ABGO;
@property CGFloat NOP;
@property CGBlendMode bMode;

- (IBAction)optionsChanged:(id)sender;
- (IBAction)bgTypeSelChanged:(id)sender;

- (void)updateView;




@end
