Return-Path: <linux-usb+bounces-13003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D7194722B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927A51F23644
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1530B18059;
	Mon,  5 Aug 2024 00:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aaJOL9OU"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6717577
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818376; cv=fail; b=ZREs3tVJbBgqG/HP4XDH1HtHM7MwqMKo2S19dBVd+deLnF3eiJS8xrQmLtOfPHBYuFppPM+H8hGOF5eqdbBwgNp/NQgJUMiwU1JUG+p3mEZVvNqXrmFlT/Up4dawxmgwL0MpDb5oKT59uh28nTjdNoNgGDkE7PfV+0R+UMHvDhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818376; c=relaxed/simple;
	bh=MrHl/wFqz544WiV37Y+wTgj5w019RkGulZzw7fG22+0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lHLoiL/N5/B+VoGNkeSiEG5nQJQSybXvoB8YwhPAcrssp+ypiU8n8jhho4iOwkyThiKtF2OTXXXN+S8Z/QTz8w//cFifTFDkuv4OeYi3EKYJn483ozK5cXnVUPcz/ow0jjeMe293JgW3b+dVRzJr0WLhljG3TfeO6Iv7i2GmzcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aaJOL9OU; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLBswOE90iVRHAlWDmB9BFKK33L0ktmCRWVMt7u/u8P41lZD2Uy/uNH8EZ36iHJi0ZTsTuqaK0McR4Oi7mY4SvPSGDL9B3crzt9+qp7P3yA8v9sJ/amGRliYhDEbB3t6hB8aWVSOTsEcSsH13wxUfeIvMpg85BK1EvNN4AWkKmaUKNoJ7Cs5+yF8nssbQJXCXBVNw6MYR4IQNyvJYgxC8N15+5ueWFhnF9/OBUgaPFRJsmIByOqnDbJfbt2ATmJIm3GXq4mzLk13P+0fxEIg5iDzBSZ3CflD9gx6EZrCeh2tC4Rm9QiJZKFE8gMiyxs/AaIcqdtpdjs8w6J/SGsEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzvkin/sh7n7ol9McnO397vFmn+9c0d3PNkl1UBzJNk=;
 b=Xy69s3/SWY+etRzcM2GwWGv7D1yKyEEzmAtcd1miJ1kJcW3L+LbMb4aHo1Thn9wwhPLV37QVtXIQF6gk9rwUXNDB735m9oS6VvaGKwSoFPAbI/cM3IDgGEvEKm0/e7C3+EGzUSm6r4TMw7+51B5dlOXRvlU6MK5ovimDoUFjsMio0u0fTW4ASje6CxrZWHCWbONN0l0cPr/tsmpBjTU8nbueW2/KTA6+XOekd7Bz1gc7rIIh6DM3AnbBphNwGZPwY4MiDnRkPMlRG0qnm5ITzMTmAKc1ugf0Irm0RH+iBeFKceOwgngVnYU636hdDWJlZSFSWaQVH7pc0GbgQeJ7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wzvkin/sh7n7ol9McnO397vFmn+9c0d3PNkl1UBzJNk=;
 b=aaJOL9OUaL44qTpoBcfrfuLYbE67lKmQs7djpJCkw36fErAYHPSnlD3s5ZPDyD4mP5hFrCX078O/T1XnJwxWoE2Da/c+EEercws1F4H79sqLcpCwYkuXLpOSn0Mbl8ahxtws5gmcshGDjoFSH28CR4MnNWo6/K7Y+1bv3zxUYo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:32 +0000
