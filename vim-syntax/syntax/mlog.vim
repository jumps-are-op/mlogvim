" Vim syntax file
" Language:    Mindustry LOGic
" Maintainer:  Jumps Are Op <jumpsareop@gmail.com>
" Filenames:   *.mlog *.mlg *.minl

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'mlog'
endif

unlet! b:current_syntax

syn case match

" Start of the line
syn match mlogLineStart '^' nextgroup=@mlogCommands,mlogLabel,mlogComment skipwhite

" List of commands groups
syn cluster mlogCommands contains=@mlogInputOutput,@mlogBlockControl,@mlogOperations,@mlogFlowControl,@mlogUnitControl
syn cluster mlogInputOutput contains=mlogReadWrite,mlogDraw,mlogPrint
syn cluster mlogBlockControl contains=mlogDrawflushPrintflushGetlink,mlogControl,mlogRadar,mlogSensor
syn cluster mlogOperations contains=mlogSet,mlogOp,mlogLookupPackcolor
syn cluster mlogFlowControl contains=mlogWaitStopEnd,mlogJump
syn cluster mlogUnitControl contains=mlogUbind,mlogUcontrol,mlogUradar,mlogUlocate

" Read and Write commands
syn keyword mlogReadWrite read write contained

" Draw command. First argument should be:
" clear color col stroke line rect linkRect poly linePoly triangle image
syn keyword mlogDraw draw nextgroup=mlogDrawOperation skipwhite contained
syn keyword mlogDrawOperation clear color col stroke line rect linkRect poly linePoly triangle image contained

" Print command
syn keyword mlogPrint print contained

" Drawflush, Printflush, and GetLink commands
syn keyword mlogDrawflushPrintflushGetlink drawflush printflush getlink contained

" Control command. First argument should be:
" enables shoot shootp config color
syn keyword mlogControl control nextgroup=mlogControlCommand skipwhite contained
syn keyword mlogControlCommand enabled shoot shootp config color contained

" Radar command. (same as Uradar) First three arguments should be:
" any enemy ally player attacker flying boss ground
" The forth argument should be:
" distance health shield armor maxHealth
syn keyword mlogRadar radar nextgroup=mlogRadarUradarType1 skipwhite contained
syn keyword mlogRadarUradarType1 any enemy ally player attacker flying boss ground nextgroup=mlogRadarUradarType2 skipwhite contained
syn keyword mlogRadarUradarType2 any enemy ally player attacker flying boss ground nextgroup=mlogRadarUradarType3 skipwhite contained
syn keyword mlogRadarUradarType3 any enemy ally player attacker flying boss ground nextgroup=mlogRadarUradarSortby skipwhite contained
syn keyword mlogRadarUradarSortby distance health shield armor maxHealth contained

" Sensor command
syn keyword mlogSensor sensor contained

" Set command
syn keyword mlogSet set contained

" Op command. First argument should be:
" add sub mul div idiv mod pow equal notEqual land lessThan lessThanEq greaterThan greaterThanEq strictEqual shl shr or and xor not max min angle len noise abs log log10 floor ceil sqrt rand sin cos tan asin acos atan
syn keyword mlogOp op nextgroup=mlogOpOperation skipwhite contained
syn keyword mlogOpOperation add conceal cchar=+ contained
syn keyword mlogOpOperation sub conceal cchar=- contained
syn keyword mlogOpOperation mul conceal cchar=* contained
syn keyword mlogOpOperation div conceal cchar=/ contained
syn keyword mlogOpOperation idiv contained
syn keyword mlogOpOperation mod conceal cchar=% contained
syn keyword mlogOpOperation pow conceal cchar=^ contained
syn keyword mlogOpOperation equal conceal cchar== contained
syn keyword mlogOpOperation notEqual conceal cchar=! contained
syn keyword mlogOpOperation land contained
syn keyword mlogOpOperation lessThan conceal cchar=< contained
syn keyword mlogOpOperation lessThanEq conceal cchar=≤ contained
syn keyword mlogOpOperation greaterThan conceal cchar=> contained
syn keyword mlogOpOperation greaterThanEq conceal cchar=≥ contained
syn keyword mlogOpOperation strictEqual conceal cchar=≈ contained
syn keyword mlogOpOperation shl conceal cchar=« contained
syn keyword mlogOpOperation shr conceal cchar=» contained
syn keyword mlogOpOperation or conceal cchar=| contained
syn keyword mlogOpOperation and conceal cchar=& contained
syn keyword mlogOpOperation xor conceal cchar=ø contained
syn keyword mlogOpOperation not conceal cchar=¡ contained
syn keyword mlogOpOperation max min angle len noise abs log log10 contained
syn keyword mlogOpOperation floor conceal cchar=↑ contained
syn keyword mlogOpOperation ceil conceal cchar=↓ contained
syn keyword mlogOpOperation sqrt contained
syn keyword mlogOpOperation rand conceal cchar=¿ contained
syn keyword mlogOpOperation sin cos tan asin acos atan contained

