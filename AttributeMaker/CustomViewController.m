            //
//  CustomViewController.m
//  AttributeMaker
//
//  Created by my on 16/6/6.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "CustomViewController.h"
#import "AttributeMaker.h"


@interface CustomViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) AttributeMaker *maker;
@property (weak, nonatomic) IBOutlet UITextView *text;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _maker = [[AttributeMaker alloc] init];
    NSString *str = @"总有一天你将破蛹而出，成长的比人们期待的还要美丽。但这个过程会很痛--flushfi";
    

    
    _maker.text(str)
    .textChange(@"一天")
    .textColor([UIColor redColor])
    .textFont([UIFont systemFontOfSize:13]);
    
    _maker.range(NSMakeRange(0, 2))
    .url([NSURL URLWithString:@"www.baidu.com"]);
    
    _maker.textChange(@"美丽")
    .textColor([UIColor purpleColor])
    .throughStyle(NSUnderlineStyleThick);
    
    _maker.textChange(@"过程")
    .underlineColor([UIColor redColor])
    .underlineStyle(NSUnderlineStyleThick);
    
    _maker.textChange(@"很痛")
    .shadow(3,[UIColor redColor],CGSizeMake(3, 3))
    .space(10);
    
    _maker.textChange(@"破蛹而出")
    .stroke([UIColor redColor],4)
    .textFont([UIFont systemFontOfSize:20]);
    
    
    
    UIImage *image = [UIImage imageNamed:@"topImage"];
    _maker.addImage( image,CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 20, image.size.height * ([UIScreen mainScreen].bounds.size.width - 20)/ image.size.width),0);
    
    
    CGSize size = [_maker attributeSizeWith:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10 *2,MAXFLOAT)];
    _label.attributedText = _maker.attributeStr;
    
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, size.height + 20, [UIScreen mainScreen].bounds.size.width, 1);
    [self.view addSubview:view];
    
    //textView需要先设置整体字体大小
    _maker.text(str)
    .textFont([UIFont systemFontOfSize:14]);
    
    _maker.textChange(@"一天")
    .textColor([UIColor redColor])
    .textBackColor([UIColor yellowColor]);
    
    
    //设置URL的时候不能使用label，textView可以使用代理获取点击回调
    _maker.range(NSMakeRange(0, 2))
    .url([NSURL URLWithString:@"www.baidu.com"]);
    
    _maker.textChange(@"美丽")
    .textColor([UIColor purpleColor])
    .throughStyle(NSUnderlineStyleThick);
    
    _maker.textChange(@"过程")
    .underlineColor([UIColor redColor])
    .underlineStyle(NSUnderlineStyleThick);
    
    _maker.textChange(@"很痛")
    .shadow(3,[UIColor redColor],CGSizeMake(3, 3))
    .space(10);
    
    _maker.textChange(@"破蛹而出")
    .stroke([UIColor redColor],4)
    .textFont([UIFont systemFontOfSize:20]);

    
    _maker.textChange(@"flushfi")
    .ligature(1)
    .textFont([UIFont fontWithName:@"futura" size:30])
    .stroke([UIColor greenColor],-3);
    
    
    CGSize size1 = [_maker attributeSizeWith:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _text.attributedText = _maker.attributeStr;
    _text.editable = NO;
    _text.delegate = self;
    
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"点击了-文字--%@-URL--%@",[textView.text substringWithRange:characterRange],URL);
    return YES;
}


@end
