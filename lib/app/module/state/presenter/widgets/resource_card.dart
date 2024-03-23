part of '../page/page.dart';

class ResourceCard extends StatelessWidget {
  final String label;
  final String url;
  final IconData iconData;

  const ResourceCard({
    Key? key,
    required this.label,
    required this.url,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(iconData, color: Theme.of(context).colorScheme.secondary),
        title: Text(label, style: TextStyle(color: Theme.of(context).primaryColor)),
        onTap: () => launchURL(context, url),
      ),
    );
  }
}
