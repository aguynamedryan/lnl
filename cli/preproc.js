module.exports = (markdown, options) => {
    result = require('child_process').execSync("bundle exec ruby processor.rb", { input: markdown });
    console.log(result.length)
    console.log(result);
    return result.toString();
}
