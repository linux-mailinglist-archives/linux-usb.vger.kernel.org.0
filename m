Return-Path: <linux-usb+bounces-13014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDF094723C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9C21C2083A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C72626AD0;
	Mon,  5 Aug 2024 00:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="g2g/PsyX"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA6F1F956
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818425; cv=fail; b=K83DVqUW0BZ7uMgFXY3ov7JLsSRLSsbWQ74vPahJGX/XI5CtGeBjBZyIFaYgB7zIKGt3tiGcHXM2zA/1cN5neSaO3lvj4OOPnqIc4cY68fuXwNaoQwu11XzogfUFL4pNqhvnTdAYFTL1qV8tsxiAUrVHny7t7mY2ALAiDd3Mx4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818425; c=relaxed/simple;
	bh=8pgZPLzpETYsEjk4S5mKJr/kSvZF0jU8EIjtzsLOq1E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HUJUX6ddnQWbX0R0knC2e9uXVAoVPrxBfi2YzyVSWOISGCchZ8vBv4/0VAhL0kcwbr1SYLhvdthgbIwSBS8+M2o8nvR4sjnPTFceYOdkauD5bbWiKoyjMGdYwcBUm2ZpmUDOpDwLlJbQyb9IkfUaQ3KJYh7/ZpIoU2at2JtGtH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=g2g/PsyX; arc=fail smtp.client-ip=52.101.125.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeQ7+pi1cAUIJdbMxgXCRanm1tsu7kmkqcjV68kebBrnhsOnvua/KF8rcNI4IrzUSTQbUMgrYBMozQKZTaXFfXncbvrrtxJbs/q/dTJm8zK5bL6viARlbdmud4TzLRQRmzdkr8aot5jd5APlHtFePI9I/BwZtAnf3pMh/bZsQx1FnjllMUZUwfzBqaUIZAJzAEHAxx7Yfh6ZZlLhipdPFBCyU1wV5xK9f8fHeVYV855N1HmXAVl0JiQlfGYW5pLNepx6SeunObM8bwPXS9tGnAEcXWXQkWHW47lAljm7La7wtM+iRHCw/9c4QIRhpWbMpZOu3U2DaOnSRia5sXo/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQwoA9N2310Uv1b3t9PCch1GoJUUIBOIEb5NAg6nWC0=;
 b=MUtvX9DgXUIxbAn05M2QDjSPoqLGy/9QD7HOZd7Fl1+OScrjo8Xb12jL/UEgCi+wfJrc0e4ZZNnoNO37Eqa+xms18nTC9JrDX9QbBTrUswOUDVV6oNFO10ByDr19QrRBlt/4KqD+kKtsCHEQptm/G44hAy+Akg3lbdIBPws02EJ8U1FBInPrNefiXDSqP1dnuIZD0L0bE9GEuTBJH8z6u1cueHVnm5F0EgBludZrnKwxbrCXFI1ljzJJNLR00BuBD/Mc4KsVJ0EH+vFoS5kjQ4Cl/nWFl374TXxgX7KbLjvCve7aDjU0akHGkFPGN59HB51aohJpTdcpy5AdEwbDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQwoA9N2310Uv1b3t9PCch1GoJUUIBOIEb5NAg6nWC0=;
 b=g2g/PsyXEt/vIyPLNJfcyj2sYByi23nx6Y6Jl7h0CbrMUt/AOzOI6iHvCiQ64p6d1+xFVX4OB8PMzgOjNJ6KIVIEbtB4Eg1lJdyXDMktNo9M6jm8yek5lHrS8DP8SIQb/IVcZABWoub4hlj8m9s6H0G2/hRPPelQIE0pMEdAxcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:21 +0000
