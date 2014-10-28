//
//  Document.m
//  TahDoodle_bis
//
//  Created by Raffaele Rainone on 28/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "Document.h"

@interface Document ()

@end

@implementation Document

#pragma mark - Data Source Methods
//The following 3 methods are required (the last is optional sometimes) by <NSTableViewDataSource>
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    //this table-view shos the array of activities, hence the number of elements in the table = the number of elements in the array (= [self.tasks count])
    return [self.tasks count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    //this returns an item in the data source in the specified table column of the view
    return [self.tasks objectAtIndex:row];
}

//the following is only used (optionally) for Cell-based TableView:
- (void)tableView:(NSTableView *)tableView
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row
{
    //when I modify a task in the table-view you have to update the array of activities:
    [self.tasks replaceObjectAtIndex:row withObject:object];
    //then mark the document as unsaved
    [self updateChangeCount:NSChangeDone];
}

# pragma mark - NSDocument Overrides

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    //return nil;
    //BOOK:
    //if there is no array then we create one:
    if (!self.tasks) {
        self.tasks = [NSMutableArray array];
    }
    //take the array and add it to an object NSData
    NSData *data = [NSPropertyListSerialization dataWithPropertyList:self.tasks
                                                              format:NSPropertyListXMLFormat_v1_0
                                                             options:0
                                                               error:outError];
    //give back the new NSData object
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    //[NSException raise:@"UnimplementedMethod" format:@"%@ is unimplemented", NSStringFromSelector(_cmd)];
    //return YES;
    //BOOK:
    //take the activity from the one saved:
    self.tasks = [NSPropertyListSerialization propertyListWithData:data
                                                           options:NSPropertyListMutableContainers
                                                            format:NULL
                                                             error:outError];
    //now return success or failing
    return (self.tasks != nil);
}

#pragma mark - Actions

- (IBAction)addTask:(id)sender
{
    //if there is no array then create a new one:
    if(!self.tasks){
        self.tasks = [NSMutableArray array];
    }
    //we add a new item that display the message:
    [self.tasks addObject:@"New Item"];
    //now we have to tell the table-view to update and to tell DataSource (that here is an object of Document) to show the new data
    [self.taskTable reloadData];
    //now we tell the application (using updateChangeCount) that it has to mark the document us unsaved (with NSChangedone)
    [self updateChangeCount:NSChangeDone];
}

- (IBAction)removeTask:(id)sender;
{
    if(self.taskTable.selectedRow<0){//selectedRow return -1 if no row is selected.
        return;
    }

    [self.tasks removeObjectAtIndex:[self.taskTable selectedRow]];

    //THE FOLLOWING IS AS IN ADDTASK
    //now we have to tell the table-view to update and to tell DataSource (that here is an object of Document) to show the new data
    [self.taskTable reloadData];
    //now we tell the application (using updateChangeCount) that it has to mark the document us unsaved (with NSChangedone)
    [self updateChangeCount:NSChangeDone];
}

@end
