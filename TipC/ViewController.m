//
//  ViewController.m
//  TipC
//
//  Created by admin on 6/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *billLabel;
@property (weak, nonatomic) IBOutlet UISlider *partySlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onScreenTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
   
    NSArray *percentages = @[@(0.15), @(0.20), @(.22)];

    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    double party = round(self.partySlider.value);
    double tpp = total/party;
    
    self.billLabel.text = [NSString stringWithFormat:@"$%.2f", bill];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f / %.0f = $%.2f",total, party, tpp];
    //self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];

       
    
}

@end
