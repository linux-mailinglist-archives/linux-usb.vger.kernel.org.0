Return-Path: <linux-usb+bounces-13002-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CB494722A
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F81D1F23615
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BC617997;
	Mon,  5 Aug 2024 00:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jC91EYWM"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75217577
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818372; cv=fail; b=izk4HrxbJJSwvW++qRPkiGDAoqYFnKR12eXVXzWmUMcjebkl3PsX17mOQZV5DUPUysR1rN3vZ7/z7GpScZ+Xiw8sK7LrOvJcG3/HcJsdzUOypuoOlHV+OicaH7bs2XYjiPMldNaP8llGYmyQmDb+SYoVceWcOw9QiOZtUKaEHcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818372; c=relaxed/simple;
	bh=OHcwhhRaCQ5nNh2KNCNC7TLahmlzqbvIXsQPJDIyK0M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N38TWkTl/kBJYa3Gm2JvlWk6Hhonisv2F2+h/KDSZMPJiPgf+DUryYl8vdB25f/UEoPSkmbYtH5+6+wU/WNf5P5GDypGZZVAyg6kQnnPR4ZnQCWTWG19PHEhIFoPy6aMzF+Apvry89JBJWLjiWgqvj2QtLq4eroKeCx1iECTSsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jC91EYWM; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBf4EFiBDjJGNpr+wb/9r78PskstqyuHJiWQXhC7AV30RG9nBh0zm6n8DaKZI6azp9GnTJWzzdRLoJbI/S5itrRmwpQks4tjJ+oYl1aMmE2Mx2jD4WwAvLrRDWHpc6W5pFvZpzHRRuutAe1ChNG808O6DXdyOl5CG6gcl2U6+dcHf/nZoiOKbmXHc+5YjrSkZe9ufqk4syHtewuT42/rBdCxmqwl3GygzyJd0Mg65pgjKofzqZzOlJHtFqy3WzieVw7k2qF9yVbkJGnINtrgKmje4/WkIm6WCxIzJHgsIdefnyJr2qW4mAEeoh0W73eM3Q4p+x2ifjTI7Kr716MjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiIntsRbiAsnvD4yM2VDU50+xHcFYUuOQslpju++csQ=;
 b=GvB+fm3WNYGVxXouct5Qz6hDbjpzgfLb4N7hB2r5SgZQU7RgpXPTQMXhVr4KEvzggVkuWrEWsRGPrvnGUk4Z0ZlNmrCh50L2tKOixXE8Et8tqkKz9FwP1zMwFp+GGFBW7e6l6RAcjvQemQZ62VKM14ZuCgUWAxYenoKIkYcZ6EAC5xdJ14FtDq5+FhNrIE8mhUX2Dp1WKzWAKJD24ztcAh0oAUmW0TYyjSyl9EGHnVypECvidC/+pXLhUHkT7DxFfTjkzp91vaLLVq3PsXoq833k5ZfW5gLhHssahFC5OE9OkpNA27JWHuTkGbJkAs5WRpo2JhGEdlw7D9uuk4ZsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiIntsRbiAsnvD4yM2VDU50+xHcFYUuOQslpju++csQ=;
 b=jC91EYWM1apzfITeU8D8EcOVMz0BheUFA1h4fAnRTAQPdGr2857d4Qyj7YPAV4kO8VNosMjJqDIRqkDRgsVVS/wIqYm7crT85B/gR5JrN7SFwf3ZL8t1+0hxYigw8d+H+eAfy1Xn81DqrK0JNaOS2k49ebtQhvPDB0ORWuq70CI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:28 +0000
