import 'package:datacraftz_mobile/constant/theme.dart';
import 'package:datacraftz_mobile/core/provider/user_schedule_provider.dart';
import 'package:datacraftz_mobile/views/widgets/button_form_widget.dart';
import 'package:datacraftz_mobile/views/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RatingDriverPage extends StatefulWidget {
  static const String routeName = '/rating-driver-page';
  const RatingDriverPage({super.key});

  @override
  State<RatingDriverPage> createState() => _RatingDriverPageState();
}

class _RatingDriverPageState extends State<RatingDriverPage> {
  double _rating = 0.0;
  final TextEditingController _reviewController = TextEditingController();

  void postRating(UserScheduleProvider userScheduleProvider, String driverId,
      String rating, String review) async {
    final response =
        await userScheduleProvider.ratingDriver(driverId, rating, review);

    if (!mounted) return;

    if (response.statusCode == 200) {
      const CustomSnackBar(
        message: 'Penilaian Supir berhasil disimpan',
        type: SnackBarType.success,
      ).show(context);
      Navigator.pop(context);
    } else {
      const CustomSnackBar(
        message: 'Penilaian Supir gagal disimpan',
        type: SnackBarType.error,
      ).show(context);
    }
  }

  void _updateRating(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    int driverId = ModalRoute.of(context)!.settings.arguments as int;
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
            _buildReviewField(_reviewController),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<UserScheduleProvider>(
          builder: (context, userScheduleProvider, child) {
            if (userScheduleProvider.isLoading) {
              return CustomFilledButton(
                title: '',
                isLoading: userScheduleProvider.isLoading,
              );
            } else {
              return CustomFilledButton(
                title: 'Beri Nilai',
                onPressed: () async {
                  postRating(userScheduleProvider, driverId.toString(),
                      _rating.toString(), _reviewController.text);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildReviewField(TextEditingController controller) {
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
            controller: controller,
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
