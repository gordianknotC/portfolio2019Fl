import 'package:dart_common/dart_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/audio_resources.dart';
import 'package:simple_audio_button/simple_audio_button.dart';
import 'package:layout_widgets/src/models/tag.dart';
import 'package:layout_widgets/src/widgets/debugs.dart';
import 'package:layout_widgets/src/widgets/responsive_widget.dart';
import 'package:layout_widgets/src/widgets/stateful.dart';
import 'package:layout_widgets/src/widgets/tag.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/keys.dart';
import 'package:portfolio/constants/text_styles.dart';
import 'package:portfolio/icons/my_flutter_app_icons.dart';
import 'package:portfolio/models/models.dart';

final _D = Logger.filterableLogger(moduleName: 'SKILL');

class SkillTitle extends StatelessWidget {
  final IconData icon;
  final String titleA;
  final String titleB;
  final String subtitle;
  final double size;
  final int subtitleRefLength;
  final double decorSpacing;

  const SkillTitle({
    required this.icon,
    required this.titleA,
    required this.titleB,
    required this.subtitle,
    this.size = 24,
    this.subtitleRefLength = 16,
    this.decorSpacing = 3.0
  });

  @override
  Widget build(BuildContext context) {
    final _icon = Icon(icon, size: size, color: MColors.skillTitleIcon);
    final strut = IS_MOBILE
        ? StrutStyle(height: 1, fontSize: size * 10 / 24.toInt())
        : StrutStyle(height: 1, fontSize: size * 10 / 24.toInt());
    final double titleHeight = IS_MOBILE ? 1 : 0;

    final _title = Literal.spans([
      Literal.spanH5C(titleA, MColors.textDark,
          height: titleHeight, fontSize: size * 15 / 24.toInt().toDouble()),
      Literal.spanH5C(titleB, MColors.textAccent,
          height: titleHeight, fontSize: size * 15 / 24.toInt().toDouble()),
    ], strutStyle: strut);

    final _subtitle = Literal.decorp(subtitle,
        adapt: true, refLength: subtitleRefLength, spacing: decorSpacing);
    return BoundingBox(
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Paddings.skillIcon(child: _icon),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoundingBox(child: _title),
                  BoundingBox(child: _subtitle)
                ])
          ]),
    );
  }
}

class _SkillSectionId extends StatelessWidget {
  final SkillSection section;

  const _SkillSectionId(this.section);

  Widget buildLiteralContent() {
    final a = Literal.spanLink;
    final p = Literal.spanP;
    return Text.rich(TextSpan(children: [
      p("??????????????????????????????"),
      ..."?????????X3, office???x2, ?????????x1".split(',').map((t) {
        return TextSpan(children: [a(t), p(", ")]);
      }),
      p("??????"),
      a("??????", link: ""),
      p("???????????????????????????, ???????????????????????????????????????, ????????????????????? - ???"),
      a("???????????????", link: ""),
      p("??????, ??????????????????NCT??????, ???????????????, ?????????????????????????????????????????????. ??????"),
      a("??????", link: ""),
      p("??????????????????. ????????????????????????????????????, ??????????????????????????????Sketch, ???????????????????????????, ??????????????????????????????UI???????????????."),
    ]));
  }

  Widget buildTitle() {
    final titleA = section.title.substring(0, 2);
    final titleB = section.title.substring(2);
    return SkillTitle(
        icon: section.icon,
        titleA: titleA,
        titleB: titleB,
        subtitle: section.subtitle);

    /*final icon  = Icon(section.icon, size: 24, color: MColors.skillTitleIcon);
		final strut = IS_MOBILE
			? StrutStyle(height: 1, fontSize: 10)
			: StrutStyle(height: 1, fontSize: 10);
		final double titleHeight = IS_MOBILE ? 1 : 0;

		final title = Literal.spans([
			Literal.spanH5(section.title.substring(0, 2), MColors.textDark, height:titleHeight),
			Literal.spanH5(section.title.substring(2), MColors.textAccent, height:titleHeight),
		], strutStyle: strut);

		final subtitle = Literal.decorp(section.subtitle);
		return BoundingBox(
		  child: Row(
		  	mainAxisSize: MainAxisSize.min,
		  	mainAxisAlignment: MainAxisAlignment.start,
		  	crossAxisAlignment: CrossAxisAlignment.center,
		  	children:[
		  		Paddings.skillIcon(child: icon),
		  		Column(
		  			crossAxisAlignment: CrossAxisAlignment.start,
		  			mainAxisAlignment: MainAxisAlignment.center,
		  			mainAxisSize: MainAxisSize.min,
		  			children:[
		  				BoundingBox(child: title),
		  				BoundingBox(child: subtitle)
		  		])
		  	]
		  ),
		);*/
  }

