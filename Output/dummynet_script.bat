@echo on
@set CYGWIN=nodosfilewarning
@ipfw -q flush
@ipfw -q pipe flush
ipfw add pipe 3 ip from any to any

ipfw pipe 3 config bw 3575Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3576Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3780Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2785Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2875Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3895Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3909Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3866Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3820Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3833Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3911Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3891Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3787Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3890Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3915Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3820Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3870Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3886Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3849Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3816Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3886Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3868Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3874Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3923Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3786Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3819Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3894Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3532Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3041Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2728Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2756Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3035Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3095Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3142Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3269Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3511Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3768Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3846Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3724Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3824Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3919Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3843Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3872Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3806Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3834Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3904Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3888Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3865Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3895Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3803Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3708Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3942Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3997Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3874Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3840Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3846Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3868Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3829Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3856Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3825Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3952Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3898Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3772Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3559Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3009Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2843Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2884Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3025Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2747Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2281Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2439Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2548Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2398Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2445Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2210Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2113Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2079Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1739Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2093Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2682Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2947Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2943Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2558Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2983Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3116Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2620Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2119Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1520Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1072Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 702Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 552Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 492Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 686Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 438Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 195Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 306Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 217Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 214Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 413Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 518Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1311Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1895Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1485Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1346Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1401Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1016Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 903Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1026Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1143Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1091Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 904Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 910Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 869Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1009Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 968Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 828Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 968Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1055Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1114Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1155Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1201Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1220Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 823Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 484Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 426Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 548Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 787Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 731Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 609Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 566Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 542Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 490Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 496Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 759Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 992Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 884Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 656Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 653Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 711Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 664Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 682Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 752Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 782Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 775Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 857Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 881Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 805Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 653Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 501Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 518Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 483Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 455Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 513Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 572Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 647Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 530Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 402Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 619Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 928Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1267Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1483Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1575Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1437Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1392Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1729Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1980Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2020Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2079Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2797Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3169Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2570Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2657Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2802Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2605Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2642Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2556Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2397Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1869Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1978Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2393Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2442Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2756Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2875Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2946Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3101Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3177Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3273Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2957Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2616Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2647Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2691Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2736Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2831Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2989Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3106Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3294Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3434Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2685Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2306Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2743Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2825Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2562Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2317Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1933Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1570Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1482Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1120Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1354Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2015Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2161Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2149Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2144Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2109Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2109Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2125Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2115Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2093Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1980Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1791Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1704Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1747Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1799Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1868Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1915Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1921Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1940Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1858Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1862Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1862Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1700Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1548Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1525Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1643Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1450Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1157Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 974Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 618Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 408Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 560Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 584Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 373Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 371Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 448Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 502Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 512Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 460Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 350Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 308Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 332Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 314Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 267Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 291Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 612Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 787Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 700Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 641Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 594Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 291Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 534Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 931Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 928Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1184Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1032Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 823Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 840Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 723Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 619Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 724Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 887Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 857Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 833Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 784Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 656Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 367Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 499Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 610Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 485Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 800Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1197Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1535Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1954Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2281Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2340Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1891Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1430Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1623Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1908Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2275Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2713Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2076Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1202Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1481Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2157Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2095Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1717Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2175Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2251Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2281Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2508Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1890Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2257Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2929Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2626Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2525Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2457Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2173Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2058Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2157Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2208Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2337Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2877Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3369Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3165Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3259Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3809Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3951Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3690Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3796Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2958Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1502Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 954Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 851Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1278Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2323Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3345Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3590Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3225Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2649Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2242Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1705Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1600Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1880Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2258Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2916Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2456Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1155Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 741Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1438Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2296Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2504Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2364Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2228Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2341Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2325Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2010Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1780Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1598Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1224Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1027Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1211Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1036Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 442Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1130Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2318Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3092Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 4230Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 4058Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3142Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3926Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5035Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5189Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5363Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5121Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5140Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5596Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 5359Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 4914Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 4649Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3588Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1889Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 767Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 191Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 23Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 589Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 876Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 648Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 804Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1051Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1432Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1324Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1102Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 624Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 504Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1151Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1804Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2610Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3208Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3015Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2199Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1958Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1949Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1630Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 905Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 252Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 712Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1133Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1179Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1689Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1819Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1634Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1749Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2109Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2522Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 2211Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1797Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1683Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1097Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 423Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 274Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 327Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 1805Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3545Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3617Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3570Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3686Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3729Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3722Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3511Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3613Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

ipfw pipe 3 config bw 3866Kbit/s delay 15ms
ping 1.1.1.1 -n 1 -w 1000 >NUL

