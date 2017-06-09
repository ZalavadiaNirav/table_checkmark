//
//  ViewController.m
//  cart
//
//  Created by Nirav Zalavadia on 06/06/17.
//  Copyright © 2017 C N Soft Net. All rights reserved.
//

#import "ProductListVC.h"
#import "Productcell.h"

@interface ProductListVC ()

@end

@implementation ProductListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    selectedItem=[[NSMutableArray alloc] init];
    selectedInedxArr=[[NSMutableArray alloc] init];
    productArray=[[NSMutableArray alloc] init];
    
    
    [productArray addObject:@{@"name":@"Product1",@"price":@"100"}];
    [productArray addObject:@{@"name":@"Product2",@"price":@"200"}];
    [productArray addObject:@{@"name":@"Product3",@"price":@"300"}];
    [productArray addObject:@{@"name":@"Product4",@"price":@"400"}];
    [productArray addObject:@{@"name":@"Product5",@"price":@"500"}];
    [productArray addObject:@{@"name":@"Product6",@"price":@"1100"}];
    [productArray addObject:@{@"name":@"Product7",@"price":@"2100"}];
    [productArray addObject:@{@"name":@"Product8",@"price":@"3100"}];
    [productArray addObject:@{@"name":@"Product9",@"price":@"4100"}];
    [productArray addObject:@{@"name":@"Product10",@"price":@"5100"}];
    
    _productList.delegate=self;
    _productList.dataSource=self;
    
    
    [_productList reloadData];
   
    //Add long press for move row data
    
    UILongPressGestureRecognizer* longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    [_productList addGestureRecognizer:longPressRecognizer];
    
    
}

#pragma mark -TableView



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [productArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Productcell *cell=[tableView dequeueReusableCellWithIdentifier:@"productCell" forIndexPath:indexPath];
    cell.productName.text=[NSString stringWithFormat:@"%@",[[productArray objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [cell.addCartBtn setTag:indexPath.row];
    [cell.addCartBtn addTarget:self action:@selector(addToCartPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    BOOL isSelected=false;

    for (int i=0;i<[selectedInedxArr count];i++)
    {
        NSNumber *selectedRow=[NSNumber numberWithInteger:[[selectedInedxArr objectAtIndex:i] integerValue]];
        if ([selectedRow intValue]==indexPath.row)
        {
            isSelected=true;
            NSLog(@"This product in cart");
            [cell.addCartBtn setTitle:@"Remove From Cart" forState:UIControlStateNormal];
        }
    }
    if(isSelected==false)
    {
        [cell.addCartBtn setTitle:@"Add To Cart" forState:UIControlStateNormal];
    }

    NSLog(@"cell selected array %@",[selectedInedxArr description]);
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UITableViewCell *cell=[_productList cellForRowAtIndexPath:indexPath];
        NSIndexPath *currentIndex=[tableView indexPathForCell:cell];
        NSLog(@"INdex %ld",currentIndex.row);
        [productArray removeObjectAtIndex:currentIndex.row];
        [_productList setEditing:false];
        [_productList reloadData];
        
    }
}

-(void)onLongPress:(UILongPressGestureRecognizer*)pGesture
{
    [_productList setEditing:true];
}


-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [productArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}

- (IBAction)ViewCartAction:(id)sender
{
    
    
}

-(void)addToCartPressed:(UIButton *)sender
{
    NSInteger sel=sender.tag;
    
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:sel inSection:0];
    Productcell *cell = (Productcell *)[_productList cellForRowAtIndexPath:indexPath];

    if([selectedInedxArr count]==0)
    {
        [cell.addCartBtn setTitle:@"Remove From Cart" forState:UIControlStateNormal];
        [selectedInedxArr addObject:[NSNumber numberWithInteger:sel]];
    }
    else
    {
        BOOL isRemove=false;
        for (int i=0; i<[selectedInedxArr count]; i++)
        {
            NSNumber *indexno=[selectedInedxArr objectAtIndex:i];
            NSInteger index=[indexno integerValue];
            NSLog(@"index %li",(long)index);
            NSIndexPath *cartIndex=[NSIndexPath indexPathForRow:index inSection:0];
            NSLog(@"Cart index %ld,indexpath %ld",(long)cartIndex.row,(long)indexPath.row);
            if(cartIndex.row==indexPath.row)
            {
                [cell.addCartBtn setTitle:@"Add To Cart" forState:UIControlStateNormal];
                [selectedInedxArr removeObject:[NSNumber numberWithInteger:indexPath.row]];
                NSLog(@"remove object");
                isRemove=true;
                
            }
        }
        if(isRemove==false)
        {

            [cell.addCartBtn setTitle:@"Remove From Cart" forState:UIControlStateNormal];
            [selectedInedxArr addObject:[NSNumber numberWithInteger:sel]];
           
            NSLog(@"add object2");
        }
        
    }
    
    NSLog(@"selected array %@",[selectedInedxArr description]);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
