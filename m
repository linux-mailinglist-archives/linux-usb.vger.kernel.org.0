Return-Path: <linux-usb+bounces-13041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994494725D
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE5D1F24A41
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4616222625;
	Mon,  5 Aug 2024 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mvpqpAKd"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE71E529
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818583; cv=fail; b=P1EbWr3zTsVTsZ5kT+CGodUAS0Udx0fqhqPIrDiU1EnkSuy77L/KsVjameqDCYZp/4bCit+1hfAOvDLpdENRsVoADCwWLOqEThKbfjJYDd0x+VCXPnFuDJqOkPwd301DU+ULIXCr8BaGKs0pRDnNKTAFbUhIW/pHORjoJgfqcdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818583; c=relaxed/simple;
	bh=XG+mauert9qR1cl6Lexl4P0vpEAtkno0k3vkaY97nWQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PHyaVga9lmlyQu6VE7xpC7m9VYT+ezDgMl9DETtucTtXTq1VDFJng6fuK8dePXvjImrYSE1r5iZ5jOWiPbhkwTOPAYe2kqEyZ4f8RAp4EXatWNI3DSqvIgeW+02vJrRe1uNk8VX0B2/fxFQjfkkFsHe0+auvGHNHL7wLm5dQiz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mvpqpAKd; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSEm+FwvQBc6FmSwliW9fHc2bG9Fl8RDNLwFbe8sdSuCIKXTD+sdrwuzQjcvPxB/BTU181leBCg88rFhwrhCkbdbXD3hOsDzZfe7Dv+vdlkEj+IpyL4tV3ray6z+jSNFuILcex5pGU+P7Id22j0TKCCylBwlIYDDiFblcKXLXAfXuJXow2eMYKG90X417D7vdbgfvBxA0/ljlvL9h5EIuI45Dlq+DIiDNvnBO+soX8/Tp9beAoJbHRxEqMA7q3uWLFCQbfLCbpUbZyhzW0qJz9tVGW00HtIu7NtW/Onoe4lZ4WAQzSvjOoo6gmX3lzfJATWOCoBG/nsZCQ4uqKYoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSWCqUqwVb+Pyr6/igVvjr8UZy1QKXLV5RPw07whWx0=;
 b=WtfJVvNUwdzvHpE9KIPUUoOLsKb+Tr7/9Y3q0Fjq21SZ42C0JcwZgXHaRT1nxU4CK25IvUsiGyqkoQk6JBSCsUqiHR1HfRnN2euOhDBV+8YbBnZN9Brc6uoAZoHHggRfLUvg+x51yDvY2NVIEtGRD8DJwXlv7A5qz1EjMBF+Tj3k2w8IFTWstQcCtHXQxilAdVcRYRM7TzV1It+/r5qaUcmgqPMqYr9i+QKFM9VfPO1Y5qqVcmDH99XbmJ+VBYSdjlmnmDTwAUuKjhYh9uoAWaxk6v/JRWgaXWvzpkPOUhhc7BbSrTwOurYZQjEsdFnSze5q0mED5tbhnKeKHrtXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSWCqUqwVb+Pyr6/igVvjr8UZy1QKXLV5RPw07whWx0=;
 b=mvpqpAKdp0ypl+XDQ8Rx3HkO1gaWtWQKCAoPGlcOcJUhQVSkhRRFfgdXmrWY1YKUD49sfWNqV+4lJ//E2r54j1q6Ni58vMJpeGIiFLqKbOXapNxPi4IWbL+lbZH4TNY2BuIymJTWQ7SKIf/fK9/QELomKyhFdj3WrALwtkWDYBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:00 +0000
