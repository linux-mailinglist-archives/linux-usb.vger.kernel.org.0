Return-Path: <linux-usb+bounces-13019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7E947241
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0E91B20DE1
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E35017577;
	Mon,  5 Aug 2024 00:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lFWctw5h"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366222625
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818448; cv=fail; b=nmfEsIle+KTlds1zaMOihQZ3t1PeLf8Zqto5bmnrNmuPtU5/5E1XKLOV5LI39iQjDJJeILqP/hG4ftdO8EW4OyWiKZ5VnY9XqVANd2P5ay0KLWVlkUYmkJUTStxTceqcL6nGoJjAaMe207RLwQL9jRcm6xRkoCBJ31vaauP90xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818448; c=relaxed/simple;
	bh=h6h4Lc0XQzhpm0dgpHDg2jGbtapqufOwtymXFICyCVY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dOnj4dp97sNF2jYHGDgH0USunTlqf7qUXCyfvuNjuDAvS3BJV83fg3uyZnuQCSfmKzb04FXzwsLPZs+auTN0EAenwxzel0PD+rEZTDgPKMgNer4nsXOMFBoPGqhKAG7ESezZREl3k+WRP2ZVYblPFY37Vt/aO/fBBcNDxE3zKHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lFWctw5h; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz/n2ThacQybTYP7yJdRjEJpCwnGhonbeQrPwOyE0dAiIcQP1JuuJ6ya5MfvSeqf8+9OUfSQhFQxIFNMSJ5Icazty1xMbM3KQ2JhUbAD/ZCt5yTLpqcE1fbZMVLwyrYTDEzzwOWZgr3RHNwr0HfxMplQZl82pI6KRH/h+2OhTW49HVbmBOKGcu1Q/0RY9KlSEMZUQMV+xAxMn3SBiArrOFAHMT3QaMda8Nx5npkHd7KzCOYIYTwFsdtlq1VlpvKHndeiJlgVu6O8LwgzRu0p/dCF+2bC6sKopoGDRvMP+eCLL1z0L0SNaG0qk/P7/jyAuVlYBi670qRjvIRpW/SHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bFjK434KIiHYhQbnPwwJ4EBaa4zZ5bC+pzrojzmdI8=;
 b=oOtB5EvPxeD+uwjR+frYxqSuEZXg3ijHvDgEor58D4n3bVCs7/G80eeVbK3DCJwYB/WcgiWt13ZJbGxCNCXrSCnU5ZjbIbFhPuysTcmCKklWXVB8NOmfPeHyJZthZkwunv4esqj1hDOOZR40hfNTNzuAC4SWW1L1o4XGN3gu7BW+V2OKVRNb37w251gJ0lJXvytriuPBGVTocm2zhDcQ/dpXxLt/jmZ19wZswbcnebtl/tm0sCcP4aSUGpfaVzqfAhkfSbGjGSCwgnHbEVdcf+UYt+griUDlBrA7s9/nOQC8k/mW6+AdJvjvlm9wKSpSmuOPeBfnmm0KGNlI2Hdaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bFjK434KIiHYhQbnPwwJ4EBaa4zZ5bC+pzrojzmdI8=;
 b=lFWctw5h1u9pugAWMt5DQZpFkxmgh6y//NRMZe945hVFqnUsuJ1JkvE18pGCrT2rrWWwNPXYwWQnKfQjcNX0gPiMc8ZciDJJePDkaX6otXQ6y7TR8gTG0/4WvjuISeh7b24O6ysMhbrZFsqdWcJ/9Z7sKdKPaxoDlNy5GFvpCss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:44 +0000
