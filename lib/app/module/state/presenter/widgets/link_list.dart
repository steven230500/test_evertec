part of '../page/page.dart';

class LinkList extends StatelessWidget {
  final StateInfo stateInfo;
  const LinkList({Key? key, required this.stateInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> links = [
      {
        'label': 'Sitio oficial COVID-19',
        'url': stateInfo.covid19Site,
        'icon': Icons.public,
      },
      {
        'label': 'Sitio anterior COVID-19',
        'url': stateInfo.covid19SiteOld,
        'icon': Icons.history,
      },
      {
        'label': 'Dashboard secundario',
        'url': stateInfo.covid19SiteSecondary,
        'icon': Icons.dashboard,
      },
    ];

    return Column(
      children: links
          .where((link) => link['url']!.isNotEmpty)
          .map((link) => ResourceCard(
                label: link['label'],
                url: link['url'],
                iconData: link['icon'],
              ))
          .toList(),
    );
  }
}