" Lookup and Packcolor commands
syn keyword mlogLookupPackcolor lookup packcolor contained

" Wait, Stop, and End commands
syn keyword mlogWaitStopEnd wait stop end contained

" Jump command. (my favorite) First argument is an integer or a label.
" Second argument should be:
" equal notEqual lessThan lessThanEq greaterThan greaterThanEq strictEqual always
syn keyword mlogJump jump nextgroup=mlogJumpLocation,mlogJumpLabel skipwhite contained
syn match mlogJumpLocation '\<-\?[0-9]\+\>' nextgroup=mlogJumpCondition skipwhite contained
syn match mlogJumpLabel '\<\w\+\>' nextgroup=mlogJumpCondition skipwhite contained
syn keyword mlogJumpCondition equal conceal cchar== contained
syn keyword mlogJumpCondition notEqual conceal cchar=! contained
syn keyword mlogJumpCondition lessThan conceal cchar=< contained
syn keyword mlogJumpCondition lessThanEq conceal cchar=< contained
syn keyword mlogJumpCondition greaterThan conceal cchar=< contained
syn keyword mlogJumpCondition greaterThanEq conceal cchar=< contained
syn keyword mlogJumpCondition strictEqual conceal cchar=≈ contained
syn keyword mlogJumpCondition always conceal cchar=√ contained

" Ubind command
syn keyword mlogUbind ubind contained

" Ucontrol command. First argument should be:
" idle stop move approach boost target targetp itemDrop itemTake payDrop
" payTake payEnter mine flag build getBlock within unbind
syn keyword mlogUcontrol ucontrol nextgroup=mlogUcontrolCommand skipwhite contained
syn keyword mlogUcontrolCommand idle stop move approach boost target targetp itemDrop itemTake payDrop payTake payEnter mine flag build getBlock within unbind contained

" Uradar command. (same as Radar) First three arguments should be:
" any enemy ally player attacker flying boss ground
" The forth argument should be:
" distance health shield armor maxHealth
syn keyword mlogUradar uradar nextgroup=mlogRadarUradarType1 skipwhite contained

" Ulocate command. First argument should be:
" ore building spawn damaged
" If the first argument is building then the second argument should be:
" core storage generator turret factory repair battery reactor
syn keyword mlogUlocate ulocate nextgroup=mlogUlocateType skipwhite contained
syn keyword mlogUlocateType ore spawn damaged contained
syn keyword mlogUlocateType building nextgroup=mlogUlocateBuilding skipwhite contained
syn keyword mlogUlocateBuilding core storage generator turret factory repair battery reactor contained

" Numbers and constants
syn iskeyword @,48-57,192-255,_,-
syn match mlogNumber '\<[-+]\?\d*\(\.\d*\)\?\>'
syn match mlogNumber '\<0b[01]\+\>'
syn match mlogNumber '\<0x\x\+\>'
syn keyword mlogBool false true
" Is this the only constant?
syn keyword mlogConstant null

" Items
syn match mlogItem '\<@' nextgroup=mlogUnit,mlogResource,mlogSpecial,mlogThis
syn keyword mlogUnit dagger mace fortress scepter regin nova pulsar quasar vela corvus crawler atrax spiroct arkyid toxopid flare horizon zenith antumbra elipse mono poly mega quad oct risso minke bryde sei omura retusa oxynoe cyerce aegires navanax alpha beta gamma stell locus precept vanquish conquer merui cleroi anthicus tecta collaris elude avert obviate quell disrupt evoke incite emanate contained
syn keyword mlogResource copper lead metaglass graphite sand coal titanium thorium scrap silicon plastanium phase-fabric surge-alloy spore-pod blast-compound pyratite beryllium tungsten oxide carbide water slag oil cryofluid neoplasm arkycite ozone hydrogen nitrogen cyanogen contained
syn keyword mlogSpecial unit totalItems firstItem totalLiquids totalPower itemCapacity liquidCapacity powerCapacity powerNetStored powerNetCapacity powerNetIn powerNetOut ammo ammoCapacity health maxHleath heat efficiency progress timescale rotation x y shootX shootY size dead range shooting boosting mineX mineY mining speed team type flag controlled controller name payloadCount payloadType enabled config color contained
syn keyword mlogThis this thisx thisy contained

