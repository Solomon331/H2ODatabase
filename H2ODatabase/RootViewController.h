//
//  RootViewController.h
//  H2ODatabase
//
//  Created by Angel Olivera on 3/20/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "SignUpViewController.h"

@interface RootViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@end
