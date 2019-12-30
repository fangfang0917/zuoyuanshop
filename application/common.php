<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 模拟tab产生空格
 * @param int $step
 * @param string $string
 * @param int $size
 * @return string
 */
function tab($step = 1, $string = ' ', $size = 4)
{
    return str_repeat($string, $size * $step);
}


/**
 * 判断是否为空值
 *
 * @param string $value
 * @return bool
 */
function isEmpty(string $value = ''): bool
{
    if (!isset($value)) {
        return true;
    }
    if (null === $value) {
        return true;
    }
    if (strLength(__trim($value)) == 0) {
        return true;
    }
    return false;
}

/**
 * 获取字符串的长度
 *
 * @param  string $value
 * @return int
 */
function strLength(string $value): int
{
    return mb_strlen($value);
}

/**
 * 返回json数组
 * @param int $status
 * @param String $msg
 * @return \think\response\Json
 */
function return_json(int $status = 0, String $msg = '', String $url = '', array $data = [])
{
    return json(array('status' => $status, 'msg' => $msg, 'url' => $url, 'data' => $data));
}


/**
 * @param String $username
 * @return bool
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function AuthUser(String $username): bool
{
    $user = Db('user')->where(array('username' => $username))->find();
    if ($user) {
        return false;
    }

    return true;
}

/**
 * 生成密码
 *
 * @param string $str
 * @param string $type
 * @param string $secret
 * @return string
 */
function _pass(string $str, string $type = 'sha1', string $secret = 'HELLO_DIS'): string
{
    return strtoupper(hash($type, sha1($str . $secret)));
}

function test()
{

}


/**
 * 检查数组对应键是否已设置以及是否为空
 *
 * @param array $arr
 * @param string $key
 * @return bool
 */
function checkIsSet2Empty(array $arr = [], string $key): bool
{
    if (isset($arr[$key])) {
        if (is_array($arr[$key])) {
            return true;
        } else {
            if ($arr[$key] != null && strLength(__trim($arr[$key])) != 0) {
                return true;
            } else {
                return false;
            }
        }
    } else {
        return false;
    }
}

/**
 * 根据模型名称获取模型
 *
 * @param string $modelName
 * @return object
 */
function getModel(string $modelName): object
{
    if (false !== strpos($modelName, '\\')) {
        // 指定模型类
        $db = new $modelName;
    } else {
        try {
            $db = \think\Loader::model($modelName);
        } catch (\think\exception\ClassNotFoundException $e) {
            $db = \think\Db::name($modelName);
        }
    }
    return $db;
}

/**
 * 生成随机字符串
 * @param string $prefix
 * @return string
 */
function getRandom(string $prefix = ''): string
{
    return $prefix . base_convert(time() * 1000, 10, 36) . "_" . base_convert(microtime(), 10, 36) . uniqid();
}

/**
 * 生成一定长度的UUID
 *
 * @param int $length
 * @return string
 */
function getUuid(int $length = 16): string
{
    mt_srand((double)microtime() * 10000);
    $uuid = sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
    $str = base64_encode($uuid);
    return substr($str, mt_rand(0, strlen($str) - $length), $length);
}

/**
 * 格式化字节大小
 *
 * @param  float $size 字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 */
