//
//  CustomDropdownVC.m
//  CustomUINavigationBar
//
//  Created by Abhishek Shinde on 01/05/15.
//  Copyright (c) 2015 Abhishek Shinde. All rights reserved.
//

#import "customDropdownVC.h"
#import "TableViewCell.h"

//setting timeinterval
#define  animationDuration 0.2
#define  dropdownViewHeight 180

@interface CustomDropdownVC ()
{
    BOOL dropdownCollapsed;
    UIButton *addButton ;
    UIImageView *addButtonImage;
    UIBarButtonItem *addBarButtonItem;
}

@end

@implementation CustomDropdownVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableContaints.delegate=self;
    _tableContaints.dataSource=self;

    [_dropdownViewHeightConstraint setConstant:0];
    
    addButtonImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add"]];
    addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.contentMode=UIViewContentModeScaleAspectFill;
    [addButton setFrame:CGRectMake(0, 0, addButtonImage.frame.size.width,addButtonImage.frame.size.height)];
    [addButton addSubview:addButtonImage];
    addBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = addBarButtonItem;
    [addButton addTarget:self action:@selector(dropdownSelected) forControlEvents:UIControlEventTouchUpInside];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//DropdownSelect Method
-(void)dropdownSelected{
    
    if (!dropdownCollapsed) {
        [UIView animateWithDuration:animationDuration animations:^{
            addButtonImage.transform=CGAffineTransformMakeRotation(M_PI/4);
            [_dropdownViewHeightConstraint setConstant:dropdownViewHeight];
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            dropdownCollapsed=YES;
        }];
    }else{
        self.dropdownViewHeightConstraint.constant=dropdownViewHeight;
        [UIView animateWithDuration:animationDuration animations:^{
            addButtonImage.transform=CGAffineTransformMakeRotation(0);
            [_dropdownViewHeightConstraint setConstant:0];
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            dropdownCollapsed=NO;
        }];
    }
}


//TableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if(!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
         cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    cell.rightImage.image=[UIImage imageNamed:@"placeholder_icon"];
    cell.cellText.text=[NSString stringWithFormat:@"Person Name %li",(long)indexPath.row];
    cell.cellTextBig.text=@"Description about person";
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [UIView animateWithDuration:animationDuration animations:^{
        addButtonImage.transform=CGAffineTransformMakeRotation(0);
        [_dropdownViewHeightConstraint setConstant:0];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        dropdownCollapsed=NO;
    }];

}

@end

