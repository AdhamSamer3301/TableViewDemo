//
//  ViewController.m
//  TableViewDemo
//
//  Created by Adham Samer on 28/12/2022.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameTxt;
@property (weak, nonatomic) IBOutlet UILabel *ageTxt;
@property (weak, nonatomic) IBOutlet UILabel *emailTxt;
@property (weak, nonatomic) IBOutlet UILabel *addressTxt;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nameTxt.text=[self.p name];
    _ageTxt.text=[NSString stringWithFormat:@"%d",[self.p age]];
    _emailTxt.text=[self.p email];
    _addressTxt.text=[self.p address];
    
    
}


@end
