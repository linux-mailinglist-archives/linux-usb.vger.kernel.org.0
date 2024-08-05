Return-Path: <linux-usb+bounces-12989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1494721C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87D791F22B56
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45619AD5A;
	Mon,  5 Aug 2024 00:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UQD9ookZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF811717
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818307; cv=fail; b=cfdNc6395t9Q/MbAq612lQCOhISU04WvXC4HOpGDIVGYU5VjHcOfkWCJ9asxN0TpwW+SvzzCwHHLqiWOqlJIgY57PMow7Bve+7WyVgH+RKSUbP3aDh3diU5PrpIF90wH/uJwCvFwJBe/GONIv1TNJGkZlrol9SYXGhO0cNKPUUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818307; c=relaxed/simple;
	bh=pNwjQfUh9E2gDRg5VcfvhdkWk5SaXFwibPehWyuFWzc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V366mu+/x/mIAZkW4ssD4Yxuw4O2nrGC87rni6voJ0whUR6D7ol6plAZLwbLNNrSkJ0f6o796R+L6Qbx0lTDGd5khV+NmP0flmTfbyes4gw6aItd2jZJ64WVMQ5D05yPbSaVJZYxRofVrrqmpqrd/zp9Y3wsKhV4PtAyDw3LnJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UQD9ookZ; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPfphjaW+D88UYjTYk2VxTnqOE+plj10bqBpxZOy+fQBp0fphbauITzVcR9XuVPDv3Vbo8rtZLj97HQBKr9jiceAirFXY6uTcSMnOZokfD8oQ01XGVNgECyTv1ghW4OTWSavskNwxoBUOUSf6JtC9N8wAqBlA3jUA3BRcUTaCkjDzPoRD8uw2ka2ByJgzzOSjMTj37UaHXPeXb9oAjRI0hOf6D2VABRA+nrf9VeSXIHI2WKDLj3yZEFMd33DxdcN/7UWzxHhhfAvBftJwAZ6raZoFt734TiFN3YTKvvdo2PDr8qZbsU5bZQeJfSrgrJvBq8jAfz4J+yweZ/bsIcvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp1EuzhDLeCRQKsEz63bZ06RiCbh0qYe4w47qR2AS/k=;
 b=julXJLIPwVPWYsvsy40PZtbydP6tYA/XxiQStWL+s8MHZrhhSFpZnnkRGmdoAxeGkoy8U/AXWcEk1TinZ0q3JwQwaz1Sa5394hFT0o0XTfL41gy3Wnkh3tKRb24cw4A0DSLjN7lqwj7aljY3at/8yIOFrOp6xTzaK2REhy9ryDX5EU/H7XZOqf7T/Vp20ZoQmkEjDfjnWfDmxOa1E1kYeq/dW2YG8By0o0sHKHkBYt4FfSz13qkW9a1NKLvIGgVkAQ4eKgJ8oKu8H8zY6Rmw1zd6iEQ0dM27ztRNw14/LZGTINOX5lSORnpwGHE3GHuUgjRyxZOTYKA20XuWp1r+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp1EuzhDLeCRQKsEz63bZ06RiCbh0qYe4w47qR2AS/k=;
 b=UQD9ookZ1U+9RTqZ+9mn7VQMCti8sDtZwcyuGANplpYIu8TaBC/s1vPbmxcMD38vRppgHCYo2KG2o4zy+JfJJlQ/T2qDNgel4W2P1vAzaFeHtW5YSl3AyVRz5zsWbxEpzp5r+BqtNMXIMcogwzIduj+dDjFTKwmiiivuX19i0Yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:23 +0000