function getFormatBytes(float $size, string $delimiter = ''): string
{
    $units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    for ($i = 0; $size >= 1024 && $i < 5; $i++) {
        $size /= 1024;
    }
    return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 获取对应年对应月份的天数
 *
 * @param int $year
 * @param int $month
 * @return int
 */
function getDayNum(int $year = 0, int $month = 0): int
{
    $year = ($year == 0) ? (int)date('Y') : (int)$year;
    $month = ($month == 0) ? (int)date('m') : (int)$month;
    return (in_array($month, [1, 3, 5, 7, 8, 10, 12])) ? 31 : ((2 == $month) ? ((0 === $year % 4) ? 29 : 28) : 30);
}

/**
 * 获取输入的字符类型.
 *
 * @param $str
 * @return array|string
 */
function getInputType(string $str): array
{
    $output = ['type' => 8, 'status' => 'undefined'];
    $zhCN = preg_match('/[' . chr(0xa1) . '-' . chr(0xff) . ']/', $str);
    $int = preg_match('/[0-9]/', $str);
    $english = preg_match('/[a-zA-Z]/', $str);
    if ($zhCN && $int && $english) {
        $output = ['type' => 1, 'status' => '中文+数字+英文'];
    } elseif ($zhCN && $int && !$english) {
        $output = ['type' => 2, 'status' => '中文+数字'];
    } elseif ($zhCN && !$int && $english) {
        $output = ['type' => 3, 'status' => '中文+英文'];
    } elseif (!$zhCN && $int && $english) {
        $output = ['type' => 4, 'status' => '英文+数字'];
    } elseif ($zhCN && !$int && !$english) {
        $output = ['type' => 5, 'status' => '中文'];
    } elseif (!$zhCN && $int && !$english) {
        $output = ['type' => 6, 'status' => '数字'];
    } elseif (!$zhCN && !$int && $english) {
        $output = ['type' => 7, 'status' => '英文'];
    }
    return $output;
}

/**
 * 获取客户端IP地址
 *
 * @param int $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @param bool $adv 是否进行高级模式获取（有可能被伪装）
 * @return string
 */
function getClientIp(int $type = 0, bool $adv = false): string
{
    $type = $type ? 1 : 0;
    static $ip = null;
    if ($ip !== null) {
        return $ip[$type];
    }
    if ($adv) {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
            $pos = array_search('unknown', $arr);
            if (false !== $pos) {
                unset($arr[$pos]);
            }

            $ip = trim($arr[0]);
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
    } elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $long = sprintf("%u", ip2long($ip));
    $ip = $long ? array($ip, $long) : array('0.0.0.0', 0);
    return $ip[$type];
}

/**
 * 图片转base64
 *
 * @param $image_file
 * @return string
 */
function getImageBes64(string $image_file): string
{
    //读取图片文件，转换成base64编码格式
    $image_info = file_get_contents($image_file);
    $base64_image = 'data:image/png;base64,' . chunk_split(base64_encode($image_info));
    return $base64_image;
}

/**
 * 获取当前访问地址
 *
 * @return string
 */
function getPageURL(): string
{
    $pageURL = 'http';
    if (checkIsSet2Empty($_SERVER, 'HTTPS') && $_SERVER["HTTPS"] == "on") {
        $pageURL .= "s";
    }
    $pageURL .= "://";
    if ($_SERVER["SERVER_PORT"] != "80") {
        $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"] . $_SERVER["REQUEST_URI"];
    } else {
        $pageURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
    }
    return $pageURL;
}

/**
 * 获取当前域名
 *
 * @return string
 */
function getDomain(): string
{
    $pageURL = 'http';
    if (checkIsSet2Empty($_SERVER, 'HTTPS') && $_SERVER["HTTPS"] == "on") {
        $pageURL .= "s";
    }
    $pageURL .= "://";
    if ($_SERVER["SERVER_PORT"] != "80") {
        $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"];
    } else {
        $pageURL .= $_SERVER["SERVER_NAME"];
    }
    return $pageURL;
}

/**
 * 生成订单号(年月日时分秒+5位随机数)
 * @param string $ext
 * @return int
 */
function setOrderNumber(string $ext = ''): string
{
    return $ext . date('YmdHis') . random(5);
}

/**
 * 检查字符串中是否包含某些字符串
 *
 * @param string $haystack
 * @param string $needles
 * @return bool
 */
function strContains(string $haystack, string $needles): bool
{
    foreach ((array)$needles as $needle) {
        if ('' != $needle && mb_strpos($haystack, $needle) !== false) {
            return true;
        }
    }
    return false;
}


/**
 * 检测字符串是否包含
 *
 * @param string $text
 * @param string $test
 * @return bool
 */
function strHaving(string $text = '', string $test = ''): bool
{
    $check = explode($test, $text);
    if (is_array($check)) {
        return true;
    } else {
        return false;
    }
}

/**
 * 检查字符串是否以某些字符串结尾
 *
 * @param  string $haystack
 * @param string $needles
 * @return bool
 */
function strEndsWith(string $haystack, string $needles): bool
{
    foreach ((array)$needles as $needle) {
        if ((string)$needle === strSubstr($haystack, -strLength($needle))) {
            return true;
        }
    }
    return false;
}

/**
 * 检查字符串是否以某些字符串开头
 *
 * @param  string $haystack
 * @param string $needles
 * @return bool
 */
function strStartsWith(string $haystack, string $needles): bool
{
    foreach ((array)$needles as $needle) {
        if ('' != $needle && mb_strpos($haystack, $needle) === 0) {
            return true;
        }
    }
    return false;
}

/**
 * 获取指定长度的随机字母数字组合的字符串
 *
 * @param int $length
 * @param int $type
 * @param string $addChars
 * @return string
 */
function strRandom(int $length = 6, int $type = -1, string $addChars = ''): string
{
    $str = '';
    switch ($type) {
        case 0:
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . $addChars;
            break;
        case 1:
            $chars = str_repeat('0123456789', 3);
            break;
        case 2:
            $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . $addChars;
            break;
        case 3:
            $chars = 'abcdefghijklmnopqrstuvwxyz' . $addChars;
            break;
        case 4:
            $chars = "们以我到他会作时要动国产的一是工就年阶义发成部民可出能方进在了不和有大这主中人上为来分生对于学下级地个用同行面说种过命度革而多子后自社加小机也经力线本电高量长党得实家定深法表着水理化争现所二起政三好十战无农使性前等反体合斗路图把结第里正新开论之物从当两些还天资事队批点育重其思与间内去因件日利相由压员气业代全组数果期导平各基或月毛然如应形想制心样干都向变关问比展那它最及外没看治提五解系林者米群头意只明四道马认次文通但条较克又公孔领军流入接席位情运器并飞原油放立题质指建区验活众很教决特此常石强极土少已根共直团统式转别造切九你取西持总料连任志观调七么山程百报更见必真保热委手改管处己将修支识病象几先老光专什六型具示复安带每东增则完风回南广劳轮科北打积车计给节做务被整联步类集号列温装即毫知轴研单色坚据速防史拉世设达尔场织历花受求传口断况采精金界品判参层止边清至万确究书" . $addChars;
            break;
        default:
            $chars = 'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789' . $addChars;
            break;
    }
    if ($length > 10) {
        $chars = $type == 1 ? str_repeat($chars, $length) : str_repeat($chars, 5);
    }
    if ($type != 4) {
        $chars = str_shuffle($chars);
        $str = substr($chars, 0, $length);
    } else {
        for ($i = 0; $i < $length; $i++) {
            $str .= mb_substr($chars, floor(mt_rand(0, mb_strlen($chars, 'utf-8') - 1)), 1);
        }
    }
    return $str;
}

/**
 * 字符串转小写
 *
 * @param string $value
 * @return string
 */
function strLower(string $value): string
{
    return mb_strtolower($value, 'UTF-8');
}


/**
 * 字符串转大写
 *
 * @param  string $value
 * @return string
 */
function strUpper(string $value): string
{
    return mb_strtoupper($value, 'UTF-8');
}


/**
 * 截取字符串
 *
 * @param  string $string
 * @param  int $start
 * @param  int|null $length
 * @return string
 */
function strSubstr(string $string, int $start, int $length = null): string
{
    return mb_substr($string, $start, $length, 'UTF-8');
}

/**
 * 字符串截取，支持中文和其他编码
 *
 * @param string $sourcestr
 * @param int $cutlength
 * @param string $suffix
 * @return string
 */
function strMsubstr(string $sourcestr, int $cutlength, string $suffix = '...'): string
{
    $str_length = strlen($sourcestr);
    if ($str_length <= $cutlength) {
        return $sourcestr;
    }
    $returnstr = null;
    $n = $i = $noc = 0;
    while ($n < $str_length) {
        $t = ord($sourcestr[$n]);
        if (9 == $t || 10 == $t || (32 <= $t && $t <= 126)) {
            $i = 1;
            ++$n;
            ++$noc;
        } elseif (194 <= $t && $t <= 223) {
            $i = 2;
            $n += 2;
            $noc += 2;
        } elseif (224 <= $t && $t <= 239) {
            $i = 3;
            $n += 3;
            $noc += 2;
        } elseif (240 <= $t && $t <= 247) {
            $i = 4;
            $n += 4;
            $noc += 2;
        } elseif (248 <= $t && $t <= 251) {
            $i = 5;
            $n += 5;
            $noc += 2;
        } elseif (252 == $t || 253 == $t) {
            $i = 6;
            $n += 6;
            $noc += 2;
        } else {
            ++$n;
        }
        if ($noc >= $cutlength) {
            break;
        }
    }
    if ($noc > $cutlength) {
        $n -= $i;
    }
    $returnstr = substr($sourcestr, 0, $n);
    if (substr($sourcestr, $n, 6)) {
        $returnstr = $returnstr . $suffix; //超过长度时在尾处加上省略号
    }
    return $returnstr;
}

/**
 * 驼峰转下划线
 *
 * @param  string $value
 * @param  string $delimiter
 * @return string
 */
function strSnake(string $value, string $delimiter = '_'): string
{
    if (!ctype_lower($value)) {
        $value = preg_replace('/\s+/u', '', $value);
        $value = strLower(preg_replace('/(.)(?=[A-Z])/u', '$1' . $delimiter, $value));
    }
    return $value;
}

/**
 * 下划线转驼峰(首字母小写)
 *
 * @param  string $value
 * @return string
 */
function strCamel(string $value): string
{
    return lcfirst(studly($value));
}

/**
 * 下划线转驼峰(首字母大写)
 *
 * @param  string $value
 * @return string
 */
function strStudly(string $value): string
{
    $value = ucwords(str_replace(['-', '_'], ' ', $value));
    return str_replace(' ', '', $value);
}

/**
 * 转为首字母大写的标题格式
 *
 * @param  string $value
 * @return string
 */
function strTitle(string $value): string
{
    return mb_convert_case($value, MB_CASE_TITLE, 'UTF-8');
}

/**
 * 字符串替换
 *
 * @param string $string
 * @param string $str
 * @param int $start
 * @param int $length
 * @return string
 */
function strReplace(string $string, string $str = '****', int $start = 3, int $length = 4): string
{
    return substr_replace($string, $str, $start, $length);
}

/**
 * 正则替换
 *
 * @param string $pattern
 * @param string $replacement
 * @param string $str
 * @return string
 */
function strPreg(string $pattern, string $replacement, string $str): string
{
    return preg_replace($pattern, $replacement, $str);
}

/**
 * 字符串前面补充数据
 *
 * @param string $str
 * @param int $len
 * @return string
 */
function strAddExt(string $str, int $len): string
{
    return sprintf("%0" . $len . "d", $str);
}

/**
 * 初始化带小数点的数据
 *
 * @param $val
 * @param int $len
 * @return string
 */
function initPirce(string $val, int $len = 2): string
{
    return sprintf("%." . $len . "f", $val);
}

/**
 * 高精度计算.
 *
 * @param string $left
 * @param string $right
 * @param string $type
 * @param int $len
 * @return string
 */
function calc(string $left = '101', string $right = '50', string $type = '%', int $len = 2): string
{
    bcscale($len);
    switch ($type) {
        case '+':
            return bcadd($left, $right); #bcadd — 将两个高精度数字相加
            break;
        case '-':
            return bcsub($left, $right); #bcsub — 将两个高精度数字相减
            break;
        case '*':
            return bcmul($left, $right); #bcmul — 将两个高精度数字相乘
            break;
        case '/':
            return bcdiv($left, $right); #bcdiv — 将两个高精度数字相除
            break;
        case '%':
            return bcmod($left, $right); #bcmod — 求高精度数字余数
            break;
        case '^':
            return bcpow($left, $right); #bcpow — 求高精度数字乘方
            break;
        case 'size':
            return bccomp($left, $right);
            break;
        default:
            return $type;
            break;
    }
}

/**
 * 重设键，转为array(key=>array())
 *
 * @param array $arr
 * @param string $key
 * @return array
 */
function arrResetByKey(array $arr, string $key): array
{
    $re = [];
    foreach ($arr as $v) {
        $re[$v[$key]] = $v;
    }
    return $re;
}

/**
 * 对查询结果集进行排序
 *
 * @param array $list 查询结果
 * @param string $field 排序的字段名
 * @param string $sortBy 排序类型
 *                       asc正向排序 desc逆向排序 nat自然排序
 * @return array
 */
function arrSort(array $list, string $field, string $sortBy = 'asc'): array
{
    if (is_array($list)) {
        $refer = $resultSet = [];
        foreach ($list as $i => $data) {
            $refer[$i] = &$data[$field];
        }
        switch ($sortBy) {
            case 'asc': // 正向排序
                asort($refer);
                break;
            case 'desc': // 逆向排序
                arsort($refer);
                break;
            case 'nat': // 自然排序
                natcasesort($refer);
                break;
        }
        foreach ($refer as $key => $val) {
            $resultSet[] = &$list[$key];
        }
        return $resultSet;
    }
    return [];
}

/**
 * 删除数组空值
 *
 * @param array $arr
 * @return array
 */
function arrDelEmpty(array $arr = []): array
{
    foreach ($arr as $k => $v) {
        if (!is_array($v) && isEmpty($v)) {
            unset($arr[$k]);
        }
    }
    return $arr;
}

/**
 * 引入文件
 *
 * @param string $filePath
 * @param string $Ext
 * @return mixed
 */
function fileRequire(string $filePath = '', string $Ext = '.php'): object
{
    if (isEmpty($filePath)) {
        return false;
    }
    return require $filePath . $Ext;
}

/**
 * 引入文件
 *
 * @param string $filePath
 * @param string $Ext
 * @return mixed
 */
function fileInclude(string $filePath = '', string $Ext = '.php'): object
{
    if (isEmpty($filePath)) {
        return false;
    }
    return include $filePath . $Ext;
}

/**
 * 数组转字符串
 *
 * @param array $arr
 * @param string $glue
 * @return string
 */
function arr2str(array $arr = [], string $glue = ','): string
{
    return implode($glue, $arr);
}

/**
 * 数组转json
 *
 * @param array $arr
 * @return string
 */
function arr2json(array $arr = []): string
{
    return json_encode($arr, true);
}

/**
 * 数组转对象
 *
 * @param array $array
 * @return \stdClass
 */
function arr2obj(array $array): \stdClass
{
    if (is_array($array)) {
        $obj = new \StdClass();
        foreach ($array as $key => $val) {
            $obj->$key = $val;
        }
    } else {
        $obj = $array;
    }
    return $obj;
}

/**
 * 字符串转数组
 *
 * @param string $str
 * @param string $glue
 * @return array
 */
function str2arr(string $str = '', string $glue = ','): array
{
    if (isEmpty($glue)) {
        $length = mb_strlen($str, 'utf-8');
        $array = [];
        for ($i = 0; $i < $length; ++$i) {
            $array[] = mb_substr($str, $i, 1, 'utf-8');
        }
        return $array;
    } else {
        return explode($glue, $str);
    }
}

/**
 * 字符串转json
 *
 * @param string $str
 * @param string $glue
 * @return string
 */
function str2json(string $str = '', string $glue = ','): string
{
    return arr2json(str2arr($str, $glue));
}

/**
 * 字符串转xml
 *
 * @param string $str
 * @param string $glue
 * @return string
 */
function str2xml(string $str = '', string $glue = ','): string
{
    return arr2xml(str2arr($str, $glue));
}

/**
 * 字符串转对象
 *
 * @param string $str
 * @param string $glue
 * @return string
 */
function str2obj(string $str = '', string $glue = ','): \stdClass
{
    return arr2obj(str2arr($str, $glue));
}

/**
 * json转字符串
 *
 * @param string $json
 * @param string $glue
 * @return string
 */
function json2str(string $json = '', string $glue = ','): string
{
    return arr2str(json2arr($json), $glue);
}

/**
 * json转数组
 *
 * @param string $json
 * @return array
 */
function json2arr(string $json = ''): array
{
    return json_decode($json, true);
}

/**
 * json转XML
 *
 * @param string $json
 * @return string
 */
function json2xml(string $json = ''): string
{
    return arr2xml(json2arr($json));
}

/**
 * json转对象
 *
 * @param string $json
 * @return \stdClass
 */
function json2obj(string $json): \stdClass
{
    return arr2obj(json2arr($json));
}

/**
 * XML转数组
 *
 * @param string $xml
 * @return array
 */
function xml2arr(string $xml): array
{
    return json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
}

/**
 * XML转json
 *
 * @param string $xml
 * @return string
 */
function xml2json(string $xml): string
{
    return json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA));
}

