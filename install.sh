#!/bin/sh

LOGIN_SH=`echo $SHELL | sed -e 's/.*\///g'`
if [[ "$LOGIN_SH" != 'bash' ]] && [[ "$LOGIN_SH" != 'zsh' ]]; then
    echo 'Oops! Sorry, only bash and zsh are compatible with this command.'
    exit
fi

TARGET="$HOME/.${LOGIN_SH}rc"

cat cdf >> "$TARGET"