Message-ID: <87h6bzx0j0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 091/113] ASoC: codecs: uda1380: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:00 +0000
X-ClientProxiedBy: TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 28218baa-df38-43c4-14fb-08dcb4e78e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vC5XClmp60OCZaun0emTmCBs+QZBKieG6+gZKBaxg0vpcPyhBQTZxsO1R3Ap?=
 =?us-ascii?Q?ASFqb24p42sodvwvLMNdEKKhWIAcwpVRcRO46qYhf7iJJii+mruTNyOVHMGx?=
 =?us-ascii?Q?hsLiRO1K7MZUeL0CQbO1U6vjPr4oNiwmzaunKcLlCKEN8Ep5LR1Y0VgeR5Oq?=
 =?us-ascii?Q?MJdX5X0Q0GgOplQaZNLbEFMN70VDcVgyyBd1HQng4r8OyHZ+moEkQK9lpN3/?=
 =?us-ascii?Q?VT00CUIzFNnykIlpsUe9qos5azhrz9vBbYoQVQl8Crnm+UqZ35m3XsLmgqzV?=
 =?us-ascii?Q?rZct6UJPasww65xXFXxuHtpsjQ2EOYUZz5sRTnZIJQLZBo0g3o/wDMSfiiBs?=
 =?us-ascii?Q?mfFqKSsmJrsqGR9hCeiZWN7mR+YOegimYmCn0TKzQ9OjsbvmClrCpkMDYL+F?=
 =?us-ascii?Q?l9BR9Hn2SUj88FffpOv8NueOYhSmB4QJR+sJRJj7yUUmpeZep6V9V33c0NOr?=
 =?us-ascii?Q?uCKsycNuqVz9VeMhSwSQ3SU5HEkCai6zcPDA1N4Vyk8g7O5vVKqVXvhW1h3p?=
 =?us-ascii?Q?5JutZsi3a56SksZICn1vjaag8jefCB9H6yvlLuJkADqjjPgBryatA97bcBRW?=
 =?us-ascii?Q?lS33uSAgZ+kwSR6DGPprKmGSvPThIOEC5odoSzEmf1gC8X+OJq6AYuLma6q7?=
 =?us-ascii?Q?Otb+zy6FU0hlWWhTK6Dm6uNd/RdRi4AaspJr++sRrobqhhAvZWLvMJVOcc0G?=
 =?us-ascii?Q?osJC6ImixNKVJmcBsCNw/DccUNsCvshieGAAJi8oqmpzr7kT3B7d3kHGCrI+?=
 =?us-ascii?Q?a3BR+FzYVF5ALoNdfETovl2WflT5Sm77O0nvDAu0tLTIYBgwe0aE+Ww2Jnzy?=
 =?us-ascii?Q?n+HaC9TzG6YNq2lIoc8/uuiVVUKRiVgWz33M4/uIjeF7185Sy1nqjWmXl2jS?=
 =?us-ascii?Q?fJGeD5O9yZuRjcz9uSfz/GsAuXM6KAXIakW4mwrBVHOVU7Mf47XyuXcZBnHq?=
 =?us-ascii?Q?mNxNCSgY4TuJS1/ZMKtAyml5WXKFt+smWRjrlY2eHnuRssEJvpfbcfcDphm/?=
 =?us-ascii?Q?DjBNSZxEj/092OV3YL+E5xxkWXS4z5H0mm99LvS5xUPNUPrNyLn0V3rVBBnL?=
 =?us-ascii?Q?IXaUd7M4ai+EZEqKQOlSBHNE2M6WDgGOphFQ7OLpAsxqzQUTQTyC7ZgIWlq+?=
 =?us-ascii?Q?w6aC0KmMEc4E17xZl1QQHlp89qPCDJy3LI57zgmlZVsg3ggSpJ8WGwP4trN9?=
 =?us-ascii?Q?ulshBJHn4oshMMPgOFhGtvE9g3uveeqbguQwz324KI9VpKsN84BmHq6qe/Xq?=
 =?us-ascii?Q?zE5fkrjsjHLfX6dx5zRtuUP/W8FqP1fNik4UHu6mkbKf3OVV4rLQJ0p63XEo?=
 =?us-ascii?Q?F6I3j6hhK7LpkAUnyN4WEGbpZfMB5UpelYCF0nBRare/X2bmWgG9J5KpUGia?=
 =?us-ascii?Q?h5iZ/6beFI7esamhCZvYt2Eawq1YfH0yV4Rq9cKnpX3gtJ1H8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DXdHacWt+rNWIvlVDjdWBRA49/loYEul3F4luPDofnJN6a25RVNY2Sr4EGpA?=
 =?us-ascii?Q?S6jC65wCyUXx3fkv9eWahl40EM11XQgV/sLPKohqaZfx77iEwfDIRQp6XbiC?=
 =?us-ascii?Q?EPLcJnhj+53mXZ53B7iarYobkjqfUAz9J5MUSqCwZu5zdi/3yft2KK16Lluc?=
 =?us-ascii?Q?mrab4TVMm+TaUttPOtjGec696x4O7BaEUDZM6Mttxhf2ILDZg0BUNcPJ0rrX?=
 =?us-ascii?Q?iWWXGR6IAGN3csQRff5AKShnw9wb/vfs40n2E7qifMsCunNt7uHVfNjI297R?=
 =?us-ascii?Q?Gp7gh22iDlRCstgbV3WBWPSJRk7SsUA8zd34EZGM57ZBa8lfCfL/oUbj35LE?=
 =?us-ascii?Q?qu1O4tL+TS8KsSruFGsLONrZYzms3Eg9i1unBb4X+96hAidRUUL/TtQfy/Pw?=
 =?us-ascii?Q?Gi/NuOtGMxGOvIeY5cAjU1NFJAj/ogPRd2j6iVgwF7/fzA9s4OJrHQnSnnms?=
 =?us-ascii?Q?b9mvnEcxquOCZ8YfQWqNEK5kexoJSCP+vO1vwmDpH5ZHZIlfPMem9Dlr4KFZ?=
 =?us-ascii?Q?Wi1b+APsyKHM0F0h9EQJn/QHvEUatnUL/x5fHxQrIngK6U+COXlJhaYNlcth?=
 =?us-ascii?Q?wogN95bZHtolpYvDaoa3cTAROEoJXW7rXwVROW3Oy29L7u1J6waz1I1KVd06?=
 =?us-ascii?Q?tvIDcKjAyiSrYsaY7rfPNS/ZurinuBYwT0jG7VctNmCzEDSoAEVwEj53yBFK?=
 =?us-ascii?Q?bzjmgKjqYGijPnDVPptmITnFkp39rqsjChua/wmJNTbfXwuDYbh9ZuLWueI2?=
 =?us-ascii?Q?rLxxx0etI+uI8ABW32yNMZMcHr9iTVUcT/bfHX15c+PkACjFfldzqFFlzug4?=
 =?us-ascii?Q?XKMIVE6LgQ72EmPlGL8PQAbypUfKrK0HsA19WNfOMtF/A41XPLPKJqh2VdXJ?=
 =?us-ascii?Q?L/ivkArHiV+MOJneXTYjEcSNeDptI/Fhx7QQgT8fULDi2zMxKw4zGFRA8Vsh?=
 =?us-ascii?Q?hqnwCfz6nDlhsXCt7HXpAuiPTwxAuhWSaBTORSOtRHgBG1xEz51tLBJYpTIn?=
 =?us-ascii?Q?uYcVpSBWcvR1ivFVP6M2LuzjAwc+QM8N0nRozFfZrqYv9Ay4evT2GjTmebc6?=
 =?us-ascii?Q?oOHq2u5F8CiSybt8/DO0xzA+gCimFxGH0ot8gPLaGe7P49tA81i6UJDN6HPV?=
 =?us-ascii?Q?980aPvMEVDSwJgmUFZHpz9VTUSye49QYWibFpCZBnxUX4yiSrJm1ayf9rMjq?=
 =?us-ascii?Q?Y9R67lLmkRNmWRtJwC48HUTxTeuQcE6UCZUtfwb8h+3LAjRYF2KdAYb1kLHV?=
 =?us-ascii?Q?xB5gcc++8gwxVQXYDuLZhqYE/IHkcqWONBu+VWuRKQQKlGRkGS4zNYrms2x0?=
 =?us-ascii?Q?+ivXCb2FPn7T5/37su688IqMUZlyYvLE+HSvdtYnSSWrB4h+wHHRMMr9U0Zj?=
 =?us-ascii?Q?KZUXb7074P/uXpUrcNQHgGK4l+Hz4j9ICg4RCxYMskYl6amoudMcF+Jz3s58?=
 =?us-ascii?Q?MrscGS7+KsSjYhqF8DyWi68yX6cOs2ZrfX1rFxM4HyRBGkGDMNoRaIvD1aR1?=
 =?us-ascii?Q?tJMH+DCXoFe7K4JuP1vf+pmmIkH0QP2uFJigHMnXn9AxzqjUO5/d5U71DMce?=
 =?us-ascii?Q?Gu9YK6vz27uYV6Cgf1lHe3ADwBCFamUOsnL3ug1ACEYcGFmilJYRMqGVbvKD?=
 =?us-ascii?Q?7v8YJ8FL5fXNVuLQDOcNnPY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28218baa-df38-43c4-14fb-08dcb4e78e7f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:00.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15xLIL0tpBBKaAaYByR+7+sq0bQCLrwTxHyi90GdI2DbzTA4C3LwscXJ1DsXe/gMeyXcU+eCudlLtERjX19sHXFbnjVjNP2dt3Mqtd/51Q9IbWMaHrHE6PaxbEhIrjcE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/uda1380.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 4f8fdd574585b..7ef7b5fc927f2 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -556,7 +556,7 @@ static int uda1380_pcm_hw_params(struct snd_pcm_substream *substream,
 		uda1380_write(component, UDA1380_PM, R02_PON_PLL | pm);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		clk |= R00_EN_DAC | R00_EN_INT;
 	else
 		clk |= R00_EN_ADC | R00_EN_DEC;
@@ -577,7 +577,7 @@ static void uda1380_pcm_shutdown(struct snd_pcm_substream *substream,
 		uda1380_write(component, UDA1380_PM, ~R02_PON_PLL & pm);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		clk &= ~(R00_EN_DAC | R00_EN_INT);
 	else
 		clk &= ~(R00_EN_ADC | R00_EN_DEC);
-- 
2.43.0


