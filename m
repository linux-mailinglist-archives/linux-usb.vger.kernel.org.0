Return-Path: <linux-usb+bounces-13047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B833947264
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E25FB22294
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1766120B33;
	Mon,  5 Aug 2024 00:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i4BWZmXY"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1497B1E50B
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818612; cv=fail; b=Cs3hF4tXc0uvfs/ICuOv6kvmxj5RkUIqPf57Cci/ml6RVbLtZQCv+jg4mxB/owfwuHeZvigCkh9vMyHdCuaV/cKfrAvmOd51lyBu3NGlXS9sit8H4cnzw/JTggel/3UlnXLRHvlgT0Tdg29FOxjzxFQsjnTLDESOwTMnrQwDVfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818612; c=relaxed/simple;
	bh=l8qHpHZZADoUcEytZNYmt5/+OFa7kk2ZOXL8PNdJ0GI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EXf+uo3yjNz/TeuXSOib4A7R6lcye3Drgq68GdRS7Gkyqa1W/J2r1QeuzmKCGmQ1g4mZvyf8+jB7Wsnbg3QhwsRPdFH1JtZTxdGlggL3T5unjsNoTgWLv3aZLkDCtv9Hmv3Elwp1ZyyDX8YdYkRQ/3T4C3vLc8zJcc09eyJr6UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i4BWZmXY; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYBBXeIru/S0V17yB1vo86p6Fdo6Tx/z6b80c9HM2hPGiu5VyBB6i+6qOdb+wWq3ar4roUeEQPXzf9nJphsyXGUxKZ4weg6Q7p0qWxhEXhY3Hb3ZNE0sGvZc+z4Hm6pR21aLTexr5HlE6PmLM70zRYjIb3kVaZ23gr0J5aGVWZ8aRcAIcPm4AdUXwxzeuuVaZupLDB7UAQJOl4OeG09lXxpkkp4+I2vCnbJ8j3sip871cvKRgL19zRSzOoUZ2oDuVis9UP9XTV/ozM41yP+JZ6qCxgV+td+GmuJUaNuEPZR0wuxo7DqLtshLVVj81PoP8UmoJlSZF99ZTl4eQMCfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEz+SzyudQyb/ome52xcHQ5XTuQ/qDYNh1fuuU5uy9Y=;
 b=K2eRwfo23nzK5gv7X0PWRroWXaftU6jMyAulzUxiwwjJ9R7aRZKbN98jkGNiMIEEtYjSXy6IMGafa3/VGkVyZqm+JqlLJ7pBxMEzh095I7oVFN7Vv/5aB/4yG5o/tgEWwqcZ6VGYQbTe98MouONBiHnWGF0K/TCAyJKW/YFdyyyR01V0GFrpvKtuo2xUOzprLRUAsUrpk5MsNGC7X/ZQdtcA4RxGADLGusSAhXb0P1ijtFSdxKbrmSw8MmpS56d3oimJgAcYzKrDvHPWJ+wpHUA5xfvqQifKCcCcFSYr4lzynW5I1oQgVeTQMOK3wGR7+N8K1P7w0KDz2AIis/V36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEz+SzyudQyb/ome52xcHQ5XTuQ/qDYNh1fuuU5uy9Y=;
 b=i4BWZmXYRTdf2mm4Fi+7KIP4zEg7VGDCmLyL9bXAPr04FiHT0/Pz8GlWEw0bifHA4dAg+7vbb+w3IailSC1z5LAeMeyKSdlegv6SGuPzSf9fPCYkd4a31f4LIc9uRv9pXT527ykLtcUpLEh+yIQk2OKd3JQIy5tJKgMc0o5EzBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:28 +0000
