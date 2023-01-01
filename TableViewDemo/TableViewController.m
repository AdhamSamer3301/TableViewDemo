//
//  TableViewController.m
//  TableViewDemo
//
//  Created by Adham Samer on 28/12/2022.
//

#import "LoginViewController.h"
#import "Person.h"
#import "TableViewController.h"
#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import <SDWebImage/SDWebImage.h>
@interface TableViewController ()
@property NSMutableArray *male;
@property NSMutableArray *female;
@property NSUserDefaults *def;
@end

@implementation TableViewController

- (void)returnBack {
    LoginViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
    self.navigationItem.backBarButtonItem.hidden = YES;
    [self.navigationController pushViewController:lvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _def = [NSUserDefaults standardUserDefaults];
    self.navigationItem.hidesBackButton = YES;

    if ([_def boolForKey:@"isLogged"]) {
        _male = [NSMutableArray new];
        _female = [NSMutableArray new];
        Person *p1 = [Person new];
        Person *p2 = [Person new];
        Person *p3 = [Person new];
        Person *p4 = [Person new];
        [p1 setFriend_WithName:@"Adham" andEmail:@"adham@gmail.com" andAge:20 andPhone:100 andAddress:@"Alex"];
        [p2 setFriend_WithName:@"Samer" andEmail:@"samer@gmail.com" andAge:50 andPhone:100 andAddress:@"Alex"];
        [p3 setFriend_WithName:@"Hoor" andEmail:@"hoor@gmail.com" andAge:17 andPhone:100 andAddress:@"Alex"];
        [p4 setFriend_WithName:@"Eman" andEmail:@"hoor@gmail.com" andAge:45 andPhone:100 andAddress:@"Alex"];

        [_male addObject:p1];
        [_male addObject:p2];
        [_female addObject:p3];
        [_female addObject:p4];
    } else {
        LoginViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController pushViewController:lvc animated:YES];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [_male count];

            break;

        case 1:
            return [_female count];

            break;

        default:
            return 0;

            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Person *temp;
    
    switch (indexPath.section) {
        case 0:
            temp = [_male objectAtIndex:indexPath.row];
            cell.textLabel.text = temp.name;
            
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"] placeholderImage:[UIImage imageNamed:@"pp"]];
            
            break;

        case 1:
            temp = [_female objectAtIndex:indexPath.row];
            cell.textLabel.text = temp.name;
            
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://w7.pngwing.com/pngs/129/292/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon.png"] placeholderImage:[UIImage imageNamed:@"pp"]];
            
            break;
    }


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"view"];
    [self.navigationController pushViewController:vc animated:YES ];
    
    switch (indexPath.section) {
        case 0:
            vc.p = [_male objectAtIndex:indexPath.row];
            [vc.p setImgURL:@"https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"];
            break;

        case 1:
            vc.p = [_female objectAtIndex:indexPath.row];
            [vc.p setImgURL:@"https://w7.pngwing.com/pngs/129/292/png-transparent-female-avatar-girl-face-woman-user-flat-classy-users-icon.png"];
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"Males";

            break;

        case 1:
            return @"Females";

            break;

        default:
            return @"";

            break;
    }
}

/*
   // Override to support conditional editing of the table view.
   - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
   }
 */

/*
   // Override to support editing the table view.
   - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   }
 */

/*
   // Override to support rearranging the table view.
   - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
   }
 */

/*
   // Override to support conditional rearranging of the table view.
   - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
   }
 */

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */





@end
