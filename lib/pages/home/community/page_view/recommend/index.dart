import 'package:flutter/material.dart';
import 'package:flutter_dating_template/config.dart';
import 'package:flutter_dating_template/wcao/kit/tag.dart';
import 'package:flutter_dating_template/wcao/kit/theme.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

/// HACK: 社区-推荐
class PageViewRecommend extends StatefulWidget {
  const PageViewRecommend({Key? key}) : super(key: key);

  @override
  State<PageViewRecommend> createState() => _PageViewRecommendState();
}

class _PageViewRecommendState extends State<PageViewRecommend> {
  /// mockdata

  String searchText = mock.csentence(min: 3, max: 10);

  /// 热门话题
  List<Map> list = List.generate(mock.integer(min: 4, max: 12), (index) {
    return {
      "avatar":
          '${WcaoConfig.cdn}/avatar/profile/${mock.integer(min: 1, max: 19)}.jpg',
      "tag": mock.cword(min: 2, max: 4)
    };
  });

  /// 热门标签
  List<String> label = List.generate(
      mock.integer(min: 4, max: 10), (index) => mock.cword(min: 4, max: 12));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          search(),
          Container(
            margin: const EdgeInsets.only(top: 24),
            height: 76,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              children: list
                  .map(
                    (item) => Container(
                      margin: const EdgeInsets.only(right: 12),
                      alignment: Alignment.bottomLeft,
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(item['avatar']),
                        ),
                      ),
                      child: Tag(
                        item['tag'],
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 4, right: 6),
                        backgroundColor: WcaoTheme.primary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: label
                  .map((e) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          '# $e',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: WcaoTheme.fsL,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: WcaoTheme.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 36,
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: WcaoTheme.placeholder,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                searchText,
                style: TextStyle(
                  color: WcaoTheme.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
