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

    [self.redSlider setValue:0.814];
    [self.greenSlider setValue:0.798];
    [self.blueSlider setValue:0.747];
    [self.opSlider setValue:1];
    [self.noSlider setValue:0.3];
    [self.typeSel setSelectedSegmentIndex:2];
    self.ABGR = 1;
    self.ABGG = .986;
    self.ABGB = .945;
    self.ABGO = 1;
    self.bMode = kCGBlendModeScreen;
    self.currType = 2;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BlendModeGalleryViewController *bModeGalVC = (BlendModeGalleryViewController *)[segue destinationViewController];
    bModeGalVC.delegate = self;
    
    
}


-(void)viewDidAppear:(BOOL)animated{
    [self updateView];
    NSLog(@"Test1");
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
    [self.testView insertSubview:[self getGeneratedViewFromCurrentConfig] atIndex:1];

}

-(UIView *)getGeneratedViewFromCurrentConfig{
    UIView *generatedView = NULL;
    switch (self.currType){
        case 0:
            generatedView = [self updateRegView];
            break;
        case 1:
            generatedView = [self updateLinView];
            break;
        case 2:
            generatedView = [self updateRadView];
            break;
        default:
            break;
            
    }
    
    return generatedView;
    
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
    self.currType = self.typeSel.selectedSegmentIndex;
}

-(void)updateLabels{
    self.redVal.text = [NSString stringWithFormat:@"%.3f", self.redSlider.value];
    self.greenVal.text = [NSString stringWithFormat:@"%.3f", self.greenSlider.value];
    self.blueVal.text = [NSString stringWithFormat:@"%.3f", self.blueSlider.value];
    self.opVal.text = [NSString stringWithFormat:@"%.3f", self.opSlider.value];
    self.noVal.text = [NSString stringWithFormat:@"%.3f", self.noSlider.value];
}
-(UIView *)updateRegView{
    [self.bgTypeSel setSelectedSegmentIndex:0];
    [self updateVals];
    [self.bgTypeSel setEnabled:FALSE];
    KGNoiseView *noiseView = [[KGNoiseView alloc] initWithFrame:self.testView.bounds];
    noiseView.backgroundColor = [UIColor colorWithRed:self.BGR green:self.BGG blue:self.BGB alpha:self.BGO];
    noiseView.noiseOpacity = self.NOP;
    noiseView.noiseBlendMode = self.bMode;
    return noiseView;
    
}
-(UIView *)updateLinView{
    [self.bgTypeSel setEnabled:TRUE];
    KGNoiseLinearGradientView *noiseView = [[KGNoiseLinearGradientView alloc] initWithFrame:self.testView.bounds];
    noiseView.backgroundColor = [UIColor colorWithRed:self.BGR green:self.BGG blue:self.BGB alpha:self.BGO];
    noiseView.alternateBackgroundColor = [UIColor colorWithRed:self.ABGR green:self.ABGG blue:self.ABGB alpha:self.ABGO];
    noiseView.noiseOpacity = self.NOP;
    noiseView.noiseBlendMode = self.bMode;
    return noiseView;
    
}
-(UIView *)updateRadView{
    [self.bgTypeSel setEnabled:TRUE];
    KGNoiseRadialGradientView *noiseView = [[KGNoiseRadialGradientView alloc] initWithFrame:self.testView.bounds];
    noiseView.backgroundColor = [UIColor colorWithRed:self.BGR green:self.BGG blue:self.BGB alpha:self.BGO];
    noiseView.alternateBackgroundColor = [UIColor colorWithRed:self.ABGR green:self.ABGG blue:self.ABGB alpha:self.ABGO];
    noiseView.noiseOpacity = self.NOP;
    noiseView.noiseBlendMode = self.bMode;
    return noiseView;
    
}

//Delegate Method
-(void)SetTestViewBlendMode:(CGBlendMode)bMode{
    self.bMode = bMode;
    [self updateView]; //Update view before modal is dismissed
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(UIView *)ReturnViewForGallery{
    return [self getGeneratedViewFromCurrentConfig];
    
}

@end
