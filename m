Return-Path: <linux-usb+bounces-12986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A1947219
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D981F228D7
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC08AD59;
	Mon,  5 Aug 2024 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kWnUkkni"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EC111A1
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818283; cv=fail; b=bKyABmukqYyAl8guPBYyjPNksq1PxGdtDMhaZVbI8jqWgqRJ02Koc/HGSbo1dGS7FOPItBLVgqGO7kvKeJaA1YNypaq2Vdoim8N/KEJjQlTgExnSvl0be3FSl0FhsMRDZ5AJmjg49YwrK34DtEhjObJMep3tHumzyziF05BA9i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818283; c=relaxed/simple;
	bh=s4ttF09PIwfgLQmzw9LZqIwH70GVJX8Aei/bs+/cH+Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QZYNu5oianbHEPwvhzYdbYFVfkSu3D8689trhLBrHE0wkAuLd1Kfb0KUwIoE7VcqU/Hos1/c29D+w4YkR3F0tffispPSwoWCM6ZZsZLq/jCdj9HGt/4PtXYl1Xn7ZZWxfLEmDsM9mSA0xYg6dB7/guGGI7CpeCm2wZbeAQYdg5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kWnUkkni; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdlzyEXNPKkK45qAdzRt273gWB3ZcENUp21qM3cllHUwXk4iHWOr3e0y36ycmRa3fBwlsHLWtIwFJmfFKWdFfp9x9KzAIaRLgkPre7eeCx4lQiH60iix+1tEWTg+30YYfY6o3AkQ+50mVw35KNmyXgrDeCXuB9xYOZwbFJlG+ihqoS/0YGQM0sjQ+ceeMjBOOfWlQDD19ztDXJv8C4iOnrICJbuOuTB07wUyy3wKRxQssT/deEXqM4Pn30JyY48+ahl6d/3KfAByEgPwVmj0mVoUGrEjiSRpAx3hlWmJIUH9Cg0UY50kGxR0msLggUt66wRRMWPjdPfchAwIOosqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jovqRBzEtXrZT+MXCP4/uH2eQxe35LQMDQmD4cxTZ20=;
 b=y+Nz2UbaNAt2CSYDhIbNTLTTf5I3qfthbaFadZvDtcpkE9SPpg97nxSxNGHJ1rPFbehePy5p/IzQ990JTX1DEuV9/geNbccXgFIqO2fFhfpBTO+TW42qA9bOZZyAfzst4ZFzHvVvzG8DTYr47BllzKkGsrAnzD7fRlksH4I56w7UM/C1XhkQnRUHGeZqHM+EiZJfsRxp15IYJsCts837puoy7xXPnHP89YKZqYIHES7GfbJI9yonAybY+Ktom6kHwcWV87AbCmpo9Fsi6jmdrTWmsyPta0Q4B8/bq8psUKcGQd88BNOFJ+mbZoIatH4JOKEJJIVvusqLaaL3WzVO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jovqRBzEtXrZT+MXCP4/uH2eQxe35LQMDQmD4cxTZ20=;
 b=kWnUkkniaR82tRG9rv6w4VQeNxFvBoaHq/eEFHNrl7XWUCG38IGCozdA7wy18YiDx/EmDkMKL3Ur1UgnqeTkDmi6LNIX6S7EXJ1bcMmoeWKy833b+qCwy6ktXvk/76QTpikwj7l0NxJy280JC3sK3pHN++BSXcETWMKC1WGmNX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:59 +0000
