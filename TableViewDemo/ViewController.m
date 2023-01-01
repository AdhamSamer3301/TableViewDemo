//
//  ViewController.m
//  TableViewDemo
//
//  Created by Adham Samer on 28/12/2022.
//

#import "Person.h"
#import "ViewController.h"
#import "TableViewController.h"

#import "UIImageView+WebCache.h"
#import <SDWebImage/SDWebImage.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameTxt;
@property (weak, nonatomic) IBOutlet UILabel *ageTxt;
@property (weak, nonatomic) IBOutlet UILabel *emailTxt;
@property (weak, nonatomic) IBOutlet UILabel *addressTxt;
@property (weak, nonatomic) IBOutlet UIImageView *image;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _nameTxt.text = [self.p name];
    _ageTxt.text = [NSString stringWithFormat:@"%d", [self.p age]];
    _emailTxt.text = [self.p email];
    _addressTxt.text = [self.p address];
    _image.backgroundColor = [UIColor blueColor];
    _image.layer.cornerRadius = 75.0;
    _image.layer.borderColor = [UIColor blackColor].CGColor;
    _image.layer.borderWidth = 1.5;
    NSString *url = [self.p imgURL];
    [_image sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pp"]];
    
    
    
    
}

@end
