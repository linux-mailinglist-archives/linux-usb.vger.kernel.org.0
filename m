Return-Path: <linux-usb+bounces-12968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D1947207
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A370B20A5D
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DB24688;
	Mon,  5 Aug 2024 00:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GsoVauOt"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B15695
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818166; cv=fail; b=M04rpNKnoRwKveQGJAIFXMtMCwO2YHoRTUXrDmSyZo59KLy/gDC5NlbW/H46HebZzK2wz3vl7y8yYNT4Vbhdi5EqBIZcJjw5vVVBuniYXi54RaV2C7tBpEu87uPQ3R5eQ27Zl3EG24djpPH0zfWoXtl/ftL5Oladv7kY3XHfOU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818166; c=relaxed/simple;
	bh=gsde/cJHAmwbbp22NkWXiU3qOdpEOOZulO9Kz5BIpxI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CPMm5NvO3zXIoc5h7PKrkwvLtBasztHBtgBp+hSLF9l9UndyCx2f2t67K2LXcy/HpVnaNdQhZDeKitkR5dM3nDh1GqSyXOXlBQX3q6E+hfE+ShwEAijHgjscRQNSq0+hN+8jaAb+NLgn0Rj5zJkOKWX+pvrl+fqiOLac7x9V0Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GsoVauOt; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZAIFsd2fqVfMp1dhruRW78cutgGPSAnkh8MhXGaIxc3XfbR6yNmbtKeBmCx3QkmsZFAxJPvBsq8hBAtWeUliqUXpomW96JvaZSco7zHtZ6XBHvpI6va7BHneJipDzFur3kh2nxcaKZuI3gcVhkwkuefAOxmqEQ6bx0xW2oH0uWCm0YY5GgPNeqSI/+gvfM7WjoXtpDRDXabRlHMyC8f0SJsIe5d6NVe530eBs5sU2eVX5F1VnUWQ4J+f/XAEcrPoGNEv+T/leigGS/8+HJNXf3awYyYkqnbyB/70c02J7hsgYHEgYyLNembR80ZKf/F+8X4PrZ8MiB0n8xobZumPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GmQw3MIk+q98y/3wEF9FGiNcya3N5KLX9JV2Js2j0o=;
 b=tMnlJH57bLnWnzuwaDvhjoE3WNPnIK1cQK+g18T83EunNpzBWSOrjDwjlnCmcTIn16uQvkGoTmzuqfVjfYNbnUt5sWgibDFlhFe9dBFTJPbdMc467APrEhxOCpleOKYIWf1bb1O+J8qDWxIJAxQhyIVV4n/lqHccHCo7ogOCrhIVj2/ZoHlfZkQbpENkGiui5+FcpWQFjdTNky7iWaiRev0Xl+Xgr49QzEJehJEm4lunOqKEeMgPdzBQcTF/81ycyqOC1GdbY0GH3Qi1paFG9zsdPqiVjNJwUWe5zjzeBSRpX5M1zUf1jYLSW/BLeMIH7LPuQdNj2eRxDPgs1wontw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GmQw3MIk+q98y/3wEF9FGiNcya3N5KLX9JV2Js2j0o=;
 b=GsoVauOtpTMNpxtvNEhf2MNDti6LbC9WPFxY2HnYcsONrUrTyRVbwhOv/4nXhEQnEDxCTOxeUINhiUCej/htyTeTYkTSBudekEIGgrR04NIgKuqffMoxteQv2xwntDujWVvLagFI/TZ2s131r7iAxnSNhSjwUwc7pmSrHjfDts0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:01 +0000
