Return-Path: <linux-usb+bounces-13057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40614947273
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 633D41C21744
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0296E2C6BD;
	Mon,  5 Aug 2024 00:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Padg/FO0"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040324B4A
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818654; cv=fail; b=VENC3SStYozubgIiAkuHPLgkWUr6xwGN1q66r4r+yeWgSoljr7vi1Ud151IoXBJcwTGdWWzsNasDL23UPDglzUFDnWENjpOXPP2RDsEwlVB7PkvZuSPm5yS//pEbUoyojkK1FmDSV1WGdWgUVsCWAm9o6LMT5tcA0vPSZSMkYT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818654; c=relaxed/simple;
	bh=/DlWqjr5z9q+7TthAfYDJ+lha3qJsfLXVrhdmKvPpt8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OjicolmvsgSVadLJcdAdI+RUiruDltURkRj+qwqunr4FzgwiXiYDVKRjWt30p9yQFUX3dr8UjzqW2Byj1NUZUYRJzPD7T92ifsb/BPgA4U7yurIjDuflHzuIDzwOobmnHxyhwRCLSw4LbVwQtWQgHceNATcS9PFnWRki+5rSRjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Padg/FO0; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYxzyR5maUAOwO/ow7MZdTiyZkaDTWxg/2gKpjBcWRxUw0eFouecEGHr7FCKQzUweY23HoKar8PJB2MJvP6ECvpVV/nMM+SZaIHHg7mlqELCTd8rbPjuLf0ytfEmLFPwSjTl157mACW6MD79yANhs5M65Mc+lvNoSdyV3oIgf7nJFLPqbOk0vJ+b56yzxsVl5bKxfEabLU5DeOwLUCkhQ0OzgTckgDfPCfsKaigAU76mzpVPHWFXGQ4kM7yF2zTEqm3LYd8B1YdVruCK2Jfn4kJstnV5ZTgf6rYQRACeTvsmXgbC9ssUZHdyjE9N/b1EFmZwafnnZu8m71QZ2L3K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhVfyZpb8wHC2V2WI4MfseUPvvZ3YvKFHHGr3kzKLOw=;
 b=Aclj82QS7gP1j6w9KJiQK4lnqnamrhsfYeh9EiXnBBURsKRKNlvddts4m2X5urpH0gFbuU3vYpQ3eckqiYuSyQ0yvAFKqe9CtHXODOQSxPcbLmcwdtVTKv3n6Qc4TeQm84o/RYDn4Eq6Hy7ci7Dsvdnj61l4uRqXrT9zZiX9bYUK9CEAwdQ1XbTD2jZkFYzEUf0jhZiYtkoLPMetbrHwwQ7sN7tE3qm7DRKAefaMjx165Ry4Mnkd5vwKAptpQyZSsGTq5JCSWkfgaJonwDs0K+EPr4Fh0zG4SOZYrgPztGdLpB7IOqtWeq2nKndqyemwwIMy+J1AQXBElkF/RQRNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhVfyZpb8wHC2V2WI4MfseUPvvZ3YvKFHHGr3kzKLOw=;
 b=Padg/FO0Qme7C42zaGRoWasTOUMB3NrvawhFc0w7XTVLdtlVke0VgvYrCZlEQ9BRyJ597/ftkOQvvCao996vLJ6nljg7nIw0MnQVSd8Hn0f5Zlb6s1smfx8XoCQ8krX55lARkBCHIz4+W7ywrY1uVs9AoIjuOYF9G+IFaqdvQfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7846.jpnprd01.prod.outlook.com
 (2603:1096:400:183::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:10 +0000
Message-ID: <87ttfzvlwm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 107/113] ASoC: loongson: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:10 +0000
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca85b8f-1936-49ef-5292-08dcb4e7b86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B6esRGKDqJ36bf239Eq3Uomcr+mSpSVqAaGWpcfYcmogbn6LrWzS9xDtz9zD?=
 =?us-ascii?Q?NSIFcqvQA2bxBgSljH68vBLVNPCXFw6/DGwnndkSqNy+APDq3Wpt7pVng/s9?=
 =?us-ascii?Q?kBKAZdSbPgIYycTempLzegmCyqREol5td3jztVVbMttzi5GYsax5ahFdcIeC?=
 =?us-ascii?Q?EVbXe1PO3v/pFLTeEFhVvyteOXm3HDSiA2CTBJxhgCyj0QGaI2AFxUpkHQqb?=
 =?us-ascii?Q?NSmq6F9fk7nYuQKYiDm/emvsGfICjV0drKzONToP6MyFMLje1X8THeY61TyM?=
 =?us-ascii?Q?S6cVDJ5gtbZa2UxMv4+j3XYcpPH2943BplB6s7A+axjg9H9aojt+mDkLN0Nx?=
 =?us-ascii?Q?EAzeqWjUNelOZoo67W2StjHDbs/Z/wNDcpuMl/0ajwhi/IXXtt26Ejxry4rp?=
 =?us-ascii?Q?xBsZ+2D3RvOI0Txa+lR3v4VEPT3gyLXLeCTiVnEdaz9uvzRTwwvatH4RI+Qx?=
 =?us-ascii?Q?GzGS+jn82Fm9lQz8JpuZ/M6zEoSpSIE0SMpGIi1QzhLNkAdzFnd5MUAmDrbi?=
 =?us-ascii?Q?xMTC47kVR6qAlmp51ewGppDGchRfkk05hkbatW7/AV8f1Rb4rcEtd2BXd6l4?=
 =?us-ascii?Q?MLyQiQO3B/7PT7+7neRtg+BpJbUyHvXi7TWIK8IlyTqOq5kQIB21nJ2abt/9?=
 =?us-ascii?Q?rZ//33xuwdaIQdenRiWLv2uadk/JXvMCfb515jYKuc1jsrZ8HCxiKt71KYGs?=
 =?us-ascii?Q?/xLvQ8KlaqCVNjtN8+OIyAwchwOmCOXykR/vjUv2IRd2EtXAklVYbIqOHaM2?=
 =?us-ascii?Q?SakXyTGsqTzrUCVwrcs6zZ8nX8mYw7cYAAOZNUVtOlJ1MXTw+MCL3u3LuFmK?=
 =?us-ascii?Q?hDHj+U3WeXv7rln1N7V9Fs4L4B1HNK+8N3HF6+iCvWFfWgtjPd75wWhFT9Ny?=
 =?us-ascii?Q?htchGxK9WkhYEVoPI9uuiTE01gnIoI5xV9vXb84hmRY79HIla0ZFXJ4sTbIp?=
 =?us-ascii?Q?Ty0hweTad0wIFLBD0xDP7ZX3taFwXxxnyFJzY821jYgLRsOzh6NPe55vmasR?=
 =?us-ascii?Q?tHG7G4Pl0NbE9vY0U0kH2uFq6Pt8JHLaaBQet8IVFtRGvJJBOk8yZnNBmMVN?=
 =?us-ascii?Q?BDZ5Fmmu/YUgG5TE50qWaiHBQ0EzCXSrCmA0LvnV9hq8s2H6ALWxv7RFBzO1?=
 =?us-ascii?Q?r/bF33OwgvFwg2AHsOydOa+g7pY/tApyv70iudXZsdERfmRGH0s6baZqrCjn?=
 =?us-ascii?Q?q2lqkpn7HoesuP6NVhdPso2dhdH/9/dnalxWl6LiqZCRRkhmJopptr0kO0zx?=
 =?us-ascii?Q?mhIZZ+jtOFR0Dw9r9ZSHG6fruAg+JC7rAv1X/QDEKFjscss8s4Kd26aLHXrS?=
 =?us-ascii?Q?htABmsc/3KFF+kVAMKMR88ra5dYOCNGoEqdshXBq9unYhqYimw9UzvlaHxCi?=
 =?us-ascii?Q?ROqjp20ay2gr0V0Ue+NKwp3b1Ug9iJFm0vpL83uLt3jRNNUpDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5JqJ7mn8OxjHz6eeB9dtQlVk9Yl3EBe5cfp9sKn78u9CrrWzcfL+DuUlPx1x?=
 =?us-ascii?Q?W/uN4JvCggJIPBwQd3k1SywYCSqTpGfHmmAviNg1uS49Pkom0Cj4ZtC9ld24?=
 =?us-ascii?Q?UdJmK648f5/3qE/2Pt0BcVstYHKiW+tkksr24FRX0Y19rhOyz7oq14PGU/3e?=
 =?us-ascii?Q?GKH2vcHGpl1RYvZDYtyKHF0NPdWhDasKhJiHQl5udyFA5eSXwwXYmjRul5Jq?=
 =?us-ascii?Q?1/eacktTj7JqyLwkNAD7nZ49PuKO8GgG1/RJ5zUsa2+6dg0CdTM58ediT1XF?=
 =?us-ascii?Q?pyiLzEW1vJsHWqrXxux0WxNr9L5K7wxgHW7MyqKNM3wXAnGmyVdg91iaruTw?=
 =?us-ascii?Q?KTeDtqMkDzpNhIkO4H1P+Bp2fgq2JphcCzW3FdTKJYchSreqyx5Jmu94U25A?=
 =?us-ascii?Q?b+aObOn0UV7Dl6E4EGo8xpVs8dUpfHbtkszZ0Xo97djbwqcaATq0kM8Q7hwm?=
 =?us-ascii?Q?NjS1Mb4J9JH5JeJ+CXiXa4zDTN7wvpu6gqUbPA6Bd6VYJMCpsvIPuDgFX0S3?=
 =?us-ascii?Q?LphARcgroENgPNhO74k7p75u5VjHm9IzrxdPr2vM6Y1YNwDtYcuDVsm/akeN?=
 =?us-ascii?Q?lCi5umiB/RDpWftVbsHw8uUK1q8fvGYcDRQMUYHKDKvgIOr9EuyuESVnQwyZ?=
 =?us-ascii?Q?ZRQ5UIfjJxf5hAcyxcBkA2ebMgGbfEhq4tTHggE529A+UxLKLiKWjJTmEwn4?=
 =?us-ascii?Q?2SK8igyzIKF5GlwrgPdKtjMKeDLC8LJUAJd6LUk6yLRsFSOn1gasn9FFRQ6v?=
 =?us-ascii?Q?NJvRnYaUjL9OjGC5s4V5ZnziDliZbvON5A6g6glJcrJX9CLZhmwDsdeOhzGG?=
 =?us-ascii?Q?JIj4IWm/mkZu56ImNuFrzHnLKP5+A76m9bDpk2i/9ayDHG/vWw5JvQ2f7hBN?=
 =?us-ascii?Q?jsfSGpMzBxkouURmic6Ad4MMLW9Y1biOon3qPMiQdINGTWHXjl++RE0a0tfo?=
 =?us-ascii?Q?JeqaIhiQaqt/3URTPfAtvjdWxgJ8TlmnVIciac8BxieTwuXkShgqbhph9Jtj?=
 =?us-ascii?Q?DS97WEK6Mi7+d5IRgBzTLqIqGM1dQXkYDNLHsOGQjZzLIkOKDpB+wjDYFVOq?=
 =?us-ascii?Q?QSIEK1DxsICRV9l2KX7jvQuXzZ/r8P5HM37IXpB/IBSkeElN4xVI1skEVB1K?=
 =?us-ascii?Q?rJXTjM5KWiKcGi0M+b1JDXLidSPC9RbpLOdapgYFKKy+EatrW62OxccNDnlr?=
 =?us-ascii?Q?BUbPwKt09G5HmfvQmqasZbnpm31MegjXe7TVstrfgb9wfdxOYL27erq0Eo6J?=
 =?us-ascii?Q?UCyINzpyyTXJZb97vx5OL9MPMpAWv/UbPGbzkpfafwSPp42nveQuRLy+DXy7?=
 =?us-ascii?Q?EupScFr8GltmSx0RCUfzrfk+AsurF9N3GbGwG+QSL6sz3HY2QIXtneSDvDTY?=
 =?us-ascii?Q?gPv5IvSjMYwCo8SmMD0GhMPkKXIxH6feC1n49dQ9tlSdfOskE5rYPSGaX6hj?=
 =?us-ascii?Q?kNfHnEXXwjFCVpr2/H3DsDqreIyAlNF5MJbiWBci/xltD/Ikq6SeU8O59JO7?=
 =?us-ascii?Q?VjpQV4gSOob1o+kysaXw2Eb6eScCgEqZRcjWW6vNIqyiKnuEjYtmQq8lzxoU?=
 =?us-ascii?Q?l7Wvp23dgNctG3zCpChmosz+DKNHSgYkrHKuyh9hhbUMwv05IfnbcvfRjYLL?=
 =?us-ascii?Q?Glk9V/5raTer0knjqdcDWeY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca85b8f-1936-49ef-5292-08dcb4e7b86c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:10.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Zq7vcpyRnYOF+bfQf9VR2x3sWUbyrqYGFWM3GaIfpd0oEF/RP0MHRg/LjzDJCckwWuoQW0o8x9mUyLcYF4TKOOb2IjkTSlYzz56/pGm1yjzCkv5OZZjD3skdV42VYFp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7846

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_dma.c | 2 +-
 sound/soc/loongson/loongson_i2s.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 4fcc2868160bb..3a7018cae33e4 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -176,7 +176,7 @@ static int loongson_pcm_hw_params(struct snd_soc_component *component,
 		desc->daddr = prtd->dma_data->dev_addr;
 
 		desc->cmd = BIT(0);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			desc->cmd |= BIT(12);
 
 		desc->length = period_len >> 2;
diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index d45228a3a558b..6b3a4d57a4b46 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -31,7 +31,7 @@ static int loongson_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
 					   I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN,
 					   I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN);
@@ -43,7 +43,7 @@ static int loongson_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
 					I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN, 0);
 		else
@@ -95,7 +95,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
 		val |= (bits << 24);
 		val |= (bclk_ratio << 8);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			val |= (bits << 16);
 		else
 			val |= bits;
-- 
2.43.0


