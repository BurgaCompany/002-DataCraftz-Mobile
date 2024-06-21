import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/screen/page/payment_failed_page.dart';
import 'package:datacraftz_mobile/views/screen/page/payment_succes_page.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentTicketPage extends StatefulWidget {
  static const String routeName = '/payment-ticket-page';
  final String? url;
  const PaymentTicketPage({super.key, this.url});

  @override
  State<PaymentTicketPage> createState() => _PaymentTicketPageState();
}

class _PaymentTicketPageState extends State<PaymentTicketPage> {
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
          onPageStarted: (String url) {
            if (url.contains('status_code=202&transaction_status=deny')) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const PaymentFailedPage();
              }));
            }
            if (url.contains('status_code=200&transaction_status=settlement')) {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const PaymentSuccesPage();
              }));
            }
          },
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
          'https://app.sandbox.midtrans.com/snap/v4/redirection/${widget.url}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text(
          'Posisi Bus',
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
