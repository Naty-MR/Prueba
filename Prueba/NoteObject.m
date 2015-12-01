#import "NoteObject.h"
#define NEW_NOTE_TEXT @"Esta es una nueva nota..."
#define PADDING_SIZE 10
#define FRAME_HEIGHT 100
#define FRAME_WIDTH 200

@interface NoteObject()

@property UITextView *note;

@end

@implementation NoteObject

-(id) init
{
    self = [super init];
    if(self){
        [self drawDefaultContentView];
        [self addContent];
        [self addCloseButton];
    }
    return self;
}

-(void) drawDefaultContentView
{
    self.frame = CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT);
    self.backgroundColor = [UIColor orangeColor];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

-(void) addContent
{
    self.note = [[UITextView alloc] initWithFrame:CGRectMake(PADDING_SIZE, PADDING_SIZE, FRAME_WIDTH-PADDING_SIZE*2, FRAME_HEIGHT-PADDING_SIZE*2)];
    self.note.font = [UIFont fontWithName:@"Courier-BoldOblique" size:15];
    self.note.text = NEW_NOTE_TEXT;
    self.note.backgroundColor = [UIColor clearColor];
    self.note.textColor = [UIColor whiteColor];
    [self addSubview:self.note];
}

@end