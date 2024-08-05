Return-Path: <linux-usb+bounces-13032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE9947252
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356B31F245A4
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AB91CD31;
	Mon,  5 Aug 2024 00:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OgzEbG5q"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B71BDD0
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818543; cv=fail; b=aT3XVG7Dexuv2y+zkJXJ41rRnuVVYH0SUTgUtVOcAauqElUCULMXPxFVTvFzaMd3zpzj3zrDl2kJxx73oSKUYGCwdgQfEEvwpZNzVl4eKsjML024mMx0+/41vmjRNuLfCLT+cwsKMga3B79IZZYbFTShkBBjvYQuDzsQVzxANf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818543; c=relaxed/simple;
	bh=sUbSlC4pHZ0eRcGv5SyBGJKHaXXcIaAFVvJDkgdORp0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fNR9lwdCJNu+8XnvsGb6o8lOCkT5irlPM4eSUQyU2XOF4kvLx0zWaxNRH5Mx8hkrAD68DUtHs0kyAQc/2eZsa+dkIRPRMEZgPUPRgnnw2DIXzcXAUn1PZak7K9KqUARZ+LniA1kEwIb4oPwtjwem58FyJHXZ/+NR6QJzuIYXnyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OgzEbG5q; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpID/ipf9jaFDFldrHS2Ee2cS0eTCpXzQsOpxelJFWkq1YvaSGTAAhbDa9V9xm02hA+I2vKdB8Ohr8M7iS//KwW0s+hIVpK5mYdrQ9XHDUlsH8yu5QpK+DHbmKg+mlwXAHf/cv07Mvf4l96es2SOWlQDw7ixLw45QvlvhghVv6fibZ2/6wPRS+ASgEMOeBvO2I20+jfrc/bNE9THli8MCLFU1VtbYBA/XX5cTZxW3oPnTRjpVr4oITjI+mOnO8dZUeCOepyaF6jN60VksGbTfFvaOlARxGp4v6DEam2MArGcU+qbQebletNMCnj8IQtezYNCoZ99HapA7eFjk8wF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9pYEbXBKX+zEsHuOMvJ/fveRF72+JbVt3093IImBGM=;
 b=fVdP9a3cR1woRXxkMiBt+xRsQrZl7QirUF35jeR2BWwfaYm7RxoUR5e65dvBFsAnCnTQzKkQLEzXB/Ifj4//XHJLKgm5GQ2etYsfbRpEzwbtC/+m76pUUU0Pc+lXzPo3iM+L6oVkvmRaQJfeKQV3Lay6fVduqNiH1WmZXXe/A7SS2See7LSRpAom3uery1YFU3LRWpHs9Yz4rYVlaKNOZW/fy0Wx6K3Rx+3C4K7LLHt+ioMWtBmqqtlblNlPNHowG1V+BkWm2IeKyCjyh8uwt2MpDHlBiVjzROqQya08xs9avXAYbfMBxS906H0vHffuputva3aUhVWip7dY5A1BBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9pYEbXBKX+zEsHuOMvJ/fveRF72+JbVt3093IImBGM=;
 b=OgzEbG5q8IB3V+/zBdwiMCald5p0WrgqMWHMvCxpbw4upy1YYP3OdBv7W8qnAz0d3ViydmxzWqTCrtX0CKVJ2Wedxf8Axq7yassFVuiC4VqV3NNcv7IHQc/JGKUMWisGfF+WFE2h4PcRjsZthoONOEbrJjIpc8RXOamG8zHvR6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:42:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:19 +0000
