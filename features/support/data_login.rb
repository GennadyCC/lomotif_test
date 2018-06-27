
$errors_collection = []

$incorrect_email = [
    # Local part
    # Local part > 64 chars
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@domain.com",
    "@domain.com", #Length of local part
    'abc"@domain.com',
    ".abc@domain.com", #dot not the first or last character
    "abc.@domain.com", #dot not the first or last character
    "abc..@domain.com", #not allowed without quoted
    '"ab"cd@domain.com', #quoted strings must be dot separated
    'ab"cd"@domain.com', #quoted strings must be dot separated
    'abc"@domain.com',
    'abc de@domain.com',
    'abc @domain.com',
    # '事件王@domain.com',
    # 'ÀÇÈ@domain.com',
    '" "@domain.com', #space between the quotes
    #@
    '@abc@domain.com',
    "abc@@domain.com",
    "abcdomain.com",
    # Domain part
    "abc@",
    "a@a",
    #domain part > 255
    "abc@aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "abc@domain..com",
    "abc@!#$%*/?|^{}`~&'+=com",
    'abc@ep"am.com',
    # "abc@ 事件|王.com",
    # "abc@ÀÇÈ.com",
    "abc@dom ain.com",
    "abc@domain.-com",
    "abc@domain.com-"
]

$correct_email = [
    "a@domain.com", #Length of local part
    "abcABC@domain.com", #Case sensitive letters
    "abc.ab.c@domain.com", #Dots
    '"ab".c@domain.com', #Quoted string dot separated
    "1234567890@domain.com", #Digits
    "abc_abc@domain.com", #Underscore
    "abc_a_bc@domain.com", #Underscore
    # Local part <= 64 chars
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@domain.com",
    "abc.abc@domain.com", #Allowed period position
    "!#$%*/?|^{}`~&'+-=@domain.com",
    "john.smith(comment)@domain.com",
    "(comment)john.smith@domain.com",
    '\"very\".unusual"@domain.domain.com',
    "example-indeed@domain-domain.com",
    '"ab"c"@domain.com',
    '_abc@domain.com',
    'abc_@domain.com',
    'ab__c@domain.com',
    "user@[2001:DB8::1]",
    "user@[192.168.2.1]",
    "user@localserver",
    '"very.(),:;<>[]\".VERY.\"very@\\ \"very\".unusual"@strange.example.com',
    "abc@domain.domain.com",
    "abc@domain123.com"
 ]

$correct_username = [
    "aaa", # (3) minimum
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", # (30) max 30
    "aaaAAA", # Uppercase
    "aaa123", # Alphanumeric
    "aaa.bbb", # dot
    "aaa_bbb", #underscore
    "_abc_", #dots
    ".abc.", #dots
    "....", #only dots
    "____", #only underscore
]

$incorrect_username = [
    "aa", # (2) less then minimum < 3
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", # (31) more then max >30
    "aaa bbb", #space
    "   abc   ", #spases before after
    "     ",
    '!#$%*/?|.;\,^{}`~&"+-=', #special char
    "abc+d",
]

$incorrect_password = [
    "         ", #spases
    "1234567", # (7) less ten minimum < 8
    "", #empty
]

$correct_password = [
    "12345678", # (8) minimum 8
    "1234AAAbbb",
    "aaaa bbbb",
    #255 char
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    '!#$%*/?|.;\,^{}`~&"+-=', #special char
    "........", #only dots
    "________", #only underscore
]