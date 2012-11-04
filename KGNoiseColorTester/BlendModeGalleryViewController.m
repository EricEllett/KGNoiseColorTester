//
//  BlendModeGalleryViewController.m
//  KGNoiseColorTester
//
//  Created by Eric Ellett on 10/30/12.
//  Copyright (c) 2012 Eric Ellett. All rights reserved.
//

#import "BlendModeGalleryViewController.h"
#import "KGNoise.h"



@implementation BlendModeGalleryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.blendModeLabelArray = [[NSArray alloc] initWithObjects:@"Normal",
                           @"Multiply",
                           @"Screen",
                           @"Overlay",
                           @"Darken",
                           @"Lighten",
                           @"ColorDodge",
                           @"ColorBurn",
                           @"SoftLight",
                           @"HardLight",
                           @"Difference",
                           @"Exclusion",
                           @"Hue",
                           @"Saturation",
                           @"Color",
                           @"Luminosity",
                           @"Clear",			
                           @"Copy",			
                           @"SourceIn",		
                           @"SourceOut",	
                           @"SourceAtop",		
                           @"DestinationOver",	
                           @"DestinationIn",		
                           @"DestinationOut",		
                           @"DestinationAtop",	
                           @"XOR",		
                           @"PlusDarker",		
                           @"PlusLighter", nil];
    
	// Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated
{
    
    //[self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return [self.blendModeLabelArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"blendModeCell" forIndexPath:indexPath];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:2];
    titleLabel.text = [self.blendModeLabelArray objectAtIndex:indexPath.row];
    UIView *cellView = (UIView *)[cell viewWithTag:1];
    // *KGcellView
    KGNoiseView *currentView = (KGNoiseView *)[self.delegate ReturnViewForGallery];
    currentView.noiseBlendMode = indexPath.row;
    [cellView insertSubview:currentView atIndex:0];
    

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"I'm in collection view del");
    [self.delegate SetTestViewBlendMode:indexPath.row];
}

    




@end
