Return-Path: <linux-usb+bounces-13042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D82694725E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0BB51F24A94
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9501A1E50B;
	Mon,  5 Aug 2024 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GN2UVmMt"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F691B974
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818588; cv=fail; b=H/wvub+hYJWLuIqCGBYrRC+gT3AhQxptyFxguyUlYaOycbJCr1Ea4WktifdOFyqeM6uHvkwY+a9OoJNxCRKkqTORZtD1TtdIN4E7ZO/swwvZ8HZN9jRKSeD/sJsp5gyOIl+EDlFoOBc/oBZfWIc9vj14y+oKJf/mPWJA5W/Jo1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818588; c=relaxed/simple;
	bh=/9LcLBmHtWn7j2ve678PWR2asGaCetqzDCwbgl2TwFc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hYfKgwPQjGvmrpBHh7focdNsklrm00erSr7L7a47m2vIIuuP0/1sq0x629OVPBoGw824LY3aG6CkZrrJXraxp3b3CP8RCCF/ybw/3T89TffLrbVFk/Y1/wYknup3GNEWiN2uvub5DxAlSWZRpbBSmn/SGlSWHnZdfRDo6wtfLoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GN2UVmMt; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylgb/UgSKD/wtmT8ZQQs1+bw+nBgl4GVs0GdGbRTMIVGEkWm7izWAUK4lDjvzKIcLoli4i8OZu/CsyoW66XWNdaVtGFn5ToYvEx9b3XrIBYddIE+WdDOI2ziwhss4y2B+rA+a3Az08I2QX49AQ3RSEOx5wvkSSxC8ZSlEnVmMtiqndBhh1vGhp0GKSnnD1YYF8UzaNy1KQ95fBjvU4uzwWOciyQ0pfsdJ9PxWglBOGxXQ6l4f0kJTWFFni6wgO1BK1c5Jk455jVobHA6Oyq2fhrWWAtP3yI4fo63N6EmTruLZ1JXee6oC1bMmhzmcXyKdVhB7FNNy82vx00USkJbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKWGReVMNves31USvccMyKWFks/GhepFZiGPLmgy/Jw=;
 b=e7ku2sVOrgpwP/g9YcFV3PsVoibAw2UjoVaLKtnZZ8Ntl0lxLdX1pzJGGFWAlWJ6oWB0oz4DI2r3jGAZ4Mwcpstwd5pUf+450NMF8A4en65ZBKYE78QSiG0yNgc2OrVdp93Gtxh4oqPf8EVcmbDSvEfEHwtlqW3nEOISKbGs419dpNAC/Uq6mzMVePOSXFwek352t3Pzkj5/TA3IOfCJpVf9s9smVOMoeVYmBavYrDxyPPoaJ0YMo1yJA6T4gDBmcJOcP184C1c/0m9jAR+5S429DXm5QZBLYME0n+yR2zF2ne3bmT52+mHR3lAyj/ERMMKB/XRNw54awQuGZpLfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKWGReVMNves31USvccMyKWFks/GhepFZiGPLmgy/Jw=;
 b=GN2UVmMtMtaxg6hmy+F5zCecEa012uExPbgfFoF9zspd3rEO2eeH/CRBKD7pVlAdpcf0KOdRukVog+JbBVYDmu2Vhf+GHm1Q9nACSNGPuRDXx+MOP6juIsGOxJRAA60hRog3qByKd/qYpHaejgE24f/+YTZvSSWusLHbTn2vl7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:04 +0000
