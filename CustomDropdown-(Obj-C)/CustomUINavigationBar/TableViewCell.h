//
//  TableViewCell.h
//  CustomUINavigationBar
//
//  Created by Abhishek Shinde on 05/05/15.
//  Copyright (c) 2015 Abhishek Shinde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet UILabel *cellText;
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *cellTextBig;


@end
