//
//  ViewController.m
//  AOCweek4
//
//  Created by Janis Jae on 9/14/12.
//  Copyright (c) 2012 Janis Jae. All rights reserved.
//

#import "ViewController.h"

#define LOGIN_BUTTON 0
#define DATE_BUTTON 1
#define INFO_BUTTON 2

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*Create a UILabel near the top of your screen with the text "Username:" in it*/
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 90.0f, 30.0f)];
    if (userLabel != nil)
    {
        userLabel.text = @"Username: "; /*Label*/
    }
    [self.view addSubview:userLabel];
    
    /*Create a UITextField to the right of the username label*/
    textUsername = [[UITextField alloc]
    initWithFrame:CGRectMake(100.0f, 10.0f, 200.0f, 30.0f)];
    if (textUsername != nil)
    {
        textUsername.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:textUsername];
    }
    
    /*Create a rounded rectangle UIButton of any color under the UITextField with the text "Login" on it.*/
    loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (loginBtn != nil) {
        loginBtn.tag = LOGIN_BUTTON;
        loginBtn.frame = CGRectMake(10.0f, 50.0f, 75.0f, 35.0f);
        loginBtn.tintColor = [UIColor colorWithRed:0.369 green:0.224 blue:0.741 alpha:1] /*#5e39bd*/;
        [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
        [loginBtn addTarget:self action:@selector
         /*Add a target to the UIButton to call a function called onClick when the user presses the Login button.*/
         (onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginBtn];
    }
    
    /*Create another UILabel beneath with the default text "Please Enter Username".*/
    loginText = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 90.0f, 300.0f, 70.0f)];
    if (loginText != nil)
    {
        loginText.text = @"Please Enter Your Username";
    }
    [self.view addSubview:loginText];
    
    /*Create a UIButton using the rounded rectangle type. Give this button any color you wish.*/
    dateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    if (dateBtn != nil) {
        dateBtn.tag = DATE_BUTTON;
        dateBtn.frame = CGRectMake(10.0f, 170.0f, 100.0f, 35.0f);
        dateBtn.tintColor = [UIColor colorWithRed:0.275 green:0.835 blue:0.91 alpha:1] /*#46d5e8*/;
        /*Add the text "Show Date" to the button*/

        [dateBtn setTitle:@"Show Date" forState:UIControlStateNormal];
        [dateBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dateBtn];
    }
    
    /*Create a UIButton using either the light or dark info type and position it somewhere near the bottom of the screen.*/
    infoBtn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    if (infoBtn != nil) {
        /*Create a UILabel beneath it that contains no initial text.*/
        infoBtn.tag = INFO_BUTTON;
        infoBtn.frame = CGRectMake(10.0f, 250.0f, 25.0f, 25.0f);
        infoBtn.tintColor = [UIColor colorWithRed:0.529 green:0.91 blue:0.275 alpha:1] /*#87e846*/;
        [infoBtn addTarget:self action:@selector
         /*Hook up an action to the info button to have it call the onClick handler you created earlier.*/
         (onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:infoBtn];
    }
    myInfo = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 280.0f, 300.0f, 70.0f)];
    if (myInfo != nil)
    {
        
    }
    [self.view addSubview:myInfo];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


/*Add an action to the button that when clicked, it will call the same onClick handler you already defined. Make sure to add a tag to the date button so you know which one was pressed.*/
-(void)onClick:(UIButton*)button
{
    if(button.tag == LOGIN_BUTTON && textUsername.text == 0)
    {
        /*If the user has not entered any text into the UITextField, display in the UILabel, "Username cannot be empty".*/
        loginText.text = @"Username cannot be empty";
        loginText.textColor = [UIColor colorWithRed:0.929 green:0.047 blue:0.149 alpha:1] /*#ed0c26*/;
    }else if (button.tag == LOGIN_BUTTON)
    {
        NSString *theUser = [[NSString alloc] initWithString:textUsername.text];
        loginText.text = [NSString
            /* Otherwise, display "User: username has been logged in".*/
            stringWithFormat:@"User: '%@' has been logged in", theUser];
        loginText.textColor = [UIColor colorWithRed:0.271 green:0.086 blue:0.439 alpha:1] /*#451670*/;
        loginText.numberOfLines = 3;
    }else if (button.tag == DATE_BUTTON)
    {  
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (dateFormatter != nil)
        {  /*formatting displayed date*/
            [dateFormatter setDateFormat:@"MMMM d, yyyy h:mm:s:a zzzz"];
            NSString* dateLabel = [dateFormatter stringFromDate:date];
            UIAlertView *dateAlertView = [[UIAlertView alloc]
                initWithTitle:@"Date" message:dateLabel delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            if(dateAlertView != nil)
            {
                [dateAlertView show];
            }
        }
    }else if (button.tag == INFO_BUTTON)
    {
        /*When the info button is pressed, have the text "This application was created by: Firstname Lastname" appear in the info UILabel. Please replace firstname lastname with your name.*/
        myInfo.text = @"This application was created by:                   Jae Rowe";
        myInfo.textAlignment = UITextAlignmentCenter;
        myInfo.textColor = [UIColor colorWithRed:0.125 green:0.506 blue:0.91 alpha:1] /*#2081e8*/;
        myInfo.numberOfLines = 3;
        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end


