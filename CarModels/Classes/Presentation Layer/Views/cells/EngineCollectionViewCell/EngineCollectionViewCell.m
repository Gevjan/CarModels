//
//  EngineCollectionViewCell.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-30.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "EngineCollectionViewCell.h"
#import "CoreDataEngine.h"
#import "EngineInfoTableViewCell.h"

@interface EngineCollectionViewCell () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewEngineInfo;

@property (strong, nonatomic) NSArray *engineData;
@property (strong, nonatomic) NSArray *keysData;

@end

@implementation EngineCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.tableViewEngineInfo.dataSource = self;
    
    self.keysData = @[@"",
                      @"Identifier",
                      @"RPM",
                      @"Acceleration",
                      @"Fuel consumption",
                      @"CO2",
                      @"HP",
                      @"Capacity",
                      @"Max Speed",
                      @"Wheel drive",
                      @"Torque",
                      @"Type",
                      @"Valve per cilinder",
                      @"Cilinder",
                      @"Fuel tank"
                      ];
}

- (void)configureWithEngine:(CoreDataEngine *)engine {
    
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    [tmpArray addObject:engine.name ? engine.name : @""];
    
    
    [tmpArray addObject:engine.identifier ? engine.identifier : @""];
    [tmpArray addObject:engine.rpm ? engine.rpm : @""];
    [tmpArray addObject:engine.acceleration ? engine.acceleration : @""];
    [tmpArray addObject:engine.consumption ? engine.consumption : @""];
    [tmpArray addObject:engine.co2 ? engine.co2 : @""];
    [tmpArray addObject:engine.hoursePower ? engine.hoursePower : @""];
    [tmpArray addObject:engine.capacity ? engine.capacity : @""];
    [tmpArray addObject:engine.maxSpeed ? engine.maxSpeed : @""];
    [tmpArray addObject:engine.wheelDrive ? engine.wheelDrive : @""];
    [tmpArray addObject:engine.torque ? engine.torque : @""];
    [tmpArray addObject:engine.type ? engine.type : @""];
    [tmpArray addObject:engine.valvesPerCilinder ? engine.valvesPerCilinder : @""];
    [tmpArray addObject:engine.cilinder ? engine.cilinder : @""];
    [tmpArray addObject:engine.fuelTank ? engine.fuelTank : @""];

    
    self.engineData = [NSArray arrayWithArray:tmpArray];
    [self.tableViewEngineInfo reloadData];
    [self.tableViewEngineInfo scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    atScrollPosition:UITableViewScrollPositionTop
                                            animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.keysData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EngineInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kEngineInfoTableViewCellID forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        
        cell.labelKey.hidden = YES;
        cell.labelValue.hidden = YES;
        cell.labelEngineName.hidden = NO;
        
        cell.labelEngineName.text = self.engineData[indexPath.row];
    } else {
        
        cell.labelKey.hidden = NO;
        cell.labelValue.hidden = NO;
        cell.labelEngineName.hidden = YES;
        
        cell.labelKey.text = self.keysData[indexPath.row];
        cell.labelValue.text = self.engineData[indexPath.row];
    }
    
    return cell;
}

@end
