Return-Path: <linux-usb+bounces-12969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1A947208
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1C5DB20B99
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C694A0C;
	Mon,  5 Aug 2024 00:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JCV4PnlC"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DADD8C04
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818170; cv=fail; b=EQ8PBt4H5D0a0b1Kq2NQ1DMqwiitI50a3et18EtJA0iNZw+zfkp1T7ZNvmOtIxRAiHeYp8ay8Io3vWsSmKkUkLz84NNJS8nYtzdnHGvYtuKvwIwFH8ANe4xel+oiHilVJy3/+2z5+BdNTMjwfXVZiaO9aOyRPgPdo7W6HrdoBvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818170; c=relaxed/simple;
	bh=HYuIrX8jSKxIxIyHH+Ku7hI056eIRBBYibhNfAmX5AM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=odvQLIhqXGbaUuchHAojF4qNVZx9V95YWPgnG7avAZwtI5IRG5SqkslcW7aqf5JVgArnMKcyOPMeYNpKGRWxCgZp6kDSLMJImVA7wVtkBfpMfto3AUf9LFSMcuOUrTuWPtIA9567CRqpR5xvU+/Tt4z6jHmLwybJcoUae7nbHS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JCV4PnlC; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnHpV4BNl/DsnmE0cQ7hcXrAFFLkEtyQ9FWZRP33Mj6bo3iBrkwuTI095Pf0rKkJkvC+DufVp6s/6D9Twh+nnlcyCfbtkQD5Ss+aNqPPxweddcEoI3fU5x0JAbqFiiZgQWDUkK2rsemhkFltqekwpa5SbcfrkIi7xdwQnht3oS1OjP+EknIPfggnKQOpVri6beFBOn6O5GKr8kSfZjpKniuANxSenGZbSkT8tay+oG0NcDiSc++TOBTtqR01dJzQ+3a0vlaJXKmCdR3d0YOVs2jwXZpE/QG0LjXNui+fvEtLc4UQb0vinigN8P//qSM4eVwK4OTOOZ6xWzXx4z4DLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YxTb8PPGPqJP9yDIl7LQoTnWX/oEPaYUGMy6gdRE/Q=;
 b=qQF5sGnjUlOq86yZ5bf6c3c9d6tRNNk3uO7oSoDQV27ZTGhLqlCzmmJM1uJFq32TjVYYTzsdST0Qn/bOB87WsLgAA2myjefTxDKUxx7EJvn/XLYouoJuqTXX4bxIdq49EuoV8BCTAxveJ/PxQblGcuwudL1dsFm6pZMuXGxG6cor1+e8+iAHV14GIApExQEOmXkDS5qPO8FauAJNcq9+/9wWuuthFmWoGwZZMQDkSt6+X/oRTQueWRkB4ECz65IFR0c3UmsuWX6iALiqeiMPl6QkcgwXoqOiA9vGLxQuUy9IdMKSCTGyoHsNE9mxpIGJ+dvcRhEgfZOIDjzluktd8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YxTb8PPGPqJP9yDIl7LQoTnWX/oEPaYUGMy6gdRE/Q=;
 b=JCV4PnlC0RaZcZpngVe+MDrMQRMEkWh2ptbB3R/WXRqfyi4xit2DHTXaKHV1yjLXLgtsRO9vbtosRm0KRiXdZyvIqVALA8R4/u65a4Ap1x7u2lm5QEhRm0GvnQ/0zJD9kTK1HktO5IhL9jnp5gdmHMFyTSyRauFcizRS9jJNzmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:06 +0000