Message-ID: <87jzgvztvk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 039/113] ALSA: firewire: tascam: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:23 +0000
X-ClientProxiedBy: TYCP301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b67132-90cc-4ffa-fabb-08dcb4e6e9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MQwDWzKkfOj7+lzD3l4Y4MKjT9kEosCeSZ3k9CggYVvJu0DjKAZccbtITs8h?=
 =?us-ascii?Q?FgzqNTAYE/DrMY4hs8TTCH682KNINTShmnYycarsa+wjXE+4wv0898AQ5f8N?=
 =?us-ascii?Q?JtU46kKJ2CJg170FimahYlEmbe/f/rojdJUZongYdel/mIaGv/ppVrB2U5Xw?=
 =?us-ascii?Q?GSbEQWWVAqHKZSCf2Y/7RhDT4UYWJrgbJ0ndQANV14mmC113197iHaTYV9qf?=
 =?us-ascii?Q?U5DfymwU+nrKOrn847LXT2RNgMyPpWY/Jr4nGSe84ehDJ+uI3ery2k+vaYVL?=
 =?us-ascii?Q?s3/OexdU6QYMry4FEIq/hKW8xGisJB7pZJnnIfIq8N2qVa60jnPINYzKm0yW?=
 =?us-ascii?Q?Dgjbm4ibgCkxiIq8nQqXu2vMWF70/UeD0gdzaidgO3dj9M7SKNRB3tevakWc?=
 =?us-ascii?Q?7MQJSVVGDZV/56gzePK44r21ViZX3bSuxp9wApvE8dBi2SkHJ/+oMFwVTLg2?=
 =?us-ascii?Q?kpdoCHg7kWfEHRS9eE6O6TWbVPVJYUAN5yqSns/+ibaydI5W977CEyDeExGW?=
 =?us-ascii?Q?pg6W1yluUlUm63HYIp8yv8LVVZ4m7jhNz+t4p3Nk1230lzx2oPD6/GQYiFTF?=
 =?us-ascii?Q?I8RytTDBtxR2jWLJ85OkEJJPEe2sTplw8vXNarA6Isai9Lqik4ui1IvFWJkS?=
 =?us-ascii?Q?b7RJg/kpXCVnv4AsMSQYVMKukX8/cYCu1oxj18bSSqRDlEqF3tSHmp7xEd7a?=
 =?us-ascii?Q?V5IsflmVQllv24CeaVC1jgaVi2u+sjoVy23n/2HepOnSNhW8jBugFjEPxQgj?=
 =?us-ascii?Q?adXEZmfmCrOgiN39KTFANBFrRlpWrk347+HaXJqIVy3BB5gPsvL4IVW7tJYn?=
 =?us-ascii?Q?n5LmdyloeVN12Bfn0J0ej3k+T7kNkju7sl+/AA867z/6LPTaS5t51J2EZGpa?=
 =?us-ascii?Q?k2LadHm45lfN7rKxPs9G8PAPJOS4IyOiNYj+/S/CT90Bz3qv2KBUCgCa+IlS?=
 =?us-ascii?Q?C6FntWOM2Uq1ZRwXMZmNwwUKFLoXcPEzJymUOJ/6HSJh8/noU+3GKthsFqVP?=
 =?us-ascii?Q?XNT7+8lTsw2zWYR0CHDuDLRzOPRfBXYjfQ6TLLDJDV3lR0xms9XDyWiWDO+7?=
 =?us-ascii?Q?x5LMRWyXbpxaU+0/FMLAryjqRmpAsIGMYnMatoOqNqHeB0/51c6sIhTiw4vb?=
 =?us-ascii?Q?lg0OstAHElfqY8oapAM5DTyWOOrAkmhF58s0/k4rhS6XqfQDKcSQenynaGQt?=
 =?us-ascii?Q?nUEP9K0fYfEts3rA3PkiNUeWzuk9YmGRa1HB0jYfWs53gDGD+q097rCpPzbA?=
 =?us-ascii?Q?icUNay1rPjsCCHZZjXzK5rdNtJpZF9JmCPaTtU6wVqrh+eKsEk06jQCW8vbP?=
 =?us-ascii?Q?hyQzM6wtbjoikryiFCrBaBeIouNrxVuV/0N8/kgaLT+ES5z3WWScFC50hlvk?=
 =?us-ascii?Q?zyvXKjqQcsAPCQe66csEKnZKCAbUTcCNNI/zWzWdKsspyLedCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7sc34kxOcaoXvuHWEViytn+5+9Ln8r0Tm8nmQEodw6tFosuL6p/UNmZNoqxu?=
 =?us-ascii?Q?BtEB8UMCH8JJ0hTNoHDaxWz9jcNfyGdfRrJBNot4xGG2bC5pvlx8o/7/Btud?=
 =?us-ascii?Q?5r/HOjoRYzc/mnqPhMPpFRQyUpEqaa0MY2hCxxMTiHclODsCCOuUWGucOEec?=
 =?us-ascii?Q?GVW6q1TmXoPcvytB2YqjOMn8fLaw0733fVBOduBpy4K5ejo6lD+lr9+TWvx2?=
 =?us-ascii?Q?vDH8HNA5evfPpjP6f+sKHGg+PADst87CpGBxd2NNAyw1K6yAkCp1bakO2hcd?=
 =?us-ascii?Q?94XL/NCbj6r1wQ748yCtsWdUgOsBNNBv1RRRy6OagmOZAr+wRFxAGj56eYxR?=
 =?us-ascii?Q?5QfQvzis5uFVCWymRPsN6qf2Rsk3bzQ8uJJJUhg/LCp2tfao5bldefbjfPEJ?=
 =?us-ascii?Q?CyJhdhJ1PRY5KdhmYh3qQn/DBU64RTitzU7xamKVlgmfZAJkFJ3dHvhEoQoo?=
 =?us-ascii?Q?CYrduMxMIfaH/+56kEjASxP+qQV/qe0fcVp89v3hFxPFm7fO8BXXDL7WQAFn?=
 =?us-ascii?Q?nNaER98IJFS8tGOhm4HmWYKzdGqnPvxnFLYvRnhOduGdaTuktC42pGZ7qxGn?=
 =?us-ascii?Q?JQf40BonjQYiYBYwx8xWd1nghSYlrOEtU/5JnePrXFT8eXNSzQ48AQRln12P?=
 =?us-ascii?Q?Af9rdZmQ8kNeKaE3ML+tNyCZblPPcvMfr4tKSjp0LjmJHzSpQpfIfNe+d0hi?=
 =?us-ascii?Q?rXQ4jkXllVvdWWeyaPXA1z4SMXKT1p2dWc3oTGCDli1YQ/UwKChZoBxAirVe?=
 =?us-ascii?Q?EzFDMNk3m0Am62jkIh3hGLo4S96xOetfgnWNMHZZXSpNqLVUsUZFRgllR2HO?=
 =?us-ascii?Q?UuPTgk1CoxdT8Q9IjltoYE4ZUEX6OLFQepIhwtFE/IEq+zZ8asrlzM/tXoAG?=
 =?us-ascii?Q?X466nl0BoN1lu6KWBgfpRpda1ns3pO7Zenm4G9qYkxeb3wyYPs33jkzBi2Wv?=
 =?us-ascii?Q?d2ns5tH1wnZT3i6gFHP9w2x7W2YxlVJZNQPXsDdX+CSf7XE1bRfEd1z3iE0b?=
 =?us-ascii?Q?bkQoxZNuQ+t3y+AZjunvr4iVajwe7DJ/icIX8lKvj/DXRSMT5Eek42nnC4wq?=
 =?us-ascii?Q?9C090It/Y/TH27/YhSRUV5z3DB6Oc8CUfxZz3wix8ulIRoF/kEZ8FAf5byAo?=
 =?us-ascii?Q?vRcAFqq2DVcJjmeWbGG6FOlRWKIrTvr3fNkg5AtgBHDHg88BayzOMCHe1a3R?=
 =?us-ascii?Q?Sw8r2hEm98mYIU6iNtDljaChH7J0imZuvXz2wHPYI0ol0yEoGr2Wegb2MDYO?=
 =?us-ascii?Q?TV3xoxahJImJL1yhQ/6SUd8FjFgOi2/tFMXEoYMDRGn88tBUX4XqRkVLeiRx?=
 =?us-ascii?Q?IHMH1VQk3aPJxRrs8vlj07zARO1MVPJfetiA8vFat8lyrBYULhMTWLuD+mYg?=
 =?us-ascii?Q?8jNz5IJOh7bHEXJjNTNoMG6DnEfnnIYzLKFCabKRGog9sbqSJIqN2AzTj8wA?=
 =?us-ascii?Q?OaqrUqFH5Z2mJq3XVYszuA1t5AqHSFDRDJvCb8SGTncozTJ6NoZxXwdUfTsP?=
 =?us-ascii?Q?rt1x36oou79+bf3eCMSFsOzWZH12BVvsKlPAPu4lzF+OOKOYu5jnFs6XZ6eW?=
 =?us-ascii?Q?y5NWRnBptf20X4L+9e1Cqq510YbZXzsKN1Fu8aL1jj7xEkAY2ZelR0+uIftg?=
 =?us-ascii?Q?R/QHyckFSVYqlg4EmwQb5YI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b67132-90cc-4ffa-fabb-08dcb4e6e9d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:23.9076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D78WBMP8LFwfsHN4f+oomLr+3C/kwhmlsBmP+ZGLp2wODI2zS/YaHuIGR3sLYEnuHlhpt7Cp2ca/wWxSkWgiOo/8cRzPmomeTMx+BVPW1eq/ZjZvbq8nXs8z6lE0tdEw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/firewire/tascam/tascam-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index f6da571707ac2..29a8e7db7c30f 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -15,7 +15,7 @@ static int pcm_init_hw_params(struct snd_tscm *tscm,
 	struct amdtp_stream *stream;
 	unsigned int pcm_channels;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		runtime->hw.formats = SNDRV_PCM_FMTBIT_S32;
 		stream = &tscm->tx_stream;
 		pcm_channels = tscm->spec->pcm_capture_analog_channels;
-- 
2.43.0


