const fs = require('fs')

var data = {
    "serverip": process.env.HOST_IP,
    "serverport": (process.env.PROGRAM_TYPE == 'admin') ? "30000" : "40000",
    "dbUserId": "smartcity",
    "dbUserPwd": "nb1234",
    "dbHost": process.env.HOST_IP,
    "dbName": "security_" + process.env.PROGRAM_TYPE,
    "dbPort": "4000",
    "emailAccountId": "enter your e-mail for sending verification code",
    "emailAccountPwd": "account verification code",
    "token_type": "JWS",
    "program_type": (process.env.PROGRAM_TYPE == 'admin') ? "admin" : "general",
    "default_url": process.env.HOST_IP + ((process.env.PROGRAM_TYPE == 'admin') ? ":30001" : ":40001")
  }

fs.writeFileSync('./server_conf.json', JSON.stringify(data));