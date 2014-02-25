//
//  DetailViewController.h
//  H2ODatabase
//
//  Created by Angel Olivera on 2/24/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
