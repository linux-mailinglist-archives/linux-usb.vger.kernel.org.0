Return-Path: <linux-usb+bounces-13050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA094726B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38FAD1C21759
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A9A2B9A2;
	Mon,  5 Aug 2024 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZJ9bQtHg"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABB12940F
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818627; cv=fail; b=glDgF5bJmI51pSNTelKTV6oZsSP/5Z6IXK0/pH3Xtyfib7iJexxtQaye1csM6Wua6QehKzSbab2ZbNZXkfKtFzCaGORRr424sCHRgqCAmNPbAWEiz6HpOX0BKkc5mqyeXILmcVSorIrf+zpP1MsyDOx7eDFg8rspefcuz7RbHqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818627; c=relaxed/simple;
	bh=1Vbhs1VUiJBtvZpso8EE95MI4LS1eaL6mVxvIF4MrgI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LJaqKlAilXgRyR0MIVGDmVxLtF51UMjk/5TlzvRUw112U7MYcqfOVaAMtlZH8rK1RRtykIbkW3pqCk3MTqbSW+xVZPW07CYcdIGom6dAQSMyV5Q3Ap1cmIE7Ji9QVEKI91RwChm2USwGOgy+NuN3Fqsjx/rD2c7LtLcp0D01Cvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZJ9bQtHg; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w75MLp4hG6eaRH8uMaYgZiZwW+KIjqQkAe/Bi86gXCGSyZlDTOjVbY/jFpPsHMR/xQ6/PC2ZzhqsgUPdTZVYpE5QOh3nR+f1JNvEsWYMEgQHU8l6D5pfOe/bfu8qOQttzUKtAyzfM7x47SOkrpIHw8pbW6XosvDel8/oxzQnd6SaObHBbee1YkLGdEguiZp8xcBcwpCSUF+dBaPHt9elx/M+YlmWqZTdSiXxl1iL5MtWYcjsWCWncL8fUj17Yfa759tHfVQbxPh9pgKeuTzGN9fvy1E/8soCCTmYNDDqRRYr+WvkFGd02TV61TpV+RkWYRtgrj/W7N13qShCif8rUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NjoCoI0+7+11KCV+4XdKT1h70YPw4J5Kqd8iXUS32I=;
 b=C7MUrvlAeWFhBy+j8hePl0sa2w4O0SBM4SFos5IbgByPfGqSGCqcGpY9uOiCCKXaGZf0+3eafvaZItCj3mNfhtmZ0+/bvOYv2cYgP6qoJu1Y/2XfLPBAGoV11H+/WVSbz6yYwHBFG81XgPCbpVJZbdVcji97PWUiZiMjc4nHrVJxOx9kUB9O7O+to2w4LiGk+CvFQ81ZKaIot6njsAVStcw12sGupFdN48eX0Sk51ckxyKc+EOCdEsR0+zycpihNldqXyHvFx8Hp5JfxVzTuNtRIq9wPbXdUkwajuQKlZkq/qrtpD1fxh/jmQtNQKqIE6ZAx0ELAw4eVsXbM4rZh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NjoCoI0+7+11KCV+4XdKT1h70YPw4J5Kqd8iXUS32I=;
 b=ZJ9bQtHgsz4Af/OY6v62zYXDdV8dUnYrPYW+dP+xu1Wyxa/nKhJCVwwDUuu4w0wycG4G67zU9LfOpWz612hjVD9yMhlx5F+RrB/c3AXCm1M89Mx/3LHZKj9CDWo94pcApy8joN1aENYVN7C4Jjmw78couxwsyhvHIvOGRqMkFiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:41 +0000
