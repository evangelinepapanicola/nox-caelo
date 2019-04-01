const path = require("path");
const fs = require("fs");
const child_process = require("child_process");

const fileList = (dir, extensions = []) =>
  fs.readdirSync(dir).reduce((files, file) => {
    if (fs.statSync(path.join(dir, file)).isDirectory()) {
      return files.concat(fileList(path.join(dir, file), extensions));
    } else if (
      !extensions.length ||
      extensions.indexOf(file.split(".").pop()) > -1
    ) {
      return files.concat(path.join(dir, file));
    } else {
      return files;
    }
  }, []);

const inklecate = settings => {
  settings = Object.assign(
    {},
    {
      contentDirectory: "public/ink",
      inklecateDirectory: "tasks/inklecate/bin/",
      logFilename: "logs/inklecate.log",
      platform: {
        win32: "inklecate.exe",
        darwin: "inklecate_mac",
        freebsd: "inklecate.exe",
        linux: "inklecate.exe",
        sunos: "inklecate.exe"
      }
    },
    settings
  );

  const executable = path.join(
    settings.inklecateDirectory,
    settings.platform[process.platform]
  );

  //fileList("./public", ["ink"]).forEach(fileLocation => 
  const fileLocation = "src/ink/player.ink"
    console.log(`${executable} ${fileLocation}`);
    child_process.exec(
      `${executable} ${fileLocation}`,
      (error, stdout, stderr) => {
        // console.log( "=========================================" )
        // console.log( "error" )
        // console.log( error )
        // console.log( "=========================================" )
        // console.log( "stdout" )
        // console.log( stdout )
        // console.log( "=========================================" )
        // console.log( "stderr" )
        // console.log( stderr )

        fs.rename(
          `${fileLocation}.json`,
          "public/story.json",
          function(err) {
            if (err) console.log("ERROR: " + err);
          }
        );
      }
    );
  //});
};

inklecate();
