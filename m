Return-Path: <linux-usb+bounces-12970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78275947209
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 02:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BBDC2810C2
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 00:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506784A02;
	Mon,  5 Aug 2024 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PqQ/0U3+"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564139457
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818174; cv=fail; b=oZq5SVKa+z2dXx/wBudlvxgEW5GcXFGPFeaRaRtOt13nYzOwl2+PbG9ne9PJtxoBTbwvfAEdQBJsTYmi4MRHVz3G+S9bQW0r7aZuOeHfJHI0Ej7Ii8/G7fMjQa4jTyj5L1orkJLSGxdRWM2fzx3/Mg2pWHe45JZ74SwO3BVqaTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818174; c=relaxed/simple;
	bh=xq3Mt1ql7U3H/lyejOGb1DigCzDhBnHeHhj85z4TaBU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=b/hHRFLAzf0qAqVlw5vSnRHxgSmPTvh2lv9B1zuZEbWuGZACi+E3qIpWzuxIKFsenxXNKe1wI7ETSWTK2lwuiDvk+h9GAnjIunxGARI/jVtiIBVXTLkMK14vDAAoNoufKTqg30L4CH1xohFlU3GbUxd0Z2cg6BYV9bOPGdZpBJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PqQ/0U3+; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYpprfN+rIKTjDlYXrSrDuywPiuWbSYXkQL54MMgUqFReSaFm1ZoheMxPW50EdZUBTv+jjfiFyawJekxU/jpJrBQwd1Eiv4Z7deZFQVFXz+KbBJdKdQjbc5PbL9f2AJf5wM7xBD80zhr2+H1uBAIOtpZWDfJBRw9NKxdnhwXVFXOeVYFoNNpdtcrQHKnQVBPxm3fEOcLBtk0eBOvIV2GS2BdV06feBuD/VjtihhoqYVaf4LykstWdDr90Y7mQzIyk4Xcx+qjkHcCRbRSottxAhlpl4BXFLCR4DVWQ8Fq6STt5Ij+a5P2pQBgRlhJPHSevqhN4JPzTANnm54xTcRTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AOimuGkJt0hPMSSBzijB5opL4Pqz0vwxV4X1XmvH1Q=;
 b=NIzoOlhZyv1IsNpVmSw41lop8189qssM0AQelcgbug6zqrQyjoJtrPtvWqpzbVr7B6Fty4Ck4S+xZ+JgepKrpoV2lfFTGl/ylUhYmLVo1ybrjkQ6LBqPcVjEI2jAeeEPY2BKfzC0FQ+ZH+2/FErNAu8wAophwhzITJlGvgZGj9VcOZYCwX/FYulVv/LiF1n/2glS7xFnDCbwY4N/ui0SLKhZmKBwKoN7wKQofBKOOMZGxzFfY8m/Dk3sgDTrg/gLbLO60CELHIVbTOFN6MLDlv2HSYeQvs/maPlFBzGb8q+NPOAZelPTncjS2Hwv1HshHIIltSffwnxhcv14PspaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AOimuGkJt0hPMSSBzijB5opL4Pqz0vwxV4X1XmvH1Q=;
 b=PqQ/0U3+L60U72BqfrrNx4rt6Mv80IrfJp3Ie5Vp7hjheUPlW+lIX79VwuMZjlco5h9G1zFjOglXrfiILecP8QuG1O1GjoCCKx7FE7Efn4QVo5SO+tlKFfWFYHiRctJPam9p6I8EcAUKlH5IqW3u7jZhXn/Y9bUa7t2sCitYJHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:11 +0000
