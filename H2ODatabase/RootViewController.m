//
//  RootViewController.m
//  H2ODatabase
//
//  Created by Angel Olivera on 3/20/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "RootViewController.h"
#import "ImpactTeamTableViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    // Instantiate our custom log in view controller
    //LoginViewController *login = [[LoginViewController alloc]init];
    // Create the log in view controller
    LoginViewController *login = [[LoginViewController alloc] init];
    if (![PFUser currentUser]) { // No user logged in
        
        
        [login setDelegate:self]; // Set ourselves as the delegate
        
        login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton |PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton;
        
        
        
        
        // Create the sign up view controller
        SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        
        // Assign our sign up controller to be displayed from the login controller
        [login setSignUpController:signUpViewController];
        
        
        
        // Present the log in view controller
        [self presentViewController:login animated:YES completion:NULL];
        
    }
    else{
        [self logInViewController:login didLogInUser:[PFUser currentUser]];
        sleep(0.5);
        //[self loadData];
    }
//    ImpactTeamTableViewController *controller = [[ImpactTeamTableViewController alloc]init];
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    //self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
//    [self.window makeKeyAndVisible];

    
}

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}
// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

//    //Creates class record and saves users information in Parse.
//    PFObject *record = [PFObject objectWithClassName:@"Records"];
//    [record setObject:name.text forKey:@"Name"];
//    [record setObject:email.text forKey:@"Email"];
//    [record setObject:pickChallenge.text forKey:@"Challenge"];
//    [record setObject:translation.text forKey:@"Translation"];
//
//
//    //Save Record
//    [record save];
//}

/********************
 *     DELEGATES    *
 ********************/


-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissModalViewControllerAnimated:YES];
    ImpactTeamTableViewController *controller = [[ImpactTeamTableViewController alloc]init];
//    [self.view addSubview:controller.tableView];

    [self.navigationController pushViewController:controller animated:YES];
}
-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    
    
    //Variables to pull information from parse and put in record database
    
    
    NSString * userName = [[PFUser currentUser]objectForKey:@"username"]; //@"Angel"; //[user objectForKey:@"username"];
    NSString * userEmail = [[PFUser currentUser]objectForKey:@"specialistEmail"];
    //PFObject *user1 = [[PFObject alloc]init];
    
   // AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    // appDelegate.record = [PFObject objectWithClassName:@"Christians"];
    
    //    //Creates class record and saves users information in Parse.
    //    [appDelegate.record setObject:userName forKey: @"Username"];
    //    [appDelegate.record setObject:userEmail forKey:@"Email"];
    //    [appDelegate.record setObject:challenge forKey:@"Challenge"];
    //    [appDelegate.record setObject:[NSNumber numberWithInt:days] forKey:@"Day"];
    
    // [record setObject:translation.text forKey:@"Translation"];
    //   [appDelegate.record save];
    
    //    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
    //                                message:userName
    //                               delegate:nil
    //                      cancelButtonTitle:@"ok"
    //                      otherButtonTitles:nil] show];
    
    
    
    //    //    //Creates class record and saves users information in Parse.
    PFObject *record = [PFObject objectWithClassName:@"Specialist"];
    [record setObject:userName forKey: @"specialistName"];
    [record setObject:userEmail forKey:@"Email"];
    //    [record setObject:challenge forKey:@"Challenge"];
    //    // [record setObject:translation.text forKey:@"Translation"];
    [record save];
    
    [self dismissModalViewControllerAnimated:YES];
}
-(void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController
{
    [self dismissModalViewControllerAnimated:YES];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Make sure your segue name in storyboard is the same as this line
//    if ([[segue identifier] isEqualToString:@"YOUR_SEGUE_NAME_HERE"])
//    {
//        // Get reference to the destination view controller
//        ImpactTeamTableViewController *vc = [segue destinationViewController];
//        
//        // Pass any objects to the view controller here, like...
//        //[vc setMyObjectHere:object];
//    }}


@end