Message-ID: <878qxbx0i7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 097/113] ASoC: codecs: sgtl5000: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:28 +0000
X-ClientProxiedBy: TYCPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:3::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c1088e-b222-406c-a11e-08dcb4e79f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eMSWDqtIUsgzTg+bGVSuRffUO7gtyMErzZkDh+3qRntcpt335cvbZlEw1s1v?=
 =?us-ascii?Q?vPPGFBOAoWM86TcfPUJHmY9MKQ2EdidbjShYHu2TI15+6mXGDtMobl1hTlin?=
 =?us-ascii?Q?nHjRbDEi9pjPw6Mjzo6ntSfdv0y1gqHejGUOda2ivFX9S8zk1C4fsPq9+0PE?=
 =?us-ascii?Q?9cpYCUTjyHHjWINkKZ4tDhEpaRfjM4Q1SRzIwshIGgDkTflZFK4UcJAayJ4+?=
 =?us-ascii?Q?U6zAjBsx74vkEgtc7hkI3Z3Ds0Dc9+70TY0YfDzbLxALDaMkWGNkUGy0yUHe?=
 =?us-ascii?Q?mXAcLoCy6v4VJH7qooJip9WB5+50XLzo/MHqz3gb94XdSwmuUDrAcj5hI40b?=
 =?us-ascii?Q?SerNsn+dZs2G0PGMYJDz6RxG56Nxj9sWvRO+Q9KhgIuMBJnq0RUUvgA9fRZQ?=
 =?us-ascii?Q?Q1zbP9vSUr1oNQV0oZFU2RQwJxw6K7+vr8ze7545HZhwIv+Ikev3NtLufS+c?=
 =?us-ascii?Q?JbHbyvyZVpZjH4NHy+p1k58nOxzb85ad32Bpy5yYiKsbhVyUlkqZAjTBiwmw?=
 =?us-ascii?Q?1jI5LMMIh95Bt/B6Snnlnirx4VPbFWvZXgP4aB3HZ5s5HorhhDSYX3JkO8/0?=
 =?us-ascii?Q?19r3vai1dAPuE7t1aX1ncgfLktTgWA1Cf7IZ7qwLZevCOUnf57HCGp8LmRWq?=
 =?us-ascii?Q?BHYi8Od9rsqfWwfhbJWsuQ0s+3vfE7oyE8RClSdC4iYMBba/jmoOucUpS2Hd?=
 =?us-ascii?Q?EJTvQi8B5hgUTaqRpU8Tx8w8ZSXAd+nt9dHrTYj5TsIwUzndOIgDEek7EQQN?=
 =?us-ascii?Q?Zf4OqkMjCkKGUUDoQEcM+gljcD2eWOKeNfh3p/7o60HJooXqq7R0eYZYFSIO?=
 =?us-ascii?Q?Pf0IrfTVX7JZ3rOAciY/msrcckSV4xRHHQf++NzKPJ+3pgU4vmue86bi5ko9?=
 =?us-ascii?Q?Zppj8tzCfNoQ/Zxancow2mArGWDt/vpmqNI5B6dTC98WE94WPLoOHvnLiqiQ?=
 =?us-ascii?Q?F+q4/OGSZVjjD8yTm5l5Mml4xeIjCVvs9ncAQ993paoU/sPeFjYzaZj9uuur?=
 =?us-ascii?Q?49VL1rWYn3mSHelOZr40OIuTNXK1WO9MOLG/DWJBipmh+1sZQyo4MEH5CR5v?=
 =?us-ascii?Q?p9JP43U6XFcKQ4dsD+kh1ycOJkmaky98tPuyd1cpC/ED1ZIZDS5jOO4qsYEp?=
 =?us-ascii?Q?PTcxhF0vAGpTKDEy8covSd92XOU85/wXn/RX1CnObVAWN8OSV1s8IliDcBqV?=
 =?us-ascii?Q?ZPIgsOXr+hGhKy1w7eRWmk8HJLbihIwLHLGcsFAs1QjBnlQWzw+zi6QllzkF?=
 =?us-ascii?Q?r5tpPxE+QU9IfYuwGLF+gWZTZe5z8SH7xcP4F3JBFA7JWOFTJ+XH7fD9Q202?=
 =?us-ascii?Q?zLOGd+guoqcSC/uA1sFX5J+Rh3POcpuLfDIzJrhTccbtAPsWXLBeljx+y9O9?=
 =?us-ascii?Q?7CMBJtKajiIArcNS5dtB/F4BuX4TAptagUymj8wEKASKSqXTRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rFdOQLpTTyoEDaAoeCgTS28VDp7AtwMIzym0RFq7YNz4Xyc/IdgpnwYLAQAI?=
 =?us-ascii?Q?qQXvezqQvTsuxNWntaiwWAUXlb+P8jWLciabGCf97PXslEULds1FMaFcVgiC?=
 =?us-ascii?Q?qISNaaNhGczUGsgq62E/Jia93NFV2fcdzgcQ8MrIblr8cUxwQiyn2IPG1N6j?=
 =?us-ascii?Q?/CYDUhwd73TVuiQ45YU7kvF6G3d7VUI6JUgJUtZUqyv4nHjdiypP+K2BA4dn?=
 =?us-ascii?Q?InIUfBvMRS5Y1tTWIonA7tFnMHu3NGlVLUPRwT6d9E2EmGhSHw2QUfLSE31M?=
 =?us-ascii?Q?MLCwijfTIfkN+sH4xZTIYeLxJLFkiPhBS1P6Y89QKwb4/Osdg/k0mD5MFpRv?=
 =?us-ascii?Q?S3kDosxG+u+hA6kiEOx2s90hDHKz+uupl+l23q4oCcWN8G11xHq7xr+7vFwo?=
 =?us-ascii?Q?u8OWiqok0KKyIgwtdT0VuJpGWCSNv4fnOjMyfLU92KdVZn5rOAjdpMdeUZVH?=
 =?us-ascii?Q?FcUbFaBee+z346iUa/N+8OcDjOTpauqRkH/jbiazbGC2mD74o6Lqe/n49F3l?=
 =?us-ascii?Q?lA7CfQr0xX91l8JSg9iPylx4TZfj6+llRN0JYuTV9mfwmR+ca/HfVyHJTrWg?=
 =?us-ascii?Q?TTV3AnyBF5GvWIF3viAEmZTQopfULig4QUUjNW21dtFlwPRmTGBGnPFAwM6P?=
 =?us-ascii?Q?JHWU4Si279lKbjQoqufMG0fGleJom/2WN/x32YzFPP1cbLatHjlZEpfQNC64?=
 =?us-ascii?Q?EMUPS+k7huI0LhCdcrVMuURh8qY//aygxUStccFx6XZY4/ly25UsZABtT4Hd?=
 =?us-ascii?Q?m3n+qwcmysVYsviQ1P8/5qB/F1M5VKCfMuZwXPV/nSKebji8c7n64NIbxwvw?=
 =?us-ascii?Q?eUinZyXwqgLnIjOGTikFD7Ac338GXEBYjhDX7RDDZnL4F8am2SoegnH5Ve6+?=
 =?us-ascii?Q?paBqjRXLXVjVHyeYY6NLneCwVOkWAI/h0m5yKxG0NwSvbsfibZOGXDc1chjj?=
 =?us-ascii?Q?SOh3neewZFwG8zw1wUTqoaM1g+/HMSY79zSgV3gwmlleWQoUkfPUfjcxMRlS?=
 =?us-ascii?Q?eOWboLTn6ZsdpKaUUcnjibb9mE4EafczDcQEbZtDA7xEnbgJmSqr1jfaJVHa?=
 =?us-ascii?Q?O+eYh2RoAy4ConArLNRH07ti7lkEALNiab/XBoGSZTqn+Vu/aff6x6qdp8Jg?=
 =?us-ascii?Q?9NmyJ+e0WYcN0d1h/hcFeiU99+9g+4nsgFjZTcCqccvBk00q1P8MqVlnBOQV?=
 =?us-ascii?Q?EI06CUsk0rVzz+4EIIr0dW0dEgd/roFvm+YNdPA3RUdHguZo7Zwlec1LRiPo?=
 =?us-ascii?Q?w95nvk5aWWDjWJF3WXQEd8n56F3Z4DDDXZzxiXD6t5rSAu/6d5k0RyP7VrEr?=
 =?us-ascii?Q?CqLCPKImr4esbs6uQCPRenUVEBuDCHAeztfeg57EWLV6DV4wnwrwuSCIEuua?=
 =?us-ascii?Q?xZolFWVI5FG7GKEEm5XC1bAT0DlhkbYcWKOer98dFs/cTvyibBxaON4eehJe?=
 =?us-ascii?Q?N4RY8TCb09mI5B2FIaDxUTOR6FO9DD7MHyUKUEBdfgB2/WKXYzcgWaZuf2N7?=
 =?us-ascii?Q?ABUtr7cJSnMxsBuv5sqnw6V5BLG92JgPhgOW/P1d4FnoNKL+NYui2ga5yKj/?=
 =?us-ascii?Q?xbryj2ZcugeVLitj5X9GpAb8AaaltYIpVOCoVLWN0ys6R+IDkc4zis45BbNd?=
 =?us-ascii?Q?WmNjrzir8TBVVUtyPCoGDjg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c1088e-b222-406c-a11e-08dcb4e79f90
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:28.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKBzPTNC9id/BozzIVg0B1hFfhhdXCe5Caps0smO9s6MSStboukG4HffXl7oE7mSRaFzJjwhuxEnEqGYD2tpw0WOkMR5Pzxew+e2UIxrt0pZLJ8nQPHHaAsf6dtzO22a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sgtl5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 7aa89e34657ea..5b2544e05db7e 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1061,7 +1061,7 @@ static int sgtl5000_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EFAULT;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		stereo = SGTL5000_DAC_STEREO;
 	else
 		stereo = SGTL5000_ADC_STEREO;
-- 
2.43.0


