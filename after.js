

var json = JOSN.parse(process.argv[1]);

json["after"] = "happened";

console.log(JSON.stringify(json));
