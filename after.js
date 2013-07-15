

var json = JSON.parse(process.argv[2]);

json["after"] = "happened";

console.log(JSON.stringify(json));
