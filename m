Return-Path: <linux-usb+bounces-13020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E88AB947242
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8691F242CB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBAB20B33;
	Mon,  5 Aug 2024 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OoczelTW"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4961218B14
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818452; cv=fail; b=tiah1foajXBX4/y+m68qHkQ4zkrxSWaZKTLQSwDS4Nxxm0UWAcdI13pLAyCBQ7llea5Hl1sAtuvodq6HRD2oC6Lppw4NtPTwYy+rKvspT80mIzeZ+eIhqbNHTWmn7+lSuxTdFd70/4qQjKwo7+yls1lumTTtYLFzbGZ4aQ/Q77Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818452; c=relaxed/simple;
	bh=tNRvy8crAkB7lULj4Gk/xlC4WPnOpGiIPeXXi5pYxiY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nA+oFZnu43ojUzb2s72rjJKZEgUhEdlRoMhneqZN6jMThUzIGxY1muHLxPy2ac8EoCzEJU3Z7DJx5EFahblKHUe0DEue2AYTlwZYtNCh8dtCAhFYahHiMHKVI1CO+m/nW2+ZY8b1fZhYVQ2kuwAwHGpekd6cEuNzbTsQPoeDhec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OoczelTW; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGg583pEAUj9/xnvKPnLCTvdqtL3SK0WzwunZqnt98Qn/xOjhrUYVxZaR0VSK5JGVN8nyws3XLjf/BcwToysc/9mKd4Ly4wqc3m0ShTWeS9E8gR1aSlk5T16SWipBBkoszO1Q7HmnVV1ycVcCWd/sgZLyqG/otbNns7iH1jExk30cvenJHu9p/UPLHEzDlRiG8d3UF7U/YHMXDiLgSvVjSwOwQDg0lsR4e9BbJxQzcYVmy+66IWaJkvyDlG4cOdTYrnpJjlS5Nk1oosXv2NNbL2ao7TS2loxvb1xXCV7QiJXfkqbjA7Fu+6MEEqynwSWhBK+qsGn8ULlGTe2yBvwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CjmdQtWhok+ZSkCeTchM0puxaRrEMNYnau0SpjJ1VY=;
 b=Fznsv2TI+Mb/zOux6yOx9kPWsgApyDoAWhZwaX+OIGP1KwHmyRqMl+Rm/h6cDsg73ds7bTm7VGz26QqTMXJkzrV2XR/AZ5v6rG8BDfs32S9kjNb2ldBtC26zlwPNydYw5X6NNeDxSRkKEzhD9R1+OVi2l8Q4GZfUTE5LHIBU+JQ2UIjGmr4ir5aeM6lPjsrvH8oUN+JdsvSRfB2litDylygbGe+F0wFGcI1L6lQQaU0VdM66jDp9uxEkGtd7bKJeHQX74vYLKJEVuxVNoSj5n5X5zM0587fiYWdhW1y1/nee5fBRk+0kfwRPOqdqsRHluz9MQwqLSv7C2z0xnPpNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CjmdQtWhok+ZSkCeTchM0puxaRrEMNYnau0SpjJ1VY=;
 b=OoczelTWwSZlQqIEP30s94sS27ErNlZ48Y6wAor1Je5YCfHf+ev9hwXsuprdpn5wsCQmnSPnhAgRMFxwkPC4YSEaXrMHJGxKjck1YOxcfKcACm3C9VWF7h7krxAeZcZ9jdDI6AmXYq6y8XrJ1OP9eo1dr9Bk8/KOdsfLRx6pIH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:49 +0000
