part of '../page/page.dart';

class AdditionalInfo extends StatelessWidget {
  final StateInfo stateInfo;
  const AdditionalInfo({Key? key, required this.stateInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Código FIPS: ${stateInfo.fips}'),
        Text('Twitter oficial: @${stateInfo.twitter}'),
      ],
    );
  }
}
