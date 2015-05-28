#import "DeviceClockFormat.h"

@implementation DeviceClockFormat

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(fetch:(RCTResponseSenderBlock)callback)
{
  NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
  NSRange containsA = [formatStringForHours rangeOfString:@"a"];
  BOOL hasAMPM = containsA.location != NSNotFound;
  callback(@[@(hasAMPM), @(!hasAMPM)]);
}

@end
