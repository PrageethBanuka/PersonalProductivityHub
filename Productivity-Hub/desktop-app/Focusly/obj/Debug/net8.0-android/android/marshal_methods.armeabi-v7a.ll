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

@assembly_image_cache = dso_local local_unnamed_addr global [352 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [698 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 65
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 64
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 105
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 189
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 272
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 306
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 46
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 211
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 77
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 140
	i32 53857724, ; 10: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 315
	i32 65960268, ; 11: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 210
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 121
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 208
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 99
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 290
	i32 113429830, ; 17: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 345
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 104
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 290
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 134
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 310
	i32 142721839, ; 22: System.Net.WebHeaderCollection => 0x881c32f => 74
	i32 149972175, ; 23: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 121
	i32 159306688, ; 24: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 25: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 246
	i32 176265551, ; 26: System.ServiceProcess => 0xa81994f => 129
	i32 182336117, ; 27: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 292
	i32 184328833, ; 28: System.ValueTuple.dll => 0xafca281 => 146
	i32 195452805, ; 29: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 344
	i32 199333315, ; 30: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 345
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 244
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 266
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 57
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 40
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 88
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 249
	i32 276479776, ; 40: System.Threading.Timer.dll => 0x107abf20 => 142
	i32 278686392, ; 41: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 268
	i32 280482487, ; 42: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 265
	i32 280992041, ; 43: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 316
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 52
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 66
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 235
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 80
	i32 330147069, ; 48: Microsoft.SqlServer.Server => 0x13ada4fd => 209
	i32 336156722, ; 49: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 329
	i32 342366114, ; 50: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 267
	i32 347068432, ; 51: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 214
	i32 356389973, ; 52: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 328
	i32 357576608, ; 53: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 316
	i32 360082299, ; 54: System.ServiceModel.Web => 0x15766b7b => 128
	i32 360867345, ; 55: MauiIcons.FontAwesome.dll => 0x15826611 => 169
	i32 367780167, ; 56: System.IO.Pipes => 0x15ebe147 => 53
	i32 374914964, ; 57: System.Transactions.Local => 0x1658bf94 => 144
	i32 375677976, ; 58: System.Net.ServicePoint.dll => 0x16646418 => 71
	i32 379916513, ; 59: System.Threading.Thread.dll => 0x16a510e1 => 140
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 60
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 141
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 348
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 160
	i32 435591531, ; 64: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 340
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 250
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 263
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 122
	i32 456227837, ; 69: System.Web.HttpUtility.dll => 0x1b317bfd => 147
	i32 459347974, ; 70: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 110
	i32 465846621, ; 71: mscorlib => 0x1bc4415d => 161
	i32 469710990, ; 72: System.dll => 0x1bff388e => 159
	i32 476646585, ; 73: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 265
	i32 485463106, ; 74: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 197
	i32 486930444, ; 75: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 278
	i32 498788369, ; 76: System.ObjectModel => 0x1dbae811 => 81
	i32 500358224, ; 77: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 327
	i32 503918385, ; 78: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 321
	i32 513247710, ; 79: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 194
	i32 526420162, ; 80: System.Transactions.dll => 0x1f6088c2 => 145
	i32 527168573, ; 81: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 324
	i32 527452488, ; 82: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 310
	i32 530272170, ; 83: System.Linq.Queryable => 0x1f9b4faa => 58
	i32 539058512, ; 84: Microsoft.Extensions.Logging => 0x20216150 => 190
	i32 540030774, ; 85: System.IO.FileSystem.dll => 0x20303736 => 49
	i32 545304856, ; 86: System.Runtime.Extensions => 0x2080b118 => 100
	i32 546455878, ; 87: System.Runtime.Serialization.Xml => 0x20924146 => 111
	i32 548916678, ; 88: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 175
	i32 549171840, ; 89: System.Globalization.Calendars => 0x20bbb280 => 38
	i32 557405415, ; 90: Jsr305Binding => 0x213954e7 => 303
	i32 569601784, ; 91: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 301
	i32 577335427, ; 92: System.Security.Cryptography.Cng => 0x22697083 => 117
	i32 592146354, ; 93: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 335
	i32 597488923, ; 94: CommunityToolkit.Maui => 0x239cf51b => 172
	i32 601371474, ; 95: System.IO.IsolatedStorage.dll => 0x23d83352 => 50
	i32 605376203, ; 96: System.IO.Compression.FileSystem => 0x24154ecb => 42
	i32 613668793, ; 97: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 116
	i32 627609679, ; 98: Xamarin.AndroidX.CustomView => 0x2568904f => 255
	i32 639843206, ; 99: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 261
	i32 643868501, ; 100: System.Net => 0x2660a755 => 78
	i32 662205335, ; 101: System.Text.Encodings.Web.dll => 0x27787397 => 228
	i32 663517072, ; 102: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 297
	i32 666292255, ; 103: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 242
	i32 672442732, ; 104: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 105: System.Net.Security => 0x28bdabca => 70
	i32 688181140, ; 106: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 315
	i32 690569205, ; 107: System.Xml.Linq.dll => 0x29293ff5 => 150
	i32 691348768, ; 108: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 312
	i32 693804605, ; 109: System.Windows => 0x295a9e3d => 149
	i32 699345723, ; 110: System.Reflection.Emit => 0x29af2b3b => 89
	i32 700284507, ; 111: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 307
	i32 700358131, ; 112: System.IO.Compression.ZipFile => 0x29be9df3 => 43
	i32 706645707, ; 113: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 330
	i32 709557578, ; 114: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 318
	i32 720511267, ; 115: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 311
	i32 722857257, ; 116: System.Runtime.Loader.dll => 0x2b15ed29 => 106
	i32 723796036, ; 117: System.ClientModel.dll => 0x2b244044 => 216
	i32 735137430, ; 118: System.Security.SecureString.dll => 0x2bd14e96 => 126
	i32 748832960, ; 119: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 212
	i32 752232764, ; 120: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 121: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 232
	i32 759454413, ; 122: System.Net.Requests => 0x2d445acd => 69
	i32 762598435, ; 123: System.IO.Pipes.dll => 0x2d745423 => 53
	i32 775507847, ; 124: System.IO.Compression => 0x2e394f87 => 44
	i32 789151979, ; 125: Microsoft.Extensions.Options => 0x2f0980eb => 193
	i32 790371945, ; 126: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 256
	i32 804715423, ; 127: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 128: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 270
	i32 809851609, ; 129: System.Drawing.Common.dll => 0x30455ad9 => 219
	i32 823281589, ; 130: System.Private.Uri.dll => 0x311247b5 => 83
	i32 830298997, ; 131: System.IO.Compression.Brotli => 0x317d5b75 => 41
	i32 832635846, ; 132: System.Xml.XPath.dll => 0x31a103c6 => 155
	i32 834051424, ; 133: System.Net.Quic => 0x31b69d60 => 68
	i32 843511501, ; 134: Xamarin.AndroidX.Print => 0x3246f6cd => 283
	i32 870878177, ; 135: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 314
	i32 873119928, ; 136: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 137: System.Globalization.dll => 0x34505120 => 40
	i32 878954865, ; 138: System.Net.Http.Json => 0x3463c971 => 224
	i32 904024072, ; 139: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 140: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 51
	i32 926902833, ; 141: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 342
	i32 928116545, ; 142: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 306
	i32 952186615, ; 143: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 102
	i32 955402788, ; 144: Newtonsoft.Json => 0x38f24a24 => 211
	i32 956575887, ; 145: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 311
	i32 966729478, ; 146: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 304
	i32 967690846, ; 147: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 267
	i32 975236339, ; 148: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 149: System.Xml.XDocument => 0x3a2aaa1d => 153
	i32 986514023, ; 150: System.Private.DataContractSerialization.dll => 0x3acd0267 => 82
	i32 987214855, ; 151: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 152: System.Collections.dll => 0x3b2c715c => 12
	i32 993161700, ; 153: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 346
	i32 994442037, ; 154: System.IO.FileSystem => 0x3b45fb35 => 49
	i32 994547685, ; 155: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 320
	i32 1001831731, ; 156: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 54
	i32 1012816738, ; 157: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 287
	i32 1019214401, ; 158: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 159: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 188
	i32 1029334545, ; 160: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 317
	i32 1031528504, ; 161: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 305
	i32 1035644815, ; 162: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 240
	i32 1036536393, ; 163: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 164: System.Linq.Expressions.dll => 0x3e444eb4 => 56
	i32 1052210849, ; 165: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 274
	i32 1062017875, ; 166: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 196
	i32 1067306892, ; 167: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 168: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 169: Xamarin.Kotlin.StdLib => 0x409e66d8 => 308
	i32 1098259244, ; 170: System => 0x41761b2c => 159
	i32 1121599056, ; 171: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 273
	i32 1127624469, ; 172: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 192
	i32 1138436374, ; 173: Microsoft.Data.SqlClient.dll => 0x43db2916 => 176
	i32 1145483052, ; 174: System.Windows.Extensions.dll => 0x4446af2c => 230
	i32 1149092582, ; 175: Xamarin.AndroidX.Window => 0x447dc2e6 => 300
	i32 1157931901, ; 176: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 179
	i32 1170634674, ; 177: System.Web.dll => 0x45c677b2 => 148
	i32 1175144683, ; 178: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 296
	i32 1178241025, ; 179: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 281
	i32 1178797549, ; 180: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 321
	i32 1202000627, ; 181: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 179
	i32 1203215381, ; 182: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 334
	i32 1204270330, ; 183: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 242
	i32 1204575371, ; 184: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 184
	i32 1208641965, ; 185: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1219128291, ; 186: System.IO.IsolatedStorage => 0x48aa6be3 => 50
	i32 1234928153, ; 187: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 332
	i32 1243150071, ; 188: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 301
	i32 1253011324, ; 189: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1264511973, ; 190: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 291
	i32 1267360935, ; 191: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 295
	i32 1273260888, ; 192: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 247
	i32 1275534314, ; 193: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 312
	i32 1278448581, ; 194: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 239
	i32 1292207520, ; 195: SQLitePCLRaw.core.dll => 0x4d0585a0 => 213
	i32 1293217323, ; 196: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 258
	i32 1309188875, ; 197: System.Private.DataContractSerialization => 0x4e08a30b => 82
	i32 1322716291, ; 198: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 300
	i32 1324164729, ; 199: System.Linq => 0x4eed2679 => 59
	i32 1335329327, ; 200: System.Runtime.Serialization.Json.dll => 0x4f97822f => 109
	i32 1364015309, ; 201: System.IO => 0x514d38cd => 55
	i32 1376866003, ; 202: Xamarin.AndroidX.SavedState => 0x52114ed3 => 287
	i32 1379779777, ; 203: System.Resources.ResourceManager => 0x523dc4c1 => 96
	i32 1402170036, ; 204: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 205: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 251
	i32 1408764838, ; 206: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 108
	i32 1411638395, ; 207: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 98
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 99
	i32 1434145427, ; 209: System.Runtime.Handles => 0x557b5293 => 101
	i32 1435222561, ; 210: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 304
	i32 1439761251, ; 211: System.Net.Quic.dll => 0x55d10363 => 68
	i32 1452070440, ; 212: System.Formats.Asn1.dll => 0x568cd628 => 220
	i32 1453312822, ; 213: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 214: System.Runtime.Extensions.dll => 0x56e36530 => 100
	i32 1458022317, ; 215: System.Net.Security.dll => 0x56e7a7ad => 70
	i32 1460893475, ; 216: System.IdentityModel.Tokens.Jwt => 0x57137723 => 221
	i32 1461234159, ; 217: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 218: System.Security.Cryptography.OpenSsl => 0x57201017 => 120
	i32 1462112819, ; 219: System.IO.Compression.dll => 0x57261233 => 44
	i32 1469204771, ; 220: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 241
	i32 1470490898, ; 221: Microsoft.Extensions.Primitives => 0x57a5e912 => 194
	i32 1479771757, ; 222: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 223: System.IO.Compression.Brotli.dll => 0x583e844f => 41
	i32 1487239319, ; 224: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 225: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 288
	i32 1490351284, ; 226: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 177
	i32 1493001747, ; 227: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 324
	i32 1498168481, ; 228: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 198
	i32 1514721132, ; 229: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 319
	i32 1536373174, ; 230: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 231: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 133
	i32 1543355203, ; 232: System.Reflection.Emit.dll => 0x5bfdbb43 => 89
	i32 1550322496, ; 233: System.Reflection.Extensions.dll => 0x5c680b40 => 90
	i32 1551623176, ; 234: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 339
	i32 1554762148, ; 235: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 322
	i32 1565310744, ; 236: System.Runtime.Caching => 0x5d4cbf18 => 225
	i32 1565862583, ; 237: System.IO.FileSystem.Primitives => 0x5d552ab7 => 47
	i32 1566207040, ; 238: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 136
	i32 1573704789, ; 239: System.Runtime.Serialization.Json => 0x5dccd455 => 109
	i32 1580037396, ; 240: System.Threading.Overlapped => 0x5e2d7514 => 135
	i32 1580413037, ; 241: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 340
	i32 1582305585, ; 242: Azure.Identity => 0x5e501131 => 171
	i32 1582372066, ; 243: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 257
	i32 1591080825, ; 244: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 347
	i32 1592978981, ; 245: System.Runtime.Serialization.dll => 0x5ef2ee25 => 112
	i32 1597949149, ; 246: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 305
	i32 1601112923, ; 247: System.Xml.Serialization => 0x5f6f0b5b => 152
	i32 1604827217, ; 248: System.Net.WebClient => 0x5fa7b851 => 73
	i32 1618516317, ; 249: System.Net.WebSockets.Client.dll => 0x6078995d => 76
	i32 1622152042, ; 250: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 277
	i32 1622358360, ; 251: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 252: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 299
	i32 1628113371, ; 253: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 201
	i32 1634654947, ; 254: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 173
	i32 1635184631, ; 255: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 261
	i32 1636350590, ; 256: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 254
	i32 1639515021, ; 257: System.Net.Http.dll => 0x61b9038d => 61
	i32 1639986890, ; 258: System.Text.RegularExpressions => 0x61c036ca => 133
	i32 1641389582, ; 259: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 260: System.Runtime => 0x62c6282e => 113
	i32 1658241508, ; 261: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 293
	i32 1658251792, ; 262: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 302
	i32 1670060433, ; 263: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 249
	i32 1675553242, ; 264: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 46
	i32 1677501392, ; 265: System.Net.Primitives.dll => 0x63fca3d0 => 67
	i32 1678508291, ; 266: System.Net.WebSockets => 0x640c0103 => 77
	i32 1679769178, ; 267: System.Security.Cryptography => 0x641f3e5a => 123
	i32 1688112883, ; 268: Microsoft.Data.Sqlite => 0x649e8ef3 => 177
	i32 1689493916, ; 269: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 178
	i32 1691477237, ; 270: System.Reflection.Metadata => 0x64d1e4f5 => 91
	i32 1696967625, ; 271: System.Security.Cryptography.Csp => 0x6525abc9 => 118
	i32 1698840827, ; 272: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 309
	i32 1701541528, ; 273: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 274: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 214
	i32 1720223769, ; 275: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 270
	i32 1726116996, ; 276: System.Reflection.dll => 0x66e27484 => 94
	i32 1728033016, ; 277: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 278: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 245
	i32 1736233607, ; 279: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 337
	i32 1743763213, ; 280: MauiIcons.FontAwesome => 0x67efb70d => 169
	i32 1744735666, ; 281: System.Transactions.Local.dll => 0x67fe8db2 => 144
	i32 1746115085, ; 282: System.IO.Pipelines.dll => 0x68139a0d => 222
	i32 1746316138, ; 283: Mono.Android.Export => 0x6816ab6a => 164
	i32 1750313021, ; 284: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 285: System.Resources.Reader.dll => 0x68cc9d1e => 95
	i32 1763938596, ; 286: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 287: System.Reflection.Extensions => 0x6942234e => 90
	i32 1766324549, ; 288: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 292
	i32 1770582343, ; 289: Microsoft.Extensions.Logging.dll => 0x6988f147 => 190
	i32 1776026572, ; 290: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 291: System.Globalization.Extensions.dll => 0x69ec0683 => 39
	i32 1780572499, ; 292: Mono.Android.Runtime.dll => 0x6a216153 => 165
	i32 1788241197, ; 293: Xamarin.AndroidX.Fragment => 0x6a96652d => 263
	i32 1794500907, ; 294: Microsoft.Identity.Client.dll => 0x6af5e92b => 195
	i32 1796167890, ; 295: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 175
	i32 1808609942, ; 296: Xamarin.AndroidX.Loader => 0x6bcd3296 => 277
	i32 1809966115, ; 297: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 332
	i32 1813058853, ; 298: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 308
	i32 1813201214, ; 299: Xamarin.Google.Android.Material => 0x6c13413e => 302
	i32 1818569960, ; 300: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 282
	i32 1818787751, ; 301: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1821794637, ; 302: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 326
	i32 1824175904, ; 303: System.Text.Encoding.Extensions => 0x6cbab720 => 131
	i32 1824722060, ; 304: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 108
	i32 1828688058, ; 305: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 191
	i32 1829150748, ; 306: System.Windows.Extensions => 0x6d06a01c => 230
	i32 1842015223, ; 307: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 343
	i32 1847515442, ; 308: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 232
	i32 1858542181, ; 309: System.Linq.Expressions => 0x6ec71a65 => 56
	i32 1870277092, ; 310: System.Reflection.Primitives => 0x6f7a29e4 => 92
	i32 1871986876, ; 311: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 201
	i32 1879696579, ; 312: System.Formats.Tar.dll => 0x7009e4c3 => 37
	i32 1885316902, ; 313: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 243
	i32 1886040351, ; 314: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 181
	i32 1888955245, ; 315: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 316: System.Reflection.Metadata.dll => 0x70a66bdd => 91
	i32 1898237753, ; 317: System.Reflection.DispatchProxy => 0x7124cf39 => 86
	i32 1900610850, ; 318: System.Resources.ResourceManager.dll => 0x71490522 => 96
	i32 1910275211, ; 319: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 320: System.Private.Xml.Linq => 0x739bd4a8 => 84
	i32 1956758971, ; 321: System.Resources.Writer => 0x74a1c5bb => 97
	i32 1960264639, ; 322: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 329
	i32 1961813231, ; 323: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 289
	i32 1968388702, ; 324: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 185
	i32 1983156543, ; 325: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 309
	i32 1985761444, ; 326: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 234
	i32 1986222447, ; 327: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 202
	i32 2011961780, ; 328: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014344398, ; 329: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 325
	i32 2014489277, ; 330: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 181
	i32 2019465201, ; 331: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 274
	i32 2025202353, ; 332: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 314
	i32 2031763787, ; 333: Xamarin.Android.Glide => 0x791a414b => 231
	i32 2040764568, ; 334: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 196
	i32 2043674646, ; 335: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 328
	i32 2045470958, ; 336: System.Private.Xml => 0x79eb68ee => 85
	i32 2055257422, ; 337: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 269
	i32 2060060697, ; 338: System.Windows.dll => 0x7aca0819 => 149
	i32 2070888862, ; 339: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 340: System.Runtime.dll => 0x7bf8cdab => 113
	i32 2090596640, ; 341: System.Numerics.Vectors => 0x7c9bf920 => 79
	i32 2103459038, ; 342: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 215
	i32 2127167465, ; 343: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 344: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 345: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 157
	i32 2146852085, ; 346: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2150663486, ; 347: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 330
	i32 2155759225, ; 348: MauiIcons.Core => 0x807e4679 => 168
	i32 2159891885, ; 349: Microsoft.Maui => 0x80bd55ad => 206
	i32 2165051842, ; 350: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 337
	i32 2181898931, ; 351: Microsoft.Extensions.Options.dll => 0x820d22b3 => 193
	i32 2192057212, ; 352: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 191
	i32 2193016926, ; 353: System.ObjectModel.dll => 0x82b6c85e => 81
	i32 2197979891, ; 354: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 189
	i32 2201044888, ; 355: Focusly.dll => 0x83314798 => 0
	i32 2201107256, ; 356: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 313
	i32 2201231467, ; 357: System.Net.Http => 0x8334206b => 61
	i32 2217644978, ; 358: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 296
	i32 2222056684, ; 359: System.Threading.Tasks.Parallel => 0x8471e4ec => 138
	i32 2244775296, ; 360: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 278
	i32 2252106437, ; 361: System.Xml.Serialization.dll => 0x863c6ac5 => 152
	i32 2252897993, ; 362: Microsoft.EntityFrameworkCore => 0x86487ec9 => 178
	i32 2253551641, ; 363: Microsoft.IdentityModel.Protocols => 0x86527819 => 200
	i32 2256313426, ; 364: System.Globalization.Extensions => 0x867c9c52 => 39
	i32 2265110946, ; 365: System.Security.AccessControl.dll => 0x8702d9a2 => 114
	i32 2266799131, ; 366: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 186
	i32 2267999099, ; 367: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 233
	i32 2270573516, ; 368: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 322
	i32 2279755925, ; 369: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 285
	i32 2289298199, ; 370: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 341
	i32 2293034957, ; 371: System.ServiceModel.Web.dll => 0x88acefcd => 128
	i32 2295906218, ; 372: System.Net.Sockets => 0x88d8bfaa => 72
	i32 2298471582, ; 373: System.Net.Mail => 0x88ffe49e => 63
	i32 2305521784, ; 374: System.Private.CoreLib.dll => 0x896b7878 => 167
	i32 2315684594, ; 375: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 237
	i32 2320631194, ; 376: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 138
	i32 2340441535, ; 377: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 103
	i32 2344264397, ; 378: System.ValueTuple => 0x8bbaa2cd => 146
	i32 2353062107, ; 379: System.Net.Primitives => 0x8c40e0db => 67
	i32 2368005991, ; 380: System.Xml.ReaderWriter.dll => 0x8d24e767 => 151
	i32 2369706906, ; 381: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 199
	i32 2369760409, ; 382: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 342
	i32 2371007202, ; 383: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 185
	i32 2378619854, ; 384: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 118
	i32 2383496789, ; 385: System.Security.Principal.Windows.dll => 0x8e114655 => 124
	i32 2401565422, ; 386: System.Web.HttpUtility => 0x8f24faee => 147
	i32 2403452196, ; 387: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 260
	i32 2421380589, ; 388: System.Threading.Tasks.Dataflow => 0x905355ed => 136
	i32 2421992093, ; 389: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 333
	i32 2423080555, ; 390: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 247
	i32 2435356389, ; 391: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 392: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 393: System.Text.Encoding.dll => 0x924edee6 => 132
	i32 2458678730, ; 394: System.Net.Sockets.dll => 0x928c75ca => 72
	i32 2459001652, ; 395: System.Linq.Parallel.dll => 0x92916334 => 57
	i32 2465273461, ; 396: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 212
	i32 2465532216, ; 397: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 250
	i32 2471841756, ; 398: netstandard.dll => 0x93554fdc => 162
	i32 2475788418, ; 399: Java.Interop.dll => 0x93918882 => 163
	i32 2480646305, ; 400: Microsoft.Maui.Controls => 0x93dba8a1 => 204
	i32 2483903535, ; 401: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 402: System.Net.ServicePoint => 0x94147f61 => 71
	i32 2490993605, ; 403: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 404: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 405: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 272
	i32 2520433370, ; 406: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 339
	i32 2522472828, ; 407: Xamarin.Android.Glide.dll => 0x9659e17c => 231
	i32 2538310050, ; 408: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 88
	i32 2562349572, ; 409: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 410: System.Text.Encodings.Web => 0x9930ee42 => 228
	i32 2581783588, ; 411: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 273
	i32 2581819634, ; 412: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 295
	i32 2585220780, ; 413: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 131
	i32 2585805581, ; 414: System.Net.Ping => 0x9a20430d => 66
	i32 2589602615, ; 415: System.Threading.ThreadPool => 0x9a5a3337 => 141
	i32 2605712449, ; 416: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 313
	i32 2615233544, ; 417: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 264
	i32 2616218305, ; 418: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 192
	i32 2617129537, ; 419: System.Private.Xml.dll => 0x9bfe3a41 => 85
	i32 2618712057, ; 420: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 93
	i32 2620871830, ; 421: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 254
	i32 2624644809, ; 422: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 259
	i32 2627185994, ; 423: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2628210652, ; 424: System.Memory.Data => 0x9ca74fdc => 223
	i32 2629843544, ; 425: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 43
	i32 2633051222, ; 426: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 268
	i32 2634653062, ; 427: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 180
	i32 2640290731, ; 428: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 199
	i32 2640706905, ; 429: Azure.Core => 0x9d65fd59 => 170
	i32 2660759594, ; 430: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 226
	i32 2663391936, ; 431: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 233
	i32 2663698177, ; 432: System.Runtime.Loader => 0x9ec4cf01 => 106
	i32 2664396074, ; 433: System.Xml.XDocument.dll => 0x9ecf752a => 153
	i32 2665622720, ; 434: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 435: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 436: Azure.Identity.dll => 0x9f9148fa => 171
	i32 2686887180, ; 437: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 111
	i32 2693849962, ; 438: System.IO.dll => 0xa090e36a => 55
	i32 2701096212, ; 439: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 293
	i32 2715334215, ; 440: System.Threading.Tasks.dll => 0xa1d8b647 => 139
	i32 2717744543, ; 441: System.Security.Claims => 0xa1fd7d9f => 115
	i32 2719963679, ; 442: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 117
	i32 2724373263, ; 443: System.Runtime.Numerics.dll => 0xa262a30f => 107
	i32 2732626843, ; 444: Xamarin.AndroidX.Activity => 0xa2e0939b => 235
	i32 2735172069, ; 445: System.Threading.Channels => 0xa30769e5 => 134
	i32 2737747696, ; 446: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 241
	i32 2740051746, ; 447: Microsoft.Identity.Client => 0xa351df22 => 195
	i32 2740948882, ; 448: System.IO.Pipes.AccessControl => 0xa35f8f92 => 52
	i32 2748088231, ; 449: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 102
	i32 2755098380, ; 450: Microsoft.SqlServer.Server.dll => 0xa437770c => 209
	i32 2755643133, ; 451: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 182
	i32 2758225723, ; 452: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 205
	i32 2764765095, ; 453: Microsoft.Maui.dll => 0xa4caf7a7 => 206
	i32 2765824710, ; 454: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 130
	i32 2770495804, ; 455: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 307
	i32 2778768386, ; 456: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 298
	i32 2779977773, ; 457: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 286
	i32 2788224221, ; 458: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 264
	i32 2795666278, ; 459: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 210
	i32 2801831435, ; 460: Microsoft.Maui.Graphics => 0xa7008e0b => 208
	i32 2802068195, ; 461: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 343
	i32 2803228030, ; 462: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 154
	i32 2806116107, ; 463: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 320
	i32 2810250172, ; 464: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 251
	i32 2819470561, ; 465: System.Xml.dll => 0xa80db4e1 => 158
	i32 2821205001, ; 466: System.ServiceProcess.dll => 0xa8282c09 => 129
	i32 2821294376, ; 467: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 286
	i32 2824502124, ; 468: System.Xml.XmlDocument => 0xa85a7b6c => 156
	i32 2831556043, ; 469: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 333
	i32 2838993487, ; 470: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 275
	i32 2841355853, ; 471: System.Security.Permissions => 0xa95ba64d => 227
	i32 2847789619, ; 472: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 180
	i32 2849599387, ; 473: System.Threading.Overlapped.dll => 0xa9d96f9b => 135
	i32 2853208004, ; 474: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 298
	i32 2855708567, ; 475: Xamarin.AndroidX.Transition => 0xaa36a797 => 294
	i32 2857259519, ; 476: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 319
	i32 2861098320, ; 477: Mono.Android.Export.dll => 0xaa88e550 => 164
	i32 2861189240, ; 478: Microsoft.Maui.Essentials => 0xaa8a4878 => 207
	i32 2867946736, ; 479: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 226
	i32 2868488919, ; 480: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 173
	i32 2870099610, ; 481: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 236
	i32 2875164099, ; 482: Jsr305Binding.dll => 0xab5f85c3 => 303
	i32 2875220617, ; 483: System.Globalization.Calendars.dll => 0xab606289 => 38
	i32 2883495834, ; 484: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 338
	i32 2884993177, ; 485: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 262
	i32 2887636118, ; 486: System.Net.dll => 0xac1dd496 => 78
	i32 2899753641, ; 487: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 54
	i32 2900621748, ; 488: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 489: System.Reflection => 0xacf080de => 94
	i32 2905242038, ; 490: mscorlib.dll => 0xad2a79b6 => 161
	i32 2909740682, ; 491: System.Private.CoreLib => 0xad6f1e8a => 167
	i32 2916838712, ; 492: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 299
	i32 2919462931, ; 493: System.Numerics.Vectors.dll => 0xae037813 => 79
	i32 2921128767, ; 494: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 238
	i32 2936416060, ; 495: System.Resources.Reader => 0xaf06273c => 95
	i32 2940926066, ; 496: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 497: System.Xml.XPath.XDocument => 0xaf624531 => 154
	i32 2944313911, ; 498: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 217
	i32 2959614098, ; 499: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 500: System.Security.Principal.Windows => 0xb0ed41f3 => 124
	i32 2972252294, ; 501: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 116
	i32 2978675010, ; 502: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 258
	i32 2987532451, ; 503: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 289
	i32 2996846495, ; 504: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 271
	i32 3012788804, ; 505: System.Configuration.ConfigurationManager => 0xb3938244 => 217
	i32 3016983068, ; 506: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 291
	i32 3023353419, ; 507: WindowsBase.dll => 0xb434b64b => 160
	i32 3024354802, ; 508: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 266
	i32 3033605958, ; 509: System.Memory.Data.dll => 0xb4d12746 => 223
	i32 3038032645, ; 510: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 348
	i32 3056245963, ; 511: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 288
	i32 3057625584, ; 512: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 279
	i32 3059408633, ; 513: Mono.Android.Runtime => 0xb65adef9 => 165
	i32 3059793426, ; 514: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3069363400, ; 515: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 183
	i32 3075834255, ; 516: System.Threading.Tasks => 0xb755818f => 139
	i32 3077302341, ; 517: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 326
	i32 3084678329, ; 518: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 202
	i32 3090735792, ; 519: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 122
	i32 3099732863, ; 520: System.Security.Claims.dll => 0xb8c22b7f => 115
	i32 3103600923, ; 521: System.Formats.Asn1 => 0xb8fd311b => 220
	i32 3111772706, ; 522: System.Runtime.Serialization => 0xb979e222 => 112
	i32 3121463068, ; 523: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 45
	i32 3124832203, ; 524: System.Threading.Tasks.Extensions => 0xba4127cb => 137
	i32 3132293585, ; 525: System.Security.AccessControl => 0xbab301d1 => 114
	i32 3147165239, ; 526: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 527: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 528: System.Reflection.Primitives.dll => 0xbc4c6465 => 92
	i32 3160747431, ; 529: System.IO.MemoryMappedFiles => 0xbc652da7 => 51
	i32 3178803400, ; 530: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 280
	i32 3192346100, ; 531: System.Security.SecureString => 0xbe4755f4 => 126
	i32 3193515020, ; 532: System.Web => 0xbe592c0c => 148
	i32 3195844289, ; 533: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 183
	i32 3204380047, ; 534: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 535: System.Xml.XmlDocument.dll => 0xbf506931 => 156
	i32 3211777861, ; 536: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 257
	i32 3213246214, ; 537: System.Security.Permissions.dll => 0xbf863f06 => 227
	i32 3220365878, ; 538: System.Threading => 0xbff2e236 => 143
	i32 3226221578, ; 539: System.Runtime.Handles.dll => 0xc04c3c0a => 101
	i32 3251039220, ; 540: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 86
	i32 3258312781, ; 541: Xamarin.AndroidX.CardView => 0xc235e84d => 245
	i32 3265493905, ; 542: System.Linq.Queryable.dll => 0xc2a37b91 => 58
	i32 3265893370, ; 543: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 137
	i32 3277815716, ; 544: System.Resources.Writer.dll => 0xc35f7fa4 => 97
	i32 3279906254, ; 545: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 546: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 547: System.Security.Cryptography.Encoding => 0xc4251ff9 => 119
	i32 3299363146, ; 548: System.Text.Encoding => 0xc4a8494a => 132
	i32 3303498502, ; 549: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3312457198, ; 550: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 198
	i32 3316684772, ; 551: System.Net.Requests.dll => 0xc5b097e4 => 69
	i32 3317135071, ; 552: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 255
	i32 3317144872, ; 553: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 554: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 243
	i32 3345895724, ; 555: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 284
	i32 3346324047, ; 556: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 281
	i32 3358260929, ; 557: System.Text.Json => 0xc82afec1 => 229
	i32 3360279109, ; 558: SQLitePCLRaw.core => 0xc849ca45 => 213
	i32 3362336904, ; 559: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 236
	i32 3362522851, ; 560: Xamarin.AndroidX.Core => 0xc86c06e3 => 252
	i32 3366347497, ; 561: Java.Interop => 0xc8a662e9 => 163
	i32 3374879918, ; 562: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 200
	i32 3374999561, ; 563: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 285
	i32 3395150330, ; 564: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 98
	i32 3403906625, ; 565: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 120
	i32 3405233483, ; 566: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 256
	i32 3428513518, ; 567: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 187
	i32 3429136800, ; 568: System.Xml => 0xcc6479a0 => 158
	i32 3430777524, ; 569: netstandard => 0xcc7d82b4 => 162
	i32 3441283291, ; 570: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 259
	i32 3445260447, ; 571: System.Formats.Tar => 0xcd5a809f => 37
	i32 3452344032, ; 572: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 203
	i32 3463511458, ; 573: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 325
	i32 3471940407, ; 574: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 575: Mono.Android => 0xcf3163e6 => 166
	i32 3479583265, ; 576: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 338
	i32 3485117614, ; 577: System.Text.Json.dll => 0xcfbaacae => 229
	i32 3486566296, ; 578: System.Transactions => 0xcfd0c798 => 145
	i32 3493954962, ; 579: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 248
	i32 3509114376, ; 580: System.Xml.Linq => 0xd128d608 => 150
	i32 3515174580, ; 581: System.Security.dll => 0xd1854eb4 => 127
	i32 3530912306, ; 582: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 583: System.Net.HttpListener => 0xd2ff69f1 => 62
	i32 3542658132, ; 584: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 344
	i32 3545306353, ; 585: Microsoft.Data.SqlClient => 0xd35114f1 => 176
	i32 3558648585, ; 586: System.ClientModel => 0xd41cab09 => 216
	i32 3560100363, ; 587: System.Threading.Timer => 0xd432d20b => 142
	i32 3561949811, ; 588: Azure.Core.dll => 0xd44f0a73 => 170
	i32 3570554715, ; 589: System.IO.FileSystem.AccessControl => 0xd4d2575b => 45
	i32 3570608287, ; 590: System.Runtime.Caching.dll => 0xd4d3289f => 225
	i32 3596930546, ; 591: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 318
	i32 3597029428, ; 592: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 234
	i32 3598340787, ; 593: System.Net.WebSockets.Client => 0xd67a52b3 => 76
	i32 3608519521, ; 594: System.Linq.dll => 0xd715a361 => 59
	i32 3623444314, ; 595: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 317
	i32 3624195450, ; 596: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 103
	i32 3627220390, ; 597: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 283
	i32 3633644679, ; 598: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 238
	i32 3638274909, ; 599: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 47
	i32 3641597786, ; 600: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 269
	i32 3643854240, ; 601: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 280
	i32 3645089577, ; 602: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645818313, ; 603: MauiIcons.Core.dll => 0xd94ec5c9 => 168
	i32 3647796983, ; 604: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 335
	i32 3657292374, ; 605: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 186
	i32 3660523487, ; 606: System.Net.NetworkInformation => 0xda2f27df => 65
	i32 3662115805, ; 607: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 323
	i32 3672681054, ; 608: Mono.Android.dll => 0xdae8aa5e => 166
	i32 3682565725, ; 609: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 244
	i32 3684561358, ; 610: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 248
	i32 3686075795, ; 611: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 331
	i32 3689375977, ; 612: System.Drawing.Common => 0xdbe768e9 => 219
	i32 3697841164, ; 613: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 347
	i32 3700591436, ; 614: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 197
	i32 3700866549, ; 615: System.Net.WebProxy.dll => 0xdc96bdf5 => 75
	i32 3706696989, ; 616: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 253
	i32 3716563718, ; 617: System.Runtime.Intrinsics => 0xdd864306 => 105
	i32 3718780102, ; 618: Xamarin.AndroidX.Annotation => 0xdda814c6 => 237
	i32 3724971120, ; 619: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 279
	i32 3732100267, ; 620: System.Net.NameResolution => 0xde7354ab => 64
	i32 3737834244, ; 621: System.Net.Http.Json.dll => 0xdecad304 => 224
	i32 3748608112, ; 622: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 218
	i32 3751444290, ; 623: System.Xml.XPath => 0xdf9a7f42 => 155
	i32 3754567612, ; 624: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 215
	i32 3786282454, ; 625: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 246
	i32 3792276235, ; 626: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 627: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 203
	i32 3802395368, ; 628: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 629: CommunityToolkit.Maui.dll => 0xe3886bf7 => 172
	i32 3819260425, ; 630: System.Net.WebProxy => 0xe3a54a09 => 75
	i32 3823082795, ; 631: System.Security.Cryptography.dll => 0xe3df9d2b => 123
	i32 3829621856, ; 632: System.Numerics.dll => 0xe4436460 => 80
	i32 3841636137, ; 633: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 188
	i32 3844307129, ; 634: System.Net.Mail.dll => 0xe52378b9 => 63
	i32 3849253459, ; 635: System.Runtime.InteropServices.dll => 0xe56ef253 => 104
	i32 3870376305, ; 636: System.Net.HttpListener.dll => 0xe6b14171 => 62
	i32 3873536506, ; 637: System.Security.Principal => 0xe6e179fa => 125
	i32 3875112723, ; 638: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 119
	i32 3885497537, ; 639: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 74
	i32 3885922214, ; 640: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 294
	i32 3888767677, ; 641: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 284
	i32 3889960447, ; 642: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 346
	i32 3896106733, ; 643: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 644: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 252
	i32 3901907137, ; 645: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 646: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 42
	i32 3921031405, ; 647: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 297
	i32 3928044579, ; 648: System.Xml.ReaderWriter => 0xea213423 => 151
	i32 3930554604, ; 649: System.Security.Principal.dll => 0xea4780ec => 125
	i32 3931092270, ; 650: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 282
	i32 3945713374, ; 651: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 652: System.Text.Encoding.CodePages => 0xebac8bfe => 130
	i32 3955647286, ; 653: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 240
	i32 3959773229, ; 654: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 271
	i32 3980434154, ; 655: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 341
	i32 3987592930, ; 656: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 323
	i32 4003436829, ; 657: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 658: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 239
	i32 4023392905, ; 659: System.IO.Pipelines => 0xefd01a89 => 222
	i32 4025784931, ; 660: System.Memory => 0xeff49a63 => 60
	i32 4046471985, ; 661: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 205
	i32 4054681211, ; 662: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 87
	i32 4068434129, ; 663: System.Private.Xml.Linq.dll => 0xf27f60d1 => 84
	i32 4070331268, ; 664: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 327
	i32 4073602200, ; 665: System.Threading.dll => 0xf2ce3c98 => 143
	i32 4094352644, ; 666: Microsoft.Maui.Essentials.dll => 0xf40add04 => 207
	i32 4099507663, ; 667: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 668: System.Private.Uri => 0xf462c30d => 83
	i32 4101593132, ; 669: Xamarin.AndroidX.Emoji2 => 0xf479582c => 260
	i32 4101842092, ; 670: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 184
	i32 4102112229, ; 671: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 336
	i32 4119206479, ; 672: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 334
	i32 4125707920, ; 673: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 331
	i32 4126470640, ; 674: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 187
	i32 4127667938, ; 675: System.IO.FileSystem.Watcher => 0xf60736e2 => 48
	i32 4130442656, ; 676: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 677: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 87
	i32 4151237749, ; 678: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 679: System.Xml.XmlSerializer => 0xf7e95c85 => 157
	i32 4161255271, ; 680: System.Reflection.TypeExtensions => 0xf807b767 => 93
	i32 4164802419, ; 681: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 48
	i32 4181436372, ; 682: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 110
	i32 4182413190, ; 683: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 276
	i32 4185676441, ; 684: System.Security => 0xf97c5a99 => 127
	i32 4194278001, ; 685: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 182
	i32 4196529839, ; 686: System.Net.WebClient.dll => 0xfa21f6af => 73
	i32 4213026141, ; 687: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 218
	i32 4231365576, ; 688: Focusly => 0xfc3583c8 => 0
	i32 4234116406, ; 689: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 336
	i32 4256097574, ; 690: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 253
	i32 4258378803, ; 691: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 275
	i32 4260525087, ; 692: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 693: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 221
	i32 4271975918, ; 694: Microsoft.Maui.Controls.dll => 0xfea12dee => 204
	i32 4274976490, ; 695: System.Runtime.Numerics => 0xfecef6ea => 107
	i32 4292120959, ; 696: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 276
	i32 4294763496 ; 697: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 262
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [698 x i32] [
	i32 65, ; 0
	i32 64, ; 1
	i32 105, ; 2
	i32 189, ; 3
	i32 272, ; 4
	i32 306, ; 5
	i32 46, ; 6
	i32 211, ; 7
	i32 77, ; 8
	i32 140, ; 9
	i32 315, ; 10
	i32 210, ; 11
	i32 29, ; 12
	i32 121, ; 13
	i32 208, ; 14
	i32 99, ; 15
	i32 290, ; 16
	i32 345, ; 17
	i32 104, ; 18
	i32 290, ; 19
	i32 134, ; 20
	i32 310, ; 21
	i32 74, ; 22
	i32 121, ; 23
	i32 13, ; 24
	i32 246, ; 25
	i32 129, ; 26
	i32 292, ; 27
	i32 146, ; 28
	i32 344, ; 29
	i32 345, ; 30
	i32 18, ; 31
	i32 244, ; 32
	i32 26, ; 33
	i32 266, ; 34
	i32 1, ; 35
	i32 57, ; 36
	i32 40, ; 37
	i32 88, ; 38
	i32 249, ; 39
	i32 142, ; 40
	i32 268, ; 41
	i32 265, ; 42
	i32 316, ; 43
	i32 52, ; 44
	i32 66, ; 45
	i32 235, ; 46
	i32 80, ; 47
	i32 209, ; 48
	i32 329, ; 49
	i32 267, ; 50
	i32 214, ; 51
	i32 328, ; 52
	i32 316, ; 53
	i32 128, ; 54
	i32 169, ; 55
	i32 53, ; 56
	i32 144, ; 57
	i32 71, ; 58
	i32 140, ; 59
	i32 60, ; 60
	i32 141, ; 61
	i32 348, ; 62
	i32 160, ; 63
	i32 340, ; 64
	i32 250, ; 65
	i32 12, ; 66
	i32 263, ; 67
	i32 122, ; 68
	i32 147, ; 69
	i32 110, ; 70
	i32 161, ; 71
	i32 159, ; 72
	i32 265, ; 73
	i32 197, ; 74
	i32 278, ; 75
	i32 81, ; 76
	i32 327, ; 77
	i32 321, ; 78
	i32 194, ; 79
	i32 145, ; 80
	i32 324, ; 81
	i32 310, ; 82
	i32 58, ; 83
	i32 190, ; 84
	i32 49, ; 85
	i32 100, ; 86
	i32 111, ; 87
	i32 175, ; 88
	i32 38, ; 89
	i32 303, ; 90
	i32 301, ; 91
	i32 117, ; 92
	i32 335, ; 93
	i32 172, ; 94
	i32 50, ; 95
	i32 42, ; 96
	i32 116, ; 97
	i32 255, ; 98
	i32 261, ; 99
	i32 78, ; 100
	i32 228, ; 101
	i32 297, ; 102
	i32 242, ; 103
	i32 8, ; 104
	i32 70, ; 105
	i32 315, ; 106
	i32 150, ; 107
	i32 312, ; 108
	i32 149, ; 109
	i32 89, ; 110
	i32 307, ; 111
	i32 43, ; 112
	i32 330, ; 113
	i32 318, ; 114
	i32 311, ; 115
	i32 106, ; 116
	i32 216, ; 117
	i32 126, ; 118
	i32 212, ; 119
	i32 25, ; 120
	i32 232, ; 121
	i32 69, ; 122
	i32 53, ; 123
	i32 44, ; 124
	i32 193, ; 125
	i32 256, ; 126
	i32 22, ; 127
	i32 270, ; 128
	i32 219, ; 129
	i32 83, ; 130
	i32 41, ; 131
	i32 155, ; 132
	i32 68, ; 133
	i32 283, ; 134
	i32 314, ; 135
	i32 3, ; 136
	i32 40, ; 137
	i32 224, ; 138
	i32 16, ; 139
	i32 51, ; 140
	i32 342, ; 141
	i32 306, ; 142
	i32 102, ; 143
	i32 211, ; 144
	i32 311, ; 145
	i32 304, ; 146
	i32 267, ; 147
	i32 33, ; 148
	i32 153, ; 149
	i32 82, ; 150
	i32 31, ; 151
	i32 12, ; 152
	i32 346, ; 153
	i32 49, ; 154
	i32 320, ; 155
	i32 54, ; 156
	i32 287, ; 157
	i32 35, ; 158
	i32 188, ; 159
	i32 317, ; 160
	i32 305, ; 161
	i32 240, ; 162
	i32 34, ; 163
	i32 56, ; 164
	i32 274, ; 165
	i32 196, ; 166
	i32 174, ; 167
	i32 17, ; 168
	i32 308, ; 169
	i32 159, ; 170
	i32 273, ; 171
	i32 192, ; 172
	i32 176, ; 173
	i32 230, ; 174
	i32 300, ; 175
	i32 179, ; 176
	i32 148, ; 177
	i32 296, ; 178
	i32 281, ; 179
	i32 321, ; 180
	i32 179, ; 181
	i32 334, ; 182
	i32 242, ; 183
	i32 184, ; 184
	i32 28, ; 185
	i32 50, ; 186
	i32 332, ; 187
	i32 301, ; 188
	i32 5, ; 189
	i32 291, ; 190
	i32 295, ; 191
	i32 247, ; 192
	i32 312, ; 193
	i32 239, ; 194
	i32 213, ; 195
	i32 258, ; 196
	i32 82, ; 197
	i32 300, ; 198
	i32 59, ; 199
	i32 109, ; 200
	i32 55, ; 201
	i32 287, ; 202
	i32 96, ; 203
	i32 19, ; 204
	i32 251, ; 205
	i32 108, ; 206
	i32 98, ; 207
	i32 99, ; 208
	i32 101, ; 209
	i32 304, ; 210
	i32 68, ; 211
	i32 220, ; 212
	i32 31, ; 213
	i32 100, ; 214
	i32 70, ; 215
	i32 221, ; 216
	i32 9, ; 217
	i32 120, ; 218
	i32 44, ; 219
	i32 241, ; 220
	i32 194, ; 221
	i32 9, ; 222
	i32 41, ; 223
	i32 4, ; 224
	i32 288, ; 225
	i32 177, ; 226
	i32 324, ; 227
	i32 198, ; 228
	i32 319, ; 229
	i32 30, ; 230
	i32 133, ; 231
	i32 89, ; 232
	i32 90, ; 233
	i32 339, ; 234
	i32 322, ; 235
	i32 225, ; 236
	i32 47, ; 237
	i32 136, ; 238
	i32 109, ; 239
	i32 135, ; 240
	i32 340, ; 241
	i32 171, ; 242
	i32 257, ; 243
	i32 347, ; 244
	i32 112, ; 245
	i32 305, ; 246
	i32 152, ; 247
	i32 73, ; 248
	i32 76, ; 249
	i32 277, ; 250
	i32 36, ; 251
	i32 299, ; 252
	i32 201, ; 253
	i32 173, ; 254
	i32 261, ; 255
	i32 254, ; 256
	i32 61, ; 257
	i32 133, ; 258
	i32 15, ; 259
	i32 113, ; 260
	i32 293, ; 261
	i32 302, ; 262
	i32 249, ; 263
	i32 46, ; 264
	i32 67, ; 265
	i32 77, ; 266
	i32 123, ; 267
	i32 177, ; 268
	i32 178, ; 269
	i32 91, ; 270
	i32 118, ; 271
	i32 309, ; 272
	i32 26, ; 273
	i32 214, ; 274
	i32 270, ; 275
	i32 94, ; 276
	i32 27, ; 277
	i32 245, ; 278
	i32 337, ; 279
	i32 169, ; 280
	i32 144, ; 281
	i32 222, ; 282
	i32 164, ; 283
	i32 4, ; 284
	i32 95, ; 285
	i32 32, ; 286
	i32 90, ; 287
	i32 292, ; 288
	i32 190, ; 289
	i32 21, ; 290
	i32 39, ; 291
	i32 165, ; 292
	i32 263, ; 293
	i32 195, ; 294
	i32 175, ; 295
	i32 277, ; 296
	i32 332, ; 297
	i32 308, ; 298
	i32 302, ; 299
	i32 282, ; 300
	i32 2, ; 301
	i32 326, ; 302
	i32 131, ; 303
	i32 108, ; 304
	i32 191, ; 305
	i32 230, ; 306
	i32 343, ; 307
	i32 232, ; 308
	i32 56, ; 309
	i32 92, ; 310
	i32 201, ; 311
	i32 37, ; 312
	i32 243, ; 313
	i32 181, ; 314
	i32 25, ; 315
	i32 91, ; 316
	i32 86, ; 317
	i32 96, ; 318
	i32 10, ; 319
	i32 84, ; 320
	i32 97, ; 321
	i32 329, ; 322
	i32 289, ; 323
	i32 185, ; 324
	i32 309, ; 325
	i32 234, ; 326
	i32 202, ; 327
	i32 7, ; 328
	i32 325, ; 329
	i32 181, ; 330
	i32 274, ; 331
	i32 314, ; 332
	i32 231, ; 333
	i32 196, ; 334
	i32 328, ; 335
	i32 85, ; 336
	i32 269, ; 337
	i32 149, ; 338
	i32 32, ; 339
	i32 113, ; 340
	i32 79, ; 341
	i32 215, ; 342
	i32 20, ; 343
	i32 11, ; 344
	i32 157, ; 345
	i32 3, ; 346
	i32 330, ; 347
	i32 168, ; 348
	i32 206, ; 349
	i32 337, ; 350
	i32 193, ; 351
	i32 191, ; 352
	i32 81, ; 353
	i32 189, ; 354
	i32 0, ; 355
	i32 313, ; 356
	i32 61, ; 357
	i32 296, ; 358
	i32 138, ; 359
	i32 278, ; 360
	i32 152, ; 361
	i32 178, ; 362
	i32 200, ; 363
	i32 39, ; 364
	i32 114, ; 365
	i32 186, ; 366
	i32 233, ; 367
	i32 322, ; 368
	i32 285, ; 369
	i32 341, ; 370
	i32 128, ; 371
	i32 72, ; 372
	i32 63, ; 373
	i32 167, ; 374
	i32 237, ; 375
	i32 138, ; 376
	i32 103, ; 377
	i32 146, ; 378
	i32 67, ; 379
	i32 151, ; 380
	i32 199, ; 381
	i32 342, ; 382
	i32 185, ; 383
	i32 118, ; 384
	i32 124, ; 385
	i32 147, ; 386
	i32 260, ; 387
	i32 136, ; 388
	i32 333, ; 389
	i32 247, ; 390
	i32 20, ; 391
	i32 14, ; 392
	i32 132, ; 393
	i32 72, ; 394
	i32 57, ; 395
	i32 212, ; 396
	i32 250, ; 397
	i32 162, ; 398
	i32 163, ; 399
	i32 204, ; 400
	i32 15, ; 401
	i32 71, ; 402
	i32 6, ; 403
	i32 23, ; 404
	i32 272, ; 405
	i32 339, ; 406
	i32 231, ; 407
	i32 88, ; 408
	i32 1, ; 409
	i32 228, ; 410
	i32 273, ; 411
	i32 295, ; 412
	i32 131, ; 413
	i32 66, ; 414
	i32 141, ; 415
	i32 313, ; 416
	i32 264, ; 417
	i32 192, ; 418
	i32 85, ; 419
	i32 93, ; 420
	i32 254, ; 421
	i32 259, ; 422
	i32 30, ; 423
	i32 223, ; 424
	i32 43, ; 425
	i32 268, ; 426
	i32 180, ; 427
	i32 199, ; 428
	i32 170, ; 429
	i32 226, ; 430
	i32 233, ; 431
	i32 106, ; 432
	i32 153, ; 433
	i32 34, ; 434
	i32 22, ; 435
	i32 171, ; 436
	i32 111, ; 437
	i32 55, ; 438
	i32 293, ; 439
	i32 139, ; 440
	i32 115, ; 441
	i32 117, ; 442
	i32 107, ; 443
	i32 235, ; 444
	i32 134, ; 445
	i32 241, ; 446
	i32 195, ; 447
	i32 52, ; 448
	i32 102, ; 449
	i32 209, ; 450
	i32 182, ; 451
	i32 205, ; 452
	i32 206, ; 453
	i32 130, ; 454
	i32 307, ; 455
	i32 298, ; 456
	i32 286, ; 457
	i32 264, ; 458
	i32 210, ; 459
	i32 208, ; 460
	i32 343, ; 461
	i32 154, ; 462
	i32 320, ; 463
	i32 251, ; 464
	i32 158, ; 465
	i32 129, ; 466
	i32 286, ; 467
	i32 156, ; 468
	i32 333, ; 469
	i32 275, ; 470
	i32 227, ; 471
	i32 180, ; 472
	i32 135, ; 473
	i32 298, ; 474
	i32 294, ; 475
	i32 319, ; 476
	i32 164, ; 477
	i32 207, ; 478
	i32 226, ; 479
	i32 173, ; 480
	i32 236, ; 481
	i32 303, ; 482
	i32 38, ; 483
	i32 338, ; 484
	i32 262, ; 485
	i32 78, ; 486
	i32 54, ; 487
	i32 36, ; 488
	i32 94, ; 489
	i32 161, ; 490
	i32 167, ; 491
	i32 299, ; 492
	i32 79, ; 493
	i32 238, ; 494
	i32 95, ; 495
	i32 29, ; 496
	i32 154, ; 497
	i32 217, ; 498
	i32 18, ; 499
	i32 124, ; 500
	i32 116, ; 501
	i32 258, ; 502
	i32 289, ; 503
	i32 271, ; 504
	i32 217, ; 505
	i32 291, ; 506
	i32 160, ; 507
	i32 266, ; 508
	i32 223, ; 509
	i32 348, ; 510
	i32 288, ; 511
	i32 279, ; 512
	i32 165, ; 513
	i32 16, ; 514
	i32 183, ; 515
	i32 139, ; 516
	i32 326, ; 517
	i32 202, ; 518
	i32 122, ; 519
	i32 115, ; 520
	i32 220, ; 521
	i32 112, ; 522
	i32 45, ; 523
	i32 137, ; 524
	i32 114, ; 525
	i32 33, ; 526
	i32 174, ; 527
	i32 92, ; 528
	i32 51, ; 529
	i32 280, ; 530
	i32 126, ; 531
	i32 148, ; 532
	i32 183, ; 533
	i32 24, ; 534
	i32 156, ; 535
	i32 257, ; 536
	i32 227, ; 537
	i32 143, ; 538
	i32 101, ; 539
	i32 86, ; 540
	i32 245, ; 541
	i32 58, ; 542
	i32 137, ; 543
	i32 97, ; 544
	i32 5, ; 545
	i32 13, ; 546
	i32 119, ; 547
	i32 132, ; 548
	i32 27, ; 549
	i32 198, ; 550
	i32 69, ; 551
	i32 255, ; 552
	i32 24, ; 553
	i32 243, ; 554
	i32 284, ; 555
	i32 281, ; 556
	i32 229, ; 557
	i32 213, ; 558
	i32 236, ; 559
	i32 252, ; 560
	i32 163, ; 561
	i32 200, ; 562
	i32 285, ; 563
	i32 98, ; 564
	i32 120, ; 565
	i32 256, ; 566
	i32 187, ; 567
	i32 158, ; 568
	i32 162, ; 569
	i32 259, ; 570
	i32 37, ; 571
	i32 203, ; 572
	i32 325, ; 573
	i32 17, ; 574
	i32 166, ; 575
	i32 338, ; 576
	i32 229, ; 577
	i32 145, ; 578
	i32 248, ; 579
	i32 150, ; 580
	i32 127, ; 581
	i32 19, ; 582
	i32 62, ; 583
	i32 344, ; 584
	i32 176, ; 585
	i32 216, ; 586
	i32 142, ; 587
	i32 170, ; 588
	i32 45, ; 589
	i32 225, ; 590
	i32 318, ; 591
	i32 234, ; 592
	i32 76, ; 593
	i32 59, ; 594
	i32 317, ; 595
	i32 103, ; 596
	i32 283, ; 597
	i32 238, ; 598
	i32 47, ; 599
	i32 269, ; 600
	i32 280, ; 601
	i32 14, ; 602
	i32 168, ; 603
	i32 335, ; 604
	i32 186, ; 605
	i32 65, ; 606
	i32 323, ; 607
	i32 166, ; 608
	i32 244, ; 609
	i32 248, ; 610
	i32 331, ; 611
	i32 219, ; 612
	i32 347, ; 613
	i32 197, ; 614
	i32 75, ; 615
	i32 253, ; 616
	i32 105, ; 617
	i32 237, ; 618
	i32 279, ; 619
	i32 64, ; 620
	i32 224, ; 621
	i32 218, ; 622
	i32 155, ; 623
	i32 215, ; 624
	i32 246, ; 625
	i32 10, ; 626
	i32 203, ; 627
	i32 11, ; 628
	i32 172, ; 629
	i32 75, ; 630
	i32 123, ; 631
	i32 80, ; 632
	i32 188, ; 633
	i32 63, ; 634
	i32 104, ; 635
	i32 62, ; 636
	i32 125, ; 637
	i32 119, ; 638
	i32 74, ; 639
	i32 294, ; 640
	i32 284, ; 641
	i32 346, ; 642
	i32 8, ; 643
	i32 252, ; 644
	i32 2, ; 645
	i32 42, ; 646
	i32 297, ; 647
	i32 151, ; 648
	i32 125, ; 649
	i32 282, ; 650
	i32 23, ; 651
	i32 130, ; 652
	i32 240, ; 653
	i32 271, ; 654
	i32 341, ; 655
	i32 323, ; 656
	i32 28, ; 657
	i32 239, ; 658
	i32 222, ; 659
	i32 60, ; 660
	i32 205, ; 661
	i32 87, ; 662
	i32 84, ; 663
	i32 327, ; 664
	i32 143, ; 665
	i32 207, ; 666
	i32 35, ; 667
	i32 83, ; 668
	i32 260, ; 669
	i32 184, ; 670
	i32 336, ; 671
	i32 334, ; 672
	i32 331, ; 673
	i32 187, ; 674
	i32 48, ; 675
	i32 6, ; 676
	i32 87, ; 677
	i32 21, ; 678
	i32 157, ; 679
	i32 93, ; 680
	i32 48, ; 681
	i32 110, ; 682
	i32 276, ; 683
	i32 127, ; 684
	i32 182, ; 685
	i32 73, ; 686
	i32 218, ; 687
	i32 0, ; 688
	i32 336, ; 689
	i32 253, ; 690
	i32 275, ; 691
	i32 7, ; 692
	i32 221, ; 693
	i32 204, ; 694
	i32 107, ; 695
	i32 276, ; 696
	i32 262 ; 697
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
