import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:pip_view/pip_view.dart';
import 'package:project_emr/views/patient/patient_home_view.dart';
import 'package:project_emr/widgets/widgets.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  VideoCallScreenState createState() => VideoCallScreenState();
}

class VideoCallScreenState extends State<VideoCallScreen> {
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();
  bool _inCalling = false;

  @override
  void initState() {
    super.initState();
    _initRenderers();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  Future<void> _initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  // Function to start the call (This will handle local video)
  Future<void> _startCall() async {
    var mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth': '640',
          'minHeight': '480',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
        'optional': [],
      }
    };

    // Request user media (local video)
    var stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    _localRenderer.srcObject = stream;

    setState(() {
      _inCalling = true;
    });
  }

  // Function to end the call
  Future<void> _endCall() async {
    _localRenderer.srcObject = null;
    setState(() {
      _inCalling = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PIPView(
      builder: (context, isFloating) => Scaffold(
        appBar: CustomAppbar(
          title: 'Flutter WebRTC Video Call',
          autoImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                PIPView.of(context)?.presentBelow(PatientHomeView());
                // Navigator.pop(context);
              },
              icon: Icon(
                Icons.picture_in_picture_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _inCalling ? _endCall : _startCall,
          label: Text(
            _inCalling ? 'End Call' : 'Start Call',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blueAccent,
                child: RTCVideoView(
                  _localRenderer,
                  objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                  mirror: true,
                ),
              ),
            ),
            const Divider(thickness: 10),
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                child: RTCVideoView(
                  _remoteRenderer,
                  objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                  mirror: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
