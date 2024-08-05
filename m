Return-Path: <linux-usb+bounces-13040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBE594725C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A6A9B21F0A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A641D545;
	Mon,  5 Aug 2024 00:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BnPVmFLh"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B591CF90
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818580; cv=fail; b=WkadfiSurzOUzNlPH8Djfxc05ty7xwppKzZKkrl/si+XXBfh1LdpeRWfFI/oThPO2hiitU9pSsRgvifKa0RwUKWxOCwSlVeT1hiIphM3JCSQfS+DGNVUWXcoiBw9dSM5jMZXTdhWrziBqkIlFBFfz6HOIBRxBctSdPBIXG3mhQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818580; c=relaxed/simple;
	bh=/rURcLGM8cZs2nsyC17JmnNTDfD0uvvMl1RDmBXFNZI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ne3zVMX6SXm9IlE1JsFMwihpjwV91W4iE9uEjboQ0cQMHM78PauZB/vE29pmzD9EZ1Hq0wi64JEFiQxLDQRXQkfuRHu61aDwE0qwJS68Iw2MCS1HSHeuI1Y+RypbA/y5dhpP8IPNVB2u1aCNRKDxw2A/UI9PyyBqS2cqjhcneVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BnPVmFLh; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd1fJDFkWpOZZek5xkg+PD4oDTjoytQnHHa+oh5IpepAB5cXpHLi0gJBXFKFCb72vz6jPeboBetNdLAqqt1an9pD0vH/n+FYqWTsNhMslAF80WPVVU30uYC9HJylEFmr4DNdt5tsRnpzJy3G/ne27/I83Oy57jaGx4uBcFf1ImHDoC7xSS/nKQiVl4KbgzEOGaiQgSTWf5Ts4vEJ4OcpHmstiaIX1KWXbqHkAGM1Rk2omWzJiMyX7qGtVrbD8dLA6ZooFYqWwm1aQ8zPA1aL24+Ad6BcLOLcHj9hLF0xzIpnBSnrJ3ehuOwhjAq5FdvaAR74CPNE8ujgBitkl4w8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgbnxrzOCQMQR+GjFfsDvLRjQTXnzso56052Q1xUsF8=;
 b=B+xPQv41a/G3vuumlVr+zIH1sXofJBDHtPwC3EyPkaKer8/PJsWfCMi+s21GodQRrgrc2TEDDWQ4E5pBDY8a7n7y83p/h5WF6Kf/za6lGhfFOATvNX1Hjd8EUeImMOYiwa6+8oqL0uz2hIJ+gqzaKR1MLThjYN8zbYkAaOK4fZSGiM7UBnwwwvBt9DUFGTlx6F5Tf359JIEDtC8x4Bq62lnDi+TATUX8OtfgFzYBPm64hN3gJ2pbSivktWLtB4fLgYdrmGfTRyXywE2RZFUPuOUOMnn7cpd+Lq4fId5QE6vlbc5Y4VvYjppvlG7KYbBrYn4n8I1xXstDyab5TLTZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgbnxrzOCQMQR+GjFfsDvLRjQTXnzso56052Q1xUsF8=;
 b=BnPVmFLhkwWgFzN26aaFboRgC4YHTG+KwljQcoNOtVl1ibRzm3rDrqYdzXdGvb7XciSfaReSw1G4H4EGFDlrf9z5Pm34ijYaue9mXawXBd4zNFNJw7FOEvEmHMYIr+x9VgAIDFekGmuToDwNJX06g48BDW0G+OZUQ7w5Tq3Htj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:55 +0000