  Widget buildCloud() {
    return Wrap(
      children: section.clouds
          .map((c) => CloudTag(
                c,
                bgColor: MColors.skillEclipseBg,
                iconColor: MColors.skillTitleIcon.withOpacity(0.7),
                padding: Paddings.cloudPadding,
                style: TextStyles.p.copyWith(color: MColors.skillText),
              ))
          .toList(),
      spacing: 9, // horizontal spacing
      runSpacing: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      buildTitle(),
      Paddings.skillContent(child: buildLiteralContent()),
      Paddings.cloudTags(child: buildCloud())
    ]);
  }
}

class _SkillSectionProgramming extends _SkillSectionId {
  // ignore: prefer_const_constructors_in_immutables
  _SkillSectionProgramming(SkillSection section) : super(section);

  @override
  Widget buildLiteralContent() {
    final a = Literal.spanLink;
    final p = Literal.spanP;
    final b = Literal.spanAcc;
    return RichText(
        text: TextSpan(children: [
      p('??????coding?????????'),
      b("Flash"),
      p("???????????????, ????????????"),
      b("Flash"),
      a("?????????"),
      p("????????????????????????"),
      b("python kivy android app"),
      p("????????????????????????"),
      b("???????????????APP"),
      p(" ?????????????????????????????????????????????, ??????????????????????????????. ?????????python to javascript "),
      b("compiler"),
      p("????????????????????????, ?????????"),
      b("DSL"),
      p("??????compile to html, ????????????????????????, "),
      b("VueJS"),
      p("???????????????"),
      a("?????????"),
      p(", ???"),
      a("???????????????????????????"),
      p("???????????????????????????????????????"),
      p("??????????????????, ???"),
      b("Flutter"),
      p("??????android "),
      b("nfc"),
      p("app, ??????????????????????????????, ?????????????????????????????????????????????????????????."),
      p("?????????????????????about ???????????????"),
      b("Flutter"),
      p("????????????")
    ]));
  }
}

class _SkillSectionUi extends _SkillSectionId {
// ignore: prefer_const_constructors_in_immutables
  _SkillSectionUi(SkillSection section) : super(section);

  @override
  Widget buildLiteralContent() {
    final a = Literal.spanLink;
    final p = Literal.spanP;
    final b = Literal.spanAcc;
    return RichText(
        text: TextSpan(children: [
      a("?????????APP"),
      b("UI??????"),
      p("(???????????????),"),
      p("????????????????????????UI?????????????????????, ?????????????????????????????????, ????????????"),
      b("UI??????"),
      p("???, ?????????????????????????????????, ???????????????????????????????????????UI???????????????, ?????????????????????????????????????????????????????????????????????"),
    ]));
  }
}

// ignore: must_be_immutable
class _SkillSectionMusic extends _SkillSectionId {
  SimpleAudioGroup<AudioModel>? group;
  Widget? _responsiveMediumLarge;
  Widget? _responsiveSmall;
  List<SimpleAudioButton>? _buttons;

  _SkillSectionMusic(SkillSection section) : super(section);

  void onPlayerPressed(AudioModel model) {
    _D.d(()=>'update audio group activatedList: ${model.url}');
    group!.awareness.setActivations([model]);
  }

  SimpleAudioButton audioBt({required AudioModel model, required double width, Key? key}) {
    return SimpleAudioButton(
      model,
      width: width,
      onPress: onPlayerPressed,
      awareness: () => group!.awareness,
      key: key,
      spinIcon: CustomIcons.spin4,
      activeIconColor: MColors.textAccent,
      inactiveIconColor: MColors.skillText,
      literalStyle: TextStyles.p,
      accentStyle: TextStyles.bodyAccent,
      boldStyle: TextStyles.bodyBold,
      progressBgColor: MColors.audioProgressBg.withOpacity(0.15),
      inProgressColor: MColors.textAccent,
    );
  }

