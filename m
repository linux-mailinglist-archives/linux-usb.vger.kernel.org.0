Return-Path: <linux-usb+bounces-32180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28AD11C2C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 11:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4CCC3075F22
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 10:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862EC29BD89;
	Mon, 12 Jan 2026 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d/uCibHY"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A929A9F9;
	Mon, 12 Jan 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212777; cv=fail; b=bxbz15xjes3ALDpc/xF5BGE5PHzQYQXzPwGGl4Y/dw2L/P3HvjQttgomH4Rm7IfDaRqgDHXLT9GuFH9pA7ry/cpv2jIxWhh7Tjf++wIq2yjpEBEWhvrbojepnq0X6zy+uTteoXG4I4S1fHzE+y/xx1Go2gFoUs/wS3wVaH1opaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212777; c=relaxed/simple;
	bh=B9IXiS8KnxaC7KjSKs6Ca5vG77z2oFaycFUUTqr4zCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eAS9MjUbZjv4oIgT/EUKBybtsaglimeZ4zDWPlx8apfLDtgG1+6ctU3PDJ4d+jdJiRDSXmcWCWVvKrDR1H475xZ60lWJBVtthznAG/sn1htHut7ZaGow3UjsW5kH4PIXnmtFJ0ECoYpdaiX+367SMff8Zo+mjReJ8WqqkIepP2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d/uCibHY; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5iQNdFpRglCjuRJVGstkpQUOeNnOIJT0FZTb3wAc/q8TamDf2JwR3GAnHo8cGJPaBpfdw3Nta+WxUzY5o8VB+SzzWMMReqXuZuvS397uoCaQFEg+8PGtsbEiYbKVSV61MRen6WDZTNYbxSuXEmkjpL0oaB9lOGgF23SHFgGK7YhAKNtdaWjYJ31zeAIqQJhNCK+6FXKES4wa3zobr8h7zD1bIepdP+v6sqYpghH4NNTJ3wQjlVcDG8iZ14VESZZ/J76VEsS9ElMVsH3Ib8rMOQLMmajbX4NXy44A1DNl61NQQ75Wtsa1SkH10wPBLhqUntpBu3yrmzzddySPRczGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRyuku/AlXzyQn+pnenp/eyH9htOKib7dcofE8UYsO8=;
 b=gfyrtRM923o4BBGTLbwtM+dTEtNT3xKtMaVs1qrLjVZJj8ELe8pSPF3bkVaXDLNh+VwfQyGbJqPylqRbddAGSST5ebEK67wqfszl6zvib/S/X9RHm9Sk1roGXE36tQsJ+lRefm+1uZ9QcX9uJKjpsjhKbu3mMuz3BJ94lc76sZYF/532OKzTWfn+SHltJYwmGSKncFhRCiwTkugB6lZASy1Ku2JsO/5BdKbpwIixq5nRBKq0RugCEVzv2beMI5buYlGRfYOjSZNfPW6v9PcMQUDUBETYQPZETfARIneNown7jDxdoYWEx9FGbDPR3dd2QzDLiCDnM+wsl4QW5iRHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRyuku/AlXzyQn+pnenp/eyH9htOKib7dcofE8UYsO8=;
 b=d/uCibHYE4jrSPL2MNBEsXfSnwyQ1NYTzmsN2GcMfOuiFyxMGpRboAI4k73CAHICOyBA1cLYV1YrjNzmJRyOCMHWR/43KxZGkRnN9QdsYN1YFnwzdR0oQtp3bP0kJkcWirdyNiVwUVZ0prHJtHeT9XpZVt0KBHYci7bkV8LPpbE3DXZBAcGqvV1TeSOCNNsG3+6Nsbc03InU3cWB8UdXN7PZYOhWaCPAQExlImqGIrifdjQdXeTf7gCr+6Yu3MTTQQ/BtaUOWb1rUTIRDsETU64udzfKx5O940DiafS2ikwfVxIj/5/0t32/Xf/ZGvyPyqoBCCEhydFkeVeuLZIpzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9137.eurprd04.prod.outlook.com (2603:10a6:102:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:12:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 10:12:52 +0000
Date: Mon, 12 Jan 2026 18:05:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, jun.li@nxp.com, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: gadget: uvc: retry vb2_reqbufs() with
 vb_vmalloc_memops if use_sg fail
Message-ID: <cmdnbwc2frixbmpy52g2ywspurtsbcj7xqutv4cptychnl2com@l74jy7kcquvt>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
 <20260108-uvc-gadget-fix-patch-v1-4-8b571e5033cc@nxp.com>
 <aV/YSGHubVjaZBzz@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV/YSGHubVjaZBzz@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: ce02f64e-e696-4e9c-12e2-08de51c3259a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?acngGkLXA436vnKCVDnoqD/hEoZg0TyTCDHi0LHZMg80CEYfCjFF2EXxDecU?=
 =?us-ascii?Q?ucVr4GtP7pDsvdBYcAAjDrwyIV+u0YIHbswfD/QkkzalB9agVLiReYRyYjWE?=
 =?us-ascii?Q?VcBlMjtFCfJtuvXlR/ZzZf/ycaXB8u/Y7PNEe3Q14pVfyYKg7E0L8va4kiGy?=
 =?us-ascii?Q?xSj2zrF6DcneNKTln2wFdj9ifyhk1rqyhwyoDSZwwjwOlyxbC5//1lnijHJE?=
 =?us-ascii?Q?xc8Nd6flF0UBJ4WsSwjIm1dfBvIvgNRZbl8SKFxiJDOo/uEhFk8DqPFqjX6H?=
 =?us-ascii?Q?vTypqM27kHNH31vJsBMcEIbTNNSHSmmrfgNsYC12s4jRbDUsDNDTGAmmLlG2?=
 =?us-ascii?Q?MA+CGRjm02qpUMBqohyWo3SSD3vgbI9B8V/KZRy+4yo/PCBc0hFIXaqGLDlj?=
 =?us-ascii?Q?1GOGhJRtQ2O3kL+oCJF0EQh43Sgy3WoYU1jgs/M6t4QTLqhdeBSQUAKExpWV?=
 =?us-ascii?Q?ie1tfxvTleoL8/QN/CSBvqbkYX5YouBnA+deVyvK8Zp9xaS7GDutOU1nEsH4?=
 =?us-ascii?Q?Ch27ommEJCChcis5UiLKFS6h+LkNIiohgw6w7BeSm2BXyr/mpZksPQ+T/L3E?=
 =?us-ascii?Q?7+HhVHDhOt1fYPP8ZGQpPaK1RwzGE2FVY+Ca9tQ+LcW5dYCiTaDsUCW+AZtU?=
 =?us-ascii?Q?eKgQQK4laNVcNCIqFFCq8h1w955hQqyIHrO75Hf4SN1NZq93ZCEype0AGY8U?=
 =?us-ascii?Q?YiA75ZTTwEzr2lcn5YtdSoOKEAD/sblFpcOAzP1GkEnS1OEXk56/wyQBbGVQ?=
 =?us-ascii?Q?YMzrih98IylsT8b4//iOgECt8NZ4jSXuhP8Nt+nuqdIhROc4MrgnZ5PsyX++?=
 =?us-ascii?Q?Rb58aMN0IzUpo1Rz3c9J+iXcfKVdPi/oYilwpCJb8t0idygZuRL/6mDMQzqx?=
 =?us-ascii?Q?G631wzMcvBTPsJ2YKlklNmiSXVXB1rBlmyqmspoldxEuiJw3yzLLz+hAtmWk?=
 =?us-ascii?Q?nIazXjcSMm+bz3P12X/yrkMCxur1WYFjfeqr/XhSByXaLHYGtqBG3z7phoPW?=
 =?us-ascii?Q?HRMdDonhhGp0ddTg2mjQdCoEy1R9GonrqW6T3ND22OEJZ8Ma53PqwO22a3Du?=
 =?us-ascii?Q?U5b05C06GkOiXyEtShGH3/tc2wlPCdN8fM5f/pYw6cVx6JLKdWUt1H65NdRA?=
 =?us-ascii?Q?wtz+3vU0gsDZqef+1O2JnV2eBSWNoBruoz3Ni5nZ4b0w1qIHnheA1020oBvz?=
 =?us-ascii?Q?Ei/22s2QZKK9zh0khPzGbhMGW+3XRAjQ6GhecshYmS6+oTZ8A7yQZIU6zAgW?=
 =?us-ascii?Q?xNP58YGFuomWTsPjonrXn/8WKa7m3qfFItmYERN2IPOzDB5OHThM66cKp9Fs?=
 =?us-ascii?Q?MZNWBJPb2HrhfFiFjQ3GXZlkgWZxOINv4YfKtyAbOJoqVnI7S26ZguQzPQOf?=
 =?us-ascii?Q?4qFI77vtjMANgtF+MrDs3i+thF/7rWQZQg6mQgOVZWqdn2t0XB9ymUiKaiGy?=
 =?us-ascii?Q?h/6roVH5DT/aUzZg1DlcgDB6IHF1067Fn801uqzFkIi+0CIDj236rGC4npEI?=
 =?us-ascii?Q?Y9HpHEVoRAZbfymhmpHMo02MN2AMyiOz4IHurMnkldwWxtAMDJ6kPrmkSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bm02KukaGJXabeAMiOlRSo4XM/1CIYPBBUyoqC0/R9DEe+swGTU3tgAPd2it?=
 =?us-ascii?Q?NXvVAAz1JeUYG4WeFaeGfw8EMmnNbOIuWyfKZf37fu8PyyJJtBsyLzeA85oj?=
 =?us-ascii?Q?4i8d+xdALmj3ihCumGHfRXtvAxJl/EqCmrag3HfHosHgUvKzjv2Xhgu4IKwT?=
 =?us-ascii?Q?pBnKPMkoOXzn6WYwEulIVgwlMlBLNcj3PO+u88blnCws8s3uKYful57ZH7T+?=
 =?us-ascii?Q?vw3d+1CyCPESQeJpIseQciWoUOcTUpKy8LpVOJoDOwvUlFHuc79wu850btEw?=
 =?us-ascii?Q?gmmtlxcDN2G6HxVwnZFv9N5h95rTdRz0lmrKVeMzaxr5Tg2Cz5nuqeBS+gi0?=
 =?us-ascii?Q?JJABcArPSghkApbIS6hIZEH1oyLJSfYGzj3xHSSKyUAd/D+CmdfC9nCrfpDO?=
 =?us-ascii?Q?00F1i6FtG7T6ec1jmGMVzxgN8mr+KePBs4QUr0kMnxo9a3UbF54Fft+/02PC?=
 =?us-ascii?Q?IKh07tTwwbnAfVsNGMEkdWXQcEgdara0xQepJy5cpyJEQNXPOt0y5XD0+R15?=
 =?us-ascii?Q?rHUfRiKXs0Nw1zXa1ZQRuo5n6eoRgEptVbDrQelefLAOvsJxA0Noc+Un6M+s?=
 =?us-ascii?Q?l0HuYS+hOANv+YLaTf7ovw72a2QaJa8PH4OWKsLCiU/d4Db+LkXWk6pLkJqm?=
 =?us-ascii?Q?+8JCySMMtG1MBDG0ir4St2AavUHQ7HHQQ2MaUskP2ZU3RTwz+isiCyeywF1E?=
 =?us-ascii?Q?wP5kwm4aW6FE1/95p07Daig4ql7r73pGTec6sim5i/7vYGe/2tgK7T66x17k?=
 =?us-ascii?Q?Vqn5M6YSdXbWyP1WiniGFN7h2CO08MOIUwZfJx/X3jyPlLL0AY/4pis6eAcD?=
 =?us-ascii?Q?p3u6R2rLO7nWhrB34t6C09ohotg3pA7TFB+HahBLVYB0AdEk2LdG6Y5xTVBM?=
 =?us-ascii?Q?WHB0QJ5k+jxVKBbGm0ZifuAnjkWj0imqrPfBRiGoKJ9T27YUyc3Q99g1eMH/?=
 =?us-ascii?Q?qZnVSWpkIt4TpSDY7JsFcGrjdA8XjcxvZO9mZkLgBmTB0Ee0w/CCqiT6xsYZ?=
 =?us-ascii?Q?wKC7O3r9loHXVGEkpNtZjA3Y7gNBwLUGCRZb+o2KLrGQkm7RLGcNuuNsUsxC?=
 =?us-ascii?Q?2guNlYNewkPy4SYYE2iKYziHumB0zBxApc6LzZMzAWYQ4YtQaP41t29UUY0b?=
 =?us-ascii?Q?1woLtn8dNyQRmyHF/TjL1ecCyPeuwq7ntBKu4S0tRQXpf9xw7gY1traraovg?=
 =?us-ascii?Q?2jP+nnDNmMwCpTnoiBTYoiLbcmE5uQNaDzoa0BXQDfJhFNNEewD8sRU7ZkSK?=
 =?us-ascii?Q?E0f0Fj6Ks8NlxmkKYAQZUUAGGe0c/N1c5cVXlXKc4Z31Mxynkktu8eKMeN9f?=
 =?us-ascii?Q?8j77FpBIZpP6c3G+6c5LcroAlCjsiKoZkiG1Q0FFCxYZerTAKuycnWEHreAv?=
 =?us-ascii?Q?NZmmK512zco/xT1TB6uVwNxi/tL/tLU2Uc3YRMHPzlrkD75V57RNVuBxqNCy?=
 =?us-ascii?Q?AVup3Iu3B0eQQGe3zfSy+pr3CXPrhd0owx3i5Z12XYrhafA3jQ75Mp8LisE4?=
 =?us-ascii?Q?+AcZkjqCg2dD7yEQtzXDFRoopzqob3LOFv8FU9PiBs46dVW2QUi3/7zIr4MW?=
 =?us-ascii?Q?ZmhL80jZBozE5WtUH3BRybi+BW26bdumEus6YH1AZUPEcfPC+Fy41EpNR3pi?=
 =?us-ascii?Q?SVjI2Z0Sl3IUYTUYu7IxVK+BmV07qWPfESWJOfMVxcLXdxNvIcYLXQy6FW7+?=
 =?us-ascii?Q?ONOxO7RVeYz47hvaCEMVN4lsheN1y6n9rUtUEYQFNbT0VA9LHlnKfSgx6wjq?=
 =?us-ascii?Q?xWqSoSggMw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce02f64e-e696-4e9c-12e2-08de51c3259a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:12:52.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djIftKThVPqQqHPULY15wd2wQaFlhJEdSE9fegmm+DZd1tAjwNzCIbz1W5h6i6GyENCVEWCd60JI+3E6FNvLQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9137

On Thu, Jan 08, 2026 at 11:16:08AM -0500, Frank Li wrote:
> On Thu, Jan 08, 2026 at 03:43:05PM +0800, Xu Yang wrote:
> > Based on the reality[1][2] that vb2_dma_sg_alloc() can't alloc buffer with
> > device DMA limits, those device will always get below error: "swiotlb
> > buffer is full (sz: 393216 bytes), total 65536 (slots), used 2358 (slots)"
> > and the uvc gadget function can't work at all.
> >
> > The videobuf2-dma-sg.c driver doesn't has a formal improve about this issue
> > till now. To workaround the issue, lets retry vb2_reqbufs() with
> > vb_vmalloc_memops if it fails to allocate buffer with vb2_dma_sg_memops.
> >
> > Link[1]: https://lore.kernel.org/linux-media/20230828075420.2009568-1-anle.pan@nxp.com/
> > Link[2]: https://lore.kernel.org/linux-media/20230914145812.12851-1-hui.fang@nxp.com/
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/gadget/function/uvc_queue.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> > index 21d80322cb6148ed87eb77f453a1f1644e4923ae..586e5524c171f115d98af5dda43fb800466f46d2 100644
> > --- a/drivers/usb/gadget/function/uvc_queue.c
> > +++ b/drivers/usb/gadget/function/uvc_queue.c
> > @@ -182,7 +182,15 @@ int uvcg_alloc_buffers(struct uvc_video_queue *queue,
> >  {
> >  	int ret;
> >
> > +retry:
> >  	ret = vb2_reqbufs(&queue->queue, rb);
> > +	if (ret < 0 && queue->use_sg) {
> > +		uvc_trace(UVC_TRACE_IOCTL,
> > +			  "failed to alloc buffer with sg enabled, try non-sg mode\n");
> > +		queue->use_sg = 0;
> > +		queue->queue.mem_ops = &vb2_vmalloc_memops;
> 
> How it work if dma_sg_alloc() failure,  vmalloc success, follow dma_map()
> should be failure for vmalloc()

The point is the videobuf2 subsystem doesn't do dma_map() on vmalloc returned big buffer,
however, it do it for dma_sg returned buffer. 

If use vmalloced buffer, UVC gadget already allocate some small buffer for each usb_request
to do dma transfer, so uvc driver will memcopy data from big buffer to small buffer.

If use dma-sg-ed buffer, uvc driver won't memcopy data, instead it will use part of sg
buffer each time.

Then USB system will do usb_gadget_map_request() again before each transfer.

Thanks,
Xu Yang

> 
> Frank
> 
> > +		goto retry;
> > +	}
> >
> >  	return ret ? ret : rb->count;
> >  }
> >
> > --
> > 2.34.1
> >