Message-ID: <87jzgvyf7v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 064/113] ASoC: spear: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:21 +0000
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: ce77ba9d-ec14-4129-588a-08dcb4e72fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qT9G3A1tnLaoHpPTgIuv1I5vwQfEBrXUSMxoExb1ugNSNWVA3qjTbrZv7nEy?=
 =?us-ascii?Q?8BBTurMKeTih5ntHkO/o4ssolU75c4ajeBUDyAwHo5m5tyKpmhuuuUndvKxo?=
 =?us-ascii?Q?IBTsK8f2sMfdWvbiI9ke1+jFFiv2B0Mn09TGVJwoA4/8cWoCIbr6/CA4FILA?=
 =?us-ascii?Q?zTTmlGqVsr0VBWsjAJ0Wbk/OAk5/fIkTkOwTZSf4ZVNokY4VNxQwpdl+i5Fk?=
 =?us-ascii?Q?47bgGL5qS+edMkQYuJfu403D8DsAunT3DPuXAK4q55t+LoH2c8KuLjvfuScn?=
 =?us-ascii?Q?XO434khBFJQU4xnnnJp1QTcSedyH+/7Y2PToPuX9BCg8nKfAr7qDFhgLhvn6?=
 =?us-ascii?Q?WTtMOfiR//BoiMaYbxLd+JTaZbTGgWXbf62uW/3QiXzr3nIkq0+4f+Ww9M9H?=
 =?us-ascii?Q?oWnsBay904AaHcLOp/1zBEEHgGSQtt1CiXfqZAG/g1ElKw6PcxRAjSTLWjr9?=
 =?us-ascii?Q?9BBRCekIqT+HMgEWXXJOLF8oKO1iSceQ8wxvEsYGIkYipH/FHfc04cxIEEW6?=
 =?us-ascii?Q?di1hbGdwZSuKeJTHdm6j+DL3tqzNEu/mv7ZeSzXTmpcSARpTiQFoKWvtvrKG?=
 =?us-ascii?Q?INaC00Xg59qvd/+qQ5uvQFo4m/AXt6Vyn6tf8JEDGjv5Ii+51x7PL/WS4S95?=
 =?us-ascii?Q?pUCYNulFzfAlzmXP3vbh11qtMD1qA40oggpYGp+rgezTXJp5gQ8mqu/FJzPQ?=
 =?us-ascii?Q?OTQLYRSskfIm9eeXQPXS7X5lJM3PXL3kc5keQKZOpQNwsygv3PcXu41IlqKh?=
 =?us-ascii?Q?iDI714srwtZYq07/iE2odmLIr8QAQndB/UU4VOjwTS/fGiQkuyzMy+PTCziZ?=
 =?us-ascii?Q?BoaU1/vJWjKSAeTEt46SFWsaVk9x0TdSUinRJqhziq5DyQKua7UDd///iQt9?=
 =?us-ascii?Q?8yCjzT896Ijmyuh9glOfkzsfQ8n2B+MKweJduSIlVmMEg8hM0id0yHoH/v6R?=
 =?us-ascii?Q?LEn/V1DF40Rbplp4LwKRUvssnvy5rajhwVFKXqXBJR1ypWwghGLPeI/nr+Pn?=
 =?us-ascii?Q?9M94fWcrza1n7TDYNjCg5e6aAoocNl/3b1tPuwdW+Uh/gBi2DGwrb1oOKoy7?=
 =?us-ascii?Q?rOGjG4llcR1B8zdipND9E5LHQypy5sG4CCrn8nZ8omYaiPj1g2hy66Au1CXJ?=
 =?us-ascii?Q?FJ3ptkoHCCVX9/qpReQpkH0Ve7y8ZF0m52gGv7t29yxNIGKs3aZrQIHNFdvh?=
 =?us-ascii?Q?v7xs8lZl8PU8ZxntDHLzWRNYNThnFFGcQhE5kaJTdddWEVP6lHidcpNrfmH8?=
 =?us-ascii?Q?ns14rvKHCUsXKphff5Gwjl5mIFmPGSaqBAn+MpgE7D64+PBvvlk6MCMwENuI?=
 =?us-ascii?Q?/PyXfGr/duZtpomqF5xqNiw+yoqFyWVYlIG/mV83P6GJLt/fMzGbObKpUyAn?=
 =?us-ascii?Q?525TIUdbOFRhc+sc/jlX1/xk01ZOLEkoNr7Yq7leU8fq/b9+VA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N0RDeJD6alQOuCyLOqo1Dzan0uslEYqJjYO+7ksR2hHkmXOOdcnLDe0G+Cuk?=
 =?us-ascii?Q?3Yxtz5I0bIwO4yYLLavWkbBRX/vb1bRwvSg1Dpd/cilXY1trZB12bBI1Gbor?=
 =?us-ascii?Q?lgv9BuY0JfErpKvueCLwy4AxhdZggpaWEiQAxOw8xgBWEWosuoyrle98WREs?=
 =?us-ascii?Q?RkJr5Q/UR/XhMR51wWOQ6QdWi2NNW0vIs7k5WMYcoCiYOLyKlKjf+VhoJQtR?=
 =?us-ascii?Q?XEtlErirCiXZ1l8M5SGXvPjf1dZwU+g9Qzt/VQNTTT0RSC6gIN40DmxINTXp?=
 =?us-ascii?Q?bFxJBi/Juu6G/VLgbkyavaUYZF/McTQt78Nf17hIMtCVjDRvZj63o79maLcM?=
 =?us-ascii?Q?y4GR1z5ri+WJsZZPGGFFXaSj/VsiWAO1jMR361O4UekODi8jibzZYq5EgRGy?=
 =?us-ascii?Q?ujBcb2Y9QOE3m31vbk7CGC2KxqjTNv9hpxJeBGLszIK9SZGMrwQFmEtUsGuP?=
 =?us-ascii?Q?bUgaiprSuX+GUYwbS7WljcTkMT8uBYVFrBBlVQY5GwMkDuoRxm/jDltEfbe1?=
 =?us-ascii?Q?QCCmdm5mIJ5D3vwaaIjjFKqO9Oz0PxrJNgudqiRq+tOV1AFHPTtQbDl+Vo6r?=
 =?us-ascii?Q?MfewUpG3gzGzdVrIUrEQ7E38kNmxduZsjGr3Yz9kDXeCL3d/1aamerXV8Ext?=
 =?us-ascii?Q?uY4WeI9yMQ6K9euhADbPUPm8njWQ9LsvxKEKrLduQR7pttm1ych6spszTn6V?=
 =?us-ascii?Q?F/TcQG5FOXUlA4uorReaUzX7yA1Hg4/HV0rgD51DE6TfaD9scn29hp0F6Ntu?=
 =?us-ascii?Q?3az1fsaXeuu/V6cQrfWJw5/LPm9PxwFuplgzbEXRosuOAhdC8Ru7R/rGJ6jJ?=
 =?us-ascii?Q?3nmTm2r9spEmqtK9iRKI2QwhIVEhlAaFhLA9JK2EGT5+YpYcH3PVN5YSJXRt?=
 =?us-ascii?Q?SsID+CwhvGCz0bO/qo8qlREfpNqBeli/pye2cSl/fZdb1sEaRhtMCjwIMAx5?=
 =?us-ascii?Q?LOssiY786JGCPjLINRu72epb+pejubDhLeBqDZ74s3fXzDHNBN3ETLBuMdlv?=
 =?us-ascii?Q?kQzagmzTTmBIZEx15KJGs8jSLB+H1Bmi9lMht2w37NpI4j5D4f07kGUW8c0S?=
 =?us-ascii?Q?O0R0Mrk1W7QkPk4j387wLYFEf2pEBOOsYq64NAAXGBkNK2C5rSzOqYRtqp97?=
 =?us-ascii?Q?h/c4GZxYe4VpHK7rU0uuMpLP9db2e32JQat9M1X98Sj6XK7mLNS5YStAHdEu?=
 =?us-ascii?Q?NDTUi7knHjN9pn7biUjK8ngP1KlulIL9ENqc8odGM9+Ny8FeXBs6YiMCw3VB?=
 =?us-ascii?Q?5TeUGbMXKXiUiwDBc5aHjKar8uCHfSTe0BDoP8WbvNopAd7yQxcf/mGqyQRq?=
 =?us-ascii?Q?oXMUS9gjq6tRc3vI4WVPAl8ggyjYcCyhvhA45xi8LTCkw6XqXjVYcKBA7vIx?=
 =?us-ascii?Q?6zeKEy0bBtEfPW4p0XSNudh7ccrL7+1yYrQv0zaAqHnykB9nDlx/jbeZfR/j?=
 =?us-ascii?Q?3JpwkVGNL+J2RoXTbwrJku4tMK5GsmmVEgEzqUd1rD7pin/FYIph1A9cEddj?=
 =?us-ascii?Q?qlshvYHHLdVoXxPyRJKcDsYiziIS0OOuJ5I9guTsjrYgzRKpj7B2SDZvfg8q?=
 =?us-ascii?Q?rnehBRTVg5TzE0ng/IdQpAeXsgvJCQqTNpNq2J+/5txFg/CwU7SmqP1BQVGC?=
 =?us-ascii?Q?xHnBIHZZwEXCOpuUMROza7w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce77ba9d-ec14-4129-588a-08dcb4e72fd3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:21.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2QJNUcnwfGIooAZQQg25YCTYEraqJvFdmctY7lY24+RLDgZJ5jeqzI9XiseFYQfe67aCS5mMc353NF9s0a9WQXeNnu0gxiXa+rnEznzgtDE7OFegPcWHMQsyN6i8Tiq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/spear/spdif_in.c  | 6 +++---
 sound/soc/spear/spdif_out.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index 4ad8b1fc713a7..fb1b54019194a 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -68,7 +68,7 @@ static void spdif_in_shutdown(struct snd_pcm_substream *substream,
 {
 	struct spdif_in_dev *host = snd_soc_dai_get_drvdata(dai);
 
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return;
 
 	writel(0x0, host->io_base + SPDIF_IN_IRQ_MASK);
@@ -98,7 +98,7 @@ static int spdif_in_hw_params(struct snd_pcm_substream *substream,
 	struct spdif_in_dev *host = snd_soc_dai_get_drvdata(dai);
 	u32 format;
 
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return -EINVAL;
 
 	format = params_format(params);
@@ -114,7 +114,7 @@ static int spdif_in_trigger(struct snd_pcm_substream *substream, int cmd,
 	u32 ctrl;
 	int ret = 0;
 
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return -EINVAL;
 
 	switch (cmd) {
diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index 469373d1bb418..a95a9b9e61e3b 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -63,7 +63,7 @@ static int spdif_out_startup(struct snd_pcm_substream *substream,
 	struct spdif_out_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -EINVAL;
 
 	ret = clk_enable(host->clk);
@@ -81,7 +81,7 @@ static void spdif_out_shutdown(struct snd_pcm_substream *substream,
 {
 	struct spdif_out_dev *host = snd_soc_dai_get_drvdata(dai);
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return;
 
 	clk_disable(host->clk);
@@ -109,7 +109,7 @@ static int spdif_out_hw_params(struct snd_pcm_substream *substream,
 	struct spdif_out_dev *host = snd_soc_dai_get_drvdata(dai);
 	u32 rate, core_freq;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -EINVAL;
 
 	rate = params_rate(params);
@@ -155,7 +155,7 @@ static int spdif_out_trigger(struct snd_pcm_substream *substream, int cmd,
 	u32 ctrl;
 	int ret = 0;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -EINVAL;
 
 	switch (cmd) {
-- 
2.43.0


