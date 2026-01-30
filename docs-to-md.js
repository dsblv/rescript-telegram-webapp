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

  lines.push(`# ${docs.name}`);
  lines.push("");

  let t;
  let values = [];
  let modules = [];
  let types = [];
  let events;
  let eventHandlers = [];

  for (let item of docs.items) {
    switch (item.kind) {
      case "module":
        if (item.name === "Events") {
          events = item;
        } else {
          modules.push(item);
        }
        break;
      case "type":
        if (item.name === "t") {
          t = item;
        } else {
          types.push(item);
        }
        break;
      default:
        if (
          (item.name.startsWith("on") &&
            item.name[2].toUpperCase() === item.name[2]) ||
          (item.name.startsWith("off") &&
            item.name[3].toUpperCase() === item.name[3])
        ) {
          eventHandlers.push(item);
        } else {
          values.push(item);
        }
        break;
    }
  }

  if (t) {
    lines.push(`## ${t.id}`);
    lines.push("");
    lines.push("```rescript");
    lines.push(t.signature.trim());
    lines.push("```");
    lines.push("");
  }

  lines.push("");
  lines.push("## Methods");
  lines.push("");

  for (let value of values) {
    lines.push(`### ${value.id}`);
    lines.push("");

    for (let line of value.docstrings) {
      lines.push(line.trim());
    }

    // if (value.name !== "onEvent" && value.name !== "offEvent") {
    lines.push("");
    lines.push("```rescript");
    lines.push(value.signature.trim());
    lines.push("```");
    // }

    lines.push("");
  }

  lines.push("");
  lines.push("## Types");
  lines.push("");

  for (let type of types) {
    lines.push(`### ${type.id}`);
    lines.push("");
    lines.push("```rescript");
    lines.push(type.signature.trim());
    lines.push("```");
    lines.push("");
  }

  lines.push("");
  lines.push("## Modules");
  lines.push("");

  for (let module of modules) {
    lines.push(`### ${module.id}`);
    lines.push("");

    for (let line of module.docstrings) {
      lines.push(line.trim());
    }

    let t;
    let values = [];
    // let modules = [];
    let types = [];

    for (let item of module.items) {
      switch (item.kind) {
        case "module":
          // modules.push(item);
          break;
        case "type":
          if (item.name === "t") {
            t = item;
          } else {
            types.push(item);
          }
          break;
        default:
          values.push(item);
          break;
      }
    }

    if (t) {
      lines.push(`#### ${t.id}`);
      lines.push("");
      lines.push("```rescript");
      lines.push(t.signature.trim());
      lines.push("```");
      lines.push("");
    }

    for (let value of values) {
      lines.push(`#### ${value.id}`);
      lines.push("");

      for (let line of value.docstrings) {
        lines.push(line.trim());
      }

      lines.push("");
      lines.push("```rescript");
      lines.push(value.signature.trim());
      lines.push("```");
      lines.push("");
    }

    for (let type of types) {
      lines.push(`#### ${type.id}`);
      lines.push("");

      for (let line of type.docstrings) {
        lines.push(line.trim());
      }

      lines.push("");

      lines.push("```rescript");
      lines.push(type.signature.trim());
      lines.push("```");
      lines.push("");
    }

    lines.push("");
  }

  {
    // custom event definitions
    let module = events;
    lines.push(`## Events`);
    lines.push("");

    for (let line of module.docstrings) {
      lines.push(line.trim());
    }

    // let values = [];

    let types = [];

    for (let item of module.items) {
      switch (item.kind) {
        case "module":
          // modules.push(item);
          break;
        case "type":
          if (item.name === "t") {
            t = item;
          } else {
            types.push(item);
          }
          break;
        default:
          // values.push(item);
          break;
      }
    }

    for (let value of eventHandlers) {
      lines.push(`### ${value.id}`);
      lines.push("");

      for (let line of value.docstrings) {
        lines.push(line.trim());
      }

      lines.push("");
      lines.push("```rescript");
      lines.push(value.signature.trim());
      lines.push("```");
      lines.push("");
    }

    for (let type of types) {
      lines.push(`### ${type.id}`);
      lines.push("");

      for (let line of type.docstrings) {
        lines.push(line.trim());
      }

      lines.push("");

      lines.push("```rescript");
      lines.push(type.signature.trim());
      lines.push("```");
      lines.push("");
    }
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
