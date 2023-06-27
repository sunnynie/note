# 使用以及安装
```javascript
var Interfake = require('interfake');
var interfake = new Interfake();
interfake.get('/my-first-interfake').status(200).body({ result: 'true'});
interfake.listen(30002);
```

在目录中运行 npm install interfake --save  进项interfake 安装

如需要热运行可以运行  npm install -g  nodemon 

启动服务: node main.js