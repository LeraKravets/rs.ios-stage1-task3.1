#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    NSInteger m = array.firstObject.integerValue;
    NSInteger totalNumber = array.lastObject.integerValue;

//    - (NSInteger)findFactorial:(NSInteger)a {
//        for (int a=1; n>0; n--) {
//            a *= n;
//        return a;
//        }
//    }

    for (int i=1; i<=10; i++) {
        NSInteger factN = 1;
        NSInteger n = totalNumber;
        for (factN=1; n>0; n--) {
            factN *= n;
        }

        NSInteger factK = 1;
        NSInteger k = i;
        for (factK=1; k>0; k--) {
            factK *= k;
        }

        NSInteger factNk = 1;
        NSInteger dif = totalNumber-i;
        for (factNk=1; dif>0; dif--) {
            factNk *= dif;
        }

        NSInteger fact = factN / (factK*factNk);

//        while (fact != m) {
//            result = false;
//        } result = true;
//
//        if (result) {
//            return k;
//        } else {
//            return nil;
//        }
        if (fact == m) {
            NSNumber *result = @(i);
            return result;
        } else {
            continue;
        }
    }
    return nil;
}

@end
