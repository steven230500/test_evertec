import 'package:flutter/material.dart';
import 'package:test_evertec/app/core/models/state_info.dart';
import 'package:test_evertec/app/module/state/presenter/utils/lauch_url.dart';

part '../widgets/link_list.dart';
part '../widgets/resource_card.dart';
part '../widgets/aditional_info.dart';
part '../widgets/section_title.dart';
part '../widgets/text_content.dart';

class StatePage extends StatelessWidget {
  final StateInfo stateInfo;

  const StatePage({super.key, required this.stateInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stateInfo.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Detalles de ${stateInfo.name}'),
            const Divider(height: 20, thickness: 2),
            const SizedBox(height: 10),
            const SectionTitle(title: 'Notas'),
            TextContent(text: stateInfo.notes),
            const SizedBox(height: 20),
            const SectionTitle(title: 'Recursos importantes'),
            LinkList(stateInfo: stateInfo),
            const SizedBox(height: 20),
            const SectionTitle(title: 'Información adicional'),
            AdditionalInfo(stateInfo: stateInfo),
          ],
        ),
      ),
    );
  }
}
