Return-Path: <linux-usb+bounces-13044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CE947261
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874D9282EB6
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B9627269;
	Mon,  5 Aug 2024 00:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F0Y93lIq"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B193422625
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818598; cv=fail; b=Ok0PcKwzXWDEQ2Uxhlr+JS1oHd4YJNC96sjVWI5DyKRl0nL0qUOixxL8g2ZPOYD5Kuv9RzFlSZM4u9vGfxstPHcnipIBw4tT5bgvJvc6gML3jWUlTbpV74SWtu0lcvswSkS7E746ZfYR63Wf0CpoNT3HXyd6nd++dvKUtzh3LlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818598; c=relaxed/simple;
	bh=i2U9w65LhtArzASVM+yMcThBQrxVWXZ7vPwjGr4nGFQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=co59dx+RfZJ/QNrySFIsfL9LNCD9WAM1HqO5BJiZU7uc7AP4w8/jX/rvQ5AD2VItd6fRCUPQvpVg/ZG8mao3qbYxmViYIf8VEqE2/6O23jorj2scyfSmzEACkd8zZCbxdyHsr5tNDeiguy91RYb34sYa6B/+Q6zre5Pj1tRRq2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F0Y93lIq; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6ECpTxyhfgULFoSIvaWoZ+Bc5lK7+ipHlDln8+SGMa6QjR4nc0xt41KkJoFNTZpVWYWNSlAk1b5As8A1gAa2ZaiMtC3G7m0GifDhG/3VheUraRj4LRyxhVJnn7YrQfk0KD85ylTswARjQ0m2UVIa92CNTRt99up5WKPxJdr38fhRMnEPM+dnKvum2EROwgG8fLE+YezcSfrymL68CTJBAAqI5EPVLR9GxHqEmOvpIh67807cbBVf1jv6KMISKYQY/jytQjLxB+4ALRIWR84o+A9Bg+yiOPDKs3ESXaXXM5DECJsuSjibKY6SrwZzc24Ioywj01Xee9FgERBqpbV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+RYNOHpzaLEIH7VZlHGx5RNIY/hvoiK6DzZMUbxu6U=;
 b=frY/Y+7AuSapB6LWxQYCKJh/K86TZNntqvd/tTI1rSVWxmSbe+L3Zs1j2R4ZXiiIsj7JzFG0ZRkuw2Ua7Jtuj7m6zoxXBqZCfZq/WVpKxU0Ipxjam8GgAnKmLqpekfPiXvmwreW0Wy0dVF/HOJOwDhJwpTsYXXsGAwSeiz8hjTYU+HEEAa+YZem/chIzAtGvNR9PysONfXCjWvvGhJMak+wEOFzDAYuoUI4agdstWxhO0EJ7XPMUqg2a9CCKpdjEzgk4b8riKUEQdaIrcUX7Yvay6nDX7OIJ2NJ8L7DMVin5LEnikUSmgfK7SLCZz+YzlvqTt6mIacUM/0qYnrYwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+RYNOHpzaLEIH7VZlHGx5RNIY/hvoiK6DzZMUbxu6U=;
 b=F0Y93lIqy4QN2hOJw3ZBlw8nyf/Rgl2jjOlgZx2TqAlfUWc0uwdu6LSct4rgN8+7QgXYK6Bqa30AY4yfLNzZOOUQg9yIIsVNwTkhlCR4pUciaVnB4RrRoDmlk6ASdY3uUG65u7TwyydpYw1ZD8S3wc/XaOHEgbF4XTxRKGBZ2oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:14 +0000
