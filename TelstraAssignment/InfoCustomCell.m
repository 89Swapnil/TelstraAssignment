//
//  InfoCustomCell.m
//  TelstraAssignment
//
//  Created by mac_admin on 20/12/16.
//
//

#import "InfoCustomCell.h"

@implementation InfoCustomCell

NSOperationQueue *queue;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        //[self.contentView setBackgroundColor:[UIColor lightGrayColor]];
        
        self.title = [UILabel new];
        [self.title setNumberOfLines:0];
        [self.title setTextColor:[UIColor blackColor]];
        [self.title setBackgroundColor:[UIColor clearColor]];
        //[self.title setFont:TitleFont];
        [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.title];
        
        self.descriptionDetail = [UILabel new];
        [self.descriptionDetail setNumberOfLines:0];
        [self.descriptionDetail setTextColor:[UIColor blackColor]];
        [self.descriptionDetail setBackgroundColor:[UIColor clearColor]];
        //[self.descriptionDetail setFont:DescriptionFont];
        [self.descriptionDetail setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.descriptionDetail];
        
        self.thumbNailImage = [[UIImageView alloc] init];
        self.thumbNailImage.backgroundColor = [UIColor grayColor];
        self.thumbNailImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.thumbNailImage];
        
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.thumbNailImage addSubview:self.spinner];
        //[self.spinner startAnimating];
        [self.contentView layoutSubviews];
        
        [self updateCellConstraints];
    }
    return self;
}

- (void)updateCellConstraints
{
    NSDictionary *viewsDictionary = @{@"title":self.title ,@"descriptionL":self.descriptionDetail ,@"imageV":self.thumbNailImage};
    
    NSArray *constraints;

    constraints= [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title]"
                                                         options: 0
                                                         metrics:nil
                                                           views:viewsDictionary];
    [self.contentView addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title]-10-[descriptionL]"
                                                          options: 0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.contentView addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title]-5-[imageV(50)]"
                                                          options: 0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.contentView addConstraints:constraints];

    constraints= [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]-|"
                                                         options: 0
                                                         metrics:nil
                                                           views:viewsDictionary];
    [self.contentView addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[descriptionL]-5-[imageV(50)]-|"
                                                          options: 0
                                                          metrics:nil
                                                            views:viewsDictionary];
    [self.contentView addConstraints:constraints];
    
}

@end
