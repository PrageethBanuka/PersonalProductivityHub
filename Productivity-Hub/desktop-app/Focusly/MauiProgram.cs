﻿using Microsoft.Extensions.Logging;
using CommunityToolkit.Maui;
using MauiIcons.FontAwesome;
// using DotNet.Meteor.HotReload.Plugin;

namespace Focusly;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.UseMauiCommunityToolkit()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			});
			builder.UseMauiApp<App>().UseFontAwesomeMauiIcons();

#if DEBUG
		//builder.EnableHotReload();
		builder.Logging.AddDebug();

#endif

		return builder.Build();
	}
}