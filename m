Return-Path: <linux-usb+bounces-13055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C878D947270
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 793B8282ED8
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD90A2BCF5;
	Mon,  5 Aug 2024 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OhdZaoqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683828366
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818646; cv=fail; b=jT7czd7QsN+Tc7Q6av3wGmzM4iLosJt+fyxy6c7giDZR4dCqnnawWHT0gMy+lOcsi/OD/Rs3AXi8k8YZUrwf3iTg0xhcetOW+N5hXLXPIF0gtnapkI7QvmD8wHP2etmNVk+GHxsUm3QtaRvsK5F4Q7Zic8iVjctplX7d4AmKhLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818646; c=relaxed/simple;
	bh=TzHmMZ3IA1n1Ch0cAApz+Sl/07KzkSD4n6VDabTGiV8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IiV+Rk4+ywbCCvq7iddblEEFBVTbOBKkn635C8zV6/buApA1qBHqTW69MP4Ppu3XXi2mt8SaLEsa2wPZTtUlqiL+eRdE8Der5hHhaUZShrP9vlJR4vp2pqMhBpn3A8aUmGVzGDUV1HWNGf+IRdbrciX2NZJlw7GvT+o4+kX80c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OhdZaoqK; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeXY18M0QKkuINOjqSkjcm7pWJTDtU7kcTDVURMkQ0iRddB9I5zhCHYEYDKpHGU9lGa57g2riQtsbwlAiJQzx/qtZraA+WQP36uHjbSmGXMcY66MLMbSseaKsCJA0Ftkev5tKFdLXDS/lDfLiD6AZQz8fD9vYnyiKlWw02K06zpCivpGruaR+q2Kdt4QR7HUKqmuscX9yyjSegd3JGcyeb4lC47O7bKfAPTZzvYSkKKtFLreK7Ro3hwCZ2/ZiFxemV6LXpwg/PoUYNc65R0ScBOCRJDc6XKQeA1zm/I/1udEcbvEaziX7671YKwDH1hf5K21MFcd/+cctyfA78kLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iN3ylHoFXnBLmyC3YRrE+pMKjnmUEzsk6JQYYFL50Q=;
 b=lVdZNQA70nE0SXACpOkIP3X1/Wa+9aWMFtHs3KORRkQhBUcl6Wi+E6NTCSOVN4LDpxYp7zhda1Ky0Y06XdoTNrI6om2RcAHSjoQMuBlBbgSuIGnX8rbG7+FwR/cbTt17lB4upxLwxYfPg9VNZ32KtE/scbWO3cVmgzGSH3vaTwDDyUngI4VhampFFN6XF4AlFcwHpGayjK2ZCrwknH+BggltBAO29vx0nZ8vKOMDkAtisa/HWaoKyDc5nydtVgt10mAktOWTcNi4A4zzL0m9hfb7PeJ9x1iP7UMX6mj9QvZMbxNm1hetZHqfgCD+4bZb2Hhhq18tTRR1GscqYBq6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iN3ylHoFXnBLmyC3YRrE+pMKjnmUEzsk6JQYYFL50Q=;
 b=OhdZaoqK8MRV5NmGuu5FVBQLajW+P3TtQwQ3EGSbdbtk1ZyBDLpAHSemYSuoRGxOdwiYuIdksPzgPUJMsOr4LrwJeIS8vC+afyGFpZF1CBArHCRO+Rd8LEwbErzHfNBU1Q7+0LnU4sACOtEaqkPkUBnb/jZEaAZewECSlLgr5aM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:02 +0000
