import json
from flask import Flask, request
app = Flask(__name__)


@app.route('/v1/vshow/rank/group', methods=["POST", "GET"])
def queryGameScoreRankList():

    if request.method == 'POST':
        type = request.form['type']
        if type == '1':
            return json.dumps(testShenjiaGroup())
        else:
            return json.dumps(testMeiliGroup())


def testShenjiaGroup():

    test = {
        "ec": 0,
        "em": "上传成功",
        "timesec": 1617006543,
        "data": {
            "page": 0,
            "pageSize": 100,
            "hasMore": 0,
            "lists": [
                                {
                    "rank": 1,
                    "momoid": "100000",
                    "name": "身价榜北京排名",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 2,
                    "momoid": "100000",
                    "name": "啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 3,
                    "momoid": "100000",
                    "name": "收到发生的范德萨啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "F",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 4,
                    "momoid": "100000",
                    "name": "sad发生的发生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "277.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 5,
                    "momoid": "100000",
                    "name": "的发生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "27.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                                {
                    "rank": 6,
                    "momoid": "100000",
                    "name": "生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "27.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                }
            ],
            "myRankInfo": {
                "momoid": "26438046",
                "name": "吴道林",
                "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                "gender": "M",
                "age": 34,
                "rank": "100+",
                "score": "11.2万",
                "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png"
            }
        }
    }
    return test


def testMeiliGroup():

    test = {
        "ec": 0,
        "em": "上传成功",
        "timesec": 1617006543,
        "data": {
            "page": 0,
            "pageSize": 100,
            "hasMore": 0,
            "lists": [
                {
                    "rank": 1,
                    "momoid": "100000",
                    "name": "身价榜北京排名",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 2,
                    "momoid": "100000",
                    "name": "啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 3,
                    "momoid": "100000",
                    "name": "收到发生的范德萨啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "F",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 4,
                    "momoid": "100000",
                    "name": "sad发生的发生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "277.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 5,
                    "momoid": "100000",
                    "name": "的发生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "27.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                                {
                    "rank": 6,
                    "momoid": "100000",
                    "name": "生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "27.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                                {
                    "rank": 7,
                    "momoid": "100000",
                    "name": "生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "27.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                }
            ],
            "myRankInfo": {
                "momoid": "26438046",
                "name": "吴道林",
                "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                "gender": "M",
                "age": 34,
                "rank": "100+",
                "score": "11.2万",
                "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png"
            }
        }
    }
    return test


@app.route('/v1/vshow/rank/city', methods=["POST", "GET"])
def queryRankListCity():

    if request.method == 'POST':
        type = request.form['type']
        if type == '1':
            return json.dumps(testShenjiaCity())
        else:
            return json.dumps(testMeiliCity())


def testShenjiaCity():

    test = {
        "ec": 0,
        "em": "上传成功",
        "timesec": 1617006543,
        "data": {
            "page": 0,
            "pageSize": 100,
            "hasMore": 0,
            "lists": [
                {
                    "rank": 1,
                    "momoid": "100000",
                    "name": "魅力榜本群排名",
                    "avatar": "https://ci.xiaohongshu.com/c31a57a1-5643-517b-be98-06a76b4ec9de?imageView2/2/w/1080/format/jpg/q/75",
                    "gender": "M",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 2,
                    "momoid": "100000",
                    "name": "GGGG啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 3,
                    "momoid": "100000",
                    "name": "收到发生的范德萨啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "F",
                    "score": "177.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                },
                {
                    "rank": 4,
                    "momoid": "100000",
                    "name": "sad发生的发生啦啦",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "score": "277.3万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                    "tag": "稀有",
                    "gotoStr": ""
                }
            ],
            "myRankInfo": {
                "momoid": "26438046",
                "name": "吴道林",
                "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                "gender": "M",
                "age": 34,
                "rank": "100+",
                "score": "11.2万",
                "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png"
            }
        }
    }
    return test

def testMeiliCity():

    test = {
            "ec": 0,
            "em": "上传成功",
            "timesec": 1617006543,
            "data": {
                "page": 0,
                "pageSize": 100,
                "hasMore": 0,
                "lists": [
                    {
                        "rank": 1,
                        "momoid": "100000",
                        "name": "魅力榜-北京",
                        "avatar": "https://lh3.googleusercontent.com/proxy/XWLybT2img-XJtSz4l3eHmY-kngROYaAbi1F_b_KGlVcHSKSEWx41GYR8PGF9bg6XQCceNDFmR1rgUFun77fzd7PDwaC9AruAeXuVqSMwHMM545CODWDw9fdnQ",
                        "gender": "M",
                        "score": "177.3万",
                        "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                        "tag": "稀有",
                        "gotoStr": ""
                    },
                    {
                        "rank": 2,
                        "momoid": "100000",
                        "name": "啦啦",
                        "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                        "gender": "M",
                        "score": "177.3万",
                        "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                        "tag": "稀有",
                        "gotoStr": ""
                    },
                    {
                        "rank": 3,
                        "momoid": "100000",
                        "name": "收到发生的范德萨啦啦",
                        "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                        "gender": "F",
                        "score": "177.3万",
                        "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                        "tag": "稀有",
                        "gotoStr": ""
                    },
                    {
                        "rank": 4,
                        "momoid": "100000",
                        "name": "sad发生的发生啦啦",
                        "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                        "gender": "M",
                        "score": "277.3万",
                        "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png",
                        "tag": "稀有",
                        "gotoStr": ""
                    }
                ],
                "myRankInfo": {
                    "momoid": "26438046",
                    "name": "吴道林",
                    "avatar": "https://i02piccdn.sogoucdn.com/1708880602aa87ea",
                    "gender": "M",
                    "age": 34,
                    "rank": "100+",
                    "score": "11.2万",
                    "imageUrl": "https://img.momocdn.com/vshowimage/96/C3/96C34303-6436-4683-AC74-41E56EB46F9220210601.png"
                }
            }
        }
    return test


if __name__ == "__main__":
    app.run("0.0.0.0", port=5000, debug=True)
