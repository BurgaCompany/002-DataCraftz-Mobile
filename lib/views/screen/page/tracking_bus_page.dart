import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrackingBusPage extends StatefulWidget {
  static const String routeName = '/tracking-bus-page';
  final String? url;
  const TrackingBusPage({super.key, this.url});

  @override
  State<TrackingBusPage> createState() => _TrackingBusPageState();
}

class _TrackingBusPageState extends State<TrackingBusPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://transgo.burga.web.id/track/bus?bu_id=${widget.url}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text(
          'Tracking Bus',
          style: whiteTextStyle.copyWith(
            color: whiteColor,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
