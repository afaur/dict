#import <Foundation/Foundation.h>
#import <CoreServices/CoreServices.h>

int main (int argc, char *argv[]) {
  if (argc < 2) {
    printf("Usage: dict <word to define>");
    return -1;
  }

  NSString * search = [NSString stringWithCString: argv[1] encoding: NSUTF8StringEncoding];
  CFStringRef def = DCSCopyTextDefinition(NULL, (CFStringRef)search, CFRangeMake(0, [search length]));
  NSString * output = [NSString stringWithFormat: @"Definition of <%@>:%@", search, (NSString *)def];

  printf("%s", [output UTF8String]);
  return 0;
}
