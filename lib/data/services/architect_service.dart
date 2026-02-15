import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:plan_my_day/data/model/context_object.dart';
import 'package:plan_my_day/data/model/schedule.dart';
import 'dart:convert';

class ArchitectService {
  late final GenerativeModel _model;
  final String apiKey;

  ArchitectService(this.apiKey) {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash', 
      apiKey: apiKey,
      generationConfig: GenerationConfig(responseMimeType: 'application/json'),
    );
  }

  Future<Schedule> generateSchedule(ContextObject context) async {
    final prompt = '''
    You are an expert daily planner Architect.
    
    Context:
    ${jsonEncode(context.toJson())}
    
    Goal: Create a realistic daily schedule based on the User Profile and Custom Facts.
    Rules:
    1. Respect sleep/wake times.
    2. Account for travel time between locations if known.
    3. Resolve conflicts by prioritizing "Work" during work hours.
    
    Output JSON Schema:
    {
      "date": "YYYY-MM-DD",
      "tasks": [
        {
          "title": "Task Name",
          "start_time": "ISO8601",
          "end_time": "ISO8601",
          "type": "Focus" | "Travel" | "Buffer" | "Errand",
          "status": "Pending",
          "location": "Optional Name"
        }
      ]
    }
    ''';

    final content = [Content.text(prompt)];
    final response = await _model.generateContent(content);
    
    if (response.text == null) throw Exception("Empty response from Architect");

    try {
      final data = jsonDecode(response.text!);
      return Schedule.fromJson(data);
    } catch (e) {
      throw Exception("Failed to parse Architect response: $e");
    }
  }
}