Message-ID: <87ttfzx0k6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 082/113] ASoC: codecs: sta529: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:17 +0000
X-ClientProxiedBy: TYAPR01CA0144.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c85843f-1481-4be2-714a-08dcb4e77533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k524mGlAo6u+5cPpMyn9HNRleZw7fhZZc7fI3Wc0QHC9k5SdbwtCd3z9zRO/?=
 =?us-ascii?Q?kzmiOqDrn7BUV5Torx+1OmcwbVqOmnip0BJOOOYmrSqvUqWuRYqvcilm6BdQ?=
 =?us-ascii?Q?rNeB0lNdOkNSmruqdy3eWf3pByNmO6hhM6xrnrV5GpNoe0UvTaU4bhIi6eUh?=
 =?us-ascii?Q?KE3ldR6hD80DmldzNdwkYlk8A7WOuFOiWzxdcXFdSstVicctJ6Fh4GtihR1S?=
 =?us-ascii?Q?vhvoey6VtbXjuKqu48Tf0dQ3rJ0cu/fA1oxJJQ8qwJLEGoZ0w9KVzF1f2+Pi?=
 =?us-ascii?Q?d3XvpMjzgwxNWe9f6b6i81D2b3dz5PlC8ao/0FrxQNDpSqguqOurmFD7jo6C?=
 =?us-ascii?Q?PAVnfkUalzPJpSiCrRa1pTLw+9ASNy6iuOr7ekoKoK9aQST2RvjEdnS/ywED?=
 =?us-ascii?Q?bwv0ZqeuTYXy7Qk7OIv0CA/PPG78BYIbl5ps7ZGrBTO5zlWzJYG7qweuqRT+?=
 =?us-ascii?Q?3yLswZknSwxjplrzHHBcglzBYAO5sGBtwQYCDpv7Whh2mqmqtuO3kw2d3BO2?=
 =?us-ascii?Q?KBJNkb3EsnbnE3B3tkfx3ylnR7lf768C/Su8kW28Kszxa4tQfyMi07zUdNvQ?=
 =?us-ascii?Q?Pi3nQpllzunnBRLpNvcpa29PY67UOSoN9NUWSLp3TvciCdk2/wNH9Epv3+OL?=
 =?us-ascii?Q?rb4sUwd5itha2mCFDgDzqKl4A3w4KBvXCTjrmLl1dxAMVHGP1wz7YissHC8h?=
 =?us-ascii?Q?dNpBuNGZkCxBnji/teMEp5JAf5LrnHP52LUbi+aFJpRNyQZRUHaVnkO77kwF?=
 =?us-ascii?Q?cer10aETKaQV3EfLP1OZ1GQ7EZkbIiUeeUV/piK2wB94wz/0QYQKdtlDIrXD?=
 =?us-ascii?Q?3GprAzKIsqHQ6D8dP0uONF99SmR6mjhPXjjnogaonUzib34e83QrSRjDgvqo?=
 =?us-ascii?Q?8oNeU88ifkBpAPPNdgiCbSKd2AXvA92AtVZoHrHONyjES3vTkyZS1bjZpoku?=
 =?us-ascii?Q?J/QN4xsGA/ETSuWS7lgvcxbSUonSBBZP/E9rzIMDaDZ/elWpa6xw87s/F5E4?=
 =?us-ascii?Q?AxUnzLa+DC19olGz6dd1vQBhYuGocoNMb4uQinvD3fh24V6KHJXWi5REwzX0?=
 =?us-ascii?Q?uD53ivCKxk8nN8PhUw5v2PXKaKLBcESvsL3EP2EWtGb7nF/Hn9ERVdd5kTNu?=
 =?us-ascii?Q?sBAEqP+LM+BZ0MxA7lb+/D6PD9pFz9YNzaOIxZRWmhm9vNsAAkBLymPXNjYQ?=
 =?us-ascii?Q?YLwFoZHdv9OF5lkUHAYQssDtmUfD6FNp0QJlV+EcyI+rzVzl+RpmRAjJPk24?=
 =?us-ascii?Q?PHPXPzeyxoD151LDqjjyBmbW3ic77Vl45NK/+I+GP0c076tIe/kzsXuYlzyf?=
 =?us-ascii?Q?KslsFjkwTDQr6bj6x+8DGm5btcuiyFTdYLtmmsGy8mK9Vnw6i0V9S1ukq+kK?=
 =?us-ascii?Q?kY5SkCvKTNWGoRDJrNT3Q8ZvLYKgKON8tNOAp/4cINVp9u86FA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZNOdN7p5jK2LKICA78TKqwC2HC9t6rxmjVWT+/RErEe8m/ofi/wo4NSVxfv?=
 =?us-ascii?Q?3QuO18pxJADK9S51RaNnut73lP7NLyXJ1er+38dyj9DdupMobA9kgw65ccQJ?=
 =?us-ascii?Q?dIvw4K2oGfZZ70qK7wIYO4JK+i847Uf8wTngpSF4Lvan9WwPFqf20Ksl3AS8?=
 =?us-ascii?Q?mY6hZtNFB0UlXS8L7M2lP9ZeD9BRQF1ig98bQ14iXSIBLQ7xxFuW2mb29RnG?=
 =?us-ascii?Q?+U+FqB/ah71xOP1X4qgjkbCAw7l2iGWXcWS8l/QU3anKbWCyvXcH+LHnSj0g?=
 =?us-ascii?Q?uyjJprFI97kZQqTDFIZlxx7bT4J1oZoTIjRMX4UXkQNVuJaTv+vwoRfF/o2C?=
 =?us-ascii?Q?SxcKJY3YntfXyykiCUGLMnrFZym4AIZuVCixKj4v8varX/A5Hj2OCPXYZsOy?=
 =?us-ascii?Q?Mgq5w8hgbg6AJTRjeKJDbxXKmODf0XMxi98MRpVVggryhn3K66dR7xDXiF7i?=
 =?us-ascii?Q?hgG+Dd9wGamsBQQvSjVG/yghkgKxz3cgTE4jqR8YhC4sUE80lb+Fl5SXlpcw?=
 =?us-ascii?Q?Z0BE3ouvDUkJ2bPAQ7s52Gjk3GmwUM7LP4AtiMU0Tt30SUSbkqioyoVk7ck1?=
 =?us-ascii?Q?FmgwLrUSToJvJpnVXJJeDY9Qa8iS8m+peoANTYHnKFyV1QDW9LBewYBW5vzf?=
 =?us-ascii?Q?JDxugj8PJtZYhBGY783hImV2ZCCh3qBAXDcjCOKlffs3YH1pYkrYK9hyiHYe?=
 =?us-ascii?Q?RTkFlHDEsMprnxBY+T/wr5g2tr2lO05DUq8PZl8+njBWwrgxfEhVA6gHpTwD?=
 =?us-ascii?Q?vCmj48VbS4QcYqJepJK6WcYdUjq9dhEBi7s+caM55k7j2A5FXZ+TKucZDUG+?=
 =?us-ascii?Q?mraBhXYNaOKTkCkDjN8NmRetLx/vM5l1a3Lh7rg/HQtqcJywympkoeFcWWNH?=
 =?us-ascii?Q?yJ7nGKVlAiRNLIeLRQCqZqAUelPxh9uSVlZGSuuLjAseopjT86ggT7pmqamq?=
 =?us-ascii?Q?K6wQuNLt/RdtA2yL/gv1uzbrFdp3WqwaxXA78E3Pr4I3CEsamwdCE5L8tpeS?=
 =?us-ascii?Q?dLieFR2nTV+z3gfR0vix1I98GK9R3rBtDY/mDh0k84xrVTwcFuNtoUfrCrmO?=
 =?us-ascii?Q?jaES8NYmUohVNk5PZmLFLxUWYd0INr5vAdpbeaDerXh3oTyGdMzfX9BqBtmb?=
 =?us-ascii?Q?tFk2p+F76fzugzLQkrdc17P7Cs/fiC2asY5x0K/Ftt/l/BLfOWcEIAOl3EgW?=
 =?us-ascii?Q?afLvIwwli+YiY84YosK57FOsUDboNV7mKFEZ2ZSc/4IkPRyL6sSydnW+c9Pe?=
 =?us-ascii?Q?f2CIO5yyGhpzH8cBH1DY9uZDH0HheTbgfJVUpdQYXc/UHPUK/lOFpQaOh0dq?=
 =?us-ascii?Q?QTnfGOH1BdM4aSiP8TVJRqNI80DZ4MYxAR/ngGwwn9PoW80pl8/OHZs8ZMYy?=
 =?us-ascii?Q?A7Dusw+SjI6Wf6WtPQ+c0SIBaX/DMjcwIU/BxK6mVmERmDJGV7cgxNAttQ0Y?=
 =?us-ascii?Q?1MDct9TWQ/w3Z5ekOLhuJJbvOkEQ3metMlqjEA/7K14QIzqpdVeIZfgFQpi4?=
 =?us-ascii?Q?6gRz9HC7GBmBbsrAQARuvbK+iJl9BY4XUndWyI1Ja9lrIMoVEXvKrDztXZLJ?=
 =?us-ascii?Q?ZVViIjITtowRC4I7+7nDELw92HSEyLK2eNFmcLkqKzzUPJ46Bl2LxOAAVDBH?=
 =?us-ascii?Q?CwYLbdOGTL99N2eKXFADrOk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c85843f-1481-4be2-714a-08dcb4e77533
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:18.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxtmeDGH9n3Q5j3c+wuxTxIdKDn41N4S0R1IT5vgdQtUAlazeunmVQB9fL0KJ8j31NNW9Wumklrh7TOmIgoSkfLzy1gxnifH23vvfC6TlYYn75EK+z+1b2hqyHjhzG+g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sta529.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index f7718491c8996..e750536b1f740 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -232,7 +232,7 @@ static int sta529_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		snd_soc_component_update_bits(component, STA529_S2PCFG1, PDATA_LEN_MSK,
 				pdata << 6);
 		snd_soc_component_update_bits(component, STA529_S2PCFG1, BCLK_TO_FS_MSK,
-- 
2.43.0


