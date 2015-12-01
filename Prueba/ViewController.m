#import "ViewController.h"
#import "NoteObject.h"

@interface ViewController ()
@property IBOutlet UIButton *addButton;
@property IBOutlet UIScrollView *map;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.map.contentSize = CGSizeMake(2000, 2000);
}

-(IBAction)addNote:(UIButton*)sender
{
    NoteObject *newNote = [[NoteObject alloc] init];
    [self.map addSubview:newNote];
}

@end
