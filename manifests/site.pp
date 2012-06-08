#node /^smtp\d+\$/ {
node default {
    include 'postfix'
}