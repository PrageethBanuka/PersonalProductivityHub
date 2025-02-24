; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [340 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [674 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 65
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 64
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 105
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 260
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 294
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 46
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 77
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 140
	i32 53857724, ; 8: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 303
	i32 65960268, ; 9: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 203
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 121
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 201
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 99
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 278
	i32 113429830, ; 15: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 333
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 104
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 278
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 134
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 298
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 74
	i32 149972175, ; 21: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 121
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 234
	i32 176265551, ; 24: System.ServiceProcess => 0xa81994f => 129
	i32 182336117, ; 25: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 280
	i32 184328833, ; 26: System.ValueTuple.dll => 0xafca281 => 146
	i32 195452805, ; 27: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 332
	i32 199333315, ; 28: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 333
	i32 205061960, ; 29: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 30: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 232
	i32 220171995, ; 31: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 254
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 57
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 40
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 88
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 237
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 142
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 256
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 253
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 304
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 52
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 66
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 223
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 80
	i32 330147069, ; 46: Microsoft.SqlServer.Server => 0x13ada4fd => 202
	i32 336156722, ; 47: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 317
	i32 342366114, ; 48: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 255
	i32 356389973, ; 49: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 316
	i32 357576608, ; 50: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 304
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 128
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 53
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 144
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 71
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 140
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 60
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 141
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 336
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 160
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 328
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 238
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 251
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 122
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 147
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 110
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 161
	i32 469710990, ; 68: System.dll => 0x1bff388e => 159
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 253
	i32 485463106, ; 70: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 190
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 266
	i32 498788369, ; 72: System.ObjectModel => 0x1dbae811 => 81
	i32 500358224, ; 73: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 315
	i32 503918385, ; 74: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 309
	i32 513247710, ; 75: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 187
	i32 526420162, ; 76: System.Transactions.dll => 0x1f6088c2 => 145
	i32 527168573, ; 77: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 312
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 298
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 58
	i32 539058512, ; 80: Microsoft.Extensions.Logging => 0x20216150 => 183
	i32 540030774, ; 81: System.IO.FileSystem.dll => 0x20303736 => 49
	i32 545304856, ; 82: System.Runtime.Extensions => 0x2080b118 => 100
	i32 546455878, ; 83: System.Runtime.Serialization.Xml => 0x20924146 => 111
	i32 548916678, ; 84: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 171
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 38
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 291
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 289
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 117
	i32 592146354, ; 89: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 323
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 50
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 42
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 116
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 243
	i32 639843206, ; 94: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 249
	i32 643868501, ; 95: System.Net => 0x2660a755 => 78
	i32 662205335, ; 96: System.Text.Encodings.Web.dll => 0x27787397 => 216
	i32 663517072, ; 97: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 285
	i32 666292255, ; 98: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 230
	i32 672442732, ; 99: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 100: System.Net.Security => 0x28bdabca => 70
	i32 688181140, ; 101: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 303
	i32 690569205, ; 102: System.Xml.Linq.dll => 0x29293ff5 => 150
	i32 691348768, ; 103: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 300
	i32 693804605, ; 104: System.Windows => 0x295a9e3d => 149
	i32 699345723, ; 105: System.Reflection.Emit => 0x29af2b3b => 89
	i32 700284507, ; 106: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 295
	i32 700358131, ; 107: System.IO.Compression.ZipFile => 0x29be9df3 => 43
	i32 706645707, ; 108: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 318
	i32 709557578, ; 109: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 306
	i32 720511267, ; 110: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 299
	i32 722857257, ; 111: System.Runtime.Loader.dll => 0x2b15ed29 => 106
	i32 723796036, ; 112: System.ClientModel.dll => 0x2b244044 => 204
	i32 735137430, ; 113: System.Security.SecureString.dll => 0x2bd14e96 => 126
	i32 752232764, ; 114: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 115: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 220
	i32 759454413, ; 116: System.Net.Requests => 0x2d445acd => 69
	i32 762598435, ; 117: System.IO.Pipes.dll => 0x2d745423 => 53
	i32 775507847, ; 118: System.IO.Compression => 0x2e394f87 => 44
	i32 789151979, ; 119: Microsoft.Extensions.Options => 0x2f0980eb => 186
	i32 790371945, ; 120: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 244
	i32 804715423, ; 121: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 122: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 258
	i32 809851609, ; 123: System.Drawing.Common.dll => 0x30455ad9 => 207
	i32 823281589, ; 124: System.Private.Uri.dll => 0x311247b5 => 83
	i32 830298997, ; 125: System.IO.Compression.Brotli => 0x317d5b75 => 41
	i32 832635846, ; 126: System.Xml.XPath.dll => 0x31a103c6 => 155
	i32 834051424, ; 127: System.Net.Quic => 0x31b69d60 => 68
	i32 843511501, ; 128: Xamarin.AndroidX.Print => 0x3246f6cd => 271
	i32 870878177, ; 129: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 302
	i32 873119928, ; 130: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 131: System.Globalization.dll => 0x34505120 => 40
	i32 878954865, ; 132: System.Net.Http.Json => 0x3463c971 => 212
	i32 904024072, ; 133: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 134: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 51
	i32 926902833, ; 135: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 330
	i32 928116545, ; 136: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 294
	i32 952186615, ; 137: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 102
	i32 956575887, ; 138: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 299
	i32 966729478, ; 139: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 292
	i32 967690846, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 255
	i32 975236339, ; 141: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 142: System.Xml.XDocument => 0x3a2aaa1d => 153
	i32 986514023, ; 143: System.Private.DataContractSerialization.dll => 0x3acd0267 => 82
	i32 987214855, ; 144: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 145: System.Collections.dll => 0x3b2c715c => 12
	i32 993161700, ; 146: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 334
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 49
	i32 994547685, ; 148: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 308
	i32 1001831731, ; 149: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 54
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 275
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 182
	i32 1029334545, ; 153: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 305
	i32 1031528504, ; 154: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 293
	i32 1035644815, ; 155: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 228
	i32 1036536393, ; 156: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 56
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 262
	i32 1062017875, ; 159: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 189
	i32 1067306892, ; 160: GoogleGson => 0x3f9dcf8c => 170
	i32 1082857460, ; 161: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 162: Xamarin.Kotlin.StdLib => 0x409e66d8 => 296
	i32 1098259244, ; 163: System => 0x41761b2c => 159
	i32 1121599056, ; 164: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 261
	i32 1127624469, ; 165: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 185
	i32 1138436374, ; 166: Microsoft.Data.SqlClient.dll => 0x43db2916 => 172
	i32 1145483052, ; 167: System.Windows.Extensions.dll => 0x4446af2c => 218
	i32 1149092582, ; 168: Xamarin.AndroidX.Window => 0x447dc2e6 => 288
	i32 1157931901, ; 169: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 174
	i32 1170634674, ; 170: System.Web.dll => 0x45c677b2 => 148
	i32 1175144683, ; 171: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 284
	i32 1178241025, ; 172: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 269
	i32 1178797549, ; 173: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 309
	i32 1202000627, ; 174: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 174
	i32 1203215381, ; 175: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 322
	i32 1204270330, ; 176: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 230
	i32 1204575371, ; 177: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 178
	i32 1208641965, ; 178: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1219128291, ; 179: System.IO.IsolatedStorage => 0x48aa6be3 => 50
	i32 1234928153, ; 180: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 320
	i32 1243150071, ; 181: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 289
	i32 1253011324, ; 182: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1264511973, ; 183: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 279
	i32 1267360935, ; 184: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 283
	i32 1273260888, ; 185: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 235
	i32 1275534314, ; 186: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 300
	i32 1278448581, ; 187: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 227
	i32 1293217323, ; 188: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 246
	i32 1309188875, ; 189: System.Private.DataContractSerialization => 0x4e08a30b => 82
	i32 1322716291, ; 190: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 288
	i32 1324164729, ; 191: System.Linq => 0x4eed2679 => 59
	i32 1335329327, ; 192: System.Runtime.Serialization.Json.dll => 0x4f97822f => 109
	i32 1364015309, ; 193: System.IO => 0x514d38cd => 55
	i32 1376866003, ; 194: Xamarin.AndroidX.SavedState => 0x52114ed3 => 275
	i32 1379779777, ; 195: System.Resources.ResourceManager => 0x523dc4c1 => 96
	i32 1402170036, ; 196: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 197: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 239
	i32 1408764838, ; 198: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 108
	i32 1411638395, ; 199: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 98
	i32 1422545099, ; 200: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 99
	i32 1434145427, ; 201: System.Runtime.Handles => 0x557b5293 => 101
	i32 1435222561, ; 202: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 292
	i32 1439761251, ; 203: System.Net.Quic.dll => 0x55d10363 => 68
	i32 1452070440, ; 204: System.Formats.Asn1.dll => 0x568cd628 => 208
	i32 1453312822, ; 205: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 206: System.Runtime.Extensions.dll => 0x56e36530 => 100
	i32 1458022317, ; 207: System.Net.Security.dll => 0x56e7a7ad => 70
	i32 1460893475, ; 208: System.IdentityModel.Tokens.Jwt => 0x57137723 => 209
	i32 1461234159, ; 209: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 210: System.Security.Cryptography.OpenSsl => 0x57201017 => 120
	i32 1462112819, ; 211: System.IO.Compression.dll => 0x57261233 => 44
	i32 1469204771, ; 212: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 229
	i32 1470490898, ; 213: Microsoft.Extensions.Primitives => 0x57a5e912 => 187
	i32 1479771757, ; 214: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 215: System.IO.Compression.Brotli.dll => 0x583e844f => 41
	i32 1487239319, ; 216: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 217: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 276
	i32 1493001747, ; 218: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 312
	i32 1498168481, ; 219: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 191
	i32 1514721132, ; 220: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 307
	i32 1536373174, ; 221: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 222: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 133
	i32 1543355203, ; 223: System.Reflection.Emit.dll => 0x5bfdbb43 => 89
	i32 1550322496, ; 224: System.Reflection.Extensions.dll => 0x5c680b40 => 90
	i32 1551623176, ; 225: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 327
	i32 1554762148, ; 226: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 310
	i32 1565310744, ; 227: System.Runtime.Caching => 0x5d4cbf18 => 213
	i32 1565862583, ; 228: System.IO.FileSystem.Primitives => 0x5d552ab7 => 47
	i32 1566207040, ; 229: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 136
	i32 1573704789, ; 230: System.Runtime.Serialization.Json => 0x5dccd455 => 109
	i32 1580037396, ; 231: System.Threading.Overlapped => 0x5e2d7514 => 135
	i32 1580413037, ; 232: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 328
	i32 1582305585, ; 233: Azure.Identity => 0x5e501131 => 169
	i32 1582372066, ; 234: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 245
	i32 1591080825, ; 235: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 335
	i32 1592978981, ; 236: System.Runtime.Serialization.dll => 0x5ef2ee25 => 112
	i32 1597949149, ; 237: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 293
	i32 1601112923, ; 238: System.Xml.Serialization => 0x5f6f0b5b => 152
	i32 1604827217, ; 239: System.Net.WebClient => 0x5fa7b851 => 73
	i32 1618516317, ; 240: System.Net.WebSockets.Client.dll => 0x6078995d => 76
	i32 1622152042, ; 241: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 265
	i32 1622358360, ; 242: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 243: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 287
	i32 1628113371, ; 244: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 194
	i32 1635184631, ; 245: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 249
	i32 1636350590, ; 246: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 242
	i32 1639515021, ; 247: System.Net.Http.dll => 0x61b9038d => 61
	i32 1639986890, ; 248: System.Text.RegularExpressions => 0x61c036ca => 133
	i32 1641389582, ; 249: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 250: System.Runtime => 0x62c6282e => 113
	i32 1658241508, ; 251: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 281
	i32 1658251792, ; 252: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 290
	i32 1670060433, ; 253: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 237
	i32 1675553242, ; 254: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 46
	i32 1677501392, ; 255: System.Net.Primitives.dll => 0x63fca3d0 => 67
	i32 1678508291, ; 256: System.Net.WebSockets => 0x640c0103 => 77
	i32 1679769178, ; 257: System.Security.Cryptography => 0x641f3e5a => 123
	i32 1689493916, ; 258: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 173
	i32 1691477237, ; 259: System.Reflection.Metadata => 0x64d1e4f5 => 91
	i32 1696967625, ; 260: System.Security.Cryptography.Csp => 0x6525abc9 => 118
	i32 1698840827, ; 261: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 297
	i32 1701541528, ; 262: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 263: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 258
	i32 1726116996, ; 264: System.Reflection.dll => 0x66e27484 => 94
	i32 1728033016, ; 265: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 266: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 233
	i32 1736233607, ; 267: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 325
	i32 1744735666, ; 268: System.Transactions.Local.dll => 0x67fe8db2 => 144
	i32 1746115085, ; 269: System.IO.Pipelines.dll => 0x68139a0d => 210
	i32 1746316138, ; 270: Mono.Android.Export => 0x6816ab6a => 164
	i32 1750313021, ; 271: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 272: System.Resources.Reader.dll => 0x68cc9d1e => 95
	i32 1763938596, ; 273: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 274: System.Reflection.Extensions => 0x6942234e => 90
	i32 1766324549, ; 275: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 280
	i32 1770582343, ; 276: Microsoft.Extensions.Logging.dll => 0x6988f147 => 183
	i32 1776026572, ; 277: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 278: System.Globalization.Extensions.dll => 0x69ec0683 => 39
	i32 1780572499, ; 279: Mono.Android.Runtime.dll => 0x6a216153 => 165
	i32 1788241197, ; 280: Xamarin.AndroidX.Fragment => 0x6a96652d => 251
	i32 1794500907, ; 281: Microsoft.Identity.Client.dll => 0x6af5e92b => 188
	i32 1796167890, ; 282: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 171
	i32 1808609942, ; 283: Xamarin.AndroidX.Loader => 0x6bcd3296 => 265
	i32 1809966115, ; 284: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 320
	i32 1813058853, ; 285: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 296
	i32 1813201214, ; 286: Xamarin.Google.Android.Material => 0x6c13413e => 290
	i32 1818569960, ; 287: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 270
	i32 1818787751, ; 288: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1821794637, ; 289: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 314
	i32 1824175904, ; 290: System.Text.Encoding.Extensions => 0x6cbab720 => 131
	i32 1824722060, ; 291: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 108
	i32 1828688058, ; 292: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 184
	i32 1829150748, ; 293: System.Windows.Extensions => 0x6d06a01c => 218
	i32 1842015223, ; 294: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 331
	i32 1847515442, ; 295: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 220
	i32 1858542181, ; 296: System.Linq.Expressions => 0x6ec71a65 => 56
	i32 1870277092, ; 297: System.Reflection.Primitives => 0x6f7a29e4 => 92
	i32 1871986876, ; 298: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 194
	i32 1879696579, ; 299: System.Formats.Tar.dll => 0x7009e4c3 => 37
	i32 1885316902, ; 300: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 231
	i32 1888955245, ; 301: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 302: System.Reflection.Metadata.dll => 0x70a66bdd => 91
	i32 1898237753, ; 303: System.Reflection.DispatchProxy => 0x7124cf39 => 86
	i32 1900610850, ; 304: System.Resources.ResourceManager.dll => 0x71490522 => 96
	i32 1910275211, ; 305: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 306: System.Private.Xml.Linq => 0x739bd4a8 => 84
	i32 1956758971, ; 307: System.Resources.Writer => 0x74a1c5bb => 97
	i32 1960264639, ; 308: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 317
	i32 1961813231, ; 309: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 277
	i32 1968388702, ; 310: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 179
	i32 1983156543, ; 311: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 297
	i32 1985761444, ; 312: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 222
	i32 1986222447, ; 313: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 195
	i32 2011961780, ; 314: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014344398, ; 315: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 313
	i32 2019465201, ; 316: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 262
	i32 2025202353, ; 317: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 302
	i32 2031763787, ; 318: Xamarin.Android.Glide => 0x791a414b => 219
	i32 2040764568, ; 319: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 189
	i32 2043674646, ; 320: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 316
	i32 2045470958, ; 321: System.Private.Xml => 0x79eb68ee => 85
	i32 2055257422, ; 322: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 257
	i32 2060060697, ; 323: System.Windows.dll => 0x7aca0819 => 149
	i32 2070888862, ; 324: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 325: System.Runtime.dll => 0x7bf8cdab => 113
	i32 2090596640, ; 326: System.Numerics.Vectors => 0x7c9bf920 => 79
	i32 2127167465, ; 327: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 328: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 329: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 157
	i32 2146852085, ; 330: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2150663486, ; 331: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 318
	i32 2159891885, ; 332: Microsoft.Maui => 0x80bd55ad => 199
	i32 2165051842, ; 333: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 325
	i32 2181898931, ; 334: Microsoft.Extensions.Options.dll => 0x820d22b3 => 186
	i32 2192057212, ; 335: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 184
	i32 2193016926, ; 336: System.ObjectModel.dll => 0x82b6c85e => 81
	i32 2201044888, ; 337: Focusly.dll => 0x83314798 => 0
	i32 2201107256, ; 338: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 301
	i32 2201231467, ; 339: System.Net.Http => 0x8334206b => 61
	i32 2217644978, ; 340: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 284
	i32 2222056684, ; 341: System.Threading.Tasks.Parallel => 0x8471e4ec => 138
	i32 2244775296, ; 342: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 266
	i32 2252106437, ; 343: System.Xml.Serialization.dll => 0x863c6ac5 => 152
	i32 2252897993, ; 344: Microsoft.EntityFrameworkCore => 0x86487ec9 => 173
	i32 2253551641, ; 345: Microsoft.IdentityModel.Protocols => 0x86527819 => 193
	i32 2256313426, ; 346: System.Globalization.Extensions => 0x867c9c52 => 39
	i32 2265110946, ; 347: System.Security.AccessControl.dll => 0x8702d9a2 => 114
	i32 2266799131, ; 348: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 180
	i32 2267999099, ; 349: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 221
	i32 2270573516, ; 350: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 310
	i32 2279755925, ; 351: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 273
	i32 2289298199, ; 352: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 329
	i32 2293034957, ; 353: System.ServiceModel.Web.dll => 0x88acefcd => 128
	i32 2295906218, ; 354: System.Net.Sockets => 0x88d8bfaa => 72
	i32 2298471582, ; 355: System.Net.Mail => 0x88ffe49e => 63
	i32 2305521784, ; 356: System.Private.CoreLib.dll => 0x896b7878 => 167
	i32 2315684594, ; 357: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 225
	i32 2320631194, ; 358: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 138
	i32 2340441535, ; 359: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 103
	i32 2344264397, ; 360: System.ValueTuple => 0x8bbaa2cd => 146
	i32 2353062107, ; 361: System.Net.Primitives => 0x8c40e0db => 67
	i32 2368005991, ; 362: System.Xml.ReaderWriter.dll => 0x8d24e767 => 151
	i32 2369706906, ; 363: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 192
	i32 2369760409, ; 364: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 330
	i32 2371007202, ; 365: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 179
	i32 2378619854, ; 366: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 118
	i32 2383496789, ; 367: System.Security.Principal.Windows.dll => 0x8e114655 => 124
	i32 2401565422, ; 368: System.Web.HttpUtility => 0x8f24faee => 147
	i32 2403452196, ; 369: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 248
	i32 2421380589, ; 370: System.Threading.Tasks.Dataflow => 0x905355ed => 136
	i32 2421992093, ; 371: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 321
	i32 2423080555, ; 372: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 235
	i32 2435356389, ; 373: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 374: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 375: System.Text.Encoding.dll => 0x924edee6 => 132
	i32 2458678730, ; 376: System.Net.Sockets.dll => 0x928c75ca => 72
	i32 2459001652, ; 377: System.Linq.Parallel.dll => 0x92916334 => 57
	i32 2465532216, ; 378: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 238
	i32 2471841756, ; 379: netstandard.dll => 0x93554fdc => 162
	i32 2475788418, ; 380: Java.Interop.dll => 0x93918882 => 163
	i32 2480646305, ; 381: Microsoft.Maui.Controls => 0x93dba8a1 => 197
	i32 2483903535, ; 382: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 383: System.Net.ServicePoint => 0x94147f61 => 71
	i32 2490993605, ; 384: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 385: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 386: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 260
	i32 2520433370, ; 387: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 327
	i32 2522472828, ; 388: Xamarin.Android.Glide.dll => 0x9659e17c => 219
	i32 2538310050, ; 389: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 88
	i32 2562349572, ; 390: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 391: System.Text.Encodings.Web => 0x9930ee42 => 216
	i32 2581783588, ; 392: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 261
	i32 2581819634, ; 393: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 283
	i32 2585220780, ; 394: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 131
	i32 2585805581, ; 395: System.Net.Ping => 0x9a20430d => 66
	i32 2589602615, ; 396: System.Threading.ThreadPool => 0x9a5a3337 => 141
	i32 2605712449, ; 397: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 301
	i32 2615233544, ; 398: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 252
	i32 2616218305, ; 399: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 185
	i32 2617129537, ; 400: System.Private.Xml.dll => 0x9bfe3a41 => 85
	i32 2618712057, ; 401: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 93
	i32 2620871830, ; 402: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 242
	i32 2624644809, ; 403: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 247
	i32 2627185994, ; 404: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2628210652, ; 405: System.Memory.Data => 0x9ca74fdc => 211
	i32 2629843544, ; 406: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 43
	i32 2633051222, ; 407: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 256
	i32 2634653062, ; 408: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 175
	i32 2640290731, ; 409: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 192
	i32 2640706905, ; 410: Azure.Core => 0x9d65fd59 => 168
	i32 2660759594, ; 411: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 214
	i32 2663391936, ; 412: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 221
	i32 2663698177, ; 413: System.Runtime.Loader => 0x9ec4cf01 => 106
	i32 2664396074, ; 414: System.Xml.XDocument.dll => 0x9ecf752a => 153
	i32 2665622720, ; 415: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 416: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 417: Azure.Identity.dll => 0x9f9148fa => 169
	i32 2686887180, ; 418: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 111
	i32 2693849962, ; 419: System.IO.dll => 0xa090e36a => 55
	i32 2701096212, ; 420: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 281
	i32 2715334215, ; 421: System.Threading.Tasks.dll => 0xa1d8b647 => 139
	i32 2717744543, ; 422: System.Security.Claims => 0xa1fd7d9f => 115
	i32 2719963679, ; 423: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 117
	i32 2724373263, ; 424: System.Runtime.Numerics.dll => 0xa262a30f => 107
	i32 2732626843, ; 425: Xamarin.AndroidX.Activity => 0xa2e0939b => 223
	i32 2735172069, ; 426: System.Threading.Channels => 0xa30769e5 => 134
	i32 2737747696, ; 427: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 229
	i32 2740051746, ; 428: Microsoft.Identity.Client => 0xa351df22 => 188
	i32 2740948882, ; 429: System.IO.Pipes.AccessControl => 0xa35f8f92 => 52
	i32 2748088231, ; 430: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 102
	i32 2755098380, ; 431: Microsoft.SqlServer.Server.dll => 0xa437770c => 202
	i32 2755643133, ; 432: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 176
	i32 2758225723, ; 433: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 198
	i32 2764765095, ; 434: Microsoft.Maui.dll => 0xa4caf7a7 => 199
	i32 2765824710, ; 435: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 130
	i32 2770495804, ; 436: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 295
	i32 2778768386, ; 437: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 286
	i32 2779977773, ; 438: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 274
	i32 2788224221, ; 439: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 252
	i32 2795666278, ; 440: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 203
	i32 2801831435, ; 441: Microsoft.Maui.Graphics => 0xa7008e0b => 201
	i32 2802068195, ; 442: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 331
	i32 2803228030, ; 443: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 154
	i32 2806116107, ; 444: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 308
	i32 2810250172, ; 445: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 239
	i32 2819470561, ; 446: System.Xml.dll => 0xa80db4e1 => 158
	i32 2821205001, ; 447: System.ServiceProcess.dll => 0xa8282c09 => 129
	i32 2821294376, ; 448: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 274
	i32 2824502124, ; 449: System.Xml.XmlDocument => 0xa85a7b6c => 156
	i32 2831556043, ; 450: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 321
	i32 2838993487, ; 451: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 263
	i32 2841355853, ; 452: System.Security.Permissions => 0xa95ba64d => 215
	i32 2847789619, ; 453: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 175
	i32 2849599387, ; 454: System.Threading.Overlapped.dll => 0xa9d96f9b => 135
	i32 2853208004, ; 455: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 286
	i32 2855708567, ; 456: Xamarin.AndroidX.Transition => 0xaa36a797 => 282
	i32 2857259519, ; 457: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 307
	i32 2861098320, ; 458: Mono.Android.Export.dll => 0xaa88e550 => 164
	i32 2861189240, ; 459: Microsoft.Maui.Essentials => 0xaa8a4878 => 200
	i32 2867946736, ; 460: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 214
	i32 2870099610, ; 461: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 224
	i32 2875164099, ; 462: Jsr305Binding.dll => 0xab5f85c3 => 291
	i32 2875220617, ; 463: System.Globalization.Calendars.dll => 0xab606289 => 38
	i32 2883495834, ; 464: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 326
	i32 2884993177, ; 465: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 250
	i32 2887636118, ; 466: System.Net.dll => 0xac1dd496 => 78
	i32 2899753641, ; 467: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 54
	i32 2900621748, ; 468: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 469: System.Reflection => 0xacf080de => 94
	i32 2905242038, ; 470: mscorlib.dll => 0xad2a79b6 => 161
	i32 2909740682, ; 471: System.Private.CoreLib => 0xad6f1e8a => 167
	i32 2916838712, ; 472: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 287
	i32 2919462931, ; 473: System.Numerics.Vectors.dll => 0xae037813 => 79
	i32 2921128767, ; 474: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 226
	i32 2936416060, ; 475: System.Resources.Reader => 0xaf06273c => 95
	i32 2940926066, ; 476: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 477: System.Xml.XPath.XDocument => 0xaf624531 => 154
	i32 2944313911, ; 478: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 205
	i32 2959614098, ; 479: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 480: System.Security.Principal.Windows => 0xb0ed41f3 => 124
	i32 2972252294, ; 481: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 116
	i32 2978675010, ; 482: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 246
	i32 2987532451, ; 483: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 277
	i32 2996846495, ; 484: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 259
	i32 3012788804, ; 485: System.Configuration.ConfigurationManager => 0xb3938244 => 205
	i32 3016983068, ; 486: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 279
	i32 3023353419, ; 487: WindowsBase.dll => 0xb434b64b => 160
	i32 3024354802, ; 488: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 254
	i32 3033605958, ; 489: System.Memory.Data.dll => 0xb4d12746 => 211
	i32 3038032645, ; 490: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 336
	i32 3056245963, ; 491: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 276
	i32 3057625584, ; 492: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 267
	i32 3059408633, ; 493: Mono.Android.Runtime => 0xb65adef9 => 165
	i32 3059793426, ; 494: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 495: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 177
	i32 3075834255, ; 496: System.Threading.Tasks => 0xb755818f => 139
	i32 3077302341, ; 497: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 314
	i32 3084678329, ; 498: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 195
	i32 3090735792, ; 499: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 122
	i32 3099732863, ; 500: System.Security.Claims.dll => 0xb8c22b7f => 115
	i32 3103600923, ; 501: System.Formats.Asn1 => 0xb8fd311b => 208
	i32 3111772706, ; 502: System.Runtime.Serialization => 0xb979e222 => 112
	i32 3121463068, ; 503: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 45
	i32 3124832203, ; 504: System.Threading.Tasks.Extensions => 0xba4127cb => 137
	i32 3132293585, ; 505: System.Security.AccessControl => 0xbab301d1 => 114
	i32 3147165239, ; 506: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 507: GoogleGson.dll => 0xbba64c02 => 170
	i32 3159123045, ; 508: System.Reflection.Primitives.dll => 0xbc4c6465 => 92
	i32 3160747431, ; 509: System.IO.MemoryMappedFiles => 0xbc652da7 => 51
	i32 3178803400, ; 510: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 268
	i32 3192346100, ; 511: System.Security.SecureString => 0xbe4755f4 => 126
	i32 3193515020, ; 512: System.Web => 0xbe592c0c => 148
	i32 3195844289, ; 513: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 177
	i32 3204380047, ; 514: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 515: System.Xml.XmlDocument.dll => 0xbf506931 => 156
	i32 3211777861, ; 516: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 245
	i32 3213246214, ; 517: System.Security.Permissions.dll => 0xbf863f06 => 215
	i32 3220365878, ; 518: System.Threading => 0xbff2e236 => 143
	i32 3226221578, ; 519: System.Runtime.Handles.dll => 0xc04c3c0a => 101
	i32 3251039220, ; 520: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 86
	i32 3258312781, ; 521: Xamarin.AndroidX.CardView => 0xc235e84d => 233
	i32 3265493905, ; 522: System.Linq.Queryable.dll => 0xc2a37b91 => 58
	i32 3265893370, ; 523: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 137
	i32 3277815716, ; 524: System.Resources.Writer.dll => 0xc35f7fa4 => 97
	i32 3279906254, ; 525: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 526: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 527: System.Security.Cryptography.Encoding => 0xc4251ff9 => 119
	i32 3299363146, ; 528: System.Text.Encoding => 0xc4a8494a => 132
	i32 3303498502, ; 529: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3312457198, ; 530: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 191
	i32 3316684772, ; 531: System.Net.Requests.dll => 0xc5b097e4 => 69
	i32 3317135071, ; 532: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 243
	i32 3317144872, ; 533: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 534: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 231
	i32 3345895724, ; 535: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 272
	i32 3346324047, ; 536: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 269
	i32 3358260929, ; 537: System.Text.Json => 0xc82afec1 => 217
	i32 3362336904, ; 538: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 224
	i32 3362522851, ; 539: Xamarin.AndroidX.Core => 0xc86c06e3 => 240
	i32 3366347497, ; 540: Java.Interop => 0xc8a662e9 => 163
	i32 3374879918, ; 541: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 193
	i32 3374999561, ; 542: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 273
	i32 3395150330, ; 543: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 98
	i32 3403906625, ; 544: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 120
	i32 3405233483, ; 545: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 244
	i32 3428513518, ; 546: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 181
	i32 3429136800, ; 547: System.Xml => 0xcc6479a0 => 158
	i32 3430777524, ; 548: netstandard => 0xcc7d82b4 => 162
	i32 3441283291, ; 549: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 247
	i32 3445260447, ; 550: System.Formats.Tar => 0xcd5a809f => 37
	i32 3452344032, ; 551: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 196
	i32 3463511458, ; 552: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 313
	i32 3471940407, ; 553: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 554: Mono.Android => 0xcf3163e6 => 166
	i32 3479583265, ; 555: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 326
	i32 3485117614, ; 556: System.Text.Json.dll => 0xcfbaacae => 217
	i32 3486566296, ; 557: System.Transactions => 0xcfd0c798 => 145
	i32 3493954962, ; 558: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 236
	i32 3509114376, ; 559: System.Xml.Linq => 0xd128d608 => 150
	i32 3515174580, ; 560: System.Security.dll => 0xd1854eb4 => 127
	i32 3530912306, ; 561: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 562: System.Net.HttpListener => 0xd2ff69f1 => 62
	i32 3542658132, ; 563: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 332
	i32 3545306353, ; 564: Microsoft.Data.SqlClient => 0xd35114f1 => 172
	i32 3558648585, ; 565: System.ClientModel => 0xd41cab09 => 204
	i32 3560100363, ; 566: System.Threading.Timer => 0xd432d20b => 142
	i32 3561949811, ; 567: Azure.Core.dll => 0xd44f0a73 => 168
	i32 3570554715, ; 568: System.IO.FileSystem.AccessControl => 0xd4d2575b => 45
	i32 3570608287, ; 569: System.Runtime.Caching.dll => 0xd4d3289f => 213
	i32 3596930546, ; 570: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 306
	i32 3597029428, ; 571: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 222
	i32 3598340787, ; 572: System.Net.WebSockets.Client => 0xd67a52b3 => 76
	i32 3608519521, ; 573: System.Linq.dll => 0xd715a361 => 59
	i32 3623444314, ; 574: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 305
	i32 3624195450, ; 575: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 103
	i32 3627220390, ; 576: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 271
	i32 3633644679, ; 577: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 226
	i32 3638274909, ; 578: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 47
	i32 3641597786, ; 579: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 257
	i32 3643854240, ; 580: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 268
	i32 3645089577, ; 581: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3647796983, ; 582: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 323
	i32 3657292374, ; 583: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 180
	i32 3660523487, ; 584: System.Net.NetworkInformation => 0xda2f27df => 65
	i32 3662115805, ; 585: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 311
	i32 3672681054, ; 586: Mono.Android.dll => 0xdae8aa5e => 166
	i32 3682565725, ; 587: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 232
	i32 3684561358, ; 588: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 236
	i32 3686075795, ; 589: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 319
	i32 3689375977, ; 590: System.Drawing.Common => 0xdbe768e9 => 207
	i32 3697841164, ; 591: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 335
	i32 3700591436, ; 592: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 190
	i32 3700866549, ; 593: System.Net.WebProxy.dll => 0xdc96bdf5 => 75
	i32 3706696989, ; 594: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 241
	i32 3716563718, ; 595: System.Runtime.Intrinsics => 0xdd864306 => 105
	i32 3718780102, ; 596: Xamarin.AndroidX.Annotation => 0xdda814c6 => 225
	i32 3724971120, ; 597: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 267
	i32 3732100267, ; 598: System.Net.NameResolution => 0xde7354ab => 64
	i32 3737834244, ; 599: System.Net.Http.Json.dll => 0xdecad304 => 212
	i32 3748608112, ; 600: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 206
	i32 3751444290, ; 601: System.Xml.XPath => 0xdf9a7f42 => 155
	i32 3786282454, ; 602: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 234
	i32 3792276235, ; 603: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 604: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 196
	i32 3802395368, ; 605: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 606: System.Net.WebProxy => 0xe3a54a09 => 75
	i32 3823082795, ; 607: System.Security.Cryptography.dll => 0xe3df9d2b => 123
	i32 3829621856, ; 608: System.Numerics.dll => 0xe4436460 => 80
	i32 3841636137, ; 609: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 182
	i32 3844307129, ; 610: System.Net.Mail.dll => 0xe52378b9 => 63
	i32 3849253459, ; 611: System.Runtime.InteropServices.dll => 0xe56ef253 => 104
	i32 3870376305, ; 612: System.Net.HttpListener.dll => 0xe6b14171 => 62
	i32 3873536506, ; 613: System.Security.Principal => 0xe6e179fa => 125
	i32 3875112723, ; 614: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 119
	i32 3885497537, ; 615: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 74
	i32 3885922214, ; 616: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 282
	i32 3888767677, ; 617: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 272
	i32 3889960447, ; 618: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 334
	i32 3896106733, ; 619: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 620: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 240
	i32 3901907137, ; 621: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 622: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 42
	i32 3921031405, ; 623: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 285
	i32 3928044579, ; 624: System.Xml.ReaderWriter => 0xea213423 => 151
	i32 3930554604, ; 625: System.Security.Principal.dll => 0xea4780ec => 125
	i32 3931092270, ; 626: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 270
	i32 3945713374, ; 627: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 628: System.Text.Encoding.CodePages => 0xebac8bfe => 130
	i32 3955647286, ; 629: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 228
	i32 3959773229, ; 630: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 259
	i32 3980434154, ; 631: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 329
	i32 3987592930, ; 632: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 311
	i32 4003436829, ; 633: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 634: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 227
	i32 4023392905, ; 635: System.IO.Pipelines => 0xefd01a89 => 210
	i32 4025784931, ; 636: System.Memory => 0xeff49a63 => 60
	i32 4046471985, ; 637: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 198
	i32 4054681211, ; 638: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 87
	i32 4068434129, ; 639: System.Private.Xml.Linq.dll => 0xf27f60d1 => 84
	i32 4070331268, ; 640: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 315
	i32 4073602200, ; 641: System.Threading.dll => 0xf2ce3c98 => 143
	i32 4094352644, ; 642: Microsoft.Maui.Essentials.dll => 0xf40add04 => 200
	i32 4099507663, ; 643: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 644: System.Private.Uri => 0xf462c30d => 83
	i32 4101593132, ; 645: Xamarin.AndroidX.Emoji2 => 0xf479582c => 248
	i32 4101842092, ; 646: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 178
	i32 4102112229, ; 647: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 324
	i32 4119206479, ; 648: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 322
	i32 4125707920, ; 649: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 319
	i32 4126470640, ; 650: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 181
	i32 4127667938, ; 651: System.IO.FileSystem.Watcher => 0xf60736e2 => 48
	i32 4130442656, ; 652: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 653: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 87
	i32 4151237749, ; 654: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 655: System.Xml.XmlSerializer => 0xf7e95c85 => 157
	i32 4161255271, ; 656: System.Reflection.TypeExtensions => 0xf807b767 => 93
	i32 4164802419, ; 657: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 48
	i32 4181436372, ; 658: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 110
	i32 4182413190, ; 659: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 264
	i32 4185676441, ; 660: System.Security => 0xf97c5a99 => 127
	i32 4194278001, ; 661: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 176
	i32 4196529839, ; 662: System.Net.WebClient.dll => 0xfa21f6af => 73
	i32 4213026141, ; 663: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 206
	i32 4231365576, ; 664: Focusly => 0xfc3583c8 => 0
	i32 4234116406, ; 665: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 324
	i32 4256097574, ; 666: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 241
	i32 4258378803, ; 667: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 263
	i32 4260525087, ; 668: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 669: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 209
	i32 4271975918, ; 670: Microsoft.Maui.Controls.dll => 0xfea12dee => 197
	i32 4274976490, ; 671: System.Runtime.Numerics => 0xfecef6ea => 107
	i32 4292120959, ; 672: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 264
	i32 4294763496 ; 673: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 250
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [674 x i32] [
	i32 65, ; 0
	i32 64, ; 1
	i32 105, ; 2
	i32 260, ; 3
	i32 294, ; 4
	i32 46, ; 5
	i32 77, ; 6
	i32 140, ; 7
	i32 303, ; 8
	i32 203, ; 9
	i32 29, ; 10
	i32 121, ; 11
	i32 201, ; 12
	i32 99, ; 13
	i32 278, ; 14
	i32 333, ; 15
	i32 104, ; 16
	i32 278, ; 17
	i32 134, ; 18
	i32 298, ; 19
	i32 74, ; 20
	i32 121, ; 21
	i32 13, ; 22
	i32 234, ; 23
	i32 129, ; 24
	i32 280, ; 25
	i32 146, ; 26
	i32 332, ; 27
	i32 333, ; 28
	i32 18, ; 29
	i32 232, ; 30
	i32 26, ; 31
	i32 254, ; 32
	i32 1, ; 33
	i32 57, ; 34
	i32 40, ; 35
	i32 88, ; 36
	i32 237, ; 37
	i32 142, ; 38
	i32 256, ; 39
	i32 253, ; 40
	i32 304, ; 41
	i32 52, ; 42
	i32 66, ; 43
	i32 223, ; 44
	i32 80, ; 45
	i32 202, ; 46
	i32 317, ; 47
	i32 255, ; 48
	i32 316, ; 49
	i32 304, ; 50
	i32 128, ; 51
	i32 53, ; 52
	i32 144, ; 53
	i32 71, ; 54
	i32 140, ; 55
	i32 60, ; 56
	i32 141, ; 57
	i32 336, ; 58
	i32 160, ; 59
	i32 328, ; 60
	i32 238, ; 61
	i32 12, ; 62
	i32 251, ; 63
	i32 122, ; 64
	i32 147, ; 65
	i32 110, ; 66
	i32 161, ; 67
	i32 159, ; 68
	i32 253, ; 69
	i32 190, ; 70
	i32 266, ; 71
	i32 81, ; 72
	i32 315, ; 73
	i32 309, ; 74
	i32 187, ; 75
	i32 145, ; 76
	i32 312, ; 77
	i32 298, ; 78
	i32 58, ; 79
	i32 183, ; 80
	i32 49, ; 81
	i32 100, ; 82
	i32 111, ; 83
	i32 171, ; 84
	i32 38, ; 85
	i32 291, ; 86
	i32 289, ; 87
	i32 117, ; 88
	i32 323, ; 89
	i32 50, ; 90
	i32 42, ; 91
	i32 116, ; 92
	i32 243, ; 93
	i32 249, ; 94
	i32 78, ; 95
	i32 216, ; 96
	i32 285, ; 97
	i32 230, ; 98
	i32 8, ; 99
	i32 70, ; 100
	i32 303, ; 101
	i32 150, ; 102
	i32 300, ; 103
	i32 149, ; 104
	i32 89, ; 105
	i32 295, ; 106
	i32 43, ; 107
	i32 318, ; 108
	i32 306, ; 109
	i32 299, ; 110
	i32 106, ; 111
	i32 204, ; 112
	i32 126, ; 113
	i32 25, ; 114
	i32 220, ; 115
	i32 69, ; 116
	i32 53, ; 117
	i32 44, ; 118
	i32 186, ; 119
	i32 244, ; 120
	i32 22, ; 121
	i32 258, ; 122
	i32 207, ; 123
	i32 83, ; 124
	i32 41, ; 125
	i32 155, ; 126
	i32 68, ; 127
	i32 271, ; 128
	i32 302, ; 129
	i32 3, ; 130
	i32 40, ; 131
	i32 212, ; 132
	i32 16, ; 133
	i32 51, ; 134
	i32 330, ; 135
	i32 294, ; 136
	i32 102, ; 137
	i32 299, ; 138
	i32 292, ; 139
	i32 255, ; 140
	i32 33, ; 141
	i32 153, ; 142
	i32 82, ; 143
	i32 31, ; 144
	i32 12, ; 145
	i32 334, ; 146
	i32 49, ; 147
	i32 308, ; 148
	i32 54, ; 149
	i32 275, ; 150
	i32 35, ; 151
	i32 182, ; 152
	i32 305, ; 153
	i32 293, ; 154
	i32 228, ; 155
	i32 34, ; 156
	i32 56, ; 157
	i32 262, ; 158
	i32 189, ; 159
	i32 170, ; 160
	i32 17, ; 161
	i32 296, ; 162
	i32 159, ; 163
	i32 261, ; 164
	i32 185, ; 165
	i32 172, ; 166
	i32 218, ; 167
	i32 288, ; 168
	i32 174, ; 169
	i32 148, ; 170
	i32 284, ; 171
	i32 269, ; 172
	i32 309, ; 173
	i32 174, ; 174
	i32 322, ; 175
	i32 230, ; 176
	i32 178, ; 177
	i32 28, ; 178
	i32 50, ; 179
	i32 320, ; 180
	i32 289, ; 181
	i32 5, ; 182
	i32 279, ; 183
	i32 283, ; 184
	i32 235, ; 185
	i32 300, ; 186
	i32 227, ; 187
	i32 246, ; 188
	i32 82, ; 189
	i32 288, ; 190
	i32 59, ; 191
	i32 109, ; 192
	i32 55, ; 193
	i32 275, ; 194
	i32 96, ; 195
	i32 19, ; 196
	i32 239, ; 197
	i32 108, ; 198
	i32 98, ; 199
	i32 99, ; 200
	i32 101, ; 201
	i32 292, ; 202
	i32 68, ; 203
	i32 208, ; 204
	i32 31, ; 205
	i32 100, ; 206
	i32 70, ; 207
	i32 209, ; 208
	i32 9, ; 209
	i32 120, ; 210
	i32 44, ; 211
	i32 229, ; 212
	i32 187, ; 213
	i32 9, ; 214
	i32 41, ; 215
	i32 4, ; 216
	i32 276, ; 217
	i32 312, ; 218
	i32 191, ; 219
	i32 307, ; 220
	i32 30, ; 221
	i32 133, ; 222
	i32 89, ; 223
	i32 90, ; 224
	i32 327, ; 225
	i32 310, ; 226
	i32 213, ; 227
	i32 47, ; 228
	i32 136, ; 229
	i32 109, ; 230
	i32 135, ; 231
	i32 328, ; 232
	i32 169, ; 233
	i32 245, ; 234
	i32 335, ; 235
	i32 112, ; 236
	i32 293, ; 237
	i32 152, ; 238
	i32 73, ; 239
	i32 76, ; 240
	i32 265, ; 241
	i32 36, ; 242
	i32 287, ; 243
	i32 194, ; 244
	i32 249, ; 245
	i32 242, ; 246
	i32 61, ; 247
	i32 133, ; 248
	i32 15, ; 249
	i32 113, ; 250
	i32 281, ; 251
	i32 290, ; 252
	i32 237, ; 253
	i32 46, ; 254
	i32 67, ; 255
	i32 77, ; 256
	i32 123, ; 257
	i32 173, ; 258
	i32 91, ; 259
	i32 118, ; 260
	i32 297, ; 261
	i32 26, ; 262
	i32 258, ; 263
	i32 94, ; 264
	i32 27, ; 265
	i32 233, ; 266
	i32 325, ; 267
	i32 144, ; 268
	i32 210, ; 269
	i32 164, ; 270
	i32 4, ; 271
	i32 95, ; 272
	i32 32, ; 273
	i32 90, ; 274
	i32 280, ; 275
	i32 183, ; 276
	i32 21, ; 277
	i32 39, ; 278
	i32 165, ; 279
	i32 251, ; 280
	i32 188, ; 281
	i32 171, ; 282
	i32 265, ; 283
	i32 320, ; 284
	i32 296, ; 285
	i32 290, ; 286
	i32 270, ; 287
	i32 2, ; 288
	i32 314, ; 289
	i32 131, ; 290
	i32 108, ; 291
	i32 184, ; 292
	i32 218, ; 293
	i32 331, ; 294
	i32 220, ; 295
	i32 56, ; 296
	i32 92, ; 297
	i32 194, ; 298
	i32 37, ; 299
	i32 231, ; 300
	i32 25, ; 301
	i32 91, ; 302
	i32 86, ; 303
	i32 96, ; 304
	i32 10, ; 305
	i32 84, ; 306
	i32 97, ; 307
	i32 317, ; 308
	i32 277, ; 309
	i32 179, ; 310
	i32 297, ; 311
	i32 222, ; 312
	i32 195, ; 313
	i32 7, ; 314
	i32 313, ; 315
	i32 262, ; 316
	i32 302, ; 317
	i32 219, ; 318
	i32 189, ; 319
	i32 316, ; 320
	i32 85, ; 321
	i32 257, ; 322
	i32 149, ; 323
	i32 32, ; 324
	i32 113, ; 325
	i32 79, ; 326
	i32 20, ; 327
	i32 11, ; 328
	i32 157, ; 329
	i32 3, ; 330
	i32 318, ; 331
	i32 199, ; 332
	i32 325, ; 333
	i32 186, ; 334
	i32 184, ; 335
	i32 81, ; 336
	i32 0, ; 337
	i32 301, ; 338
	i32 61, ; 339
	i32 284, ; 340
	i32 138, ; 341
	i32 266, ; 342
	i32 152, ; 343
	i32 173, ; 344
	i32 193, ; 345
	i32 39, ; 346
	i32 114, ; 347
	i32 180, ; 348
	i32 221, ; 349
	i32 310, ; 350
	i32 273, ; 351
	i32 329, ; 352
	i32 128, ; 353
	i32 72, ; 354
	i32 63, ; 355
	i32 167, ; 356
	i32 225, ; 357
	i32 138, ; 358
	i32 103, ; 359
	i32 146, ; 360
	i32 67, ; 361
	i32 151, ; 362
	i32 192, ; 363
	i32 330, ; 364
	i32 179, ; 365
	i32 118, ; 366
	i32 124, ; 367
	i32 147, ; 368
	i32 248, ; 369
	i32 136, ; 370
	i32 321, ; 371
	i32 235, ; 372
	i32 20, ; 373
	i32 14, ; 374
	i32 132, ; 375
	i32 72, ; 376
	i32 57, ; 377
	i32 238, ; 378
	i32 162, ; 379
	i32 163, ; 380
	i32 197, ; 381
	i32 15, ; 382
	i32 71, ; 383
	i32 6, ; 384
	i32 23, ; 385
	i32 260, ; 386
	i32 327, ; 387
	i32 219, ; 388
	i32 88, ; 389
	i32 1, ; 390
	i32 216, ; 391
	i32 261, ; 392
	i32 283, ; 393
	i32 131, ; 394
	i32 66, ; 395
	i32 141, ; 396
	i32 301, ; 397
	i32 252, ; 398
	i32 185, ; 399
	i32 85, ; 400
	i32 93, ; 401
	i32 242, ; 402
	i32 247, ; 403
	i32 30, ; 404
	i32 211, ; 405
	i32 43, ; 406
	i32 256, ; 407
	i32 175, ; 408
	i32 192, ; 409
	i32 168, ; 410
	i32 214, ; 411
	i32 221, ; 412
	i32 106, ; 413
	i32 153, ; 414
	i32 34, ; 415
	i32 22, ; 416
	i32 169, ; 417
	i32 111, ; 418
	i32 55, ; 419
	i32 281, ; 420
	i32 139, ; 421
	i32 115, ; 422
	i32 117, ; 423
	i32 107, ; 424
	i32 223, ; 425
	i32 134, ; 426
	i32 229, ; 427
	i32 188, ; 428
	i32 52, ; 429
	i32 102, ; 430
	i32 202, ; 431
	i32 176, ; 432
	i32 198, ; 433
	i32 199, ; 434
	i32 130, ; 435
	i32 295, ; 436
	i32 286, ; 437
	i32 274, ; 438
	i32 252, ; 439
	i32 203, ; 440
	i32 201, ; 441
	i32 331, ; 442
	i32 154, ; 443
	i32 308, ; 444
	i32 239, ; 445
	i32 158, ; 446
	i32 129, ; 447
	i32 274, ; 448
	i32 156, ; 449
	i32 321, ; 450
	i32 263, ; 451
	i32 215, ; 452
	i32 175, ; 453
	i32 135, ; 454
	i32 286, ; 455
	i32 282, ; 456
	i32 307, ; 457
	i32 164, ; 458
	i32 200, ; 459
	i32 214, ; 460
	i32 224, ; 461
	i32 291, ; 462
	i32 38, ; 463
	i32 326, ; 464
	i32 250, ; 465
	i32 78, ; 466
	i32 54, ; 467
	i32 36, ; 468
	i32 94, ; 469
	i32 161, ; 470
	i32 167, ; 471
	i32 287, ; 472
	i32 79, ; 473
	i32 226, ; 474
	i32 95, ; 475
	i32 29, ; 476
	i32 154, ; 477
	i32 205, ; 478
	i32 18, ; 479
	i32 124, ; 480
	i32 116, ; 481
	i32 246, ; 482
	i32 277, ; 483
	i32 259, ; 484
	i32 205, ; 485
	i32 279, ; 486
	i32 160, ; 487
	i32 254, ; 488
	i32 211, ; 489
	i32 336, ; 490
	i32 276, ; 491
	i32 267, ; 492
	i32 165, ; 493
	i32 16, ; 494
	i32 177, ; 495
	i32 139, ; 496
	i32 314, ; 497
	i32 195, ; 498
	i32 122, ; 499
	i32 115, ; 500
	i32 208, ; 501
	i32 112, ; 502
	i32 45, ; 503
	i32 137, ; 504
	i32 114, ; 505
	i32 33, ; 506
	i32 170, ; 507
	i32 92, ; 508
	i32 51, ; 509
	i32 268, ; 510
	i32 126, ; 511
	i32 148, ; 512
	i32 177, ; 513
	i32 24, ; 514
	i32 156, ; 515
	i32 245, ; 516
	i32 215, ; 517
	i32 143, ; 518
	i32 101, ; 519
	i32 86, ; 520
	i32 233, ; 521
	i32 58, ; 522
	i32 137, ; 523
	i32 97, ; 524
	i32 5, ; 525
	i32 13, ; 526
	i32 119, ; 527
	i32 132, ; 528
	i32 27, ; 529
	i32 191, ; 530
	i32 69, ; 531
	i32 243, ; 532
	i32 24, ; 533
	i32 231, ; 534
	i32 272, ; 535
	i32 269, ; 536
	i32 217, ; 537
	i32 224, ; 538
	i32 240, ; 539
	i32 163, ; 540
	i32 193, ; 541
	i32 273, ; 542
	i32 98, ; 543
	i32 120, ; 544
	i32 244, ; 545
	i32 181, ; 546
	i32 158, ; 547
	i32 162, ; 548
	i32 247, ; 549
	i32 37, ; 550
	i32 196, ; 551
	i32 313, ; 552
	i32 17, ; 553
	i32 166, ; 554
	i32 326, ; 555
	i32 217, ; 556
	i32 145, ; 557
	i32 236, ; 558
	i32 150, ; 559
	i32 127, ; 560
	i32 19, ; 561
	i32 62, ; 562
	i32 332, ; 563
	i32 172, ; 564
	i32 204, ; 565
	i32 142, ; 566
	i32 168, ; 567
	i32 45, ; 568
	i32 213, ; 569
	i32 306, ; 570
	i32 222, ; 571
	i32 76, ; 572
	i32 59, ; 573
	i32 305, ; 574
	i32 103, ; 575
	i32 271, ; 576
	i32 226, ; 577
	i32 47, ; 578
	i32 257, ; 579
	i32 268, ; 580
	i32 14, ; 581
	i32 323, ; 582
	i32 180, ; 583
	i32 65, ; 584
	i32 311, ; 585
	i32 166, ; 586
	i32 232, ; 587
	i32 236, ; 588
	i32 319, ; 589
	i32 207, ; 590
	i32 335, ; 591
	i32 190, ; 592
	i32 75, ; 593
	i32 241, ; 594
	i32 105, ; 595
	i32 225, ; 596
	i32 267, ; 597
	i32 64, ; 598
	i32 212, ; 599
	i32 206, ; 600
	i32 155, ; 601
	i32 234, ; 602
	i32 10, ; 603
	i32 196, ; 604
	i32 11, ; 605
	i32 75, ; 606
	i32 123, ; 607
	i32 80, ; 608
	i32 182, ; 609
	i32 63, ; 610
	i32 104, ; 611
	i32 62, ; 612
	i32 125, ; 613
	i32 119, ; 614
	i32 74, ; 615
	i32 282, ; 616
	i32 272, ; 617
	i32 334, ; 618
	i32 8, ; 619
	i32 240, ; 620
	i32 2, ; 621
	i32 42, ; 622
	i32 285, ; 623
	i32 151, ; 624
	i32 125, ; 625
	i32 270, ; 626
	i32 23, ; 627
	i32 130, ; 628
	i32 228, ; 629
	i32 259, ; 630
	i32 329, ; 631
	i32 311, ; 632
	i32 28, ; 633
	i32 227, ; 634
	i32 210, ; 635
	i32 60, ; 636
	i32 198, ; 637
	i32 87, ; 638
	i32 84, ; 639
	i32 315, ; 640
	i32 143, ; 641
	i32 200, ; 642
	i32 35, ; 643
	i32 83, ; 644
	i32 248, ; 645
	i32 178, ; 646
	i32 324, ; 647
	i32 322, ; 648
	i32 319, ; 649
	i32 181, ; 650
	i32 48, ; 651
	i32 6, ; 652
	i32 87, ; 653
	i32 21, ; 654
	i32 157, ; 655
	i32 93, ; 656
	i32 48, ; 657
	i32 110, ; 658
	i32 264, ; 659
	i32 127, ; 660
	i32 176, ; 661
	i32 73, ; 662
	i32 206, ; 663
	i32 0, ; 664
	i32 324, ; 665
	i32 241, ; 666
	i32 263, ; 667
	i32 7, ; 668
	i32 209, ; 669
	i32 197, ; 670
	i32 107, ; 671
	i32 264, ; 672
	i32 250 ; 673
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