Message-ID: <87zfpryf97.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 053/113] ASoC: stm: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:32 +0000
X-ClientProxiedBy: TYCP301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7053ef70-af0f-4dd2-7315-08dcb4e712d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?luXP+S75Ltxqs85jYbuywxzRaQVTAR3e/z10gf5bgxwolhfvrl+h/tLw1FG2?=
 =?us-ascii?Q?y2sDeRQJOPEr/NyZ/D5KO/+jwESF5D3TOUtnaHBDpRC1vk1gmlBSN4BJNdqO?=
 =?us-ascii?Q?hZKxURB9JNsGGWGp8K5ZrttCc09YJINhBUPcRH0QsyfQC1Pkrb76OpJi+RwV?=
 =?us-ascii?Q?XqJemep6jc07zeGbXx1fWtr2w147vVwX/w1Rl3Y2NrY/wdUEP8yL7dNf7CDq?=
 =?us-ascii?Q?898A3bDdz4pdySU7yTTIIQsHaZu0/FKPLJlBKoMYfgsUgTE2jIe1DTGpoG2D?=
 =?us-ascii?Q?IE/oPSb+Njjn/ccGVtllKT3QWxQbc07D1Mces91vtw6lAysN2Nm8KKfSn32x?=
 =?us-ascii?Q?Ag6oFqmVFibftCKZXaxHgK7bDbGGlJergtvfrqfKWEJSVvtzdIzkf/zuBYYm?=
 =?us-ascii?Q?uIA4qh+dKkvGtcC6wQ8ZHHzBRMHpwd1rOJjPBEFflRLzQrJBoSOZNR8jY9hC?=
 =?us-ascii?Q?sc5buDY1LDuQpqq7s0FW61Vl/bFEQU/dYe7dA4Vmze1hu21N92JK8pUkwX96?=
 =?us-ascii?Q?col69dS7utCbcu/0496dN+utvxggHLJ4DcN+xIs19kVY3OXCQh62aBZ0srqG?=
 =?us-ascii?Q?9o8cfNXjwuJjjRChdpzz072r7o8UuN+vwt2wegbBrE0ZfCw3zMAHT58f9osy?=
 =?us-ascii?Q?GUS5D/yGk0NTOd0sstVWfAfgaOQHNLPEnLLK8/CuAGTyKDuUR2YpjheHmyt6?=
 =?us-ascii?Q?IY3/J7yKC0Md6x/1aLjSqYxQ9QcdhO/lqbwjxx+lAHdiltM3YUHMYpcIwMcN?=
 =?us-ascii?Q?9PfvmZJ4Z4pcSqJ/wDkS8eN/hRHoZX3rRSrcp7QjV85WH0oMXPoFopEuz+LE?=
 =?us-ascii?Q?EtRVpLVKwiHfzAes464F/tAyezxb0tiNbmgF28H005LD1+XaPTEZ7l+fFIpS?=
 =?us-ascii?Q?AZpydj69AkCwuaVCDFc8e2BLtdJ6Jar1nV4j19hiJIGXsbWnPfpIgnXW5rMd?=
 =?us-ascii?Q?Ba8VXl8C9ro1Ticqxc2p9ducUugZPgIb2JFlT+fJQAX6lI0IjRTZDTIvif/W?=
 =?us-ascii?Q?4f26jLx4MvPNryqbRnTEF6Tmfyv7uzTEajetiSMbCT6xIDa334uQkn6RNWhV?=
 =?us-ascii?Q?6AajFphkrFHKXHtz1gaHWkSR/9l85FYW97dYNV2pWIjfu+uWTutZYUELsXpP?=
 =?us-ascii?Q?YBkIuUgEBsjt3EohlS0b59W6dsITTvFSlGNgU5ZDQiGd+GNNenA6+DmJA5A4?=
 =?us-ascii?Q?9FYCNm/BuJCVBGH5OyzI/ucdVwr+RQ+WQzmTyLSRk1OKoQLvmbA650fb1/1x?=
 =?us-ascii?Q?4831Wh/Q6XQAZPc+RELtTsx5nxFJLfneVVRSJFVSxOHjmggYg/cus2ob+Uqo?=
 =?us-ascii?Q?XwUET5JzCTsBfXndQ5YBJ2JNwuVH6Ny/g998Y96jh3idqpatRKuDN0eEsXRq?=
 =?us-ascii?Q?VyIR8gFiUm+UkaTiOoZ2Fg1Ruqzjlj28bXSi5MT5Q4s2Eq657A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D/TofCWSOdLuqp4BkB2mKhx1PZWXquU64v7bf5s/CTjBwfjYf7JUXL1Tlonj?=
 =?us-ascii?Q?yFTDSibBCbp84z4oUk8OC4uv5W8IZqVmx2onredWr4g94EUedtl9xROPzd7F?=
 =?us-ascii?Q?Zq2WRNA+mUzUSSxTSeZXw388nQpFD1EZ9sKcbXjx0l/AcT8/r6vxSv2Tp4Be?=
 =?us-ascii?Q?iap5cekOJ08Ke4PSitWTnOqikEVTJSqxd0EeenByqfZqUxVFAA2fcL8CYm4W?=
 =?us-ascii?Q?YIztAR5TXAe65CLihC8jGDqsl65MpybWflVhbGIFM72EXB50y2jawQr4yMPj?=
 =?us-ascii?Q?ynBM0BMaoLpqggnUpsbLbFh/Oriu8DUrVIcTZ3Z/34r4dYN/waYrGGbtUYkG?=
 =?us-ascii?Q?7MMl7oA5g+LqPRnnlQOFjMs6cfbkL3I36xW2vOQCH+0SH8aGdut2kkVaYkNR?=
 =?us-ascii?Q?aCNSRnmFL4fZa100mmTYInWxLs3Ghr8p14zTN0JaNtftYNWnNhDXzcTsSrHA?=
 =?us-ascii?Q?7+c2UJU+jRYDPyjx4/6acbVU15G2jjgRvUegPPu1T5ULKOcWNMZwYIfAaIjx?=
 =?us-ascii?Q?DuQNIS7IQJk/GomTyNFtzkrrW3QRgFnFD9hQqDbyzRCfpVJot47UWgrcsVTX?=
 =?us-ascii?Q?PsgJVc+mXZj8odh+b5A2FObHKkdi6cwtVI17lwZ45uQ5ywFz3qlpPPhqxqCW?=
 =?us-ascii?Q?c+GRGBMw5KmhmptxapGc0FEu/qB2zZfEdOUr1cM90u4dDmJBbvyLNFaxaPQb?=
 =?us-ascii?Q?Xk27WyRguSDUQ5+9hQurF/ic0FY7dxJ2OjtAEri6emNfAXI+YvQ5+3N33FXw?=
 =?us-ascii?Q?k3JgeEELMsp2PYG9FmxXmWmomYHACxTzWgZQm0ggIMmLfTzdsHiSQDVXKB7n?=
 =?us-ascii?Q?9bwdXAqojb8sGATmfSCkGOSe0hXJawhtbe+NmHWRyNXHgmrsAyR7Cu5GvDDz?=
 =?us-ascii?Q?kHg5EzSjWkQsy5GsoQApPMcKTUS9MFRpw1C1W0ApEMFCE88vz/UTploljG4W?=
 =?us-ascii?Q?cJ0KqEjz112jEUSriPVfTqFhPhGXxYepiCENEiIg052JR279PMVq8rdGCabD?=
 =?us-ascii?Q?/4IlRqLnrgPE8Hk5kw+dzghTKpREVrpGrsmOs2q+qF5kr3LWTMfzlCzqu+V0?=
 =?us-ascii?Q?+IUwIZAfVabJ16eKyDTvY2XSgYonMKgxM7+kl12RGsGMX4e83BYzpSa0SLp/?=
 =?us-ascii?Q?00oX3I4LiC7A2U+RsefMEr9kPklGJm3Y9C/mFofwJ772Efva0SlxIxMJ4ZFr?=
 =?us-ascii?Q?BU4LRVNfV8QEAo8CRz73ciLsGmgPcxQO2S1D5YXSyqQPR7p3LMRnEg+5lZwD?=
 =?us-ascii?Q?HZlxvm8ESQut72/6QGc8X5hrA8wFcx0VY3P+bgF19oYQmSXk5zeq0TjsDApT?=
 =?us-ascii?Q?j3UiL4VxeMybEQNvyYc7LoZypBOTJzo4EDEXaTA8lNEGWdbgDOWN1G4O5zt2?=
 =?us-ascii?Q?9ED+EGBA/0kHY0b5f2p3HdnqnckY81AekVcE+QqNe0bghlQ4cGABZj2ORCiS?=
 =?us-ascii?Q?bDnGE+lLmyE8XUKJpTcbkpeUwpC70CkMTRQsF4Y7Yog5bhciE4026/Ec2fOS?=
 =?us-ascii?Q?ArLgZXeu60+PC7zlpmSfYCHXJdJyYnq4ZdVvtQ83FUdKroPr7PfIBZq7wf5y?=
 =?us-ascii?Q?tI+b9TwK8B8T4tk7Vj+Mjcv5vgWpoZBO6TAc/FDYeaiYNkZ86N28f1TeU3td?=
 =?us-ascii?Q?ZGjnOEFNttSc9y0xyuAeclE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7053ef70-af0f-4dd2-7315-08dcb4e712d7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:32.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApiAjgKGyvHGMt3T9HQ9egOuhupBy405GO/FUdK4Y1pV9MH2YQWeIW5Szjo3Nw/4J9wxRINz1/8GvXZimuzdtjc203qDdrZgdTxQbREJiLAFtDCLKoMOUI2Izw+M8Pmp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_i2s.c     | 2 +-
 sound/soc/stm/stm32_sai_sub.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index a96aa308681a2..d6654fc9f1a7c 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -813,7 +813,7 @@ static int stm32_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *cpu_dai)
 {
 	struct stm32_i2s_data *i2s = snd_soc_dai_get_drvdata(cpu_dai);
-	bool playback_flg = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool playback_flg = snd_pcm_is_playback(substream);
 	u32 cfg1_mask, ier;
 	int ret;
 
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ad2492efb1cdc..ff8d98e574f2b 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -38,8 +38,8 @@
 
 #define STM_SAI_DAI_NAME_SIZE	15
 
-#define STM_SAI_IS_PLAYBACK(ip)	((ip)->dir == SNDRV_PCM_STREAM_PLAYBACK)
-#define STM_SAI_IS_CAPTURE(ip)	((ip)->dir == SNDRV_PCM_STREAM_CAPTURE)
+#define STM_SAI_IS_PLAYBACK(ip)	snd_pcm_is_playback((ip)->dir)
+#define STM_SAI_IS_CAPTURE(ip)	snd_pcm_is_capture((ip)->dir)
 
 #define STM_SAI_A_ID		0x0
 #define STM_SAI_B_ID		0x1
@@ -1406,7 +1406,7 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 	sai->spdif = false;
 	if (of_property_present(np, "st,iec60958")) {
 		if (!STM_SAI_HAS_SPDIF(sai) ||
-		    sai->dir == SNDRV_PCM_STREAM_CAPTURE) {
+		     STM_SAI_IS_CAPTURE(sai)) {
 			dev_err(&pdev->dev, "S/PDIF IEC60958 not supported\n");
 			return -EINVAL;
 		}
-- 
2.43.0


