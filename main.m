//
//  main.m
//  gwc_foundation
//
//  Copyright (c) 2014 J. Gavin Ray.


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        

        if (argc < 2)
        {
            NSLog(@"usage: gwcf FILE [FILE...]");
            exit(1);
        }
        
        
        for (int i = 1; i < argc; i++)
        {
            // Get Path from argv
            NSString* path = [NSString stringWithUTF8String:argv[i]];
            
            // Get contents from file and put them into filecontents NSString
            NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            
            //  Check to see if fileContents is empty
            if (fileContents == NULL)
            {
                NSLog(@"Unable to open: %@!", path);
                exit(1);
            }
            
            // Counting the words in the file, checking for whitespaces and new lines
            NSArray *words = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            //
            NSIndexSet *separatorIndexes = [words indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
                return [obj isEqualToString:@""];
            }];
            NSLog(@"\n\t%ld\t\t%@", [words count] - [separatorIndexes count], path);
        }
        
    }
    return 0;
}
