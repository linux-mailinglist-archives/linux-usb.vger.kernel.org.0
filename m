Return-Path: <linux-usb+bounces-12954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE49471F9
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36D3B1F211A0
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8551A3C2F;
	Mon,  5 Aug 2024 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EcA48BcI"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA21FC4
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818068; cv=fail; b=r4DX7JxorJLsh2BmhN/G4DU7TLwr8kzfiXtkMWLcbYEleUlRDHqWoSNznh21nftH9z3Toz1snJleYvpul/haimJ8pfaaWJ0CbwIBtpZ4lsXgThv9Fhmw56JOFjMnfY1vboFnzy+itQJOCX3tgbFk73R6eJmJ4BDQgwzm2DY/tXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818068; c=relaxed/simple;
	bh=wZUcCKfRypx2pFpsANvr7jOGkCTb6aV7BTj81uwNjbw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=g+XbrqKv5uqlk7vguortxrfKdHJWAuJlmbLv0E6+zX5u4A3uQVyER+CbbO8IMocLjJNq0lxO8SNRXOWZ+Z+idTYshmEnv+zGUGtUqFU22SgvsanVtPZRsc4hVC9vfYm8By5/M3ahw6ojvos/RH6IDaEz2hn681/Z/99VdnKoJQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EcA48BcI; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOTRdvzhPiTwrJlSgfkZ5JCoWDVX0wZVQ564iaga1qUEGiKAfjrAcnOUr065SCo1ai476S8Cg9zRhAMLhDyJPTZHKj3noGqc7L4WzRv+zpnV+7MHxk8AEYBPSIE/BnL7oWlnDlzdNAdYcaoSRuAOVOsYSr4xgcDNwRgmkLRI3511GCuacHjt1wnufwjug7gScaTQZ9UZj3lUzh9DkI15g3aN47uiyxyTC/3vG3YYMdf8t2Ul1kOT9+jQwWzwGGEqqPc+91EpU1P4gPJSLL/oN9IC3RVLO1+km+P1EB4jlT1gveYbGA218ePjHxi+dsi0UHWaf+uoEkf0kM8CuqbASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjR2gsSnHpxklssZ9xh1RDlJx2HWTqEa2D3t3xpLY/k=;
 b=Rc8r8j66cgx+CIqm/ZZfG+fX9fBYlmaOPJodUuEL0aNYLNWc4Rhr9Wb47HGTpW+4E0DIHbMkz54fOUDlx+owAsRIrMf0NLVKTBj+Nnksva9725Uwwp7xRtq+nZWNUSv1hX9OmYqLwx4NV+64tmJ4g+0YD6Xmk8CLdFoShEwfFZ/rmOB7sXasjfyvWp6I/lhsOC5hfr8H7TLqPgb319kw0ppBoGlPZH5uNfM5h8hGQYUf+JGah+fzTrhcovJt+UexqkNy1L1w7xt6mRBgQSLftPqswFYuTsJhddetffdrF44PPc6OI2lFwmnv4BdeP9VW384M2DvNN9iYWb+E2Y1rmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjR2gsSnHpxklssZ9xh1RDlJx2HWTqEa2D3t3xpLY/k=;
 b=EcA48BcIGa5emS1rMLNMVmTWQZKeUJSHBdokew9A0ejtUI4JpeH1DcWVuzYtmA8hbY68/u+YsHxIIdvkQr6IjAE1kV5Uv3Kag1ED6oIj/OZHpRwqpkEVFl3rCbDtaMOE7fbn9/urot76JukbI9dCYfVU3WBn/pWQD2IjwF752/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12335.jpnprd01.prod.outlook.com
 (2603:1096:405:105::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:24 +0000
Message-ID: <87y15b24fk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 004/113] soundwire: amd: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:34:24 +0000
X-ClientProxiedBy: TYAPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:404:28::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12335:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cb9d27-cd2d-4fae-1218-08dcb4e65b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JNjxnDD8Ctx32wOVru5nYtpmV/o3YTG2MQ7ttOdU8lH1szeemyGiFltrXa+Q?=
 =?us-ascii?Q?fE+qdRu3E/A15bytDXJFBxNB0QD0iGTu8ca24r+F3wv83Oaia1vz4s98u1k2?=
 =?us-ascii?Q?RHB+OBJODbSPSI3oknrgSNHeQGMZB4VBd84LkyoVuVYNT2mIEnvh1Obzsx4j?=
 =?us-ascii?Q?thXnBIK2MAJZhBJ3JKgUFZl3jr/86HikbTVNWjHhGSgRe/oOwymD4N+9KeCd?=
 =?us-ascii?Q?G68wooOg1PLL0OA3b/ZXygWhVB0f6hPwb5myyXhvjuP78/JmEkl6rVjf6GAx?=
 =?us-ascii?Q?WaC2QNF6rvY4mZtJHsM5CaAzPynlWqlMR6UuM/GfsO+Su197/Hpb4SIfl/hE?=
 =?us-ascii?Q?ALa8l2cV82+AFQhqpCU0sX7Tt9olxOqLZfgFK+lXmadzcSa5MjUuGWzrZuj0?=
 =?us-ascii?Q?OPPwCcXuip+2zYGCuMIHtk8Peln/MDRHVujz/fZyqVE70IiKxNwdJOHM0FNs?=
 =?us-ascii?Q?CBl02p7VtbnRGxHVU0qBzgQF5bR6Q6l0METMki80lKQ6b0IMlC+ZRg6SOcaV?=
 =?us-ascii?Q?Ki9mqpJHwqfVN1rpA4sM167S3JjYn6xLVdvQ7NujEHl+zObKmTAaaHdm0QW1?=
 =?us-ascii?Q?rjY/a1R2IIp90ZqH212Gm7VRqm7f68jgvVgZRH4Zz6RK8LvtBZ+6boNGN/ON?=
 =?us-ascii?Q?hr7+rcuC9guDd7b8BCKCGPEPkhEDeUKOrIugg66n5WTKkN2z9nK/HP2abuxG?=
 =?us-ascii?Q?1/bRLGt4PMFFR4SscKfg7Z3k/Xdp37uBUKKMRt67ETWy7TNMp7RdMaFeDKSR?=
 =?us-ascii?Q?zlkefkBk1eYS4mclsaICRROPtcztyTQS5HsCrG2If6rZFqvD+kqpYoKYdaCX?=
 =?us-ascii?Q?arCwFIPPHMwGvnqLpwWwJPWxu9E/YwGmZPyJJJ6fme5q35SYmvLC5j4VAtkT?=
 =?us-ascii?Q?ROHLzTAvP/3UeiXyOqn8uly0odcfFGd+6Jz/2f1euwFosv1XpcFtLGUH0W3r?=
 =?us-ascii?Q?ZULEo2qsgrRLzZMo4sotb3mhEC+25B119cVgbiCtiryHChHNL1iZoaPkbYQY?=
 =?us-ascii?Q?BLWvrHL1Y3A6WjOI4+yci/ZS+xfZWQcWHkdReRLOKcN6ITefYs648Rc578SI?=
 =?us-ascii?Q?NZLJDFBdHYE4V2ZZgvYMoOgfeYow5zw+CCvVr3ZlVXmoHT+yFxJ5TYl31SLd?=
 =?us-ascii?Q?qlGkC8sn0/EfVlnDHjkCkIymf+mYPRMiAIa4dhqLeSaJI8H0zSiI4QpeOirb?=
 =?us-ascii?Q?Iohu2WzXqidjXglMhA5qRe3+avALxMJl/GfNsoY6ttybzRgkz9vaESrzY0Rl?=
 =?us-ascii?Q?a0jqmJU3FqzB0cOkcfpYt/VYsuWeeyFXCfwHf+EeJWWayvgkWRqih8J7vL1H?=
 =?us-ascii?Q?0C3RJ3Wg8Pj1KdRuN0ChMQ1OKlzFDzD4nBpYF7Z9Ek/o02AT8surKnsUMTmB?=
 =?us-ascii?Q?YzIXKJm1OcKmxWUmrT57mS5x6riCFLj0l0tJW5wgw/M+aCu73A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OvrR3/BQNX/ar8WDroXKzxEABcDNrOaHiglcimY+EhTJawMR0gnOEvlc/m1L?=
 =?us-ascii?Q?KOguI5xXQJORHEGy9oeMvhEwXa7buXU3mpiZyhuJvPKVkxRRUZ9xrq8QEHnu?=
 =?us-ascii?Q?jkqnRuE9/P8RqzkC1vxikOO1ibb6dg3Ena/VHtIVEdyjDztVPVNTeOn0R0aZ?=
 =?us-ascii?Q?ISe+LFwrkcXq1CBAY2u5qdsPo0pdKLGnS4CDcTKRvtjBf6CG437sBPrsxSEX?=
 =?us-ascii?Q?Kv+VXk8O82DpvVn63xgo29kVFy4Dc3dJTkMXWmP5nWQcnzS3ol6fy7bTXtKx?=
 =?us-ascii?Q?tyBW74p4Tl/BBdwcKKCLdzhZtHrMdT0YUS9cl+ZFnBAa6tV3xvqIaW3LbdWh?=
 =?us-ascii?Q?meP3syBmhn2Q452feXomSj3dAqP2daT4eBELcB9CG1NfmWnxoZ4bF+iifIqq?=
 =?us-ascii?Q?0JN3YPdJ+xbNghwlOy21fWQoA9doYCeb/28LKfx3iO9lzbXCVbh0+/LJgHKn?=
 =?us-ascii?Q?s3DXvY9CLAsvX7xe/sPJt2b/dH3WZmzyfooFZD9pn+ZMOMc7Oaq8RuW3vkxt?=
 =?us-ascii?Q?DJ3FxuAeW/5UVSD3wvHOS5qBAVF+3GMC36xnXxdxpndIfFMHCPRs9ZbqLurv?=
 =?us-ascii?Q?DqvFK7brRs7R6q6AIvb0wmn18OSGMTVBt8ipE45WlNsaI9mPJ28jzdzxSmq9?=
 =?us-ascii?Q?tfzkLXJWivvTy4NLTmSd08hQnzCJDMfktKAbk8qnZADwmf8S0k8LnNDpVR2y?=
 =?us-ascii?Q?a5+Y117ifEr7RyDrSTWVijOMpTVUmn/MQfa6MxpgiUORAETPAtiAgu1mv+tJ?=
 =?us-ascii?Q?YKBl6B7y8rysKY3koquaeAPwzVZ2y/zt3pP52qINghYIIPv82NEybkkZWDs7?=
 =?us-ascii?Q?13kBeGCembRJQ/2BvA7odJ4VfFjWbaYIsvyovnbcgL3AWsGG9ccF/UukvuKP?=
 =?us-ascii?Q?lYeOMta+CBvl3QIODCBx+KXMiqnn5aZ8xbcbNIDckGiyITf/loehVrJnM52h?=
 =?us-ascii?Q?Noq6rGt7JDQyvqlHJ+lU7XY8/R3ZaIhlhLRH5w1oa10egBXB+qCYbWhyVqvk?=
 =?us-ascii?Q?suBFVUdUhQrVVYXci9rZ0Tta/ZOxv4/JMmWPE7Dq7oRFnPRkODtWCZ/k93ZS?=
 =?us-ascii?Q?YwizqnpnI3UNHt49kfifz+6+PgCJ6C7E23KmeIkq2h34kS2p/A/GPvVH3nkJ?=
 =?us-ascii?Q?S4/WjcVVBTQSe959VjOesvDeR/x/glyXNLJO8Zp/qC0DQvzxvTY2SRGtsH/k?=
 =?us-ascii?Q?9Bp4V6KnXxomQYoVkwgL76Ar499EboIrsnhzIPhi9tKc0C4Dr40ZHkM9X5XR?=
 =?us-ascii?Q?ceE+5k32fRS/VAvZ87ZTbWhxhhHxq93C5vI5ygoWI07H2Do/y7U/71MNLYGT?=
 =?us-ascii?Q?+83e9FE7GW3jjvkDHnG4TyPQGZ3l7MXjkwKbUMo06sLiMbwpu6CfkxXjzaXl?=
 =?us-ascii?Q?LhqnqVBCqQy2E1Fv/L6dRI28fiq9N/FoXwuQ7Rg2eaPAMq0ODgFVTBNEj0cf?=
 =?us-ascii?Q?F7KXuFuX43so05vNONzT5WW88IcXSObO+HZG75hyWhQjNfdxZlfHdl/bdtT7?=
 =?us-ascii?Q?gJ30xUr74utfMea8E1GpTurzxaQKQSK7yQsx7WUmMrl+zviKV30ZGn7JDSdk?=
 =?us-ascii?Q?A39BtMJWSUokQ5aLo5yo8Ef3iA/86cSp6QAs4zrCGd25AoRY1q0Q/olYj1BM?=
 =?us-ascii?Q?1upUkOBB1ozqC83ybOLvtA0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cb9d27-cd2d-4fae-1218-08dcb4e65b06
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:24.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4ZeXkfULjs2ZQQPs5RPafG9u42rDQEAwE2Z6s8wY7v5raHBceFr9//7Ea65DdGjdrNe1cuES1/lePH+mRinEvG9PdAK5TIJbj5iTwFrC2t8mBCAHMyM43LBrDQKVarU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12335

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soundwire/amd_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 0d01849c35861..6f9e075b49979 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -612,7 +612,7 @@ static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
 		return -EIO;
 
 	ch = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		dir = SDW_DATA_DIR_RX;
 	else
 		dir = SDW_DATA_DIR_TX;
-- 
2.43.0