Message-ID: <87ed7324cv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 018/113] ALSA: pci: asihpi: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:00 +0000
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: b92e6272-e5e5-4cea-c4a5-08dcb4e694b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S+UStLMKpbz4S4yUmg0kB2BIl28ch6UHBTYEvIji0KR3ShjKus+JXIuzwbGO?=
 =?us-ascii?Q?39Aiqmt0djBXUllqnH5duLNb0kJBTj9+r6Ldia8Nwh4TLewoM6yGWX7TIjXx?=
 =?us-ascii?Q?q3KoAq7r7gZjTXzBUTtx+NuE5Sz1/KQBLWB9Rl2Qc7ZCJu0YXahnEnsdwNaU?=
 =?us-ascii?Q?DWg+454Pq5mxfDGSD9QbSqM5tibIy2YnZWgoHG27CIaR/cnNUzCGRGH4PVp+?=
 =?us-ascii?Q?GsGFQwXzgUBesj7jjgkIZn3XpTWuwuT5ctgVwZgavj+S0mA9nn/r+qB2dZLc?=
 =?us-ascii?Q?VFrQBKOaTaWyPyFGjMfozlQlFGzTo+vrgTk/aYkU01Nn7SJCaXM1ccTVWPIB?=
 =?us-ascii?Q?FMW/53MgVj2sa2sLvEKZVzez6Der4QEcwMaYgBiCq8TGMpDNgywNAa/5VfsQ?=
 =?us-ascii?Q?zSuG4heuyntCu8DR/70FEpLp7P8pxxoABH0h3vy18hSNWb8TZfFTPs2nwMfp?=
 =?us-ascii?Q?tnFgCzRLeVQG9E/sMIkCFXJl6P8fo/4e6UpQXsDoy9YR6PlQc3clXQkQS3xM?=
 =?us-ascii?Q?PA84ogwOyoObzOuwIrDsSzeC+41Q1LIdJIo2RGgCRimmVqf7ftUv/ckcUlQy?=
 =?us-ascii?Q?XAKhUpm1rbPlh8GtuQ0RM/qTqek6ohGhrxWLwB6HljG6/r3rT8He1h5B4Mbw?=
 =?us-ascii?Q?3cWnRCh+vA4OvuyCZ1Hyp0Z8Bkt14HGEyQhvjwJyloCFbdosNtUShl/ch4t4?=
 =?us-ascii?Q?xZoqoWxeWcoUpSh7gVZOy19AiKrICf+Bs1hQU3pbMj3qXJaq3UMHgharUE+F?=
 =?us-ascii?Q?vCcYCVPqkp3lyQadco+sPjCAMhJSlIpQnEQOpwqByfqONqFdH2lVBtzVzZ/E?=
 =?us-ascii?Q?cyImS6m4xv7c53p/dFsveeGYA4Q9ZVE0EenuV+/ZJaCn6+QyzBV8bZlx1XO+?=
 =?us-ascii?Q?fAsK4YwNOsPI3CqQsFj36DzLaQP1cXOYCOSiHSALncYx/umPvCp6gtqhbSug?=
 =?us-ascii?Q?B2wHPP5Y867SxVwM3lFhtEmQOK3xuJDFDHewlsm9Z5nlvHrsj9e/jHf++Egb?=
 =?us-ascii?Q?LFaeqImlvmd6F724HQl19zHAmcJmCtGa9WXbV+gL6MYDIpIuStgie1+b7LSf?=
 =?us-ascii?Q?uor9a9YNUG3FC+70GRXGt+3gqnZktM0a3gRAPzMeQgDax5+7Ncyz3stCBC02?=
 =?us-ascii?Q?COANM7mcm8XCqbF+8t5FRQuS5xZZS/uRo2dT5DjpouLHGTfc40rIKw5cCGgq?=
 =?us-ascii?Q?F3UpzH1JKHqfnTWs+WBZv+8CqD2NeFuQRjNr6eXG9XtK+DDh9Qwd3w2C9t5T?=
 =?us-ascii?Q?Arfvy88bT8hvKteR0ZHxjWF/aLhsy/f3AH3a6OoWMkhY/fWTSP3w0PxR/Woa?=
 =?us-ascii?Q?Io54BBnHn8yFPo1YtLHPW1E0ez5nWW5kZ9KeHPA7Hf9hBkGJFsqTQuhV1tPO?=
 =?us-ascii?Q?tI3oIaZSyWGoH89PUuR3lD7AJNhMz+JRXjyw0CWoyGuUJk6JZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+qHVx1K5SsWGLSKIul6u//CsLTtdaC+I4Kjv62Gn8lksGYy80nHZ1LxTLBQR?=
 =?us-ascii?Q?nXBLl1A4kwxCf4dJLTEEhFW/le30Qo+hOJxlEKsLaPo69NYGH0wB1hyvBKn6?=
 =?us-ascii?Q?+B0BwYt9lEd9O81pEZDApqFiap2+3XQor++FiTmJ0vGcfdFgFWS8+0G4x/G6?=
 =?us-ascii?Q?cJ8/s36X8fYRutcKhFw1NxVcVBOPZ3+O0FU25CYgvTPahyvxfuPjgPnounhz?=
 =?us-ascii?Q?KsENoZXU/KcPqaYtvpELbHa+ZbCjRAjL2MGty1SEu3CsFybV2Pw/e/PnROhp?=
 =?us-ascii?Q?0zYx171P3njbMCOkyBmioUMLXUY4sD0H5TPZQAITv3r+hEuL7jwTO+5Us6VX?=
 =?us-ascii?Q?BkIg0ks58d0qw3rybeGuSclEWkDVLtQkazs7Ei8KnsRLIfTZXhIwk0U1QDbU?=
 =?us-ascii?Q?/NDAbnNIOLNFzPSTmM8TPFxWB+TN5cxLABzkYBA7zrscD/2lc3mFbBZYtDda?=
 =?us-ascii?Q?uikoNZFsnNvL4bjnApACBCjkVsuCvmglrkYhCI21Vr0gPRBqgfw+AKwOBbmi?=
 =?us-ascii?Q?oOvXJOSEmxAI+4wWjD5jhvqDirEupFRR256ycK728EKYK1ElNTsqQ9CAqitC?=
 =?us-ascii?Q?1q7U8ALgfQ4Ybe7h03K/pEFSvw0W2+Uf8qY5JV/l7lBGn7iAtchyXuBZmBAB?=
 =?us-ascii?Q?s7O1+swJkCzcn+/z1Ifu7fRK2pOgdwZWLIaOGhTQmdvwQFrUfJ5vNVGFtHQF?=
 =?us-ascii?Q?RnqQ+dktuoESo9UDMZecAMhuIQMQKHwJKzORftRq9iv9AWaZFXiS2QX59/84?=
 =?us-ascii?Q?QVk4FqQjeEg7SIEUJgx54QcSAhh/SuikHmngq7EndSkFBH/D5+eJVcK3zoz1?=
 =?us-ascii?Q?Ez4tWRvEVF3jAO3c1oFKDBQn1a74RBfE29PiqWoctGOaahEYB9GUs73OeyFx?=
 =?us-ascii?Q?hH5Kmpn6SKsydpL/5ii5snVmEubUpsbRDHMgbxH9/J539UHLepvC7jruGFqK?=
 =?us-ascii?Q?FhBSCc8oXr4cQYTBMHDmb4B//XWINL3UtbURykYft32+Wjyap1y//4t2iV6m?=
 =?us-ascii?Q?9E6FxklmChRmHZWv/ZEPJoM4XfswypF5bATomjFcNvtFIy/jbxPAL6qyJRfQ?=
 =?us-ascii?Q?EplPSut3NEQG7VTfXQcIJHdVm1pB7HGqknC+I28R1RUJ0M9WnHSiZHmxOdyv?=
 =?us-ascii?Q?WyHHW5G2B3fCXS3hSCAimq5EQf9+OOO0WeQx8xwgEeYmNJopRufi/AR7/XOp?=
 =?us-ascii?Q?G/3NGfO7LCV0Yk9w0YDmAYCJq9kCiSTRXBya95gIzGq+VgMldqXW15yUIDPh?=
 =?us-ascii?Q?lYj8zqidkpwoKbEQGkLHBSuqT2UsbCIxGE4H8C7z3veyEmQ4v9i63MvKmn7k?=
 =?us-ascii?Q?vBIBIRfE7bQWx/0bFCegMmw4++n2ZGKwSGElHXBip1IvLAGftA6Jsaf15LH3?=
 =?us-ascii?Q?hz0VVq6J3ihJIBi6hklJV53pa8LIDAKuJbs+taGqChzNHX+csvpC2x6p8OEz?=
 =?us-ascii?Q?mZgA8nAMKvsR7SHDn09yYllWSzSP5e6kCsWT6JSoApwg6gGyEdYbsDOas9ro?=
 =?us-ascii?Q?+vGUtjzna98/2DCWOotciQppsfyzwSiNL1i0lKmHzJOpWAgOKx3g7uwAeLiK?=
 =?us-ascii?Q?Xi5qPTkuvdsjYBPxTQPDPjxJQsIEF5iYdYGr+72rx1WYDWuqvBlcUhYwAXqo?=
 =?us-ascii?Q?PL/h1VwFQOb61zeXqwwiz0k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92e6272-e5e5-4cea-c4a5-08dcb4e694b8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:01.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDAUeRtlev17UMgtxxfVHssCsgjpG9eYqf+NE1keHSPb2sJJKvC0LVTmI4dVdR85zFJUtMwtN0Mv+IapjwONYFfTTl5nVLrOvyPHb11EyNT7+1FortolwxzcfAzQoqy6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/asihpi/asihpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 001786e2aba13..69eb696012933 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -447,7 +447,7 @@ static int snd_card_asihpi_pcm_hw_params(struct snd_pcm_substream *substream,
 			params_channels(params),
 			format, params_rate(params), 0, 0));
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		if (hpi_instream_reset(dpcm->h_stream) != 0)
 			return -EINVAL;
 
