Return-Path: <linux-usb+bounces-13060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66349947278
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 880921C2179A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B31339A0;
	Mon,  5 Aug 2024 00:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k27PkGT4"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001522BAF3
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818667; cv=fail; b=lWakJYe6Ai0MlscFXuFeMZXQhD47JOquXQB20lrb8erJz353mH3KDWGj/MCYPGRf1MRZHkUY5zfH9mVFuRtl5RjDnzzU1Aw092NEH6eKhi6nt9c8cBbREMefBabUCRYtYnGVKKPLKSnT1r/CTMJycBk86BId9mn+91y2GRQXJF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818667; c=relaxed/simple;
	bh=jDmfkdTmVa2mfEAclGFkpGjLr7nnpEUowyIYFxatrIw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AUL1DEA+BYJH3xwhibFHs1PwTFHcPUJLM4pOXR766bfTKtO7PpunU5eg1ktj4od5yvjeEhaXXkFhbSbOB6R3ML0leKM4mDyzZYDD5/RJ4WlYT/joL5fYK9YhOnQuzmXSEXWPAx1XhnEW+Ww/n2/EzJk7b/SGB+Oilex0Athbghw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k27PkGT4; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0vCCO6DpLaue5n45K2F/Wt96iSRWQ3J2kNW4UZGLsaWe77n9wz6cnVXznwnODFLePVr7JJzCQtGFQ11oxs/AXeOFwucVjohjhlG39Xwjy1vGuGJgp9fA86RzLaM9iBlCa/MtYWuZrOD8sUoiWkx99+qc2sYanMrU5ZLEhAMcMHkhUwLMq6+xSxAgcUCd42YTLiCxGWjxubf3l+I+woHgosN7CHFOqcQWerYvn58Wwk7leiV6kR7MvPMvPjqTBPNVmiJCOzt39zBcSUCEesKNOQpC0J+I/sYoqTf/8xPv+D/32CHqThQjbIuTSUaenGPGA5wIeZubmAa1TCo4zrN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnaN7Y45blHwpUNFxGbqERz7xmucY20FdxE3eLug914=;
 b=zI6XbXqidkJMbBaxJQkb7G8D/zoT62D6WI11kvHsGSX3qF9b9FSkK1XTLDkzjmxvQdS5uYahYsDa/XQkb4K/U3O33I9tg8r4V6hao67Ip4X+PPky19/hA+0pfiL2xX0k9aqUM3vPvj8ZmDz5SXYBv3M7F9QKavigqcwZNCNT7Ty9yZSvOSYX+KaiAbKfw3PqyJgMnIaEpSH94i4wo/+VDb9kYaLa5rMMKWnX43wEXkZfA6oMbmcGRsPgfRWgXg3sGx5/kkbSSEcn2MWmECnJHH39+gSQMiMfXo5/IvlrYLDnBX9U2lfk44AjRcdrwVjLLIPuIhO5Tl1fQziTl8Y/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnaN7Y45blHwpUNFxGbqERz7xmucY20FdxE3eLug914=;
 b=k27PkGT4hCM4BxPdMWYA4dtS7EZXvbsuPUmB+Ub46Onamc3gp2aSkSvdayGa3spw9WI39pPUwesO9NVmbLHp8CUkPmKTiUysHzVDEiu3k4uroGBD4QgiTgCvT0D+p2lvjnjtA2jmIyjqYoSpbRFV1LJTQ1Gak9UhiFVnTwRbuC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:23 +0000
