Return-Path: <linux-usb+bounces-13051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA0D94726C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5B1FB225BD
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0112BCF7;
	Mon,  5 Aug 2024 00:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eaIqNgUE"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632232A1CA
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818629; cv=fail; b=j2vdd+HHJXQvVcLZjtnMn+J4IFnHAMaiqxVqtHe48YUy/j6cmfepyJl/Kyc2sP0CT3iXz33CrXNEpAKrp383c6po+qp9Jtug7TR5xGdBgkLjF3egozW3PNDtw8T0ysORjwKjoeEAuCHJdD66b+xuP2Ky3n37ZjUBNszevQfAIy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818629; c=relaxed/simple;
	bh=szmgBSGhQlEcjcU8SHLUDJKNSG2P+er0n19kqPKz26o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LKXW1x+SNyoNB8Qw3oIyUFq6es1jyjb2Sj4Ci8e/2fjqJpSVSETncUmmz3OhXeMXbrnpDBNwy52mRqWZWf9gHdz5NM+I1jDGsYr447Wjt8f+biB/1KIZ8MejnHZIGA2gKlK+kNTM79rNJiKy386naDqu2eNDf1IZPD54wIntH8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eaIqNgUE; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AgjC4YQSkMeGl75YbmnIcS6jB2YhedaOBqaIRbvuK6e8/WST7zJ8L9WybR7Gwrnjk8b7GMqfkNuqjveF+DxZPX3AAenvdcUzKB3E4qUAAur6Xw70XatI4Je60pxaLo31VdUuQgRGKhH+Gilm7qm1Rc2mrLpNXrIWmJiJPhHjJSXFYHH6bpO3z2a5+3/f29EDIa0sFbn6MndtQaWguHr3zYZ1VgvHCFD8m/Fv0MOHbnG9Op31rRrh2e00qxmil6naki5Xfw1ij0QmLmUfnPvR7YzyTlj+pizc/cYrRYGDo8e34ZqRh7M+C3jmBUOq5LaMaAqH1faq7yjXA5cNcEIcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16ZyGdmC8HrLXkROBXOl1XvVpGIkYLK28NuS3/QmPtE=;
 b=bTpTKqWUbapcbZ/N1ULcUhyuOyVIvtX28UDolH4nkjcQX3b+9aPxypYHGosXCOqZqLrIOZfAS9WvkNumYrCuPMSOt9ds9cmcOrDP4+zLG1UrxmxtiftCihf9RsPcYpDpFR+iJ5D76MGmN7N29CaUN9UeUcRFamre/lXamyS9dWlwVouXGH9ggPNkQ9FU4vFKSCU/gjL5xO4dNz2fJhXj3T/SuZOcn9SH4MbhRHvdnkD12UtQWEofDrtPpl0+QXT+DxR3soiLPJjQodsUJlZwy1I1o1CJG2z1fetIhhRfnWxH5Jh/XBOellR8WME/1lyMWuWvYf9sCVdiAcRglXDekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16ZyGdmC8HrLXkROBXOl1XvVpGIkYLK28NuS3/QmPtE=;
 b=eaIqNgUEn8mX7Y0DGvhbmcYs98lsrOxH9QOIQ7gq/a7h6YNhFLiUTYtSJwowsPx1tzOHNijrdrHxJ+1g3aXTImr8S8TPe3aodnnLp/OcqEVw2ZsssRRTSJJGPOQHkN0mnrFU5wDGTPRIymqgjoGUah90LzFat9Q1gRtS2EzcQ+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:45 +0000