Message-ID: <87cymn24cq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 019/113] ALSA: pci: au88x0: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:06 +0000
X-ClientProxiedBy: TYBP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: f44ddef5-59e6-4bcd-c42b-08dcb4e697cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hX7dL0x0NP6Uo9lB1WSiq8PLeseW+xYsFb7ZTsr7qdaKg2ZgPg5vMLQpU57r?=
 =?us-ascii?Q?4MHQJmMeGwV3XZd/8fkEOC2mgpoBovhJc8TzcE0m+lW22SB0EwADe7y2OdZy?=
 =?us-ascii?Q?rfpi0Go4liBYxtj/Gn0CPe/5cV7JSd8arsvKqG6dZAKpMEBTKvMaIP7pP+8t?=
 =?us-ascii?Q?1eKD1hz0Eshpb5AfLloBDxv7tBB/rGBU9/9r/J5cP82Bbi6IDQa+Aoia+C3n?=
 =?us-ascii?Q?k1e3YGQ2oNuXQ7IxV76VI51SQRsSuzUTwclgvE9KjNpivxDK5NvY1BBheLnl?=
 =?us-ascii?Q?8rW6pgZDa9J0zjZUxWS1DGgvYTF5gRwGxzjXM5goYl8JsvNO1/6hLt6b0t8S?=
 =?us-ascii?Q?DhV3AZ5grK8mAOHTPyHRbysv4V1fOdGmNu2RNKdgqtlZ2Vyq3oLf8Y6M+GgK?=
 =?us-ascii?Q?GuFeTxMJcaflL2hEM6jhngzX0oZfNHPkqJrfn8JKwzk8WzFQDMpc7Ah2JGUT?=
 =?us-ascii?Q?7RQCBfHi1GDw2GdgHNWpBkouRMXKSQyXzd/nq16Hds2hziIHQVdGXFi3hSxS?=
 =?us-ascii?Q?NekKpcu7aKtvCQUkVqUGHPPI/iH7eXCPtzrkkS6dOXq/taCRLvwbD0uGvHYJ?=
 =?us-ascii?Q?8Xu3GoPq1ZCwh8r9tfyGWZERTVeWu8Q/xy3OaBYP47wi4vu5SVdkdzz3CdcE?=
 =?us-ascii?Q?FACx8ekMpOPsZKi5rn+YoyyUfHxwzAvvfOE2vgQKD0NjC+mXjCg4aPY2R39O?=
 =?us-ascii?Q?U4uWPm7uifbmtKAu7gftukk1H1Pt0MPZbovG4ocereFx0Rf4O1txThBWrysj?=
 =?us-ascii?Q?YGu9GDTB6dgpB7pbnYXqABDp9uPNNwQsSqpEdC0TU+Mv0Ai+qNOnJOhHbPd7?=
 =?us-ascii?Q?Sbnz6+RWhgUZVWvL4l4LD6H7YGyv/fZ+ZFNS3BJw4+7BldToYyOW9Nf4q3r3?=
 =?us-ascii?Q?A95UHpKHjHdqTDhFdUtg9ymk/nNvjVtZWWTkpEGYN33NQXOkhqKvWtdW9zm7?=
 =?us-ascii?Q?CP6UvAidxc3l/1RE9sy3zYM1oZR7sjSK2jSSsRU0cLbcbmc5NrJR8eWGoUxl?=
 =?us-ascii?Q?e4lz7isBOMocZCL1kc9Efx9Yfl8bARPXiqZVoryDoE2xVoW4Ns5F5IO10lwF?=
 =?us-ascii?Q?EyACP9Hdt4YwD5lWDcG9CgI/kslWjDX8wXXDRT/tm0HS61DI9iI4v3UeAaL6?=
 =?us-ascii?Q?DV0PcC6KzoYy1PhbSspPsxmIap9WwIlPJM3rECc00V/QROpjYk4DwUk1VTDn?=
 =?us-ascii?Q?U8mo9wMfy4EGvCS7FT2wNeeVsqfmnj1cFM+IzAcwLMoa1/3b+ubqMRapBNiF?=
 =?us-ascii?Q?sv9WJvyMwyH9abv4ezdqFqzzzblNN0QHnTfSlCMi2IZA2XDkZ1FkJB087lcQ?=
 =?us-ascii?Q?WXtKkQyqj03YQeHTV+Kd6+Malb0ataTFHlbUIbtXcQ7QVgv3DTkCZiiTGCYr?=
 =?us-ascii?Q?Ae6YnRsQJ6hzh+WDBGRZAbyW69On86M8U1TdckN6hGjmiMkqGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8+jTANCuP054//tetvXpvVnJtA9Mg+tKqXkyzsM0GHUSgb8CCQ9iopgVCoiw?=
 =?us-ascii?Q?jCaeohVzYqcR8Ic0CqEAd0iDe6UsOnvsJGU8Oqhvplicx6O/xT+7vP7X2vgT?=
 =?us-ascii?Q?tJecqNmnO9s9wd34fA8mYTvHcj/BTInEx9EmbTIjySX9ju8ci4a6jxN0bXH5?=
 =?us-ascii?Q?4pYV0Vu6+3mIxvDeozdZwGmTHbMVkXvx9bdYFLPuhAadvB97tdwcRovXD2w0?=
 =?us-ascii?Q?mOkLqPsalDx/a6l30rtdv+mY87+3T2LxW8jhWHUgjO26uzbSsz3fPKu8dNcn?=
 =?us-ascii?Q?R48K8vYC92r6FFo+NSGsV2grR3Z+TiykwRQ/GA3FylFeGQNbYjUMNzrFeRCT?=
 =?us-ascii?Q?BI1j/KG/Zqb8haOVsVo/Gg0UKxXgzo68S8L5nGy9vFVTSE79nalMkMLM5S3n?=
 =?us-ascii?Q?ZGUqhQS/qtAsBrnlUf3r0QtZnNI91e1Q0ymg+PFESTbbfvfF2pKbW1lk6Oy8?=
 =?us-ascii?Q?Hu3wk5WLfR3Kqv1R2ATgMwoY4ACwd+m3sXBe7mOLG+ctr06rMLrHQpA0EnPb?=
 =?us-ascii?Q?mrtfd93kVF/tnpdZx6Dmb7MMZPYa0VQUqdmbNj+bmXRMH+rSTq2p/5lRgtfa?=
 =?us-ascii?Q?J7lTTfe58qAjTFkfBCWLkvH3ZcSmvVHKPsaAXo2J9KT9Syui/UB1Uv0NZlXO?=
 =?us-ascii?Q?G0UFcL5vmLYsUhe2Tfy4QAiy6n/T1KvbpLOErc+Yx7KTUFvKOmGF6Ah4/WUV?=
 =?us-ascii?Q?rpvVBYTu4TN8/vXMeqjtdQQd3weICktD8DdRUFLZPX7Jbs3ra2E2AGNg2NGo?=
 =?us-ascii?Q?Z9lBhU02XhOvvBNrPBChhDqagj/AHl40wUEU3qFbtF3NbY23S4xL0dZBSYVo?=
 =?us-ascii?Q?sg9R2uasJeix96Zqk0tXr3tRB8qwSLKv4xtleYdpad2oI8JxqxbdK6RKGslE?=
 =?us-ascii?Q?6Wxe1bE1WBQBbgzJDC7N2IXTmKuZD+k2z5Php2gcQOEPs/OkkuK5csSnydlp?=
 =?us-ascii?Q?GIq22BhHNGJg3PAXMiAVsoe1zYKwh/VyVW6KlIO/VkhKVVDyEzEH8ZXkvSfm?=
 =?us-ascii?Q?vxQnj8UkZEP484h04iy73i6ecAiiKS6e5uZ5bAoffMIyvnz6fnXsJvtj+rm+?=
 =?us-ascii?Q?nLG4Id1Xn8qVwYCpT0ptLAssIVXwnFdJcoDRGEkCFnzMtVeowVKDYfGm1qkk?=
 =?us-ascii?Q?eighVZE0WPI/NjQj4xCYy+5WMFDDNRS0yN+bpFNdIoXHrYzfQT/qBAVVaFxe?=
 =?us-ascii?Q?v94D2LGwaotlM8xqt0FbkcnlXIC5LyNdf8Ugvm8Z0gbHTA2eEROz3gOy60wS?=
 =?us-ascii?Q?h1s8V5tv4Rh6JRiZP3eG21CQFxyiYmvqZfsfeNRA2SAwEGAEE49NLbU/6QS3?=
 =?us-ascii?Q?fuZ52BmiWDUn1Y74grdagdDZZgcqHNt0WFedPSS9FoEN4G2Hvj7PFn2V8yI7?=
 =?us-ascii?Q?w0oznqC3e5q8e5y5Z2tE3aYcbtfNRoU2nGuhSj59QiYoKqLa79ZprUlHVAbw?=
 =?us-ascii?Q?udc1AE7z0uHFbJ53tv1gwN/GpK9G8lhYMGZSW9nJJ3p2sjkVpqI4uYUa9qiJ?=
 =?us-ascii?Q?gu9LOiGVMWl8pmzYm2a4jTv8CjSNsJhHjSUiaJzc+QuT+0yG/ccjZmzXpNnO?=
 =?us-ascii?Q?vIJRMWfyqQzt+8vsB/gAxqZPjA2hVmSynsHP6QXUkfDkMeXNexqnKp507epx?=
 =?us-ascii?Q?EOUu99lYiyv2fO4O56lgwYw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44ddef5-59e6-4bcd-c42b-08dcb4e697cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:06.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5g8VY9qTtryO7t6cjJg4okExfJdZ1xINl5o3ufB62buNr8uKDzQYFv/Pw0uVQ3cpni5yvzvju6fpkcMYTFEgQKtCUr2g9k9dSKE67XEZTxGAjATW1r6zd629VoyFgsB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/au88x0/au88x0_core.c | 2 +-
 sound/pci/au88x0/au88x0_pcm.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_core.c b/sound/pci/au88x0/au88x0_core.c
