//
//  RootViewController.h
//  MemoPad
//
//  Created by travis sein on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryList.h"
#import "Category.h"
#import "CategoryViewController.h"

@interface CategoryListViewController : UITableViewController {
	CategoryList *categoryList;
	Category *tempCategory;
	UIViewController *addScreen;
	UITextField *categoryTitleTextField;
	CategoryViewController *categoryViewController;
	int currentIndex;
}

@property (nonatomic, retain) IBOutlet CategoryViewController *categoryViewController;
@property (nonatomic, retain) UITextField *categoryTitleTextField;

-(void)addCategory;

@end
