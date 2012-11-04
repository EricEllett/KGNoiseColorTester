//
//  BlendModeGalleryViewController.h
//  KGNoiseColorTester
//
//  Created by Eric Ellett on 10/30/12.
//  Copyright (c) 2012 Eric Ellett. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KGNoiseView;

@protocol TestViewControllerDelegate <NSObject>
@optional
-(void)SetTestViewBlendMode:(CGBlendMode)bMode;
-(KGNoiseView *)ReturnViewForGallery;
@end








@interface BlendModeGalleryViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic,weak) id<TestViewControllerDelegate> delegate;
@property(nonatomic, strong) NSArray *blendModeLabelArray;
@end