/**
 * XML转字符串
 *
 * @param string $xml
 * @param string $glue
 * @return string
 */
function xml2str(string $xml, string $glue = ','): string
{
    return arr2str(xml2arr($xml), $glue);
}

/**
 * XML转对象
 *
 * @param string $xml
 * @return \stdClass
 */
function xml2obj(string $xml): \stdClass
{
    return arr2obj(xml2arr($xml));
}

/**
 * 对象转数组
 *
 * @param \stdClass $object
 * @return array
 */
function obj2arr(\stdClass $object): array
{
    if (is_object($object)) {
        foreach ($object as $key => $value) {
            $array[$key] = $value;
        }
    } else {
        $array = $object;
    }
    return $array;
}

/**
 * 对象转json
 *
 * @param \stdClass $object
 * @return string
 */
function obj2json(\stdClass $object): string
{
    return arr2json(obj2arr($object));
}

/**
 * 对象转XML
 *
 * @param \stdClass $object
 * @return string
 */
function obj2xml(\stdClass $object): string
{
    return arr2xml(obj2arr($object));
}

/**
 * 对象转字符串
 *
 * @param \stdClass $object
 * @param string $glue
 * @return string
 */
function obj2str(\stdClass $object, string $glue = ','): string
{
    return arr2str(obj2arr($object), $glue);
}