Message-ID: <87bk27yf73.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 070/113] ASoC: jz4740: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:48 +0000
X-ClientProxiedBy: TYAPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e26c07c-0995-48a3-2e97-08dcb4e74066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3wagmeUDg7ikJq0Zpd1FqMH+INwVPPHxJyQcUmIu78mBHHU8so7aW/Vz5b0L?=
 =?us-ascii?Q?wnJ+HsTWqFVXuZfBLANB7b7KqxuAZnCcVFgcq6u6CUodlYxpq6F0CF2Nzmeo?=
 =?us-ascii?Q?UbWtO94bcsL94TLU/hmEYfFPIRPMuFqZujCcdQPLdcu6CpqHYjYklYjE8IzM?=
 =?us-ascii?Q?NkMLSZF9l3Fq4pngvhP5mAIZVbXfxxCoIxKRDHxdYOzMx1yYVOej8hvkNQkg?=
 =?us-ascii?Q?zIqzeZf+O85c67EbMP9ZeNRU6qivAX3yuRlFtTLIW+9U5F+s6c7dDgD+uiOH?=
 =?us-ascii?Q?FE1bGVOYLUSalWa3sPB2FKxs2XtCpFoVDENU0QgrKM2JMUw+ec4zOw7jwlE0?=
 =?us-ascii?Q?iJIhQQ8YVWOzS60eYB6AwY2/P66G7WKEqbXtpw/IWX38WCS82ERFfWXpJ8C7?=
 =?us-ascii?Q?e6yn8iowljA7+3xibKaKkdZ6pKreJ79SePAp5ycSDEQTTYfVHD1OfT1Sp4mH?=
 =?us-ascii?Q?qlFkMru7B40CQvWDysrCQbOnsLwfPeFuiEvODxuCce9pMIBbIkAZngU5YZPi?=
 =?us-ascii?Q?PeqJ0uiXn733lLHRKToPAK4sjSI9qbmkCZy9E337iMuqzCLHRJQevRhwt/aI?=
 =?us-ascii?Q?S9ODZ7Phyrl5JFs9HOXkIctfm5NzD3uCZwvMKmxZOe7e5GiKWAFlvIhjjqP9?=
 =?us-ascii?Q?mlSg8gWxKJWrKmds0CW9tF5JXIVa5lOU2uzQVbEH9bPfXnoRovGaRks/ER2V?=
 =?us-ascii?Q?aeaQAXiN4lgoX9FV6O0nw8AWDNwOBN0dCGfX8+83GoXQPZn06wuEGZqCe+xy?=
 =?us-ascii?Q?LwYOBw8zNbD8ve4Crd5h7NzGfPROwz2R4vZMG6ZecCLNn+6R9TLA9E5+TBLM?=
 =?us-ascii?Q?CozQ3odwfNUA73U14FNKRuMDBE8+qe1wj3AD4ISaRuMBpOSA4Gatnov6ATxq?=
 =?us-ascii?Q?hTsy4/T0r5WprufOPmUQXjJF7tlbPwmbQ+t56FZqp75Y+qwjmmpH8+eNiuot?=
 =?us-ascii?Q?Mo7VAQcGLZEifvDrKVF7YqSmtOiOVSnU8skbNwNuAZyjc7KozKGi1KXVPndM?=
 =?us-ascii?Q?56pFkueVlrqWlAzl4HVFi5Yzc2c7qd0y9sJzSmRuCvrLPKN3iW1JWXf2VG1s?=
 =?us-ascii?Q?fCCeGOSEO/Tgs+oU+x6H1+nBL93Z354RTbsJE1o9y8hlBslewI8VYgao4ji2?=
 =?us-ascii?Q?pEmANAhaH214eD2JQ640DbsT33M1kVGj5zbHECv1CrSEL8qv/I8NLR5tnnVw?=
 =?us-ascii?Q?2xnlxrxS5TYKBiTZ0VOp3Ns7xR+Emza8cBWmGFoFatm+f95almBHZkQMKQMy?=
 =?us-ascii?Q?+HokPZz25Dn1zLf19hVQXmi4Ui3z8rXuWM6AHzZd3+mls8dsQ+jkq58i2U27?=
 =?us-ascii?Q?aYRX4NCFCu8hSGXfjitrrODHkY/YiS7KuwsgW63/s0qjU90+2wYSJbuHRo9P?=
 =?us-ascii?Q?x3XEWnEPh4s/zTmm8cWaBnWJxAQ6hvahNc9QpQx5GMexPfLACA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Faf+h9PHKS3SJf3zpvled+3UJ0Scr/frgUotu6qPHKNl0wCiOIHXP9AC6s3T?=
 =?us-ascii?Q?MzfN7rfXfOXPd/ID9Nv3/+8hD+No/Nm1dPHd8Wnr9QJ3el819EvXe2SY9kOf?=
 =?us-ascii?Q?qgND7k8A4xOSptOf6goDGT8SHMZxyiWIwM60KHDv7+CS75U6DOiU7jteTCxi?=
 =?us-ascii?Q?YEx98wjACMrNHEJKIom//CsMqAD7bkUqqxw/DXsy7OdXWwER7gUhJlU5QltF?=
 =?us-ascii?Q?GeMpzPDCkpeUS9rw1oU439UAge4xBacZ8/3Oo8p8SmlcNTWOAxP4cFrvmryv?=
 =?us-ascii?Q?W52sPZOxfaC9JbQTelh1+oUYJD1rrjtHlywFn6FqtRKgUP3G4KLWEWqVLKoW?=
 =?us-ascii?Q?u443wEJZ2WDcXzFRcwQJhGOYVXETkG0F93VOIYdAlnLo0MLDy7kjD7CubxqF?=
 =?us-ascii?Q?jPTg4RA0M3F2Maugpmzm6QpfZRWXI7Ls09LO7iHXsI/Bn5CvwFWFTi1jXSA9?=
 =?us-ascii?Q?evcRu+cO88ilnwRomlnVSsv00kubzc6rYPdxqUwdM5W85JENwH+x0q2xxs6K?=
 =?us-ascii?Q?4GIaFkOPZG68qeMdsUVCPX+ea0uWZNP+k3ygWjZhizMf+d7Hiuqo0Fp+7Bzx?=
 =?us-ascii?Q?+UM3QiaHwKk4PA3JAslWJuvttG4l9NyFiEFsLvkdPnMiLvANSeZ0ITNI7s8R?=
 =?us-ascii?Q?DC6XV7HvAAvq9f+D69JWuWc4djvJ17LpQt2+obYaPKIjt3ENQ1Fx5OiaQibr?=
 =?us-ascii?Q?WJFPoxjAFt+ctmdO+mkAgNM492lWxMcUu0uMeyxipZ3AsBLp1HfzIAvj3VVB?=
 =?us-ascii?Q?ESq6ugPhX8y/fyy83bUD1gZHirvyn2r76rfEnlhL31CQfucZgezRvRTYVpT3?=
 =?us-ascii?Q?nxI12j5itSWjODl6brrTTLqQ0YzPY+zL8JyO73jC8X4ThjGtYjQT4uonRlYX?=
 =?us-ascii?Q?6hn8KG24BMIPgY2qJuW8qo9kTpoWwhCa0g8yXQVLT++iqPTb6Vgee0TOrI6s?=
 =?us-ascii?Q?5Rw4p9dSxg0aHYFrAVqEVGI0OlehrsnVccsPmYKp2HBdaUnevyXx1PmytAGI?=
 =?us-ascii?Q?/5ZBSOvtZR35i0ttv9V2lsr1u/VSbmT/jfg0XSBEapu5GcQKUgxbEPT9qhzw?=
 =?us-ascii?Q?0LLuZQNustkvj320QcR7Td42XMD+6mEh07GOJ9NahT+/rrcxIFAkFsMc9YCe?=
 =?us-ascii?Q?6Xw/HX9gd8BuT1f9/DjsP6gp6zfd2htT3UZZTwz4rpTwloDSXkFSzT0nR7Jd?=
 =?us-ascii?Q?IK2c8yLSZFPuM3zL7EOc5RM3q9PN9slmli4+StdMEq3JTMiuDO7pNANQWfmH?=
 =?us-ascii?Q?C8gG8Cch6wedjWUVdN9PWtTdLXr4UZNc/MxOtlwYjxOJCy9/tgffWx7YpWj+?=
 =?us-ascii?Q?oN+2ekRZZRwaH0ig1bwVfk/qd7DYH1HXDto17uzquvrWvmMPygEQThBlj7/t?=
 =?us-ascii?Q?RqcRS4VLoXoJNPciteaTGLaLwcp5C5qJynZmkQ/hR7GdX1ACsJKl7OD2Jqpt?=
 =?us-ascii?Q?jmlis2VP7dZCgs7/MfZ+byvSSlH8OGr+oaPaRwRU+pR+oLY/aMBeyUI63S/R?=
 =?us-ascii?Q?VqwA5qNUrNuz6sSGvpTS//bwdbO65E+5NBTXHqlhb85qVPReiVD+fgw40TQ/?=
 =?us-ascii?Q?4M32ZDZF+qnuEvQh9T0JwQ/vM3JR80LOk0vHhyzF9IgE0HbEBpEf05XhaXWW?=
 =?us-ascii?Q?qb32SbR3rOshiifwWG5EX/I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e26c07c-0995-48a3-2e97-08dcb4e74066
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:49.1528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKkMZEWSmq2+Mktg1YNG5ZBYhJ0Y9TctOBOvgzzmtpxlvjmYheC4RmAH9+KEQTAKVAwiCGz1H5iaA8JqSsBLNTZrq18LC3MUIgQhkSTf6FG6slocI2q7NuyeH0bz5H4+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 5176195316158..6bce5c08ee45d 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -103,7 +103,7 @@ static int jz4740_i2s_startup(struct snd_pcm_substream *substream,
 	 * because it does not disturb other active substreams.
 	 */
 	if (!i2s->soc_info->shared_fifo_flush) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_TFLUSH);
 		else
 			regmap_set_bits(i2s->regmap, JZ_REG_AIC_CTRL, JZ_AIC_CTRL_RFLUSH);
@@ -148,7 +148,7 @@ static int jz4740_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	uint32_t mask;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		mask = JZ_AIC_CTRL_ENABLE_PLAYBACK | JZ_AIC_CTRL_ENABLE_TX_DMA;
 	else
 		mask = JZ_AIC_CTRL_ENABLE_CAPTURE | JZ_AIC_CTRL_ENABLE_RX_DMA;
@@ -278,7 +278,7 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
 		ctrl |= FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
 
-- 
2.43.0