Message-ID: <87bk2724cl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 020/113] ALSA: pci: ca0106: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:11 +0000
X-ClientProxiedBy: TYAPR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:404:14::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: de770122-7b5b-4f0d-6382-08dcb4e69ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4sW7sLs1dGzaRPXCfGmkZFB9JhWUzt6RSBhASTJ65Y2KPB8GHH7rHzvIiR+k?=
 =?us-ascii?Q?rSnquMuvkpBHv4gY6OtI0mJsSEKu1EZ5hKF2JYlo/VHwityyM98nzupCIxh0?=
 =?us-ascii?Q?Jb8BO41TKRHkVz3WBVTjXqm0uyKzgWYLk7Hq6UU+tK3j+8mLEmND9qbGHRto?=
 =?us-ascii?Q?U1+VHtwPcqhY5qDus7Paa0RLOXni2sr/Dh4ehoiwR1LeoMv2EaNRkP9w03tn?=
 =?us-ascii?Q?diy6cVhdVZV8V23nWszSL1VsajQOQ+RVXLerRwpmXlLiotgg9P/XXtO5KGeX?=
 =?us-ascii?Q?5XyB8BQZGSmO6affjr0B/S9deidvdQ3DZLHjKM+STq7l/ZE/s6rtaAmQvE8X?=
 =?us-ascii?Q?f0b46xq/YxEvjCX06R2y9Zs9vw5V33EoQbGv+rf7M9r08tzl1ffx3V/9B9rY?=
 =?us-ascii?Q?kGEOsBnT1VVmucq3IPg04Ed+njNqIc6JRg3hmWIAN0XYIjfxYKJPUNHzem86?=
 =?us-ascii?Q?m0FH5LXJeX5CJMuLd/dkCQpeYBcS31nkT6WBMPxHa0jNnkj/A0xSeL0iArZ3?=
 =?us-ascii?Q?IAGk8O8qmhPIW+RI8X/DX0+HAUvnWEM+7XmfFtzniQtzRLzZOcBdbh+FRSus?=
 =?us-ascii?Q?DWwUOF+bwlsnaay9Uo3H938YNegKGMCbcp5ri2VmwaBxLMAdUmk1l3tjFdZ6?=
 =?us-ascii?Q?fv+h1hIwqx4CwQyw1iQBUUbsMH4d35V0fAFhGiqIcAnDoBBdDPMbPsj3oCfh?=
 =?us-ascii?Q?c2bFHinwIENxwh+2Js6qYYZthDe4hVdCuK5Klr8mSXaU9L1T8PZQl5CUXjE/?=
 =?us-ascii?Q?98tTxuwaRgEYPyPXuJ4kRAX6UBgeUoXCx0KhhOg/MeewzKsDjhIRoLyUvuFW?=
 =?us-ascii?Q?zR+guqxMaSm3RoP1c8BnJtfR2kflCdT8wKDYnq6pdKg7YiVgw2769hRvQewg?=
 =?us-ascii?Q?dVf3CTJl2vEE7XzmBmzW95VNv+bKTRIG5vi+oDAfk508MkfXp2mxylxGcJBE?=
 =?us-ascii?Q?mY8jxAzzWSVSyDsbKKf78d4HwUvwt3iOOUl0lOLVkaIP9hoCUoBx4Qj93XWu?=
 =?us-ascii?Q?sm7YodcGhRKt6+wPJ1chGn7Eu9mQAYqVGVVfydVOC288xwE3iDWxXAxWASmT?=
 =?us-ascii?Q?9+rSpMSc6CZIHuvejS6oIsnlNA2gClFBkEGj1yGjfOQx+1PyimHo9o3VSxKA?=
 =?us-ascii?Q?Ozu1vbhUODRMQW/zJ489r36u1go1J4a9xt/vafDf3MT9s6/gkbaYSMHyhOLP?=
 =?us-ascii?Q?RMj3jGLlOZ2nfGIQY056x6C6uz5zL/cmuPwEz3gMPuo/g6v9tNKsxEkibMwQ?=
 =?us-ascii?Q?g1M4EhVeNRIK2kivByXieKQiXEs3Pd5rkHEMIwEWfAo+sbhiOUQy1FXwUcHj?=
 =?us-ascii?Q?AxDgC+G9k5IGIOfKH3r7u3pDxxxrQU2p56GlQ+lxAu7mMntDt1RB2y3c846f?=
 =?us-ascii?Q?2EEmSgLdCRLrN274NtxHHlyXzwerT8U9tjB7vnRpVRkeLVczgQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ncMliJjqpGT8lo3A745W0lzn683ABIyzlWP1sxCSf5z5DJZUzgjNeeDostQ1?=
 =?us-ascii?Q?RgHZnWh1qam/QTlgmXhyKU4ha71l6FUa0gFluxTecNitp6IhK5yjZIYYt9Ig?=
 =?us-ascii?Q?tkuadO3vKRRmuyOz29quCLdMUY17YuRmiBBdH8Q8G+RYQ1pekCICkpZ/2u1+?=
 =?us-ascii?Q?9b5zAWO81Ett46YyqB53ltdmqhYbSD4gnQ3Da3c8PATY4xyC+EGcHnzHWU+h?=
 =?us-ascii?Q?wJ+bC+IXvACxWn4fQKt6pc3Oq4ctouvxFCFtEvFfaq80dJsgUlmFPVaayt0O?=
 =?us-ascii?Q?cVd+ozOTDb7Tz/PuSAzpRNC3FXa5em0t7jaB5q5rY2YGReH25280DigbIFWH?=
 =?us-ascii?Q?OqoWsx192PskrBsWP62PHXitLiKzsC4l0SQR2zvo+oOlwLJUznntgomUy/KW?=
 =?us-ascii?Q?Z+2xVpQcsA2OuVMCn/68sj2XktiEJeXKN9Sh1jkK4ktn6lJxgL2CLT09muiN?=
 =?us-ascii?Q?dxaRFxRyEyQkhyUNczOABPJxH81+Ll3rqnv6qjCqy3KgRApolPIwiL4g08pK?=
 =?us-ascii?Q?AOZol9flnNbEmyQOV4YlDySsfWaZBBKAZfal+1GBA8LFtz53poMfxmDRCK5r?=
 =?us-ascii?Q?wEc30YTz0Cs2CKAwXYjpUlpAo+xTl6qSk/X4aah5MsghrEwd4Ek4c+IQAdOI?=
 =?us-ascii?Q?WDpLR/A1y2OC2nnSNCJn2QTuRurAsNpKD3Bc7yS373rhlXarAptZksvR9z81?=
 =?us-ascii?Q?j6+MpcrKmWbExIqKrC6i0j/kdDYsChKw6kzKncA60epsC2c5WKVxCGdwE0kv?=
 =?us-ascii?Q?vSilFLpaF2RXBKvNq1IASCtTfSb9lAw1PSBsEhoIWZSc1Pc/8rQj5bG50vkw?=
 =?us-ascii?Q?MgT39AdTfVP1RBl04rtP/Y4JK7eeR8BQ5DOLFeu/IxyJLM+gv1D9Q8e9tuqy?=
 =?us-ascii?Q?xetdJ/mWJdU6pOhHA5MIJjK1vEWw0DlOaCC1SJKv5ZaSmdq4EHGeDw3Ud+V3?=
 =?us-ascii?Q?yKQ0/o/I/21jR5aX6wqZSjS4mzksw2AZLpIrcyke0HB0TucVGbWNgVUxtk18?=
 =?us-ascii?Q?O/fMPNzZuWvp83M+PdMURhDsV0I2jk+rD7HZEWhlxSC1O17Gc0ClodTVpAct?=
 =?us-ascii?Q?LINplYJq3k1NGA21wEgJL7WLvZ+sC4RuhJGeKluRcGrSGOIYKJqj3CRisJew?=
 =?us-ascii?Q?lm/S2wEeWx1w1FSao5U6qXsNli+ryxNnNn54WNt62m/OSMkY6Te8XXwnvcbd?=
 =?us-ascii?Q?cmvBX4/9im3dG9Y1YKZi1stnBHys9uteJohk+NHNqWL2E7zZbroTdUBGJHlj?=
 =?us-ascii?Q?XIzQaTU1gQE640REmVOM7sZTWYU7k6bQ919AVzjT8kD+KN0A8XeH433SueoF?=
 =?us-ascii?Q?MbDCgDhDpISVDkKaWLpvjruq8Aw16U3z2vX8mGGnTCN7ccutGmxHtqeUpUrw?=
 =?us-ascii?Q?ezHv62V6bCbIHNqoQ8fMRybCCdaYROq631PgNramS301E1yZGfNBZYepzShn?=
 =?us-ascii?Q?QdbYlf8/DKbbshD0onx/TyubJARk8Cl2zniTAtTP2qiXzIhmmiGRg2nk/Vpc?=
 =?us-ascii?Q?/wxnXbOiTueNZLrgQmtJL+G9afldNhlMSsUcVYPgr74a6iyPD/QiLb8uN7nJ?=
 =?us-ascii?Q?6h+0/PD0U3vW/Jta3hrr8tO7X9z4poQ8rOFOOFzottRiadMKPs0dwAy8Bwxk?=
 =?us-ascii?Q?AwduB3dsmNl/aBpsahqWcgU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de770122-7b5b-4f0d-6382-08dcb4e69ab8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:11.1767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8b8ZlzmOupPdYYwkvGgyZdkD89kTZ0rBkUrz8qFzuD2Jl8vRyyX2SzTRSH7hxr64oFpaOFl8Tx8W5nBY54zgCPEDim/40rSAaSTalLP7INDDCtGHDlVC2P5JcbroQG9y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/ca0106/ca0106_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index cf1bac7a435f1..abee20e6dab39 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -943,7 +943,7 @@ static int snd_ca0106_pcm_trigger_playback(struct snd_pcm_substream *substream,
 	}
         snd_pcm_group_for_each_entry(s, substream) {
 		if (snd_pcm_substream_chip(s) != emu ||
-		    s->stream != SNDRV_PCM_STREAM_PLAYBACK)
+		    !snd_pcm_is_playback(s))
 			continue;
 		runtime = s->runtime;
 		epcm = runtime->private_data;
-- 
2.43.0