  Widget buildMusicControls() {
    final w = section.constraints.maxWidth;
    _D.d(()=>'rebuild _SkillSectionMusicA, w: $w');

    try {
      return group = SimpleAudioGroup<AudioModel>(
          key: Keys.skillMusicAudioGroup,
          resources: [
            AudioResources.electronicalA,
            AudioResources.electronicalB,
            AudioResources.gameTrack,
            AudioResources.school
          ],
          builder: (ctx, resources) {
            _buttons ??= <SimpleAudioButton>[
              audioBt(
                  model: resources[0],
                  width: w / 2,
                  key: Keys.skillMusicAudioGroupS1),
              audioBt(
                  model: resources[1],
                  width: w / 2,
                  key: Keys.skillMusicAudioGroupS2),
              audioBt(
                  model: resources[2],
                  width: w / 2,
                  key: Keys.skillMusicAudioGroupS3),
              audioBt(
                  model: resources[3],
                  width: w / 2,
                  key: Keys.skillMusicAudioGroupS4),
            ];

            _responsiveMediumLarge ??=
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buttons![0],
                    ),
                    Expanded(
                      child: _buttons![1],
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buttons![2],
                    ),
                    Expanded(
                      child: _buttons![3],
                    )
                  ]),
            ]);

            _responsiveSmall ??=
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buttons![0],
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buttons![1],
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buttons![2],
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buttons![3],
                    )
                  ]),
            ]);
            return ResponsiveElt(
                large: _responsiveMediumLarge!,
                medium: _responsiveMediumLarge!,
                small: _responsiveSmall!,
                media: TRWMedia.fromConstaints(section.constraints),
                responsiveSize: SIZE_SKILLAUDIO);
          });
    } catch (e, s) {
      _D.d(()=>'[ERROR] _SkillSectionMusic.buildMusicControls failed: $e\n$s');
      rethrow;
    }
  }

  @override
  Widget buildLiteralContent() {
//		final a = Literal.spanLink;
    final p = Literal.spanP;
    final b = Literal.spanAcc;
    return RichText(
        text: TextSpan(children: [
      p("?????????????????????????????????, ??????????????????????????????????????????????????????????????????, ????????????????????????????????????"),
      b("????????????????????????"),
      p("???, ????????????????????????????????????, ???????????????????????????"),
      b("??????????????????"),
      p("????????????????????????????????????. ")
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          Paddings.skillContent(child: buildLiteralContent()),
          SizedBox(height: 15),
          // note:
          Flexible(fit: FlexFit.loose, child: buildMusicControls()),
          SizedBox(height: 15),
          // note:
          Flexible(
              fit: FlexFit.loose,
              child: Paddings.cloudTags(child: buildCloud())),
        ]);
  }
}

enum _EType { id, ui, programming, music }

class SkillSection extends StatelessWidget {
  static double paddingTop = 0;
  static double serialPaddingTop = 20;
  static double serialPaddingBottom = 15;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Ttag> clouds;
  final BoxConstraints constraints;
  final _EType type;

  const SkillSection.id(this.constraints)
      : title = "????????????",
        subtitle = "product design",
        icon = SkillModel.industrialDesignIcon,
        type = _EType.id,
        clouds = SkillModel.industrialDesign;

  const SkillSection.ui(this.constraints)
      : title = "UI??????",
        subtitle = "ui design",
        icon = SkillModel.uiDesignIcon,
        type = _EType.ui,
        clouds = SkillModel.uiDesign;

  const SkillSection.programming(this.constraints)
      : title = "????????????",
        subtitle = "programming design",
        icon = SkillModel.programmingDesignIcon,
        type = _EType.programming,
        clouds = SkillModel.programmingDesign;

  const SkillSection.music(this.constraints)
      : title = "????????????",
        subtitle = "music composition",
        icon = SkillModel.musicIcon,
        type = _EType.music,
        clouds = SkillModel.musicComposition;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _EType.id:
        _D.d(()=>'build SkillSectionId');
        return _SkillSectionId(this);
      case _EType.ui:
        _D.d(()=>'build _SkillSectionUi');
        return _SkillSectionUi(this);
      case _EType.programming:
        _D.d(()=>'build _SkillSectionProgramming');
        return _SkillSectionProgramming(this);
      case _EType.music:
        _D.d(()=>'build _SkillSectionMusic');
        return _SkillSectionMusic(this);
      default:
        throw Exception('uncaught Exception');
    }
  }
}