Message-ID: <8734njx0hq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 101/113] ASoC: codecs: sdw-mockup: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:45 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcb9102-10ed-4a1e-ccff-08dcb4e7a99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9OI3tQg+xr9G+xEACbo3yKUrRSHpXpF4J/lf+pm5Wu9cCvXRHtpXX0+N+rJh?=
 =?us-ascii?Q?eGIJGmq9W5mvfU2Z82SJFtHfZLjSc/Jp6BGDZ2gY+sjidg1rdIw3e8ckep7Z?=
 =?us-ascii?Q?TzJEVkmmgPL0cQXOC9W0DFKx26SVgTnuy84wVY+TCerhs9vartR4H4rVrkCi?=
 =?us-ascii?Q?gGypV/9dOepfm2bL+MB+XtJe2X6bAeYd4XB62tOxVFjgsm86m4vDMK1XYaYO?=
 =?us-ascii?Q?s7ZhEabAYDqokn0/8g5+Kdr7VFm2POX1wmy7U6t2QtNsfyvxV6szGqe/ZGvO?=
 =?us-ascii?Q?GwPkEMx3uq9ihNBNSWz4KUsJaFuUigDimSYv6rh1rDrte4F0IdNhfG2qgIu8?=
 =?us-ascii?Q?wmyF2PySwsM5FJyCBI3T5uN4fQtbKZlpuRb1jKkFfReW9wmwW3j5pSL608AS?=
 =?us-ascii?Q?zmYLe3VeFlptskLRSFvsnlAsQCDClcLFkvSXgS/1foKyyDkbCLcvMeUban3z?=
 =?us-ascii?Q?EKsqZSQhUXbTejUrQmXTpuGwghmreP1702vo3O4/t7/wRI0WIlHwwY1Sp5wf?=
 =?us-ascii?Q?2hXQ5TRiKy9IG+NfAoDqm8/Wx9qwFjsHBSfY3Lm29fF/mOZfPQlg40JexNJL?=
 =?us-ascii?Q?LN2+4Ltc5oizwDnVE5yF04rljJZ0HdbMeADrA0NA+eIti7nh7n0BS+otnjxT?=
 =?us-ascii?Q?YLWH9HzyZIZ9epdvG2N4T01ZNNKIq1N2DVQdnUUw8lOmGMBM9FrS8M+xmlZP?=
 =?us-ascii?Q?ImmEnAojAUFdu65Ei3oJEQ2ieTK28xXstbaDiemfo6gauEueCjWikKqlLvU2?=
 =?us-ascii?Q?ERqDJk/bc4Mi88eBi4Tygr6V6E67WcKSUGjlSpOf6Ehv2LCnpDYiwnauPxgs?=
 =?us-ascii?Q?4CnNrc398M4T7GIHDqnmclVA/c5H5YjLW9/XxItkp59X4U0ftHNLHOLctAkc?=
 =?us-ascii?Q?THTGOmojruFhcFalSWyLEUS/m1WEVuvSb7Sf982U2je5JTdt0iMsgqzbLOPf?=
 =?us-ascii?Q?S9SSfsqQgllwdfa4NqWauQvmLRoY8EFB+9PpSkr7X7QvDORFBjT/rK90cuf2?=
 =?us-ascii?Q?qarA3BJnYko1CB62Z0pUSDZ4Nr4ww5p9s5YkzaY52ozQmIXM5PecmHOhIHn6?=
 =?us-ascii?Q?wehQIE6FDfTlDizHQsrfLBkB3KDJW/KpjBxdkwFKJAiUjz4RY6XgBnpqiayG?=
 =?us-ascii?Q?eDktM7g3qI5WhhRCIYSqTX9jbPjaYQAAXKCzSQltURwo64kIlwHNrU1RgLKX?=
 =?us-ascii?Q?HjflQjN3ibwSI+PygJ0mVhHfkrqu1tHd32LMy0HaRFD7UsPotlfJPEi47eG+?=
 =?us-ascii?Q?s5fQQxqa7O1wfBhraPNQPRlM71xingJRBRDn6G0YxZgoZCfK67X+acQKPSpv?=
 =?us-ascii?Q?LgJxgVYIYyEaQVntskRiF0Tc8wq0caZ3oy4NVhsVjRkDtQE/lt40b7js3dav?=
 =?us-ascii?Q?rABn4OF6tjfqmIlH486Y2xC99ObwtkuFEuqad9p/tUxWyD4Uuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N4rz3ndQODyFl302cvPNLPaJ965YU0Mn+I69bzI+jesa0Ul9zaIVLq3Sks0I?=
 =?us-ascii?Q?u+r5ghmGSeKsUaSH3FNfqQS4I3Ct+3NqZA6+VG3k1NUr7D7UQNZNNb6JDBBq?=
 =?us-ascii?Q?kB4ZG3YAvBqAd+50Lzqj4lE7K+w++AwfnMZQ46d+CpWCs1qYvhkyGknqLxnU?=
 =?us-ascii?Q?aBS1mbHeS8VLbIs9LLs8lPjGCERWMcz4OLx0ZL4hLUOG2xh5o1wVM5sU82Jv?=
 =?us-ascii?Q?XZPYWM8PpkxDwegDLUPdQCQbx1dRr0BS87EycmGQax/Wr8rFoeJUr8Fyj49k?=
 =?us-ascii?Q?QzWo1pCeDV+w8x1fyUEvZHQLDDisOlYgxjzX6lY5cD+Ei+4mvg7K33EyaUT8?=
 =?us-ascii?Q?FM+fCpB64II1A+8Hu3WrkBg8FmgnD3YK/3qDVmdnXGogXlaGipfWBwm3JKJy?=
 =?us-ascii?Q?TZETvAUmV/kRYPrs40w1kOMeMjMpzmH+/WgEWtnpFrXbtCAbsS1S7KmG5W7P?=
 =?us-ascii?Q?lTOI2hCu72Pt5dCNXzBbdGOMPYA5abtAxw1Vz9SNSn/03NeE9w3lTdxLfTuu?=
 =?us-ascii?Q?7DbvKmXpqAuKVF2qC0rfD0Qgn3CT1wC0HWdif8UdiCPBYuqoPNy9SdMHpKof?=
 =?us-ascii?Q?GiiY0Am5UmZbf4yrKYCndXlOlBe4jInb5KMQNSOSRqXYvEAD9PPPqtmrwokM?=
 =?us-ascii?Q?6mubb1P+LN5bh90+Xae4S6+miopbGW3pnITuuzCaiim9u1wP92ERCktAanQ5?=
 =?us-ascii?Q?cFlM8a7Z7SrLVMzCSokiyFMli/EISOy8D2ZiamRi74hnBLjtgFsAiM4ELv/7?=
 =?us-ascii?Q?RyeWcwEk0cIvqIWdlPMxuN++ciII0/79WAKQ+uEPIglO+xV2ySZ5f5wNzbDp?=
 =?us-ascii?Q?sPpHqNFD5f9COEjerIwr2nelS9FlctM55PWVCPt732C29cal/tR3CWel6x7I?=
 =?us-ascii?Q?xFAhuhWg6sP0EiqlotKgpZsMppVJ26AEVTfhUp8/eloTh4twGSEo0GGk7aZQ?=
 =?us-ascii?Q?yG2QYqZTw5/IzPeseeS+rtYYo/HNsvrQISj+WDtA2Y4tgMedUm/c9bPhXWZB?=
 =?us-ascii?Q?McfTVMnoSt1vrHjmuAOjkDZ+cIVPKizjiyt0KAxc5LhT8Mu26JIEd9DiTLNH?=
 =?us-ascii?Q?wu3J2m8AEbHEmXtX9I9hTj3j7vvqS3scCA4schtThawvT2aTlh4pU54pC7Hi?=
 =?us-ascii?Q?RlHn9cpl3exKSVAaIedOBYqcDTFvGHwga2npdwG4d+yIUSrE+6fD5pHKGCZw?=
 =?us-ascii?Q?O7BofxdMDZrtJ1NvVYNtsSTK43VcI99145u08Hi1l16lTB3yxfqA+7Y0QuEV?=
 =?us-ascii?Q?CfdE0ie/1nqbmOb2oehiE5C/7rIVAbXtm6pDDea3e3pJj3ghfcaxQvX3BQNi?=
 =?us-ascii?Q?tVbsWQ3RTSv7AU1fdgZ/WBFQPAAmmXHJbK7BjTImi9kJH12sWlh72AkZuHtJ?=
 =?us-ascii?Q?qB3gO0cxXDXlacsAEIXwL04l7U0pUBuaMy8EnItY7dRTb7DvE0EmAVQRwJ4s?=
 =?us-ascii?Q?qZF/ZYYjVSP4E8BXVwKe37zvcL3RvL1zDyQSeSCfOQfztFRcn2tD4G5p8Kwc?=
 =?us-ascii?Q?YBNaubg2nupJqbW4z+Y+rVmnEPJch7G0SLuEy+/q3W7jRwBQjNvMbsocqgDV?=
 =?us-ascii?Q?8cWVPerbHNCCG1fVK8hhrd2nb7qsQIQhq73vbKZjIx+yE8iLaz/oZhE1e2IL?=
 =?us-ascii?Q?MnzT5n0uJ73Y1KfKSCNw6SQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcb9102-10ed-4a1e-ccff-08dcb4e7a99b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:45.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUSafytZ1q8/nmZU6jykESVtfzgaDMe5zooqpmKabQ892+7vWNAyJxH0/bkz39Hn2p1YjHLlRxvvbUQl972Q1v66OWQNotRmfZmaxQTbM0ZPdlhx0urG7cmFA2yXZRYf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sdw-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index 574c08b14f0c2..24fabd392d00b 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -72,7 +72,7 @@ static int sdw_mockup_pcm_hw_params(struct snd_pcm_substream *substream,
 	/* SoundWire specific configuration */
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_config.num = 1;
 	else
 		port_config.num = 8;
-- 
2.43.0


