Return-Path: <linux-usb+bounces-12953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C933B9471F8
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02BC71C20884
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89B9110A;
	Mon,  5 Aug 2024 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MsIMRfhy"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC843C36
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818059; cv=fail; b=NpoGDIgRzcUVm4kejoXGrdvtyZPYlCSo1BI5ZwSvFnIYznPp/yjflGyEZIFKdGngWtyG8jzH7gJ54k5qsNn9V30mVshAX7fg1V2PcOqwVTYpaDMr4Uh8GOtSnkEW1pkj30TF5RyjPajknU1PQqMSSkGVldHtnm3Xceq/78vt2eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818059; c=relaxed/simple;
	bh=7eSIdsafACvoGl0jkQT3jSTsRL5qsJFqFq15w2TTKH0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JyttosDZNVvG11xt84dQAyLyAe9mvTCnOQkxv5a/sN5cb8PBlMB12gFWPIuxhq+wfpq7XzggXuAGdfwOSWNdAOQOtpbakw5TdlvFMEbzXD+aAiX+TGIeFB1oJhk72sXcMcwiTr2GEvGDyaMcLa1h+UrXW0LA63K1LThWFJaEjp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MsIMRfhy; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvwYN89519nPB6hMkEq1SUdD9yfieFzS0by7d3g8gnnLLvnexSaOdOcIxSJpZGtow+72teRZ7H9e1wllCYMH8Zhz2VwT/DEN81WJ41k6fBrGc6/FIRjqHJcf8GGECyUvtPcLTVuyOTBIkx6xmryQYducacWjNCc9+lmInwWrlnqI0lwALsaWaHRH0vDPPGI5B3CAvHRwys3ZgWUtyUR/uzy4PkQ9akCqFeeeox2PcV30zNLAVtp9W0hA2MJYl+gJmI+Sfzs8WfPCMRWEUzB3wL+IrC05eawAypKSbyAWrZKVIgRDOe3tNqBiMsSXO8um9w/xrkLzh+/l0d2t+FEmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjmQFyL2yLF1SSPQGT2bLiUTDL7Z7nshJwz90vu+LhQ=;
 b=c7+YIMBJsqywoKCmUiOAGPn5eCK/37sZ9qIitwHLxStBn7td3m+UuZK5MvQWSA5PJzd/cWNIpe1ikDn4Y/HXQuYyv5b3lBhm0mIM6QOi0zoJ+GgF7CP9FE4ezAfULVCVq6pKXKA77e67kukRMIvc8QPbS+rCpp0wfvM6gyhztYyhDcNdEwYTFY8ej1YRhg4mdFBOtxv/g76sKjml8Ll3DYpWJpx/QAKSgal0LEmIej4OpUN169zpuwmMCi1+3b/227pp12jXYLjAtkJkcDYOl7TwriC3OoS250AEbApOoe/YeijQOD75bwf/F5vsHwZ3tpRJcKNh5Th4d4vX58vw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjmQFyL2yLF1SSPQGT2bLiUTDL7Z7nshJwz90vu+LhQ=;
 b=MsIMRfhyPs+Z4GyTYib6qrGUcyhZrfOvDbuPAGqcaDj6YQ6q47ElF9ig9OGOdDwebgxWwnDKlrUhuEmtSdEKGuCoQDeXVmUxrEEgWQKWo9PAbJZ5cxoMrHJGVKCD596T1H9z4u2n80D5cfQmSVSi4s0yztUW6mL4zkw/OjFfXJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12335.jpnprd01.prod.outlook.com
 (2603:1096:405:105::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:15 +0000
Message-ID: <87zfpr24ft.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 003/113] staging: greybus: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:34:15 +0000
X-ClientProxiedBy: TYCP301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12335:EE_
X-MS-Office365-Filtering-Correlation-Id: f922e9bb-e439-4ff7-ca02-08dcb4e655d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mxQN2ordp20W211yObXnTOoTHFghZyzi3oGdNyOtmrt+qj0/gp7xxtbjzQiG?=
 =?us-ascii?Q?r9rVI5I9QvMDQ/m7L1OgF8pFzmeP+lEagdjlY2LCoWUwD8bUpr+v5f2BPZzL?=
 =?us-ascii?Q?i7ijiEX39AHkcHUpLI6UMt+uzcbT/xWWvi5zPfXxlF4wPq9M5bFs0wtqU+fR?=
 =?us-ascii?Q?F+8EkhmRpG4zJTVnv4szjD4veDL1BoRm1xtqTmvOOEYvQayGTQ0aI/hw5nJ9?=
 =?us-ascii?Q?iAUhfnhmsMwM2HvbJTSWufaqfetwYfoMvuKQkNK87JKXyJl/TPVkvqu2gYbw?=
 =?us-ascii?Q?sk+uo/m0oE2E/Is+5anXls2AET5jFKVqS4v4F1PjjIZIP6wJkGiHU0E9Wu8h?=
 =?us-ascii?Q?dwAVNMXAEXDFbzLCeheplv/Hg5h8UjLepwt7qz+l842mI6nmlxhzRttl89wr?=
 =?us-ascii?Q?AdXNr1kVC8cJv2R1HK3AwopQqRxrJpp1AJA8bRFl4dgfO1A0BLDTYqEocTp8?=
 =?us-ascii?Q?O4rJpZ8BtdvD+Csc54NblNp6KBrX5SUlVVZgbkGpjj56MlBOe1l8iRoMFmpf?=
 =?us-ascii?Q?oF5XY+6tTRnA1uEpR1eBMGHNFDPT9t7iYzIGhDOHHhQtiG8Q0EfmrJmNJAtA?=
 =?us-ascii?Q?AZAFcR3kcM7FmDHLtb1lzpBEgU9Ox1NW3YmY6Ckbym5D/XBlcWJnidDIjBpv?=
 =?us-ascii?Q?gfJbrgbdai3TGrFQ4aMBfiA8U71qeHovbt87Vl2ZYmpBLcLpTlM5s1TFweSL?=
 =?us-ascii?Q?4NNHaxxsKldp9k+eOrKGOkzt0maA1v4ros9uAZtpyPtLBPYEHfnxl6KYO5jt?=
 =?us-ascii?Q?V4/mZV4WaRXRR49Ixj9rYdD3rj1+8VGeFNOpY96/IjAp01RaY7BpaiY71dh3?=
 =?us-ascii?Q?vlNxw0UqXHaqhGcCr3VGfgGpVjGPNScA9HLdxta7FRi6ZBozUti2CfFdrg+V?=
 =?us-ascii?Q?HViE6rBdxJI/kCcckLpB8MXpeGXLZcvIuxiLdSjbUEJTfRGy7aPAESJLw108?=
 =?us-ascii?Q?FiOxqNSggoQ7XOSrkZYkLKmAphhXU6GQmGxtl70ayW+ApuMzCQ4GmtDxlB1d?=
 =?us-ascii?Q?+B5YIO5UI5Lf5qP5yxFDGZ34ujBFurOwkY4WEQc45HjrYT+CpB/TMhKemAf7?=
 =?us-ascii?Q?oF3e6CTHSZ/WVcq4kgTz9Igs3i1qkq2wKaz7tiU5aZnKyQ17AF5LdjYbO0DK?=
 =?us-ascii?Q?74uGAttVAU84ud1jIOA33g2Hh6n9fQqFkTrsizzUpp00lTyubFKsdT/CkqoF?=
 =?us-ascii?Q?pQiD7ddFGVzgLt3RztjsXDyZ8g5UhBaceZN9hKFErxaa5vtZf/W3tuOs7bFW?=
 =?us-ascii?Q?Bd8E7bv9E2cAhELKMB95ONrCFlNKaXPSdKQuHSvotCwHg1m/EVK/TMIGlm5C?=
 =?us-ascii?Q?CgQ9GRMQq3Hw67bHfhlgAzbMNW5uEPGkUUeEwfFYHestL+Qgu4qt36oeYNH2?=
 =?us-ascii?Q?C0um48WpEvxMXrL5cH4yY7nrAmASuywwy/4JYBQRF7FkxpCT0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9DK2SD/DhZGtiM04aEUXJNVlQKBwaIVP4KQs6/sTCzqAzEbGl2daE9Farq7y?=
 =?us-ascii?Q?OI93CEZy0f7oBrmImFUtMDnY0gS3/VRJ8CDixiCfpJThHKSLqZOudFF2OI+D?=
 =?us-ascii?Q?8MUZUKIe1JlNPqJnwjBuJ25AxvvE0xLk3haSGyeiFYTd5XHXV0AKxEgw/4jR?=
 =?us-ascii?Q?aACHKNcFDdsERX9Fm1M0cY4RNHpQn/olrw7h3EFJ0tO/kzCfDdg0uQORA2AE?=
 =?us-ascii?Q?DIielw/UhznNZvmplF3JWnBf99tqxRKg3hjD2SH6YnibybDqu07H+awR4/Or?=
 =?us-ascii?Q?5VAQY7siFMG2bsKAxvDo5JW1xELK9IIztmauL/fBgRBOQtlhc6B6QIjEii2h?=
 =?us-ascii?Q?m49Cy6FAcoI1heBikxhCI+biwRFd8p6WYwW+Ii1mIYaGm9PoBUr6edcYHVHn?=
 =?us-ascii?Q?IQViev3ZW7EfbDeOR+tB10NBpymP+7KRrXO+ngb7RXvW54ql8XoQor5JrUDw?=
 =?us-ascii?Q?Ywe0ygo6yebMUupSY5WMBDMKfPaeWK+APFmzgttIoYmhuXdclVVARyLncyuG?=
 =?us-ascii?Q?s6U6A7FwxeqBqRVoGipPNPMeUOvBf88Yz+mB+igOJUEAAYcxG8UugSCfPZ21?=
 =?us-ascii?Q?Qi6uDiX658KF44Io6cxVaA7ppUHOXSy1F6pfPa28HMZcdfwFqKi1WKLv0DqT?=
 =?us-ascii?Q?kVel0lJQOsBNgDBeNdlPbUVqEq8XK7VUhGqagcJqEF73yZi/p3eRAs3w1zIV?=
 =?us-ascii?Q?kiMN5+t6YsGxvdRxUa56u/I99FIrMt2zoMhXLdmS34wvC3rLTO+JpcD1b9oP?=
 =?us-ascii?Q?tnhFb7veA5l8KRlrqt/lDXTnd4VDblchfRAU/2rXikjDYphOU22suyTptBHh?=
 =?us-ascii?Q?2djCFDgcFpUauu25e+LREUXA0oV75gJUanP4E+Rda8+o9cwnfoTNtsb97TIG?=
 =?us-ascii?Q?R18kYFSGnJ2MJ9V3L8wix8tjwZMCe0SIb074Q7MlMKK4AnF8+RkmAosQcy5z?=
 =?us-ascii?Q?CR0+yhfkGQDDlWsZ7vWXlfBNK1p3qKP888QsL+jVuGobMuWmwBkBhHYo9pOH?=
 =?us-ascii?Q?56377amyywF1HxwgsC+sLYCUA1ir0O8uWpXIp1I0/9imZmHeeFzA2qu7rm6p?=
 =?us-ascii?Q?qXYQqlrR3aPnlMq6hNeu07ohjy6jWi3LXjuDa9oQ2cFXqDX7XFJuxIN1C51y?=
 =?us-ascii?Q?sueo7A0f454smORPkBLaFCXaavVulg60tx+d2KDGC5Bb5g/z4tQbg1al4raG?=
 =?us-ascii?Q?LdTOCD52s0Gx38iWJkwyMY3OecosuaknUefEPC6MFhrUHtefnm2cfUeZd3/L?=
 =?us-ascii?Q?XDUsMR4QpsFT0SngXww8k6wgPQ85dN437t3xN2rsaLb8N3KEz7w57z6GdWCs?=
 =?us-ascii?Q?R5EsFJ8v9jQiLEfNQo/KdCkXW5I/bJ9dBHv7az+UtZPubSxyjUPvAy1BVm2M?=
 =?us-ascii?Q?q2xrOxTAaEGzMoqrrmo/IBMyN5rYvjIDJVXdLYheKJQ23QDLx9irtiiFirja?=
 =?us-ascii?Q?xbtp4D9zmxOPe8sQxjTCpLRe123tEdzdVebCyoXJhSdw0GYJLDENTBCuMYck?=
 =?us-ascii?Q?rtd3rGwpx9khDmCb+9w1XoOIfc3TSHNFYd+2CbqWEqZW3zgKyCZNCyxQLxq7?=
 =?us-ascii?Q?n/gkspdLtQl7W6AMYzk+78wKMCcdjZnF+5xTEFsTNMy1MPgy9IsutS8gt+QC?=
 =?us-ascii?Q?orUuD24i8LIV7Hb11U3BuSo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f922e9bb-e439-4ff7-ca02-08dcb4e655d5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:15.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hd4bWABnUNiTOkZlNsBf48s24Hy1mRaSRyRZHrdRdTCrVZtD0qw7pZH1T0byY3R7/VGFouhO2GEBu8xaDOHmWIao89d5JD3CAJ2DHqGs9lRhNcBQReilYcInLTDwCID9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12335

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9ad..3042a486c0c51 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -478,7 +478,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 
 	gb_pm_runtime_put_noidle(bundle);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		sig_bits = dai->driver->playback.sig_bits;
 	else
 		sig_bits = dai->driver->capture.sig_bits;
-- 
2.43.0


