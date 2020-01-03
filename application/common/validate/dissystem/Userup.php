<?php
namespace app\common\validate\dissystem;

use think\Validate;

class Userup extends Validate
{
    protected $rule = [
        "userId|申请人" => "require",
        "createtiem|申请时间" => "require",
        "level|申请等级" => "require",
        "type|状态" => "require",
    ];
}
