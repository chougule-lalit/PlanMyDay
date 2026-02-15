class ContextObject {
  final Map<String, dynamic> userProfile;
  final List<Map<String, String>> customFacts;
  final String originalRequest;
  final DateTime timestamp;

  ContextObject({
    required this.userProfile,
    required this.customFacts,
    required this.originalRequest,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_profile': userProfile,
      'custom_facts': customFacts,
      'request': originalRequest,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
