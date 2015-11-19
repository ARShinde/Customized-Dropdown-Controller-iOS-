//
//  CustomDropdownVC.h
//  CustomUINavigationBar
//
//  Created by Abhishek Shinde on 01/05/15.
//  Copyright (c) 2015 Abhishek Shinde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomDropdownVC : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableContaints;
//outlet for height constraiant
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dropdownViewHeightConstraint;

@end