Message-ID: <87cymnx0il.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 094/113] ASoC: codecs: adau17xx: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:14 +0000
X-ClientProxiedBy: TYCP301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9189a749-ff02-476a-0b07-08dcb4e79711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3txhkqFJos+HgTPOZ+/O+s91CzGFHqG5mnYxYYH2dWrQ1YcoZ0D5qxgbw/1o?=
 =?us-ascii?Q?PhFDQq/1uHLIbBfYYOOG7xbfp1AilZsX2dbzT3eauITuW9YYvX6u34d8t4Ja?=
 =?us-ascii?Q?qhbrLW04QqnRd1p4eAsfxUIZ4ewhlODOcoa0md5MleHK7L8WjUDT6aG+zy0l?=
 =?us-ascii?Q?IRXpXm1PCJ4eoQ/ca3Dible2fBo1rgn477AzRvbw02GM7eI3fWIII0l7dF0S?=
 =?us-ascii?Q?xa1c/OzvEf9uC+EVjHYFTr6VzInCOIEo/vSRzivAD1f0lI6mFz81FZwh8SXl?=
 =?us-ascii?Q?VUbClMEnf29tPro7YfDFKqpsqPsW0dB8ZgVFpa/2MnYL+Em+4X1P7f8qjYBk?=
 =?us-ascii?Q?MPMXV4qnL2cSq8K7CUtnzPdwvUT5z+ANYdK9TDsXEMe675ipsZEn8e3LKGDo?=
 =?us-ascii?Q?e1lvneV2Ev68DVhFs9MHno9iY34ZnRxQXw998dL9LPj+MnPdPaZCcxVPZcgp?=
 =?us-ascii?Q?uAboOTXgVlzbSiHyJJw8zMfyizJ+zaWZS1THZPa+b3tBCW/H8JLeKxG0XSuz?=
 =?us-ascii?Q?jssYX1fXB1LQkwOzQymvFkk8iIPxkCEdbiX16tljJqpKFRq+XrhaEnBZlBHR?=
 =?us-ascii?Q?0YUnaE9SfZMsNw7k+K2549dwpIALUuZxkufo9c0VVGWCiKbOqHCWz8/R3vds?=
 =?us-ascii?Q?DhSf3tiez/R1OMJFN0ke72qTjhzkny4oaYOv00QotXXNYy/kHj85j/1pTiVm?=
 =?us-ascii?Q?xQvEwmghxcNg0evzuC2MmNMvgwwx20BRKTV0iF05/Z50LMhVmh6OHvZzjtl+?=
 =?us-ascii?Q?6T7D8ju55A6qap8ohiWgHHT/alEg4EXkDtXKK6vwWejDzUsXkHwIbIENZk5q?=
 =?us-ascii?Q?woBTtodzBEKH8RrC5HD41xKp6bdi4cClLo0eAygeUMICUECf6Ip3oVIz+G4a?=
 =?us-ascii?Q?MuKpvY7RBGgJQJX2Z/G2oE5TpUHJqgp8vY+qd5Eq58S7K1o/yc+jlW598P8s?=
 =?us-ascii?Q?2002MTlbmnkv8FGZRqbomb5s30U7Y4TgFRD2ACZl5kF59b7Vx+N2tFbSQDO4?=
 =?us-ascii?Q?4wbikUbndgm8DbYdjOV7i6YevsfCsIP7sec1WZevH7NLkyAJfWVzGFRtOjvj?=
 =?us-ascii?Q?4QT7wW0+m8wHS0y6dSFEtgd2DvT4Lwt/bVOtM05Wn4DJQ3rGRjHDI0aRiI7C?=
 =?us-ascii?Q?mCm39RBzToIL/S2fAwSWypF0xUm1324cvbAGNhyzcRmDVvA4YKs3/1hv3Yut?=
 =?us-ascii?Q?8OkuoPs+wad4dlwVWNUsriz9BJLGTM0Mw6jiv+44+EpcceJezCi+0mid+4zG?=
 =?us-ascii?Q?FB8aWdiuXyVy0b9RkeGDryrABNDbQ/KRhTTtpjHwSrzwqpg+NzuZF6m4lmQF?=
 =?us-ascii?Q?8u3k9oOK6N7jX2XpIHZWI6/4Ln11vf2CqZznQd0coFcrt8dp9ufrxuWqmgj2?=
 =?us-ascii?Q?DVTWGiXApb7lteKwz036nIuUUJpQnwUV7M+T3D0HgCh+81WMVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6LMEjUbpzXO1UD9aK9OAC2R94xTB3/2pIn5H/08juFxPnXy4Yon0aZk+xQQg?=
 =?us-ascii?Q?K/oICSKer+/K4M9LEhCkRbzyGR6p/nJ1DO1/8EcxxQCS/G5XvtiYnyEsysxW?=
 =?us-ascii?Q?LsJkXtlNs0LRN8h3nyqCPSAw+hpevW0Zs2K/7eHLtVGbHpHLYwNHRvFDjOxC?=
 =?us-ascii?Q?E7RdaJMK6T8CC3jssWV08/Yzcc4M/8ml5oox11sIwt34T76bpAxOkxLA/niu?=
 =?us-ascii?Q?GA9zWBWN1KLhBqNvXNMvzbDccgthDIxHP3/ygq06bf5UuGQ5yLL2F9jKTfx3?=
 =?us-ascii?Q?MGV1EWdm6Z0EuCKm49yETxSFvy/KRIP44ACbrhqnvfXaEBaekNzU9ptNas+5?=
 =?us-ascii?Q?i17S1esQceTRwWkJTPcIijh5vEYG9/jf/rN4KDWLzgih1rDFKqBjFue2iIYZ?=
 =?us-ascii?Q?lebQ3uuI1iJ8fqrjCXLY/f8pYqvYAAv0jBEl+419ZrKkjm7N+nqLCGTqvnlT?=
 =?us-ascii?Q?1L48Fnol550AfcLtFF4USt5BjYJzZjrO36wk1awrmqYuayhM/ijUE88jBcRJ?=
 =?us-ascii?Q?cgqqHNt26VQz8sHmnULpqEC+solmPYP9wDTqtXqdqPfJVcm4Q7CsxQ3e0pxz?=
 =?us-ascii?Q?o1EV88NxjDOKYd0Y9yF9ATdVN0HBnA9Fad0E85Wze6OWQ52gBYg80AOLfWmc?=
 =?us-ascii?Q?FO/N0KlXU+LSk76gZJhN7SqGsjI5ordx74bOKaNmKhZUmGchDRjJI0wun3Jh?=
 =?us-ascii?Q?bwnPkMyIgJWrtDF2A0qu2aT3SVE0tPMfEmTzvjU/niBMVjVQNe5HaVyCaKIJ?=
 =?us-ascii?Q?YEG6rhxtkw+IaMsryaaugfnWKQRFMHEd5lYcFL7StfaivUi5oakSl9Z8t1KR?=
 =?us-ascii?Q?EFFs169GPdO6sHp0kRATp+37js0vTZgTJIwRU93AHC4Cw5CgfGYIz7Ko4zzo?=
 =?us-ascii?Q?O6fqmGvWVfpZGi/3NMdxnJRR6MHAY98FIcsvVsHlBvy+d7uXDhPjYmRzZDYF?=
 =?us-ascii?Q?FxLUlE9tGr+1niQAa17sS/lMTKHBkXJfDn7KsvD+3TcVN1rOy89gVfzFG3zE?=
 =?us-ascii?Q?Y14JnTNwHf8qTSWyFdWjeLxrDU8NdMASL7tnQkxeSMdFTPQqExp6Kmufm9FO?=
 =?us-ascii?Q?Z5TifxJnxfXU2MLKCPo5BRhvQuoKGRI55OO9DgWwvrya6+XMvPJizSdXuUoi?=
 =?us-ascii?Q?qqUU9GwVcHKtOp6fWR1Kw03QKUs9kcAk/t+ChDG6Pajv9cPg9L61ihqxVSQH?=
 =?us-ascii?Q?egsUa6F/mAp+peSfDB0+blHJYMS8N0Vfeea1xYAx71HwtTfyX5QixoEqp03+?=
 =?us-ascii?Q?axdhsEOg6t8tCO55tbGmFmQkAZIGKjH3J0DLJkSUthae2iN1Gh8VH/BL1PJp?=
 =?us-ascii?Q?gsVWpsaKSsItzMWEVQJguDBktCu+wTx4o6aCbauSFv5gWKLKvz9zlOcSz70H?=
 =?us-ascii?Q?mQnw9284J+1X0/+oXMSRprEbMrtm2dkdGpflAmXKmlZMyfnAN5BGiNYlpBAG?=
 =?us-ascii?Q?F1bQ61ERXBl7N3KvhTO6fm2E+2xWAVfR2kyo7rq6fh5VzcW6UT8xgq5Xs5Av?=
 =?us-ascii?Q?4UsxtQYSt97sU9Mu2kI+Bp73+LPOAcptn4O9BL22Zo6aM2QYvjfrPDTq4Qgr?=
 =?us-ascii?Q?oDrjOPvCYIapCIiqsHUshHhum65/QUdT0RIDdkqnKc8iShCV3aEzIl2bGSoU?=
 =?us-ascii?Q?9NKWgIaMcYotx2yybSdHgrQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9189a749-ff02-476a-0b07-08dcb4e79711
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:14.5404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJeCjvB5ZSm7C53ZVXwvVzD4YuBwokFSKoTsENYVZVqNdnComqAjHjUCR2ZVihC4+98Nt9jpAj4s88Shixw86Wn3cdX+9xZBaxXF9797IAe3PmUygnBKCQx51FCVb+bc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adau1701.c | 2 +-
 sound/soc/codecs/adau17x1.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 8bd6067df7f75..8f97eaca0be59 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -469,7 +469,7 @@ static int adau1701_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(adau1701->regmap, ADAU1701_DSPCTRL,
 		ADAU1701_DSPCTRL_SR_MASK, val);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return adau1701_set_playback_pcm_format(component, params);
 	else
 		return adau1701_set_capture_pcm_format(component, params);
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index f2932713b4de9..2d3579bdc91d1 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -208,7 +208,7 @@ static int adau17x1_dsp_mux_enum_put(struct snd_kcontrol *kcontrol,
 		break;
 	}
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		reg = ADAU17X1_SERIAL_INPUT_ROUTE;
 	else
 		reg = ADAU17X1_SERIAL_OUTPUT_ROUTE;
@@ -237,7 +237,7 @@ static int adau17x1_dsp_mux_enum_get(struct snd_kcontrol *kcontrol,
 	unsigned int reg, val;
 	int ret;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		reg = ADAU17X1_SERIAL_INPUT_ROUTE;
 	else
 		reg = ADAU17X1_SERIAL_OUTPUT_ROUTE;
-- 
2.43.0


