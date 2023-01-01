//
//  LoginViewController.m
//  TableViewDemo
//
//  Created by Adham Samer on 29/12/2022.
//

#import "LoginViewController.h"
#import "TableViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *pwTxtField;

@property NSUserDefaults *def;

@end

@implementation LoginViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _def = [NSUserDefaults standardUserDefaults];
    self.navigationItem.hidesBackButton = YES;
}

- (IBAction)LogInBtn:(id)sender {
    if ([_userNameTxtField.text isEqualToString:[self.def stringForKey:@"UserName"]] && [_pwTxtField.text isEqualToString:[self.def stringForKey:@"PassWord"]]) {
        TableViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"table"];
        [self.navigationController pushViewController:tvc animated:YES];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Wrong Credentials" message:@"Register !" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:Nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:Nil];
    }
}

- (IBAction)signUpAlert:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sign Up" message:@"Enter Username and password" preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *_Nonnull textField) {
        textField.placeholder = @"UserName";
    }];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *_Nonnull textField) {
        textField.placeholder = @"PassWord";
    }];


    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Sign Up"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *_Nonnull action) {
        if ([[[alert textFields][0] text] isEqualToString:@""] || [[[alert textFields][1] text] isEqualToString:@""]) {
            UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"Invalid SignUp"
                                                                           message:@"Username or pw is missing!"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok"
                                                             style:UIAlertActionStyleDefault
                                                           handler:Nil];
            [alert2 addAction:action];
            [self presentViewController:alert2
                               animated:YES
                             completion:Nil];
        } else {
            [self->_def setObject:[[alert textFields][0] text]
                           forKey:@"UserName"];
            [self->_def setObject:[[alert textFields][1] text]
                           forKey:@"PassWord"];
            [self->_def setBool:YES
                         forKey:@"isSignedUp"];
            [self->_def setBool:YES
                         forKey:@"isLogged"];
        }
    }];

    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:Nil];
}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
