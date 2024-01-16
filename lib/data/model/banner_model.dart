class BannerModel {
  List<Campaigns>? campaigns;
  List<Banners>? banners;

  BannerModel({this.campaigns, this.banners});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['campaigns'] != null) {
      campaigns = <Campaigns>[];
      json['campaigns'].forEach((v) {
        campaigns!.add(Campaigns.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.campaigns != null) {
      data['campaigns'] = this.campaigns!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Campaigns {
  int? id;
  String? title;
  String? image;
  String? description;
  int? status;
  Null? adminId;
  String? createdAt;
  String? updatedAt;
  String? startTime;
  String? endTime;
  Null? slug;
  String? availableDateStarts;
  String? availableDateEnds;
  List<Restaurants>? restaurants;
  List<Translations>? translations;

  Campaigns(
      {this.id,
        this.title,
        this.image,
        this.description,
        this.status,
        this.adminId,
        this.createdAt,
        this.updatedAt,
        this.startTime,
        this.endTime,
        this.slug,
        this.availableDateStarts,
        this.availableDateEnds,
        this.restaurants,
        this.translations});

  Campaigns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    adminId = json['admin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    slug = json['slug'];
    availableDateStarts = json['available_date_starts'];
    availableDateEnds = json['available_date_ends'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['status'] = this.status;
    data['admin_id'] = this.adminId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['slug'] = this.slug;
    data['available_date_starts'] = this.availableDateStarts;
    data['available_date_ends'] = this.availableDateEnds;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurants {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  Null? footerText;
  int? minimumOrder;
  int? comission;
  bool? scheduleOrder;
  Null? openingTime;
  Null? closeingTime;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? foodSection;
  double? tax;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  String? offDay;
  int? selfDeliverySystem;
  bool? posSystem;
  int? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  Null? perKmShippingCharge;
  String? restaurantModel;
  Null? maximumShippingCharge;
  String? slug;
  bool? orderSubscriptionActive;
  bool? cutlery;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? announcement;
  String? announcementMessage;
  Null? qrCode;
  Null? additionalData;
  String? additionalDocuments;
  int? campaignId;
  int? restaurantId;
  String? campaignStatus;
  int? open;
  double? distance;
  List<Coupons>? coupons;
  String? deliveryFee;
  int? restaurantStatus;
  List<Cuisine>? cuisine;
  double? avgRating;
  int? ratingCount;
  int? positiveRating;
  int? customerOrderDate;
  bool? customerDateOrderSratus;
  bool? instantOrder;
  bool? gstStatus;
  String? gstCode;
  bool? freeDeliveryDistanceStatus;
  String? freeDeliveryDistanceValue;
  List<Translations>? translations;
  String? availableTimeStarts;
  String? availableTimeEnds;

  Restaurants(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.logo,
        this.latitude,
        this.longitude,
        this.address,
        this.footerText,
        this.minimumOrder,
        this.comission,
        this.scheduleOrder,
        this.openingTime,
        this.closeingTime,
        this.status,
        this.vendorId,
        this.createdAt,
        this.updatedAt,
        this.freeDelivery,
        this.coverPhoto,
        this.delivery,
        this.takeAway,
        this.foodSection,
        this.tax,
        this.zoneId,
        this.reviewsSection,
        this.active,
        this.offDay,
        this.selfDeliverySystem,
        this.posSystem,
        this.minimumShippingCharge,
        this.deliveryTime,
        this.veg,
        this.nonVeg,
        this.orderCount,
        this.totalOrder,
        this.perKmShippingCharge,
        this.restaurantModel,
        this.maximumShippingCharge,
        this.slug,
        this.orderSubscriptionActive,
        this.cutlery,
        this.metaTitle,
        this.metaDescription,
        this.metaImage,
        this.announcement,
        this.announcementMessage,
        this.qrCode,
        this.additionalData,
        this.additionalDocuments,
        this.campaignId,
        this.restaurantId,
        this.campaignStatus,
        this.open,
        this.distance,
        this.coupons,
        this.deliveryFee,
        this.restaurantStatus,
        this.cuisine,
        this.avgRating,
        this.ratingCount,
        this.positiveRating,
        this.customerOrderDate,
        this.customerDateOrderSratus,
        this.instantOrder,
        this.gstStatus,
        this.gstCode,
        this.freeDeliveryDistanceStatus,
        this.freeDeliveryDistanceValue,
        this.translations,
        this.availableTimeStarts,
        this.availableTimeEnds});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order'];
    comission = json['comission'];
    scheduleOrder = json['schedule_order'];
    openingTime = json['opening_time'];
    closeingTime = json['closeing_time'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    foodSection = json['food_section'];
    tax = json['tax'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    offDay = json['off_day'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    minimumShippingCharge = json['minimum_shipping_charge'];
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    orderCount = json['order_count'];
    totalOrder = json['total_order'];
    perKmShippingCharge = json['per_km_shipping_charge'];
    restaurantModel = json['restaurant_model'];
    maximumShippingCharge = json['maximum_shipping_charge'];
    slug = json['slug'];
    orderSubscriptionActive = json['order_subscription_active'];
    cutlery = json['cutlery'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    announcement = json['announcement'];
    announcementMessage = json['announcement_message'];
    qrCode = json['qr_code'];
    additionalData = json['additional_data'];
    additionalDocuments = json['additional_documents'];
    campaignId = json['campaign_id'];
    restaurantId = json['restaurant_id'];
    campaignStatus = json['campaign_status'];
    open = json['open'];
    distance = json['distance'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(new Coupons.fromJson(v));
      });
    }
    deliveryFee = json['delivery_fee'];
    restaurantStatus = json['restaurant_status'];
    if (json['cuisine'] != null) {
      cuisine = <Cuisine>[];
      json['cuisine'].forEach((v) {
        cuisine!.add(new Cuisine.fromJson(v));
      });
    }
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];
    positiveRating = json['positive_rating'];
    customerOrderDate = json['customer_order_date'];
    customerDateOrderSratus = json['customer_date_order_sratus'];
    instantOrder = json['instant_order'];
    gstStatus = json['gst_status'];
    gstCode = json['gst_code'];
    freeDeliveryDistanceStatus = json['free_delivery_distance_status'];
    freeDeliveryDistanceValue = json['free_delivery_distance_value'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['footer_text'] = this.footerText;
    data['minimum_order'] = this.minimumOrder;
    data['comission'] = this.comission;
    data['schedule_order'] = this.scheduleOrder;
    data['opening_time'] = this.openingTime;
    data['closeing_time'] = this.closeingTime;
    data['status'] = this.status;
    data['vendor_id'] = this.vendorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['free_delivery'] = this.freeDelivery;
    data['cover_photo'] = this.coverPhoto;
    data['delivery'] = this.delivery;
    data['take_away'] = this.takeAway;
    data['food_section'] = this.foodSection;
    data['tax'] = this.tax;
    data['zone_id'] = this.zoneId;
    data['reviews_section'] = this.reviewsSection;
    data['active'] = this.active;
    data['off_day'] = this.offDay;
    data['self_delivery_system'] = this.selfDeliverySystem;
    data['pos_system'] = this.posSystem;
    data['minimum_shipping_charge'] = this.minimumShippingCharge;
    data['delivery_time'] = this.deliveryTime;
    data['veg'] = this.veg;
    data['non_veg'] = this.nonVeg;
    data['order_count'] = this.orderCount;
    data['total_order'] = this.totalOrder;
    data['per_km_shipping_charge'] = this.perKmShippingCharge;
    data['restaurant_model'] = this.restaurantModel;
    data['maximum_shipping_charge'] = this.maximumShippingCharge;
    data['slug'] = this.slug;
    data['order_subscription_active'] = this.orderSubscriptionActive;
    data['cutlery'] = this.cutlery;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_image'] = this.metaImage;
    data['announcement'] = this.announcement;
    data['announcement_message'] = this.announcementMessage;
    data['qr_code'] = this.qrCode;
    data['additional_data'] = this.additionalData;
    data['additional_documents'] = this.additionalDocuments;
    data['campaign_id'] = this.campaignId;
    data['restaurant_id'] = this.restaurantId;
    data['campaign_status'] = this.campaignStatus;
    data['open'] = this.open;
    data['distance'] = this.distance;
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    data['delivery_fee'] = this.deliveryFee;
    data['restaurant_status'] = this.restaurantStatus;
    if (this.cuisine != null) {
      data['cuisine'] = this.cuisine!.map((v) => v.toJson()).toList();
    }
    data['avg_rating'] = this.avgRating;
    data['rating_count'] = this.ratingCount;
    data['positive_rating'] = this.positiveRating;
    data['customer_order_date'] = this.customerOrderDate;
    data['customer_date_order_sratus'] = this.customerDateOrderSratus;
    data['instant_order'] = this.instantOrder;
    data['gst_status'] = this.gstStatus;
    data['gst_code'] = this.gstCode;
    data['free_delivery_distance_status'] = this.freeDeliveryDistanceStatus;
    data['free_delivery_distance_value'] = this.freeDeliveryDistanceValue;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    return data;
  }
}

class Coupons {
  int? id;
  String? title;
  String? code;
  String? startDate;
  String? expireDate;
  int? minPurchase;
  int? maxDiscount;
  int? discount;
  String? discountType;
  String? couponType;
  int? limit;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? data;
  int? totalUses;
  String? createdBy;
  String? customerId;
  Null? slug;
  int? restaurantId;
  List<Translations>? translations;

  Coupons(
      {this.id,
        this.title,
        this.code,
        this.startDate,
        this.expireDate,
        this.minPurchase,
        this.maxDiscount,
        this.discount,
        this.discountType,
        this.couponType,
        this.limit,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.data,
        this.totalUses,
        this.createdBy,
        this.customerId,
        this.slug,
        this.restaurantId,
        this.translations});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    minPurchase = json['min_purchase'];
    maxDiscount = json['max_discount'];
    discount = json['discount'];
    discountType = json['discount_type'];
    couponType = json['coupon_type'];
    limit = json['limit'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    data = json['data'];
    totalUses = json['total_uses'];
    createdBy = json['created_by'];
    customerId = json['customer_id'];
    slug = json['slug'];
    restaurantId = json['restaurant_id'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['start_date'] = this.startDate;
    data['expire_date'] = this.expireDate;
    data['min_purchase'] = this.minPurchase;
    data['max_discount'] = this.maxDiscount;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['coupon_type'] = this.couponType;
    data['limit'] = this.limit;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['data'] = this.data;
    data['total_uses'] = this.totalUses;
    data['created_by'] = this.createdBy;
    data['customer_id'] = this.customerId;
    data['slug'] = this.slug;
    data['restaurant_id'] = this.restaurantId;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  Null? createdAt;
  Null? updatedAt;

  Translations(
      {this.id,
        this.translationableType,
        this.translationableId,
        this.locale,
        this.key,
        this.value,
        this.createdAt,
        this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    translationableType = json['translationable_type'];
    translationableId = json['translationable_id'];
    locale = json['locale'];
    key = json['key'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['translationable_type'] = this.translationableType;
    data['translationable_id'] = this.translationableId;
    data['locale'] = this.locale;
    data['key'] = this.key;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Cuisine {
  int? id;
  String? name;
  String? image;
  int? status;
  String? slug;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  List<Translations>? translations;

  Cuisine(
      {this.id,
        this.name,
        this.image,
        this.status,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.translations});

  Cuisine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pivot {
  int? restaurantId;
  int? cuisineId;

  Pivot({this.restaurantId, this.cuisineId});

  Pivot.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    cuisineId = json['cuisine_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['cuisine_id'] = this.cuisineId;
    return data;
  }
}

class Banners {
  int? id;
  String? title;
  String? type;
  String? image;
  Restaurant? restaurant;
  Null? food;

  Banners(
      {this.id, this.title, this.type, this.image, this.restaurant, this.food});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    image = json['image'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    food = json['food'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['image'] = this.image;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    data['food'] = this.food;
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  Null? footerText;
  int? minimumOrder;
  Null? comission;
  bool? scheduleOrder;
  Null? openingTime;
  Null? closeingTime;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? foodSection;
  double? tax;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  String? offDay;
  int? selfDeliverySystem;
  bool? posSystem;
  int? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  Null? perKmShippingCharge;
  String? restaurantModel;
  Null? maximumShippingCharge;
  String? slug;
  bool? orderSubscriptionActive;
  bool? cutlery;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? announcement;
  String? announcementMessage;
  Null? qrCode;
  Null? additionalData;
  String? additionalDocuments;
  int? restaurantStatus;
  List<Coupons>? coupons;
  List<Cuisine>? cuisine;
  double? avgRating;
  int? ratingCount;
  int? positiveRating;
  int? customerOrderDate;
  bool? customerDateOrderSratus;
  bool? instantOrder;
  String? deliveryFee;
  bool? gstStatus;
  String? gstCode;
  bool? freeDeliveryDistanceStatus;
  String? freeDeliveryDistanceValue;
  List<Translations>? translations;

  Restaurant(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.logo,
        this.latitude,
        this.longitude,
        this.address,
        this.footerText,
        this.minimumOrder,
        this.comission,
        this.scheduleOrder,
        this.openingTime,
        this.closeingTime,
        this.status,
        this.vendorId,
        this.createdAt,
        this.updatedAt,
        this.freeDelivery,
        this.coverPhoto,
        this.delivery,
        this.takeAway,
        this.foodSection,
        this.tax,
        this.zoneId,
        this.reviewsSection,
        this.active,
        this.offDay,
        this.selfDeliverySystem,
        this.posSystem,
        this.minimumShippingCharge,
        this.deliveryTime,
        this.veg,
        this.nonVeg,
        this.orderCount,
        this.totalOrder,
        this.perKmShippingCharge,
        this.restaurantModel,
        this.maximumShippingCharge,
        this.slug,
        this.orderSubscriptionActive,
        this.cutlery,
        this.metaTitle,
        this.metaDescription,
        this.metaImage,
        this.announcement,
        this.announcementMessage,
        this.qrCode,
        this.additionalData,
        this.additionalDocuments,
        this.restaurantStatus,
        this.coupons,
        this.cuisine,
        this.avgRating,
        this.ratingCount,
        this.positiveRating,
        this.customerOrderDate,
        this.customerDateOrderSratus,
        this.instantOrder,
        this.deliveryFee,
        this.gstStatus,
        this.gstCode,
        this.freeDeliveryDistanceStatus,
        this.freeDeliveryDistanceValue,
        this.translations});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order'];
    comission = json['comission'];
    scheduleOrder = json['schedule_order'];
    openingTime = json['opening_time'];
    closeingTime = json['closeing_time'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    foodSection = json['food_section'];
    tax = json['tax'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    offDay = json['off_day'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    minimumShippingCharge = json['minimum_shipping_charge'];
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    orderCount = json['order_count'];
    totalOrder = json['total_order'];
    perKmShippingCharge = json['per_km_shipping_charge'];
    restaurantModel = json['restaurant_model'];
    maximumShippingCharge = json['maximum_shipping_charge'];
    slug = json['slug'];
    orderSubscriptionActive = json['order_subscription_active'];
    cutlery = json['cutlery'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    announcement = json['announcement'];
    announcementMessage = json['announcement_message'];
    qrCode = json['qr_code'];
    additionalData = json['additional_data'];
    additionalDocuments = json['additional_documents'];
    restaurantStatus = json['restaurant_status'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(new Coupons.fromJson(v));
      });
    }
    if (json['cuisine'] != null) {
      cuisine = <Cuisine>[];
      json['cuisine'].forEach((v) {
        cuisine!.add(new Cuisine.fromJson(v));
      });
    }
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];
    positiveRating = json['positive_rating'];
    customerOrderDate = json['customer_order_date'];
    customerDateOrderSratus = json['customer_date_order_sratus'];
    instantOrder = json['instant_order'];
    deliveryFee = json['delivery_fee'];
    gstStatus = json['gst_status'];
    gstCode = json['gst_code'];
    freeDeliveryDistanceStatus = json['free_delivery_distance_status'];
    freeDeliveryDistanceValue = json['free_delivery_distance_value'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['footer_text'] = this.footerText;
    data['minimum_order'] = this.minimumOrder;
    data['comission'] = this.comission;
    data['schedule_order'] = this.scheduleOrder;
    data['opening_time'] = this.openingTime;
    data['closeing_time'] = this.closeingTime;
    data['status'] = this.status;
    data['vendor_id'] = this.vendorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['free_delivery'] = this.freeDelivery;
    data['cover_photo'] = this.coverPhoto;
    data['delivery'] = this.delivery;
    data['take_away'] = this.takeAway;
    data['food_section'] = this.foodSection;
    data['tax'] = this.tax;
    data['zone_id'] = this.zoneId;
    data['reviews_section'] = this.reviewsSection;
    data['active'] = this.active;
    data['off_day'] = this.offDay;
    data['self_delivery_system'] = this.selfDeliverySystem;
    data['pos_system'] = this.posSystem;
    data['minimum_shipping_charge'] = this.minimumShippingCharge;
    data['delivery_time'] = this.deliveryTime;
    data['veg'] = this.veg;
    data['non_veg'] = this.nonVeg;
    data['order_count'] = this.orderCount;
    data['total_order'] = this.totalOrder;
    data['per_km_shipping_charge'] = this.perKmShippingCharge;
    data['restaurant_model'] = this.restaurantModel;
    data['maximum_shipping_charge'] = this.maximumShippingCharge;
    data['slug'] = this.slug;
    data['order_subscription_active'] = this.orderSubscriptionActive;
    data['cutlery'] = this.cutlery;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_image'] = this.metaImage;
    data['announcement'] = this.announcement;
    data['announcement_message'] = this.announcementMessage;
    data['qr_code'] = this.qrCode;
    data['additional_data'] = this.additionalData;
    data['additional_documents'] = this.additionalDocuments;
    data['restaurant_status'] = this.restaurantStatus;
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    if (this.cuisine != null) {
      data['cuisine'] = this.cuisine!.map((v) => v.toJson()).toList();
    }
    data['avg_rating'] = this.avgRating;
    data['rating_count'] = this.ratingCount;
    data['positive_rating'] = this.positiveRating;
    data['customer_order_date'] = this.customerOrderDate;
    data['customer_date_order_sratus'] = this.customerDateOrderSratus;
    data['instant_order'] = this.instantOrder;
    data['delivery_fee'] = this.deliveryFee;
    data['gst_status'] = this.gstStatus;
    data['gst_code'] = this.gstCode;
    data['free_delivery_distance_status'] = this.freeDeliveryDistanceStatus;
    data['free_delivery_distance_value'] = this.freeDeliveryDistanceValue;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
