#!/usr/bin/env node

"use strict";

/*
  Reads all stdin into a string.
  This is intentionally simple: for JSON, buffering is fine.
*/
let readStdin = function () {
  return new Promise(function (resolve, reject) {
    let data = "";

    process.stdin.setEncoding("utf8");

    process.stdin.on("data", function (chunk) {
      data += chunk;
    });

    process.stdin.on("end", function () {
      resolve(data);
    });

    process.stdin.on("error", function (err) {
      reject(err);
    });
  });
};

/*
  Converts parsed JSON into Markdown.
  Adjust this function to match your schema.
*/
let toMarkdown = function (docs) {
  let lines = [];

  lines.push(`## ${docs.name.replace("-TelegramWebApp", "")}`);
  lines.push("");

  let modules = [];

  for (let item of docs.items) {
    switch (item.kind) {
      case "module":
        modules.push(item);
        break;
      default: {
        lines.push(`### ${item.id.replace("-TelegramWebApp", "")}`);
        lines.push("");

        for (let line of item.docstrings) {
          lines.push(line.trim());
        }

        lines.push("");
        lines.push("```rescript");
        lines.push(item.signature.trim());
        lines.push("```");
        lines.push("");
        break;
      }
    }
  }

  for (let item of modules) {
    lines.push(toMarkdown(item));
  }

  return lines.join("\n");
};

/*
  Main entry point.
*/
let main = function () {
  readStdin()
    .then(function (input) {
      let parsed;

      try {
        parsed = JSON.parse(input);
      } catch (err) {
        process.stderr.write("Invalid JSON\n");
        process.exit(1);
      }

      let markdown = toMarkdown(parsed);
      process.stdout.write(markdown + "\n");
    })
    .catch(function (err) {
      process.stderr.write(err.message + "\n");
      process.exit(1);
    });
};

main();