index e5d8676373368..192b5fe0d54d7 100644
--- a/sound/pci/au88x0/au88x0_core.c
+++ b/sound/pci/au88x0/au88x0_core.c
@@ -2132,7 +2132,7 @@ vortex_adb_allocroute(vortex_t *vortex, int dma, int nr_ch, int dir,
 	stream->type = type;
 
 	/* PLAYBACK ROUTES. */
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(dir)) {
 		int src[4], mix[4], ch_top;
 #ifndef CHIP_AU8820
 		int a3d = 0;
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index 546f712206040..53000e486986c 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -167,7 +167,7 @@ static int snd_vortex_pcm_open(struct snd_pcm_substream *substream)
 		    || VORTEX_PCM_TYPE(substream->pcm) == VORTEX_PCM_I2S)
 			runtime->hw = snd_vortex_playback_hw_adb;
 #ifdef CHIP_AU8830
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		if (snd_pcm_is_playback(substream) &&
 			VORTEX_IS_QUAD(vortex) &&
 			VORTEX_PCM_TYPE(substream->pcm) == VORTEX_PCM_ADB) {
 			runtime->hw.channels_max = 4;
@@ -308,7 +308,7 @@ static int snd_vortex_pcm_prepare(struct snd_pcm_substream *substream)
 	int dma = stream->dma, fmt, dir;
 
 	// set up the hardware with the current configuration.
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dir = 1;
 	else
 		dir = 0;
-- 
2.43.0