@@ -582,7 +582,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 				continue;
 
 			ds->drained_count = 0;
-			if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (snd_pcm_is_playback(s)) {
 				/* How do I know how much valid data is present
 				* in buffer? Must be at least one period!
 				* Guessing 2 periods, but if
@@ -615,7 +615,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 		}
 		/* start the master stream */
 		card->pcm_start(substream);
-		if ((substream->stream == SNDRV_PCM_STREAM_CAPTURE) ||
+		if (snd_pcm_is_capture(substream) ||
 			!card->can_dma)
 			hpi_handle_error(hpi_stream_start(dpcm->h_stream));
 		break;
@@ -643,7 +643,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 
 		/* _prepare and _hwparams reset the stream */
 		hpi_handle_error(hpi_stream_stop(dpcm->h_stream));
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			hpi_handle_error(
 				hpi_outstream_reset(dpcm->h_stream));
 
@@ -755,7 +755,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		if (!card->can_dma)
 			on_card_bytes = bytes_avail;
 
-		if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(s)) {
 			pcm_buf_dma_ofs = ds->pcm_buf_host_rw_ofs - bytes_avail;
 			if (state == HPI_STATE_STOPPED) {
 				if (bytes_avail == 0) {
@@ -837,7 +837,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		if (xfercount &&
 			/* Limit use of on card fifo for playback */
 			((on_card_bytes <= ds->period_bytes) ||
-			(s->stream == SNDRV_PCM_STREAM_CAPTURE)))
+			 (snd_pcm_is_capture(s))))
 
 		{
 
@@ -853,7 +853,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 				xfer2 = xfercount - xfer1;
 			}
 
-			if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (snd_pcm_is_playback(s)) {
 				snd_printddd("write1, P=%d, xfer=%d, buf_ofs=%d\n",
 					s->number, xfer1, buf_ofs);
 				hpi_handle_error(
-- 
2.43.0


