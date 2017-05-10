//
//  ViewController.m
//  openURLSysTemApp
//
//  Created by StarHui on 08/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

+(instancetype)instance{
    NSString *mIdentifier = NSStringFromClass(self);
    UIStoryboard *mStb = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
    ViewController *vc = [mStb instantiateViewControllerWithIdentifier:mIdentifier];
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.layer.borderColor = [UIColor grayColor].CGColor;
    self.view.layer.borderWidth = 1.0f;
    self.view.layer.cornerRadius = 5.0f;
    
}

- (IBAction)buttonOnClick:(UIButton *)sender {
    
    NSString  *urlStr   = [NSString string];
    NSInteger buttonTag = sender.tag;
    
    switch (buttonTag) {
        case 1:
            //  This parameter can contain the digits 0 through 9 and the plus (+), hyphen (-), and period (.) characters. The URL string must not include any message text or other information.
            urlStr   = @"sms://18322253510";
            break;
        case 2:
            urlStr   = @"mailto:2859784607@qq.com?cc=bar@example.com&subject=Greetings%20from%20Cupertino!&body=Wish%20you%20were%20here!";
            break;
        case 3:
             //     http://www.youtube.com/watch?v=VIDEO_IDENTIFIER
            //      http://www.youtube.com/v/VIDEO_IDENTIFIER
//            urlStr   = @"http://www.youtube.com/watch?v=VIDEO_IDENTIFIER";
            urlStr   = @"http://www.youtube.com/v/VIDEO_IDENTIFIER";
            break;
        case 4:
//            Native app URL strings for FaceTime video calls:
//                facetime:// 14085551234
//                facetime://user@example.com
            
//            Native app URL strings for FaceTime audio calls (iOS only):
//            urlStr   = @"facetime-audio://18322253510";
            
            urlStr = @"facetime://18322253510";
            break;
        case 5:
            
//            To perform a search, supply a properly encoded URL string as the value of the q parameter. For example:
//            
//        http://maps.apple.com/?q=Mexican+Restaurant
//            To specify a location for search, you can supply a value for the near parameter, or combine the sll parameter with either the z or sspn parameters. You can also set the map type using the t parameter, as shown here:
//                
//                http://maps.apple.com/?q=Mexican+Restaurant&sll=50.894967,4.341626&z=10&t=s
//                To provide navigation directions from one location to another, supply the start and destination addresses in the saddr and daddr parameters as shown below. You can also supply much more detail for the start and destination addresses than is shown here.
//                    
//                    http://maps.apple.com/?saddr=Cupertino&daddr=San+Francisco
//                    To specify a transport type, you can use the dirflg parameter as shown here:
//                    
//                    http://maps.apple.com/?saddr=San+Jose&daddr=San+Francisco&dirflg=r
//                    You can omit the start address when you want to provide directions “from here.” The following example shows a search from here that provides driving directions in a hybrid map.
//                    
//                    http://maps.apple.com/?daddr=San+Francisco&dirflg=d&t=h
//                    To display a specific location, use the ll parameter to center the map at the specified position as shown here:
//                    
//                    http://maps.apple.com/?ll=50.894967,4.341626
//                    Another way to display a location is to specify an address, such as:
//                    
//                    http://maps.apple.com/?address=1,Infinite+Loop,Cupertino,California
            
//            urlStr   = @"http://maps.apple.com/?ll=50.894967,4.341626";
            urlStr     = @"http://maps.apple.com/?q=Mexican+Restaurant";
            break;
        case 6:
            urlStr   = @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=156093464&id=156093462&s=143441";
            break;
        case 7:
             urlStr =[NSString stringWithFormat:@"telprompt://%@",@"18322253510"];//这种方式会提示用户确认是否拨打电话
            urlStr = @"tel:18322253510";
            break;
        default:
            break;
    }
    
    NSURL *url  = [NSURL URLWithString:urlStr];
    UIApplication  *application = [UIApplication sharedApplication];

    if(![application canOpenURL:url] ){

        NSLog(@"无法打开 \n %@ + \n请确保此应用已经正确安装 ",urlStr);
        return;
    }
    BOOL result  = [[UIApplication sharedApplication] openURL:url];
    NSLog(@"结果为： %d",result);
}
- (IBAction)fetchUSerPhoneBook:(id)sender {
    
    
}



@end
