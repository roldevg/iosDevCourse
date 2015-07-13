//
//  ViewController.m
//  UITextField
//
//  Created by Evgeniy Roldukhin on 7/12/15.
//  Copyright © 2015 Evgeniy Roldukhin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.firstNameTextField.keyboardAppearance = UIKeyboardAppearanceDark;
    //self.lastnameTextField.keyboardAppearance = UIKeyboardAppearanceDefault;
    
    // self.firstNameTextField.delegate = self; // we use storyboard delegate
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    
    // UIKIT_EXTERN NSString *const UITextFieldTextDidBeginEditingNotification;
    
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionLog:(UIButton *)sender {
    NSLog(@"First Name = %@, Last Name = %@", self.firstNameTextField.text, self.lastnameTextField.text);
}

#pragma mark - UITextFieldDelegate

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL) textField:(nonnull UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    //NSLog(@"Text field: %@", self.firstNameTextField.text);
    //NSLog(@"Range %@", NSStringFromRange(range));
    //NSLog(@"replacementString %@", string);
    
    //NSCharacterSet* set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    //NSArray* words = [resultString componentsSeparatedByString:" "];
    //NSArray* words = [resultString componentsSeparatedBySer:set];
    
    NSCharacterSet* valdiationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* words = [string componentsSeparatedByCharactersInSet:valdiationSet];
    NSLog(@" words = %@", words);
    if([words count] > 1) {
        return NO;
    }
    
    NSString* newString = [self.firstNameTextField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"NEw string = %@", newString);

    // XXXXXXXXXXXX
    NSArray* validCompontents = [newString componentsSeparatedByCharactersInSet:valdiationSet];
    newString = [validCompontents componentsJoinedByString:@""];
    
    
    static const int localNumberMaxLenght = 7;
    static const int areaCodeMAxLength = 3;
    static const int countryCodeMaxLentgh = 3;
    
    if ([newString length] > localNumberMaxLenght + areaCodeMAxLength + countryCodeMaxLentgh) {
        return NO;
    }
    
    NSMutableString* resultString = [NSMutableString string];
    
    
    // XXXXXXXXXXXX
    //+XX (XXX) XXX-XXXX

    NSInteger localNumberLength = MIN([newString length], localNumberMaxLenght);
    if (localNumberLength > 0) {
        NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLength];
        [resultString appendString:number];
        
        if ([resultString length] > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if ([newString length] > localNumberMaxLenght) {
        NSInteger areaCodeLength = MIN((int)[newString length] - localNumberMaxLenght, areaCodeMAxLength);
        NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLenght - areaCodeLength, areaCodeLength);
        NSString* area = [newString substringWithRange:areaRange];
        area = [NSString stringWithFormat:@"(%@) ", area];
        [resultString insertString:area atIndex:0];
    }
    
    if ([newString length] > localNumberMaxLenght + areaCodeMAxLength) {
        NSInteger countryCodeLength = MIN((int)[newString length] - localNumberMaxLenght, countryCodeMaxLentgh);
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        NSString* countryCode = [newString substringWithRange:countryCodeRange];
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        [resultString insertString:countryCode atIndex:0];
    }
    
    textField.text = resultString;
    
    // return [resultString length] <= 10;
    return NO;
}

#pragma mark - Notifications Methods
- (void) notificationTextDidBeginEditing:(NSNotification*) notificatiion {
    NSLog(@"notificationTextDidBeginEditing");
}

@end
