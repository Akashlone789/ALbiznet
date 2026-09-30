// user_models.dart

class ALbiznetUser {
  String id;
  String name;
  String mobile;
  String type; // 'People' किंवा 'Business'
  bool isPrivate; // ग्राहकांसाठी प्रायव्हसी सेटिंग

  ALbiznetUser({
    required this.id, 
    required this.name, 
    required this.mobile, 
    required this.type, 
    this.isPrivate = false
  });
}

class BusinessProfile {
  String businessId;
  String businessName;
  double latitude; // गुगल मॅप लोकेशन (Latitude)
  double longitude; // गुगल मॅप लोकेशन (Longitude)
  List<String> products; // दुकानातील सर्व्हिसेस किंवा प्रॉडक्ट्स

  BusinessProfile({
    required this.businessId, 
    required this.businessName, 
    required this.latitude, 
    required this.longitude, 
    required this.products
  });
}

class PublicPost {
  String postId;
  String userId;
  String businessId;
  String photoUrl;
  String review; // सर्वांना दिसणारा रिव्ह्यू
  int rating;

  PublicPost({
    required this.postId, 
    required this.userId, 
    required this.businessId, 
    required this.photoUrl, 
    required this.review, 
    required this.rating
  });
}
