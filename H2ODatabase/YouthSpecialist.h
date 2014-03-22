//
//  YouthSpecialist.h
//  H2ODatabase
//
//  Created by Angel Olivera on 2/24/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface YouthSpecialist : NSObject <PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate>

+(UIImage *)getProfilePictureForUser:(PFUser *)user;
+(PFUser *)getUserWithUsername:(NSString *)username;

@end