Message-ID: <87ikwfx0j4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 090/113] ASoC: codecs: twl4030: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:55 +0000
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4c8b47-2d8a-4c98-18c5-08dcb4e78bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOTcnkj4Ng5UOmHPIyOwwahY+sCHQJgpgvZcVP10lbwF0CLAuyx+wS53n/DQ?=
 =?us-ascii?Q?+mQi9WMCQ/2EMNZa8TLhCAVmktDHrDN1D7b98grpbEB5YHN+hYsj31yV+IcI?=
 =?us-ascii?Q?VSzbuqtC7Xq5vaw/Xez8gLKxYXuiE8ME1L002sIdBP3KdIHRj+R5/SdYCR+J?=
 =?us-ascii?Q?sefJH5AX1cuPLPm1VqJBlyrOZHt7Pk48NWAIqUG9GStDzqIc8g0sLv4noU8M?=
 =?us-ascii?Q?2gUYNm9yByRRzHW85c2dOjbpExIsPjZk5Yl2n/rAjBsY6RJfA3H2YaVZ56jV?=
 =?us-ascii?Q?DWvt05EHwd8obc1rUPs/U2EmQgoVtoyRd/NVklFOcbzPkr0hy46PidVktzUz?=
 =?us-ascii?Q?qEfaXA8hfq6pZR9TqlY5pJtZkbNaXTVBGrKHyVEQ2Vk9RGMYmnLga8Ithv4s?=
 =?us-ascii?Q?ajIOAetjx0Ou7gvIx90Y2beQ44ooCqDiWLeP4BlO1pUnHG1ymV7WWAjRNl2D?=
 =?us-ascii?Q?6+7REexDtWGayAIcojiwHrmNQc6iNF9B/iBMj3uJw/WL9uI9mPaVMCbeVnhf?=
 =?us-ascii?Q?yxZNXcTDY7H9YSGfHrHOxeKFiplTHBqlPFhktnCEkAbfizmQK8fIUF63VAoT?=
 =?us-ascii?Q?K5oL6EAuK8dYA+rSZxeavDi+183QvSmH9YoYUzyRg30G4l6Y9d0B8MIqFun1?=
 =?us-ascii?Q?4gdK/N8ILW7HUmvSYNz6u/O5JN4dgl8BXu4zMcOUG/rffetfYabZTwEnXiMg?=
 =?us-ascii?Q?+dyg+1YZRPy9WLxrUdJ1JL9IyYJq+o+farPjShi0KOT+mJaovdLapoDOrgLn?=
 =?us-ascii?Q?pRA96mgyInq+uUjRtFbboLJjHZT+vMhIkp2RfcQZh8pXiQVI/Q/niRQjGpk3?=
 =?us-ascii?Q?5yrVxgZB660CU1SjiffohHRwdNDEbNkrSSptA8qEIXJamCFhKJM9QFxEPfHF?=
 =?us-ascii?Q?+mRpiCNUY1rCg7W7wc6hrn+dL6kRgAFQ64Zo+V8SmGjhg9S5KeGxAYxqsnnO?=
 =?us-ascii?Q?KM9Pmz57FjNCPLNpG8wYO3Qol4fm0OE63Wr1/Y085JLQLXUp/xaFndFt+PEl?=
 =?us-ascii?Q?U4SkpstfRQcjNDvDrh1R0pkUkQv1dpHlCwSkLO93CylrFK3kTPL/Tyvb6dQw?=
 =?us-ascii?Q?0gcbcSTdAqAXDxqCWChx/u/nXDtG+kjkWIU9h6yBRHKxLGe2DBe9kKTUb8bj?=
 =?us-ascii?Q?3Gvl4u3PBpXO4ZSOvDqtILzUnUZXexNYIvQJx+ptI9TwX28l/yyv/EFycSAz?=
 =?us-ascii?Q?4puh68TvbeUsUhaAipSBSw3Y+xc4aV09fj3ZO/dgDeQahaNKl4O0xBoeM2uz?=
 =?us-ascii?Q?dJ2ClIMe4baqud6CDClHTRs0OL3IjdNvL6ZCKGBuNFNDjBI8os33lLFZFsNU?=
 =?us-ascii?Q?iy8iiN21iSI7FjhMZuvD1czh7lR4BTDPVmyWDnhG1IrDyFe8sC10C5vmtu4z?=
 =?us-ascii?Q?kDWKZxjlHQRBAYxj3KiHrMo64q/i10RI7t1/NPvhVwYhQ/OmDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yW/Z7JBZ2Cqv1BbmQZNCTazFIfFABUHIe6GLLkarAB1yeKPE8dOBWGGn5Vdk?=
 =?us-ascii?Q?rnhfv+UrawHI4ahMBTcpzTe9U+e/RQBDAaK3hwjb0VRPBfLxDoLwIk4HsIjj?=
 =?us-ascii?Q?Z7lawxgVJxVGEEQzT7DhmXkvGGKGSWuJ+sIsLfNuyddanrGH1K6la7AYfEtk?=
 =?us-ascii?Q?5DOA4C5OyFFp/vJ5IV9e13Faf/iuRHPaUSc8lSUGBEWSyfw+6JATcOR1SGBf?=
 =?us-ascii?Q?8Ptx4D2PiNzCrwU0xWsMhRGFh3jBhFzVMcI1m9SvznWBaDBJdm1HqfMOcgNv?=
 =?us-ascii?Q?M7O8D/uYb5cfarBs9UvuoZHxNK/yBst2oaPmT13B5J84VdWX+i3tzMtQ0DmS?=
 =?us-ascii?Q?LzOjOWzs7J38XllIObb9YasYXyNiyVfuiDnY6Ld9qvOau9AqrRMYyKPuiEsu?=
 =?us-ascii?Q?B5U2VM11R62wit327+fPdD2l0bMWEie+Z2uV3639xJJcQKu6g4hEAFMYYrkj?=
 =?us-ascii?Q?YQaeHYKC9WR1F41okRulSjEhJgAktuCLn5AbjevLDR/krrgnO8/GvsmZBrv3?=
 =?us-ascii?Q?6YLE9KzawDRA62w4RL0hrc8fTe9/XCnH1mqZMabODpQLiu6qFW8A48l55iai?=
 =?us-ascii?Q?FAAQyeWoeDxqkOQ5KYVC9XhBBypT4MoujR17Fco8iaxzfvswGpVERR0uxHAY?=
 =?us-ascii?Q?oJp8Mr3T9zmiHfIZVtiPLOfT31/acvDlpPAfih12Fy4YSQVcZ4T2KJXwgaAY?=
 =?us-ascii?Q?RGKS1hCj/ny/DjtJhqykMQMraSfbQtp7lTCDQB8Ohh2WxPpbU4VKVxsTRxWk?=
 =?us-ascii?Q?kSu4+0fxos0sf2ate83FMP9BjgSRTRF4Jb6ZwQJpagz8qnPNQZU30/adcY/3?=
 =?us-ascii?Q?m22Nqe+s9v5GdMSbEbGczzNX4ztaOg0rYg0t4fg4fv0Sk7hgvFu5edZ8vCBt?=
 =?us-ascii?Q?G85gnvVhW5Vykoiu0msQuXGki9KkcJYGIqzk/0qY2jzYStxzid0XBuHtrTw+?=
 =?us-ascii?Q?JBMqbG2PJaTLtL99gdGYfzSwB2HdWhL4FciyJ+kDMHPIwyy3OYLWLB2OzOLA?=
 =?us-ascii?Q?rDi3NXXMIdGUSJt9IVc6WdES5Z30Za92hpdXrGtsoNS4aMdQbEyXphIbWs5L?=
 =?us-ascii?Q?oi+2cU/8Z2DdX+xl/P7Xp+nSojNhRSA/3LqF7ZcblovTZ2HYbPwJnsnRyTX8?=
 =?us-ascii?Q?puJ7TRTuad6+E3YALFutr2l0wsxdAWKqKCmTyJb/vnljWU3HPPQmzctvRwNG?=
 =?us-ascii?Q?psozA+jXH2L9EmhoIBMXTv4kfE2eZjuCjPPgmFpMLXrc0xOvC4410SUN+FEO?=
 =?us-ascii?Q?GN5hT55mMfpuua4Ci9T9bmONufW+e3h8PNgYo23ORbibP+qEOskHxrmF3b/K?=
 =?us-ascii?Q?0yYVsPnSWGR6F2T4LO14DFyas4C4sSK9UPgrIfSe8bDk2yGBCqt/5zO2qRpb?=
 =?us-ascii?Q?XK5kTfYAQv1XIWEGWxrVz2T5Kl8b/Ls5SX24xoB26h0NSRkSOa0ZZi7OjWk+?=
 =?us-ascii?Q?06k0SzdIkaxFo24Jo58wyrdk+pyWRGVCcp5LYBBaI20gYwKGYMVO9Lj3KZxm?=
 =?us-ascii?Q?RGCtG/RMhm/6FIrPyHtIdbBgoVq0h98lFK8hTFc8rjzzDnAeqgbLXpgX8iMG?=
 =?us-ascii?Q?poxet6kBjzjAMhPJUmX1IBpi3kHvN8hdMdZuMxUGMyRvMGE4j9bcVgWwzi44?=
 =?us-ascii?Q?kJJgFUZV8cenh1i6JnOuxw4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4c8b47-2d8a-4c98-18c5-08dcb4e78bf5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:55.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3EBh0gHdXmyCMQyYRNpUd1WyFUsL8FM67a0i8i9Ntc8Dv9CEpvV8RFN47NqIcjx9rafGFb1fM7jyko1+MI/gDfO9dytIlCQlo1qNXjT61WgBKhItLqJcRPIYxt+N07U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/twl4030.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index 9c50ac356c895..a36b34b92adab 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -1629,7 +1629,7 @@ static void twl4030_tdm_enable(struct snd_soc_component *component, int directio
 
 	reg = twl4030_read(component, TWL4030_REG_OPTION);
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(direction))
 		mask = TWL4030_ARXL1_VRX_EN | TWL4030_ARXR1_EN;
 	else
 		mask = TWL4030_ATXL2_VTXL_EN | TWL4030_ATXR2_VTXR_EN;
@@ -1913,7 +1913,7 @@ static void twl4030_voice_enable(struct snd_soc_component *component, int direct
 
 	reg = twl4030_read(component, TWL4030_REG_OPTION);
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(direction))
 		mask = TWL4030_ARXL1_VRX_EN;
 	else
 		mask = TWL4030_ATXL2_VTXL_EN | TWL4030_ATXR2_VTXR_EN;
-- 
2.43.0


