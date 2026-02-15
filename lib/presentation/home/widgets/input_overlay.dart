import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';
import 'package:plan_my_day/core/theme/app_theme.dart';

class InputOverlay extends StatefulWidget {
  final Function(String) onSend;

  const InputOverlay({super.key, required this.onSend});

  @override
  State<InputOverlay> createState() => _InputOverlayState();
}

class _InputOverlayState extends State<InputOverlay> with SingleTickerProviderStateMixin {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "";
  final TextEditingController _textController = TextEditingController();
  bool _isKeyboardMode = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.8,
      upperBound: 1.2,
    )..repeat(reverse: true);
    
    // Auto-start listening if permission granted? Maybe wait for user interaction to be safe.
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    // Check permission first
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
    }
    
    if (status.isGranted) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (errorNotification) {
            print('onError: $errorNotification');
            setState(() => _isListening = false);
        },
      );
      if (available) {
        _startListening();
      }
    }
  }

  void _startListening() {
    if (!_isKeyboardMode) {
      _speech.listen(
        onResult: (val) => setState(() {
          _text = val.recognizedWords;
          _textController.text = _text;
        }),
      );
      setState(() => _isListening = true);
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _send() {
    print("InputOverlay: _send called");
    _stopListening();
    final finalCheck = _isKeyboardMode ? _textController.text : _text;
    if (finalCheck.isNotEmpty) {
      print("InputOverlay: calling widget.onSend with '$finalCheck'");
      widget.onSend(finalCheck);
    } else {
      print("InputOverlay: text is empty");
    }
  }

  @override
  void dispose() {
    _speech.cancel();
    _pulseController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background.withOpacity(0.95), // High opacity overlay
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Spacer(),
            
            // Transcription Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _isKeyboardMode 
                ? TextField(
                    controller: _textController,
                    autofocus: true,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "Type your plan...",
                      border: OutlineInputBorder(),
                    ),
                  )
                : Text(
                    _text.isEmpty ? "Say something like 'Plan a meeting at 2pm'..." : _text,
                    style: TextStyle(
                      fontSize: 24, 
                      color: _text.isEmpty ? Colors.grey : Colors.white,
                      height: 1.4
                    ),
                    textAlign: TextAlign.center,
                  ),
            ),
            
            const Spacer(),
            
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_isKeyboardMode ? Icons.mic : Icons.keyboard),
                  onPressed: () {
                    setState(() {
                      _isKeyboardMode = !_isKeyboardMode;
                      if (_isKeyboardMode) {
                        _stopListening();
                      } else {
                        // Delay slightly to let UI settle
                        Future.delayed(const Duration(milliseconds: 100), _startListening);
                      }
                    });
                  },
                ),
                const SizedBox(width: 32),
                
                // Main Action Button
                GestureDetector(
                  onTap: _isListening ? _stopListening : (_isKeyboardMode ? _send : _startListening),
                  child: ScaleTransition(
                    scale: _isListening ? _pulseController : const AlwaysStoppedAnimation(1.0),
                    child: Container(
                      width: 80, 
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isListening ? AppTheme.errorRed : AppTheme.focusBlue,
                        boxShadow: [
                          BoxShadow(
                            color: (_isListening ? AppTheme.errorRed : AppTheme.focusBlue).withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ]
                      ),
                      child: Icon(
                        _isListening ? Icons.stop : (_isKeyboardMode ? Icons.send : Icons.mic),
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 32),
                
                 IconButton(
                  icon: const Icon(Icons.send, color: AppTheme.personalTeal),
                  onPressed: _send,
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