Message-ID: <87plqnvlw9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 110/113] ASoC: starfive: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:22 +0000
X-ClientProxiedBy: TYAPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 121f423f-26bb-4e5b-5b44-08dcb4e7bfd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9oDE+a0AIYLEMOKglhYyLpWrbr1HTCYgBXLghCCIn8IC2WbNRFIM5TQ0EdEx?=
 =?us-ascii?Q?EVIsR0NVxjhq0raK2UI8oBePexJiB2pPM5gIzN1ZsdDNvW479uOlyIYhDjLy?=
 =?us-ascii?Q?voSBXdbFE+panb1R6tw+8n1ToArI5eVKmOXu4H5simnssYksqeP473IThYrA?=
 =?us-ascii?Q?Wjf7oUIPcoYAAQ2s5QfcUT7txAMLUUal39kxRKaBXQOim0xrgXae1+0q4R5R?=
 =?us-ascii?Q?orkysDoCxtWSmjZ2NfHRpc9X2BqfIeR/hxgzsC4Y2LlbIr70cQf9p2BdS/QE?=
 =?us-ascii?Q?yHWQIiF8jubeyalMxVt9MqMjTjZR8ROSa/2HpU6QoefbnP7R3+oRpRpV7YmD?=
 =?us-ascii?Q?tN7uvV/NQ4IfNzWYt+QLm+RQ3pf7PZsOgQ3Xmd/4m8xpwzLKeCyPpL019R4l?=
 =?us-ascii?Q?+dJBysjqiIQh5iyvqa73rawBR+m0XTjzhPwBOGj+RjTAueADLgFxFW2ZWdpX?=
 =?us-ascii?Q?XLMQgXTmMI4vHiROFwD9HXcDhRjN1deW3phRy4Vy+uDAV3AmPTOJXg8XbHE9?=
 =?us-ascii?Q?G7oDUJDhhxMZPGso/TvPsAOhovUW+VABdAY7KpSJMnLyDwj3LnrsA7RGqFA5?=
 =?us-ascii?Q?rGCFwH8jh0mpyihxWUEOs8W2B6no6+WHYKUgFY5mWDUZEDiXOxJPdofLqDfd?=
 =?us-ascii?Q?XIEPX5RtLBxE+DNmCAenur64Yw6LI3c+wDKTGF+DVMy3nphsOQatYS3L7Ef4?=
 =?us-ascii?Q?M7QwtEHyKmYHwPF4wiUa2q51YfPDidO2D8lxlPt03Eq2OkEaGmqK+7TSSIsc?=
 =?us-ascii?Q?iax5yvqZ6jlVC97TcwEz8vmwHILSaH4t+JAhExkXqUzZNdzPKuLhxu1fSINF?=
 =?us-ascii?Q?7kY2hR2b64BXrlaQeHxQEjybwjFayfYc1erX6hnrC+GVS3srlLISc4w0cywq?=
 =?us-ascii?Q?AbQQGNcGjBAlfBUDC8Yqz+REECJlwxACuzMcwNaGjDxbb559pbZU/PaFSBsJ?=
 =?us-ascii?Q?Ln1iWEG/ZfIIXHPS2K2cYLCFivMIZ/yifv3R+ggVzmgVPzmKs7DmAC1aLzdQ?=
 =?us-ascii?Q?h/sZesKplrBZxYedcl9BIeIxJ2Du2PPvwRJFM4fXFW9+sPJsUNuls/OTrkFI?=
 =?us-ascii?Q?vGfJXxyYHAZVMtq0O+s/tClPznBuQQq7y8UVEuLXsmqdewhwlDxne4dTevdt?=
 =?us-ascii?Q?2I6gDplr5djAfP2IdgNcJ5uxgcSzT9JIwRXW2iEZS7BwYUuArRKvCfFeMW1O?=
 =?us-ascii?Q?m04/BTjYDkLs8FH3bc2mvch9Y1s2973yOvwmwYXCBbQsd+35q9+utb9Mqv3J?=
 =?us-ascii?Q?Ds/jI4+XCBVg9HLzuw7rvW3uFEBH4EYlxEe6vE2Ywa/5saKYAgH5tN+8LH5V?=
 =?us-ascii?Q?8ce9kxIE2EpWsoVgMKo1G2livuKoyIAKTvzz4/WGvYeT2yOZ5jAxi066YKqN?=
 =?us-ascii?Q?5pAYoIfa9ncYdooQTLWwv10a4huZu0VYbSROESq1T1m8hIEprA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KY9aUeCzju2IqNfYrGge2zU1AUkjWGuSX8nE6EU44IsQy1hzKb+rs2pGJ0r6?=
 =?us-ascii?Q?mmhXCqSO3iuKXVIjJGDfIn+uXYkJcF0c6wPQDz9eaDPoYA/PqeHzqqUWMKfz?=
 =?us-ascii?Q?m75YbvdYqw7+SXgu6KxOjwSxytpRJasLvgg84cz2kHZ4yXnvVSdKUbBqwvPU?=
 =?us-ascii?Q?Fv8a5LPhDJbYSjfA7MOCKn6lVB2MVxtpflCJkqaBi7I7+8Pkn2qx3+h+T51O?=
 =?us-ascii?Q?Vk4ox1Vtpz8JPi+ZAqYGb1DFDYZYPS2wsNRioT0GGDNTa54mY4gj2JNmkUDw?=
 =?us-ascii?Q?ypmZILq67fEChC/8M1hyzw+tHiT75D8Q9NcbtE2l8dcdC3hQRMyk2+arFkxY?=
 =?us-ascii?Q?vnzaZECpFSeanu7//IpV8tlZ4uc6RkMl2OIuv6aOSJqD819BQM9L9Iatas7c?=
 =?us-ascii?Q?vEq0U/buGTIiFPkGu8UvdLEA1yOK8Zf75Bf84YtuKP+Fhx4tUDAwesOr4zcD?=
 =?us-ascii?Q?GAhb/uo5V0Js0w2iTyaW83+j6xpMBxMNxAgiyoPDtn1AWpPToyteWz6T2rfP?=
 =?us-ascii?Q?lKStj4QcfdKzvmRTqvQpU0JuWYa7TJFYY9cxMCiRNHHWcjWpo1oTe843gBdU?=
 =?us-ascii?Q?dc99vPvFBgtQLK8Q9tPKVkq8+wpo6vWLXb0/AR3J/u6pdr+S5hG5DM00EF7Z?=
 =?us-ascii?Q?hHYiF12IODd+Ey+l8/7QpLs9wDusU/jWtTHD+NqA/xEW0gsJm/gGvqW/Eb1x?=
 =?us-ascii?Q?ZgQimsCs4eX02Jwgp/jxa1gRsLL+5+WZglVqy6e9Zdd3jSpdSQhFlmJuXxCk?=
 =?us-ascii?Q?7QcG+iqSODIGjWEforG/hOnb2hAp12+Z+q2JUelxuIIm0Rs5NIACjZ15yFhE?=
 =?us-ascii?Q?JA5M9T73B1t4T7SpzGVDdT0TBiv8V4S1XyTo8sfe9fj+nto7f/TTpn6AL0Cl?=
 =?us-ascii?Q?9K8jy094kwEDR7kdv5JMCY0tc9h04TsIVFmrAbKlhc+AvZtGaDwaspnQj9OR?=
 =?us-ascii?Q?RniLIKgWzM9C3zxABm5z33I7SHXPotwOjoP8dGQK8/OYiuoHnd5SgumaLoeX?=
 =?us-ascii?Q?uq2BHUnmp+qGqX5h7fF0beScaAUWLViuFnKZH0qf50sGa63U/u51IsHytzRE?=
 =?us-ascii?Q?SQLO08K0zsl1sHx3v7aaX3dGp9EOMRjVCzuWBsYEyPgNv9Q71QwjN1b4plls?=
 =?us-ascii?Q?liKhslFNEKuae1A5/ULl6nVLYkrBTubeKGOSDtLJfoWr73ek3gCKWUMowoOv?=
 =?us-ascii?Q?PWJR20KI7yHx61ZC6YZigvhK6bZmLPAwHnCYltqzpz77hwRzVEUmnTIxE3LG?=
 =?us-ascii?Q?Oq0IBCzAtwLHT3VNKkX9aQRMTYtwZyvSfx/MNmR7ryIUl2vCgEH7Hp7GPRqI?=
 =?us-ascii?Q?jVsL7nb0dXZtph44EahfSPPSHBLUAqnqvYwi/Y9FTumKc/r170LmxaG/1+SY?=
 =?us-ascii?Q?Q5f4UbV5jQxKCva3EVgzz+TKkiz2BYzltSUa9QIkOt6i69Xm0K4d5nzVnzyM?=
 =?us-ascii?Q?KIULQA024/McHBr619XN8r1FqyHj1OrILfzKmcq4TvK5gHf5qs8sRzSCrvAD?=
 =?us-ascii?Q?r/votwai9Qt1TQ7SjhCj2LbvdDa66QOgaDlKDu/JmR9djO5F42yVp8Ofl5Mv?=
 =?us-ascii?Q?eIXktmL0Z7zPk44vhDyRhr7N/DzkD2SXLcRROO+vkQc547I5kAG4ocH8GdnE?=
 =?us-ascii?Q?ilbgYkXsBw3JI3wP/1/jaOY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121f423f-26bb-4e5b-5b44-08dcb4e7bfd0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:22.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kjo0K9jELy7TsUtNhadeO7DjXpaljkXM5sm5f7hGENJgy1fJn7p/RyxrEUrgjlW+H5dAx22+SAYbx0uJprQfIMGCxRWenNNWohyrTS6dX2jY7cKsJAcMyD77ywMKH/i/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/starfive/jh7110_tdm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 1e0ff67207471..c2b307558bfb5 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -146,7 +146,7 @@ static inline void jh7110_tdm_writel(struct jh7110_tdm_dev *tdm, u16 reg, u32 va
 static void jh7110_tdm_save_context(struct jh7110_tdm_dev *tdm,
 				    struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		tdm->saved_pcmtxcr = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
 	else
 		tdm->saved_pcmrxcr = jh7110_tdm_readl(tdm, TDM_PCMRXCR);
@@ -161,7 +161,7 @@ static void jh7110_tdm_start(struct jh7110_tdm_dev *tdm,
 	jh7110_tdm_writel(tdm, TDM_PCMGBCR, data | PCMGBCR_ENABLE);
 
 	/* restore context */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		jh7110_tdm_writel(tdm, TDM_PCMTXCR, tdm->saved_pcmtxcr | PCMTXCR_TXEN);
 	else
 		jh7110_tdm_writel(tdm, TDM_PCMRXCR, tdm->saved_pcmrxcr | PCMRXCR_RXEN);
@@ -172,7 +172,7 @@ static void jh7110_tdm_stop(struct jh7110_tdm_dev *tdm,
 {
 	unsigned int val;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		val = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
 		val &= ~PCMTXCR_TXEN;
 		jh7110_tdm_writel(tdm, TDM_PCMTXCR, val);
@@ -237,7 +237,7 @@ static int jh7110_tdm_config(struct jh7110_tdm_dev *tdm,
 		  (tdm->tx.sl << SL_BIT) |
 		  (tdm->tx.lrj << LRJ_BIT);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		jh7110_tdm_writel(tdm, TDM_PCMTXCR, datatx);
 	else
 		jh7110_tdm_writel(tdm, TDM_PCMRXCR, datarx);
@@ -380,7 +380,7 @@ static int jh7110_tdm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		tdm->tx.wl = chan_wl;
 		tdm->tx.sl = chan_sl;
 		tdm->tx.sscale = chan_nr;
-- 
2.43.0


