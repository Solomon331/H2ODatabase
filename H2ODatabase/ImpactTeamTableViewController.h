//
//  ImpactTeamTableViewController.h
//  H2ODatabase
//
//  Created by Angel Olivera on 2/24/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "LoginViewController.h"
#import "SignUpViewController.h"


@interface ImpactTeamTableViewController : PFQueryTableViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
{
    BOOL firstTime;
    
}
@property (nonatomic, retain) NSMutableArray *kids;

@end
