//
//  YouthSpecialist.m
//  H2ODatabase
//
//  Created by Angel Olivera on 2/24/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "YouthSpecialist.h"

@implementation YouthSpecialist

+(UIImage *)getProfilePictureForUser:(PFUser *)user
{
    PFObject *userPhotoObject = [user objectForKey:@"userPhoto"];
    [userPhotoObject fetchIfNeeded];
    PFFile *photoFile = [userPhotoObject objectForKey:@"imageFile"];
    NSData *photoData = [photoFile getData];
    UIImage *photo = [UIImage imageWithData:photoData];
    
    return photo;
}


+(PFUser *)getUserWithUsername:(NSString *)username
{
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:username];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    PFUser *user = [[query findObjects] objectAtIndex:0];
    return user;
}


@end
