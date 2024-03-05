
class _HtmlEditorView extends StatelessWidget {
  const _HtmlEditorView();

  @override
  Widget build(BuildContext context) {
    return Consumer<SummaryDetailPageBloc>(
      builder: (BuildContext context, bloc, Widget? child) => HtmlEditor(
        controller: bloc.controller,
        htmlEditorOptions: HtmlEditorOptions(
          initialText: bloc.profileSummary,
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          customToolbarButtons: [Container()],
          defaultToolbarButtons: [
            const StyleButtons(),
            const FontSettingButtons(fontSizeUnit: false),
            const FontButtons(
                clearAll: false, superscript: false, subscript: false),
            const ListButtons(listStyles: false),
            const ParagraphButtons(
                textDirection: false, lineHeight: false, caseConverter: false),
            const InsertButtons(
                picture: false,
                video: false,
                audio: false,
                table: false,
                hr: false,
                otherFile: false)
          ],
          toolbarPosition: ToolbarPosition.aboveEditor,
          //by default
          toolbarType: ToolbarType.nativeGrid,
          //by default
          onButtonPressed:
              (ButtonType type, bool? status, Function? updateStatus) {
            return true;
          },
          onDropdownChanged: (DropdownType type, dynamic changed,
              Function(dynamic)? updateSelectedItem) {
            return true;
          },
          mediaLinkInsertInterceptor: (String url, InsertFileType type) {
            return true;
          },
        ),
        otherOptions: OtherOptions(
          height: kSummaryHtmlTextFieldHeight,
          decoration: BoxDecoration(
            border: Border.all(color: kLightBrownColor),
          ),
        ),
        callbacks: Callbacks(
            onBeforeCommand: (String? currentHtml) {},
            onChangeContent: (String? changed) {
              var bloc =
                  Provider.of<SummaryDetailPageBloc>(context, listen: false);
              bloc.onChangedSummary(changed);
            },
            onChangeCodeview: (String? changed) {},
            onChangeSelection: (EditorSettings settings) {},
            onDialogShown: () {},
            onEnter: () {},
            onFocus: () {},
            onBlur: () {},
            onBlurCodeview: () {},
            onInit: () {},
            onKeyDown: (int? keyCode) {},
            onKeyUp: (int? keyCode) {},
            onMouseDown: () {},
            onMouseUp: () {},
            onNavigationRequestMobile: (String url) {
              return NavigationActionPolicy.ALLOW;
            },
            onPaste: () {},
            onScroll: () {}),
        plugins: [
          SummernoteAtMention(
              getSuggestionsMobile: (String value) {
                var mentions = <String>['test1', 'test2', 'test3'];
                return mentions
                    .where((element) => element.contains(value))
                    .toList();
              },
              mentionsWeb: ['test1', 'test2', 'test3'],
              onSelect: (String value) {}),
        ],
      ),
    );
  }
}