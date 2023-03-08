#dto_vo 
```json
{
  "author" : "nie_cq",
  "version" : "1.2.7",
  "userSecure" : "",
  "currTypeMapperGroupName" : "Default",
  "currTemplateGroupName" : "dto_vo",
  "currColumnConfigGroupName" : "Default",
  "currGlobalConfigGroupName" : "Default",
  "typeMapper" : {
    "Default" : {
      "name" : "Default",
      "elementList" : [ {
        "matchType" : "REGEX",
        "columnType" : "varchar(\\(\\d+\\))?",
        "javaType" : "java.lang.String"
      }, {
        "matchType" : "REGEX",
        "columnType" : "char(\\(\\d+\\))?",
        "javaType" : "java.lang.String"
      }, {
        "matchType" : "REGEX",
        "columnType" : "(tiny|medium|long)*text",
        "javaType" : "java.lang.String"
      }, {
        "matchType" : "REGEX",
        "columnType" : "decimal(\\(\\d+,\\d+\\))?",
        "javaType" : "java.lang.Double"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "integer",
        "javaType" : "java.lang.Integer"
      }, {
        "matchType" : "REGEX",
        "columnType" : "(tiny|small|medium)*int(\\(\\d+\\))?",
        "javaType" : "java.lang.Integer"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "int4",
        "javaType" : "java.lang.Integer"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "int8",
        "javaType" : "java.lang.Long"
      }, {
        "matchType" : "REGEX",
        "columnType" : "bigint(\\(\\d+\\))?",
        "javaType" : "java.lang.Long"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "date",
        "javaType" : "java.util.Date"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "datetime",
        "javaType" : "java.util.Date"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "timestamp",
        "javaType" : "java.util.Date"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "time",
        "javaType" : "java.time.LocalTime"
      }, {
        "matchType" : "ORDINARY",
        "columnType" : "boolean",
        "javaType" : "java.lang.Boolean"
      } ]
    }
  },
  "template" : {
    "dto_vo" : {
      "name" : "dto_vo",
      "elementList" : [ {
        "name" : "controller.java.vm",
        "code" : "##导入宏定义\n$!{define.vm}\n\n##设置表后缀（宏定义）\n#setTableSuffix(\"Controller\")\n\n##保存文件（宏定义）\n#save(\"/controller\", \"Controller.java\")\n\n##包路径（宏定义）\n#setPackageSuffix(\"controller\")\n\n##定义服务名\n#set($serviceName = $!tool.append($!tool.firstLowerCase($!tableInfo.name), \"Service\"))\n\n##定义实体对象名\n#set($entityName = $!tool.firstLowerCase($!tableInfo.name))\n\n\nimport $!{tableInfo.savePackageName}.service.$!{tableInfo.name}Service;\nimport $!{tableInfo.savePackageName}.vo.$!{tableInfo.name}VO;\nimport org.springframework.web.bind.annotation.*;\nimport org.springframework.validation.annotation.Validated;\nimport com.mall.common.domain.BaseController;\nimport com.mall.common.domain.Result;\nimport io.swagger.annotations.*;\nimport lombok.extern.slf4j.Slf4j;\nimport javax.annotation.Resource;\nimport javax.validation.Valid;\nimport cn.hutool.json.JSONUtil;\nimport javax.validation.constraints.NotBlank;\n\n\n##表注释（宏定义）\n#tableComment(\"表控制层\")\n@RestController\n@RequestMapping(\"$!tool.firstLowerCase($!tableInfo.name)\")\n@Validated\n@Slf4j\npublic class $!{tableName} extends BaseController {\n    /**\n     * 服务对象\n     */\n    @Resource\n    private $!{tableInfo.name}Service $!{serviceName};\n\n    /**\n     * 分页查询\n     *\n     * @param query 筛选条件\n     * @return 查询结果\n     */\n    @GetMapping(\"queryByPage\")\n    @ApiOperation(value = \"$!entityName-分页\")\n    public Result<?> queryByPage(@Valid $!{tableInfo.name}VO.Query query) {\n        log.info(\"umsAdminLoginLog 筛选条件：{}\",JSONUtil.toJsonStr(query));\n        return Result.ok($!{serviceName}.page(query));\n    }\n    \n    /**\n     * 通过主键查询单条数据\n     *\n     * @param id 主键\n     * @return 单条数据\n     */\n    @GetMapping(\"queryById/{id}\")\n    @ApiOperation(value = \"$!entityName-单条数据\")\n    public Result<?> queryById(@Valid @NotBlank(message = \"id不能为空\") @PathVariable(\"id\") String id) {\n        return Result.ok($!{serviceName}.info(id));\n    }\n\n    /**\n     * 新增数据\n     *\n     * @param param 实体\n     * @return 新增结果\n     */\n    @PostMapping(\"add\")\n    @ApiOperation(value = \"$!entityName-新增\")\n    public Result<?> add(@Valid @RequestBody $!{tableInfo.name}VO.Add param) {\n        return Result.ok($!{serviceName}.add(param));\n    }\n    \n    /**\n     * 编辑数据\n     *\n     * @param param 实体\n     * @return 编辑结果\n     */\n    @PostMapping(\"edit\")\n    @ApiOperation(value = \"$!entityName-编辑\")\n    public Result<?> edit(@Valid @RequestBody $!{tableInfo.name}VO.Edit param) {\n        return Result.ok($!{serviceName}.modify(param));\n    }\n\n    /**\n     * 删除数据\n     *\n     * @param id 主键\n     * @return 删除是否成功\n     */\n    @GetMapping(\"deleteById/{id}\")\n    @ApiOperation(value = \"$!entityName-删除单条数据\")\n    public Result<?> deleteById(@Valid @NotBlank(message=\"id不能为空\")@PathVariable(\"id\") String id) {\n        $!{serviceName}.remove(id);\n        return Result.ok();\n    }\n}\n"
      }, {
        "name" : "entity.java.vm",
        "code" : "##导入宏定义\n$!{define.vm}\n\n##保存文件（宏定义）\n#save(\"/entity\", \".java\")\n\n##包路径（宏定义）\n#setPackageSuffix(\"entity\")\n\n##自动导入包（全局变量）\n$!{autoImport.vm}\nimport lombok.*;\nimport com.mall.common.domain.BaseDomain;\nimport com.baomidou.mybatisplus.annotation.TableId;\nimport io.swagger.annotations.ApiModelProperty;\nimport com.baomidou.mybatisplus.annotation.IdType;\n\n##表注释（宏定义）\n#tableComment(\"表实体类\")\n@Data\n@EqualsAndHashCode(callSuper = false)\npublic class $!{tableInfo.name} extends BaseDomain {\n#foreach($column in $tableInfo.fullColumn)\n    /**\n    *\n    * #if(${column.comment})${column.comment}#end\n    \n    **/\n#if($column.name==\"id\")\n    @ApiModelProperty(\"id\")\n    @TableId(value = \"id\", type = IdType.ASSIGN_UUID)\n#end\n#if($column.name!=\"id\")\n    @ApiModelProperty(\"${column.comment}\")\n#end\n    private $!{tool.getClsNameByFullName($column.type)} $!{column.name};\n#end\n\n}\n"
      }, {
        "name" : "service.java.vm",
        "code" : "##导入宏定义\n$!{define.vm}\n\n##设置表后缀（宏定义）\n#setTableSuffix(\"Service\")\n\n##保存文件（宏定义）\n#save(\"/service\", \"Service.java\")\n\n##包路径（宏定义）\n#setPackageSuffix(\"service\")\n\nimport com.baomidou.mybatisplus.extension.service.IService;\nimport $!{tableInfo.savePackageName}.entity.$!tableInfo.name;\nimport $!{tableInfo.savePackageName}.vo.$!{tableInfo.name}VO;\nimport com.mall.common.domain.PageListDomain;\n\n\n##表注释（宏定义）\n#tableComment(\"表服务接口\")\npublic interface $!{tableName} extends IService<$!tableInfo.name> {\n    /**\n    * $!{tableInfo.comment}-表页列表\n    * @param query 根据需要进行传值\n    * @return object\n    */\n    PageListDomain page($!{tableInfo.name}VO.Query query);\n\n    /**\n    * $!{tableInfo.comment}-详情\n    * @param id id\n    * @return entity\n    */\n    $!tableInfo.name info(String id);\n\n    /**\n    * $!{tableInfo.comment}-新增\n    * @param param 根据需要进行传值\n    * @return object\n    */\n    Object add($!{tableInfo.name}VO.Add param);\n\n    /**\n    * $!{tableInfo.comment}-修改\n    * @param param 根据需要进行传值\n    * @return entity\n    */\n    $!tableInfo.name modify($!{tableInfo.name}VO.Edit param);\n\n    /**\n    * $!{tableInfo.comment}-删除(单个条目)\n    * @param id id\n    */\n    void remove(String id);\n}\n"
      }, {
        "name" : "serviceImpl.java.vm",
        "code" : "##导入宏定义\n$!{define.vm}\n\n##设置表后缀（宏定义）\n#setTableSuffix(\"ServiceImpl\")\n\n##保存文件（宏定义）\n#save(\"/service/impl\", \"ServiceImpl.java\")\n\n##包路径（宏定义）\n#setPackageSuffix(\"service.impl\")\n\nimport com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;\nimport $!{tableInfo.savePackageName}.mapper.$!{tableInfo.name}Mapper;\nimport $!{tableInfo.savePackageName}.entity.$!{tableInfo.name};\nimport $!{tableInfo.savePackageName}.service.$!{tableInfo.name}Service;\nimport $!{tableInfo.savePackageName}.vo.$!{tableInfo.name}VO;\nimport org.springframework.stereotype.Service;\nimport com.mall.common.domain.PageListDomain;\nimport com.mall.common.util.PageUtil;\nimport cn.hutool.core.bean.BeanUtil;\nimport cn.hutool.core.lang.Assert;\nimport com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;\n\n\n##表注释（宏定义）\n#tableComment(\"表服务实现类\")\n@Service(\"$!tool.firstLowerCase($tableInfo.name)Service\")\npublic class $!{tableName} extends ServiceImpl<$!{tableInfo.name}Mapper, $!{tableInfo.name}> implements $!{tableInfo.name}Service {\n\n    /**\n    * $!{tableInfo.comment}-表页列表\n    * @param query 根据需要进行传值\n    * @return object\n    */\n    @Override\n    public PageListDomain page($!{tableInfo.name}VO.Query query){\n        PageUtil.startPage();\n        QueryWrapper<$!tableInfo.name> queryWrapper = new QueryWrapper<>();\n        queryWrapper.lambda();\n        return PageUtil.getPageList(list(queryWrapper));\n    }\n\n    /**\n    * $!{tableInfo.comment}-详情\n    * @param id id\n    * @return entity\n    */\n    @Override\n    public $!tableInfo.name info(String id){\n        return baseMapper.selectById(id);\n    }\n\n    /**\n    * $!{tableInfo.comment}-新增\n    * @param param 根据需要进行传值\n    * @return object\n    */\n    @Override\n    public Object add($!{tableInfo.name}VO.Add param){\n        $!tableInfo.name $tool.firstLowerCase($!tableInfo.name) = BeanUtil.copyProperties(param, $!{tableInfo.name}.class);\n        Assert.isTrue(save($tool.firstLowerCase($!tableInfo.name)), \"保存失败\");\n        return $tool.firstLowerCase($!tableInfo.name);\n    }\n\n    /**\n    * $!{tableInfo.comment}-修改\n    * @param param 根据需要进行传值\n    * @return entity\n    */\n    @Override\n    public $!tableInfo.name modify($!{tableInfo.name}VO.Edit param){\n        $!tableInfo.name $tool.firstLowerCase($!tableInfo.name) = BeanUtil.copyProperties(param, $!{tableInfo.name}.class);\n        Assert.isTrue(updateById($tool.firstLowerCase($!tableInfo.name)), \"保存失败\");\n        return $tool.firstLowerCase($!tableInfo.name);\n    }\n\n    /**\n    * $!{tableInfo.comment}-删除(单个条目)\n    * @param id id\n    */\n    @Override\n    public void remove(String id){\n        removeById(id);\n    }\n}\n"
      }, {
        "name" : "mapper.java.vm",
        "code" : "##导入宏定义\n$!{define.vm}\n\n##设置表后缀（宏定义）\n#setTableSuffix(\"Mapper\")\n\n##保存文件（宏定义）\n#save(\"/mapper\", \"Mapper.java\")\n\n##包路径（宏定义）\n#setPackageSuffix(\"mapper\")\n\nimport com.baomidou.mybatisplus.core.mapper.BaseMapper;\nimport $!{tableInfo.savePackageName}.entity.$!tableInfo.name;\n\n##表注释（宏定义）\n#tableComment(\"表数据库访问层\")\npublic interface $!{tableName} extends BaseMapper<$!tableInfo.name> {\n\n}\n"
      }, {
        "name" : "mapper.xml.vm",
        "code" : "##引入mybatis支持\n$!{mybatisSupport.vm}\n\n##设置保存名称与保存位置\n$!callback.setFileName($tool.append($!{tableInfo.name}, \"Mapper.xml\"))\n$!callback.setSavePath($tool.append($modulePath, \"/src/main/resources/mapper\"))\n\n##拿到主键\n#if(!$tableInfo.pkColumn.isEmpty())\n    #set($pk = $tableInfo.pkColumn.get(0))\n#end\n\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n<mapper namespace=\"$!{tableInfo.savePackageName}.mapper.$!{tableInfo.name}Mapper\">\n\n</mapper>\n"
      }, {
        "name" : "vo.java.vm",
        "code" : "##导入宏定义\n$!{define.vm}\n\n##保存文件（宏定义）\n#save(\"/vo\", \"VO.java\")\n\n##包路径（宏定义）\n#setPackageSuffix(\"vo\")\n\n##自动导入包（全局变量）\n$!{autoImport.vm}\nimport lombok.*;\nimport com.mall.common.domain.PageDomain;\nimport io.swagger.annotations.ApiModelProperty;\n\n##表注释（宏定义）\n#tableComment(\"dto\")\npublic class $!{tableInfo.name}VO {\n    @Override\n    public String toString() {\n        return super.toString();\n    }\n    \n    /**\n    * 查询实体\n    */\n    @Data\n    @EqualsAndHashCode(callSuper = true)\n    @ToString(callSuper = true)\n    public static class Query extends PageDomain{\n    }\n    \n    /**\n    * 新增实体\n    */\n    @Data\n    public static class Add{\n#foreach($column in $tableInfo.fullColumn)\n#if($column.name!=\"id\")\n        @ApiModelProperty(\"${column.comment}\")\n        private $!{tool.getClsNameByFullName($column.type)} $!{column.name};\n#end\n#end\n    }\n    \n    /**\n    * 修改实体\n    */\n    @Data\n    public static class Edit{\n#foreach($column in $tableInfo.fullColumn)\n        @ApiModelProperty(\"${column.comment}\")\n        private $!{tool.getClsNameByFullName($column.type)} $!{column.name};\n#end\n    }\n}\n"
      } ]
    }
  },
  "columnConfig" : {
    "Default" : {
      "name" : "Default",
      "elementList" : [ {
        "title" : "disable",
        "type" : "BOOLEAN",
        "selectValue" : ""
      }, {
        "title" : "support",
        "type" : "SELECT",
        "selectValue" : "add,edit,query,del,ui"
      } ]
    }
  },
  "globalConfig" : {
    "Default" : {
      "name" : "Default",
      "elementList" : [ {
        "name" : "autoImport.vm",
        "value" : "##自动导入包（仅导入实体属性需要的包，通常用于实体类）\n#foreach($import in $importList)\nimport $!import;\n#end"
      }, {
        "name" : "define.vm",
        "value" : "##（Velocity宏定义）\n$!{init.vm}\n##定义设置表名后缀的宏定义，调用方式：#setTableSuffix(\"Test\")\n#macro(setTableSuffix $suffix)\n    #set($tableName = $!tool.append($tableInfo.name, $suffix))\n#end\n\n##定义设置包名后缀的宏定义，调用方式：#setPackageSuffix(\"Test\")\n#macro(setPackageSuffix $suffix)\n#if($suffix!=\"\")package #end#if($tableInfo.savePackageName!=\"\")$!{tableInfo.savePackageName}.#{end}$!suffix;\n#end\n\n##定义直接保存路径与文件名简化的宏定义，调用方式：#save(\"/entity\", \".java\")\n#macro(save $path $fileName)\n    $!callback.setSavePath($tool.append($tableInfo.savePath, $path))\n    $!callback.setFileName($tool.append($tableInfo.name, $fileName))\n#end\n\n##定义表注释的宏定义，调用方式：#tableComment(\"注释信息\")\n#macro(tableComment $desc)\n/**\n * $!{tableInfo.comment}($!{tableInfo.name})$desc\n *\n * @author $!author\n * @since $!time.currTime()\n */\n#end\n\n##定义GET，SET方法的宏定义，调用方式：#getSetMethod($column)\n#macro(getSetMethod $column)\n\n    public $!{tool.getClsNameByFullName($column.type)} get$!{tool.firstUpperCase($column.name)}() {\n        return $!{column.name};\n    }\n\n    public void set$!{tool.firstUpperCase($column.name)}($!{tool.getClsNameByFullName($column.type)} $!{column.name}) {\n        this.$!{column.name} = $!{column.name};\n    }\n#end\n\n"
      }, {
        "name" : "init.vm",
        "value" : "##初始化区域\n\n##去掉表的t_前缀\n$!tableInfo.setName($tool.getClassName($tableInfo.obj.name.replaceFirst(\"book_\",\"\")))\n\n##参考阿里巴巴开发手册，POJO 类中布尔类型的变量，都不要加 is 前缀，否则部分框架解析会引起序列化错误\n#foreach($column in $tableInfo.fullColumn)\n#if($column.name.startsWith(\"is\") && $column.type.equals(\"java.lang.Boolean\"))\n    $!column.setName($tool.firstLowerCase($column.name.substring(2)))\n#end\n#end\n\n##实现动态排除列\n#set($temp = $tool.newHashSet(\"createBy\",\"createTime\",\"updateBy\",\"updateTime\",\"tenantId\",\"revision\"))\n#foreach($item in $temp)\n    #set($newList = $tool.newArrayList())\n    #foreach($column in $tableInfo.fullColumn)\n        #if($column.name!=$item)\n            ##带有反回值的方法调用时使用$tool.call来消除返回值\n            $tool.call($newList.add($column))\n        #end\n    #end\n    ##重新保存\n    $tableInfo.setFullColumn($newList)\n#end\n\n##对importList进行篡改\n#set($temp = $tool.newHashSet())\n#foreach($column in $tableInfo.fullColumn)\n    #if(!$column.type.startsWith(\"java.lang.\"))\n        ##带有反回值的方法调用时使用$tool.call来消除返回值\n        $tool.call($temp.add($column.type))\n    #end\n#end\n##覆盖\n#set($importList = $temp)"
      }, {
        "name" : "mybatisSupport.vm",
        "value" : "##针对Mybatis 进行支持，主要用于生成xml文件\n#foreach($column in $tableInfo.fullColumn)\n    ##储存列类型\n    $tool.call($column.ext.put(\"sqlType\", $tool.getField($column.obj.dataType, \"typeName\")))\n    #if($tool.newHashSet(\"java.lang.String\").contains($column.type))\n        #set($jdbcType=\"VARCHAR\")\n    #elseif($tool.newHashSet(\"java.lang.Boolean\", \"boolean\").contains($column.type))\n        #set($jdbcType=\"BOOLEAN\")\n    #elseif($tool.newHashSet(\"java.lang.Byte\", \"byte\").contains($column.type))\n        #set($jdbcType=\"BYTE\")\n    #elseif($tool.newHashSet(\"java.lang.Integer\", \"int\", \"java.lang.Short\", \"short\").contains($column.type))\n        #set($jdbcType=\"INTEGER\")\n    #elseif($tool.newHashSet(\"java.lang.Long\", \"long\").contains($column.type))\n        #set($jdbcType=\"INTEGER\")\n    #elseif($tool.newHashSet(\"java.lang.Float\", \"float\", \"java.lang.Double\", \"double\").contains($column.type))\n        #set($jdbcType=\"NUMERIC\")\n    #elseif($tool.newHashSet(\"java.util.Date\", \"java.sql.Timestamp\", \"java.time.Instant\", \"java.time.LocalDateTime\", \"java.time.OffsetDateTime\", \"\tjava.time.ZonedDateTime\").contains($column.type))\n        #set($jdbcType=\"TIMESTAMP\")\n    #elseif($tool.newHashSet(\"java.sql.Date\", \"java.time.LocalDate\").contains($column.type))\n        #set($jdbcType=\"TIMESTAMP\")\n    #else\n        ##其他类型\n        #set($jdbcType=\"VARCHAR\")\n    #end\n    $tool.call($column.ext.put(\"jdbcType\", $jdbcType))\n#end\n\n##定义宏，查询所有列\n#macro(allSqlColumn)#foreach($column in $tableInfo.fullColumn)$column.obj.name#if($velocityHasNext), #end#end#end\n"
      } ]
    }
  }
}
```