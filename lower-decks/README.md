# Lower Decks Specific Installation Instructions

## Global iTerm Settings
- Recommended Margins: 240 (sides) by 60 (top & bottom)
  - *This will correlate well to the 144 (columns) by 42 (rows) window size the profile has as its default.*

## Background Images

The images overlaid over the PADD devices require margins to be set in iTerm. Unfortunately, iTerm allows scaling of margin-x and margin-y, rather than supporting each side individually.

This results in several unfortunate side effects:

1. Scaling the iTerm window will cause margins to fail
  - *Margins are column-specific values, not percentages. So while margins of 240x60 look great with 144c by 42r, it will overlap severly with larger window sizes*
2. Any "full width" effects will overlay the PADD frame in a cosmetically unpleasant way. This includes the:
  - Current line highlights in vim (as a result, `set nocursorline` in `.vimrc` disables this functionality) 
  - vim-Airline's status bar (as a result, its plugin as been commented out in `.vimrc`)
