//
//  AppViewController.mm
//  iosTests
//
//  Created by Lukasz Karluk on 24/08/2015.
//
//

#import "AppViewController.h"
#import "ofxiOSViewController.h"
#import "ofApp01.h"
#import "ofApp02.h"
#import "ofApp03.h"
#import "ofApp04.h"
#import "ofApp05.h"
#import "ofApp06.h"
#import "ofApp07.h"
#import "ofApp08.h"
#import "ofApp09.h"
#import "ofApp10.h"
#import "ofApp11.h"
#import "ofApp12.h"

static NSString * const kOFApp01 = @"OF test";
static NSString * const kOFApp02 = @"OF test";
static NSString * const kOFApp03 = @"OF test";
static NSString * const kOFApp04 = @"OF test";
static NSString * const kOFApp05 = @"OF test";
static NSString * const kOFApp06 = @"OF test";
static NSString * const kOFApp07 = @"OF test";
static NSString * const kOFApp08 = @"OF test";
static NSString * const kOFApp09 = @"OF test";
static NSString * const kOFApp10 = @"OF test";
static NSString * const kOFApp11 = @"OF test";
static NSString * const kOFApp12 = @"OF test";


@interface AppViewController() <UITableViewDelegate, UITableViewDataSource> {
    NSArray * tableData;
}
@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    tableData = [NSArray arrayWithObjects:
                 kOFApp01,
                 kOFApp02,
                 kOFApp03,
                 kOFApp04,
                 kOFApp05,
                 kOFApp06,
                 kOFApp07,
                 kOFApp08,
                 kOFApp09,
                 kOFApp10,
                 kOFApp11,
                 kOFApp12, nil];
}

- (NSString *)appLabelText:(NSInteger)i {
    NSInteger appNum = i + 1;
    NSString * appName = [tableData objectAtIndex:i];
    NSString * appLabelText = [NSString stringWithFormat:@"%li. %@", (long)appNum, appName];
    return appLabelText;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [self appLabelText:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ofxiOSApp * app = NULL;

    switch (indexPath.row) {
        case 0:
            app = new ofApp01();
            break;
        case 1:
            app = new ofApp02();
            break;
        case 2:
            app = new ofApp03();
            break;
        case 3:
            app = new ofApp04();
            break;
        case 4:
            app = new ofApp05();
            break;
        case 5:
            app = new ofApp06();
            break;
        case 6:
            app = new ofApp07();
            break;
        case 7:
            app = new ofApp08();
            break;
        case 8:
            app = new ofApp09();
            break;
        case 9:
            app = new ofApp10();
            break;
        case 10:
            app = new ofApp11();
            break;
        case 11:
            app = new ofApp12();
            break;
        default:
            break;
    }
    
    if(app == NULL) {
        return;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    ofxiOSViewController * viewController = [[ofxiOSViewController alloc] initWithFrame:screenRect app:app];
    viewController.title = [self appLabelText:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
