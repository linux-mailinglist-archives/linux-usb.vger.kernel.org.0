Return-Path: <linux-usb+bounces-13054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEEB94726F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2BD2282CC5
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912252B9A2;
	Mon,  5 Aug 2024 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wz7hKFIk"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DC82943F
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818643; cv=fail; b=hMxThjid2jf/VpEmLGYNZTFO+GOJRn+YacSP/Wk/u0afxAxmZKNNJm3kXJa2pauI3SeDxMlBykDyZCeE1w/UT/qKyTdPBB7HY7Zf96axLZwVUPs63Sql2Q1AmoA4jzh0LjGebNqG3h7BNzxgI5WVvHbbYJwcvak+CkL6QcBBC10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818643; c=relaxed/simple;
	bh=qn1y+bRPVFaRQn0PoeVFEpDQb7fD/Q05gcVSGm6gl2c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CVxnv/5NzAM1y3yESKD72ygM34inS6aWSD1oF9X/ZPkKdQlRMkcARkNq2RnMhQCOw/P8qTJdgTH/KG6vmz3kgYj6QEve1W/44ptdKWLYw36hVcT9WG4Dw2z9TdbgY3xMZhDdOa3QApOB6nbFbEMlsLGQAFw5Tg0lp1tf54D/YSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wz7hKFIk; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFE6N2uqrYOy3E/dqQwq5zCPCgszgw/bgNFIqWy9ESOD8+W41SzT+MhWMU//W5gFOXFUyFYGIsdWey37gfU1497Pq2zWuvH/ahYsGE080WjsLZfZHDDaCmzxo4etmjZoJHkSWw+5H2b7K10z3JgrBC3RJpcQkXHx6kJiDXtlT9U0HeVfSlWnsDWGsb8bC0sxtxnSYHm1BbKYquoNQIyHZgs9MuDLhM5eDM6WAG97OkHXLYXsCm9/jTnGEHB20NKaUbtHtbCgsOH2/fe2iQqpbXlZC1oZzLnLp841FYTk3LUKyfw4eAwPxCk9aH5B5ppIbkyyhjNCVEgJvQwHOF3fQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT2EO3v4sy6MyUuQ+iNF1x4dP7l3YqiVxHZXWFPqdNY=;
 b=sW5RKfpHgh9DsG07AP76pc5g3omuep+ZhZGPXsFAeA3HxC5zGDH+ai3WeZyUPDICnHs8LYGQbzc15UU/qvuFUXR/EM50uiuxuUf+abMyEW8ST/I8qHRofqFfP0swmWytcLgQWdjhdwCzoWlUksSd7Ord8FtVxM0wP+UXBCGGa0lV7vsFQhBQWLVkxRTGL0MQaJwGPCiTDUt+rg7/DLk/36+0l52CydVnlHdOL23ELjRAerEteH5FZSwOYk/kNVehyeq8KyLm19ORC5eRJaLdaViTiTsr7Jhdom9ZpPpOzOruaM5DLld+VTlX3tjn9wsREdhQWav+C8ZPUPONOPy8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT2EO3v4sy6MyUuQ+iNF1x4dP7l3YqiVxHZXWFPqdNY=;
 b=Wz7hKFIkIpf4nZS1fbpZQLiJAIn5ldEcsCRmSljqK1WRTERTMxnJrMDuPavZov6DWcDuY6jKvvJHqkbRE++vOk+odTAZgGtwzqO+rvpEWV9M8tEu18MO9cQzM+MkNn8a8p+fQdE7IH+C914TMB/MUQjsyrZzvg1cFjTB9eEZnb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:43:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:58 +0000