" Strings
syn region mlogString start='"' skip='\\"' end='"' oneline contains=mlogEscape,@mlogColors
syn match mlogEscape '\\.' contained
syn cluster mlogColors contains=mlogColorBlack,mlogColorRed,mlogColorGreen,mlogColorBrown,mlogColorBlue,mlogColorMagenta,mlogColorCyan,mlogColorGray,mlogColorWhite
syn region mlogColorBlack matchgroup=mlogDelimiter start='\[\(black\|BLACK\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorRed matchgroup=mlogDelimiter start='\[\(red\|RED\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorGreen matchgroup=mlogDelimiter start='\[\(green\|GREEN\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorBrown matchgroup=mlogDelimiter start='\[\(brown\|BROWN\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorBlue matchgroup=mlogDelimiter start='\[\(blue\|BLUE\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorMagenta matchgroup=mlogDelimiter start='\[\(magenta\|MAGENTA\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorCyan matchgroup=mlogDelimiter start='\[\(cyan\|CYAN\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorGray matchgroup=mlogDelimiter start='\[\(gray\|GRAY\)]' end='\[]' oneline concealends contains=@mlogColors contained
syn region mlogColorWhite matchgroup=mlogDelimiter start='\[\(white\|WHITE\)]' end='\[]' oneline concealends contains=@mlogColors contained

" Labels
syn match mlogLabel '^\w\+:' nextgroup=@mlogCommands,mlogComment skipwhite contained

" Comment
syn match mlogComment '#.*$' contains=mlogTodo contained

" Todo
syn keyword mlogTodo TODO FIXME NOTE TBD HACK XXX contained

hi mlogReadWrite ctermfg=Gray guifg=Gray
hi mlogDraw ctermfg=Gray guifg=Gray
hi mlogPrint ctermfg=Gray guifg=Gray

hi mlogDrawflushPrintflushGetlink ctermfg=Red guifg=Red
hi mlogControl ctermfg=Red guifg=Red
hi mlogRadar ctermfg=Red guifg=Red
hi mlogSensor ctermfg=Red guifg=Red

hi mlogSet ctermfg=Magenta guifg=Magenta
hi mlogOp ctermfg=Magenta guifg=Magenta
hi mlogLookupPackcolor ctermfg=Magenta guifg=Magenta

hi mlogWaitStopEnd ctermfg=Cyan guifg=Cyan
hi mlogJump ctermfg=Cyan guifg=Cyan

hi mlogUbind ctermfg=Yellow guifg=Yellow
hi mlogUcontrol ctermfg=Yellow guifg=Yellow
hi mlogUradar ctermfg=Yellow guifg=Yellow
hi mlogUlocate ctermfg=Yellow guifg=Yellow

hi def link mlogDrawOperation Keyword
hi def link mlogControlCommand Keyword
hi def link mlogRadarUradarType1 Keyword
hi def link mlogRadarUradarType2 mlogRadarUradarType1
hi def link mlogRadarUradarType3 mlogRadarUradarType2
hi def link mlogRadarUradarSortby Keyword
hi def link mlogOpOperation Keyword
hi def link mlogJumpLocation Constant
hi def link mlogJumpLabel Label
hi def link mlogJumpCondition Statement
hi def link mlogUcontrolCommand Keyword
hi def link mlogUlocateType Keyword
hi def link mlogUlocateBuilding Keyword

hi mlogColorBlack ctermfg=Black guifg=Black
hi mlogColorRed ctermfg=Red guifg=Red
hi mlogColorGreen ctermfg=Green guifg=Green
hi mlogColorBrown ctermfg=Brown guifg=Brown
hi mlogColorBlue ctermfg=Blue guifg=Blue
hi mlogColorMagenta ctermfg=Magenta guifg=Magenta
hi mlogColorCyan ctermfg=Cyan guifg=Cyan
hi mlogColorGray ctermfg=Gray guifg=Gray
hi mlogColorWhite ctermfg=White guifg=White

hi def link mlogString String
hi def link mlogEscape SpecialChar

hi def link mlogNumber Number
hi def link mlogBool Bool
hi def link mlogConstant Constant

hi def link mlogItem Type
hi def link mlogUnit mlogItem
hi def link mlogResource mlogItem
hi def link mlogSpecial mlogItem
hi def link mlogThis mlogItem

hi def link mlogLabel Label
hi def link mlogComment Comment
hi def link mlogTodo Todo

let b:current_syntax = "mlog"