Message-ID: <87o767ztw8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 036/113] ALSA: firewire: oxfw: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:59 +0000
X-ClientProxiedBy: TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c69c696-cdd3-4dbf-8514-08dcb4e6db64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KRo3ZJ8AfL65lb+ElgEEVZcFfcXtVR3CO6BxK0SHBD8p932mJLgkcfiBlCOo?=
 =?us-ascii?Q?Gfoma1jdW878/H/m2IAktJON0tx6s7eLcymyWsiKkzS+HlAwLWkw7x5KkYLl?=
 =?us-ascii?Q?WEOQqxMn8DTsXloWpFsdSpypbKsm49Gix/9LLiGFWLoLLViirIs7jac6TJ67?=
 =?us-ascii?Q?Boso02UM5w0b6HyOhd/Yo44xI9VwyZ5fAPR1FQKj94P6VW4cVzbXiUpzLQtU?=
 =?us-ascii?Q?wm9R15QryErE9KmBiFuyEnXHP767+fSjgYTotEqG91bLcsfhILQgOZcVLKR2?=
 =?us-ascii?Q?nlF/A/Px6HPpbjmS1jCsS0aok1ARPO3ydDsrqW02Rty5KCgp18ZYPJoE/HBm?=
 =?us-ascii?Q?x9dWLCut6ClGQJ82z0v0yDYilbsap6vu28Jf21DYaapog6S3i/zXQrJGaLW/?=
 =?us-ascii?Q?OBZqlUUYNCv3X0v5oobJ+AaF+VM/u5TN44bebc1pVed8R3mNiZWyQCKANfX8?=
 =?us-ascii?Q?DRNgEow7aFfJV5pC9kpduWQ83NQt2NwdgSb37LRCbQRYHg2qs0G4E3PiBTVr?=
 =?us-ascii?Q?CKD109tVpxeImqox9dx4tOyBLRWOdGo7K7DPd89betVy+T8GJPJTT1nYVuHw?=
 =?us-ascii?Q?/qYTepe1wswR5utJQrxr96uSv/tJK1wSGpw5q0+JI1GPqFlznVsUg9ziHPtZ?=
 =?us-ascii?Q?5oSOsaCdozIm8WJfQXqiPMMUT0PiBp2Re67ZwnNlQ9esF8fuH/V4NKE9hDmt?=
 =?us-ascii?Q?hs8ZyygyCS5//udUf9OTWe2Bl9Y5dZnNtjtko95CgH4WCUE5lenqvMZttDiD?=
 =?us-ascii?Q?KmgVIRmKlLWn3l6fgjo0gVI6QfWVchWt7JJxRf/STzCT1LLSqJ7B2WcqctdT?=
 =?us-ascii?Q?zjIIfrD1CogU7ioJDVVX6R6jQu99B3N8/diXVqoi0XmYx+h/WScBtcHEpqTB?=
 =?us-ascii?Q?hywJjk448OWH7Yq+/agzmBObIX+e1O9vqwe265zutbco0IqTSgfABaId7f1G?=
 =?us-ascii?Q?PGdS3eQErBDs7iO8CqfFy7IZw79KeAOd8k6V6TFyHew8kaJDdTMyI2e7Lfgj?=
 =?us-ascii?Q?9M1WSCGHL4QUoWOacti9LKxq2CcFyh2NPYM/dFTRMg36QaiCGcsYPm3BDumr?=
 =?us-ascii?Q?JRaC823qcT7DLNbD8r3HOihtH7XemUis/+eI/MR3WW3WY6DX+mYBMOeTjXBb?=
 =?us-ascii?Q?ZyrZydMvoQ4dD7ze6g4y+oLE/pwkRSjztF/KorPoJik5QcBhGWEm7DmpHYCf?=
 =?us-ascii?Q?tfrT8orgEEi4QZYtXQwVIG7BxJrAqv7BOyOYqLsNdo6bhLTTI9Gqhzxx3QfR?=
 =?us-ascii?Q?VOlvnGwlVvtlRSJC/muJVVjEqF6Oe91sDkmCGOGTP4GX7grG/mytqmXhxRLS?=
 =?us-ascii?Q?9J5EEOfsief1nI+QQm1n/GekjcO4cOraliY7jPl4fovue8KytFYFhUwZjcXG?=
 =?us-ascii?Q?sY5i1E3RxFBfcefj9M2tLElXq2TJfZrLgyN43QMjRVGh2WT8WA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QeVO7Zd9skfyfBFO0gPRuS/xuA/7xK7xKnTKoa5Y39PY9Vb80ziHiThzv309?=
 =?us-ascii?Q?+QAV2YXZT3fdK4q3S6WsHtlzB0IqysHd93yibuynqXLx8LMa/+qLabhyYdO1?=
 =?us-ascii?Q?qQ43qVSWi2qcMO/Z5y5sTIB3ggzvV2OYDgwVtwUoAhDkG34zNj7+4Hwhef/j?=
 =?us-ascii?Q?TRFvzVeGehj5BS/1ywrztkJvSU+NRoMij3pIPoSt7obATl1eEqYFTn/2TlTy?=
 =?us-ascii?Q?HApQMIukPJh5NBrqXd2vUSo72s99aTk32BHttAxGeqHwGZh7Nn5v+UiVFg7p?=
 =?us-ascii?Q?eAjMKRc/E0AQmj/9uhz/UYEhsPAurfarC/czH7d9Cwc6Ay/LrVkFjpMI4+KK?=
 =?us-ascii?Q?L48vSRsP4ZP0DQw3skuQJaoLaqWT6R9Hr5Q32lnRNu73BoIt5Mgi8gSapxFo?=
 =?us-ascii?Q?tzPTM2VsMXBKTrCrV4qLmxw0Xr4Np/HrZmKfyhCEIKyhHc4CmjrjJXEf/M89?=
 =?us-ascii?Q?MLGJBxYxoP9MNX/EiHlTUw3UOuuCZPiUue+WI8hmSAnQXg4v4xExyZUicy7n?=
 =?us-ascii?Q?YzUwS5vQc4HXy4hGMzxgpWrRLhqsFm7BoG8JFApTEI9XtMRK8kO+fsYWN+i2?=
 =?us-ascii?Q?k39InlG0K32K3GgI7m+g32ffrbxeHZpLWhYNq1SMfH9l3ZkXXmHFgf+z6SBA?=
 =?us-ascii?Q?tOn0qJXQQ8D9IuVuTAuV8fwK86Go0uP1h3FLod+14MekvEZbg/D63iBBiOQV?=
 =?us-ascii?Q?Tf5HMbb1YSxMG8goKWNnntQLOWp40Ss3qcu1zccHgHlmy7Uox7/4dnAgPFQa?=
 =?us-ascii?Q?mOYYP6tfOG5WmaekXzXoPs4Ybfx0UxchvGDxSa29iL6mMiYOgM0P9Ss6FkuF?=
 =?us-ascii?Q?s6kYGwRqcjkBdLLnY+ZJ/iIdloMQEspeYgTra7MCTP3LXS2nZiLiRSj9JWME?=
 =?us-ascii?Q?5KmXiiCGxUSHzjp4TKyoHAxd4khUtzQsj2MOR8kkQlIIhcwfxPBEXEZqQDCk?=
 =?us-ascii?Q?GCKrOsYhuPeHF79RVsMUjhi7G9Q6ZGYIlS2Up60gmzIQG9/Bx1Y4lanGHftf?=
 =?us-ascii?Q?Ozeb+1l38cdnJnni2SgYxD+wQkoNTmhH1fLAt/pg7JxalAS8GGpIN9MZji3t?=
 =?us-ascii?Q?ACFxBzIBuGYfMr3D9hADQS4n6vC7nISJPdMCLfKJVLkjhWqVdfpFLXuVoh78?=
 =?us-ascii?Q?BrSJidECDEqWdNzubAEbog5prmoRp1tXYvD/rTJNqozi82gp4/6D1jq5nWmM?=
 =?us-ascii?Q?1RomvwR9noaae/pdkNQWdsUOOF+EhGMMRrXG1B4qoP/6PobPpjIG4oFIcSad?=
 =?us-ascii?Q?8VePTCvDnMfYPHuisofRmlwHQJ8WcnBvF0Mrb9uXQLUpkd0X/WEVa6MSU9nX?=
 =?us-ascii?Q?y5eAI5CRLToTMKp3hUMgG/juIaWM4rwPKzHAwcBR/DIngyKIZ5IW+rrBNZDr?=
 =?us-ascii?Q?8ElX3Z1njDO/txK7zv5wLCbb2lpbD8DJ3SN+dK4sJfAFVn4d6j0Gu35C+86Z?=
 =?us-ascii?Q?+e8pmRcJlVsC0wULd+w5+TvtQDtCnHFTWkq8FDzmGzSE2Aw+pfvzURBBNDMB?=
 =?us-ascii?Q?mW3k4NvM5H2JnvLgzfH4b4IHGHZegTbcewpzv2BCxPbJuSACxxmY/yl8txJR?=
 =?us-ascii?Q?+lvyvdFvjkPa5On0ku0TsDdtxi5RDSoq+7tK3QmNghfiEyfubAelH229+wPW?=
 =?us-ascii?Q?4Akl1K2TeKgnhs0Ceak7sWI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c69c696-cdd3-4dbf-8514-08dcb4e6db64
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:59.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odP4ActdDrgr5sxL8W+KSbWuZzfXLkZ9K429x4kSyjfe/AY2MEmqBUxl+6yucL79HyfMOdMNzxBeS93ZYNuTI/oEDHw3JwKkmWw1pomlEqYhgn6NhkP7SAttiYv2cfaG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/firewire/oxfw/oxfw-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 5f43a0b826d2e..c0e67a0d10f1b 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -114,7 +114,7 @@ static int init_hw_params(struct snd_oxfw *oxfw,
 	struct amdtp_stream *stream;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.formats = AM824_IN_PCM_FORMAT_BITS;
 		stream = &oxfw->tx_stream;
 		formats = oxfw->tx_stream_formats;
@@ -150,7 +150,7 @@ static int limit_to_current_params(struct snd_pcm_substream *substream)
 	enum avc_general_plug_dir dir;
 	int err;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		dir = AVC_GENERAL_PLUG_DIR_OUT;
 	else
 		dir = AVC_GENERAL_PLUG_DIR_IN;
-- 
2.43.0