Message-ID: <87y15bvlwy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 104/113] ASoC: codecs: framer-codec: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:57 +0000
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 4518b8ab-4b2e-4cfd-a971-08dcb4e7b106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eha+Iosw7melA0prwlyV6h+s2j5GrJLl/kcv1+Ijq1tydbui7iWPbvP48+W1?=
 =?us-ascii?Q?NDnwaSdXan7ryIEScWXhbmsnyWlveyeyrtNCfDuThaSKDP/7gH62S/NwmT09?=
 =?us-ascii?Q?znFTlPIZwgSiPkPI1Qm/FSr9fpQ99HMZbR51X/eQpFEP/yr1jtebkcSxla1k?=
 =?us-ascii?Q?9dkcwY9N8u/t2OCt89g1OlRejMIGeBciM4+R33jqxGozwYDi5Vowc4x5OvR3?=
 =?us-ascii?Q?WJVK8PxHRf5q5NmoPz7yH+WT2XZnOL7rwxDgpzyeW47Trzh4+cTOFG0yQ9Wx?=
 =?us-ascii?Q?aThrwsY2sOFJGdR55taOSrwT4MYqTgPHKE3Zlf8qjewmbIBSUpc1kldWbJJH?=
 =?us-ascii?Q?xn3juxdv1CBtQbJCgU3HcLoauKIoltMaWr4LV9FHfb1sEZM0GOa7NkjkCqCu?=
 =?us-ascii?Q?kW/2OHoEF8rGg1paQ1TRhLavQxi2SBiP5sRfWJ55EjF3lEpzwUzxM+vN45td?=
 =?us-ascii?Q?EM9H9GJhcjwJ2dRRpXn5El41mDf5yZpco4DWuNCkP5OjiXYxKBmqM/3obYhx?=
 =?us-ascii?Q?Yfv+00G2/ILZ2o95CWWKVGf/2Xd3tlLBBodPhxtM+gw2dOyJUIe1gLMnvuM2?=
 =?us-ascii?Q?2h/h+8xgLAo6VPPhKrkD7dFEJUfXJnliOl713BgsmWe+caivwxfqlgUXXOTk?=
 =?us-ascii?Q?tqpP2JBXcMzizrJ4BCCEHwyRMKDM5R6OpeJLHUzumdQ3rcmEUI2pnAgv3Gg1?=
 =?us-ascii?Q?gDsaaw1Gi3Jbv4PXz77hz45jHI2yEgSM7ceExV9+hFYfwlKnzqvq/oyhqX6P?=
 =?us-ascii?Q?wLJD4fMOpShp0YekElEnba4L+J1Es3UbJsCjQSo2rd440Zy7mcJOCRy7rdDp?=
 =?us-ascii?Q?PalqPY1uP9n1uzMAgblAEwORpK8hge8gL3oJKpHG7+mlTdXoy9Eej2QfxF3/?=
 =?us-ascii?Q?M+pH+QogvcfCulafCxUc6vIdaJm5IsczdpakNMz5mCQljus+7gkCAfG6u5ZV?=
 =?us-ascii?Q?BTHe3nnSkNZXK3JzOBJwUMAAc/u+LoYKzlnk++DbQ91/PjTOEHVu+N2C76Qe?=
 =?us-ascii?Q?tKTgeU2rPEFhhS309eIkCNvlTXX7ZXyLlfgXu+eVwyEvY/nMplsHGw7VUh45?=
 =?us-ascii?Q?U98PZJPBOGqfmpsytarstranZ6jiRi3Lr+MQ1vJg7n0vucNLdATtk5YZvmbC?=
 =?us-ascii?Q?16kmgrvWo6ieWmmrYxRtz9VOyYtpptgyOYDrs9vEGODIF2chhYQFrmHZ+p+j?=
 =?us-ascii?Q?zxiMFJBHpt0sdFYY7sZ7H8kuRvgBpjO228IGRZUGlGI/0BuRNquSvoi2zyJ6?=
 =?us-ascii?Q?PAPbxQ6owq3xyhero1Z+1ulzFLNkcnl48DYxZZ0xuZjAsBxpSav3E2qet7QF?=
 =?us-ascii?Q?2SmN3yVrY6AqW97Z3i/LD/qrSQnfmcACotGrFSPFi6OuBk8RUBeyJ3c44e3j?=
 =?us-ascii?Q?0wLEjfr/tqhMgGLdO1blU6e0mu1lRDSyAXXp+ukShlMyi8Cbuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jp6syObF5id1/Ro10cBYNtoPHimqZiKsyMMICo4XGTttK0aUveEPeuV1rk+K?=
 =?us-ascii?Q?hj+Hgf9IB9nYlkaMS5TglfqJDBiuLu2NOZf+QIbOydjBELX56KAoYjKX+8gq?=
 =?us-ascii?Q?kcMd2uDGn2ir8V/WWGO/TYAZfWyoypnemXi0Tv2v92riTmY3QGv/N+7hFnPN?=
 =?us-ascii?Q?93LNf/yKMzOWgQEZ9/QBZOys3OdVnmYprI1fw137XcYcpwxbOkmJxA/GYPkl?=
 =?us-ascii?Q?Q16jT8ak/RyFbPfZmCs04zg/96n8Xij2LlYvUmsOXWfVMkrKT5zsjbDdaAcD?=
 =?us-ascii?Q?PrEXIaImCsKHdJ5pV24NlnMrn9dYFuQ33nawDTSFdhBTpNLiCIbrPkitEzmy?=
 =?us-ascii?Q?ZNhP1F4e9qXGbXOu+Koh41D930/OZQlBJ2nQ1VZzdlHMnQkj4utoNm/14keS?=
 =?us-ascii?Q?eU9wDmz/I7aNcRZ69mqjew3e9PYskf2/YwHG73gTzJUgo6917BQcVzt+roZu?=
 =?us-ascii?Q?pDzCI9jFSY+Bqj2rLY322F6D3XAHs8T3ijLDSDAHPpX0se3ku71v6jLU3YV2?=
 =?us-ascii?Q?mojHPCBCzrcbMth0yzv6czUUqWXTJLdI5k15zLILHuI6SxKy/Nj+2oYZfs1t?=
 =?us-ascii?Q?HCpC7a79RxQx9EU6oP5PpmZuouOx9wJ9gRsm29lL1t9plzGzxvsVaVtRmaKk?=
 =?us-ascii?Q?CUY4hEgmTiqNsnr5QhkeYI7/xPDAfgnVGQSHsew+T+/H0wC6qFX+nYBSlb5O?=
 =?us-ascii?Q?EV78kMyZvn3rYQxKyt0d4R2zHKna2/G6IeJqkZy7a3Tmb6EeTR+KCU+1UXZj?=
 =?us-ascii?Q?K9niuMBTyCFBCzRgANjfYmCb6jaj2F700ZaDgxk+3bv/iQBoMFX3kcZAXj4i?=
 =?us-ascii?Q?iyQp7lchGi2DrDrRSx+Zaibqi0ysRVdqlTtnhonfGwnTSi0SzXJdYtnrt7PM?=
 =?us-ascii?Q?VawJA2yUeRujnyU0pBYJ97IcgERkcvv3rU/3zrra5tgv9EQmSQP1gQitrZSt?=
 =?us-ascii?Q?17NDY8aWYvLOG6/O9RgP/vMkVr4Sj/ZWEC2IzT0XwCxkKBkKVqpD6aBIMLzJ?=
 =?us-ascii?Q?012l7kgDV2E6+EEWW6kTbrjpDoibge7D/95oLB9O9+5iVtkbyXYlbTVwS+xY?=
 =?us-ascii?Q?h+sIVi4XG+rprcWDbnpKYj/ysY5tPN7IizsAA8B9CxIEQ0Rfh9bK19ULyBq4?=
 =?us-ascii?Q?W0DuMqcdKfBXxO3NklD6wcsAyTxwOGBcCvpf8jZNrgkh+n1NvKFgYy86jgkl?=
 =?us-ascii?Q?FyvJTgmOVPqLsEtC5aku7UylKRgSM8Dg+rX4npyR7Oo+2g5j5BsZt7gNO02O?=
 =?us-ascii?Q?5LnaOKY9qSgHanvS4baDeZdg095sBPg8beJ4nRHu65hbQ8XND9olhh2tDwUS?=
 =?us-ascii?Q?puMSC30dmhRIoEcmxdkwI+xXnbxE+pVk2pN3cEJu224hDFV0yScXuattlbGR?=
 =?us-ascii?Q?0Dc25H8YU/yfFAohdSFE/pAcyrFkfVe7Jj4+BEx7lGK36Lq8OHfVh4A8HIgx?=
 =?us-ascii?Q?lm6QKpNQPXuyNqmfTXmMLqXrcQzRC268aBGpmQ1kEzTPrPYWrbb4bb1Od2dQ?=
 =?us-ascii?Q?WMumivWmJKUI/H4u4yDMTRaWy3ZBJyAU7dw0q2S9ybLdY0vyRDIUAjxKxIuj?=
 =?us-ascii?Q?BrCjOHofjsVpMxpio69nWN7Lhcz13jR9vZdhzhNml+FhWQRbJWJzzb+edcuz?=
 =?us-ascii?Q?eDYXx+LyYylpl0wcqBR1Gfw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4518b8ab-4b2e-4cfd-a971-08dcb4e7b106
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:58.1055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OnAgHKtsWbuksOICrUIxsts4UJnccQTVX3GOEMXDxeKNc/sKxfI1vWK4UjOM3TCmMCCzR/inPMy4slzPHp60js/5nlTh8AaBZ3woGz98NTyxTC/errM7IWszqzIp9KF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/framer-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index 6f57a3aeecc89..10ad78e87a7cd 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -192,7 +192,7 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	u64 format;
 	int ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		format = framer_formats(framer->max_chan_capture);
 		hw_rule_channels_by_format = framer_dai_hw_rule_capture_channels_by_format;
 		hw_rule_format_by_channels = framer_dai_hw_rule_capture_format_by_channels;
-- 
2.43.0


