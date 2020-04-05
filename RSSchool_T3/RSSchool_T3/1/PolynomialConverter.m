#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    NSMutableArray *stringArr = [NSMutableArray array];
    NSString *resultString = @"";
    NSInteger n = numbers.count - 1;

    if (numbers.count == 0) {
        return nil;
    }
    for (int i=0; i<=n; i++) {
        if (numbers[i] == 0) {
            break;
        } else if (i == 0) {
            if ((n-i) == 0) {
                [stringArr addObject: [NSString stringWithFormat: @"%@", numbers[i]]];
            } else if ((n-i) == 1) {
                if (numbers[i].integerValue == 1) {
                    [stringArr addObject: @"x"];
                } else {
                    [stringArr addObject: [NSString stringWithFormat: @"%@x", numbers[i]]];
                }
            } else {
                [stringArr addObject: [NSString stringWithFormat: @"%@x^%ld", numbers[i], (n-i)]];
            }

        } else if (numbers[i].integerValue > 0 && i != 0) {
            [stringArr addObject: @" + "];
            if ((n-i) == 0) {
                [stringArr addObject: [NSString stringWithFormat: @"%@", numbers[i]]];
            } else if ((n-i) == 1) {
                if (labs(numbers[i].integerValue) == 1) {
                    [stringArr addObject: @"x"];
                } else {
                    [stringArr addObject: [NSString stringWithFormat: @"%@x", numbers[i]]];
                }
            } else {
                if (labs(numbers[i].integerValue) == 1) {
                    [stringArr addObject: [NSString stringWithFormat: @"x^%ld", (n-i)]];
                } else {
                    [stringArr addObject: [NSString stringWithFormat: @"%@x^%ld", numbers[i], (n-i)]];
                }
            }

        } else if (numbers[i].integerValue < 0 && i != 0) {
            [stringArr addObject: @" - "];
            if ((n-i) == 0) {
                [stringArr addObject: [NSString stringWithFormat: @"%ld", labs(numbers[i].integerValue)]];
            } else if ((n-i) == 1) {
                if (labs(numbers[i].integerValue) == 1) {
                    [stringArr addObject: @"x"];
                } else {
                    [stringArr addObject: [NSString stringWithFormat: @"%ldx", labs(numbers[i].integerValue)]];
                }
            } else {
                if (labs(numbers[i].integerValue) == 1) {
                    [stringArr addObject: [NSString stringWithFormat: @"x^%ld", (n-i)]];
                } else {
                    [stringArr addObject: [NSString stringWithFormat: @"%ldx^%ld", labs(numbers[i].integerValue), (n-i)]];
                }
            }
        }
    }

    for (int i = 0; i < stringArr.count; i++) {
        NSString *d = [stringArr objectAtIndex:i];
        resultString = [resultString stringByAppendingString:d];
    }

    return resultString;
}
@end