Message-ID: <871q33ztts.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 052/113] ASoC: sti: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:28 +0000
X-ClientProxiedBy: TYCP286CA0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: d920519b-067f-43ec-0cdd-08dcb4e71030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3khgLI2xAa71ybtAmUa+/BpbackG/kbAZQIrMKgRB0zZAvemTGJNFQu8WEUa?=
 =?us-ascii?Q?IPZJfgitokpwEXS7vhns2Fh00MEzvqbWVepP7P9K1uC/s3Y7Rg8zsz7b85SM?=
 =?us-ascii?Q?yob5AZ63/geya8zlRqEmaJG0N5LMC+BBo2BgPw9JtO2tZBEXsFuwHoemhTBk?=
 =?us-ascii?Q?V53Z+quHEt41e7IuSVC2k3xhfYAp512KKLK5UGTNvBkGSBXIYYBuP0tuvJvt?=
 =?us-ascii?Q?f4ktHIlgCKE7AqeJNAKWNb86lF9vefpIVmznPj2R81SC/mOwJVwMb5Xve871?=
 =?us-ascii?Q?P1LJqWPv+unReEDT7X+sXaG96Te/tVxPYa6FDtRC5u8rZxoXjK2hghvvacok?=
 =?us-ascii?Q?euLdYQ5VddJhnGfn3voouUE2Jq5M7Pezl4R9ls7pnzQXG1EZj7pHr5nG0t+V?=
 =?us-ascii?Q?MmPgCqI10xBqcUP0LPgQbVgV/l4snpbOQi/DEsIoTL+ikKYy2l7taSf6nWYj?=
 =?us-ascii?Q?5jppW8kWzpmXQHRm/rsYMLyC8Pl9gxYsYBVOxEgEcnd+gmtS2OgvskDZnnVm?=
 =?us-ascii?Q?bcnuJ8g3uH/c//SXDA+ufwIwHTAxLkDDHMGUSJtezf7/2LCAeqHXlQS1pvJV?=
 =?us-ascii?Q?6bc9fRR8HRPryYEzwjkN4FwYd1qlPSeMbuJUg5EpzShh47TVl7R3cIaOqo9M?=
 =?us-ascii?Q?gmmkBr5jqBOwnCEuGHlta/40rPvPt1FNyac2ZceDMG8s9yotWKjGKZZkCfy1?=
 =?us-ascii?Q?vuZiz0yx4MKpLlBFRx6vIzc0H0KifWDMtqIdORS31TI6691/qPhlMetq0I/3?=
 =?us-ascii?Q?7xPel+ZPwSRS4JGx/B2jl/c2pRLcjxGHcdCUxKwsBvObc4nu7s/C/epLbeBf?=
 =?us-ascii?Q?qxXwJ/8pMlYQ0kyZhfPaCuUkvY5JgeNtz2QW6iX9UjaJm9ELmSVokp41N1xS?=
 =?us-ascii?Q?4+3wcizZ/6SnwM0tJDgmfqOr2OO6y0HPSk+YtzyBPTkW0PGljg8bAKsUjZC8?=
 =?us-ascii?Q?x6F/17wAg/9JpeU19pthTQDSysR7I6Bziln2IP4ZT4YoEUq/AJSho2vfZb7x?=
 =?us-ascii?Q?jnBGM3Eh/IiXn/fSV+gt4IPL1JoSFi4+g84ZcrOhi9WMCu4ZG/Kl7ShQFHnd?=
 =?us-ascii?Q?9QNvprHSiQyjym2cv8UqejyMXNeaHw1wYL+rTmcCwkfl+stynGRXm7Jg18mO?=
 =?us-ascii?Q?ol26u2Mt2rtz6jZOw/XfN+Xf0FK6zf62o0CAm6Lmx4YD4/f0/5TJHh5PfZVw?=
 =?us-ascii?Q?rnh+qrHKX5Uonod+YdNodJgKO3EZC9louclGVfdwRbJZRKV0dysgjoqO58HY?=
 =?us-ascii?Q?RJDALUZCooAsOTw3TKiCTPojSySl2xfNU6Znmw1hJMWO8rUzwcvOjSBciSsb?=
 =?us-ascii?Q?nQVE2iO3EhAI975CTSNbicvVFadgXFCDFiwIvZFIwTe60vEObaTgAxgR4TQr?=
 =?us-ascii?Q?jz9gld2gvytkt2iU4pAobGFHbBNLDu0GBLLVkIcdGxmUA4TutA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mg0ca+X11KeGUBnB15Ib13yZzC14HKLu+UByrvaVJvO3NsZXdHWEfZMu/WW6?=
 =?us-ascii?Q?SE4DGfxJdsd3FXB4p/YCrEZKzlfOmonWlP4HYOIHv2BZu+0r6X529f9hkGL8?=
 =?us-ascii?Q?89XTHMHsKGSMTWKCkL5W+bFNe6zze8l9ZhZ4BjDqUvk5LyYbLVwbBcKqbr9Q?=
 =?us-ascii?Q?i9zNNsjXFQRQ33IzIKOZBVIUli71rFpSKK6zcdqgCxSiQfhhKgmQewVm0Mc+?=
 =?us-ascii?Q?2rcDV6dfYbzWr8Ytim71Nl1pBSYeek+VLCO8pAnoWxBc57u6S7SRY2kQhLe+?=
 =?us-ascii?Q?cd9ClTUOgmEWQawQY+T4WQYRJ4ZrHSoeDvwKbhIi377boc9FxzQTxLzn3avi?=
 =?us-ascii?Q?pYTV/oyD0LQeWiUi3BirUJj9jRbuBLBC7VSsZj2B2Qq/RGQxIv4zmI3Nmbbt?=
 =?us-ascii?Q?IwHdjrGqgHkl7QpfRGcMd4fQpFNWY09urZxEfcnT+8nDWbJpGXrEYMt5Y+a7?=
 =?us-ascii?Q?0IWxTWfEVS5WO+FJR/ppRoEn0nt4OKpYxRehvx//vI8VBExxgx/fG6e41UPT?=
 =?us-ascii?Q?dCt2B1c+AsVIbTWvDjC7mG4qxmp0o8QUHv+W3F//bfzARc1RJVDJAwH4bz/8?=
 =?us-ascii?Q?OfL1lLRcOtSrghZGmXalCMFDd+o5yES0AzkWTO2DUlvPPuLVvPxCeRoNXiDm?=
 =?us-ascii?Q?1iRxJ5PgvCSeItzO07u3uMoizeBzOfHEbzTTZNOEmmFSAssy4su+S01nTYVK?=
 =?us-ascii?Q?2/Hde62zmJIffynEhNW+7O9yMCOIbRd5begqCmNenVi3EFG8ENkitJAVPNlF?=
 =?us-ascii?Q?VHwklY0titVDmFkyNuJR9qSbSapCCkzLXkzWO3pfBV+cPi4QLcUlif3CYtVk?=
 =?us-ascii?Q?CPu5D2esFjQhwOga9MMuN0wKwrcDKmP57jgjNz5edoJ7PlBpQ/fskow8vIl1?=
 =?us-ascii?Q?xjEO9t1sz/5/n/C85vpc/AywXSRu+prA6Xz3SQ3EmmjduIC0P/RLIbWp4/Si?=
 =?us-ascii?Q?kf0BR1tAzYHi/+JsZ8VoshP5Aa1WB9iIqxE1zeGAVqjci7ZwHsax9DrvwlFr?=
 =?us-ascii?Q?IAWDD7BgbU+gACHSzNJtIPDIAkSb//5GVI6ljqswOL+wjUg/x3JAtsCV89WS?=
 =?us-ascii?Q?UWgl8NHoAzd3WlLBXsp5dxu+fj+ToU6AXKOjNZvFrwV+HPcIRjlOCjOR6szQ?=
 =?us-ascii?Q?d13WMhxIWHKoqgUQ4hdRaiHSqoZp+RJ6LQD3nKeVteSmEIh9WaAVK2eNa+T8?=
 =?us-ascii?Q?p+VCyMOVEad8w2swJe2y+0oM0xXv1KTlArhiHpQSN+J6Adusp9L9BjxBIyeC?=
 =?us-ascii?Q?Vq2pnSJHUMLY1eNhtIhJZwaURVVNV43EAKN/LEps/zgfyDcDvWt+xcqsg8DK?=
 =?us-ascii?Q?61eSIIEKDCIV9gOop3VZ2WNuuD1BrMxZNJOlnStCoWFagao9SZWTic1WJmtB?=
 =?us-ascii?Q?yC2TAqBFTgHSZnHcFmRMj5CA5eL4I0Y1J1oL1k9Gv/N9QMIHdw1kE+GxMVdb?=
 =?us-ascii?Q?oqpW2KndRVnKMgZoR1I4zTnoZehr5rCoi0mCZNX118IUlRfDYOkIUb45WfdA?=
 =?us-ascii?Q?TyMtbaSAwWDdVzWEmyYNeThJsQmainhANFr0c7tKqVUJ5/k+HBeo0bFgUMmK?=
 =?us-ascii?Q?roEja+hjsGA0VOQvjzjCZgYqKf98a1OJk/sxB+YuZFfECPADVOJQYTHu93hc?=
 =?us-ascii?Q?XXqOahIcKqdES6eQWqcg/X4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d920519b-067f-43ec-0cdd-08dcb4e71030
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:28.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6xFSgb/kpOKddD0S9uUXgZilJ6LJEyacfZEY1hM9nzYYb8MSTJhjYe3EFZDyvlSopJ4MVnWEzFFb1I5knCKna8ji7PRbdSw5ZzbVh9k5lDvYIdOcpEznqKsO/po9NWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sti/sti_uniperif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index ba824f14a39cf..75520b8827ca1 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -337,7 +337,7 @@ static int sti_uniperiph_resume(struct snd_soc_component *component)
 	struct uniperif *uni = priv->dai_data.uni;
 	int ret;
 
-	if (priv->dai_data.stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(priv->dai_data.stream)) {
 		ret = uni_player_resume(uni);
 		if (ret)
 			return ret;
@@ -358,7 +358,7 @@ static int sti_uniperiph_dai_probe(struct snd_soc_dai *dai)
 	struct sti_uniperiph_dai *dai_data = &priv->dai_data;
 
 	/* DMA settings*/
-	if (priv->dai_data.stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(priv->dai_data.stream))
 		snd_soc_dai_init_dma_data(dai, &dai_data->dma_data, NULL);
 	else
 		snd_soc_dai_init_dma_data(dai, NULL, &dai_data->dma_data);
@@ -440,7 +440,7 @@ static int sti_uniperiph_cpu_dai_of(struct device_node *node,
 	dai_data->uni = uni;
 	dai_data->stream = dev_data->stream;
 
-	if (priv->dai_data.stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(priv->dai_data.stream)) {
 		ret = uni_player_init(priv->pdev, uni);
 		stream = &dai->playback;
 	} else {
-- 
2.43.0