Message-ID: <87cymnyf77.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 069/113] ASoC: google: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:44 +0000
X-ClientProxiedBy: TYCPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:3::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: b0efbbb5-fb29-4331-d56e-08dcb4e73db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lp87QsXEIINQsnG3zjUFyL1wRFe5lm0oXWqvzh98qOSDLj9yPcMEi/glZhyU?=
 =?us-ascii?Q?Fr85MzIBudV1YovzWYenbM7UdXIriebpfQEX7tRX8j/jRKPlr0YzaJl/WY7T?=
 =?us-ascii?Q?1/dXYX3RNn7uN8OnZZhRAVhOIacLZ/38A00FMQ6Jq49iFWtbpUP4nv+MDyT8?=
 =?us-ascii?Q?7wEXsZVVqCUIyBF4j1VgGfMp1M8EQCyDUj/n4CLdC0rXHeYEjaz/G62Pw7+V?=
 =?us-ascii?Q?BGb3sUPK+YMAYRdsxtsW28rZh8+MFzY99v1vy+yNH787kWIbTaC5HosRjNzp?=
 =?us-ascii?Q?b37CqAoKw0dzya9aqalHlBN8oh7FGNEo04hHjO+p4LQauv4PeY9PalgIws6p?=
 =?us-ascii?Q?8WSRdd1myIUbcU/CHfunGy3PvcbXzksrPGkpDCyzEHZOBLvCxO41pnbeJ01t?=
 =?us-ascii?Q?cVHhV3dzoiZzX5dN2e7EQ1e3ILI0cF9N8AujuVp3ZV/6kxWFu3c0RsEz4OD5?=
 =?us-ascii?Q?F27cVTCIGXULVlAk+VbLbCrzMOAWrllO/Pu+ho18WFk1RTuQ3AkSTy1dhrBW?=
 =?us-ascii?Q?jcA91dJvXw1NXkd9noPNMroesyjZHr2JmFFvqGloSqwsiGn+AyUkeds6JFhI?=
 =?us-ascii?Q?tRftkcCXNQCzh45PCjOoBdNg6t9shco6DWM1ebKXtm7E571DPygTY+okE68p?=
 =?us-ascii?Q?8tR7CbXCs3uprVWwNMkOuow87daGigSX5zt7v0LNWCv93P5y/CalysW8oJ4a?=
 =?us-ascii?Q?8qqg7wHal5grrsEjeCzVW7/94fu1l9s0wMS5Lkprpw20wx0bhiu5WUbUMdkq?=
 =?us-ascii?Q?MSPcBaW1+nYEreYsuH30esC67cKbyp2QnvCME2NQ8WWdF9ZNSiywativ1vBu?=
 =?us-ascii?Q?HTRaK3X14P8AMX1nIMVwidjdp2+rxxhnrJXeFxpi0wfM43oYtQbxh2+792oP?=
 =?us-ascii?Q?VFdTscdZx5EbnlBswEtuPbH8YHRMztfc55I9vM9JupmpNCIwgVHyfGNAxW94?=
 =?us-ascii?Q?ZycDzkBtXJxw29vAuLeXARcgt3moUkTKxLVNNB65DzaRsFW5EL1dUfbYgzpK?=
 =?us-ascii?Q?6W6OZbPkhMDOmbe/W55ZULGbRT9TIUuEqMrK8phbjQPWJqIxFWakC4rm/yqq?=
 =?us-ascii?Q?sxNI1Soy9jdfL7x4nUkUriZtoNCc1HoINJkwQ9UTQhnrVBjc6oBv1UuIUuXg?=
 =?us-ascii?Q?uTCC866NSmpq/cf3GMz7WQYAIiUqw4XbVzpvDBJgtSyA5E9Z3F7uWCmuPkSJ?=
 =?us-ascii?Q?KQS7zATDlEN+a8uqyNa9BWi8GWjieZ9565HtJh/Tdf8mkVYLU3mNNAKPvEVN?=
 =?us-ascii?Q?NUZ8itgE5Qj4XdD6GLxDXBawoHc0RFsNg8IDL5+H3vtaCpsBSC68wt6y/fEm?=
 =?us-ascii?Q?j1LLdK8obAYJniRdUbuImrFNoavJfbWDzANTqW+USqAdV5VRjeYbI2GWxFEw?=
 =?us-ascii?Q?kdvaggEe7rjzm8g7TI7eNcDUMFBfHkrsSSffJD13ZuttsVxO5g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ik3lFm/YRqm7/ZEuu5p73C+mKCHoOmy36L9krGwrZmuxPHuA8Ivnxm/aADP9?=
 =?us-ascii?Q?Q2jbTt6uVOKe+QBaJOx38yKXQNHWSLcrLlA0yIuv+g5Mc0PtmSxfpXWdgkqy?=
 =?us-ascii?Q?9ivQEefyvzTY7e91tOqKYHtbIahnQQ7yeARyqBzdbUl8eToK4Eie4qFwHNaV?=
 =?us-ascii?Q?Z8rKobpLDsIRpO8FZvwQa6iT8aX/UxlF+SNHsQX3eixDPXyRngH0XEz+ssog?=
 =?us-ascii?Q?r9BZTFBuXAk48NXbJL5MVaAsMv3JBDG3Qftq2u7IaiYcrjOEgoa0nPVw1Yb1?=
 =?us-ascii?Q?zUSQxwiSNqdJU/kDPDCoYkjqX4C6DHawE7Bbyoe8FO8Gh2V0+qkB0QV0MQAl?=
 =?us-ascii?Q?eL3dI5eQBIZxLG7yKQXMGojoAmmzhb7LdbKlvGdaL2TE4+j5e1jPdZmZH1aO?=
 =?us-ascii?Q?fvHEgiMgV5byFR9wJKNUJ2+RfvYaxNXE7+b3bJmQYJT/ty5U92evuTt50MTK?=
 =?us-ascii?Q?JfGSdR0PD2siFtVefb1T05V/hDubNg2cz9GwEr0AdxDddxWvLUfzT6IKMItD?=
 =?us-ascii?Q?N/clNOaPi2SDY2/YxvSCkglCRuOxHWKbaoI/rjVG0KorK1ac2tHkrBl8IVJV?=
 =?us-ascii?Q?sQ3upgJ+/FSZkIsIrohIG+2uW54Z3Me0Ivxmrs1PxhE/Cpl8F3BCTcydeNHo?=
 =?us-ascii?Q?jtH4ir+y55hEB5uyGZWMiZS6VSAo4bOXQcjTJ7k1kXHCkZZfXkiCeNPkSorn?=
 =?us-ascii?Q?JahwKPgfMPBpwRz8jsjcX3361mlLRholiGmjzBkogZIHt+xP1I05pFHXN4+h?=
 =?us-ascii?Q?81T7XNWlUL+328/t9g5AiZS2YWei7yg6WLxkA2kwGqzfZAx6hbLU/I4TP/XG?=
 =?us-ascii?Q?cMznskHLdHIi3g619BMQGI3ILbyce8J/gePcphSuJ/6kFqLnPBrDGOBZuCep?=
 =?us-ascii?Q?nLSn3tpgPfn4Bubw3k9DvC+UvdZXfkKsTnxKNvFj6i2Hw8xHpE/x6RCd8L84?=
 =?us-ascii?Q?lq5stE0TCWXw24GoYo2077Z/OV5xEKdA4iP+4c1W0OYgTogBbICFIxXk14Ov?=
 =?us-ascii?Q?1OROzYc0u/8XxsjrsZi1W0BQgqmwzs0p366lgYzCYpaaXhAfY4wPJDRw4dNN?=
 =?us-ascii?Q?E9SLIqZ5OomLDahlpgFhI3JWAlXZOuIGDeDoOxo9HDWt+zDDeVmP6nnppXtj?=
 =?us-ascii?Q?bjs0YTeDC4Z5bbToFqm3fDhQRlbJEvWUM4uZ+lo9j7NEfF8SAZm50PCf26yS?=
 =?us-ascii?Q?ING3t0w8MTpOU0eFYgofPU3qFA0+Y0rcdA9L/35WSvcs/VCxpJ8xbTu26lSC?=
 =?us-ascii?Q?HOQVijsbF5agHd1DUloyMF+pEfzhEgNSrJasgLZusau4hHQB6ztPo/tdPr63?=
 =?us-ascii?Q?/+TsevbbBxzyKHjG6o531Fh/VMZHsYzgpmOG90sJNZLosMyg8MD49RDkVvSy?=
 =?us-ascii?Q?nEcAGV+r6DwmjS6Vx3Q0KR7XOctjv0BojNsUX4Tqlebj86DXXy8joNB8d72y?=
 =?us-ascii?Q?0SyXpbSWjuhoAfODU8PiG3EQjEe+5aFxarBwEPgDp8ZaISnZ3aoFyIIVSZK3?=
 =?us-ascii?Q?ra5t6TAY+QBqg3h64cz3FnwdL3V8MrrtW3IhFV0FOAJt2E3w/dY25N7pOKuJ?=
 =?us-ascii?Q?2fovS4qIl+5arzMCtS79WCf4wjR+PwH5k68SNDMGSbny5kjaHDlmufOVsPjS?=
 =?us-ascii?Q?8yUoy59W0jcR1VQ4L7GeN7A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0efbbb5-fb29-4331-d56e-08dcb4e73db7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:44.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXYBiQo6IOxlcBxeqr6JghR6jTovQ+9V315e4uG9cYj/KfhfP7r21KM0sqVUawDZMtJ2jhyFKmFpqx3/9/zOlFLJRVPEbp8ZZYMxBxbwt94i78tqu3IbyaUc3Wv1JSU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/google/chv3-i2s.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 08e558f24af86..1bda70bcf57b3 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -142,7 +142,7 @@ static int chv3_dma_open(struct snd_soc_component *component,
 	if (res)
 		return res;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		i2s->rx_substream = substream;
 	else
 		i2s->tx_substream = substream;
@@ -155,7 +155,7 @@ static int chv3_dma_close(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream->pstr->stream))
 		chv3_i2s_wr(i2s, I2S_RX_ENABLE, 0);
 	else
 		chv3_i2s_wr(i2s, I2S_TX_ENABLE, 0);
