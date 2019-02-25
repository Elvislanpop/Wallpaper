//
//  HeaderImageModel.h
//  DayDream
//
//  Created by DayDream on 2019/2/24.
//  Copyright © 2019 蛤蛤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Urls :NSObject
@property (nonatomic , copy) NSString              * raw;
@property (nonatomic , copy) NSString              * full;
@property (nonatomic , copy) NSString              * regular;
@property (nonatomic , copy) NSString              * small;
@property (nonatomic , copy) NSString              * thumb;

@end


@interface Links :NSObject
@property (nonatomic , copy) NSString              * self;
@property (nonatomic , copy) NSString              * html;
@property (nonatomic , copy) NSString              * download;
@property (nonatomic , copy) NSString              * download_location;

@end





@interface Profile_image :NSObject
@property (nonatomic , copy) NSString              * small;
@property (nonatomic , copy) NSString              * medium;
@property (nonatomic , copy) NSString              * large;

@end


@interface User :NSObject
@property (nonatomic , copy) NSString              * id;
@property (nonatomic , copy) NSString              * updated_at;
@property (nonatomic , copy) NSString              * username;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * first_name;
@property (nonatomic , copy) NSString              * last_name;
@property (nonatomic , copy) NSString              * bio;
@property (nonatomic , copy) NSString              * location;
@property (nonatomic , strong) Links              * links;
@property (nonatomic , strong) Profile_image              * profile_image;
@property (nonatomic , copy) NSString              * instagram_username;
@property (nonatomic , assign) NSInteger              total_collections;
@property (nonatomic , assign) NSInteger              total_likes;
@property (nonatomic , assign) NSInteger              total_photos;
@property (nonatomic , assign) BOOL              accepted_tos;

@end


@interface Exif :NSObject
@property (nonatomic , copy) NSString              * make;
@property (nonatomic , copy) NSString              * model;
@property (nonatomic , copy) NSString              * exposure_time;
@property (nonatomic , copy) NSString              * aperture;
@property (nonatomic , copy) NSString              * focal_length;
@property (nonatomic , assign) NSInteger              iso;

@end


@interface Position :NSObject

@end


@interface Location :NSObject
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * country;
@property (nonatomic , strong) Position              * position;

@end


@interface ExampleModelName :NSObject
@property (nonatomic , copy) NSString              * id;
@property (nonatomic , copy) NSString              * created_at;
@property (nonatomic , copy) NSString              * updated_at;
@property (nonatomic , assign) NSInteger              width;
@property (nonatomic , assign) NSInteger              height;
@property (nonatomic , copy) NSString              * color;
//@property (nonatomic , strong) NSString              * description;
@property (nonatomic , strong) Urls              * urls;
@property (nonatomic , strong) Links              * links;
@property (nonatomic , assign) BOOL              sponsored;
@property (nonatomic , assign) NSInteger              likes;
@property (nonatomic , assign) BOOL              liked_by_user;
@property (nonatomic , strong) User              * user;
@property (nonatomic , strong) Exif              * exif;
@property (nonatomic , strong) Location              * location;
@property (nonatomic , assign) NSInteger              views;
@property (nonatomic , assign) NSInteger              downloads;

@end
