; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [352 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [698 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 259
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 194
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 166
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 207
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 56
	i64 210515253464952879, ; 5: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 246
	i64 229794953483747371, ; 6: System.ValueTuple.dll => 0x330654aed93802b => 146
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 287
	i64 295915112840604065, ; 8: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 290
	i64 316157742385208084, ; 9: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 253
	i64 350667413455104241, ; 10: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 129
	i64 422779754995088667, ; 11: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 54
	i64 435118502366263740, ; 12: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 289
	i64 545109961164950392, ; 13: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 321
	i64 560278790331054453, ; 14: System.Reflection.Primitives => 0x7c6829760de3975 => 92
	i64 634308326490598313, ; 15: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 272
	i64 649145001856603771, ; 16: System.Security.SecureString => 0x90239f09b62167b => 126
	i64 670564002081277297, ; 17: Microsoft.Identity.Client.dll => 0x94e526837380571 => 195
	i64 702024105029695270, ; 18: System.Drawing.Common => 0x9be17343c0e7726 => 219
	i64 750875890346172408, ; 19: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 140
	i64 798450721097591769, ; 20: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 247
	i64 799765834175365804, ; 21: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 22: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 324
	i64 870603111519317375, ; 23: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 214
	i64 872800313462103108, ; 24: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 258
	i64 895210737996778430, ; 25: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 273
	i64 937459790420187032, ; 26: Microsoft.SqlServer.Server.dll => 0xd0286b667351798 => 209
	i64 940822596282819491, ; 27: System.Transactions => 0xd0e792aa81923a3 => 145
	i64 960778385402502048, ; 28: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 101
	i64 1010599046655515943, ; 29: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 92
	i64 1055774368762298424, ; 30: ar/Microsoft.Maui.Controls.resources => 0xea6dd31d50a0038 => 314
	i64 1060858978308751610, ; 31: Azure.Core.dll => 0xeb8ed9ebee080fa => 170
	i64 1120440138749646132, ; 32: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 302
	i64 1121665720830085036, ; 33: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 332
	i64 1268860745194512059, ; 34: System.Drawing.dll => 0x119be62002c19ebb => 35
	i64 1278906455852160409, ; 35: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 182
	i64 1301485588176585670, ; 36: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 213
	i64 1301626418029409250, ; 37: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 27
	i64 1315114680217950157, ; 38: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 242
	i64 1369545283391376210, ; 39: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 280
	i64 1404195534211153682, ; 40: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 48
	i64 1425944114962822056, ; 41: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 112
	i64 1476839205573959279, ; 42: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 67
	i64 1486715745332614827, ; 43: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 204
	i64 1492954217099365037, ; 44: System.Net.HttpListener => 0x14b809f350210aad => 62
	i64 1513467482682125403, ; 45: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 165
	i64 1518315023656898250, ; 46: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 215
	i64 1537168428375924959, ; 47: System.Threading.Thread.dll => 0x15551e8a954ae0df => 140
	i64 1556147632182429976, ; 48: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 330
	i64 1576750169145655260, ; 49: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 301
	i64 1624659445732251991, ; 50: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 241
	i64 1628611045998245443, ; 51: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 276
	i64 1636321030536304333, ; 52: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 266
	i64 1643226597988041431, ; 53: pl/Microsoft.Maui.Controls.resources => 0x16cde9e27a8d02d7 => 334
	i64 1651782184287836205, ; 54: System.Globalization.Calendars => 0x16ec4f2524cb982d => 38
	i64 1659332977923810219, ; 55: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 86
	i64 1672383392659050004, ; 56: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 177
	i64 1682513316613008342, ; 57: System.Net.dll => 0x17597cf276952bd6 => 78
	i64 1731380447121279447, ; 58: Newtonsoft.Json => 0x18071957e9b889d7 => 211
	i64 1735388228521408345, ; 59: System.Net.Mail.dll => 0x181556663c69b759 => 63
	i64 1743969030606105336, ; 60: System.Memory.dll => 0x1833d297e88f2af8 => 60
	i64 1767386781656293639, ; 61: System.Private.Uri.dll => 0x188704e9f5582107 => 83
	i64 1795316252682057001, ; 62: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 240
	i64 1825687700144851180, ; 63: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 103
	i64 1836611346387731153, ; 64: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 287
	i64 1854145951182283680, ; 65: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 99
	i64 1865037103900624886, ; 66: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 175
	i64 1875417405349196092, ; 67: System.Drawing.Primitives => 0x1a06d2319b6c713c => 34
	i64 1875917498431009007, ; 68: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 237
	i64 1897575647115118287, ; 69: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 289
	i64 1920760634179481754, ; 70: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 205
	i64 1959996714666907089, ; 71: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 342
	i64 1972385128188460614, ; 72: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 116
	i64 1981742497975770890, ; 73: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 274
	i64 1983698669889758782, ; 74: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 316
	i64 2019660174692588140, ; 75: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 334
	i64 2040001226662520565, ; 76: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 137
	i64 2062890601515140263, ; 77: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 136
	i64 2064708342624596306, ; 78: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 310
	i64 2080945842184875448, ; 79: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 51
	i64 2102659300918482391, ; 80: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 34
	i64 2106033277907880740, ; 81: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 136
	i64 2133195048986300728, ; 82: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 211
	i64 2145898162032646099, ; 83: ko/Microsoft.Maui.Controls.resources => 0x1dc7c302481e97d3 => 330
	i64 2165310824878145998, ; 84: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 234
	i64 2165725771938924357, ; 85: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 244
	i64 2192948757939169934, ; 86: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 179
	i64 2200176636225660136, ; 87: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 192
	i64 2262844636196693701, ; 88: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 258
	i64 2287834202362508563, ; 89: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 90: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 91: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 338
	i64 2304837677853103545, ; 92: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 286
	i64 2315304989185124968, ; 93: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 49
	i64 2316229908869312383, ; 94: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 201
	i64 2329709569556905518, ; 95: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 269
	i64 2335503487726329082, ; 96: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 228
	i64 2337758774805907496, ; 97: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 98
	i64 2405413894731521496, ; 98: da/Microsoft.Maui.Controls.resources => 0x2161bf315d42ddd8 => 317
	i64 2470498323731680442, ; 99: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 251
	i64 2479423007379663237, ; 100: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 296
	i64 2492380397191429704, ; 101: cs/Microsoft.Maui.Controls.resources => 0x2296b6c41bbdfe48 => 316
	i64 2497223385847772520, ; 102: System.Runtime => 0x22a7eb7046413568 => 113
	i64 2547086958574651984, ; 103: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 235
	i64 2554797818648757682, ; 104: System.Runtime.Caching.dll => 0x23747714858085b2 => 225
	i64 2592350477072141967, ; 105: System.Xml.dll => 0x23f9e10627330e8f => 158
	i64 2612152650457191105, ; 106: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 202
	i64 2624866290265602282, ; 107: mscorlib.dll => 0x246d65fbde2db8ea => 161
	i64 2632269733008246987, ; 108: System.Net.NameResolution => 0x2487b36034f808cb => 64
	i64 2656907746661064104, ; 109: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 187
	i64 2706075432581334785, ; 110: System.Net.WebSockets => 0x258de944be6c0701 => 77
	i64 2783046991838674048, ; 111: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 98
	i64 2787234703088983483, ; 112: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 291
	i64 2789714023057451704, ; 113: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 198
	i64 2815524396660695947, ; 114: System.Security.AccessControl => 0x2712c0857f68238b => 114
	i64 2851879596360956261, ; 115: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 217
	i64 2923871038697555247, ; 116: Jsr305Binding => 0x2893ad37e69ec52f => 303
	i64 3017136373564924869, ; 117: System.Net.WebProxy => 0x29df058bd93f63c5 => 75
	i64 3017704767998173186, ; 118: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 302
	i64 3063847325783385934, ; 119: System.ClientModel.dll => 0x2a84f8e8eb59674e => 216
	i64 3106852385031680087, ; 120: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 111
	i64 3107556380337382748, ; 121: pt/Microsoft.Maui.Controls.resources => 0x2b2042103982255c => 336
	i64 3110390492489056344, ; 122: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 118
	i64 3135773902340015556, ; 123: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 46
	i64 3202009568827554833, ; 124: th/Microsoft.Maui.Controls.resources => 0x2c6fd2bce55e3c11 => 341
	i64 3238539556702659506, ; 125: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 210
	i64 3281594302220646930, ; 126: System.Security.Principal => 0x2d8a90a198ceba12 => 125
	i64 3289520064315143713, ; 127: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 267
	i64 3303437397778967116, ; 128: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 238
	i64 3311221304742556517, ; 129: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 79
	i64 3325875462027654285, ; 130: System.Runtime.Numerics => 0x2e27e21c8958b48d => 107
	i64 3328853167529574890, ; 131: System.Net.Sockets.dll => 0x2e327651a008c1ea => 72
	i64 3344514922410554693, ; 132: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 313
	i64 3402534845034375023, ; 133: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 221
	i64 3429672777697402584, ; 134: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 207
	i64 3437845325506641314, ; 135: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 51
	i64 3493805808809882663, ; 136: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 293
	i64 3494946837667399002, ; 137: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 185
	i64 3508450208084372758, ; 138: System.Net.Ping => 0x30b084e02d03ad16 => 66
	i64 3522470458906976663, ; 139: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 292
	i64 3523004241079211829, ; 140: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 184
	i64 3531994851595924923, ; 141: System.Numerics => 0x31042a9aade235bb => 80
	i64 3549717702734975447, ; 142: MauiIcons.FontAwesome => 0x31432171846f11d7 => 169
	i64 3551103847008531295, ; 143: System.Private.CoreLib.dll => 0x31480e226177735f => 167
	i64 3571415421602489686, ; 144: System.Runtime.dll => 0x319037675df7e556 => 113
	i64 3638003163729360188, ; 145: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 186
	i64 3647754201059316852, ; 146: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 151
	i64 3655542548057982301, ; 147: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 185
	i64 3659371656528649588, ; 148: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 232
	i64 3716579019761409177, ; 149: netstandard.dll => 0x3393f0ed5c8c5c99 => 162
	i64 3727469159507183293, ; 150: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 285
	i64 3772598417116884899, ; 151: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 259
	i64 3869221888984012293, ; 152: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 190
	i64 3869649043256705283, ; 153: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 31
	i64 3890352374528606784, ; 154: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 205
	i64 3919223565570527920, ; 155: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 119
	i64 3933965368022646939, ; 156: System.Net.Requests => 0x369840a8bfadc09b => 69
	i64 3966267475168208030, ; 157: System.Memory => 0x370b03412596249e => 60
	i64 4006972109285359177, ; 158: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 156
	i64 4009997192427317104, ; 159: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 110
	i64 4073500526318903918, ; 160: System.Private.Xml.dll => 0x3887fb25779ae26e => 85
	i64 4073631083018132676, ; 161: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 203
	i64 4148881117810174540, ; 162: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 102
	i64 4154383907710350974, ; 163: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 164: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 141
	i64 4168469861834746866, ; 165: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 115
	i64 4187479170553454871, ; 166: System.Linq.Expressions => 0x3a1cea1e912fa117 => 56
	i64 4201423742386704971, ; 167: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 253
	i64 4205801962323029395, ; 168: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 169: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 50
	i64 4282138915307457788, ; 170: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 89
	i64 4337444564132831293, ; 171: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 212
	i64 4356591372459378815, ; 172: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 344
	i64 4373617458794931033, ; 173: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 53
	i64 4397634830160618470, ; 174: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 126
	i64 4477672992252076438, ; 175: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 147
	i64 4484706122338676047, ; 176: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 39
	i64 4513320955448359355, ; 177: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 180
	i64 4533124835995628778, ; 178: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 89
	i64 4612482779465751747, ; 179: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 179
	i64 4636684751163556186, ; 180: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 297
	i64 4672453897036726049, ; 181: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 48
	i64 4679594760078841447, ; 182: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 314
	i64 4716677666592453464, ; 183: System.Xml.XmlSerializer => 0x417501590542f358 => 157
	i64 4743821336939966868, ; 184: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 185: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 271
	i64 4794310189461587505, ; 186: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 235
	i64 4795410492532947900, ; 187: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 292
	i64 4809057822547766521, ; 188: System.Drawing => 0x42bd349c3145ecf9 => 35
	i64 4814660307502931973, ; 189: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 64
	i64 4835744211636393215, ; 190: fi/Microsoft.Maui.Controls.resources => 0x431c03bd573d14ff => 321
	i64 4853321196694829351, ; 191: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 106
	i64 5055365687667823624, ; 192: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 236
	i64 5081566143765835342, ; 193: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 96
	i64 5099468265966638712, ; 194: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 96
	i64 5103417709280584325, ; 195: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5129462924058778861, ; 196: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 177
	i64 5182934613077526976, ; 197: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 198: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 278
	i64 5244375036463807528, ; 199: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 200: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 125
	i64 5278787618751394462, ; 201: System.Net.WebClient.dll => 0x4942055efc68329e => 73
	i64 5280980186044710147, ; 202: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 270
	i64 5290786973231294105, ; 203: System.Runtime.Loader => 0x496ca6b869b72699 => 106
	i64 5376510917114486089, ; 204: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 296
	i64 5408338804355907810, ; 205: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 294
	i64 5423376490970181369, ; 206: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 103
	i64 5440320908473006344, ; 207: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 208: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 209: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 249
	i64 5457765010617926378, ; 210: System.Xml.Serialization => 0x4bbde05c557002ea => 152
	i64 5488847537322884930, ; 211: System.Windows.Extensions => 0x4c2c4dc108687f42 => 230
	i64 5507995362134886206, ; 212: System.Core.dll => 0x4c705499688c873e => 21
	i64 5527431512186326818, ; 213: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 47
	i64 5570799893513421663, ; 214: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 41
	i64 5573260873512690141, ; 215: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 123
	i64 5574231584441077149, ; 216: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 239
	i64 5591791169662171124, ; 217: System.Linq.Parallel => 0x4d9a087135e137f4 => 57
	i64 5650097808083101034, ; 218: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 116
	i64 5692067934154308417, ; 219: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 299
	i64 5724799082821825042, ; 220: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 262
	i64 5757522595884336624, ; 221: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 248
	i64 5783556987928984683, ; 222: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 223: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 268
	i64 5939174725034091446, ; 224: pt-BR/Microsoft.Maui.Controls.resources => 0x526c2ff200a2a3b6 => 335
	i64 5959344983920014087, ; 225: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 288
	i64 5979151488806146654, ; 226: System.Formats.Asn1 => 0x52fa3699a489d25e => 220
	i64 5984759512290286505, ; 227: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 121
	i64 6068057819846744445, ; 228: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 337
	i64 6102788177522843259, ; 229: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 288
	i64 6183170893902868313, ; 230: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 212
	i64 6222399776351216807, ; 231: System.Text.Json.dll => 0x565a67a0ffe264a7 => 229
	i64 6251069312384999852, ; 232: System.Transactions.Local => 0x56c0426b870da1ac => 144
	i64 6278736998281604212, ; 233: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 82
	i64 6284145129771520194, ; 234: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 87
	i64 6319713645133255417, ; 235: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 272
	i64 6357457916754632952, ; 236: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 348
	i64 6401687960814735282, ; 237: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 269
	i64 6504860066809920875, ; 238: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 244
	i64 6548213210057960872, ; 239: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 255
	i64 6557084851308642443, ; 240: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 300
	i64 6560151584539558821, ; 241: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 193
	i64 6589202984700901502, ; 242: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 305
	i64 6591971792923354531, ; 243: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 270
	i64 6617685658146568858, ; 244: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 130
	i64 6713440830605852118, ; 245: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 93
	i64 6734140735192831707, ; 246: uk/Microsoft.Maui.Controls.resources => 0x5d747951d4a816db => 343
	i64 6739853162153639747, ; 247: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6772837112740759457, ; 248: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 102
	i64 6777482997383978746, ; 249: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 336
	i64 6786606130239981554, ; 250: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 32
	i64 6798329586179154312, ; 251: System.Windows => 0x5e5884bd523ca188 => 149
	i64 6814185388980153342, ; 252: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 153
	i64 6876862101832370452, ; 253: System.Xml.Linq => 0x5f6f85a57d108914 => 150
	i64 6894844156784520562, ; 254: System.Numerics.Vectors => 0x5faf683aead1ad72 => 79
	i64 7011053663211085209, ; 255: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 264
	i64 7060896174307865760, ; 256: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 138
	i64 7083547580668757502, ; 257: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 84
	i64 7101497697220435230, ; 258: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 259: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 265
	i64 7112547816752919026, ; 260: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 49
	i64 7192745174564810625, ; 261: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 234
	i64 7220009545223068405, ; 262: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 340
	i64 7270811800166795866, ; 263: System.Linq => 0x64e71ccf51a90a5a => 59
	i64 7299370801165188114, ; 264: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 52
	i64 7316205155833392065, ; 265: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 266: System.Reflection => 0x65d67f295d0740ad => 94
	i64 7348123982286201829, ; 267: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 223
	i64 7349431895026339542, ; 268: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 233
	i64 7377312882064240630, ; 269: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7439799228237803094, ; 270: it/Microsoft.Maui.Controls.resources => 0x673f79faf756ee56 => 328
	i64 7488575175965059935, ; 271: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 150
	i64 7489048572193775167, ; 272: System.ObjectModel => 0x67ee71ff6b419e3f => 81
	i64 7496222613193209122, ; 273: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 221
	i64 7554287652784848386, ; 274: MauiIcons.Core => 0x68d638988b5c3e02 => 168
	i64 7592577537120840276, ; 275: System.Diagnostics.Process => 0x695e410af5b2aa54 => 28
	i64 7637303409920963731, ; 276: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 43
	i64 7642002156153824904, ; 277: ro/Microsoft.Maui.Controls.resources => 0x6a0dd878d2516688 => 337
	i64 7654504624184590948, ; 278: System.Net.Http => 0x6a3a4366801b8264 => 61
	i64 7694700312542370399, ; 279: System.Net.Mail => 0x6ac9112a7e2cda5f => 63
	i64 7708790323521193081, ; 280: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 331
	i64 7714652370974252055, ; 281: System.Private.CoreLib => 0x6b0ff375198b9c17 => 167
	i64 7725404731275645577, ; 282: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 273
	i64 7735176074855944702, ; 283: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 284: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 308
	i64 7736537285947352190, ; 285: MauiIcons.FontAwesome.dll => 0x6b5db3abf074e47e => 169
	i64 7791074099216502080, ; 286: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 45
	i64 7820441508502274321, ; 287: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 288: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 241
	i64 7972383140441761405, ; 289: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 183
	i64 8025517457475554965, ; 290: WindowsBase => 0x6f605d9b4786ce95 => 160
	i64 8031450141206250471, ; 291: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 105
	i64 8064050204834738623, ; 292: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 293: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 267
	i64 8085230611270010360, ; 294: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 224
	i64 8087206902342787202, ; 295: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 218
	i64 8103644804370223335, ; 296: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 297: System.Reflection.Extensions => 0x70995ab73cf916ec => 90
	i64 8167236081217502503, ; 298: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 163
	i64 8185542183669246576, ; 299: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 300: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 312
	i64 8234598844743906698, ; 301: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 196
	i64 8246048515196606205, ; 302: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 208
	i64 8264926008854159966, ; 303: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 28
	i64 8290740647658429042, ; 304: System.Runtime.Extensions => 0x730ea0b15c929a72 => 100
	i64 8318905602908530212, ; 305: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 306: System.Security.Cryptography => 0x7423997c6fd56140 => 123
	i64 8398329775253868912, ; 307: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 250
	i64 8400357532724379117, ; 308: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 282
	i64 8410671156615598628, ; 309: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 88
	i64 8426919725312979251, ; 310: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 271
	i64 8476857680833348370, ; 311: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 227
	i64 8513291706828295435, ; 312: Microsoft.SqlServer.Server => 0x762549b3b6c78d0b => 209
	i64 8515752553183989521, ; 313: el/Microsoft.Maui.Controls.resources => 0x762e07d427a84f11 => 319
	i64 8518412311883997971, ; 314: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8557640666902467377, ; 315: tr/Microsoft.Maui.Controls.resources => 0x76c2d8d8a2289331 => 342
	i64 8563666267364444763, ; 316: System.Private.Uri => 0x76d841191140ca5b => 83
	i64 8573305974629105867, ; 317: sk/Microsoft.Maui.Controls.resources => 0x76fa805c508080cb => 339
	i64 8598790081731763592, ; 318: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 261
	i64 8599632406834268464, ; 319: CommunityToolkit.Maui => 0x7758081c784b4930 => 172
	i64 8601935802264776013, ; 320: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 294
	i64 8614108721271900878, ; 321: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 335
	i64 8623059219396073920, ; 322: System.Net.Quic.dll => 0x77ab42ac514299c0 => 68
	i64 8626175481042262068, ; 323: Java.Interop => 0x77b654e585b55834 => 163
	i64 8638972117149407195, ; 324: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 325: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 281
	i64 8648495978913578441, ; 326: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8684531736582871431, ; 327: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 42
	i64 8725526185868997716, ; 328: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 218
	i64 8853378295825400934, ; 329: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 309
	i64 8906941675023136603, ; 330: he/Microsoft.Maui.Controls.resources => 0x7b9bd0432ee0775b => 323
	i64 8941376889969657626, ; 331: System.Xml.XDocument => 0x7c1626e87187471a => 153
	i64 8951477988056063522, ; 332: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 284
	i64 8954753533646919997, ; 333: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 109
	i64 8955323522379913726, ; 334: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 195
	i64 9052662452269567435, ; 335: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 200
	i64 9111603110219107042, ; 336: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 184
	i64 9138683372487561558, ; 337: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 118
	i64 9250544137016314866, ; 338: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 178
	i64 9312692141327339315, ; 339: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 299
	i64 9324707631942237306, ; 340: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 240
	i64 9427266486299436557, ; 341: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 199
	i64 9468215723722196442, ; 342: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 154
	i64 9500688326720985260, ; 343: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 182
	i64 9554839972845591462, ; 344: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 128
	i64 9575902398040817096, ; 345: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 304
	i64 9584643793929893533, ; 346: System.IO.dll => 0x85037ebfbbd7f69d => 55
	i64 9659729154652888475, ; 347: System.Text.RegularExpressions => 0x860e407c9991dd9b => 133
	i64 9662334977499516867, ; 348: System.Numerics.dll => 0x8617827802b0cfc3 => 80
	i64 9667360217193089419, ; 349: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 29
	i64 9678050649315576968, ; 350: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 251
	i64 9702891218465930390, ; 351: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 352: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 301
	i64 9808709177481450983, ; 353: Mono.Android.dll => 0x881f890734e555e7 => 166
	i64 9819168441846169364, ; 354: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 200
	i64 9825649861376906464, ; 355: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 248
	i64 9834056768316610435, ; 356: System.Transactions.dll => 0x8879968718899783 => 145
	i64 9836529246295212050, ; 357: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 91
	i64 9864956466380592553, ; 358: Microsoft.EntityFrameworkCore.Sqlite => 0x88e75da3af4ed5a9 => 181
	i64 9884103019517044980, ; 359: hi/Microsoft.Maui.Controls.resources => 0x892b6353f9ade8f4 => 324
	i64 9907349773706910547, ; 360: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 261
	i64 9933555792566666578, ; 361: System.Linq.Queryable.dll => 0x89db145cf475c552 => 58
	i64 9956195530459977388, ; 362: Microsoft.Maui => 0x8a2b8315b36616ac => 206
	i64 9974604633896246661, ; 363: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 152
	i64 9991543690424095600, ; 364: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 320
	i64 10017511394021241210, ; 365: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 192
	i64 10038780035334861115, ; 366: System.Net.Http.dll => 0x8b50e941206af13b => 61
	i64 10051358222726253779, ; 367: System.Private.Xml => 0x8b7d990c97ccccd3 => 85
	i64 10071436289833757335, ; 368: Focusly.dll => 0x8bc4edf1e184ea97 => 0
	i64 10078727084704864206, ; 369: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 76
	i64 10089571585547156312, ; 370: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 45
	i64 10092835686693276772, ; 371: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 204
	i64 10105485790837105934, ; 372: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 138
	i64 10226222362177979215, ; 373: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 310
	i64 10226489408795347955, ; 374: sv/Microsoft.Maui.Controls.resources => 0x8debc9ef5e8a8bf3 => 340
	i64 10229024438826829339, ; 375: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 255
	i64 10236703004850800690, ; 376: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 71
	i64 10245369515835430794, ; 377: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 88
	i64 10321854143672141184, ; 378: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 307
	i64 10360651442923773544, ; 379: System.Text.Encoding => 0x8fc86d98211c1e68 => 132
	i64 10364469296367737616, ; 380: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 87
	i64 10376576884623852283, ; 381: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 293
	i64 10406448008575299332, ; 382: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 313
	i64 10430153318873392755, ; 383: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 252
	i64 10447083246144586668, ; 384: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 175
	i64 10546663366131771576, ; 385: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 109
	i64 10566960649245365243, ; 386: System.Globalization.dll => 0x92a562b96dcd13fb => 40
	i64 10595762989148858956, ; 387: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 154
	i64 10670374202010151210, ; 388: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 389: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 100
	i64 10785150219063592792, ; 390: System.Net.Primitives => 0x95ac8cfb68830758 => 67
	i64 10811915265162633087, ; 391: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 180
	i64 10822644899632537592, ; 392: System.Linq.Queryable => 0x9631c23204ca5ff8 => 58
	i64 10830817578243619689, ; 393: System.Formats.Tar => 0x964ecb340a447b69 => 37
	i64 10847732767863316357, ; 394: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 242
	i64 10880838204485145808, ; 395: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 172
	i64 10889380495983713167, ; 396: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 176
	i64 10899834349646441345, ; 397: System.Web => 0x9743fd975946eb81 => 148
	i64 10943875058216066601, ; 398: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 54
	i64 10964653383833615866, ; 399: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 33
	i64 10984274332520666918, ; 400: zh-Hant/Microsoft.Maui.Controls.resources => 0x986ffb4ee955d726 => 347
	i64 11002576679268595294, ; 401: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 191
	i64 11009005086950030778, ; 402: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 206
	i64 11019817191295005410, ; 403: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 239
	i64 11023048688141570732, ; 404: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 405: System.Xml => 0x992e31d0412bf7fc => 158
	i64 11047101296015504039, ; 406: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 210
	i64 11071824625609515081, ; 407: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 305
	i64 11128133081269842136, ; 408: vi/Microsoft.Maui.Controls.resources => 0x9a6f1213fa5cb0d8 => 344
	i64 11136029745144976707, ; 409: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 303
	i64 11150130305267896488, ; 410: zh-Hans/Microsoft.Maui.Controls.resources => 0x9abd386fcccf90a8 => 346
	i64 11162124722117608902, ; 411: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 298
	i64 11188319605227840848, ; 412: System.Threading.Overlapped => 0x9b44e5671724e550 => 135
	i64 11226290749488709958, ; 413: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 193
	i64 11235648312900863002, ; 414: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 86
	i64 11329751333533450475, ; 415: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 142
	i64 11340910727871153756, ; 416: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 254
	i64 11341245327015630248, ; 417: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 217
	i64 11347436699239206956, ; 418: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 157
	i64 11392833485892708388, ; 419: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 283
	i64 11398376662953476300, ; 420: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x9e2f2b2f0b71c0cc => 181
	i64 11432101114902388181, ; 421: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 422: Mono.Android.Export => 0x9edabf8623efc131 => 164
	i64 11448276831755070604, ; 423: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 30
	i64 11485890710487134646, ; 424: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 104
	i64 11508496261504176197, ; 425: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 264
	i64 11513602507638267977, ; 426: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 222
	i64 11517440453979132662, ; 427: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 197
	i64 11529969570048099689, ; 428: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 298
	i64 11530571088791430846, ; 429: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 190
	i64 11580057168383206117, ; 430: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 237
	i64 11591352189662810718, ; 431: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 291
	i64 11597940890313164233, ; 432: netstandard => 0xa0f429ca8d1805c9 => 162
	i64 11672361001936329215, ; 433: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 265
	i64 11692977985522001935, ; 434: System.Threading.Overlapped.dll => 0xa245cd869980680f => 135
	i64 11705530742807338875, ; 435: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 323
	i64 11707554492040141440, ; 436: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 57
	i64 11743665907891708234, ; 437: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 139
	i64 11888774080858266727, ; 438: hu/Microsoft.Maui.Controls.resources => 0xa4fd6909806d9c67 => 326
	i64 11991047634523762324, ; 439: System.Net => 0xa668c24ad493ae94 => 78
	i64 12011556116648931059, ; 440: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 226
	i64 12040886584167504988, ; 441: System.Net.ServicePoint => 0xa719d28d8e121c5c => 71
	i64 12063623837170009990, ; 442: System.Security => 0xa76a99f6ce740786 => 127
	i64 12096697103934194533, ; 443: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 444: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 445: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 90
	i64 12124060477258521817, ; 446: id/Microsoft.Maui.Controls.resources => 0xa84150c49e58dcd9 => 327
	i64 12137774235383566651, ; 447: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 295
	i64 12145679461940342714, ; 448: System.Text.Json => 0xa88e1f1ebcb62fba => 229
	i64 12191646537372739477, ; 449: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 231
	i64 12198439281774268251, ; 450: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 201
	i64 12201331334810686224, ; 451: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 110
	i64 12269460666702402136, ; 452: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12279246230491828964, ; 453: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 215
	i64 12313367145828839434, ; 454: System.IO.Pipelines => 0xaae1de2e1c17f00a => 222
	i64 12332222936682028543, ; 455: System.Runtime.Handles => 0xab24db6c07db5dff => 101
	i64 12341818387765915815, ; 456: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 173
	i64 12375446203996702057, ; 457: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 458: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 198
	i64 12451044538927396471, ; 459: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 263
	i64 12466513435562512481, ; 460: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 277
	i64 12475113361194491050, ; 461: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 348
	i64 12487638416075308985, ; 462: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 257
	i64 12493213219680520345, ; 463: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 176
	i64 12517810545449516888, ; 464: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 32
	i64 12533156002265635263, ; 465: ru/Microsoft.Maui.Controls.resources => 0xadeeb6fb059919bf => 338
	i64 12538491095302438457, ; 466: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 245
	i64 12550732019250633519, ; 467: System.IO.Compression => 0xae2d28465e8e1b2f => 44
	i64 12681088699309157496, ; 468: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 328
	i64 12699999919562409296, ; 469: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 29
	i64 12700543734426720211, ; 470: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 246
	i64 12708238894395270091, ; 471: System.IO => 0xb05cbbf17d3ba3cb => 55
	i64 12708922737231849740, ; 472: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 131
	i64 12717050818822477433, ; 473: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 111
	i64 12753841065332862057, ; 474: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 300
	i64 12823819093633476069, ; 475: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 341
	i64 12828192437253469131, ; 476: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 311
	i64 12835242264250840079, ; 477: System.IO.Pipes => 0xb21ff0d5d6c0740f => 53
	i64 12843321153144804894, ; 478: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 194
	i64 12843770487262409629, ; 479: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 480: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 74
	i64 12963446364377008305, ; 481: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 219
	i64 12982280885948128408, ; 482: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 256
	i64 13068258254871114833, ; 483: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 108
	i64 13129914918964716986, ; 484: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 260
	i64 13162471042547327635, ; 485: System.Security.Permissions => 0xb6aa7dace9662293 => 227
	i64 13173818576982874404, ; 486: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 99
	i64 13221551921002590604, ; 487: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 315
	i64 13222659110913276082, ; 488: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 329
	i64 13239674268801700939, ; 489: ca/Microsoft.Maui.Controls.resources => 0xb7bcc599c5ce144b => 315
	i64 13343850469010654401, ; 490: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 165
	i64 13370592475155966277, ; 491: System.Runtime.Serialization => 0xb98de304062ea945 => 112
	i64 13401370062847626945, ; 492: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 295
	i64 13404347523447273790, ; 493: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 250
	i64 13431476299110033919, ; 494: System.Net.WebClient => 0xba663087f18829ff => 73
	i64 13454009404024712428, ; 495: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 306
	i64 13463706743370286408, ; 496: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 82
	i64 13465488254036897740, ; 497: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 308
	i64 13467053111158216594, ; 498: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 343
	i64 13491513212026656886, ; 499: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 243
	i64 13545416393490209236, ; 500: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 327
	i64 13572454107664307259, ; 501: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 285
	i64 13578472628727169633, ; 502: System.Xml.XPath => 0xbc706ce9fba5c261 => 155
	i64 13580399111273692417, ; 503: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 504: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 256
	i64 13647894001087880694, ; 505: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 506: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 236
	i64 13702626353344114072, ; 507: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 31
	i64 13710614125866346983, ; 508: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 114
	i64 13713329104121190199, ; 509: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 36
	i64 13717397318615465333, ; 510: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13742054908850494594, ; 511: Azure.Identity => 0xbeb596218df25c82 => 171
	i64 13755568601956062840, ; 512: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 322
	i64 13768883594457632599, ; 513: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 50
	i64 13814445057219246765, ; 514: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 325
	i64 13828521679616088467, ; 515: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 309
	i64 13881769479078963060, ; 516: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 517: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 230
	i64 13911222732217019342, ; 518: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 120
	i64 13928444506500929300, ; 519: System.Windows.dll => 0xc14bc67b8bba9714 => 149
	i64 13955418299340266673, ; 520: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 189
	i64 13959074834287824816, ; 521: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 263
	i64 14075334701871371868, ; 522: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 128
	i64 14100563506285742564, ; 523: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 317
	i64 14124974489674258913, ; 524: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 245
	i64 14125464355221830302, ; 525: System.Threading.dll => 0xc407bafdbc707a9e => 143
	i64 14133832980772275001, ; 526: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 178
	i64 14178052285788134900, ; 527: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 232
	i64 14212104595480609394, ; 528: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 117
	i64 14220608275227875801, ; 529: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 27
	i64 14226382999226559092, ; 530: System.ServiceProcess => 0xc56e43f6938e2a74 => 129
	i64 14232023429000439693, ; 531: System.Resources.Writer.dll => 0xc5824de7789ba78d => 97
	i64 14254574811015963973, ; 532: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 131
	i64 14261073672896646636, ; 533: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 283
	i64 14298246716367104064, ; 534: System.Web.dll => 0xc66d93a217f4e840 => 148
	i64 14327695147300244862, ; 535: System.Reflection.dll => 0xc6d632d338eb4d7e => 94
	i64 14327709162229390963, ; 536: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 122
	i64 14331727281556788554, ; 537: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 233
	i64 14346402571976470310, ; 538: System.Net.Ping.dll => 0xc718a920f3686f26 => 66
	i64 14461014870687870182, ; 539: System.Net.Requests.dll => 0xc8afd8683afdece6 => 69
	i64 14486659737292545672, ; 540: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 268
	i64 14495724990987328804, ; 541: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 286
	i64 14522721392235705434, ; 542: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 319
	i64 14551742072151931844, ; 543: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 228
	i64 14556034074661724008, ; 544: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 173
	i64 14561513370130550166, ; 545: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 121
	i64 14574160591280636898, ; 546: System.Net.Quic => 0xca41d1d72ec783e2 => 68
	i64 14622043554576106986, ; 547: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 108
	i64 14644440854989303794, ; 548: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 278
	i64 14648804764802849406, ; 549: Azure.Identity.dll => 0xcb4b0252261f9a7e => 171
	i64 14669215534098758659, ; 550: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 187
	i64 14690985099581930927, ; 551: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 147
	i64 14792063746108907174, ; 552: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 306
	i64 14832630590065248058, ; 553: System.Security.Claims => 0xcdd816ef5d6e873a => 115
	i64 14852515768018889994, ; 554: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 254
	i64 14889905118082851278, ; 555: GoogleGson.dll => 0xcea391d0969961ce => 174
	i64 14892012299694389861, ; 556: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 347
	i64 14912225920358050525, ; 557: System.Security.Principal.Windows => 0xcef2de7759506add => 124
	i64 14935719434541007538, ; 558: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 130
	i64 14954917835170835695, ; 559: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 188
	i64 14984936317414011727, ; 560: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 74
	i64 14987728460634540364, ; 561: System.IO.Compression.dll => 0xcfff1ba06622494c => 44
	i64 14988210264188246988, ; 562: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 257
	i64 15015154896917945444, ; 563: System.Net.Security.dll => 0xd0608bd33642dc64 => 70
	i64 15024878362326791334, ; 564: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 224
	i64 15071021337266399595, ; 565: System.Resources.Reader.dll => 0xd127060e7a18a96b => 95
	i64 15076659072870671916, ; 566: System.ObjectModel.dll => 0xd13b0d8c1620662c => 81
	i64 15115185479366240210, ; 567: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 41
	i64 15133485256822086103, ; 568: System.Linq.dll => 0xd204f0a9127dd9d7 => 59
	i64 15138356091203993725, ; 569: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 197
	i64 15150743910298169673, ; 570: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 284
	i64 15227001540531775957, ; 571: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 186
	i64 15234786388537674379, ; 572: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 36
	i64 15250465174479574862, ; 573: System.Globalization.Calendars.dll => 0xd3a489469852174e => 38
	i64 15272359115529052076, ; 574: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 247
	i64 15273147323526128252, ; 575: de/Microsoft.Maui.Controls.resources => 0xd3f51e91f4fba27c => 318
	i64 15279429628684179188, ; 576: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 312
	i64 15299439993936780255, ; 577: System.Xml.XPath.dll => 0xd452879d55019bdf => 155
	i64 15338463749992804988, ; 578: System.Resources.Reader => 0xd4dd2b839286f27c => 95
	i64 15370334346939861994, ; 579: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 252
	i64 15383240894167415497, ; 580: System.Memory.Data => 0xd57c4016df1c7ac9 => 223
	i64 15391712275433856905, ; 581: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 188
	i64 15443314347085689186, ; 582: nl/Microsoft.Maui.Controls.resources => 0xd651ac9394bc7162 => 333
	i64 15474781042002767710, ; 583: hr/Microsoft.Maui.Controls.resources => 0xd6c1775e69862f5e => 325
	i64 15478373401424648762, ; 584: es/Microsoft.Maui.Controls.resources => 0xd6ce3a99c4c55a3a => 320
	i64 15526743539506359484, ; 585: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 132
	i64 15527772828719725935, ; 586: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 587: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 62
	i64 15541854775306130054, ; 588: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 122
	i64 15557562860424774966, ; 589: System.Net.Sockets => 0xd7e790fe7a6dc536 => 72
	i64 15582737692548360875, ; 590: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 276
	i64 15609085926864131306, ; 591: System.dll => 0xd89e9cf3334914ea => 159
	i64 15620595871140898079, ; 592: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 189
	i64 15661133872274321916, ; 593: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 151
	i64 15664356999916475676, ; 594: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 318
	i64 15710114879900314733, ; 595: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 596: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 326
	i64 15755368083429170162, ; 597: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 47
	i64 15777549416145007739, ; 598: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 290
	i64 15817206913877585035, ; 599: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 139
	i64 15847085070278954535, ; 600: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 134
	i64 15885744048853936810, ; 601: System.Resources.Writer => 0xdc75800bd0b6eaaa => 97
	i64 15928521404965645318, ; 602: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 203
	i64 15934062614519587357, ; 603: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 120
	i64 15937190497610202713, ; 604: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 117
	i64 15963349826457351533, ; 605: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 137
	i64 15971679995444160383, ; 606: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 37
	i64 15995174293784908801, ; 607: nb/Microsoft.Maui.Controls.resources => 0xddfa46462d825401 => 332
	i64 16018552496348375205, ; 608: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 65
	i64 16054465462676478687, ; 609: System.Globalization.Extensions => 0xdecceb47319bdadf => 39
	i64 16150984484268837188, ; 610: Focusly => 0xe023d2d11db08944 => 0
	i64 16154507427712707110, ; 611: System => 0xe03056ea4e39aa26 => 159
	i64 16198848395322856833, ; 612: ms/Microsoft.Maui.Controls.resources => 0xe0cddeca55a01581 => 331
	i64 16219561732052121626, ; 613: System.Net.Security => 0xe1177575db7c781a => 70
	i64 16315482530584035869, ; 614: WindowsBase.dll => 0xe26c3ceb1e8d821d => 160
	i64 16321164108206115771, ; 615: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 191
	i64 16337011941688632206, ; 616: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 124
	i64 16361933716545543812, ; 617: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 262
	i64 16380036236984929981, ; 618: MauiIcons.Core.dll => 0xe351942c21834ebd => 168
	i64 16423015068819898779, ; 619: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 311
	i64 16454459195343277943, ; 620: System.Net.NetworkInformation => 0xe459fb756d988f77 => 65
	i64 16491294355724214223, ; 621: zh-HK/Microsoft.Maui.Controls.resources => 0xe4dcd8d787589fcf => 345
	i64 16496768397145114574, ; 622: Mono.Android.Export.dll => 0xe4f04b741db987ce => 164
	i64 16589693266713801121, ; 623: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 275
	i64 16621146507174665210, ; 624: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 249
	i64 16649148416072044166, ; 625: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 208
	i64 16677317093839702854, ; 626: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 282
	i64 16702652415771857902, ; 627: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 146
	i64 16709499819875633724, ; 628: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 43
	i64 16737304880976948124, ; 629: ja/Microsoft.Maui.Controls.resources => 0xe846da1c780aeb9c => 329
	i64 16737807731308835127, ; 630: System.Runtime.Intrinsics => 0xe848a3736f733137 => 105
	i64 16755018182064898362, ; 631: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 213
	i64 16758309481308491337, ; 632: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 46
	i64 16762783179241323229, ; 633: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 93
	i64 16765015072123548030, ; 634: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 30
	i64 16822611501064131242, ; 635: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 636: mscorlib => 0xe99c30c1484d7f4f => 161
	i64 16856067890322379635, ; 637: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 638: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 133
	i64 16933958494752847024, ; 639: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 75
	i64 16945858842201062480, ; 640: Azure.Core => 0xeb2bc8d57f4e7c50 => 170
	i64 16977952268158210142, ; 641: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 52
	i64 16989020923549080504, ; 642: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 275
	i64 16998075588627545693, ; 643: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 280
	i64 17006954551347072385, ; 644: System.ClientModel => 0xec04d70ec8414d81 => 216
	i64 17008137082415910100, ; 645: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 646: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 238
	i64 17031351772568316411, ; 647: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 279
	i64 17037200463775726619, ; 648: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 266
	i64 17062143951396181894, ; 649: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 650: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 346
	i64 17118171214553292978, ; 651: System.Threading.Channels => 0xed8ff6060fc420b2 => 134
	i64 17137864900836977098, ; 652: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 202
	i64 17187273293601214786, ; 653: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17197986060146327831, ; 654: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 196
	i64 17201328579425343169, ; 655: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 656: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 119
	i64 17230721278011714856, ; 657: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 84
	i64 17234219099804750107, ; 658: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 144
	i64 17260702271250283638, ; 659: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 660: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 33
	i64 17338386382517543202, ; 661: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 76
	i64 17360349973592121190, ; 662: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 304
	i64 17371436720558481852, ; 663: System.Runtime.Caching => 0xf113bda8d710a1bc => 225
	i64 17438153253682247751, ; 664: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 339
	i64 17470386307322966175, ; 665: System.Threading.Timer => 0xf27347c8d0d5709f => 142
	i64 17482873938501421891, ; 666: fr/Microsoft.Maui.Controls.resources => 0xf29fa538054fcb43 => 322
	i64 17509662556995089465, ; 667: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 77
	i64 17522591619082469157, ; 668: GoogleGson => 0xf32cc03d27a5bf25 => 174
	i64 17523946658117960076, ; 669: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 226
	i64 17590473451926037903, ; 670: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 231
	i64 17627500474728259406, ; 671: System.Globalization => 0xf4a176498a351f4e => 40
	i64 17685921127322830888, ; 672: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 673: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 345
	i64 17704177640604968747, ; 674: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 277
	i64 17710060891934109755, ; 675: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 274
	i64 17712670374920797664, ; 676: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 104
	i64 17777860260071588075, ; 677: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 107
	i64 17790600151040787804, ; 678: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 199
	i64 17838668724098252521, ; 679: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 680: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 307
	i64 17928294245072900555, ; 681: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 42
	i64 17992315986609351877, ; 682: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 156
	i64 18017743553296241350, ; 683: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 183
	i64 18025913125965088385, ; 684: System.Threading => 0xfa28e87b91334681 => 143
	i64 18099568558057551825, ; 685: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 333
	i64 18116111925905154859, ; 686: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 243
	i64 18121036031235206392, ; 687: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 279
	i64 18146411883821974900, ; 688: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 220
	i64 18146811631844267958, ; 689: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 690: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 141
	i64 18245806341561545090, ; 691: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 692: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 260
	i64 18305135509493619199, ; 693: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 281
	i64 18318849532986632368, ; 694: System.Security.dll => 0xfe39a097c37fa8b0 => 127
	i64 18370042311372477656, ; 695: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 214
	i64 18380184030268848184, ; 696: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 297
	i64 18439108438687598470 ; 697: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 91
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [698 x i32] [
	i32 259, ; 0
	i32 194, ; 1
	i32 166, ; 2
	i32 207, ; 3
	i32 56, ; 4
	i32 246, ; 5
	i32 146, ; 6
	i32 287, ; 7
	i32 290, ; 8
	i32 253, ; 9
	i32 129, ; 10
	i32 54, ; 11
	i32 289, ; 12
	i32 321, ; 13
	i32 92, ; 14
	i32 272, ; 15
	i32 126, ; 16
	i32 195, ; 17
	i32 219, ; 18
	i32 140, ; 19
	i32 247, ; 20
	i32 18, ; 21
	i32 324, ; 22
	i32 214, ; 23
	i32 258, ; 24
	i32 273, ; 25
	i32 209, ; 26
	i32 145, ; 27
	i32 101, ; 28
	i32 92, ; 29
	i32 314, ; 30
	i32 170, ; 31
	i32 302, ; 32
	i32 332, ; 33
	i32 35, ; 34
	i32 182, ; 35
	i32 213, ; 36
	i32 27, ; 37
	i32 242, ; 38
	i32 280, ; 39
	i32 48, ; 40
	i32 112, ; 41
	i32 67, ; 42
	i32 204, ; 43
	i32 62, ; 44
	i32 165, ; 45
	i32 215, ; 46
	i32 140, ; 47
	i32 330, ; 48
	i32 301, ; 49
	i32 241, ; 50
	i32 276, ; 51
	i32 266, ; 52
	i32 334, ; 53
	i32 38, ; 54
	i32 86, ; 55
	i32 177, ; 56
	i32 78, ; 57
	i32 211, ; 58
	i32 63, ; 59
	i32 60, ; 60
	i32 83, ; 61
	i32 240, ; 62
	i32 103, ; 63
	i32 287, ; 64
	i32 99, ; 65
	i32 175, ; 66
	i32 34, ; 67
	i32 237, ; 68
	i32 289, ; 69
	i32 205, ; 70
	i32 342, ; 71
	i32 116, ; 72
	i32 274, ; 73
	i32 316, ; 74
	i32 334, ; 75
	i32 137, ; 76
	i32 136, ; 77
	i32 310, ; 78
	i32 51, ; 79
	i32 34, ; 80
	i32 136, ; 81
	i32 211, ; 82
	i32 330, ; 83
	i32 234, ; 84
	i32 244, ; 85
	i32 179, ; 86
	i32 192, ; 87
	i32 258, ; 88
	i32 8, ; 89
	i32 14, ; 90
	i32 338, ; 91
	i32 286, ; 92
	i32 49, ; 93
	i32 201, ; 94
	i32 269, ; 95
	i32 228, ; 96
	i32 98, ; 97
	i32 317, ; 98
	i32 251, ; 99
	i32 296, ; 100
	i32 316, ; 101
	i32 113, ; 102
	i32 235, ; 103
	i32 225, ; 104
	i32 158, ; 105
	i32 202, ; 106
	i32 161, ; 107
	i32 64, ; 108
	i32 187, ; 109
	i32 77, ; 110
	i32 98, ; 111
	i32 291, ; 112
	i32 198, ; 113
	i32 114, ; 114
	i32 217, ; 115
	i32 303, ; 116
	i32 75, ; 117
	i32 302, ; 118
	i32 216, ; 119
	i32 111, ; 120
	i32 336, ; 121
	i32 118, ; 122
	i32 46, ; 123
	i32 341, ; 124
	i32 210, ; 125
	i32 125, ; 126
	i32 267, ; 127
	i32 238, ; 128
	i32 79, ; 129
	i32 107, ; 130
	i32 72, ; 131
	i32 313, ; 132
	i32 221, ; 133
	i32 207, ; 134
	i32 51, ; 135
	i32 293, ; 136
	i32 185, ; 137
	i32 66, ; 138
	i32 292, ; 139
	i32 184, ; 140
	i32 80, ; 141
	i32 169, ; 142
	i32 167, ; 143
	i32 113, ; 144
	i32 186, ; 145
	i32 151, ; 146
	i32 185, ; 147
	i32 232, ; 148
	i32 162, ; 149
	i32 285, ; 150
	i32 259, ; 151
	i32 190, ; 152
	i32 31, ; 153
	i32 205, ; 154
	i32 119, ; 155
	i32 69, ; 156
	i32 60, ; 157
	i32 156, ; 158
	i32 110, ; 159
	i32 85, ; 160
	i32 203, ; 161
	i32 102, ; 162
	i32 18, ; 163
	i32 141, ; 164
	i32 115, ; 165
	i32 56, ; 166
	i32 253, ; 167
	i32 17, ; 168
	i32 50, ; 169
	i32 89, ; 170
	i32 212, ; 171
	i32 344, ; 172
	i32 53, ; 173
	i32 126, ; 174
	i32 147, ; 175
	i32 39, ; 176
	i32 180, ; 177
	i32 89, ; 178
	i32 179, ; 179
	i32 297, ; 180
	i32 48, ; 181
	i32 314, ; 182
	i32 157, ; 183
	i32 13, ; 184
	i32 271, ; 185
	i32 235, ; 186
	i32 292, ; 187
	i32 35, ; 188
	i32 64, ; 189
	i32 321, ; 190
	i32 106, ; 191
	i32 236, ; 192
	i32 96, ; 193
	i32 96, ; 194
	i32 11, ; 195
	i32 177, ; 196
	i32 11, ; 197
	i32 278, ; 198
	i32 25, ; 199
	i32 125, ; 200
	i32 73, ; 201
	i32 270, ; 202
	i32 106, ; 203
	i32 296, ; 204
	i32 294, ; 205
	i32 103, ; 206
	i32 2, ; 207
	i32 26, ; 208
	i32 249, ; 209
	i32 152, ; 210
	i32 230, ; 211
	i32 21, ; 212
	i32 47, ; 213
	i32 41, ; 214
	i32 123, ; 215
	i32 239, ; 216
	i32 57, ; 217
	i32 116, ; 218
	i32 299, ; 219
	i32 262, ; 220
	i32 248, ; 221
	i32 3, ; 222
	i32 268, ; 223
	i32 335, ; 224
	i32 288, ; 225
	i32 220, ; 226
	i32 121, ; 227
	i32 337, ; 228
	i32 288, ; 229
	i32 212, ; 230
	i32 229, ; 231
	i32 144, ; 232
	i32 82, ; 233
	i32 87, ; 234
	i32 272, ; 235
	i32 348, ; 236
	i32 269, ; 237
	i32 244, ; 238
	i32 255, ; 239
	i32 300, ; 240
	i32 193, ; 241
	i32 305, ; 242
	i32 270, ; 243
	i32 130, ; 244
	i32 93, ; 245
	i32 343, ; 246
	i32 3, ; 247
	i32 102, ; 248
	i32 336, ; 249
	i32 32, ; 250
	i32 149, ; 251
	i32 153, ; 252
	i32 150, ; 253
	i32 79, ; 254
	i32 264, ; 255
	i32 138, ; 256
	i32 84, ; 257
	i32 19, ; 258
	i32 265, ; 259
	i32 49, ; 260
	i32 234, ; 261
	i32 340, ; 262
	i32 59, ; 263
	i32 52, ; 264
	i32 4, ; 265
	i32 94, ; 266
	i32 223, ; 267
	i32 233, ; 268
	i32 17, ; 269
	i32 328, ; 270
	i32 150, ; 271
	i32 81, ; 272
	i32 221, ; 273
	i32 168, ; 274
	i32 28, ; 275
	i32 43, ; 276
	i32 337, ; 277
	i32 61, ; 278
	i32 63, ; 279
	i32 331, ; 280
	i32 167, ; 281
	i32 273, ; 282
	i32 1, ; 283
	i32 308, ; 284
	i32 169, ; 285
	i32 45, ; 286
	i32 24, ; 287
	i32 241, ; 288
	i32 183, ; 289
	i32 160, ; 290
	i32 105, ; 291
	i32 12, ; 292
	i32 267, ; 293
	i32 224, ; 294
	i32 218, ; 295
	i32 23, ; 296
	i32 90, ; 297
	i32 163, ; 298
	i32 12, ; 299
	i32 312, ; 300
	i32 196, ; 301
	i32 208, ; 302
	i32 28, ; 303
	i32 100, ; 304
	i32 14, ; 305
	i32 123, ; 306
	i32 250, ; 307
	i32 282, ; 308
	i32 88, ; 309
	i32 271, ; 310
	i32 227, ; 311
	i32 209, ; 312
	i32 319, ; 313
	i32 9, ; 314
	i32 342, ; 315
	i32 83, ; 316
	i32 339, ; 317
	i32 261, ; 318
	i32 172, ; 319
	i32 294, ; 320
	i32 335, ; 321
	i32 68, ; 322
	i32 163, ; 323
	i32 1, ; 324
	i32 281, ; 325
	i32 5, ; 326
	i32 42, ; 327
	i32 218, ; 328
	i32 309, ; 329
	i32 323, ; 330
	i32 153, ; 331
	i32 284, ; 332
	i32 109, ; 333
	i32 195, ; 334
	i32 200, ; 335
	i32 184, ; 336
	i32 118, ; 337
	i32 178, ; 338
	i32 299, ; 339
	i32 240, ; 340
	i32 199, ; 341
	i32 154, ; 342
	i32 182, ; 343
	i32 128, ; 344
	i32 304, ; 345
	i32 55, ; 346
	i32 133, ; 347
	i32 80, ; 348
	i32 29, ; 349
	i32 251, ; 350
	i32 10, ; 351
	i32 301, ; 352
	i32 166, ; 353
	i32 200, ; 354
	i32 248, ; 355
	i32 145, ; 356
	i32 91, ; 357
	i32 181, ; 358
	i32 324, ; 359
	i32 261, ; 360
	i32 58, ; 361
	i32 206, ; 362
	i32 152, ; 363
	i32 320, ; 364
	i32 192, ; 365
	i32 61, ; 366
	i32 85, ; 367
	i32 0, ; 368
	i32 76, ; 369
	i32 45, ; 370
	i32 204, ; 371
	i32 138, ; 372
	i32 310, ; 373
	i32 340, ; 374
	i32 255, ; 375
	i32 71, ; 376
	i32 88, ; 377
	i32 307, ; 378
	i32 132, ; 379
	i32 87, ; 380
	i32 293, ; 381
	i32 313, ; 382
	i32 252, ; 383
	i32 175, ; 384
	i32 109, ; 385
	i32 40, ; 386
	i32 154, ; 387
	i32 4, ; 388
	i32 100, ; 389
	i32 67, ; 390
	i32 180, ; 391
	i32 58, ; 392
	i32 37, ; 393
	i32 242, ; 394
	i32 172, ; 395
	i32 176, ; 396
	i32 148, ; 397
	i32 54, ; 398
	i32 33, ; 399
	i32 347, ; 400
	i32 191, ; 401
	i32 206, ; 402
	i32 239, ; 403
	i32 21, ; 404
	i32 158, ; 405
	i32 210, ; 406
	i32 305, ; 407
	i32 344, ; 408
	i32 303, ; 409
	i32 346, ; 410
	i32 298, ; 411
	i32 135, ; 412
	i32 193, ; 413
	i32 86, ; 414
	i32 142, ; 415
	i32 254, ; 416
	i32 217, ; 417
	i32 157, ; 418
	i32 283, ; 419
	i32 181, ; 420
	i32 6, ; 421
	i32 164, ; 422
	i32 30, ; 423
	i32 104, ; 424
	i32 264, ; 425
	i32 222, ; 426
	i32 197, ; 427
	i32 298, ; 428
	i32 190, ; 429
	i32 237, ; 430
	i32 291, ; 431
	i32 162, ; 432
	i32 265, ; 433
	i32 135, ; 434
	i32 323, ; 435
	i32 57, ; 436
	i32 139, ; 437
	i32 326, ; 438
	i32 78, ; 439
	i32 226, ; 440
	i32 71, ; 441
	i32 127, ; 442
	i32 25, ; 443
	i32 7, ; 444
	i32 90, ; 445
	i32 327, ; 446
	i32 295, ; 447
	i32 229, ; 448
	i32 231, ; 449
	i32 201, ; 450
	i32 110, ; 451
	i32 9, ; 452
	i32 215, ; 453
	i32 222, ; 454
	i32 101, ; 455
	i32 173, ; 456
	i32 19, ; 457
	i32 198, ; 458
	i32 263, ; 459
	i32 277, ; 460
	i32 348, ; 461
	i32 257, ; 462
	i32 176, ; 463
	i32 32, ; 464
	i32 338, ; 465
	i32 245, ; 466
	i32 44, ; 467
	i32 328, ; 468
	i32 29, ; 469
	i32 246, ; 470
	i32 55, ; 471
	i32 131, ; 472
	i32 111, ; 473
	i32 300, ; 474
	i32 341, ; 475
	i32 311, ; 476
	i32 53, ; 477
	i32 194, ; 478
	i32 6, ; 479
	i32 74, ; 480
	i32 219, ; 481
	i32 256, ; 482
	i32 108, ; 483
	i32 260, ; 484
	i32 227, ; 485
	i32 99, ; 486
	i32 315, ; 487
	i32 329, ; 488
	i32 315, ; 489
	i32 165, ; 490
	i32 112, ; 491
	i32 295, ; 492
	i32 250, ; 493
	i32 73, ; 494
	i32 306, ; 495
	i32 82, ; 496
	i32 308, ; 497
	i32 343, ; 498
	i32 243, ; 499
	i32 327, ; 500
	i32 285, ; 501
	i32 155, ; 502
	i32 2, ; 503
	i32 256, ; 504
	i32 24, ; 505
	i32 236, ; 506
	i32 31, ; 507
	i32 114, ; 508
	i32 36, ; 509
	i32 16, ; 510
	i32 171, ; 511
	i32 322, ; 512
	i32 50, ; 513
	i32 325, ; 514
	i32 309, ; 515
	i32 20, ; 516
	i32 230, ; 517
	i32 120, ; 518
	i32 149, ; 519
	i32 189, ; 520
	i32 263, ; 521
	i32 128, ; 522
	i32 317, ; 523
	i32 245, ; 524
	i32 143, ; 525
	i32 178, ; 526
	i32 232, ; 527
	i32 117, ; 528
	i32 27, ; 529
	i32 129, ; 530
	i32 97, ; 531
	i32 131, ; 532
	i32 283, ; 533
	i32 148, ; 534
	i32 94, ; 535
	i32 122, ; 536
	i32 233, ; 537
	i32 66, ; 538
	i32 69, ; 539
	i32 268, ; 540
	i32 286, ; 541
	i32 319, ; 542
	i32 228, ; 543
	i32 173, ; 544
	i32 121, ; 545
	i32 68, ; 546
	i32 108, ; 547
	i32 278, ; 548
	i32 171, ; 549
	i32 187, ; 550
	i32 147, ; 551
	i32 306, ; 552
	i32 115, ; 553
	i32 254, ; 554
	i32 174, ; 555
	i32 347, ; 556
	i32 124, ; 557
	i32 130, ; 558
	i32 188, ; 559
	i32 74, ; 560
	i32 44, ; 561
	i32 257, ; 562
	i32 70, ; 563
	i32 224, ; 564
	i32 95, ; 565
	i32 81, ; 566
	i32 41, ; 567
	i32 59, ; 568
	i32 197, ; 569
	i32 284, ; 570
	i32 186, ; 571
	i32 36, ; 572
	i32 38, ; 573
	i32 247, ; 574
	i32 318, ; 575
	i32 312, ; 576
	i32 155, ; 577
	i32 95, ; 578
	i32 252, ; 579
	i32 223, ; 580
	i32 188, ; 581
	i32 333, ; 582
	i32 325, ; 583
	i32 320, ; 584
	i32 132, ; 585
	i32 20, ; 586
	i32 62, ; 587
	i32 122, ; 588
	i32 72, ; 589
	i32 276, ; 590
	i32 159, ; 591
	i32 189, ; 592
	i32 151, ; 593
	i32 318, ; 594
	i32 5, ; 595
	i32 326, ; 596
	i32 47, ; 597
	i32 290, ; 598
	i32 139, ; 599
	i32 134, ; 600
	i32 97, ; 601
	i32 203, ; 602
	i32 120, ; 603
	i32 117, ; 604
	i32 137, ; 605
	i32 37, ; 606
	i32 332, ; 607
	i32 65, ; 608
	i32 39, ; 609
	i32 0, ; 610
	i32 159, ; 611
	i32 331, ; 612
	i32 70, ; 613
	i32 160, ; 614
	i32 191, ; 615
	i32 124, ; 616
	i32 262, ; 617
	i32 168, ; 618
	i32 311, ; 619
	i32 65, ; 620
	i32 345, ; 621
	i32 164, ; 622
	i32 275, ; 623
	i32 249, ; 624
	i32 208, ; 625
	i32 282, ; 626
	i32 146, ; 627
	i32 43, ; 628
	i32 329, ; 629
	i32 105, ; 630
	i32 213, ; 631
	i32 46, ; 632
	i32 93, ; 633
	i32 30, ; 634
	i32 23, ; 635
	i32 161, ; 636
	i32 22, ; 637
	i32 133, ; 638
	i32 75, ; 639
	i32 170, ; 640
	i32 52, ; 641
	i32 275, ; 642
	i32 280, ; 643
	i32 216, ; 644
	i32 10, ; 645
	i32 238, ; 646
	i32 279, ; 647
	i32 266, ; 648
	i32 16, ; 649
	i32 346, ; 650
	i32 134, ; 651
	i32 202, ; 652
	i32 13, ; 653
	i32 196, ; 654
	i32 15, ; 655
	i32 119, ; 656
	i32 84, ; 657
	i32 144, ; 658
	i32 22, ; 659
	i32 33, ; 660
	i32 76, ; 661
	i32 304, ; 662
	i32 225, ; 663
	i32 339, ; 664
	i32 142, ; 665
	i32 322, ; 666
	i32 77, ; 667
	i32 174, ; 668
	i32 226, ; 669
	i32 231, ; 670
	i32 40, ; 671
	i32 26, ; 672
	i32 345, ; 673
	i32 277, ; 674
	i32 274, ; 675
	i32 104, ; 676
	i32 107, ; 677
	i32 199, ; 678
	i32 7, ; 679
	i32 307, ; 680
	i32 42, ; 681
	i32 156, ; 682
	i32 183, ; 683
	i32 143, ; 684
	i32 333, ; 685
	i32 243, ; 686
	i32 279, ; 687
	i32 220, ; 688
	i32 15, ; 689
	i32 141, ; 690
	i32 8, ; 691
	i32 260, ; 692
	i32 281, ; 693
	i32 127, ; 694
	i32 214, ; 695
	i32 297, ; 696
	i32 91 ; 697
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