Message-ID: <874j7zx0hu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 100/113] ASoC: codecs: idt821034: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:41 +0000
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 4314ee1f-e0fc-4d94-e0ff-08dcb4e7a73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1OhSoWlmwz/qNIWd65xhSnCalZTTFmjoXb06YLLs8y2GNMl9s4UiTYZG28wR?=
 =?us-ascii?Q?5LjdYQsnelvkVJ+Xqf+e1Bn4vjojdW4r8uYxngeIyXIN7Q0PiqTbDZt6Qxy6?=
 =?us-ascii?Q?LwBnRvuWSmJ5FgzscnoMUDF+mnLESQte/+tuaNMQIO6OsCVEyMHXWhw8oLI8?=
 =?us-ascii?Q?FCrJwDXj7uuP1X3K449oZBkNzjdvDHBvwRu6iPKO/CSIvT4nULlbjgqSok66?=
 =?us-ascii?Q?MMDtsIj374HE2K3G5nVof428Pv7xv/H58tlu2ZUOqGN/MYfQV7mrJrL8b8PD?=
 =?us-ascii?Q?UPO67Ux1Bb8Y+UeOu2D3eQ1hP4+oYRk65SPBLVCjhz4pe0YZpNkI8YLehKe7?=
 =?us-ascii?Q?b52JJY6XY60i6iY6YA2e03dZW1cD1Q9wLSKg5V388T4eNUDZZSmYc9GH5VB4?=
 =?us-ascii?Q?aGk+Rttmw+nYeCClFrqYPUCG4Huat8LLBKocdc4VSHUgYPXJY5WNDjmgmUhL?=
 =?us-ascii?Q?SMWX5XWvNuBWaKdTcRXupOL7EZQaCujgZa6YRH186/GsxI2N22AhmDU3ZsH9?=
 =?us-ascii?Q?kRiyap0XFmJuRObtXKJe/irhhvxYmztA8/SLFUV9zMIySqCjYIb5YF3VXHu2?=
 =?us-ascii?Q?MMerfqd2saj+ihAb0715KjGLcfJ0IqrPoEtLXk2DxK1RNkeFL8/tCNBWc3Tq?=
 =?us-ascii?Q?pL3e43EWGdSyabGFY4Y/G2c4ZRmkouhlXABtXbySD4VBm/oFDZEeMAClwfHL?=
 =?us-ascii?Q?0fyw9UHV38L1OQH0KXRXAYRfM5d9pRGvk8T2i0F26xq88KCh7BHD1+C+pzfB?=
 =?us-ascii?Q?oV+gGQh4Or6ARQjk3WmHusyauVNxBeg0p+YlkpePe9V3Xfo3Q/N/kaOvvNc2?=
 =?us-ascii?Q?7G5u0Ne1HEIa5lNPRlr54BP53qoz2Z2sU7EjNiPcVhx7iYJJRo26TYRS/y4r?=
 =?us-ascii?Q?F++e51bYKpU1WS76da+Exz29GNacgX05GRF0N1VWJ0E9LGEu3ocbWEvHnvQy?=
 =?us-ascii?Q?ooWKs0hjxKzAAOdx3O+MGPqo/UysItZYGHhhk17JFUUseZsfOuMQow6llkaS?=
 =?us-ascii?Q?jl8UsVnJwuIo81PC0WhfeFK4uDSUqiEQnqq3y5PyqrzyV8qpbov6nBC1/SOh?=
 =?us-ascii?Q?9ZCbDSqTqTon6lui17knSLd5B0xG4VV3EuW7Pm4DriuFVSOmQ3ffWVElxHrx?=
 =?us-ascii?Q?4mGSgcgX9IHACnSXLeaHBSFsMfd12poeTZUZKAvZbUz/U3HgSlvuOLa+sRF2?=
 =?us-ascii?Q?gxn4VVHBjnYr6nQvX5Cj5nwmx341QFmBn7VeP/jOPrcsrjPdgwJWW3030f6E?=
 =?us-ascii?Q?LeheIGfvy8gJBJEa4Qb2Yc1QnxSBRK2CBdgYw9AdpxJG8Fv29+363V0zIH4j?=
 =?us-ascii?Q?OWnO6+dMDSd7WUIRN3YUqnFEXDGn6iUs/jAc0VbYMoGv7gvpFPSIAzX8crLA?=
 =?us-ascii?Q?y7fUH9BNKGxN8EuoA8ocoPlcay2bxMIusApAjGOq1zUdYJPjzQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/iMGIcbk0HtICDHcyrND8XayKmxDgusGZJfDMD8g4VsoMKX9sJPpPgUurXIx?=
 =?us-ascii?Q?aNY1fiF20yQVB37DHwKZDCiP/p0Qo6UqmkELbbVA4/4QbPoF65x5SDOk5qVI?=
 =?us-ascii?Q?XhEHekvd9O2OlNseaSA6vF3+gLErnGk7OHCxKPrOonAbQAzyFYt6u3XkoNUH?=
 =?us-ascii?Q?KWJCmIoQuvLbYsh2kRJf3Aggky9AxEFhxRKHXv0rEQc9U4F/P/EV7aBtQPpA?=
 =?us-ascii?Q?rN4bBOKYbbSs5y6pVbPDSO+KVRWp03+NxihHjCoGFS08+a3zlQi8HMgTMhG6?=
 =?us-ascii?Q?sykWhpdnuCEMThUkIaQGsM2okBNgCLNfwUbKDj4YOG1D8zAXRVOIPhqlz2C2?=
 =?us-ascii?Q?AEka7pfoTIq2Yq+/VKTMZQShusXV1dAHywZjjkGeGGOnC5Q1aimmbHcar4K1?=
 =?us-ascii?Q?/YeAnKPrp8bPER8QxUZSqiVx4o3r5fS4mQOgpZQyz2SU0rJWg9X6tUL/ycxr?=
 =?us-ascii?Q?wXzjP6a+6ihP8GnOp3kh+R+YDw/uhK9JwxingdcOY7VSOAkO4csYZg7udVa+?=
 =?us-ascii?Q?yVAB0fh6qo3O4QygW1TiSzHGaZYyqCcd2++y6hrKBqzs6KHGwj4X7d+2JBaR?=
 =?us-ascii?Q?NBSpVvHtPKBHHUnicwL718rIBcxtlr1mbAq9Ex9ufqAtWGsDb88zl8VMOPNq?=
 =?us-ascii?Q?CxWT0o10ngOae9zYAcJfkHgB31Q88Hiw7WBX4Wm7/oPoPGBiA8eu81hlUzQm?=
 =?us-ascii?Q?jFQQt76xAii1gR9Dw6oskMxR1H9+eamiPX/zNL//DUXSC3EI1XQH/jncxJaq?=
 =?us-ascii?Q?fJRmZLvt/5nt17/kmmeeMeZUDj50bexi5rQcj4mFXgadALU3nFkGQX6Oz12O?=
 =?us-ascii?Q?DO8J7Lnr4Gno82t+Ci/vwuUAyBsGdhfcyGSKiLUNFQnMF/VzJfNRC5EYZPTa?=
 =?us-ascii?Q?mYnLXkI5sutiFgnH3qQAZ8Pf2lJClDRT04u8mS1T5Ri/Zkgjss5ib5DUT/Fz?=
 =?us-ascii?Q?hs05AdTDd3IsdDvHtk/HWTpdGUOHDYb94saa4wOY8LN5TkI5epGMI0ocXbRK?=
 =?us-ascii?Q?rnpAk0RRfeuOgBfZTkgad52EwTAyLB05z8V4/tMa/HMs8GoD3y46LqJlauZB?=
 =?us-ascii?Q?tF9o+kTAIsuuPcSatNxOrrSwSfiELeZiFEeEt9GauOFo4qiPriDkmWGw/Yzl?=
 =?us-ascii?Q?PaHVhviHshw8YkH90GAzRAK20/ZB3a9+IalomhCv+HgygWYPRNbvv6wf3Qtx?=
 =?us-ascii?Q?InJSwO3O1+lL7Y/tJrYtLGFoKjC4w/umLeTgEc+vq38B3koi31G+CzUW4zLN?=
 =?us-ascii?Q?RlMIO83ROPSm3QDK77wf1fOkdb9oI2vWqAlVZM6eKr1Ghgv+1DztrHATItSA?=
 =?us-ascii?Q?FSiKdIHyJuKPzaFjtxCmoUJX+xLRjqH6R1AiKWlGpEYGo2OmBDQbbV3uFBx7?=
 =?us-ascii?Q?HAcx/l3VIN/YL4x0fyaqUTo6+uvHP1kNiuNqLrqU2D4srGHWKGVyh/2Ee60M?=
 =?us-ascii?Q?g2cLwPTV0KfaYo0JxuZxGlS/OFkChl5zjIKR0aXMWmI809LuuCm7Raz8ejRK?=
 =?us-ascii?Q?M3Q9x2C4IVU2TrfXOweEfXUZE3IZ73faamZs+ApfAXYdzfEyIRmqPWIr9Xwr?=
 =?us-ascii?Q?JAR6hz/2Dy2Ksl6keEr5DYRWzf+x8yzcoi/SbDXt5mahBTvokfV3R6CnDEhc?=
 =?us-ascii?Q?aFdPSS6PMAJJld3Ey8QJ9JQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4314ee1f-e0fc-4d94-e0ff-08dcb4e7a73f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:41.6987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10ld5bBqcxL6CnKeD6jksC+tnepojankNyWgrpvqf+3h71BGC04wjdP0LP83DE9j992eNowhYGUnboOdU/hu+qzbJRw8DH25QsWzzf7Nburo7r3giB+0kHyJh7BLvM+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/idt821034.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index cb7a68c799f8f..82279f6d3ce84 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -839,7 +839,7 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
 	unsigned int max_ch = 0;
 	int ret;
 
-	max_ch = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	max_ch = snd_pcm_is_playback(substream) ?
 		idt821034->max_ch_playback : idt821034->max_ch_capture;
 
 	/*
-- 
2.43.0


