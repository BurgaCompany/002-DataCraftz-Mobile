import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:flutter/material.dart';

class RatingDriverPage extends StatefulWidget {
  static const String routeName = '/rating-driver-page';
  const RatingDriverPage({super.key});

  @override
  State<RatingDriverPage> createState() => _RatingDriverPageState();
}

class _RatingDriverPageState extends State<RatingDriverPage> {
  double _rating = 0.0;

  void _updateRating(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: lightColor,
        title: Text(
          'Beri Nilai Supir',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar(onRatingSelected: _updateRating),
            const SizedBox(height: 20),
            Text(
              'Rating: $_rating',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 20),
            _buildReviewField(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomFilledButton(
          title: 'Beri Nilai',
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildReviewField() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: greyColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ulasan',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            style: greyTextStyle.copyWith(fontSize: 14),
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatefulWidget {
  final ValueChanged<double> onRatingSelected;

  const RatingBar({required this.onRatingSelected, super.key});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double _rating = 0.0;

  void _setRating(double rating) {
    setState(() {
      _rating = rating;
    });
    widget.onRatingSelected(_rating); 
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            _setRating(index + 1.0);
          },
          child: Icon(
            size: DevicesSettings.getHeigth(context) / 14,
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.orange,
          ),
        );
      }),
    );
  }
}