@@ -208,7 +208,7 @@ static int chv3_dma_prepare(struct snd_soc_component *component,
 	period_bytes = snd_pcm_lib_period_bytes(substream);
 	period_size = substream->runtime->period_size;
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream->pstr->stream)) {
 		chv3_i2s_wr(i2s, I2S_SOFT_RESET, I2S_SOFT_RESET_RX_BIT);
 		chv3_i2s_wr(i2s, I2S_RX_BASE_ADDR, substream->dma_buffer.addr);
 		chv3_i2s_wr(i2s, I2S_RX_BUFFER_SIZE, buffer_bytes);
@@ -237,7 +237,7 @@ static snd_pcm_uframes_t chv3_dma_pointer(struct snd_soc_component *component,
 	frame_bytes = substream->runtime->frame_bits * 8;
 	buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream->pstr->stream)) {
 		idx_bytes = chv3_i2s_rd(i2s, I2S_RX_PRODUCER_IDX);
 	} else {
 		idx_bytes = chv3_i2s_rd(i2s, I2S_TX_CONSUMER_IDX);
@@ -259,7 +259,7 @@ static int chv3_dma_ack(struct snd_soc_component *component,
 	bytes = frames_to_bytes(runtime, runtime->control->appl_ptr);
 	idx = bytes & (snd_pcm_lib_buffer_bytes(substream) - 1);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream->pstr->stream))
 		chv3_i2s_wr(i2s, I2S_RX_CONSUMER_IDX, idx);
 	else
 		chv3_i2s_wr(i2s, I2S_TX_PRODUCER_IDX, idx);
-- 
2.43.0


