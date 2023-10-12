# 法律监督模型
```sql
CREATE TABLE actionmapping (
    col_actionid INT NOT NULL,
    col_actiontype VARCHAR(6) NOT NULL,
    col_uritemplate VARCHAR(1024) BINARY NOT NULL,
    PRIMARY KEY (col_actiontype,col_uritemplate)
) DEFAULT CHARSET=latin1;

CREATE TABLE actiontype (
    col_actiontypeid INT NOT NULL,
    col_actiontypename VARCHAR(256) NOT NULL,
    col_description VARCHAR(1024),
    PRIMARY KEY (col_actiontypeid)
);

CREATE TABLE authority (
    col_authid VARCHAR(128) NOT NULL,
    col_parentid VARCHAR(128) NOT NULL,
    col_authlevel INT NOT NULL,
    col_description VARCHAR(512),
    col_name VARCHAR(384) NOT NULL,
    col_typeid INT,
    col_digitalid VARCHAR(128),
    col_workspaceid VARCHAR(128),
    PRIMARY KEY (col_authid)
);

CREATE INDEX authority_digitalid_idx ON authority(col_parentid, col_typeid, col_digitalid, col_workspaceid);

CREATE TABLE portal(
    id VARCHAR(128) NOT NULL,
    col_label VARCHAR(256) NOT NULL,
    col_desc VARCHAR(1024),
    created DATETIME NOT NULL,
    updated DATETIME,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_workspaceid VARCHAR(128),
    col_content MEDIUMTEXT,
    col_spacing VARCHAR(128),
    col_leftspacing VARCHAR(128),
    col_topspacing VARCHAR(128),
    col_public VARCHAR(128),
    col_compshadow VARCHAR(128),
    col_defaultwidth VARCHAR(128),
    col_portalposition VARCHAR(128),
    col_fontsize VARCHAR(50),
	  col_type VARCHAR(20),
	  col_status TINYINT,
	  col_parentid VARCHAR(128),
	  col_ownerid VARCHAR(128),
    col_portalmore MEDIUMTEXT,
    	col_classid VARCHAR(128),
    PRIMARY KEY (id)
);

CREATE TABLE custom_view(
    id VARCHAR(128) NOT NULL,
    formid VARCHAR(128) NULL,
    type VARCHAR(512) NULL,
    content MEDIUMTEXT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE spaceusers (
    col_userid VARCHAR(128) NOT NULL,    
    col_workspaceid VARCHAR(128) NOT NULL,
    PRIMARY KEY (col_userid,col_workspaceid)
);

--ALTER TABLE spaceusers
--    ADD CONSTRAINT spaceusers_pkey PRIMARY KEY (col_userid, col_workspaceid);

CREATE TABLE spacenodes (
    orgid INT NOT NULL,
    nodeid INT NOT NULL,
    spaceid VARCHAR(128) NOT NULL,
    PRIMARY KEY (orgid,nodeid,spaceid)
);
--ALTER TABLE spacenodes
--    ADD CONSTRAINT spacenodes_pkey PRIMARY KEY (orgid,nodeid,spaceid);
	
CREATE TABLE spacenodesview (
    orgid INT NOT NULL,
    nodeid INT NOT NULL,
    spaceid VARCHAR(128) NOT NULL,
    PRIMARY KEY (orgid,nodeid,spaceid)
);
--ALTER TABLE spacenodesview
--    ADD CONSTRAINT spacenodesview_pkey PRIMARY KEY (orgid,nodeid,spaceid);
	
CREATE TABLE orgspaces (
    orgid INT NOT NULL,
    nodeid INT NOT NULL,
    spaceid VARCHAR(128) NOT NULL,
    PRIMARY KEY (orgid,nodeid,spaceid)
);
--ALTER TABLE orgspaces
--    ADD CONSTRAINT orgspaces_pkey PRIMARY KEY (orgid,nodeid,spaceid);
	
CREATE TABLE form (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    col_name VARCHAR(256) NOT NULL,
    col_label VARCHAR(512) NOT NULL,
    col_desc VARCHAR(1024),
    col_content MEDIUMTEXT NOT NULL,
    col_xmlschema MEDIUMTEXT NOT NULL,
    col_tableid INT AUTO_INCREMENT NOT NULL,
    col_version INT NOT NULL,
    col_anonymous TINYINT,
    col_priviledge INT,
    col_lock TINYINT,
    creatornum VARCHAR(200),
    creatorname VARCHAR(200),
    updatornum VARCHAR(200),
    updatorname VARCHAR(200),
    col_workspaceid VARCHAR(128),
    col_acllevel INT,
    col_public INT,
    col_productid VARCHAR(128) NOT NULL DEFAULT '0',
    col_classid VARCHAR(128),
    col_tablename VARCHAR(128),
    col_fieldname VARCHAR(128),
    col_readonly TINYINT NOT NULL DEFAULT 0,
    col_type TINYINT NOT NULL DEFAULT 0,
    col_shareid VARCHAR(128),
	  col_sharetype INT DEFAULT 0,
	  col_accesslist VARCHAR(1024),
	  col_displayrecordinfo VARCHAR(5),
    col_hideproperty VARCHAR(5),
    col_enablefieldpriviledge VARCHAR(5),
     col_storagetype INT DEFAULT 0,
	col_enableauditlog INT,
	col_enablepwdverify INT,
    PRIMARY KEY (id),
    KEY key_tableid (col_tableid)
);

CREATE TABLE externalds (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    creatornum VARCHAR(200),
    creatorname VARCHAR(200),
    updatornum VARCHAR(200),
    updatorname VARCHAR(200),
    col_label VARCHAR(512) NOT NULL,
    col_desc VARCHAR(1024),   
    col_databasetype VARCHAR(100),
    col_serveraddr VARCHAR(200),
    col_serverport VARCHAR(20),
    col_username VARCHAR(100),
    col_password VARCHAR(100),
    col_databasename VARCHAR(100),
    col_readonly VARCHAR(1) NOT NULL DEFAULT '0',
    col_workspaceid VARCHAR(128),
    col_dstype VARCHAR(1) DEFAULT '0',
    col_jdbcurl VARCHAR(1024),
    col_ws TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE synctask (
    id VARCHAR(128) NOT NULL,
    col_workspaceid VARCHAR(128) NOT NULL,
    col_formid VARCHAR(128) NOT NULL,
    col_temptab VARCHAR(50),
    col_cronstring VARCHAR(512),
    col_starttime DATETIME NOT NULL,
    col_endtime DATETIME,
    col_totalcount int NOT NULL,
    col_remaincount int NOT NULL,
    col_operator VARCHAR(50) NOT NULL,
    col_operatorname VARCHAR(50) NOT NULL,
    col_status int NOT NULL,
    col_type int NOT NULL,
    PRIMARY KEY (id)
    );
	
CREATE TABLE excelshareinfo (
    col_title VARCHAR(256) NOT NULL,
    col_spaceId VARCHAR(128),
    col_formId VARCHAR(128) NOT NULL,
    col_templateId VARCHAR(128)NOT NULL,
    col_width VARCHAR(128),
    col_height VARCHAR(128),
    col_isshowtitle VARCHAR(128),
    col_sharetype VARCHAR(128),
    PRIMARY KEY (col_formId,col_templateId)
);
CREATE TABLE dingdingshareinfo (
    col_spaceId VARCHAR(128),
    col_formId VARCHAR(128) NOT NULL,
    col_templateId VARCHAR(128) NOT NULL,
    col_shareurl VARCHAR(256),
    col_sharetype VARCHAR(256),
    col_sharecode VARCHAR(256),
    col_templatetype VARCHAR(256),
    PRIMARY KEY (col_formId,col_templateId)
);
CREATE TABLE dingdingsharebpminfo (
    col_spaceId VARCHAR(128) NOT NULL,
    col_processKey VARCHAR(128) NOT NULL,
    col_shareurl VARCHAR(256),
    col_sharetype VARCHAR(256),
    col_sharecode VARCHAR(256),
    col_templatetype VARCHAR(256),
    PRIMARY KEY (col_spaceId,col_processKey)
);
CREATE TABLE wechatentsharebpminfo (
    col_spaceId VARCHAR(128) NOT NULL,
    col_processKey VARCHAR(128) NOT NULL,
    col_shareurl VARCHAR(256),
    col_sharetype VARCHAR(256),
    col_sharecode VARCHAR(256),
    col_templatetype VARCHAR(256),
    PRIMARY KEY (col_spaceId,col_processKey)
);
CREATE TABLE wechatentshareinfo(
    col_spaceId VARCHAR(128),
    col_formId VARCHAR(128) NOT NULL,
    col_templateId VARCHAR(128) NOT NULL,
    col_shareurl VARCHAR(128),
    col_sharetype VARCHAR(128),
    col_sharecode VARCHAR(128),
    col_templatetype VARCHAR(128),
    PRIMARY KEY (col_formId,col_templateId)
);
CREATE TABLE wechatshareinfo(
    col_spaceId VARCHAR(128),
    col_formId VARCHAR(128) NOT NULL,
    col_templateId VARCHAR(128) NOT NULL,
    col_shareurl VARCHAR(128),
    col_sharetype VARCHAR(128),
    col_sharecode VARCHAR(128),
    col_templatetype VARCHAR(128),
    PRIMARY KEY (col_formId,col_templateId)
);
CREATE TABLE itemacl (
    col_itemid VARCHAR(128) NOT NULL,
    col_itemtypeid INT NOT NULL,
    col_authorityid VARCHAR(128) NOT NULL,
    col_acl VARCHAR(512) NOT NULL,
    PRIMARY KEY(col_itemid,col_authorityid)
);

CREATE TABLE itemaction (
    col_name VARCHAR(256),
    col_actionid INT NOT NULL,
    col_description VARCHAR(512),
    col_groupid INT,
    PRIMARY KEY(col_actionid,col_groupid)
);

CREATE TABLE itemactiongroup (
    col_groupid INT NOT NULL,
    col_groupname VARCHAR(256) NOT NULL,
    col_aclcoding VARCHAR(512),
    col_itemtypeid INT,
    col_description VARCHAR(256),
    col_classorinst INT,
    PRIMARY KEY(col_groupid)
);

CREATE TABLE itemtype (
    col_typeid INT NOT NULL,
    col_name VARCHAR(128) NOT NULL,
    col_description VARCHAR(512),
    col_parentid INT,
    PRIMARY KEY(col_typeid)
);

CREATE TABLE itemtypeacl (
    col_itemtypeid INT NOT NULL,
    col_acl VARCHAR(512) NOT NULL,
    col_authorityid VARCHAR(128) NOT NULL,
    col_itemparentid VARCHAR(128) NOT NULL,
    col_itemtypevalue VARCHAR(128) NOT NULL DEFAULT 'NULL',
    PRIMARY KEY (col_itemtypeid, col_authorityid, col_itemparentid, col_itemtypevalue)
);

CREATE TABLE storagearea (
    id VARCHAR(128) NOT NULL,
    updated DATETIME,
    created DATETIME,
    col_formid VARCHAR(128),
    col_desc VARCHAR(1024),
    col_file VARCHAR(1024),
    col_status VARCHAR(128),
    col_importstatus VARCHAR(128) DEFAULT '0',
    col_lastlog VARCHAR(128),
    col_exporimp INT,
    col_filetype INT,
    col_iscsv TINYINT,
    col_iszip TINYINT,
    col_isatta TINYINT,
    col_isattachment TINYINT,
    col_ismultiple TINYINT DEFAULT 0,
    col_startline INT,
    col_totallines INT,
    col_filesize VARCHAR(128),
    creatornum VARCHAR(200),
    creatorname VARCHAR(200),
    updatornum VARCHAR(200),
    updatorname VARCHAR(200),
    col_workspaceid VARCHAR(128),
    PRIMARY KEY(id)
);

CREATE TABLE tool (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    col_label VARCHAR(512) NOT NULL,
    col_desc VARCHAR(1024),
    col_content MEDIUMTEXT NOT NULL,
    col_xmlschema MEDIUMTEXT NOT NULL,
    col_version INT NOT NULL,
    creatornum VARCHAR(200),
    creatorname VARCHAR(200),
    updatornum VARCHAR(200),
    updatorname VARCHAR(200),
    col_hasconfig TINYINT,
    col_protected TINYINT DEFAULT 0,
    col_recursive TINYINT DEFAULT -1,
    PRIMARY KEY(id)
);

CREATE TABLE workspace (
    id VARCHAR(128) NOT NULL,
    col_label VARCHAR(256) NOT NULL,
    col_desc VARCHAR(1024),
    created DATETIME NOT NULL,
    updated DATETIME,
    col_defaulte TINYINT NOT NULL,
    col_enableanonymous TINYINT  DEFAULT 1,
    col_homepagetype TINYINT DEFAULT 0,
    col_canswitch TINYINT DEFAULT 1,
    col_istest  TINYINT DEFAULT 0,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_acllevel INT DEFAULT 0 NOT NULL,
    col_public INT,
    col_variables MEDIUMTEXT,
    col_shortcut VARCHAR(256),
    col_notice MEDIUMTEXT,
    col_config VARCHAR(1024),
    col_iconid VARCHAR(128) DEFAULT '1',
    col_icondata MEDIUMTEXT,
    col_accesslist VARCHAR(1024),
    col_hidespacesearch VARCHAR(128),
	  col_thirdpartyscripts VARCHAR(4000),
	  	col_enableauditlog INT DEFAULT 0,
	col_enablepwdverify INT DEFAULT 0,
	col_formpolicy VARCHAR(20),
	col_otherconfig VARCHAR(4000),
	  PRIMARY KEY(id)
);

CREATE TABLE apptree (
    id VARCHAR(128) NOT NULL,
    col_classid VARCHAR(128),
    col_label VARCHAR(256) NOT NULL,
    col_desc VARCHAR(1024),
    created DATETIME NOT NULL,
    updated DATETIME,
    col_defaulte TINYINT NOT NULL,
    col_defaultformid VARCHAR(128) DEFAULT 'NULL',
    col_content MEDIUMTEXT,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_acllevel INT DEFAULT 0 NOT NULL,
    col_expand INT DEFAULT 1 NOT NULL,
    col_defaultexpandlevel INT DEFAULT 100 NOT NULL,
    col_expandright INT DEFAULT 1 NOT NULL,
    col_public INT,
    col_workspaceid VARCHAR(128),
    col_productid VARCHAR(128) NOT NULL DEFAULT '0',
	col_shareid VARCHAR(128),
	col_hidesystemfields VARCHAR(10) DEFAULT 'false',
	col_enablepreference VARCHAR(10) DEFAULT 'false',
	col_translation MEDIUMTEXT,
    col_module VARCHAR(10) DEFAULT 'form',
	PRIMARY KEY(id)
);

CREATE TABLE website (
    id VARCHAR(128) NOT NULL,
    col_classid VARCHAR(128),
    col_label VARCHAR(256) NOT NULL,
    col_shortcut VARCHAR(256) NOT NULL,
    col_encoding VARCHAR(32) NOT NULL DEFAULT 'UTF-8',
    col_homepage VARCHAR(32) NOT NULL DEFAULT 'index.html',
    col_loginpage VARCHAR(256) NOT NULL DEFAULT 'login.html',
    col_desc VARCHAR(1024),
    created DATETIME NOT NULL,
    updated DATETIME,
    col_defaulte TINYINT NOT NULL,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_acllevel INT DEFAULT 0 NOT NULL,
    col_public INT,
    col_workspaceid VARCHAR(128),
    PRIMARY KEY(id)
);

CREATE TABLE wpconfig (
    name VARCHAR(512),
    serverip VARCHAR(100),
    formid VARCHAR(150),
    urlfield VARCHAR(1024),
    titlefield VARCHAR(1024),
    webpagefield VARCHAR(1024),
    username VARCHAR(200),
    password VARCHAR(1024),
    created DATETIME NOT NULL,
    updated DATETIME,
    formname VARCHAR(1024),
    urlname VARCHAR(1024),
    titlename VARCHAR(1024),
    webpagename VARCHAR(1024),
    id VARCHAR(128) NOT NULL,
    serverport VARCHAR(10),
    isautosave VARCHAR(10),
    spaceid VARCHAR(128),
    spacename VARCHAR(256),
    PRIMARY KEY(id)
);

CREATE TABLE dbseq (
    tabname VARCHAR(128) NOT NULL,
    fieldname VARCHAR(128) NOT NULL,
    currentval INT,
    dirty INT DEFAULT 0 NOT NULL,
    PRIMARY KEY(tabname,fieldname)
);

CREATE TABLE mfmessage (
    id INT NOT NULL,
    subject VARCHAR(256),
    content MEDIUMTEXT,
    firetime DATETIME NOT NULL,
    senderid VARCHAR(256) NOT NULL,
    sendername VARCHAR(256) NOT NULL,
    receivers VARCHAR(2048),
    smstos VARCHAR(2048),
    mailtos VARCHAR(2048),
    type VARCHAR(128),
    htmlurl VARCHAR(2048),
    contentfile VARCHAR(128),
    temp VARCHAR(128),
    sendsms INT DEFAULT 0 NOT NULL,
    sendmail INT DEFAULT 0 NOT NULL,
    senddingding INT DEFAULT 0 NOT NULL,
    sendwechatent INT DEFAULT 0 NOT NULL,
    deleted INT DEFAULT 0 NOT NULL,
    spaceid VARCHAR(128) DEFAULT '-1',
    PRIMARY KEY(id)
);
CREATE TABLE receivedmessage (
    messageid INT NOT NULL,
    receiverid VARCHAR(128) NOT NULL,
    receivername VARCHAR(128) NOT NULL,
    readflag INT DEFAULT 0 NOT NULL,
    readtime DATETIME,
    PRIMARY KEY(messageid,receiverid)
);
CREATE TABLE relatedinfo (
    messageid INT NOT NULL,
    formid VARCHAR(128) NOT NULL,
    recordid INT NOT NULL,
    recordcontent VARCHAR(2048) NOT NULL,
    PRIMARY KEY(messageid,formid,recordid)
);
CREATE TABLE smsmessage (
    messageid INT NOT NULL,
    receiverid VARCHAR(256) NOT NULL,
    receivername VARCHAR(256) NOT NULL,
    sentflag INT DEFAULT 0 NOT NULL,
    firetime DATETIME,
    PRIMARY KEY(messageid,receiverid)
);
CREATE TABLE smsreceived (
    id VARCHAR(128) NOT NULL,    
    content VARCHAR(512),
    receivetime DATETIME NOT NULL,
    senderid VARCHAR(256) NOT NULL,
    PRIMARY KEY(id)
);
--ALTER TABLE smsreceived
--    ADD CONSTRAINT smsreceived_pkey PRIMARY KEY (id);
CREATE TABLE mailmessage (
    messageid INT NOT NULL,
    receiverid VARCHAR(256) NOT NULL,
    receivername VARCHAR(256) NOT NULL,
    sentflag INT DEFAULT 0 NOT NULL,
    firetime DATETIME,
    PRIMARY KEY(messageid,receiverid)
);
CREATE TABLE dingdingmessage (
  messageid INT NOT NULL,
  receiverid VARCHAR(256) NOT NULL,
  receivername VARCHAR(256) NOT NULL,
  sentflag INT DEFAULT 0 NOT NULL,
  firetime DATETIME,
  corpid VARCHAR(256),
  corpsecret VARCHAR(256),
  agentid VARCHAR(256),
  PRIMARY KEY(messageid,receiverid)
);
CREATE TABLE wechatentmessage(
  messageid INT NOT NULL,
  receiverid VARCHAR(256) NOT NULL,
  receivername VARCHAR(256) NOT NULL,
  sentflag INT DEFAULT 0 NOT NULL,
  firetime DATETIME,
  corpid VARCHAR(256),
  corpsecret VARCHAR(256),
  agentid VARCHAR(256),
  PRIMARY KEY(messageid,receiverid)
);
CREATE TABLE mobilesharebindinfo(
    col_spaceId VARCHAR(128) NOT NULL,
    col_openId VARCHAR(128) NOT NULL,
    col_account VARCHAR(128),
    col_nickname VARCHAR(128),
    col_headimgurl VARCHAR(512),
    col_type VARCHAR(128),
    col_temp VARCHAR(512),
    PRIMARY KEY(col_spaceId,col_openId)
);
CREATE TABLE mfdsig (
    id VARCHAR(128) NOT NULL,
    col_productid VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    col_productlabel VARCHAR(512) NOT NULL,
    col_productdesc VARCHAR(1024),
    col_productversion VARCHAR(128),
    col_releasedate DATETIME NOT NULL,
    col_license MEDIUMTEXT NOT NULL,
    col_productcreatorid VARCHAR(128) NOT NULL,
    col_workspaceid VARCHAR(128) NOT NULL,
    col_validdate DATETIME NOT NULL,
    col_authorized INT DEFAULT 0 NOT NULL,
    col_ef INT DEFAULT 1,
    col_logourl VARCHAR(512),
    col_totalusers INT DEFAULT 0 NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE customfilter (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    title VARCHAR(512) NOT NULL, 
    content MEDIUMTEXT NOT NULL,    
    userid VARCHAR(200),
    formid VARCHAR(128),
    defaulte INT DEFAULT 0 NOT NULL
);
CREATE TABLE defaultcustomfilter (
    filterid VARCHAR(128) NOT NULL,    
    userid VARCHAR(200) NOT NULL,
    formid VARCHAR(128) NOT NULL,
    PRIMARY KEY(filterid,userid,formid)
);
CREATE TABLE alipayinfo(
    col_out_trade_no VARCHAR(256) NOT NULL PRIMARY KEY,
    col_spaceId VARCHAR(128),
    col_formId VARCHAR(128),
    col_recordId VARCHAR(128),
    col_trade_no VARCHAR(128),
    col_trade_status VARCHAR(128),
    col_gmt_create VARCHAR(128),
    col_gmt_payment VARCHAR(128),
    col_gmt_close VARCHAR(128),
    col_refund_status VARCHAR(128),
    col_gmt_refund VARCHAR(128),
    col_notify_time VARCHAR(128),
    col_notify_type VARCHAR(128),
    col_seller_email VARCHAR(128),
    col_buyer_email VARCHAR(128),
    col_seller_id VARCHAR(128),
    col_buyer_id VARCHAR(128),
    col_discount VARCHAR(128),
    col_business_scene VARCHAR(128),
    col_total_fee VARCHAR(128)
);


CREATE TABLE alipayperinfo(
    col_out_trade_no VARCHAR(256) NOT NULL PRIMARY KEY,
    col_spaceId VARCHAR(128),
    col_formId VARCHAR(128),
    col_recordId VARCHAR(128),
    col_trade_no VARCHAR(128),
    col_trade_status VARCHAR(128),
    col_trade_status_field VARCHAR(128),
    col_gmt_create VARCHAR(128),
    col_total_fee VARCHAR(128)
);

CREATE TABLE recordopqueue (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    formid VARCHAR(128) NOT NULL,
    recordid INT NOT NULL,
    created DATETIME NOT NULL,
    recordxml MEDIUMTEXT,
    op TINYINT NOT NULL
);

CREATE TABLE syncerrorlog (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    formid VARCHAR(128) NOT NULL,
    spaceid VARCHAR(128) NOT NULL,
    recordid VARCHAR(512) NOT NULL,
    rcreated DATETIME NOT NULL,
    recordxml MEDIUMTEXT,
    op TINYINT NOT NULL,
    errorinfo VARCHAR(512)
);

--微应用
CREATE TABLE microapplication (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_name VARCHAR(128),
    col_icon VARCHAR(256),
    col_desc VARCHAR(1024),
    col_workspaceid VARCHAR(128),
    col_themecolor VARCHAR(128) DEFAULT '#00a0e9',
    col_fontcolor VARCHAR(128) DEFAULT '#ffffff',
    col_wechartshareid VARCHAR(1024),
    col_ddshareid VARCHAR(1024),
    col_qiyewechartshareid VARCHAR(1024),
    col_gongzhonghaoshareid VARCHAR(1024),
    col_browsershareid VARCHAR(1024),
    col_homepageid VARCHAR(128),
    col_classid VARCHAR(128),
    PRIMARY KEY (id)
);
CREATE TABLE microapppage (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_pagename VARCHAR(128),
    col_pagetype VARCHAR(256),
    col_pagecontent MEDIUMTEXT,
    col_microapplicationid VARCHAR(128),
    col_classid VARCHAR(128),
    PRIMARY KEY (id, col_microapplicationid)
);
CREATE TABLE formpagetemplate(
  id VARCHAR(128) NOT NULL,
	created DATETIME NOT NULL,
	updated DATETIME,
	creatorname VARCHAR(200),
	creatornum VARCHAR(200),
	updatorname VARCHAR(200),
	updatornum VARCHAR(200),
	col_name VARCHAR(128),
	col_templatetype VARCHAR(128),
  col_workspaceid VARCHAR(128),
	col_templatecontent MEDIUMTEXT,
	PRIMARY KEY (id)
);
CREATE TABLE microapp_mapped_form(
    microappid VARCHAR(128) NOT NULL,
    pageid VARCHAR(128) NOT NULL,
    formid VARCHAR(128) NOT NULL,
    changed INT DEFAULT 0 NOT NULL,
    PRIMARY KEY (microappid,pageid,formid)
);
CREATE TABLE tinyurl
(
    id VARCHAR(64) NOT NULL,
    col_url VARCHAR(1000),
	PRIMARY KEY (id)
);

create table product_info(
  id VARCHAR(128) NOT NULL,
  created DATETIME NOT NULL,
  updated DATETIME,
  creatorname VARCHAR(200),
  creatornum VARCHAR(200),
  updatorname VARCHAR(200),
  updatornum VARCHAR(200),
  col_productname VARCHAR(128),
  col_productename VARCHAR(128),
  col_productedition VARCHAR(128),
  col_version VARCHAR(128),
  col_logo VARCHAR(1000),
  col_defaultlogo  VARCHAR(1000),
  col_aboutlogo VARCHAR(1000),
  col_desktopicon VARCHAR(1000),
  col_serviceicon VARCHAR(1000),
  col_servicestopicon VARCHAR(1000),
  col_loginbg VARCHAR(1000),
  col_installpage MEDIUMTEXT NOT NULL,
  col_upgradepage MEDIUMTEXT NOT NULL,
  col_workspaceid VARCHAR(128),
  col_author VARCHAR(128),
  col_contactway VARCHAR(2000),
  col_description VARCHAR(2000),
  col_appid VARCHAR(128),
  PRIMARY KEY (id)
  );

create table package_info(
	id VARCHAR(128) NOT NULL,
	created DATETIME NOT NULL,
  updated DATETIME,
  creatorname VARCHAR(200),
  creatornum VARCHAR(200),
  updatorname VARCHAR(200),
	updatornum VARCHAR(200),
  col_packagename VARCHAR(128),
  col_version VARCHAR(128),
  col_packagetype VARCHAR(128),
  col_packageurl VARCHAR(1000),
	col_workspaceid VARCHAR(128),
  col_desktopicon VARCHAR(2000),
  PRIMARY KEY (id)
);
create table package_log(
	  id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    col_packagename VARCHAR(128),
    col_version VARCHAR(128),
    col_packagetype VARCHAR(128),
    col_logurl VARCHAR(1000),
    col_workspaceid VARCHAR(128),
    col_desktopicon VARCHAR(2000),
    PRIMARY KEY (id)
);

CREATE TABLE preferences(
    userid VARCHAR(128) NOT NULL,
    objectid VARCHAR(128) NOT NULL,
    spaceid VARCHAR(128) not null,
    type INTEGER,
    subtype INTEGER,
    content MEDIUMTEXT,
    enable INT DEFAULT 0 NOT NULL,
    PRIMARY KEY (userid,objectid)
);

CREATE TABLE mdqueue (
    id BIGINT NOT NULL,
    created DATETIME NOT NULL,
    content MEDIUMTEXT,
	PRIMARY KEY (id)
);

--CREATE TABLE webresource (
--    path VARCHAR(512) NOT NULL,
--    filename VARCHAR(256) NOT NULL,
--    filesize BIGINT NOT NULL,
--    mime VARCHAR(64),
--    created DATETIME NOT NULL,
--    updated DATETIME NOT NULL,
--    hashval INTEGER,
--    content LongBlob
--);

-- 组织结构
CREATE TABLE orgnization(
    nodeid INT NOT NULL,
    parentid INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    coding VARCHAR(255) NOT NULL,
    norder INT NOT NULL,
	  nodelevel INT ,
	  created DATETIME,
    updated DATETIME,
    creatorname VARCHAR(200),
    creatornum VARCHAR(200),
    updatorname VARCHAR(200),
    updatornum VARCHAR(200),
    PRIMARY KEY (nodeid)
);
--ALTER TABLE orgnization
--    ADD CONSTRAINT orgnization_pkey PRIMARY KEY (nodeid);
	
CREATE TABLE orgusers(
    userid VARCHAR(128) NOT NULL,
    orgnodeid INTEGER NOT NULL,
    PRIMARY KEY (userid,orgnodeid)
);
--ALTER TABLE orgusers
--   ADD CONSTRAINT orgusers_pkey PRIMARY KEY (userid,orgnodeid);

	
CREATE TABLE subadmins(
    userid VARCHAR(128) NOT NULL,
    orgnodeid INTEGER NOT NULL,
	  canread INTEGER NOT NULL,
	  canmodify INTEGER NOT NULL,
	  asadmin INTEGER NOT NULL,
	  canspace INTEGER NOT NULL,
	  bizorg INTEGER NOT NULL,
	  PRIMARY KEY (userid,orgnodeid)
);
--数据分析
CREATE TABLE adhocproject (
	id varchar(128) NOT NULL, 
	col_name varchar(128) NOT NULL, 
	col_desc varchar(1024), 
	col_workspaceid varchar(128) NOT NULL, 
	created DATETIME NOT NULL, 
	updated DATETIME NOT NULL, 
	creatorname varchar(128) NOT NULL, 
	creatornum varchar(128) NOT NULL, 
	updatorname varchar(128) NOT NULL, 
	updatornum varchar(128) NOT NULL,
	col_classid varchar(128) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE workbook (
	id varchar(128) NOT NULL, 
	col_name varchar(128) NOT NULL, 
	col_desc varchar(128), 
	col_thumbnail MEDIUMTEXT, 
	created DATETIME NOT NULL, 
	updated DATETIME NOT NULL, 
	creatorname varchar(128) NOT NULL, 
	creatornum varchar(128) NOT NULL, 
	updatorname varchar(128) NOT NULL, 
	updatornum varchar(128) NOT NULL, 
	col_adhocid varchar(128) NOT NULL,
	col_classid varchar(128) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE wbdatasource (
	id varchar(128) NOT NULL, 
	col_content MEDIUMTEXT, 
	created DATETIME NOT NULL, 
	updated DATETIME NOT NULL, 
	creatorname varchar(128) NOT NULL, 
	creatornum varchar(128) NOT NULL, 
	updatorname varchar(128) NOT NULL, 
	updatornum varchar(128) NOT NULL, 
	col_workbookid varchar(128) NOT NULL,
	col_classid varchar(128) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE worksheet (
	id varchar(128) NOT NULL, 
	col_label varchar(128) NOT NULL, 
	col_content MEDIUMTEXT, 
	created DATETIME NOT NULL, 
	updated DATETIME NOT NULL, 
	creatorname varchar(128) NOT NULL, 
	creatornum varchar(128) NOT NULL, 
	updatorname varchar(128) NOT NULL, 
	updatornum varchar(128) NOT NULL, 
	col_workbookid varchar(128) NOT NULL,
	col_classid varchar(128) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE formpreferences (
    userid VARCHAR(128) NOT NULL,
    spaceid VARCHAR(128) NOT NULL,
    formid VARCHAR(128) NOT NULL,
    entranceid VARCHAR(255),
    usepriority VARCHAR(2),
    drawercommon MEDIUMTEXT,
    drawerother MEDIUMTEXT,
    recordgrid MEDIUMTEXT,
    recordfilter MEDIUMTEXT,
    recordpaneltoolbar MEDIUMTEXT
);
CREATE TABLE formdetailpageset (
    spaceid VARCHAR(128) NOT NULL,
    formid VARCHAR(128) NOT NULL,
    entranceid VARCHAR(255),
    usepriority VARCHAR(2),
    createpageconfig MEDIUMTEXT,
    modifypageconfig MEDIUMTEXT,
    viewpageconfig MEDIUMTEXT
);
CREATE TABLE apptreepreferences (
	spaceid VARCHAR(128) NOT NULL,
	appid VARCHAR(128) NOT NULL,
	userid VARCHAR(128) NOT NULL,
	usepriority VARCHAR(2),
	apptreeconfig MEDIUMTEXT
);
CREATE TABLE spacepreferences (
    spaceid VARCHAR(128) NOT NULL,
    userid VARCHAR(128) NOT NULL,
    usepriority VARCHAR(2),
    spaceconfig VARCHAR(1000),
	PRIMARY KEY (spaceid,userid)
);
CREATE TABLE systempreferences (
    userid VARCHAR(128) NOT NULL,
    usepriority VARCHAR(2),
    systemconfig VARCHAR(1000)
);
CREATE TABLE lockorupdatelog (
	id VARCHAR(128) NOT NULL,
	created DATETIME ,
	updated DATETIME ,
	col_filename VARCHAR(128),
	col_filesize VARCHAR(128) ,
	col_usefor VARCHAR(20),
	col_uploader VARCHAR(128),
	col_licensor VARCHAR(128),
	col_unlocker VARCHAR(128),
	col_spaceid VARCHAR(128),
	col_lockpwd VARCHAR(128),
	col_updatepwd VARCHAR(128),
	col_needbackup INT ,
	col_status VARCHAR(20),
	col_storageareaid VARCHAR(128)
);

--ALTER TABLE adhocproject
    --ADD CONSTRAINT adhocproject_pkey PRIMARY KEY (id);

--ALTER TABLE workbook
    --ADD CONSTRAINT workbook_pkey PRIMARY KEY (id);
	
--ALTER TABLE wbdatasource
    --ADD CONSTRAINT wbdatasource_pkey PRIMARY KEY (id);

--ALTER TABLE worksheet
    --ADD CONSTRAINT worksheet_pkey PRIMARY KEY (id);
--ALTER TABLE subadmins
--    ADD CONSTRAINT subadmins_pkey PRIMARY KEY (userid,orgnodeid);

--ALTER TABLE recordopqueue
--    ADD CONSTRAINT recordopqueue_pkey PRIMARY KEY (id);

--ALTER TABLE customfilter
--    ADD CONSTRAINT customfilter_pkey PRIMARY KEY (id);
--ALTER TABLE actiontype
--    ADD CONSTRAINT actiontype_pkey PRIMARY KEY (col_actiontypeid);

--ALTER TABLE authority
--    ADD CONSTRAINT authority_pkey PRIMARY KEY (col_authid);

--ALTER TABLE itemacl
--    ADD CONSTRAINT itemacl_pkey PRIMARY KEY (col_itemid, col_authorityid);

--ALTER TABLE itemaction
--    ADD CONSTRAINT itemaction_pkey PRIMARY KEY (col_actionid);

--ALTER TABLE itemactiongroup
--    ADD CONSTRAINT itemactiongroup_pkey PRIMARY KEY (col_groupid);

--ALTER TABLE itemtype
--    ADD CONSTRAINT itemtype_pkey PRIMARY KEY (col_typeid);

--ALTER TABLE itemtypeacl
--    ADD CONSTRAINT itemtypeacl_pkey PRIMARY KEY (col_itemtypeid, col_authorityid, col_itemparentid, col_itemtypevalue);
    
--ALTER TABLE tool
--    ADD CONSTRAINT tool_pkey PRIMARY KEY (id);

--ALTER TABLE workspace
--    ADD CONSTRAINT workspace_pkey PRIMARY KEY (id);
    
--ALTER TABLE apptree
--    ADD CONSTRAINT apptree_pkey PRIMARY KEY (id);

--ALTER TABLE website
--    ADD CONSTRAINT website_pkey PRIMARY KEY (id);
    
--ALTER TABLE wpconfig
--    ADD CONSTRAINT wpconfig_pkey PRIMARY KEY (id);

--ALTER TABLE dbseq
--    ADD CONSTRAINT dbseq_pkey PRIMARY KEY (tabname, fieldname);

--ALTER TABLE mfmessage
--    ADD CONSTRAINT mfmessage_pkey PRIMARY KEY (id);
    
--ALTER TABLE receivedmessage
--    ADD CONSTRAINT receivedmessage_pkey PRIMARY KEY (messageid, receiverid);
    
--ALTER TABLE relatedinfo
--    ADD CONSTRAINT relatedinfo_pkey PRIMARY KEY (messageid);

--ALTER TABLE mfdsig
--    ADD CONSTRAINT mfdsig_pkey PRIMARY KEY (id);

--ALTER TABLE microapplication
--    ADD CONSTRAINT microapplication_pkey PRIMARY KEY (id);

--CREATE INDEX mfmessage_content_idx ON mfmessage (content);  

--CREATE INDEX mfmessage_senderid_idx ON mfmessage (senderid);
--CREATE INDEX mfmessage_firetime_idx ON mfmessage (firetime);

INSERT INTO dbseq(tabname,fieldname,currentval) VALUES('MFMESSAGE','ID',0);

INSERT INTO workspace (id, col_label, col_desc, created, updated, col_defaulte, creatorname, creatornum, updatorname, updatornum, col_acllevel, col_public, col_formpolicy) VALUES('00000000-0000-0000-0000-000000000000',	'我的空间', '    空间的描述信息，你可以通过设置里的基本信息标签页修改描述信息。可以放置你的空间公告信息。', '2008-08-08 00:00:00', '2008-08-03 17:19:20.421', 1, '系统帐号', '100000', '系统帐号', '100000',	0,	0, 'convenient');
INSERT INTO orgspaces (orgid,nodeid,spaceid) VALUES(0,0,'00000000-0000-0000-0000-000000000000');
insert into systempreferences(userid,usepriority,systemconfig) values ('mfdefault2022' ,'B','{"defaultSpaceId":"00000000-0000-0000-0000-000000000000"}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1,	'POST',	'/spaces');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(4,	'GET',	'/spaces/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(4,	'GET',	'/spaces/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(4,'GET','/json/spaces/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(4,'GET','/json/spaces/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,	'GET',	'/s/{spaceId}/forms/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,	'GET',	'/s/{spaceId}/forms/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,'GET','/s/json/{spaceId}/forms/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,'GET','/s/json/{spaceId}/forms/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,	'POST',	'/s/{spaceId}/import/data');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,	'POST',	'/s/{spaceId}/import/data/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,	'POST',	'/s/{spaceId}/import/data/{formId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(13,	'POST',	'/s/{spaceId}/import/forms/{typeId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(18,	'GET',	'/s/{spaceId}/storage/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(18,	'GET',	'/s/{spaceId}/storage/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(26,	'POST',	'/s/{spaceId}/forms/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(26,	'POST',	'/s/{spaceId}/forms/{formId}/{action}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/{spaceId}/forms/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/{spaceId}/forms/{formId}/records/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/{spaceId}/forms/{formId}/records/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,    'GET',  '/s/json/{spaceId}/forms/{formId}/records/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,    'GET',  '/s/json/{spaceId}/forms/{formId}/records/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,    'GET',  '/s/json/{spaceId}/forms/{formId}/recordscount/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(30,	'PUT',	'/s/{spaceId}/forms/{formId}/records/bulk?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(31,	'DELETE',	'/s/{spaceId}/forms/{formId}/records/bulk?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(32,	'GET',	'/s/{spaceId}/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(32,	'GET',	'/s/{spaceId}/{formId}/records?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,	'GET',	'/s/{spaceId}/export/forms/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,    'GET',  '/s/{spaceId}/export/forms/{formId}?{exportType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(34,	'GET',	'/s/{spaceId}/export/forms/{formId}/data');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(34,	'GET',	'/s/{spaceId}/export/forms/{formId}/data?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,	'GET',	'/s/{spaceId}/forms/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/json/{spaceId}/forms/{formId}?selector={selector}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/forms/{formId}/runas/{sessionKey}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,	'GET',	'/spaces/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,	'PUT',	'/spaces/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,	'POST',	'/spaces/{spaceId}/icon');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,    'PUT',  '/spaces/variables/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,    'GET',  '/spaces/variables/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(11,	'DELETE',	'/spaces/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,	'PUT',	'/s/{spaceId}/forms/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(25,	'DELETE',	'/s/{spaceId}/forms/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,	'GET',	'/s/{spaceId}/forms/{formId}/records/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,	'GET',	'/s/{spaceId}/forms/{formId}/{action}/records/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,	'GET',	'/s/{spaceId}/forms/{formId}/records/{recordId};JSESSIONID={JSESSIONID}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/json/{spaceId}/forms/{formId}/records/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,	'POST',	'/s/{spaceId}/import/data/area');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,	'POST',	'/s/{spaceId}/import/data/area/{formId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(19,	'DELETE',	'/s/{spaceId}/storage/{areaId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,    'DELETE',   '/s/{spaceId}/clear/storage');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(28,	'DELETE',	'/s/{spaceId}/forms/{formId}/records/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,	'PUT',	'/s/{spaceId}/forms/{formId}/records/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,	'PUT',	'/s/{spaceId}/forms/{formId}/{action}/records/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,	'POST',	'/s/{spaceId}/forms/{formId}/records/{recordId}?forput={forPut}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(28,	'POST',	'/s/{spaceId}/forms/{formId}/records/{recordId}?fordelete={forDelete}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(20,	'GET',	'/s/{spaceId}/storage/{areaId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemacls/{itemId}/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'PUT',	'/s/{spaceId}/itemacls/{itemId}/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'DELETE',	'/s/{spaceId}/itemacls/{itemId}/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemacls');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/authorities/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/authorities/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactions/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactions/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemacls/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemacls/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemtypeacls/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemtypeacls/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'POST',	'/s/{spaceId}/authorities');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/authorities/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'PUT',	'/s/{spaceId}/authorities/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'DELETE',	'/s/{spaceId}/authorities/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactions');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactions/{actionId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemtypeacls');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'POST',	'/s/{spaceId}/itemacls');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactiongroups/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactiongroups/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactiongroups');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemactiongroups/{actionId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemtypeacls/{parentId}/{typeId}/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'PUT',	'/s/{spaceId}/itemtypeacls/{parentId}/{typeId}/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'DELETE',	'/s/{spaceId}/itemtypeacls/{parentId}/{typeId}/{authorityId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'GET',	'/s/{spaceId}/itemtypeacls/{parentId}/{typeId}/{authorityId}/{itemTypeValue}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'PUT',	'/s/{spaceId}/itemtypeacls/{parentId}/{typeId}/{authorityId}/{itemTypeValue}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'DELETE',	'/s/{spaceId}/itemtypeacls/{parentId}/{typeId}/{authorityId}/{itemTypeValue}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'GET',	'/wpconfig');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'PUT',	'/wpconfig/{wpconfigId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'DELETE',	'/wpconfig/{wpconfigId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'GET',	'/wpconfig/{wpconfigId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'GET',	'/wpconfig/{wpconfigId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'GET',	'/wpconfig/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'PUT',	'/wpconfig/default/{wpconfigId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,	'POST',	'/s/{spaceId}/itemtypeacls');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(40,	'POST',	'/wpconfig');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/{spaceId}/forms/{formId}/records/report/{reportType}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(5,	'POST',	'/s/{spaceId}/tools');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(8,	'GET',	'/s/{spaceId}/tools/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(8,	'GET',	'/s/{spaceId}/tools/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(14,	'GET',	'/s/{spaceId}/tools/{toolId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(14,	'POST',	'/s/{spaceId}/forms');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(7,	'DELETE',	'/s/{spaceId}/tools/{toolId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,	'GET',	'/s/{spaceId}/forms/{formId}/tree?{params}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/forms/{formId}?{params}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(39,	'PUT',	'/s/{spaceId}/storage/{areaId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(39,    'GET',  '/s/{spaceId}/progress/{taskId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(39,    'PUT',  '/s/{spaceId}/progress/{taskId}?{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(39,    'GET',  '/s/{spaceId}/eprogress/{taskId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(39,    'PUT',  '/s/{spaceId}/eprogress/{taskId}?{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'PUT',  '/s/{spaceId}/tabs');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,    'PUT',  '/s/{spaceId}/tabs?{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'GET',  '/s/{spaceId}/tabs');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/tabs/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'DELETE',  '/s/{spaceId}/tabs/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'GET',  '/s/{spaceId}/import/csv/{formFileId}/{csvFileId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/csvdata');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/csvdata/form');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(100,    'POST',  '/users');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(100,    'POST',  '/users/importe/data');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(99,    'POST',  '/users/register/external');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(100,    'GET',  '/users/export/data');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(100,    'POST',  '/users/importe/data?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(100,    'GET',  '/users/importe/progress');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(101,    'GET',  '/users/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(101,    'GET',  '/users/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(101,    'GET',  '/json/users/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(101,    'GET',  '/json/users/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(102,    'GET',  '/users/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(103,    'PUT',  '/users/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(103,    'PUT',  '/users/{userId}/{attrName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(104,    'DELETE',  '/users/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(105,    'PUT',  '/passwords/modify/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(105,    'PUT',  '/usermailconf/modify/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(106,    'PUT',  '/passwords/reset/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(107,    'PUT',  '/users/lock/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(108,    'PUT',  '/users/unlock/{userId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,    'GET',  '/s/json/{spaceId}/preferences/{objectId}/type/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,    'GET',  '/s/json/{spaceId}/preferences/{objectId}/type/{type}/{subType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,    'POST',  '/s/json/{spaceId}/preferences/{objectId}/type/{type}/{subType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,    'PUT',  '/s/json/{spaceId}/preferences/{objectId}/type/{type}/{subType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,    'DELETE',  '/s/json/{spaceId}/preferences/{objectId}/type/{type}/{subType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'PUT',  '/s/json/{spaceId}/preferences/{objectId}/action/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'PUT',  '/s/json/{spaceId}/preferences/{objectId}/action/{action}/{subType}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(17,    'GET',  '/s/{spaceId}/relation/forms/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/relation/forms/{formId}/fields/{fieldName}?isRealUnique');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/relation/forms/{formId}/fields/{fieldName}?relationInfo');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/relation/manytomany');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'PUT',  '/s/{spaceId}/relation/manytomany');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'GET',  '/s/{spaceId}/relation/forms/{formId}/fields/{fieldName}?canDelete');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,    'GET',  '/s/{spaceId}/export/forms/multiple/{formIds}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,    'GET',  '/s/{spaceId}/export/forms/multiple/{formIds}/output?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,    'POST',  '/s/{spaceId}/export/forms/multiple/{formIds}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,    'POST',  '/s/{spaceId}/export/forms/multiple/{formIds}/output?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(13,    'POST',  '/s/{spaceId}/import/forms/multiple/{fileId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(13,    'GET',  '/s/{spaceId}/import/forms/progress/{taskId}?{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/forms/{formId}/check/{version}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/forms/{formId}/check/{version}/runas/{sessionKey}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(14,    'GET',  '/s/{spaceId}/tools/{toolId}/{action}');
--重复INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(33,    'GET',  '/s/{spaceId}/export/forms/{formId}?{exportType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(13,    'POST',  '/s/{spaceId}/import/forms/tool/{toolId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments;jsessionid={jsessionid}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments;jsessionid={jsessionid}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments;JSESSIONID={JSESSIONID}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments;JSESSIONID={JSESSIONID}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/{attachmentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'DELETE',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/{attachmentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/{attachmentId}?fordelete={forDelete}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/r/{attachmentId}?{query}');  
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/r/{attachmentId};jsessionid={jsessionid}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/r/{attachmentId};jsessionid={jsessionid}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/r/{attachmentId};JSESSIONID={JSESSIONID}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/r/{attachmentId};JSESSIONID={JSESSIONID}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/{attachmentId}?type={type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/feed?start={start}&limit={limit}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/download/{attachmentId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/download/{attachmentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/download');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/download/{attachmentId}/{tempToken}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'POST',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/images/rotate/{attachmentId}/{degree}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/synctrigger/source/check/{triggerLabel}/filterGroup/condition/{sourceFormId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/synctrigger/source/check/{triggerLabel}/condition/{sourceFormId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/synctrigger/source/check/{triggerLabel}/condition/{type}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(111,    'POST',  '/s/{spaceId}/apps');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(109,    'GET',  '/s/{spaceId}/apps/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(112,    'DELETE',  '/s/{spaceId}/apps/{appId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(113,    'PUT',  '/s/{spaceId}/apps/{appId}');            
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(110,    'GET',  '/s/{spaceId}/apps/{appId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(110,    'GET',  '/s/{spaceId}/apps/{appId}?{timestamp}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(114,    'GET',  '/s/{spaceId}/apps/export/{appId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(115,    'POST',  '/s/{spaceId}/apps/import');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(110,    'GET',  '/s/json/{spaceId}/apps/{appId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(110,    'GET',  '/s/json/{spaceId}/apps/{appId}?{timestamp}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(109,    'GET',  '/s/json/{spaceId}/apps/feed?{query}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(301,    'POST',  '/s/{spaceId}/websites');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(302,    'GET',  '/s/{spaceId}/websites/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(303,    'DELETE',  '/s/{spaceId}/websites/{websiteId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(304,    'PUT',  '/s/{spaceId}/websites/{websiteId}');            
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(305,    'GET',  '/s/{spaceId}/websites/{websiteId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(305,    'GET',  '/s/{spaceId}/websites/{websiteId}?{timestamp}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(306,    'GET',  '/s/{spaceId}/websites/export/{websiteId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(307,    'POST',  '/s/{spaceId}/websites/import');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(507,    'POST',  '/s/{spaceId}/sync/hand/external/{formId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(508,    'POST',  '/s/{spaceId}/sync/hand/internal/{formId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(509,    'GET',  '/s/{spaceId}/sync/{formId}/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(510,    'POST',  '/s/{spaceId}/sync/timer/check/');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(511,    'POST',  '/s/{spaceId}/sync/{formId}/tasks/{taskId}/{action}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(602,    'GET',  '/s/{spaceId}/portals/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(603,    'POST',  '/s/{spaceId}/portals');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(604,    'DELETE',  '/s/{spaceId}/portals/{portalId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(608,    'PUT',  '/s/{spaceId}/portals/{portalId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(606,    'GET',  '/s/{spaceId}/portal/{portalId}/components/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(607,    'POST',  '/s/{spaceId}/portal/{portalId}/component/{componentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(609,    'PUT',  '/s/{spaceId}/portal/{portalId}/component/{componentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(610,    'DELETE',  '/s/{spaceId}/portal/{portalId}/component/{componentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(611,    'GET',  '/s/{spaceId}/portals/{portalId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(614,    'POST',  '/s/{spaceId}/portal/{portalId}/check/filterGroup');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(615,    'POST',  '/s/{spaceId}/portal/{portalId}/check/filter/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(616,    'POST',  '/s/{spaceId}/portal/{portalId}/copy');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(606,    'GET',  '/s/{spaceId}/portal/{portalId}/component/{componentId}/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(617,    'POST',  '/s/{spaceId}/portals/{portalId}/release');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(618,    'POST',  '/s/{spaceId}/portals/{portalId}/apply/{action}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(401,    'POST',  '/s/{spaceId}/externalds');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(402,    'GET',  '/s/{spaceId}/externalds/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(403,    'DELETE',  '/s/{spaceId}/externalds/{externalDSId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(404,    'PUT',  '/s/{spaceId}/externalds/{externalDSId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(405,    'GET',  '/s/{spaceId}/externalds/{externalDSId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(406,    'GET',  '/s/{spaceId}/externalds/export/{externalDSId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(407,    'POST',  '/s/{spaceId}/externalds/import');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'PUT',  '/s/{spaceId}/{type}/tabs');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,    'PUT',  '/s/{spaceId}/{type}/tabs?{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'GET',  '/s/{spaceId}/{type}/tabs');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/{type}/tabs/{appId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'DELETE',  '/s/{spaceId}/{type}/tabs/{appId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(116,    'POST',  '/messages');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(116,    'GET',  '/messages/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(116,    'DELETE',  '/messages?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(116,    'PUT',  '/messages/{messageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(116,    'DELETE',  '/messages/{messageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(116,    'GET',  '/messages/{type}/{messageId}');


INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/data/excel/{formId}?{desc}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/data/excel/{formId}/{updateCsv}?{desc}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/data/excel/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/data/excel/{formId}/{updateCsv}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/{attachmentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/thumbnail/{attachmentId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/thumbnail/{attachmentId}?type={type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/{attachmentId}/{tempToken}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/thumbnail/{attachmentId}/{tempToken}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/{attachmentId};JSESSIONID={JSESSIONID}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{fieldName}/attachments/play/thumbnail/{attachmentId};JSESSIONID={JSESSIONID}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'GET',  '/s/{spaceId}/findDependFields/{formId}/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'GET',  '/s/{spaceId}/isDepended/{formId}/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(27,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/check');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/formula/check');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/formula/check/{fieldLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/records/check');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/{action}/records/check');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/records/{recordId}/check');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/{action}/records/{recordId}/check');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/records/check/{openup}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/records/{recordId}/check/{openup}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/{action}/records/check/{openup}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/{action}/records/{recordId}/check/{openup}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/{action}/records/before/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/{formId}/{action}/records/{recordId}/before/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/formula/check/isUsed/{fieldLabel}');

--输入校验公式
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,  'POST', '/s/{spaceId}/forms/{formId}/validationformula/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,  'POST', '/s/{spaceId}/forms/{formId}/validationformula/{fieldName}/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,  'POST', '/s/{spaceId}/validationformula/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,  'POST', '/s/{spaceId}/validationformula/{action}/{fieldName}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/formula/sum/check');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/formula/sum/check/{fieldLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/formula/sum/check/isUsed/{fieldLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,   'GET',  '/s/{spaceId}/formula/sum/{formId}/stats?{query}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,   'GET',  '/s/{spaceId}/forms/{formId}/serial');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,   'PUT',  '/s/{spaceId}/forms/{formId}/serial');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,   'GET',  '/s/{spaceId}/forms/{formId}/textserial?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,   'PUT',  '/s/{spaceId}/forms/{formId}/textserial');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'PUT',  '/s/{spaceId}/forms/{formId}/partial/fields/{fieldName}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,   'POST',  '/s/{spaceId}/export/mfd/multiple');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(10,   'GET',  '/s/{spaceId}/export/mfd/multiple');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'GET',  '/s/{spaceId}/trigger/filter/itemlist/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'GET',  '/s/{spaceId}/trigger/reference/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'GET',  '/s/{spaceId}/trigger/reference/{formId}/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'GET',  '/s/{spaceId}/trigger/groupref/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'GET',  '/s/{spaceId}/trigger/groupref/{formId}/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'GET',  '/s/{spaceId}/trigger/invokecircular/{formId}/{groupId}/{triggerFormId}/{triggerGroupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/source/{sourceFormId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/context/check/{triggerLabel}/context/{groupId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/condition/{sourceFormId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/params/check/{formId}/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/prompts/check/{formId}/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/params/check/{formId}/{groupId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/popups/check/{formId}/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/popups/check/{formId}/{groupId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/params/recordids/{formId}/{groupId}/{currentRecordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/popups/recordids/{formId}/{groupId}/{currentRecordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/hand/run/{formId}/{groupId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/condition');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/condition/message');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/condition/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/target/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/assignment/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/filterGroup/source/{sourceFormId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/context/check/{triggerLabel}/filterGroup/context/{groupId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/filterGroup/condition/{sourceFormId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/filterGroup/target');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'GET',  '/s/{spaceId}/trigger/logs?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'PUT',  '/s/{spaceId}/trigger/updateTrigger/{formId}/{updateType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/trigger/source/check/{triggerLabel}/message/{type}');
--重复INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/synctrigger/source/check/{triggerLabel}/filterGroup/condition/{sourceFormId}');
--重复INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/synctrigger/source/check/{triggerLabel}/condition/{sourceFormId}/{itemLabel}');
--重复INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/synctrigger/source/check/{triggerLabel}/condition/{type}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/source/{sourceFormId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/target/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/assignment/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/filterGroup/source/{sourceFormId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/filterGroup/target');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'PUT',  '/s/{spaceId}/report/updateReport/{formId}/{updateType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/report/{formId}/exec');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/message/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/message/{type}/{sendType}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/condition/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/report/source/check/{reportLabel}/filterGroup/condition/{sourceFormId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,   'GET',  '/s/{spaceId}/chart/showChart/{formId}/{chartLabel}/{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,   'GET',  '/s/{spaceId}/chart/data/{formId}/{chartLabel}/{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,   'POST',  '/s/{spaceId}/chart/data/{formId}/{chartLabel}/{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,   'POST',  '/s/{spaceId}/chart/showChart/{formId}/{chartLabel}/{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,   'GET',  '/s/{spaceId}/chart/dimension/{formId}/{chartLabel}/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24,    'PUT',  '/s/{spaceId}/chart/updateChart/{formId}/{updateType}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/filter/check/filter/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/filter/check/filterGroup');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/appfilter/check/filter/{filterLabel}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'POST',  '/s/{spaceId}/appfilter/check/filterGroup/{filterLabel}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'GET',  '/s/{spaceId}/preferences/{key}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'PUT',  '/s/{spaceId}/preferences/{key}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'DELETE',  '/s/{spaceId}/preferences/{key}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,   'GET',  '/s/{spaceId}/pickup/view/{type}/{formId}/{recordId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{action}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(38,    'GET',  '/s/{spaceId}/forms/{formId}/records/{recordId}/{action}/{fieldName}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(12,    'POST',  '/s/{spaceId}/import/data/otherdomain/{areaId}/{type}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'POST',  '/s/{spaceId}/copy/form');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/temp/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'DELETE',  '/s/{spaceId}/temp/records/{tempRecordId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/{spaceId}/trans');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'DELETE',  '/s/{spaceId}/trans/{transId}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(200,    'POST',  '/register');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(201,    'GET',  '/register/download');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,    'GET',  '/s/{spaceId}/querycustom/forms/{formId}/records?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,    'GET',  '/s/{spaceId}/querycustom/forms/{formId}/template');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(117,    'POST',  '/s/{spaceId}/mfdsig/{id}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(118,    'GET',  '/s/{spaceId}/mfdsig/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(118,    'GET',  '/s/{spaceId}/mfdsig/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(117,    'PUT',  '/s/{spaceId}/mfdsig');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/customfilter/{userId}/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/customfilter/check/{userId}/{formId}/{fieldName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/customfilter/checkadv/{userId}/{formId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'POST',  '/s/customfilter/checkadv/{userId}/{formId}/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'DELETE',  '/s/customfilter/{userId}/{formId}/{id}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'PUT',  '/s/customfilter/{userId}/{formId}/{id}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'PUT',  '/s/customfilter/{userId}/{formId}/{id}/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'GET',  '/s/customfilter/{userId}/{formId}/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,    'GET',  '/s/customfilter/eval/{userId}/{formId}/{id}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,    'POST',  '/s/{spaceId}/users');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,    'DELETE',  '/s/{spaceId}/users');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22,    'GET',  '/s/{spaceId}/users/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(4,    'POST',  '/xml2json');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1, 'GET', '/oplogs?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1, 'GET', '/syncerrorlogs?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'DELETE', '/syncerrorlogs/{id}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1, 'GET', '/alipay?{query}');

--微应用
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(701,    'POST',  '/s/{spaceId}/microapplications');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(702,    'GET',  '/s/{spaceId}/microapplications/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(703,    'DELETE',  '/s/{spaceId}/microapplications/{microApplicationId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(704,    'PUT',  '/s/{spaceId}/microapplications/{microApplicationId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/{spaceId}/microapplications/{microApplicationId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/{spaceId}/microapplications/{microApplicationId}?{timestamp}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(702,    'GET',  '/s/json/{spaceId}/microapplications/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/json/{spaceId}/microapplications/{microApplicationId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(701,    'POST',  '/s/{spaceId}/microapplications/{microApplicationId}/pages');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(702,    'GET',  '/s/{spaceId}/microapplications/{microApplicationId}/pages/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(703,    'DELETE',  '/s/{spaceId}/microapplications/{microApplicationId}/pages/{microAppPageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(704,    'PUT',  '/s/{spaceId}/microapplications/{microApplicationId}/pages/{microAppPageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/{spaceId}/microapplications/{microApplicationId}/pages/{microAppPageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/{spaceId}/microapplications/{microApplicationId}/pages/{microAppPageId}?{timestamp}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(702,    'GET',  '/s/json/{spaceId}/microapplications/{microApplicationId}/pages/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/json/{spaceId}/microapplications/{microApplicationId}/pages/{microAppPageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(701,    'POST',  '/s/{spaceId}/formpagetemplates');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(702,    'GET',  '/s/{spaceId}/formpagetemplates/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(703,    'DELETE',  '/s/{spaceId}/formpagetemplates/{formPageTemplateId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/{spaceId}/formpagetemplates/{formPageTemplateId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/{spaceId}/formpagetemplates/{formPageTemplateId}?{timestamp}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(702,    'GET',  '/s/json/{spaceId}/formpagetemplates/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(705,    'GET',  '/s/json/{spaceId}/formpagetemplates/{formPageTemplateId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(707,    'GET',  '/s/{spaceId}/microapplications/{microApplicationId}/shares/{action}/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(706,    'PUT',  '/s/{spaceId}/microapplications/{microApplicationId}/shares/{action}/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(708,    'POST',  '/s/{spaceId}/import/formpagetemplates/{templateName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(708,    'POST',  '/s/{spaceId}/import/formpagetemplates');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(708,    'GET',  '/s/{spaceId}/export/formpagetemplates/{formPageTemplateId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(708,    'GET',  '/s/{spaceId}/export/formpagetemplates/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(701,    'POST',  '/s/{spaceId}/import/microappres/{microApplicationId}/pages/{pageId}/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(703,    'DELETE',  '/s/{spaceId}/import/microappres/{microApplicationId}/pages/{pageId}/{action}/{fileName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(704,    'PUT',  '/s/{spaceId}/import/microappres/{microApplicationId}/pages/{pageId}/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(801, 'GET', '/s/{spaceId}/products/{productId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(803, 'PUT', '/s/{spaceId}/products/{productId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(802, 'POST', '/s/{spaceId}/products');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(803, 'DELETE', '/s/{spaceId}/products/{productId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(801, 'GET', '/s/json/{spaceId}/products/{proguctId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(801, 'GET', '/s/{spaceId}/products/{action}/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(801, 'GET', '/s/json/{spaceId}/products/{action}/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(806, 'POST', '/s/{spaceId}/packages');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(804, 'GET', '/s/{spaceId}/packages/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(805, 'GET', '/s/{spaceId}/packages/{packageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(807, 'DELETE', '/s/{spaceId}/packages/{packageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(804, 'GET', '/s/json/{spaceId}/packages/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(805, 'GET', '/s/json/{spaceId}/packages/{packageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(804, 'GET', '/s/{spaceId}/packagelogs/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(806, 'POST', '/s/{spaceId}/packagelogs');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(805, 'GET', '/s/{spaceId}/packagelogs/{logId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(807, 'DELETE', '/s/{spaceId}/packagelogs/{logId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(804, 'GET', '/s/json/{spaceId}/packagelogs/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(805, 'GET', '/s/json/{spaceId}/packagelogs/{logId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(808, 'GET', '/s/{spaceId}/packages/download/{packageId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(811, 'GET', '/s/{spaceId}/packagelogs/view/{logId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(810, 'GET', '/s/{spaceId}/packageres/{productId}/{action}/{fileName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(809, 'POST', '/s/{spaceId}/packageres/{productId}/{action}/{fileName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(809, 'PUT', '/s/{spaceId}/packageres/{productId}/{action}/{fileName}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(809, 'DELETE', '/s/{spaceId}/packageres/{productId}/{action}/{fileName}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(26,	'POST',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(30,	'PUT',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(31,	'DELETE',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(26,	'POST',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(30,	'PUT',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(31,	'DELETE',	'/s/jsonv2/{spaceId}/forms/{formId}/records/{type}/{recordId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29,	'GET',	'/s/jsonv2/{spaceId}/forms/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(26,	'POST',	'/s/jsonv2/{spaceId}/forms/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(30,	'PUT',	'/s/jsonv2/{spaceId}/forms/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(31,	'DELETE',	'/s/jsonv2/{spaceId}/forms/{formId}/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,	'GET',	'/s/jsonv2/{spaceId}/forms/{formId}?selector={selector}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(29, 'GET', '/s/jsonv2/{spaceId}/forms/{formId}/records/{type}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(26,	'POST',	'/s/jsonv2/{spaceId}/forms/{formId}/bulk/records');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(30,	'PUT',	'/s/jsonv2/{spaceId}/forms/{formId}/bulk/records');

INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(2,'修改',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(3,'删除',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(4,'查询',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(5,'查看',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(0,'设置',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(6,'导入',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(7,'导出',NULL);
INSERT INTO actiontype(col_actiontypeid,col_actiontypename,col_description) VALUES(1,'创建',NULL);

INSERT INTO authority(col_authid,col_parentid,col_authlevel,col_description,col_name,col_typeid,col_digitalid,col_workspaceid) VALUES('1','0',100,'系统管理员','管理员',4,NULL,'00000000-0000-0000-0000-000000000000');
INSERT INTO authority(col_authid,col_parentid,col_authlevel,col_description,col_name,col_typeid,col_digitalid,col_workspaceid) VALUES('2','0',50,'已登录用户','已登录用户',5,NULL,'00000000-0000-0000-0000-000000000000');
INSERT INTO authority(col_authid,col_parentid,col_authlevel,col_description,col_name,col_typeid,col_digitalid,col_workspaceid) VALUES('3','0',50,'对象创建人','创建人',6,NULL,'00000000-0000-0000-0000-000000000000');
INSERT INTO authority(col_authid,col_parentid,col_authlevel,col_description,col_name,col_typeid,col_digitalid,col_workspaceid) VALUES('0','0',0,'未登录用户','未登录用户',3,NULL,'00000000-0000-0000-0000-000000000000');
INSERT INTO authority(col_authid,col_parentid,col_authlevel,col_description,col_name,col_typeid,col_digitalid,col_workspaceid) VALUES('00000001-0001-0001-0001-000000000001','0',0,'审计员','审计员',9,NULL,'00000000-0000-0000-0000-000000000000');
INSERT INTO authority(col_authid,col_parentid,col_authlevel,col_description,col_name,col_typeid,col_digitalid,col_workspaceid) VALUES('00000002-0002-0002-0002-000000000002','0',0,'流程管理员','流程管理员',10,NULL,'00000000-0000-0000-0000-000000000000');

INSERT INTO itemacl(col_itemid,col_itemtypeid,col_authorityid,col_acl) VALUES('00000000-0000-0000-0000-000000000000',1,'C376E129-3B40-0001-9095-15A812006640','000110000');

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建门户',603,'可以创建门户',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询门户',602,'可以查询门户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除门户',604,'可以删除门户',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询组件',606,'可以查看组件',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('新建组件',607,'可以新建组件',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改门户',608,'可以修改门户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('编辑组件',609,'可以编辑组件',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除组件',610,'可以删除组件',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看门户',611,'可以查看门户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('校验公式',614,'可以校验过滤条件',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('校验条件项',615,'可以校验过滤条件',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('复制门户',616,'可以复制门户',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('发布个性化门户',617,'可以发布个性化门户',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('应用个性化门户',618,'管理员可以应用和强制应用个性化门户',-2);



INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('设置权限',22,'可以设置指定空间中的表单、记录和数据文件权限',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建空间',1,'可以创建一个新的空间',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询空间',4,'可以查询所有可见空间',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建应用',5,'可以将所有空间中的所有表单导出为应用',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建应用实例',6,'可以在所有空间中创建应用实例',15);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询应用',8,'可以查询所有应用',15);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('访问该空间',9,'可以访问指定空间',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改该空间',10,'可以修改指定空间',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除该空间',11,'可以删除指定空间',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入数据',12,'可以在指定空间中导入数据',34);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入模板',13,'可以在指定空间中导入表单',20);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建表单',14,'可以在指定空间中创建表单',15);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询表单',17,'可以在指定空间中查询所有表单',18);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询数据文件',18,'可以在指定空间中查询所有数据文件',32);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除数据文件',19,'可以在指定空间中删除所有数据文件',31);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('下载数据文件',20,'可以在指定空间中下载所有数据文件',35);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('新建导入或追加导入',21,'可以在指定空间中将数据文件新建表单导入或追加导入',27);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('读取该表单',23,'可以读取指定表单内容',19);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改该表单',24,'可以修改指定表单内容',16);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除该表单',25,'可以删除指定表单',17);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建记录',26,'可以在指定表单中创建记录',22);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改记录',27,'可以在指定表单中修改所有记录',23);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除记录',28,'可以在指定表单中删除所有记录',24);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询记录',29,'可以在指定表单中查询所有记录',25);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('批量修改记录',30,'可以在指定表单中批量修改所有记录',23);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('批量删除记录',31,'可以在指定表单中批量删除所有记录',24);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导出Excel',32,'可以在指定表单中将所有记录导出成CSV',28);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导出为模板',33,'可以将指定表单导出为模板',21);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导出数据',34,'可以在指定表单中将所有记录导出成MFD',28);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入数据',35,'可以在指定表单中导入CSV或MFD',27);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看记录',38,'可以查看指定表单中的所有记录',26);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('打印记录',41,'可以打印指定表单中的所有记录',55);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改数据文件',39,'可以在导入导出时修改数据文件的状态',30);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('快照配置',40,'可以配置网页快照',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除所有应用',7,'可以删除所有应用',-1);

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建用户',100,'可以创建一个新的用户',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('注册用户',99,'可以创建一个新的用户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询用户信息',101,'可以查询所有用户信息',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看用户信息',102,'可以查看指定用户信息',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改用户信息',103,'可以修改指定用户信息',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除用户',104,'可以删除指定用户',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改密码',105,'可以删除指定用户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('重置密码',106,'可以删除指定用户',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('禁止用户登录',107,'可以禁止指定用户登录',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('允许用户登录',108,'可以允许指定用户登录',-1);

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('更新证书文件',200,'可以更新证书文件',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('下载注册文件',201,'可以下载注册文件',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询导航树',109,'可以查询导航树',73);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看导航树',110,'可以查看导航树',74);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建导航树',111,'可以创建导航树',70);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除导航树',112,'可以删除导航树',72);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改导航树',113,'可以修改导航树',71);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导出导航树',114,'可以导出导航树',76);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入导航树',115,'可以导入导航树',75);

--网站权限点
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询网站',302,'可以查询网站',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看网站',305,'可以查看网站',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建网站',301,'可以创建网站',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除网站',303,'可以删除网站',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改网站',304,'可以修改网站',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导出网站',306,'可以导出网站',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入网站',307,'可以导入网站',-2);

--同步权限点
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('执行手动同步外部数据',507,'可以执行手动同步外部数据',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('执行手动同步内部数据',508,'可以执行手动同步内部数据',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询同步任务',509,'可以查询同步任务',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('执行检查定时同步先决条件',510,'可以执行检查定时同步先决条件',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('执行取消同步任务',511,'执行取消同步任务',-2);

--外部数据源权限点
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询外部数据源',402,'可以查询外部数据源',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看外部数据源',405,'可以查看外部数据源',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建外部数据源',401,'可以创建外部数据源',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除外部数据源',403,'可以删除外部数据源',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改外部数据源',404,'可以修改外部数据源',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导出外部数据源',406,'可以导出外部数据源',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入外部数据源',407,'可以导入外部数据源',-2);

--微应用权限点
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询微应用',702,'可以查询微应用',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看微应用',705,'可以查看微应用',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建微应用',701,'可以创建微应用',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除微应用',703,'可以删除微应用',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改微应用',704,'可以修改微应用',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('分享微应用',706,'可以分享微应用',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看微应用分享',707,'可以查看微应用分享',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导入导出表单页面模板',708,'可以导入导出表单页面模板',0);

--消息提醒权限点
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('消息提醒权限',116,'消息提醒权限',0);

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('更新MFD授权',117,'可以更新MFD授权',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询MFD授权',118,'可以查询MFD授权',-1);

--打包工具
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看打包详情',801,'可以查看打包详情',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('新增打包详情',802,'可以新增打包详情',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('修改打包详情',803,'可以修改打包详情',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询打包工具生成包及日志信息',804,'可以查询打包工具生成包及日志信息',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看打包工具生成包及日志信息',805,'可以查看打包工具生成包及日志信息',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('新增打包工具生成包信息',806,'新增打包工具生成包信息',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除打包工具生成包信息',807,'删除打包工具生成包信息',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('下载打包工具生成包及日志',808,'下载打包工具生成包及日志',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('打包资源上传',809,'打包资源上传',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('打包资源下载',810,'打包资源下载',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看日志',811,'查看日志',0);

INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(2,'010','c1c1d06d-231d-4f77-8ce0-6d1a159161a8','db39a1e8-d634-4b1c-a6c5-84a1253637f5');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(5,'0000000','c1c1d06d-231d-4f77-8ce0-6d1a159161a8','db39a1e8-d634-4b1c-a6c5-84a1253637f5');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(2,'010','d03b9feb-f6d7-44ca-b949-9a46bd78de3c','db39a1e8-d634-4b1c-a6c5-84a1253637f5');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(5,'0000000','d03b9feb-f6d7-44ca-b949-9a46bd78de3c','db39a1e8-d634-4b1c-a6c5-84a1253637f5');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(5,'1111111','0cbb07c8-6b15-42c7-9d7f-d7faab093465','db39a1e8-d634-4b1c-a6c5-84a1253637f5');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(3,'1101111','d03b9feb-f6d7-44ca-b949-9a46bd78de3c','6ba88363-a5be-40e0-b401-61f0312c130f');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(3,'1001100','C377F49C-0F20-0001-816E-185765B08E60','6ba88363-a5be-40e0-b401-61f0312c130f');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(3,'1001100','C377DA86-35E0-0001-F68A-18401480B310','6ba88363-a5be-40e0-b401-61f0312c130f');
INSERT INTO itemtypeacl(col_itemtypeid,col_acl,col_authorityid,col_itemparentid) VALUES(3,'0000000','c1c1d06d-231d-4f77-8ce0-6d1a159161a8','6ba88363-a5be-40e0-b401-61f0312c130f');

INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(8,'创建','1000000',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(11,'查询','0001000',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(13,'导入','0000010',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(9,'修改','0100000',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(10,'删除','0010000',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(12,'查看','0000100',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(14,'导出','0000001',4,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(22,'创建','10000000',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(24,'删除','00100000',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(23,'修改','01000000',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(25,'查询','00010000',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(27,'导入','00000100',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(29,'创建','1000000',5,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(31,'删除','0010000',5,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(30,'修改','0100000',5,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(32,'查询','0001000',5,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(1,'创建','100',1,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(4,'查询','010',1,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(6,'导入','001',1,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(2,'修改','1000',1,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(3,'删除','0100',1,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(5,'查看','0010',1,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(7,'导出','0001',1,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(15,'创建','100',2,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(16,'修改','1000',2,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(17,'删除','0100',2,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(18,'查询','010',2,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(19,'查看','0010',2,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(20,'导入','001',2,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(21,'导出','0001',2,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(26,'查看','00001000',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(28,'导出','00000010',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(55,'打印','00000001',3,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(33,'查看','0000100',5,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(34,'上传','0000010',5,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(35,'下载','0000001',5,NULL,0);

INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(36,'创建','10000000000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(37,'查询','01000000000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(38,'导入','00100000000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(39,'修改','00010000000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(40,'删除','00001000000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(41,'查看','00000100000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(42,'导出','00000010000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(51,'批注','00000001000',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(52,'修订','00000000100',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(53,'下载','00000000010',6,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(54,'打印','00000000001',6,NULL,0);

INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(43,'启用','1',7,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(44,'执行','1',8,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(45,'查看','1',9,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(46,'执行','1',10,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(47,'修改','1',11,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(48,'查看','1',12,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(49,'启用','1',13,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(50,'查看','1',14,NULL,0);

INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(56,'创建','10',15,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(57,'修改','100',15,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(58,'删除','010',15,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(59,'查询','01',15,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(60,'查看','001',15,NULL,1);

INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(61,'修改','1000',16,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(62,'删除','0100',16,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(63,'查看','0010',16,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(64,'刷新','0001',16,NULL,1);

INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(70,'创建','100',17,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(71,'修改','1000',17,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(72,'删除','0100',17,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(73,'查询','010',17,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(74,'查看','0010',17,NULL,1);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(75,'导入','001',17,NULL,0);
INSERT INTO itemactiongroup(col_groupid,col_groupname,col_aclcoding,col_itemtypeid,col_description,col_classorinst) VALUES(76,'导出','0001',17,NULL,1);


INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(408,    'POST',  '/s/{spaceId}/externalds/wscheck');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(408,    'POST',  '/s/{spaceId}/externalds/{externalDSId}/wsloaddata');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(408,    'POST',  '/s/{spaceId}/externalds/{externalDSId}/wsloaddata/{type}');
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('检测WebService连接',408,'可以检测WebService连接',-2);
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(119,    'POST',  '/s/formula/check');
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('校验公式',119,'可以校验公式',0);
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(23,   'POST',  '/s/{spaceId}/formula/check/{formId}/{actionType}/{checkType}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,'POST','/s/{spaceId}/commonfilter/{type}/check/filter/{itemLabel}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(9,'POST','/s/{spaceId}/commonfilter/{type}/check/filterGroup');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1001,'GET','/s/{spaceId}/navpageitemtypeacls/{parentId}');
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询移动门户页按钮权限',1001,'可以查询移动门户页按钮权限',0);


INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1002,'POST','/s/{spaceId}/apps/{appId}/copy');
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('复制导航树',1002,'可以复制导航树',70);

insert into orgnization(nodeid,parentid,name,coding,nodelevel,norder,updated,created) values(0,-1,'组织结构','0',1,100000000,'2020-3-20 00:00:00','2020-3-20 00:00:00');
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询组织结构权限',1011,'可以查询组织结构',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('添加组织结构节点',1012,'可以添加组织结构',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('编辑组织结构节点',1013,'可以编辑组织结构',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除组织结构节点',1014,'可以删除组织结构',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('移动组织结构节点',1015,'可以移动组织结构',0);

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('设置子管理员',1021,'可以设置子管理员',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除子管理员',1022,'可以删除子管理员',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('获取节点子管理员',1023,'可以获取节点子管理员',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('子管理员创建空间',1024,'可以创建空间',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('子管理员修改空间',1025,'可以修改空间',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('子管理员删除空间',1026,'可以删除空间',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('子管理员查询空间',1027,'可以查询空间',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建用户',1028,'子管理员可以在可管理的组织结构节点上创建一个新的用户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除用户',1029,'子管理员可以在可管理的组织结构节点上删除指定用户',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('获取空间可见组织结构',1030,'普通用户获取空间可见组织结构',0);

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1011,'GET','/orgnodes/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1011,'GET','/orgnodes/{nodeId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1012,'POST','/orgnodes');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1013,'PUT','/orgnodes/{nodeId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1014,'DELETE','/orgnodes/{nodeId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1015,'POST','/orgnodes/{nodeId}/move');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(100, 'POST','/users/export/data');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1028, 'POST','/json/users');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(102, 'GET','/json/users/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(103, 'PUT','/json/users/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1029, 'POST','/json/users/bulk/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(101, 'GET','/jsonv2/users/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(101, 'GET','/jsonv2/users/feed?{query}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'POST','/s/json/{spaceId}/users');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'DELETE','/s/json/{spaceId}/users');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'GET','/s/json/{spaceId}/users/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'POST','/s/json/{spaceId}/nodes');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'DELETE','/s/json/{spaceId}/nodes');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(22, 'GET','/s/json/{spaceId}/nodes/feed?{query}');

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1021,'POST','/json/subadmins');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1021,'PUT','/json/subadmins');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1022,'DELETE','/json/subadmins');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1023,'GET','/json/subadmins/{orgId}/{nodeId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1023,'GET','/subadmins/isadmin');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1023,'GET','/json/subadmin/{orgId}/{userId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1021,'POST','/json/subadmin');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1023,'GET','/json/asadmin/childrens/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1023,'GET','/json/asadmin/childrens/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1024,'POST','/json/orgnodespace');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1025,'PUT','/json/orgnodespace/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1026,'DELETE','/json/orgnodespace/{spaceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1027,'GET','/json/orgnodespace/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1030, 'GET','/s/json/{spaceId}/spacenodeviews/feed?{query}');

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('获取审计日志',1101,'获取审计日志',0);
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1101, 'GET','/s/json/{spaceId}/auditlogs/feed?{query}');
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查询数据分析项目',1109,'可以查询数据分析项目',59);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看数据分析项目',1100,'可以查看数据分析项目',60);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建数据分析项目',1102,'可以创建数据分析项目',56);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('编辑数据分析项目',1103,'可以编辑数据分析项目',57);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除数据分析项目',1104,'可以删除数据分析项目',58);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('查看工作簿',1105,'可以查看工作簿',63);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('创建工作簿',1106,'可以创建工作簿',57);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('编辑工作簿',1107,'可以编辑工作簿',61);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('删除工作簿',1108,'可以删除工作簿',62);

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1100,'GET','/s/json/{spaceId}/adhocs/{adhocId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1102,'POST','/s/json/{spaceId}/adhocs');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1103,'PUT','/s/json/{spaceId}/adhocs/{adhocId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1104,'DELETE','/s/json/{spaceId}/adhocs/{adhocId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1102,'POST','/s/json/{spaceId}/adhocs/{adhocId}/copy');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1109,'GET','/s/json/{spaceId}/adhocs/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1109, 'GET','/s/json/{spaceId}/adhocs/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1105,'GET','/s/json/{spaceId}/adhocs/{adhocId}/workbooks/{workbookId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1106,'POST','/s/json/{spaceId}/adhocs/{adhocId}/workbooks');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1106,'POST','/s/json/{spaceId}/adhocs/{adhocId}/workbooks/{workbookId}/copy');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1107,'PUT','/s/json/{spaceId}/adhocs/{adhocId}/workbooks/{workbookId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1108,'DELETE','/s/json/{spaceId}/adhocs/{adhocId}/workbooks/{workbookId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1100,'GET','/s/json/{spaceId}/adhocs/{adhocId}/workbooks/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1100, 'GET','/s/json/{spaceId}/adhocs/{adhocId}/workbooks/feed?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1105, 'GET','/s/json/{spaceId}/workbooks/{workbookId}/datasource');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1107, 'PUT','/s/json/{spaceId}/workbooks/{workbookId}/datasource');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1107, 'POST','/s/json/{spaceId}/workbooks/{workbookId}/datasource');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1107, 'POST','/s/json/{spaceId}/workbooks/{workbookId}/datasource/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1105, 'GET','/s/json/{spaceId}/workbooks/{workbookId}/worksheets/{worksheetId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1107, 'POST','/s/json/{spaceId}/workbooks/{workbookId}/worksheets');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1105, 'GET','/s/json/{spaceId}/workbooks/{workbookId}/worksheets/feed');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1105, 'GET','/s/json/{spaceId}/workbooks/{workbookId}/worksheets/feed?{query}');

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('获取表单自定义设置',1201,'可以获取表单自定义设置',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('保存表单自定义设置',1202,'可以保存表单自定义设置',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('应用和强制应用表单通用设置到全部表单',1203,'可以应用和强制应用表单通用设置到全部表单',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('获取表单明细页内容',1204,'可以获取表单明细页内容',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('导航树自定义设置和获取导航树自定义',1205,'可以设置导航树自定义和获取导航树自定义',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('系统级自定义设置和获取系统级自定义',1206,'可以设置系统级自定义和获取系统级自定义',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('应用系统级自定义设置',1207,'可以应用系统级自定义设置',-1);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('空间级自定义设置和获取空间级自定义设置',1208,'可以设置空间级自定义和获取空间级自定义',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('应用空间级自定义设置',1209,'可以应用空间级自定义设置',-2);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('应用空间所有自定义设置',1210,'可以应用空间所有自定义设置',-2);

INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1201, 'GET','/s/json/{spaceId}/preferences/forms/{formId}/{category}/{entranceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1201, 'GET','/s/json/{spaceId}/preferences/forms/{formId}/{category}/{entranceId}?{query}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1202, 'POST','/s/json/{spaceId}/preferences/forms/{formId}/{category}/{entranceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1203, 'POST','/s/json/{spaceId}/preferences/forms/{formId}/{category}/{entranceId}/action/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1204, 'GET','/s/json/{spaceId}/detailpage/forms/{formId}/{category}/{entranceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(24, 'POST','/s/json/{spaceId}/detailpage/forms/{formId}/{category}/{entranceId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1205, 'POST','/s/json/{spaceId}/preferences/apps/{appId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1205, 'GET','/s/json/{spaceId}/preferences/apps/{appId}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(113, 'POST','/s/json/{spaceId}/preferences/apps/{appId}/action/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1206, 'POST','/json/system/preferences');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1206, 'GET','/json/system/preferences');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1207, 'POST','/json/system/preferences/action/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1208, 'POST','/s/json/{spaceId}/preferences');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1208, 'GET','/s/json/{spaceId}/preferences');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1209, 'POST','/s/json/{spaceId}/preferences/action/{action}');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1210, 'POST','/s/json/{spaceId}/preferences/all/action/{action}');

INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('上传头像',1301,'可以上传头像',0);
INSERT INTO itemaction(col_name,col_actionid,col_description,col_groupid) VALUES('获取头像',1302,'可以获取头像',0);
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1301, 'POST','/avatar/upload');
INSERT INTO actionmapping (col_actionid, col_actiontype, col_uritemplate) VALUES(1302, 'GET','/avatar/{account}');
CREATE TABLE users (
    id VARCHAR(128) NOT NULL,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    col_account VARCHAR(256) NOT NULL,
    col_password VARCHAR(256) NOT NULL,
    col_name VARCHAR(256) NOT NULL,
    col_label VARCHAR(512),
    col_desc VARCHAR(1024),
    col_lock TINYINT,
    col_email VARCHAR(200),
    col_mobile VARCHAR(100),
    col_attributes MEDIUMTEXT,
    col_type TINYINT NOT NULL DEFAULT 0,
    col_needchangeit TINYINT DEFAULT 0 NOT NULL,
    col_online TINYINT DEFAULT 0 NOT NULL,
    col_dingding VARCHAR(256),
    col_entuserid VARCHAR(128),
	  col_pwdchangetime DATETIME,
	  col_avatar TEXT,
	  PRIMARY KEY (id)
);

--ALTER TABLE users
--    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE INDEX orgnization_nameparentid_idx ON orgnization (name,parentid);
CREATE INDEX orgnization_coding_idx ON orgnization (coding);
CREATE INDEX orgusers_orgnodeid_idx ON orgusers (orgnodeid);
CREATE INDEX orgspaces_nodeid_idx ON orgspaces (nodeid);
CREATE INDEX spacenodes_nodeid_idx ON spacenodes (nodeid);
CREATE INDEX spacenodesview_nodeid_idx ON spacenodesview (nodeid);
CREATE INDEX spaceusers_col_userid_idx ON spaceusers (col_userid);
CREATE INDEX users_col_account_idx ON users (col_account);
CREATE INDEX users_col_password_idx ON users (col_password);
CREATE INDEX users_col_name_idx ON users(col_name);
CREATE INDEX auth_compose_idx ON authority(col_parentid, col_typeid, col_digitalid, col_workspaceid);
CREATE INDEX auth_digitalid_idx ON authority(col_digitalid);

CREATE TABLE itempolicy (
	col_policy varchar(20) NOT NULL,
	col_type varchar(20) NOT NULL,
	col_role varchar(20) NOT NULL,
	col_acl varchar(20) NOT NULL,
	PRIMARY KEY (col_policy, col_type, col_role)
);

INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'formtypeacl'  ,'anonymous'  ,'000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'formtypeacl'  ,'logon'  ,'000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'formacl'  ,'creator'  ,'1110');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'formacl'  ,'anonymous'  ,'0000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'formacl'  ,'logon'  ,'0000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'recordacl'  ,'creator'  ,'01111111');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'recordacl'  ,'anonymous'  ,'00000000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'recordacl'  ,'logon'  ,'00000000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'fieldacl'  ,'anonymous'  ,'00000000000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('safety'  ,'fieldacl'  ,'logon'  ,'00000000000');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'formtypeacl'  ,'anonymous'  ,'010');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'formtypeacl'  ,'logon'  ,'010');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'formacl'  ,'creator'  ,'1111');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'formacl'  ,'anonymous'  ,'0010');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'formacl'  ,'logon'  ,'0010');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'recordacl'  ,'creator'  ,'01111111');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'recordacl'  ,'anonymous'  ,'00011001');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'recordacl'  ,'logon'  ,'10011001');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'fieldacl'  ,'anonymous'  ,'11111111111');
INSERT INTO itempolicy(col_policy,col_type,col_role,col_acl) VALUES('convenient'  ,'fieldacl'  ,'logon'  ,'11111111111');

CREATE VIEW formaczz52 AS select * from itemacl where col_itemtypeid=2 and col_authorityid in(select col_authid from authority where col_typeid=3);
CREATE VIEW formaczz62 AS select * from itemacl where col_itemtypeid=2 and col_authorityid='3';
CREATE VIEW formaczz63 AS select * from authority where col_typeid=6;
CREATE VIEW formaczz72 AS select * from itemacl where col_itemtypeid=2 and col_authorityid in(select col_authid from authority where col_typeid=5);
CREATE VIEW formaczz73 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemacl b on b.col_authorityid=a.col_authid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid='-1' and b.col_itemtypeid=2;
CREATE VIEW formaczz74 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemacl b on b.col_authorityid=a.col_parentid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid<>'-1' and b.col_itemtypeid=2;
CREATE view tempzz as SELECT a.col_itemid,b.col_digitalid AS col_authid,a.col_acl FROM itemacl AS a, authority AS b WHERE a.col_authorityid=b.col_authid AND a.col_itemtypeid=2 AND b.col_typeid=2
UNION ALL
SELECT a.col_itemid, b.col_digitalid AS col_authid,a.col_acl FROM itemacl AS a, authority AS b  WHERE a.col_authorityid=b.col_parentid AND a.col_itemtypeid=2 AND b.col_typeid=2
UNION ALL
SELECT a.id AS col_itemid,'anonymous' AS col_authid,(CASE WHEN b.col_acl IS NULL AND a.col_public=0 THEN itempolicy.col_acl WHEN a.col_public=1 THEN '0000' ELSE b.col_acl END) AS col_acl FROM form AS a LEFT JOIN workspace on a.col_workspaceid=workspace.id LEFT JOIN itempolicy on  itempolicy.col_type='formacl' and col_role='anonymous' and  itempolicy.col_policy=workspace.col_formpolicy LEFT JOIN formaczz52 as b ON a.id=b.col_itemid
UNION ALL
SELECT a.id AS col_itemid,a.creatornum AS col_authid,(CASE WHEN b.col_acl IS NULL THEN itempolicy.col_acl ELSE b.col_acl END) AS col_acl FROM form AS a LEFT JOIN workspace on a.col_workspaceid=workspace.id LEFT JOIN itempolicy on  itempolicy.col_type='formacl' and col_role='creator' and  itempolicy.col_policy=workspace.col_formpolicy LEFT JOIN formaczz62 as b ON a.id=b.col_itemid  LEFT JOIN formaczz63 as c ON b.col_authorityid=c.col_authid
UNION ALL
SELECT a.id AS col_itemid, 'logon' AS col_authid,(CASE WHEN b.col_acl IS NULL AND a.col_public=0 THEN itempolicy.col_acl WHEN a.col_public=1 THEN '0000' ELSE b.col_acl END) AS col_acl FROM form AS a  LEFT JOIN workspace on a.col_workspaceid=workspace.id LEFT JOIN itempolicy on  itempolicy.col_type='formacl' and col_role='logon' and  itempolicy.col_policy=workspace.col_formpolicy LEFT JOIN formaczz72 as  b ON a.id=b.col_itemid
UNION ALL
SELECT oa.col_itemid,users.col_account AS col_authid,oa.col_acl FROM
formaczz73 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id
UNION ALL
SELECT oa.col_itemid,users.col_account AS col_authid,oa.col_acl FROM
formaczz74 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id;

CREATE VIEW formacl AS (SELECT col_itemid AS col_itemid,col_authid AS col_authid, SUM(CAST(SUBSTRING(col_acl,3,1) AS SIGNED INTEGER)) AS col_acl, SUM(CAST(SUBSTRING(col_acl,1,1) AS SIGNED INTEGER)) AS col_canmodify FROM tempzz AS tab GROUP BY col_itemid,col_authid);

CREATE VIEW tempzz21 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemtypeacl b on b.col_authorityid=a.col_authid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid='-1' and b.col_itemtypeid=12 AND b.col_itemtypevalue = '0';
CREATE VIEW tempzz22 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemtypeacl b on b.col_authorityid=a.col_parentid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid<>'-1' and b.col_itemtypeid=12 AND b.col_itemtypevalue = '0';
CREATE VIEW tempzz2 AS SELECT authority.col_digitalid,itemtypeacl.col_acl,col_itemparentid AS col_appid,col_workspaceid FROM itemtypeacl,authority WHERE col_itemtypeid=12 AND col_itemtypevalue = '0' AND itemtypeacl.col_authorityid=authority.col_authid AND authority.col_typeid=2
UNION ALL
SELECT authority.col_digitalid,itemtypeacl.col_acl,col_itemparentid AS col_appid,col_workspaceid FROM itemtypeacl,authority WHERE  col_itemtypeid=12 AND  col_itemtypevalue = '0' AND itemtypeacl.col_authorityid=authority.col_parentid AND authority.col_typeid=2
UNION ALL
SELECT 'anonymous' AS col_digitalid,(CASE WHEN itemtypeacl.col_acl IS NULL THEN '1' ELSE itemtypeacl.col_acl END) AS col_acl,apptree.id AS col_appid,apptree.col_workspaceid FROM apptree LEFT JOIN itemtypeacl ON apptree.id=itemtypeacl.col_itemparentid  AND col_itemtypeid=12 AND  col_itemtypevalue = '0' where col_authorityid is null or col_authorityid in(select col_authid from authority where col_typeid=3)
UNION ALL
SELECT 'logon' AS col_digitalid,(CASE WHEN itemtypeacl.col_acl IS NULL THEN '1' ELSE itemtypeacl.col_acl END) AS col_acl,apptree.id AS col_appid,apptree.col_workspaceid FROM apptree LEFT JOIN itemtypeacl ON apptree.id=itemtypeacl.col_itemparentid AND col_itemtypeid=12 AND  col_itemtypevalue = '0' where col_authorityid is null or col_authorityid in(select col_authid from authority where col_typeid=5)
UNION ALL
SELECT users.col_account AS col_digitalid,oa.col_acl,oa.col_itemparentid as col_appid,oa.col_workspaceid FROM
tempzz21 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id
UNION ALL
SELECT users.col_account AS col_digitalid,oa.col_acl,oa.col_itemparentid as col_appid,oa.col_workspaceid FROM
tempzz22 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id;
CREATE VIEW apptreeacl AS SELECT col_digitalid AS col_digitalid,SUM(CAST(col_acl AS SIGNED INTEGER)) as col_acl,col_appid AS col_appid,col_workspaceid AS col_workspaceid FROM tempzz2 TAB GROUP BY col_digitalid,col_appid,col_workspaceid;

CREATE VIEW tempzz31 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemtypeacl b on b.col_authorityid=a.col_authid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid='-1' and b.col_itemtypeid=14;
CREATE VIEW tempzz32 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemtypeacl b on b.col_authorityid=a.col_parentid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid<>'-1' and b.col_itemtypeid=14;
CREATE VIEW tempzz3 AS
SELECT authority.col_digitalid,itemtypeacl.col_acl,col_itemparentid AS col_appid,itemtypeacl.col_itemtypevalue AS col_objectid,col_workspaceid FROM itemtypeacl,authority WHERE col_itemtypeid=14 AND itemtypeacl.col_authorityid=authority.col_authid AND authority.col_typeid=2
UNION ALL
SELECT authority.col_digitalid,itemtypeacl.col_acl,col_itemparentid AS col_appid,itemtypeacl.col_itemtypevalue AS col_objectid,col_workspaceid FROM itemtypeacl,authority WHERE  col_itemtypeid=14  AND itemtypeacl.col_authorityid=authority.col_parentid AND authority.col_typeid=2
UNION ALL
SELECT 'anonymous' AS col_digitalid,itemtypeacl.col_acl,col_itemparentid AS col_appid,itemtypeacl.col_itemtypevalue AS col_objectid,col_workspaceid FROM itemtypeacl,authority WHERE  col_itemtypeid=14 AND itemtypeacl.col_authorityid=authority.col_authid AND authority.col_typeid=3
UNION ALL
SELECT 'logon' AS col_digitalid,itemtypeacl.col_acl,col_itemparentid AS col_appid,itemtypeacl.col_itemtypevalue AS col_objectid,col_workspaceid FROM itemtypeacl,authority WHERE  col_itemtypeid=14 AND itemtypeacl.col_authorityid=authority.col_authid AND  authority.col_typeid=5
UNION ALL
SELECT users.col_account AS col_digitalid,oa.col_acl,oa.col_itemparentid as col_appid,oa.col_itemtypevalue as col_objectid,oa.col_workspaceid FROM
tempzz31 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id
UNION ALL
SELECT users.col_account AS col_digitalid,oa.col_acl,oa.col_itemparentid as col_appid,oa.col_itemtypevalue as col_objectid,oa.col_workspaceid FROM
tempzz32 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id;

CREATE VIEW pagebuttonacl(col_digitalid,col_acl,col_appid,col_objectid,col_workspaceid) AS SELECT col_digitalid,SUM(CAST(col_acl AS SIGNED INTEGER)) as col_acl,col_appid,col_objectid,col_workspaceid FROM tempzz3 GROUP BY col_digitalid,col_appid,col_objectid,col_workspaceid;


CREATE VIEW adhocaclzz52 AS select * from itemacl where col_itemtypeid=15 and col_authorityid in(select col_authid from authority where col_typeid=3);
CREATE VIEW adhocaclzz62 AS select * from itemacl where col_itemtypeid=15 and col_authorityid='3';
CREATE VIEW adhocaclzz63 AS select * from authority where col_typeid=6;
CREATE VIEW adhocaclzz72 AS select * from itemacl where col_itemtypeid=15 and col_authorityid in(select col_authid from authority where col_typeid=5);
CREATE VIEW adhocaclzz73 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemacl b on b.col_authorityid=a.col_authid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid='-1' and b.col_itemtypeid=15;
CREATE VIEW adhocaclzz74 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemacl b on b.col_authorityid=a.col_parentid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid<>'-1' and b.col_itemtypeid=15;
CREATE view adhocaclzz as SELECT a.col_itemid,b.col_digitalid AS col_authid,a.col_acl FROM itemacl AS a, authority AS b WHERE a.col_authorityid=b.col_authid AND a.col_itemtypeid=15 AND b.col_typeid=2
UNION ALL
SELECT a.col_itemid, b.col_digitalid AS col_authid,a.col_acl FROM itemacl AS a, authority AS b  WHERE a.col_authorityid=b.col_parentid AND a.col_itemtypeid=15 AND b.col_typeid=2
UNION ALL
SELECT a.id AS col_itemid,'anonymous' AS col_authid,(CASE WHEN b.col_acl IS NULL THEN '000' ELSE b.col_acl END) AS col_acl FROM adhocproject AS a LEFT JOIN adhocaclzz52 as b ON a.id=b.col_itemid
UNION ALL
SELECT a.id AS col_itemid,a.creatornum AS col_authid,(CASE WHEN b.col_acl IS NULL THEN '111' ELSE b.col_acl END) AS col_acl FROM adhocproject AS a LEFT JOIN adhocaclzz62 as b ON a.id=b.col_itemid  LEFT JOIN adhocaclzz63 as c ON b.col_authorityid=c.col_authid
UNION ALL
SELECT a.id AS col_itemid, 'logon' AS col_authid,(CASE WHEN b.col_acl IS NULL THEN '000' ELSE b.col_acl END) AS col_acl FROM adhocproject AS a LEFT JOIN adhocaclzz72 as  b ON a.id=b.col_itemid
UNION ALL
SELECT oa.col_itemid,users.col_account AS col_authid,oa.col_acl FROM
adhocaclzz73 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id
UNION ALL
SELECT oa.col_itemid,users.col_account AS col_authid,oa.col_acl FROM
adhocaclzz74 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id;

CREATE VIEW adhocacl AS (SELECT col_itemid AS col_itemid,col_authid AS col_authid, SUM(CAST(SUBSTRING(col_acl,3,1) AS SIGNED INTEGER)) AS col_acl, SUM(CAST(SUBSTRING(col_acl,1,1) AS SIGNED INTEGER)) AS col_canmodify FROM adhocaclzz AS tab GROUP BY col_itemid,col_authid);


CREATE VIEW workbookaclzz52 AS select * from itemacl where col_itemtypeid=16 and col_authorityid in(select col_authid from authority where col_typeid=3);
CREATE VIEW workbookaclzz62 AS select * from itemacl where col_itemtypeid=16 and col_authorityid='3';
CREATE VIEW workbookaclzz63 AS select * from authority where col_typeid=6;
CREATE VIEW workbookaclzz72 AS select * from itemacl where col_itemtypeid=16 and col_authorityid in(select col_authid from authority where col_typeid=5);
CREATE VIEW workbookaclzz73 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemacl b on b.col_authorityid=a.col_authid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid='-1' and b.col_itemtypeid=16;
CREATE VIEW workbookaclzz74 AS select o1.*,a.*,b.* from orgnization o inner join authority a on  concat('0_', o.nodeid)  = a.col_digitalid inner join itemacl b on b.col_authorityid=a.col_parentid right join orgnization o1 on (o1.coding = o.coding or o1.coding like concat(o.coding, '-%'))  where a.col_typeid = 8 and a.col_parentid<>'-1' and b.col_itemtypeid=16;
CREATE view workbookaclzz as SELECT a.col_itemid,b.col_digitalid AS col_authid,a.col_acl FROM itemacl AS a, authority AS b WHERE a.col_authorityid=b.col_authid AND a.col_itemtypeid=16 AND b.col_typeid=2
UNION ALL
SELECT a.col_itemid, b.col_digitalid AS col_authid,a.col_acl FROM itemacl AS a, authority AS b  WHERE a.col_authorityid=b.col_parentid AND a.col_itemtypeid=16 AND b.col_typeid=2
UNION ALL
SELECT a.id AS col_itemid,'anonymous' AS col_authid,(CASE WHEN b.col_acl IS NULL THEN '0000' ELSE b.col_acl END) AS col_acl FROM workbook AS a LEFT JOIN workbookaclzz52 as b ON a.id=b.col_itemid
UNION ALL
SELECT a.id AS col_itemid,a.creatornum AS col_authid,(CASE WHEN b.col_acl IS NULL THEN '1111' ELSE b.col_acl END) AS col_acl FROM workbook AS a LEFT JOIN workbookaclzz62 as b ON a.id=b.col_itemid  LEFT JOIN workbookaclzz63 as c ON b.col_authorityid=c.col_authid
UNION ALL
SELECT a.id AS col_itemid, 'logon' AS col_authid,(CASE WHEN b.col_acl IS NULL THEN '0010' ELSE b.col_acl END) AS col_acl FROM workbook AS a LEFT JOIN workbookaclzz72 as  b ON a.id=b.col_itemid
UNION ALL
SELECT oa.col_itemid,users.col_account AS col_authid,oa.col_acl FROM
workbookaclzz73 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id
UNION ALL
SELECT oa.col_itemid,users.col_account AS col_authid,oa.col_acl FROM
workbookaclzz74 oa inner join orgusers ou on ou.orgnodeid=oa.nodeid inner join users on ou.userid=users.id;

CREATE VIEW workbookacl AS (SELECT col_itemid AS col_itemid,col_authid AS col_authid, SUM(CAST(SUBSTRING(col_acl,3,1) AS SIGNED INTEGER)) AS col_acl, SUM(CAST(SUBSTRING(col_acl,1,1) AS SIGNED INTEGER)) AS col_canmodify FROM workbookaclzz AS tab GROUP BY col_itemid,col_authid);

CREATE TABLE formrelation (
    spaceid VARCHAR(128) NOT NULL,
    mainformid VARCHAR(128) NOT NULL,
    relateformid VARCHAR(128) NOT NULL,
    relationtype VARCHAR(256) NOT NULL,
    fieldname VARCHAR(256) NOT NULL,
    PRIMARY KEY (mainformid,relateformid,relationtype,fieldname)
);

 
CREATE TABLE fulltextstatus (
    id VARCHAR(128)NOT NULL,
    col_formid_alias VARCHAR(128) NOT NULL,
    col_action TINYINT NOT NULL,
    PRIMARY KEY (id)
);

--ALTER TABLE fulltextstatus
--    ADD CONSTRAINT fulltextstatus_pkey PRIMARY KEY (id);

CREATE TABLE formserial (
    formid VARCHAR(128) NOT NULL,
    currentdate VARCHAR(10) NOT NULL,    
    daysn INT NOT NULL,
    daysndigits INT NOT NULL,
    monthsn INT NOT NULL,
    monthsndigits INT NOT NULL,
    yearsn INT NOT NULL,
    yearsndigits INT NOT NULL,
    allsn INT NOT NULL,
    allsndigits INT NOT NULL,
    textsndigits INT DEFAULT 6,
    PRIMARY KEY (formid)
);

--ALTER TABLE formserial
--    ADD CONSTRAINT formserial_pkey PRIMARY KEY (formid);
    
CREATE TABLE triggerfieldref (
    formid VARCHAR(128) NOT NULL,
    fieldname VARCHAR(256) NOT NULL,    
    triggerformid VARCHAR(128) NOT NULL,
    triggerlabel VARCHAR(256) NOT NULL,
    PRIMARY KEY (formid,fieldname,triggerformid,triggerlabel)
);

CREATE TABLE triggergroupref (
    formid VARCHAR(128) NOT NULL,
    groupid VARCHAR(256) NOT NULL,    
    triggerformid VARCHAR(128) NOT NULL,
    triggerlabel VARCHAR(256) NOT NULL,
    PRIMARY KEY (formid,groupid,triggerformid,triggerlabel)
);
CREATE TABLE triggerlog (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    formlabel VARCHAR(128) NOT NULL,
    spaceid VARCHAR(128) NOT NULL,
    triggerlabel VARCHAR(256) NOT NULL,    
    content VARCHAR(4000),
    created DATETIME NOT NULL,
    creatorname VARCHAR(200) NOT NULL,
    creatornum VARCHAR(200) NOT NULL    
);

CREATE TABLE oplog (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ip VARCHAR(128),
    optype VARCHAR(128) NOT NULL,
    formlabel VARCHAR(256),
    spacelabel VARCHAR(128), 
    content VARCHAR(512),
    created DATETIME NOT NULL,
    creatorname VARCHAR(200) NOT NULL,
    creatornum VARCHAR(200) NOT NULL
);

CREATE TABLE sessionhistory (
    sessionid VARCHAR(128) NOT NULL PRIMARY KEY,
    digitalid VARCHAR(256),
    nickname VARCHAR(256),
    created DATETIME NOT NULL,
    destoryed DATETIME,
    clientaddr VARCHAR(200),
    clientinfo VARCHAR(512)
);

CREATE TABLE backupfile (
    id VARCHAR(128) NOT NULL,
    updated DATETIME,
    created DATETIME,
    col_backuptimestamp DATETIME,
    col_downloaded TINYINT DEFAULT 0,
    col_desc VARCHAR(1024),
    col_file VARCHAR(1024),
    col_backupstatus VARCHAR(128),
    col_restorestatus VARCHAR(128) DEFAULT '0',
    col_lastlog VARCHAR(128),    
    col_filesize VARCHAR(128),
    col_version VARCHAR(128),
    creatornum VARCHAR(200),
    creatorname VARCHAR(200),
    updatornum VARCHAR(200),
    updatorname VARCHAR(200),
    col_copytopath  VARCHAR(254),
    col_isauto TINYINT DEFAULT 0,
    col_keep TINYINT DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE mailtmplist(
    col_mail_id VARCHAR(256) NOT NULL,
    col_mail_content VARCHAR(1024),
    col_mail_statue VARCHAR(128),
    col_mail_tmp VARCHAR(512),
    col_mail_simple VARCHAR(128),
    col_mail_type VARCHAR(128),
    col_mail_seq VARCHAR(128),
    PRIMARY KEY (col_mail_id)
);

DROP TABLE IF EXISTS  QRTZ_JOB_LISTENERS;
DROP TABLE IF EXISTS  QRTZ_TRIGGER_LISTENERS;
DROP TABLE IF EXISTS  QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS  QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS  QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS  QRTZ_LOCKS;
DROP TABLE IF EXISTS  QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS  QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS  QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS  QRTZ_TRIGGERS;
DROP TABLE IF EXISTS  QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS  QRTZ_CALENDARS;
CREATE TABLE QRTZ_JOB_DETAILS(
JOB_NAME VARCHAR(100) NOT NULL,
JOB_GROUP VARCHAR(100) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
JOB_CLASS_NAME VARCHAR(250) NOT NULL,
IS_DURABLE VARCHAR(1) NOT NULL,
IS_VOLATILE VARCHAR(1) NOT NULL,
IS_STATEFUL VARCHAR(1) NOT NULL,
REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (JOB_NAME,JOB_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_JOB_LISTENERS (
JOB_NAME VARCHAR(100) NOT NULL,
JOB_GROUP VARCHAR(100) NOT NULL,
JOB_LISTENER VARCHAR(100) NOT NULL,
PRIMARY KEY (JOB_NAME,JOB_GROUP,JOB_LISTENER),
INDEX (JOB_NAME, JOB_GROUP),
FOREIGN KEY (JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_TRIGGERS (
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
JOB_NAME VARCHAR(100) NOT NULL,
JOB_GROUP VARCHAR(100) NOT NULL,
IS_VOLATILE VARCHAR(1) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
NEXT_FIRE_TIME BIGINT(13) NULL,
PREV_FIRE_TIME BIGINT(13) NULL,
PRIORITY INTEGER NULL,
TRIGGER_STATE VARCHAR(16) NOT NULL,
TRIGGER_TYPE VARCHAR(8) NOT NULL,
START_TIME BIGINT(13) NOT NULL,
END_TIME BIGINT(13) NULL,
CALENDAR_NAME VARCHAR(200) NULL,
MISFIRE_INSTR SMALLINT(2) NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (JOB_NAME, JOB_GROUP),
FOREIGN KEY (JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
REPEAT_COUNT BIGINT(7) NOT NULL,
REPEAT_INTERVAL BIGINT(12) NOT NULL,
TIMES_TRIGGERED BIGINT(10) NOT NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_CRON_TRIGGERS (
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
CRON_EXPRESSION VARCHAR(120) NOT NULL,
TIME_ZONE_ID VARCHAR(80),
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
BLOB_DATA BLOB NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_TRIGGER_LISTENERS (
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
TRIGGER_LISTENER VARCHAR(100) NOT NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_LISTENER),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_CALENDARS (
CALENDAR_NAME VARCHAR(100) NOT NULL,
CALENDAR BLOB NOT NULL,
PRIMARY KEY (CALENDAR_NAME))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
TRIGGER_GROUP VARCHAR(100) NOT NULL,
PRIMARY KEY (TRIGGER_GROUP))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
ENTRY_ID VARCHAR(95) NOT NULL,
TRIGGER_NAME VARCHAR(100) NOT NULL,
TRIGGER_GROUP VARCHAR(100) NOT NULL,
IS_VOLATILE VARCHAR(1) NOT NULL,
INSTANCE_NAME VARCHAR(200) NOT NULL,
FIRED_TIME BIGINT(13) NOT NULL,
PRIORITY INTEGER NOT NULL,
STATE VARCHAR(16) NOT NULL,
JOB_NAME VARCHAR(100) NULL,
JOB_GROUP VARCHAR(100) NULL,
IS_STATEFUL VARCHAR(1) NULL,
REQUESTS_RECOVERY VARCHAR(1) NULL,
PRIMARY KEY (ENTRY_ID))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_SCHEDULER_STATE (
INSTANCE_NAME VARCHAR(100) NOT NULL,
LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
CHECKIN_INTERVAL BIGINT(13) NOT NULL,
PRIMARY KEY (INSTANCE_NAME))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE TABLE QRTZ_LOCKS (
LOCK_NAME VARCHAR(40) NOT NULL,
PRIMARY KEY (LOCK_NAME))
ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

INSERT INTO QRTZ_LOCKS values('TRIGGER_ACCESS');
INSERT INTO QRTZ_LOCKS values('JOB_ACCESS');
INSERT INTO QRTZ_LOCKS values('CALENDAR_ACCESS');
INSERT INTO QRTZ_LOCKS values('STATE_ACCESS');
INSERT INTO QRTZ_LOCKS values('MISFIRE_ACCESS');
commit; 

```