/**
 * 格式化时间
 *
 * @param int $time
 * @param string $format
 * @return string
 */
function toDate(int $time = 0, string $format = 'Y-m-d H:i:s'): string
{
    $time = ($time == 0) ? time() : $time;
    $format = str_replace('#', ':', $format);
    return date($format, $time);
}

/**
 * 获取时间戳
 *
 * @param string $time
 * @return int
 */
function unDate(string $time = '0'): int
{
    return ($time == 0) ? time() : strtotime($time);
}

/**
 * 正则匹配删除字符串中的空格
 *
 * @param $str
 * @return null|string|string[]
 */
function __trim(string $str): string
{
    return preg_replace('# #', '', $str);
}

/**
 * 获取全球唯一标识
 *
 * @return string
 */
function getOnlayUUID(): string
{
    return sprintf(
        '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0x0fff) | 0x4000,
        mt_rand(0, 0x3fff) | 0x8000,
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff),
        mt_rand(0, 0xffff)
    );
}

/**
 * 验证用户提交的信息
 * @param array $data
 * @return \think\response\Json
 */
function AuthUserParam(array $data = [])
{
    if (isEmpty($data['username'])) {
        return return_json(0, '用户名未填写!');
    }

    if (isEmpty($data['pass'])) {
        return return_json(0, '密码未填写!');
    }
}

