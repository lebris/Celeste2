pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- celeste2
-- exok games

#include main.lua
#include gamestate.lua
#include input.lua
#include object.lua
#include objects.lua
#include player.lua
#include px9_decomp.lua

__gfx__
00000000626666660011110001111110011111000011110000000000000000000000000000000000000000006666666600000000422222220000000000000000
00000000626666660111111011144411111111100111111000000000000000000000000000000000000000000311113000000000422222220800000000000080
00700700626666661114441111474471144441101174471100000000000000000000000000000000000000000031130000000000422222220080000000000800
0007700022222222114744710144444017447410714444170000000000000000000000000000000000000077000bb00000000000422222220008000000008000
00077000666662660144444000aaaa000444441007aaaa700eeeeeeeeee00000000000000000000000000777000bb00066666666200000000000808008080000
007007006666626600aaaa000022220000aaaa7000222200e111ee11e111000000770000000000000007777700b11b0000033000400000000000088008800000
000000006666626600222200070000700022220000222200e1ccee7ce7cc00000777770000000000007777770b1111b0000bb000400000000000888008880000
000000002222222200700700000000000000700007700770e1cceeccee77c0007777777000000000777777776666666666666666400000000000000000000000
57777777777777777777777599999999000600000b300b00e1cceeeceeccc0000000000000000000000000000000000000000000000000000000000000022000
77777777777777777777777791111119006660000033b000eeeeeeeeeeee22220000000000000000000000000000000000000000000000000000000000022000
77777777777777777777777791411419000500000288882088888888888897970000000000000000000000000000000000000000000000000000000000024000
77777771177777711777777791441119000500000898888088888888888897970000000000000000000000000000000000000000000000000000000000044000
777777122177771221777777911441190044400008888980eeeeeeeeeeee11110000000000000000077000000000000000000000000000000000000000044000
71777122221111222217771791414419009990000888888020002220002222220000000000000000777700000000000000000000000000000000000000044000
72111222222222222221112791111119004440000289882001610201615551000000000000000000777777000000000000000000000000000000000000044000
72222222222222222222222799999999009990000028820001110001110111000000000000000000777777700000000000000000000000000000000000042000
72222222222222222222222757777775000000000000066622222222222222225555555555555555555555555777777777777777777777750008800056666650
77222222222222222222227777777777000000000007777722222221122222225555555555555550055555557771111177711111777111170081180066666661
77222222222222222222227777777777000000000000066622222211112222225555555555555500005555557777111117771111177711170811118066666661
77722222222222222222277777177177007000700000000022222111111222225555555555555000000555557117711111177111111771178117711866666661
777222222222222222222777772112770070007000000666222211111111222255555555555500000000555571ddd7ddddddd7ddddddd7178117711856666651
772222222222222222222277772222770676067600077777222111111111122255555555555000000000055571dddddddddddddddddddd170811118055555551
77222222222222222222227777722777067606760000066622111111111111225555555555000000000000557111111111111111111111170081180015555551
72222222222222222222222757777775067606760000000021111111111111125555555550000000000000055777777777777777777777750008800001111110
722222222222222222222227577777777777777777777775211111111111111211111111500000000000000557777775777ddd17777ddd170077770056666650
7222222222222222222222277777777777777777777777772211111111111122111111115500000000000055777711177777dd177777dd170777677066666661
72222722222222222222222777777777777777777777777722211111111112221111111155500000000005557117711771177d1771177d177777777766666661
722222222222222222222227777777711777777117777777222211111111222211111111555500000000555571111717711dd717711dd7177777767766666661
7722222222222222222722777777771221777712217777772222211111122222111111115555500000055555711ddd17711ddd17711ddd177767777756666651
7772222222777722222227777177712222111122221777172222221111222222111111115555550000555555711ddd17711ddd17711ddd177777777755555551
7777722227777772222777777211122222222222222111272222222112222222111111115555555005555555711ddd17711ddd17711111170777677015555551
5777777777777777777777755777777777777777777777752222222222222222111111115555555555555555711ddd17711ddd17577777750077770001111110
00000000047744444944977706660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777794999944997775550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000077777774991194491777ddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000777779949911199991774755000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000
000077799949911222222227294900000000000000000000000000000000000000000000000000000000000000000000000a0a00000000000000000000000000
00079999949912222222222722149000000000000000000000000000000000000000000000000000000000000000000000a000a0000000000000000000000000
0079799949912227777222272221990000000000000000000000000000000000000000000000000000000000000000000a000009000000000000000000000000
099979949912227777777222222211900000000000000000000000000000000000000000000000000000000000000000a0000009000000000000000000000000
99999944111111117111111111111119000000000000000000000000000000000000000000000000000000000000000900000009000a00000000000000000000
0441294912222222222222222222221400000000000000000000000000000000000000000000000000000000000000a00000000090a0a0000000000000000000
094119491111111111111111111111140000000000000000000000000000000000000000000000000000000000000900000000000a000a000000000000000000
09412949122222222222222222222294000000000000000000000000000000000000000000000000000000000000090000000000000000000000000000000000
0941294912222222222222222222229400000000000000000000000000000000000000000eeeee00eeeeee00ee009000eeeeee000eeeee00eeeeee00eeeeee00
094129491224444222222222244442940000000000000000000000000000000000000000eeeeeee0eeeeeee0ee090000eeeeeee0eeeeeee0eeeeeee0eeeeeee0
094129491291411222222222914112940000000000000000000000000000000000000000ee000ee0ee000000ee000000ee000000ee00000000ee0000ee000000
09412949129141122444422291411294000000000000000000000000000000000000000022000000222200002200000022220000222222200022000022220000
09412949129141122111142291411294000000000000000000000000000000000000000022000220220000002200002022000000000000200022000022000000
09412949129141122122242291411294000000000000000000000000000000000000000022222220222222002222222022222200222222200022000022222200
09412949129141122122292291411294000000000000000000000000000000000000000002222200222222202222222022222220022222000022000022222220
09412949129141122122242291411294000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09412949129444422122242294444294000000000000000000000000000000000000000000000000000009000000000000000000000000000000900000000000
09412949121111122122242211111294000000000000000000000000000000000000000000000000000090000000000000666660000000000000090000000000
09412949122277772122242222222294000000000000000000000000000000000000000000000000009900000000000006666666000000000000009000000000
09412949122777777772242227772294000000000000000000000000000000000000000000000000090000000000000000000066000000000000009000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000dd00006666000dd00000000009000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000dd000dddd0000dd00000000009009000000
0000000000000000000000000000000000000000000000000000000000000000000000000000009000000000000000000dd00000000000000000002020900000
0000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000ddddddd000000000000000200090000
0000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000ddddddd000000000000000000020000
00000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000002000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000020
fff73f7abef790051a041219c061b412479384442a106058348645a350785c36f91e08b3dbe769b8065ca69dc4f9ffa2be27c1fff7f674b3fcfff1cc5f527d9f
fb8cbeffddbf9f1678e39d8cf7df3e79f72ffbedef9ef3e9f17f7cf1ffcffb3f3cf0fb409342f833f392ff3f5ec7ff8938d3fcf4275f93efafdefbf17bc1efff
e46e78ef9fbefbf37cd1ef7597dff7254ecfefefdff70ff7875dffa63e79979cdbc17cff22174819919f1e78727cf02deffac58b3f83a3f0b7ef9c344e1fdb06
93cff222b6eff1ff39c3b7e12557d16ffdeff2ffb9439f78c6eff31101681c089ff15296a78ff3dffa69ff71ed36de69c298d3ff3bffbdffdef77fd2842dcfff
e7e4ff78dee98f2eff891e0e90f078feb326b046cefaf5e798f7ad6b5ef0f8702554edf9d2dc27a9f3e7f9729eff6ef782f2bc1a98783294c64c37834e858faf
7c6bfd6d7c7dd2d078954e3077ce51ebf630f75260ff79ffbc3ff70cfe0540400de85651d0478ba43731182a3f3542aeddb2be1e9e57527dae393fad1fed7e3f
509bb2b3e4f30748ab07def87e79bc7cb6ef1f487297d1f35d929f1e8172f4f72ea585f7a7f99cf59f32f7df172f49dee19acb36991935610f88666714e42bfd
e9030ff50d5efbe7214f0f5445ee31078f1ffcf3ffcc2fb6c54e81e919e622709fe87424f707c79f6fc7ff2c1af3bc4e0197627193c1eb57fbd1ec21d46c53e8
c3906207d68ef4f3f1ba4c170f6efc32ef4efef2bd3997c17cefb341c5b3ef274b325e1f4fa058c1c59924294ed3c11bc4c14878723e1f3ff85e09f12a2bdc1e
1fbefd7c7f8c3bde3e112cfb84e7217f80e06f86812190809c8d6ba14ef63950bcfd4ad76f3408c5c5c7e7fbc14a997274f7197c90195e1769ba2c1ef709d3e8
32d4dff0670f074fecff0276642b346bcf6f7d1e59c5ddfbbf3fa4eac61766fb6d3f5e7a10ffffff0fbe3ff72024b1f02e45541caecb37d5215e21621a6013dd
132ab65eb972169ffb1772bf4e6a4cefffb1f346bb61d9362ffff93c77c1fc17d7bc9efff3f29c37cafab6e2169b1efffc689f12bf3e9f5ea421764efffd688c
c52ff87ce0ef79b7e79be717ef4376321bf98c29ecf478c56f70196e79cf49ee12cbefa73b53fb5b62f7deac62dd21e88be96c99ebffd119429d29de9d21968c
be9fd28763297afded569481f47f784cc27b326f80293e1e794942639b09546b8029da9a854294e859a72c3911b4e79c067ad6a45298f11dad3e95ff3f90bf8f
4c4d84294e51b461584aa58fc52b54ec1e1242f7ef7bcde411ebc27607cfaff68af9f0e8e5f3df39a5a9ec2612cd9fbd39ae80e479c7e8c46b4e70e8dfafb72b
f3ff70ff70dff509d2f76614cebcbe80679d2f341f5629ffe57df0bf1eff17c9b195f73f888c794ef296cdbdfaff4e80f2ff0b42750c5be369ff10e163111919
b1b9e995243f78f12ef72bcfefbc31e127cc9dc3be3d479c01ba4e0ff305390b8f94efa429f3293ff989cfee8ac5e2bf5df5b4c35b333148842fb4ec83e3fb40
bfbf9fdf8c22ffe5cf59c47741dd05bf77fef2976fc122753616dd1dc9e8e29cc55000fc9e528bc24e0ff79cff3cfd7cff5e7af9f7ec317c8ba98e3cf43b44e9
d3d72129f9cea36f7c1f8ef0170ffb932fcff622f7def8d32f872e9dc7e88adff6e8d2bffdcf5bbeff0f46fff9b710ff094ff9f10e7a369f2ff9fdf70e719aef
726f74ef732f3b01ef0888f3f71e8c3eadefb8cff8c393fcc4d19aadf0936f77ef71ef4abfef83abf7ff735b5df3df1ff71ff78ff18cf99b6ce8cbff843fb8f3
6224093d31e4bf93b2f3d197e794ef70f3ff41fc8b68bcff40ff07bf7f71d0ffffff0ff797ef788fd12f67cd3b23a9309e4a24dea229218a73b32a920bb19f5e
86657a0b4d1cc47a2394bde6b55c6270793e8c24e9c3e03eafff31e0e064367c1c1fc8ba94e1adfec7fed3709f12f5ef8102def19f569c6ff4ae9cf3ff42f3d6
9fb69ee9feb8422160c2a4198ac69cf6eacb77cf29cbb32ff9cefa7337ef494eddf4f36e0eaef9de37d1de5df5392c9803cef4b679d51903fb8b80ffaaf97166
7eefe48fbd1fb7ef70fbcf8f5ff70ff78ff1838b699f693e84f004e179c940257c294f8efcf7df2f38cfcd9f37ef702486ef712e2994e7cff783e79f7edf167c
5fcb7cff4cf1edc9937f7c1a61b88442f71efc975734e71c6a872b8ef3fbc9fcfde7c32edce7de3f42f94f709b375ef29c3e9ef5e7cbac1275e70ff467d99ffb
c342e02fcc54b4ed0569b279ffdc6ffdd7c783eff1f36e8ce933fdf4fff8ff744ce83a259421bcc1195a94e71ff124ce80c2ef1cb19944e5f7d2f3ff57f7286e
1e7a0321972b4d299701bf1affd9fff9742ffd2d8c669ff195ef1f781e6f39cd0bc1e1f3d496216ff7a5ccffacb2fb40d76fdeddd7adcffba5bacf59d69b595b
e7849a88d16a7c135f79cf8176ff293fccf8747f7f93c13ff78b9b02fa7094aef739c5e8ebfb075e7077274394af32a4549347171e942ebffe7cffc3ffcb97a9
ff7c193cf2e8ff7c37c319ff9deacfe983237c5ff71d6e8722f78f7ce87c31b30956d4f5f7139ce79fcd976748f1df31e8c279f9f78cf7f01bfbe7a537cf1742
0f8cfc6758648c4e09f79f8f3206d4ec58acfb9e179cf4e9f18fde8cf6bf38dff062bf9efbb39d5f78c3b325cff1222b58f5432ff31193ffe50ef07dff3cff38
3cd67d4eb4ed0e73b098261ef88ffb1e98f7602588c32f1169fff06ffb87ca7cf496eb7e9884c2bc659f12f3cf47094580928ad52166c327d10dc37d109fbb27
872ff797863f6f09d111fc17af9cf0ea7fcf92d7a71278df040422f181f74c361603cf042398ffbc7a2947946e71e50d4ca229cf6cf1c11e0f398f11f938fff4
9f2390f34e83c71942b8c29cf1ff7bdeadb84e7843cfc63ef493274de7ef9f8446a71868e370d7a2ff0cf0eff645c5cf270f397e0ef36ccb6e7095e87e7ccfe4
8f12938b1161e41c19c119f182f8c5cf1ec4ec852923ff0e37259f3274e4743b78df29cf4c521e5778fd8f85ea7263e0678f1ff7474e23cf2996ffbf50bff2f7
c17cf11374f6f3932f9b2f79ac96f09c12c8c17dbfef05b3ab76fd3ef1a934327484efa8c9f427cffd247ffbbfffdfff4df9fb5fcebeff3fbcf69f1cf3fcbed5
5a2945eff09ee8cff60bdef739cf0df1ff75f774ef1f547c872bbb190f1bd8f7df432437b65ef763110b72bdddbe7a8ee99f921bc9b4e23eff479f9ad9c8f01f
3fa9ffddffca78d87cff60f8d1e5c8f72f34f78c7f919b2f84e74fbce7bfcb9806dc93f36099f94e8cb2e7a4ebb395ef1eac561f019ffcf3cb68fb27e3bc5fdc
ff4e76ff5cbf8c2fb8ff388ddfb5ecc74ea3ce8ffaff71e6fbd94d57b77a8ff3cef84e4741b5cfd0ffffff0f3d3ff7805408797959d6dd71d9a482a49403690e
62fa40dbe54efff966e75b8efff3dd15f3769fff7ad7eafcf90dfffb393dffa9fff7fed76e6f36e70fff71339df1fbcf3b1f3df9ebff5bfb0ffbbd7fbd5bdf7e
8f39ff181e7def27ff832f34e2fb7ef43f3dff325fb08fb21fe1fcf0ae6f3cf1bf1ebcb8cf7293dde0cf3cf3cf29bcf1ccf2fff37f8ffd90eff28086e757b0ef
66bf7efdcff327833f3b62e7edef5cf0529bdff485ff6fb3072efffb0e8fc21e7cf7cf23ef3f7e6f32fff79233f3cf3948ff1cfc19fff7442898f5cf927de7a0
ffffe2f6ef2e7420ffffff0f3d3f330cb3bcac6bee4243f291945241ac0a807c3ef81e784cfffbed6effff31ad3e1fffffffaf9bcff52cfff1dccf098fffbdeb
fd67eb9fff78ee2ff70488f1e3efff49f34e79cff36ffcf4b52d7c071ffff5cf5cf6ff39d5ffdf8bcf9fbe3842fff7967e59ffb4ebbef8c2fff792afb5e70f30
6ff6cfffdd4cf7973fffffb098fff380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0003000000000101010101000000000083838300000001010101010000000001838383830800838381818107070700038383838383838383818181070707000001010101000000000000000000000000010101010000000000000000000000000101010100000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
01030306245342452024510245102451024510245002450030500305002b5002b5002950029500245002450030500305002b5002b5002950029500245002450030500305002b5002b50029500295002450024500
0104020317770187711877018770154001540015400164001740018400194001a4001b4001d4001e4001f4001f4001f4001c40018400164000000000000000000000000000000000000000000000000000000000
010b05080017000160001500014000132001220012200122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010605081817300154001400013000122001220012200122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010300002f6702f6302f6202f6202f6102f6102f6102f6102f6152f61500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400021837020370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01040002183701f370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010200000c6400c070110611305130634306250c06000051244502b4513a4503a4502b0241f021320213202329040290502a0612a0602c0612c0600c65400000186631e0601f0511f0501e0411d0311c02100000
010700000c05318653246440061200612000000000000000301532b1402e13035130241342b1242e1143511500673186230c621006150065324620186212461524340246433233131321303112b3110000000000
010b000030830308252b8202b8152982029815248202481530820308152b8202b8152982029815248202481530820308152b8102b8152981029815248102481530820308152b8102b81529810298152481024815
010b0000080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025080400802513045130251a0451a0251f0451f025
010b00000c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f0250c0400c02513045130251a0451a0251f0451f025
010b00000a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f0250a0400a02513045130251a0451a0251f0451f025
010b0000060400602513045130251a0451a0251f0451f025060400602513045130251a0451a0251f0451f025070400702513045130251a0451a0251f0451f025070400702513045130251a0451a0251f0451f025
01040000306532405330653306103061018615376003760000654000003065424800248002480000000000003c6240c6412466113075260741a0610e0510206425041190310d04424031180210c024180110c011
010b0000247402473500000000002b7402b73500000000002b7402b73500000000002b7402b73500000240002b9402b7302b7222b7122c740007002e7402e7302e7202e71530750000002e7402e7352c7402c735
010b00002b9402b7302b7302b7222b7122b7122c7402b740297402973029730297202971029712297120000027740277302773027720277122771229740277402674026730267202671226712267120000000000
010c000013033006001f033210313c02100654070140c0213e0143d0213c0213a0213b0213a0213901138011370113601135011340113301132011300111f02100614006110c62118631246310c6210061100615
010b0000247402473024722247152b7402b73500000000002b7402b73500000000002b7402b73500000000002b7402b7302b7222b7152c740000002e9402e7302e7422e73530740307352e7402e7352c7402c735
010b0000090400902513040130251a0401a0251f0401f0250804008025120401202519040190251e0401e0250704007025110401102518040180251d0401d0250604006025140401402518040180251d0401d025
010b00002b9402b7302b7302b7222b7122b7122c7402b7302974029730297302972229712297122b7402973027740277302772027722277122771229740277302674026730267302672226712267122671026710
010b000014b5014a2014a2014a5014a2014a2014a5014a2014a5014a2014a2014a5014a2014a2014b5020a2014b5014a2014a2014a5014a2014a2014a5014a2014a5014a2014a2014a5014a2014a2016a5016a20
010b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018c0018c000000024a3018a21
010b000018b5018a2018a2018a5018a2018a2018a5018a2018a5018a2018a2018a5018a2018a2018b5024a2018b5018a2018a2018a5018a2018a2018a5018a2018a5018a2018a2018a5018a2018a201aa5018a20
010b000016b5016a2016a2016a5016a2016a2016a5016a2016a5016a2016a2016a5016a2016a2016b5022a2016b5016a2016a2016a5016a2016a2016a5016a2016a5016a2016a2016a5016a2016a2018a5016a20
010b000012b5012a2012a2012a5012a2012a2012a5012a2012b5012a2012a2012a5012a2012a201ea501ea2007b50000000000000000000000000007b50000000000000000000000000018c4018c1024a3018a21
010b000014b5014a2014a2014a5014a2014a2014a5014a2014c4014c1014a2014a5014a2014a2014b5020a2014b5014a2014a2014a5014a2014a2014a5014a2014c4014c1014a2014a5014a2014a2016a5016a20
010b000018b5018a2018a2018a5018a2018a2018a5018a2018c4018c1018a2018a5018a2018a2018b5024a2018b5018a2018a2018a5018a2018a2018a5018a2018c4018c1018a2018a5018a2018a201ac3018a20
010b000016b5016a2016a2016a5016a2016a2016a5016a2016c4016c1016a2016a5016a2016a2016b5022a2016b5016a2016a2016a5016a2016a2016a5016a2016c4016c1016a2016a5016a2016a2018a5016a20
010b00000000030810308152b8102b8152981029815248102481530810308152b8102b8152981029815248102481530810308152b8102b8152981029815248102481530810308152b8102b815298102981524810
010b000022130221202211222112291302912500000000002912029115000000000029110291150000000000291302912527135001002912500100291302b1302b1202b112291302912527135001002612500000
010b0000241302412024112241122b1302b12500100001002b1202b11500100001002b1102b11500100001002b1302b12529135001002b125001002b1302c1302c1202c1122b1302b12529135001002712500000
010b0000050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025050400502513045130251a0451a0251f0451f025
010b000011b5011a2011a2011a5011a2011a2011a5011a2011c4011c1011a2011a5011a2011a2011b501da2011b5011a2011a2011a5011a2011a2011a5011a2011c4011c1011a2011a5011a2011a2011a5013a20
010b000026130261202611226112291302912500000000002912029115000000000029110291150000000000291302912527135001002912500100291302b1302b1202b112291302912527135001002612500000
010b0000241302412024112241122b1302b12500100001002b1202b11500100001002b1102b11500100001002b1102b11529100001002b1102b1152b1002c1002b1102b1152b1002b1002b1102c1112e7212f731
010b00000b0400b02513045130251a0451a0251f0451f0250b0400b02513045130251a0451a0251f0451f0252b0242b01500000000002b0242b01500000000002b0342b02500000000002b0442b0352b00000000
010b000017b5017a2017a2017a5017a2017a2017a5017a2017c4017c1017a2017a5017a2017a2017b5023a2013b5013a4013a4213a3207a2107a1207a1207a120000000000000000000018b5018a4016b5016a40
010b0000307503074500000000003075030745000000000030750307450000000000307503074030732307253275032740327323272533755000003295032740327323272530750000002e7502e7453074500000
010b00003275032745000000000032740327350000000000327403273032722327153375033745357303572533950337403373033722337123371532950327303273232742337503274030750307403073230725
010b00002c7502c7402c7322c7322c7222c7222e7502e7402e7322e7222e7122e715307503074030732307422f7502f7402f7322f7322f7222f72230750307403073230722307123071532750327403273232725
010b00002a7502b7412b7402b7302b7322b7222b7222b7122b7122b7122b7122b715297402b7302c7302b7502b7402b7402b7322b7222b7122b7122b7150000000000000000000000000297002b7002c7002b700
010b00002f7502f7402f7402f7322f7322f7423075030740307403073230732307423275032740327323273533750337403373033722337123371235750337403275032740327303272232722327123271232715
010b0000083550000013d200000013d1000000083550000013d200000013d1000000083550000013d20000000a3550000013e200000013e10000000a3550000013e200000013e10000000a3550000013e2000000
010b00000b3550000013e200000013e10000000b3550000013e200000013e10000000b3550000013e20000000c340133251b3150c340133251b3150a340133251b3150a340133251b3150a340133201b3121b315
010b0000083550000013d200000013d1000000083550000013d200000013d1000000083550000013d2000000073550000013e2000e0013e1000000073550000013e200000013e1000000073550000013e2000000
010b0000063550000013e200000013e1000000063550000013e200000013e1000000063550000013e2000000073550000013e2000e0013e1000000073550000013e200000013e1000000073550000013e2000000
010b000014b5014a4014a3014a5014c4014a4014b4014a3014b5014a5014a4014a3014c4014a3020a350000016b5016a500000016b5016c400000016b5016a4016a3016a2216a2216a1216c4016a5016b5022a40
010b000017b5017a4017a3017a5017c4017a4017b4017a3017b5017a5017a4017a3013c4013a301fa350000018b5018a500000018b5018c400000016b5016a4016a3016a2216a2216a1216c4016a5018b5022a40
010b000014b5014a4014a3014a5014c4014a4014b4014a3014b5014a5014a4014a3014c4014a3020a350000013b5013a500000013b5013c400000013b5013a4013a3013a2213a2213a1213c4013a5013b501fa40
010b000012b501ea4012a3012a5012c4012a4012b4012a3012b5012a501ea4012a3012c4012a3012a350000013b501fa50000001fb5013c400000013b501fa401fa301fa221fa221fa1213c401fa5013b502ba40
018200200c60018600186140c6110c6150000000000000000c6140c61500000000000000000000246140c6110c615000000000000000000001861400611006150000000000000000c6140c615000000000000000
01820000000000ca740ca700ca700ca75000000000000000000000ca740ca700ca700ca750000000000000000000000a7400a7000a7000a750000000000000000000000000000000ca740ca7100a7100a7500000
0182002004614006111d611026111061109611056120461200611116110261110611096110561204612006111d611026112861109611056120461200611116110261110611096110561204612006120561202615
010b0000188401f850248601f850248602687024840268502886226870288502b8603087130872248002680030820268002880030810308003080030814000003080000000000000000000000000000000000000
010700000c00018600246000060000600246002b8003780037800378003780037800000000000000000000000c0001860024600006000c05318653246440061200612246532b8743787137862378523784237824
__music__
00 091d4344
00 091d1656
01 090a1555
00 090b1757
00 090c1858
00 090d194e
00 1a0a0f51
00 1b0b1057
00 1c0c1258
00 16131444
00 21201e44
00 1b0b1f44
00 1c0c2244
00 25242344
00 2f2b2644
00 302c2744
00 312d2844
00 322e2944
00 2f2b2644
00 302c2744
00 312d2844
02 322e2a44
00 091d4344
00 091d4344
01 090a4344
00 090b4344
00 090c4344
00 090d4e44
00 090a4f44
00 090b5044
00 090c5244
00 09135444
00 09201d44
00 090b1d44
00 090c1d44
02 090d1d44
03 33347544
03 73343544
03 41423544
00 36374344

