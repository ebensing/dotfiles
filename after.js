

var json = JSON.parse(process.argv[1]);

json["after"] = "happened";

console.log(JSON.stringify(json));
