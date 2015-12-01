#import "BaseObject.h"
#define BUTTON_SIDE_SIZE 20
#define CLOSE_ALERT_MESSAGE @"De verdad quieres eliminarme?"

@interface  BaseObject()

@property CGPoint lastLocation;
@property UIButton *closeButton;

@end

@implementation BaseObject

-(id) init
{
    self = [super init];
    if(self)
    {
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(recognizePan:)];
        self.gestureRecognizers = @[panRecognizer];
    }
    return self;
}

- (void) recognizePan:(UIPanGestureRecognizer *) panRecognizer
{
    if(panRecognizer.state == UIGestureRecognizerStateBegan){
        self.lastLocation = self.center;
        [self.superview bringSubviewToFront:self];
    }
    CGPoint translation = [panRecognizer translationInView:self.superview];
    self.center = CGPointMake(self.lastLocation.x + translation.x,
                              self.lastLocation.y + translation.y);
}


-(void) addCloseButton
{
    self.closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.closeButton.frame = CGRectMake(self.frame.size.width-BUTTON_SIDE_SIZE-2, 2, BUTTON_SIDE_SIZE, BUTTON_SIDE_SIZE);
    [self.closeButton setTitle:@"X" forState:UIControlStateNormal];
    [self.closeButton setTintColor:[UIColor whiteColor]];
    [self.closeButton addTarget:self action:@selector(buttonCloseTapped) forControlEvents:UIControlEventAllTouchEvents];
    [self addSubview:self.closeButton];
}

-(void) buttonCloseTapped
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:nil
                                  message:CLOSE_ALERT_MESSAGE
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"SI"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             [self removeFromSuperview];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"NO"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end