Message-ID: <87wmkvvlwu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 105/113] ASoC: samsung: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:02 +0000
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 690add45-484f-4193-bed4-08dcb4e7b37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LMkL1R0VyDyZKRZSMLA+MLPOsxbQa1ah1KmxVTf78SgyWPrJBVyqxCypxa5S?=
 =?us-ascii?Q?lifxSZ0Q5uOYQ52czvDlZgHbtLGlYJFQE54DP6rBgmOWvLh2Li/rx8ilYc1x?=
 =?us-ascii?Q?3opmvUDqUqAmmsODDVwM9TT40ET26g8QMsTEC8SmWoUeiSbYf9MZmZxgG6tj?=
 =?us-ascii?Q?s7xv4ogI58G9AVX5hZuBiiMZzjrihyfMwripMYLTtKoHgaHmU6Oav7+tYiBK?=
 =?us-ascii?Q?DK2BmmS7BSBjBrehMOX2cn0UFiD3dvZsvkF44W5Zg+hGyGn2BEd5Z3Wb5IMa?=
 =?us-ascii?Q?V6TY3gEBBe92WvZe3H1nHvdE73PxVlBhMzD3F9dtpa59UHf7Iuf8bmgOYDId?=
 =?us-ascii?Q?rAYNEZDw+NDBRe/39KLfM9weI/Wr7gyp4LjuCTfdzJssIuFEpJLAs24rXLu0?=
 =?us-ascii?Q?U1rZL3hb5karULlwyvDhDW6FbdhYuv8UnWSX8cUu2Pcx8NS2NwyFCTz3++5W?=
 =?us-ascii?Q?YHNgfWjof/TzXEQOIQy1kdBv7aBdXHnYLMwgLmbRoApz4E9uyXO4F6gTpku0?=
 =?us-ascii?Q?Rd91L/YGFn8ga1U5BfelajOR8p8JVys3TR1/OE7j0v6himiKnIQLylskqjLC?=
 =?us-ascii?Q?bBylhUwNwSfgOIJouLKJYYJlvsrYuO8EOeaWLiuk3aiE50HjP1ofOlSOIqtl?=
 =?us-ascii?Q?4H+qLBG00yHqYPAbANHl8t0U/6amXA4VwP9nT+m5y7CF1GEgtigIMCEhd0lm?=
 =?us-ascii?Q?a8evO4JW2WkKkLklhbGTWQ+rtuBGm6nPMUi5JhrYgNG5ounjvgR9JyL6Or8A?=
 =?us-ascii?Q?LVG+c24Y6BRllO8Qydlhob1jxeme3Enmmh0SWPFtnJO3sCNuwYwWBtdaiJ1j?=
 =?us-ascii?Q?dNDhop7Nnx3DKh3v1IJeVvYOkcWnvT1uoFQFOhPPl2tZU5bYoTabUvRqF9HK?=
 =?us-ascii?Q?xvXtd8oyru2WZC4iMDYi8M/dpUyUdyRJxar2JYSacw7lhUSR/o7gna2CVacJ?=
 =?us-ascii?Q?nz/TC9+gAPmWhA/4vQgAJn5uybtAkysZw7pE3VV4EdTTo4H7dHuUtylzwSeZ?=
 =?us-ascii?Q?Qa0g8Go7lSs7c3Pyv4FdpffxsQxRZ1LnFqxFtzQWj/FNq7uXu0d+1RTzXOAe?=
 =?us-ascii?Q?3ccO70QpMEsJg59CloHbkylV8VvhH5MWOPip+La3qLaMn5BJJFbci+aIBjiF?=
 =?us-ascii?Q?DLKWaX+RdbjlbkZzhY+M77dULPWvlJhv7fqqRk6naybvsMBuLLGE7hajbU+s?=
 =?us-ascii?Q?hr4kkToTqiCLe4xwlUAOr6aEywbtT5dHTHD2ZoV4HEbkeDKJhrETDdeDMSNm?=
 =?us-ascii?Q?ohY83YzqYMA9xGhqTKvI+gzq4d7LMMyn7vXksjBdBRM95NvSYdTM0+F2DadK?=
 =?us-ascii?Q?4LEfI9nDytIrlsYOVHQBcXg+V6B0LxIa4ZI/Yxu62Qw13sTO2DKo9RC7E2oh?=
 =?us-ascii?Q?wyZCt58egg1Casg/x6KFyMlhqG3UsP1Wo7LNXQX3wdN4dAJIRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aITRVHU7McpBIATjuNQFTbupEF2/BbOgRYOl60JqYLhCVYqLwCjQTrzOoMk5?=
 =?us-ascii?Q?WNE+Eg5Iol+mC9tciZFUQcJCGp1dfSVqH+Kkp0MAHCNtmbdbNoYH147iydYv?=
 =?us-ascii?Q?eLe7rJe24KPOzN2bg3bV53+6NR+v873o+2Ym/iM7Zb2sH9qGmg3jL4XWQbuK?=
 =?us-ascii?Q?wYVbkArJfM+n+64sAVeQp0VzQgRhlln5qG6niRxuWgVn15iGNdtJ1OlDKMDm?=
 =?us-ascii?Q?9Jz0RF8cDw0Ooe+2ZvrVA5+cEzAiwmsVjjkifsBsD+CFdjoUoB7cy6BF1vdz?=
 =?us-ascii?Q?ueiJOlcjm0OwVfneZZrmh3J9CfoExY/Q1GqoGGB2US5XwfJGa6dNuohSuh4g?=
 =?us-ascii?Q?zqdbY6Jc3cJRf8M0R6OhWQJ3+nf/IUudlauTUHNeqNt8/GnlxyD3Rv/BppyF?=
 =?us-ascii?Q?UmJ1db+BtXYm7S2WdyUToZMzz3xFXkHmpcRbxRgelJjZJY8ry12IPr6ZcrJ9?=
 =?us-ascii?Q?anlu9kkyOmq57qpsA1Uwv/7/Q0VVCV0PlEBSrqi1taZijOwqFMKiEL5SisAl?=
 =?us-ascii?Q?cYfrTibDMMFB6cTnoPI+d4Bf5NYK7p1+Ut/vr0hGMT+cw9QMmNqowJtFdqKS?=
 =?us-ascii?Q?HWtUbFMkpcJ3HZP2r7TazEBZcGCl6UIfFsQ0U1gkNZIvO0k+GQcX4+798o2C?=
 =?us-ascii?Q?elgRA7U4ApnnvMviPRpNN8tRC0cr9RLF7P2M377n45PLWDjsGbJSQZFJUUZW?=
 =?us-ascii?Q?RtTCbMIZMrRAWMlPW4A7nIVc2Ibvkp1Eit0OVmZmDjHS2M7bSI4BOEc42Bxj?=
 =?us-ascii?Q?DkbiUnQZ05sD2aOyxZrEkWW9UcHHkXRevmGCL2qGIJMX/gP0Lv0rdHtvHfnl?=
 =?us-ascii?Q?5UoKlOSdJpDSIN/69Xcj+WBv1sCon7pcOmTJHLcxZWv90+wCxzVRlD8XJ+u4?=
 =?us-ascii?Q?fLfFk2lh1rKOXrai3lBjfo6ChZQeTDG69NTHViq+e4Ha896VYiSeDaCaMhDC?=
 =?us-ascii?Q?eJ5ayOkTqgZGnF+yU7YXv/NHTKpAfXkgCEJ97m88Cygpo6VoAK2YK3k3OuNL?=
 =?us-ascii?Q?BESewT+6oizSwXhSr03uckVt3NpPvzQ2UbjoKXG/BZmLKjijmT5pMo+ZnuwK?=
 =?us-ascii?Q?bqnovu7vhmKbBla8Eq85LUrG7DPoefJc1uZOGPg/InKuIBOKmFi3ZSbJHsbC?=
 =?us-ascii?Q?qNzBEzmS+fYMztSd9JMNdydKJMzhKVyc8u9CCthcespuM/Ollm/QfHLMoVb3?=
 =?us-ascii?Q?iGfJkTj3COg1qnuW+ngHfVzsE4A/6YCAW8eVi/5clt5R+p17qejEfuiiIx1d?=
 =?us-ascii?Q?TACYsBdQK4N75r3yWFtGrFKX9gk7KHT6ieKTLXp8K3JP1nq2XSJlJJglZCUV?=
 =?us-ascii?Q?89V+R0dLwOgAOeVwavh9o6q2bIm75Yuj9IDnx4nz7YDdaq+Vo437ngE1Haw9?=
 =?us-ascii?Q?dGpo/iLryG/Ucegu+eNk/M3SrUtVlA9Ws4eVj8+BQLtPw+HtIpy6AQMlCTdB?=
 =?us-ascii?Q?DLzZplnn8/YiypwVYnXwIS6WrYaZRuTIDZo75zM9IEYliQ5BVqjcQNwKhAqD?=
 =?us-ascii?Q?jHd/DAbcpgBOWScxuFOjwP+lg+8HZ4DdjSs2yZps9TAASN2SMZsE1sRZKbXc?=
 =?us-ascii?Q?FFrmSuRU4YGQUez3SjaBX5GvYde88D54RLc2XoDDGyU3V9/QSzYqONHjC9Xv?=
 =?us-ascii?Q?yPhoQAkVne3wvRGa1zWX7B8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690add45-484f-4193-bed4-08dcb4e7b37c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:02.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H429NEUNM6phEZOKrZtS0zNHhkxNur4Oiz9JnKyoTDMXkSZSRvaUoFIcWBVCyr8VzGnXQhcEODMHgt9UP2tGQSNz7xHir9t6CFQR57++Hj+TSG3eG5FwEE1hYEZlpktM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/i2s.c   | 8 ++++----
 sound/soc/samsung/pcm.c   | 4 ++--
 sound/soc/samsung/spdif.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 1bcabb114e29f..fdf494a49dd92 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -744,13 +744,13 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
 		val |= MOD_DC1_EN;
 		break;
 	case 2:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			i2s->dma_playback.addr_width = 4;
 		else
 			i2s->dma_capture.addr_width = 4;
 		break;
 	case 1:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			i2s->dma_playback.addr_width = 2;
 		else
 			i2s->dma_capture.addr_width = 2;
@@ -936,7 +936,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	int cmd, struct snd_soc_dai *dai)
 {
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
-	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
+	int capture = snd_pcm_is_capture(substream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
@@ -1026,7 +1026,7 @@ i2s_delay(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 
 	WARN_ON(!pm_runtime_active(dai->dev));
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		delay = FIC_RXCOUNT(reg);
 	else if (is_secondary(i2s))
 		delay = FICS_TXCOUNT(readl(priv->addr + I2SFICS));
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 573b2dee7f07c..a9bcc2adb4403 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -228,7 +228,7 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		spin_lock_irqsave(&pcm->lock, flags);
 
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			s3c_pcm_snd_rxctrl(pcm, 1);
 		else
 			s3c_pcm_snd_txctrl(pcm, 1);
@@ -241,7 +241,7 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		spin_lock_irqsave(&pcm->lock, flags);
 
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			s3c_pcm_snd_rxctrl(pcm, 0);
 		else
 			s3c_pcm_snd_txctrl(pcm, 0);
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index f44e3180e8d3d..d5eaeacefd230 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -187,7 +187,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data = spdif->dma_playback;
 	else {
 		dev_err(spdif->dev, "Capture is not supported\n");
-- 
2.43.0


