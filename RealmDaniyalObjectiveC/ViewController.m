//
//  ViewController.m
//  RealmDaniyalObjectiveC
//
//  Created by Daniyal Yousuf on 10/1/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
#import "Person.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    
    __weak IBOutlet UITableView *baseTableView;
    __weak IBOutlet UITextField *tfBirthday;
    __weak IBOutlet UITextField *tfName;
    
    id dbManager;
    Person *person;
    NSMutableArray <Person *> *personArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dbManager = DBManager.sharedManager;
    personArray = [NSMutableArray new];
    
    for (RLMObject *person in [Person allObjects]) {
        Person *personOb = (Person *)person;
        [personArray addObject:personOb];
    }
    // Do any additional setup after loading the view, typically from a nib.


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"basicCell"];
    }
    cell.textLabel.text = personArray[indexPath.row].name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",personArray[indexPath.row].birthday];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Person *tobeDelete = [personArray objectAtIndex:indexPath.row];
        [[DBManager sharedManager] deleteRealmObject:tobeDelete];
        [personArray removeObjectAtIndex:indexPath.row];
        [baseTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

- (IBAction)didTappedAddRecord:(UIButton *)sender {
    [tfName resignFirstResponder];
    [tfBirthday resignFirstResponder];
    NSString *getName = tfName.text;
    NSString *getBirthday = tfBirthday.text;
    tfBirthday.text = @"";
    tfName.text = @"";
    Person *personObject = [[Person alloc]initWithValue:getName andWithDate:getBirthday];
    [dbManager addRealmObject:personObject];
    [personArray addObject:personObject];
    NSArray *arr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:personArray.count-1 inSection:0]];
    [baseTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationNone];
}


@end
