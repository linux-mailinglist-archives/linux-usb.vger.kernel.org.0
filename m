Return-Path: <linux-usb+bounces-13049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9232B94726A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E022835D6
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B19E29413;
	Mon,  5 Aug 2024 00:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bm9RZKEV"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D5427713
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818621; cv=fail; b=WvHv1UBKrsBGOFqOYnDBKBUtausCpejDFMYcc2lJ0TeBsxqOm1uyvxxbi0MhXsKTjgYO92OIfCpS8rwnknRaOdGS/Ip+5doZ00+zH1qknvZVV9fii5QYIuMhEWdNd9Ex2Mc15NkHmY27uTGAFqcR8Gz2M1KswWPgTs/RnA9cSmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818621; c=relaxed/simple;
	bh=IAAkCZBiUABiIEXUPF7iK9BHMJwykoctt+2fR2WwyUQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RFBjqNlk9nQnDIpYDRPXEIUeEeKOGfYwEprDx9XuWDGcf44UKz9HLul9ThalzbeeErAh2bD+fAIFNXu5vBpzo5XjAxzu6w73PAgSmAzrauBeubNVioGHyU55tjqC8q48xJAoP/PJo64hSdY0GnKC62H3Yyad+bK6gAZbcNv3t3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bm9RZKEV; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItAcNHZsMiqaSIrfa6sTrM/nNBRpp8rpp5NFqZfHUi/2fAIKLAKL7Hrlqd6Ynt6xyTUZLeEjk2laJMV4ayJf2zeBPWbA0UHlCkEJClYAdO4ieDUlAeD2PMAHf2RHH/5wxisJrQ0oKBtKMI4FZQM/VOK10/SccF3IqXRntBOOp8qqhEIpfz1eVw/UKbxD+hYig91thuNoFjgeXawppT6IC2l3lAXr6Z3sh6gWn/BwjmBXbXEfouYIA8iyBKnpTFWNZ4GAJRGYKFE0dtK1bSirsR+t5aUL2QtUVGpJbveNQrkwWDrbPGdYTeFg9BdISqUJ1IKdMIlZBD0WwNKHiK06UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9Xz8dvJfDOGLupTE/Izp1DBMjzRV3/t+URqSmcxMv0=;
 b=ZR6TM0ULdk64+Ndd8dnJbJj/BRLD6ytrWPkSHisuwejswc7T0QXZ2gftTSvqk1lvwBU1eF69njsJoBUHlg9em/1PWh47D3S/k1Hrl0AINUpGaxo3IxEIsXY3Za+FZnTl616u4oxmdTjLQo6TGAaPFoxjZA0G0jvn1kgH+YntdW6lTw6K/bagnprcJFCOOfBHNIhRN/riVC0KA+6okTaNPebUYF2315mFQGJ7oFZqFeJlZxu/kCpKJu240zVn9leFZGfxxh6Z2sMHfh3JprB8GZuvvXN6Y5nQioJR42+gVU/Oo3LPIipNTQqwWPc+lsazIHrcvlw98ytJMou5+HcsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Xz8dvJfDOGLupTE/Izp1DBMjzRV3/t+URqSmcxMv0=;
 b=bm9RZKEV5lkZnUqH5oe+KQGJcgAYrXkJVhQwyL4nhkogcbGMWJ9fHGyIKvhaR2dicAIwHLZw2q2nI1fKZBjfkXDBsm0Z5dykjHD9Fd1LLN3K4uc/GuvL+ixRE0fmOv72M0VH9XwIkbup+6GDt7g+eo1S895aaVRwK1PtvNpu1kM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:37 +0000
