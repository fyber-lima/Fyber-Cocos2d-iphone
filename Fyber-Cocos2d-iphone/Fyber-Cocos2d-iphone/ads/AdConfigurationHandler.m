//
//  AdConfigurationHandler.m
//  GSG
//
//  Created by BLG Mac3 on 8/29/13.
//  Copyright (c) 2013 Get Set Games. All rights reserved.
//

#import "AdConfigurationHandler.h"

@implementation AdConfigurationHandler

@synthesize configurationValues;

static AdConfigurationHandler* instance = NULL;

+(AdConfigurationHandler*)sharedInstance
{
  if(instance == NULL)
  {
    instance = [[AdConfigurationHandler alloc] init];
  }
  return instance;
}

-(void)initializeConfiguration
{
  configurationValues = [[NSMutableDictionary alloc] init];
}

-(AdProductConfig*)getConfigForId:(NSString*)element
{
  return [configurationValues objectForKey:element];
}

- (void)dealloc
{
  [configurationValues release];
  [super dealloc];
}

@end