Message-ID: <87frrjx0iw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 092/113] ASoC: codecs: wcd93xx: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:04 +0000
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e92ec3f-6794-4e00-5f78-08dcb4e790fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tksn6VCsuowGg3pwRBTy3m8817ToR9c/m2SphbE6gPzFsntmI3xoq3y8jeAq?=
 =?us-ascii?Q?zj11wEeEu+xljtCQ+idmh6YJTeeX+DDU7159fcWVtLK4sYkGV2AjYKSSlWxw?=
 =?us-ascii?Q?OJdi4dEFMs0PCoE90+QGtqljiE5Bxuo3lZjR7bD4nvIEhRcym1mhJwFIpQrE?=
 =?us-ascii?Q?03jYO8m0uJJkB2NELgpwEDNjd8bG/3E9bSZ/BFvSq0ko9J/j6kA3TbD7waDr?=
 =?us-ascii?Q?1C3W4uaq2w7p/tRDbb3/QDLROyF8IqP7fWns/KPmWtkebsdlYO84SH3oqqkF?=
 =?us-ascii?Q?IypT3Srmj7JoNvGQI0iquYPnFMNLtswGh5JAOpuKuww8LHKzj7AHO7C+6Uzt?=
 =?us-ascii?Q?WSH++0thUVImz5tSZkzGFmcB55jx3ERNJNw+9rWRwLA8726Q3MEHi5hK9zZ+?=
 =?us-ascii?Q?dpY+4Wc/fvetdP/phlcw9zyR4iunhMGmJAsC+w0OxHAAIRVdUcOxu+LMYJkE?=
 =?us-ascii?Q?7IG/c84ePKfafflmU2YLuK2/6A616PXGhGqP5h7lXtrlhyjO/6krm4yN9+Tl?=
 =?us-ascii?Q?XbHQYNP0qcdnpv6UGr/RfD+Eqs2Oh3jPAy6sNQsuULwUv+iHE7CjsRt+LCn3?=
 =?us-ascii?Q?/lYd7wytNafBn78PKXV/tEyXxl/mZUxRgxpi4OmKRS+8NNTnphkwjLEBuqS7?=
 =?us-ascii?Q?V9w3+sR6+POJ3Re8BbjtTtpc5YXF2RDXTGDRogXGiYqt9UbZ0DeFENq9Wc7g?=
 =?us-ascii?Q?hEzRt13F+evdppniQUpjUHGk4++hsIgKUAQPvCm+3uxMiCBp2zJyL22N+O3g?=
 =?us-ascii?Q?YYk4ca+Ckchf/zdE60nQoCPqbqu6HbzOGqHt6MPogmiP+Cp8ucMan4ObIsaz?=
 =?us-ascii?Q?aIJGgs/x9s/qIURgFfZ0IxVgvDSnyyb00DSeWH8o3wSth7gv64fZScc4XvR2?=
 =?us-ascii?Q?d4jpV2YS1RC7JjNqbtSSHGmZfeL95rtuNPome3+wX88s3fxX6X9bWwnOqssH?=
 =?us-ascii?Q?4NdcvQT2TVhoaELLPsLSsHtquFeZffAL9cxsSTzm3vJxKa7FeLPuEykaBlXb?=
 =?us-ascii?Q?WFbqErKwwdbFIhT4DA/CM2Z3bSOx49COtBBvnLaUhjTXxqVLHo4eKziXQ8Ms?=
 =?us-ascii?Q?K8C6z04KA56JJqLpFByqu5CDXEmS/uq3ftQtljPlXSEVBIeoPMn4y9MMAN3e?=
 =?us-ascii?Q?ZU5G+VEsl4/XzaPBRYa325QTbl6Hc1TMoHL3UsOiJOX4aWohtttQlCPfmmGw?=
 =?us-ascii?Q?ZSZ5hzvTDnClCXQpICbtHbNHHCzmF+2Mz5ZNwssb0c3kcD4d5GTkaiGeZH4i?=
 =?us-ascii?Q?uv/PvW8thjEgwtEkcJsl1Uy0YzAXCHv5bixneRpP5GOGdX6rvk/2xGNac8hL?=
 =?us-ascii?Q?znzCpDc/7CUaOVsqUw4CzlMRqEMHBAZqnwsFUVnERJItX1rYeTvPBlfCQ1oP?=
 =?us-ascii?Q?iafFK5Z3j6J003GaCj4iMN4sVmWU72N1FHfmyyVgEfZ91K/Fyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlIVekzeVOfTI0a7vew7/GlsZAVYY7yziPTE2zulknVXAhTUUaJyr8AOL5n/?=
 =?us-ascii?Q?QSEFhlarq2OBHaLtryijyfdPAaYO2rtocZGddc3pbLPS2Q6Rh5OmCMQCG1ah?=
 =?us-ascii?Q?IQGxOTFoD3g4hzOQv14IvBd6BphW6IHA2jwQw60y8GwzOG5k0Gmn9RS9npRr?=
 =?us-ascii?Q?sMZ/+gCZpvQl94jNgXZJrpTJ0S8P6hsjVsn++4uctmjPzdD6BI12H5kZPADZ?=
 =?us-ascii?Q?wGV/u/JP6XCCjyjr+5igG+5FV1Xr1DX1f/+F4e56QydnCe7gy1Zt6jp2YHuS?=
 =?us-ascii?Q?cVL+6l7Q4UklR1O69X4iqvsOrOsftpJQNr4tnRrp1MOMkZSkqYDwgykPFClv?=
 =?us-ascii?Q?zM+7Xb9rg395Q2NYNKOa+pc/OeqNmxdXUZNS4XEQgHUrQ+opJObicWUW75jY?=
 =?us-ascii?Q?XFbxrpCHuwhmDWQX/irBraKIPPDjR70JMQgDmLUSsW/x06r0sn/RAHEJPFZU?=
 =?us-ascii?Q?4Bl/CN0bcv/DiJGTRPzEP4tQt+rRclHrr78bl41jyZFeLOH7wJergTfLw8Yw?=
 =?us-ascii?Q?QPGxfVx9JORSxRV02+zOFyAhx9sra1v0w6bAdZtMKlZaa9fcxbWx7l4VQym+?=
 =?us-ascii?Q?pGxRh2Rn8aHwI1bIMfmbY6VnkOuWr0/9HqHb1PoFNUPICWxlavBi06jv6WWl?=
 =?us-ascii?Q?PMaEA+OKzJt+JZRB8tlHa1hbgzAzDt1MH8n1QL822gpEczBkP0VRgDIx4ZTL?=
 =?us-ascii?Q?FYEVYNJJhrbsuymug/IWoP2zjC1vj6Sg4648gakzHXpeRUQvTjB5xcpfdMkU?=
 =?us-ascii?Q?xclYDoiE1JdIYTPYbK5WM1N6kh3H/jFGk3fBgXPxcCXYY47j26bcNFdMIMA1?=
 =?us-ascii?Q?8vcLel8f6uPdaxgYZvcCowqNpWiqnhjjXICCKtKdWxknTrDO/CQJTrgSsbTb?=
 =?us-ascii?Q?5H3RF4vP/kQWVQ8z5U/INPEx11qNpXM1nrRC3lohzIXGCniKPA4KlbPrqGiW?=
 =?us-ascii?Q?VtxxWG+2hL92pAL75LVc516mEPfM/DcQeJdAeaCwPBYI3S7gLCkr8HJ1PiJK?=
 =?us-ascii?Q?Z/riycVnhWljb1B0qx79wXynhfj1SgyTPXzW9Zwbkef56lw8eOg7xLXie0+S?=
 =?us-ascii?Q?tUk2jR2KvTZ3NArm8pZf+DydPylC0YWuswFeRjv3I94IP3hFwmhnyDNnDcfA?=
 =?us-ascii?Q?oSXqoRsjwnX7jkXxYeZ84eXmSBYQx38oGkbaipk0aJU9IBKh7kaOchoeUqHq?=
 =?us-ascii?Q?G5dHIRB+PL9Ky1M7ihL+MepW/EIW/UmKpLDVd1abnJVIR7Ow6wc25+0NedVi?=
 =?us-ascii?Q?QL+HHFlV6KZ1VzGEKlpIUdrSCq+L19ZgewyVl2rDhaUkjH6ogUSOansryrua?=
 =?us-ascii?Q?ja9athCKmvIuXMF6sWriAt7XV5QrVLm9DOIG0eKTwPH1uAgnIadCt/OVh9ie?=
 =?us-ascii?Q?XPHIbTxins22oI4x+SHqtqHDdrPEHkqHLS9emzMxgZq/h3pHKnhxpwHv0US2?=
 =?us-ascii?Q?tIdU9Ml6xF68iGFLnCw/CEfE+aTHT449yZcGQgNJvc+ROdFR1k7QbWU5WgTe?=
 =?us-ascii?Q?24kKlq2lQVBgVyJ3uUaHgWoaM+RJ/UDq99dRywl5oKtITxwcZvwN4Tf9cUxo?=
 =?us-ascii?Q?QJGA0ZLmvUpmuWoQzvD8qMOsLjipFIk9DwynfrncYWzxDQbHZcIbdcNYAV+p?=
 =?us-ascii?Q?rInqwEF+taeXwn5VV2zCC7M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e92ec3f-6794-4e00-5f78-08dcb4e790fd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:04.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVvACph/pQX9Zsg8soWUZvkYQyJGqssdj8vu4+y/AQYerVmAHjlL6KgHgppptjwxb0Y5j5VsQZNidpAaut5bAhZh+RWXWm5WhZ0G6UM/9iSnYX+QSManT/NJTVyzJVcV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wcd9335.c | 2 +-
 sound/soc/codecs/wcd934x.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 373a31ddccb2d..f66f4134af8f1 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1732,7 +1732,7 @@ static int wcd9335_slim_set_hw_params(struct wcd9335_codec *wcd,
 	i = 0;
 	list_for_each_entry(ch, slim_ch_list, list) {
 		cfg->chs[i++] = ch->ch_num;
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			/* write to interface device */
 			ret = regmap_write(wcd->if_regmap,
 				WCD9335_SLIM_PGD_RX_PORT_MULTI_CHNL_0(ch->port),
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 291d0c80a6fcf..82894ec51a53a 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1732,7 +1732,7 @@ static int wcd934x_slim_set_hw_params(struct wcd934x_codec *wcd,
 	i = 0;
 	list_for_each_entry(ch, slim_ch_list, list) {
 		cfg->chs[i++] = ch->ch_num;
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			/* write to interface device */
 			ret = regmap_write(wcd->if_regmap,
 			   WCD934X_SLIM_PGD_RX_PORT_MULTI_CHNL_0(ch->port),
-- 
2.43.0