Message-ID: <875xsfx0hy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 099/113] ASoC: codecs: tscs4xxx: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:37 +0000
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: dc095ef8-ef7a-4604-3390-08dcb4e7a4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mF+MLGSBBSK7Igdpoy01UuNLpH8ymy6wM7t6SWT0xEcmW+St9kj+m8hm98VB?=
 =?us-ascii?Q?/95vHwAL83jPdrOAkyw/U2KqKtacjvQ/QtC4kgClxGRVEBFwMmov9X6jGN+B?=
 =?us-ascii?Q?iW3Q24oUgpBiGoxdLKPUR0Txu2JWrh2QoVzWchK6LzuQLnFK4U+nhe96Gxsy?=
 =?us-ascii?Q?7S+1jviGStZu9GTb+YYC3lLud7YRuLVS7O9RTD4oLHdcX8kJsk0MfUjxf/fM?=
 =?us-ascii?Q?HatZEdXcbd+aPXpv2xr06fcwcEVY7FOINeJ7CyO5Ux5INg9XoZ5JR2QUYsf9?=
 =?us-ascii?Q?uiBkaa8frZu789pO2zkH4sHKT+PRABKbI7GB596mltziqpOpeEPJ4mvAHXz/?=
 =?us-ascii?Q?qa5yyDSYSTWW3onjCfJLVpFWaDKoBknG+ryzGUH6PscGp8WZsTDf5aKTO0Dg?=
 =?us-ascii?Q?lL7+McMe9Y3ZACLdwsm4oLBRnrJtZ7UKnw5EIhw3QZiW3gsgGhTnhKyv9t/3?=
 =?us-ascii?Q?vTpT6Wegx3W9jemf/JF4+4xLBgudjHCW5gl47wl57rAKmR4xMIbMGccbX6vn?=
 =?us-ascii?Q?QymLbyUibcfp4nOZxbB8FnmPydah/R/g2JOV8uILBgYdn2JCcfOXVC8BiJ/w?=
 =?us-ascii?Q?CNv5zZOB4/gD0u1B4yr843FHIzr2+leP1Fyd/eXexCzCJAiTeSCEf+9tRTZt?=
 =?us-ascii?Q?eyg4NCGUSiJPn303B8u4YDoxWeSOSWyZ+l9BN31yldFa2dlktn5Y7QqGFyAh?=
 =?us-ascii?Q?oZXP97R9yQIYzlJ3PC62pMeVlYTTuRD6pHG1A2ZHR+IeH0BWsfmEEdQvdGLA?=
 =?us-ascii?Q?Jk20+jAUm4+XGr/TrigADbZ0uqh/TEy2dJ34JohiqWmbl5W+HgXnGGstC0Ln?=
 =?us-ascii?Q?EU4LRn0WcTBnMjbVuqQ3w0eoDaMm4maTjrEeNvVtVLY7PBrMsCU/fdEmpBGI?=
 =?us-ascii?Q?RyQOKst9XmOT7VDFhRSgLmt3bA5kSn8cNX8O1aTVpXeM9e9K/c0a0mmDsAmm?=
 =?us-ascii?Q?d6x9SwB3GNrvECzAqtQw8V239h8v5Uuc6wZzf//0xMpkhnRuxQmBm5nlMgKC?=
 =?us-ascii?Q?FoKaXrD13LTCmD1mkAen5lq2nNVp2F1/AAkxLxrtTLMXjcvzHxYmwiEvd40b?=
 =?us-ascii?Q?5fBg5K7Dw+hc9il1mY948Gj7Mh0DqkAsePXJq9Dc0wuVmhc9ZJ2j0I0qr2ut?=
 =?us-ascii?Q?zah/VO+LkOIQEmUuxCivt00qLOrCMTiANwnHkA6UTnrVY2vPy4u67XEGLmBU?=
 =?us-ascii?Q?qFLh3js6XPP9e7vdKdW/AgmoUui2QIDYkpEtux/UfjvxVBOUk+6BoWcN39fH?=
 =?us-ascii?Q?8/nsXOsa4kFLazOhzWrM26miKleiMH//3P6oNfWAtYwMxaNKCKpp/Xppkhav?=
 =?us-ascii?Q?kIvhp/C55f6Za5U6JlIzyZbs385+VrwaFjzSmh+2IunXqy3LMxbyx4kZUsk2?=
 =?us-ascii?Q?neZWNWqcKAasHRe8cwAc0JXFtRXm+FtOWWcgukdJKsqmJZ+VyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VjHFYuACfs41B4IU1c93Z7mWi260YfE4lffxRGD9k0EQHEYIOT26/TNiT543?=
 =?us-ascii?Q?865wYZi6t5YMrxWiMUAYdAPrHXuJHEkrcRzt0Yf9aZnnTE7G+UK2aWMWGULP?=
 =?us-ascii?Q?kqRzmXtKSl6sIRy5V3ZnQ6XsmDhw0otlDLbLlOajmrWmVgTI6GpBde+Qglcl?=
 =?us-ascii?Q?nO9RymAZ79EqIudVxCpfvXotWe+GzAubmZoNgk9vCPJjOHj07Uyks713+crE?=
 =?us-ascii?Q?xOmXg3NIGbyF+bFuERrzvmZCXnEH00BnAqCLPds5n1cYEDzomqsQ1bWMyZhY?=
 =?us-ascii?Q?ZAY0pJyE5sjqhjHzUL/F9bti4siIih5NQaNoF+fsd5xjd4xeebKWSCvEx9jG?=
 =?us-ascii?Q?7NlKqJFwcyuaEmJRTBarCwoKuUkZhLShdjJJyTyof3ac13I7rhVEk8FOorOP?=
 =?us-ascii?Q?zZipnVPadfFSY4hZojfl8Kp78/qiu8+iTT7RBs2U6p3+tt3b8xy/niCrhyb0?=
 =?us-ascii?Q?7zf7BZaM0LA2N4EMeZbo8hUTXeWlcUsVs2GEdoLy6kQaYc7oL3L/fSbzL7bM?=
 =?us-ascii?Q?aVMSKyZFXr01NWRY4pC8zzwZQNN3wgSUQjEwnYnGKXO0vXdiF2zus2QIyQCq?=
 =?us-ascii?Q?FCw1EVfst/tIi137/ZV5+VuiQ271Aa/qB8/drezMKxtR2mhga+VFfIiQ1RV4?=
 =?us-ascii?Q?TYcqyG2WOeYujpXIx5vAvEAMO0wvnaSJ0JNALAsR3Sd4Pi7ZnDgaSzGATFyn?=
 =?us-ascii?Q?Ilz4Ut9FiHkYe5xHoaADuxRUwF7pWlg7ej5VLVxYZoUvqOd60E8YU32GQ9MB?=
 =?us-ascii?Q?RDeiU4vjOoGXWN62VZYEwWl3vPg9w0lfTZXU+AxTsfhd+6ZPbln9U9MRqXkA?=
 =?us-ascii?Q?HDGsD+Smssk2pbmUC2i3JKromI1gTQCQ3Il3d6dQfa31Is49mRqhBx/Geszs?=
 =?us-ascii?Q?yaSGHb1t8jQOhME/l+gGyheCrIsdRqCeW20epPvkw7OkTTK03//XK6gu1Z8k?=
 =?us-ascii?Q?mY08+TumKX7XIezuX0dZd0UMl1zffuy7/D0p1lmc8Q0VJfOOuRjdbOh/u/Zt?=
 =?us-ascii?Q?yUNoxdR70b1KvGkeb05bzpH2DLa4IqVoopkBjY2iNm4tC4O9zhRy+vhQZNXs?=
 =?us-ascii?Q?bjG1XTQaqlikcO40t4PqbgknWGg4CKSYec0SZiPBlP7V50mSLbiEcckmO/xP?=
 =?us-ascii?Q?uOF0NkwasGWTRlH+nD7B65yjC/0F3+7H8oC6DUoYkKRHeL2WFcJ/ATq9Odjw?=
 =?us-ascii?Q?a9cTPsUE4YeNGuV7WrlBDRVuo91vFQ78LYr2ltwGk49RGmNmITIkTxjenjG0?=
 =?us-ascii?Q?Z1W+ERFIIP+xTld9T3qBFU2mrTH5uwzOhQcu56KetJOIiCN5/lDqcJqMBzOs?=
 =?us-ascii?Q?lGglZyKVT6qi+4fqfjW15tSIo0tY7M+mklxCItN5l3vL8Z4wQjYu/8IQOBHT?=
 =?us-ascii?Q?N3plRW0GFecHIqGP70DNyw+R54KU4oa/DN1eUW8jkXWgTqo+04N002o/dEdM?=
 =?us-ascii?Q?zYUQWPPxt1b43Csh8PN+tT210S9vLEas65pXfqauYt/8OCYk595S421mzYT5?=
 =?us-ascii?Q?fLghYonGYgT5iY821rKLeSNhF5cNsvVCUw6t/kI9W25DhBoyj3ExFzSWyOMO?=
 =?us-ascii?Q?huPrOiwFVd7LNhchn3UblFmLo4YVXGwy9s5a1mJeo0862KdGR/kE5/lPHZXS?=
 =?us-ascii?Q?oo6/6idWdyJoXDRL2CQULRc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc095ef8-ef7a-4604-3390-08dcb4e7a4b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:37.4601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQTOmqDDr+IKq2gFAovHLHBZoKCQqC/pe4iQS4ep4xsK8HwHoitYouWWAFHso+BqjlAoD5FXBvG7FV5dshFvZZBZ4rX1MB6MpZuFCb1A2iHFxQIfS3s8Gjko1NINl1v3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tscs42xx.c | 4 ++--
 sound/soc/codecs/tscs454.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index f8a3d1b40990c..dd87a37b97854 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -1178,12 +1178,12 @@ static int tscs42xx_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	int ret;
 
 	if (mute)
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(stream))
 			ret = dac_mute(component);
 		else
 			ret = adc_mute(component);
 	else
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(stream))
 			ret = dac_unmute(component);
 		else
 			ret = adc_unmute(component);
diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index 850e5de9271ed..b8ee1281db489 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3221,7 +3221,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	set_aif_status_active(&tscs454->aifs_status, aif->id,
-			substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+			      snd_pcm_is_playback(substream));
 
 	dev_dbg(component->dev, "Set aif %d active. Streams status is 0x%x\n",
 		aif->id, tscs454->aifs_status.streams);
@@ -3241,7 +3241,7 @@ static int tscs454_hw_free(struct snd_pcm_substream *substream,
 	struct aif *aif = &tscs454->aifs[dai->id];
 
 	return aif_free(component, aif,
-			substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+			snd_pcm_is_playback(substream));
 }
 
 static int tscs454_prepare(struct snd_pcm_substream *substream,
-- 
2.43.0


