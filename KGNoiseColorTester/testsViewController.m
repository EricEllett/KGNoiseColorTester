//
//  testsViewController.m
//  KGNoiseColorTester
//
//  Created by Eric Ellett on 10/28/12.
//  Copyright (c) 2012 Eric Ellett. All rights reserved.
//

#import "testsViewController.h"
#import "KGNoise.h"


@implementation testsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.redSlider setValue:0.814 animated:YES];
    [self.greenSlider setValue:0.798 animated:YES];
    [self.blueSlider setValue:0.747 animated:YES];
    [self.opSlider setValue:1 animated:YES];
    [self.noSlider setValue:0.3 animated:YES];
    self.ABGR = 1;
    self.ABGG = .986;
    self.ABGB = .945;
    self.ABGO = 1;
    self.bMode = kCGBlendModeScreen;
    [self.typeSel setSelectedSegmentIndex:2];
    [self updateView];
    [self updateView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)optionsChanged:(id)sender {
    
    [self updateView];
    
}

- (IBAction)bgTypeSelChanged:(id)sender {
    if (self.bgTypeSel.selectedSegmentIndex) {
        //Load Alt
        [self.redSlider setValue:self.ABGR animated:YES];
        [self.greenSlider setValue:self.ABGG animated:YES];
        [self.blueSlider  setValue:self.ABGB animated:YES];
        [self.opSlider setValue:self.ABGO animated:YES];
    }else{
        [self.redSlider setValue:self.BGR animated:YES];
        [self.greenSlider setValue:self.BGG animated:YES];
        [self.blueSlider  setValue:self.BGB animated:YES];
        [self.opSlider setValue:self.BGO animated:YES];
    }
    [self updateLabels];
}

- (void)updateView{
    
    NSArray *viewsToRemove = [self.testView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    [self updateVals];
    [self updateLabels];
    
    switch (self.typeSel.selectedSegmentIndex){
        case 0:
            [self updateRegView];
            break;
        case 1:
            [self updateLinView];
            break;
        case 2:
            [self updateRadView];
            break;
        default:
            break;
            
    }

}

-(void)updateVals{
    if (self.bgTypeSel.selectedSegmentIndex) {
        self.ABGR = self.redSlider.value;
        self.ABGG = self.greenSlider.value;
        self.ABGB = self.blueSlider.value;
        self.ABGO = self.opSlider.value;
    }else{
        self.BGR = self.redSlider.value;
        self.BGG = self.greenSlider.value;
        self.BGB = self.blueSlider.value;
        self.BGO = self.opSlider.value;
    }
    self.NOP = self.noSlider.value;
}

-(void)updateLabels{
    self.redVal.text = [NSString stringWithFormat:@"%.3f", self.redSlider.value];
    self.greenVal.text = [NSString stringWithFormat:@"%.3f", self.greenSlider.value];
    self.blueVal.text = [NSString stringWithFormat:@"%.3f", self.blueSlider.value];
    self.opVal.text = [NSString stringWithFormat:@"%.3f", self.opSlider.value];
    self.noVal.text = [NSString stringWithFormat:@"%.3f", self.noSlider.value];
}
-(void)updateRegView{
    [self.bgTypeSel setSelectedSegmentIndex:0];
    [self updateVals];
    [self.bgTypeSel setEnabled:FALSE];
    KGNoiseView *Noiseview = [[KGNoiseView alloc] initWithFrame:self.testView.bounds];
    Noiseview.backgroundColor = [UIColor colorWithRed:self.BGR green:self.BGG blue:self.BGB alpha:self.BGO];
    Noiseview.noiseOpacity = self.NOP;
    Noiseview.noiseBlendMode = self.bMode;
    [self.testView insertSubview:Noiseview atIndex:1];
    
    
}
-(void)updateLinView{
    [self.bgTypeSel setEnabled:TRUE];
    KGNoiseLinearGradientView *Noiseview = [[KGNoiseLinearGradientView alloc] initWithFrame:self.testView.bounds];
    Noiseview.backgroundColor = [UIColor colorWithRed:self.BGR green:self.BGG blue:self.BGB alpha:self.BGO];
    Noiseview.alternateBackgroundColor = [UIColor colorWithRed:self.ABGR green:self.ABGG blue:self.ABGB alpha:self.ABGO];
    Noiseview.noiseOpacity = self.NOP;
    Noiseview.noiseBlendMode = self.bMode;
    [self.testView insertSubview:Noiseview atIndex:1];
    
}
-(void)updateRadView{
    [self.bgTypeSel setEnabled:TRUE];
    KGNoiseRadialGradientView *Noiseview = [[KGNoiseRadialGradientView alloc] initWithFrame:self.testView.bounds];
    Noiseview.backgroundColor = [UIColor colorWithRed:self.BGR green:self.BGG blue:self.BGB alpha:self.BGO];
    Noiseview.alternateBackgroundColor = [UIColor colorWithRed:self.ABGR green:self.ABGG blue:self.ABGB alpha:self.ABGO];
    Noiseview.noiseOpacity = self.NOP;
    Noiseview.noiseBlendMode = self.bMode;
    [self.testView insertSubview:Noiseview atIndex:1];
    
}

@end
