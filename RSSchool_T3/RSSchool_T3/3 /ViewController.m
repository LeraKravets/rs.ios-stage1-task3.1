#import "ViewController.h"

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(120.0, 40.0, 100.0, 20.0)];
//    self.mainView.backgroundColor = [UIColor grayColor];
    self.mainView.accessibilityIdentifier = @"mainView";

    [self.view addSubview: self.mainView];

    // Additing Lables
    self.labelResultColor = [[UILabel alloc] initWithFrame: CGRectMake(20.0, 40.0, 100.0, 20.0)];
    [self.labelResultColor setText:@"Color"];
    self.labelRed = [[UILabel alloc] initWithFrame: CGRectMake(20.0, 80.0, 100.0, 20.0)];
    [self.labelRed setText:@"RED"];
    self.labelGreen = [[UILabel alloc] initWithFrame: CGRectMake(20.0, 120.0, 100.0, 20.0)];
    [self.labelGreen setText:@"GREEN"];
    self.labelBlue = [[UILabel alloc] initWithFrame: CGRectMake(20.0, 160.0, 100.0, 20.0)];
    [self.labelBlue setText:@"BLUE"];

    self.labelRed.accessibilityIdentifier = @"labelRed";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";

    [self.view addSubview: self.labelResultColor];
    [self.view addSubview: self.labelRed];
    [self.view addSubview: self.labelGreen];
    [self.view addSubview: self.labelBlue];

    // Additing button
    UIButton *buttonProcess = [[UIButton alloc] initWithFrame: CGRectMake(20.0, 200.0, 100.0, 60.0)];
    [buttonProcess setTitle:@"Process" forState: UIControlStateNormal];
    [buttonProcess setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    buttonProcess.accessibilityIdentifier = @"buttonProcess";
    [buttonProcess addTarget: self action: @selector(buttonProcessDidTap:) forControlEvents: UIControlEventTouchUpInside];

    [self.view addSubview: buttonProcess];

    // Additing textFields
    self.textFieldRed = [[UITextField alloc] initWithFrame: CGRectMake(120.0, 80.0, 100.0, 20.0)];
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldGreen = [[UITextField alloc] initWithFrame: CGRectMake(120.0, 120.0, 100.0, 20.0)];
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldBlue = [[UITextField alloc] initWithFrame: CGRectMake(120.0, 160.0, 100.0, 20.0)];
    self.textFieldBlue.placeholder = @"0..255";

    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";

    [self.view addSubview: self.textFieldRed];
    [self.view addSubview: self.textFieldGreen];
    [self.view addSubview: self.textFieldBlue];

}

- (void)buttonProcessDidTap: (UIButton *)button {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    BOOL isDecimalRed = [self.textFieldRed.text rangeOfCharacterFromSet:notDigits].location == NSNotFound;
    BOOL isDecimalGreen = [self.textFieldGreen.text rangeOfCharacterFromSet:notDigits].location == NSNotFound;
    BOOL isDecimalBlue = [self.textFieldBlue.text rangeOfCharacterFromSet:notDigits].location == NSNotFound;
    if ((self.textFieldRed.text.intValue >= 0 && self.textFieldRed.text.intValue <= 255) && (self.textFieldGreen.text.intValue >= 0 && self.textFieldGreen.text.intValue <= 255) && (self.textFieldBlue.text.intValue >= 0 && self.textFieldBlue.text.intValue <= 255) &&
        self.textFieldRed.text.length > 0 && self.textFieldGreen.text.length > 0 && isDecimalRed && isDecimalGreen && isDecimalBlue) {

        self.mainView.backgroundColor = [UIColor colorWithRed: (self.textFieldRed.text.intValue/255.0) green: (self.textFieldGreen.text.intValue/255.0) blue: (self.textFieldBlue.text.intValue/255.0) alpha: 1];

        const CGFloat *components = CGColorGetComponents(self.mainView.backgroundColor.CGColor);
        CGFloat r = components[0];
        CGFloat g = components[1];
        CGFloat b = components[2];
        NSString *hexString = [NSString stringWithFormat:@"0x%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
        self.labelResultColor.text = hexString;
    } else {
        self.labelResultColor.text = @"Error";
        self.textFieldRed.text = @"";
        self.textFieldGreen.text = @"";
        self.textFieldBlue.text = @"";
    }

}

@end
