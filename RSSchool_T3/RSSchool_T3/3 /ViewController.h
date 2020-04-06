#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property(nonatomic, strong) UILabel *labelResultColor;
@property(nonatomic, strong) UILabel *labelRed;
@property(nonatomic, strong) UILabel *labelGreen;
@property(nonatomic, strong) UILabel *labelBlue;

@property(nonatomic, strong) UITextField *textFieldRed;
@property(nonatomic, strong) UITextField *textFieldGreen;
@property(nonatomic, strong) UITextField *textFieldBlue;

@property(nonatomic, strong) UIView *mainView;

@end