/**
 * 获取banner
 * @param $posid
 * @return false|PDOStatement|string|\think\Collection
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function banner($posid)
{
    return $list = Db('banner')->where(array('posid' => $posid))->select();
}

/**获取列表
 * @param $Db
 * @param int $id
 * @return false|PDOStatement|string|\think\Collection
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getlist($Db, $id = 0)
{
    $list = Db($Db)->select();
    return $list;
}

function getint($array = array())
{
    $str = implode(',', $array);
    return $str;
}

/**获取数组
 * @param $DB
 * @param $name
 * @param $id
 * @return mixed
 */
function gettableval($DB, $name, $id)
{
    $map['id'] = $id;
    $val = Db($DB)->where($map)->value($name);
    return $val;
}

/**设置规格
 * @param int $skuId
 * @param string $Db
 * @param string $val
 * @return string
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\DbException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function getAttrKeyName($skuId = 0, $Db = 'goods_sku', $val = 'attr_symbol_path')
{
    $map['id'] = $skuId;
    $str = Db($Db)->where(array())->value($val);
    $str = explode(',', $str);
    $t = '';
    foreach ($str as $k => $v) {
        $r = DB('attrVal')->where(array('id' => $v))->find();
        $attrkey = gettableval('attrKey', 'name', $r['attr_key_id']);
        $t = $t . ' ' . $attrkey . ':' . $r['name'];
    }
    return $t;
}

/**支付状态
 * @param int $type
 * @return string
 */
function authPay($type = 0)
{
    if ($type == 0) {
        $r = '<span style="color:red">未支付</span>';
    } else {
        $r = '<span style="color:green">已支付</span>';

    }
    return $r;
}

function authOrder($payType, $orderType)
{
    if ($payType == 1) {
        if ($orderType == 0) {
            $r = '待发货';
        } elseif ($orderType == 1) {
            $r = '已发货';
        } elseif ($orderType == 2) {
            $r = '待评价';
        } elseif ($orderType == 3) {
            $r = '已完成';
        }
    } else {
        $r = '--';
    }
    return $r;
}