Return-Path: <linux-usb+bounces-32194-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB2D13949
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 16:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB1CE301D5FE
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A682DECB2;
	Mon, 12 Jan 2026 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iEaYYpL/"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58729DB88;
	Mon, 12 Jan 2026 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230011; cv=fail; b=B9P3y0t0M3pBMlkCxiboMsaaLh1UynK6S0juUU2yZd0oCy26g3ol2rnuyuoLHB5pHKAhKK/0GWdIQYS0aQNHrXaDxNXJK2+PNRjblfS/wFgI1t1f/RVlwZCTaXpFbkllYHe6ZdYyRkHyFPtxSwsFYt0VvAWNDoWQjqV5rkwkGuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230011; c=relaxed/simple;
	bh=R/i4QCKuZmLKsEEaHU3cL/URvdRRjSlvsQfRHLkYWlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FjxsNNGKwjPPRa8PGl9MEYR742tCM/geYHUAOHomuRNWgbv9V4E+YONcqZqpei/PWPSMwruxlsyH8ZNUVXLzhx+0JraKE6/HAy2M08zGJZiD8V+OhB2Li2+xJJG4JTm87dh9f7hnlKOqE/9Kuv07catfzR+WklLAFE9hFA6HFsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iEaYYpL/; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjlkF7yoVIMLoWT8Wp/DGrbP5t8Cb7xg48bT1G1Vg5EMAS7xBKAsJdMZzBV7O1QuvPvo3Sh56V63pKUnmpFuOoR6oQEITP4UBwPQgXIPXvkDCen/lzD/WhpYMylRJx5253RaoQefeMvbrMFtymrSnINDNQFHBWT87PC87Um15eltx2an9oUBUKoMBn2AjuVhfxD/DgC8ChUUD7jDBYbYpFUxp8bXves8NKpLSKaCMKCVLHAzjnv0mjKRx+3C3J2fXTw7sF0MbvmkjWf35Agn2IHPJIhlF6nnh5PyaOm2lEvsfGntV3DJsyYKpd/2WHVF585F2FJ0lTcQGWB8L8TF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KBRBYqC3xoeJr7+0GDXIZcmYqVre80TYF4svzKkyg0=;
 b=sj0jbWf9CpFOcrGFRj1zPLpfrcujJLrDe2gNQEYJL0OWzA4/G3RMbM6pzyAAS6CTsvsUvDGDaS8IwX8GMWn8cBC5YD+uUcgnBqIH+x6P5PLEwbGqeQ8DJDSRaqLblDUWt/rJj+Blzz2+KAs3bIwPwNXlPjFVmesIinIK/FNytvUP6yetKfTihD91fQLSwtaFwmYnDn3aFUjhJn8w616uIBn/S+Fmw62uSagVm3hwhE8Zovd49ttkTSo+r+pTl5l7zIjniFXTMSHFGrapIidoDkMoJvyISNTzpsZWvj5hUD3opp7mBAX72CGXfjXjl4TzPUp57+PDhg5qDqgZCYWO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KBRBYqC3xoeJr7+0GDXIZcmYqVre80TYF4svzKkyg0=;
 b=iEaYYpL/3rA5f23Gd7vVlfqE1vg945RI6+DHwfwajK3o91FsTEzZtjkGEfE90XOiAXaUSnlzhZftJ6Jbt72y9m3BsMM2sfPKN2djPXmm/sHXbDmj6HI+GydYqLhYC9R6S3qlpTXtaYIjkHuLyhJ+kNK6xO+fdFAfN9BIEt2lEQaBMk+P0LKF0OWD7k8aBpd2w08XtsShJc310NFaP+uqojs8HoEoQScDggzdepnUE+e6xjM3sUMf4+3cphymIbdmw2/tKLG0ICuWh1P+RoWKi6SrstSTkUb20vEcXzQ6wfIivfCgT4DwvoQauhyc8ycAqcsUdFGCoxikgbcs8W6MeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB9707.eurprd04.prod.outlook.com (2603:10a6:102:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:00:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 15:00:06 +0000
Date: Mon, 12 Jan 2026 10:00:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>, jun.li@nxp.com,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] usb: gadget: uvc: retry vb2_reqbufs() with
 vb_vmalloc_memops if use_sg fail
Message-ID: <aWUMcbmtVCECDyhc@lizhi-Precision-Tower-5810>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
 <20260108-uvc-gadget-fix-patch-v1-4-8b571e5033cc@nxp.com>
 <aV/YSGHubVjaZBzz@lizhi-Precision-Tower-5810>
 <cmdnbwc2frixbmpy52g2ywspurtsbcj7xqutv4cptychnl2com@l74jy7kcquvt>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cmdnbwc2frixbmpy52g2ywspurtsbcj7xqutv4cptychnl2com@l74jy7kcquvt>
X-ClientProxiedBy: SA1PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::25) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: b7905740-a274-4bf3-57ac-08de51eb45aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5v4/vZVFI7YM2QjZcnqlXkglzXNK/1j583f0xfFFb8jwqQ1Wv4TNOYyITYJV?=
 =?us-ascii?Q?IHt03YhHUWHTN7y0B+KHBXATL2gT345ue+sU7U92W/aigOHEPSuVGSdXOgck?=
 =?us-ascii?Q?PxwlZXUl8S9PbUmltDVzLVLeig1zCbUAjLlmhH483jsfqQ3wgMD0b8Zw4VT8?=
 =?us-ascii?Q?XyTwdz9UDUcwfgiaemsSacDR3r2ab4nx6srTuH7ZJMCmLXkW9jFnfFppB8gv?=
 =?us-ascii?Q?ii6VWD9riMVJmwSWXp01Mwu9wtjUvI0Yl4YF7XKQOcOu8iFr/1+KpdB/3Jdi?=
 =?us-ascii?Q?rW5hWLeMAhzKhBi/KcJefzLA7zgMnjUtBq/YvN/WVT08i3EZks94FAyS8INw?=
 =?us-ascii?Q?qxvyKd96XDSj1BVeVm/uyoCpwQTxjoWDVWNo4AqFdF1VjO5IRgynM16tteds?=
 =?us-ascii?Q?uiEqptaWsLIWzASzItU8J4mX2TJsXiB1GNWXl9dp0i6IdJYiSrGKPzqpKEiO?=
 =?us-ascii?Q?f+FOgZe1XU9kw2PTkXRoVTM7uZ9U8jY/4R1qLR+Xj9ca57d0tLl4JE4Llg9Y?=
 =?us-ascii?Q?UhDoKvMDNMT+PTzsR8tYP8o8jrLmRbA4keALY4hGamWeVctqUTSqxFrUoZAP?=
 =?us-ascii?Q?kkeWegbJEhrNMQzu2waoKF6blABAPUx67104mXnt8wuDCHu9btHU2izuMuN1?=
 =?us-ascii?Q?nmETOy5Z7LXWWls09j2EsuqOokDMFg4maz0s87p1bPXVsp7yWsYGJD4gA2S8?=
 =?us-ascii?Q?LfybPlOZS/qBVd70+yB5lWFzyH/p/p/GTO86fJCSG2ywberFajRlxbg90iZ/?=
 =?us-ascii?Q?kRCR6ORoXYnzuDspRU3ZR5DdujN5sweAYHvXbwvQVLB/1i3Cp18GTu3EYqCC?=
 =?us-ascii?Q?KkC8IkY2O/FCCytZ5eUHRLrgDsWNlFXY1cOyV+vYzrAGbh/ZxuyS230IZmVX?=
 =?us-ascii?Q?ycUrzfayACkI3Ej6UK7BO8tBOvY4xOqegwu501d/PvuicnFkjZgkpUD1sUfC?=
 =?us-ascii?Q?ZZBlhOW26eGmsIToa4diw1ONys/vBwt6Fy1F9peGSm4G1wgqBpz9pfl+DqEr?=
 =?us-ascii?Q?8izxi6vEHU5v/G0vDz//0/E0I5R6RBa8g4L+dIs6CsoVZPj0jLikP0351E04?=
 =?us-ascii?Q?nHMIyc4GLOMsOXLa/tPWGG/zyw7d7r/xyNoSEXwOfZVoIf3Qhq1FKrEnRe7o?=
 =?us-ascii?Q?J+80x05waJ79sBEaBX7RV7Qc/v9+9gVRfY73t1sBoD4U+JoUZSCsAxcRTO70?=
 =?us-ascii?Q?Hr9VjxoehHAeqyan9XPS0zp/2JIAHAwROEMcsfaBCbqSMVHXSrf0nm2xjs6+?=
 =?us-ascii?Q?wjv8+O7msEs7WBbUSS6q2qaajCsGk6K6L1ZYBJscS770XmxF2IMgC6efaTtU?=
 =?us-ascii?Q?Lz1YNm4HEGPm6J+Y3Ps+7r3JJfRkBGssVL1dVUYm8ArMe/kP+cMfJu83t5Yo?=
 =?us-ascii?Q?WqfUZx4Oix3FZsdS9DS7EFTVQ1BsX/QkB8Zu2rZxtW5nmCquCdqaJjFQZqTl?=
 =?us-ascii?Q?Ya5xFln3g3BbL5lET9rTqwyO069KLgMjF1YgsQ8PwFzESvvcbM2HSuvJ2Od+?=
 =?us-ascii?Q?hioo0YgvfKhCWtDz/ZU9F4qemum1KNRXRIIOSeI/ABLkeBfZ4v/I6akBZw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tn7VE1OPXaIknz8XxPK5614bNeGuZscJmfZ1TFCugPV3TWy0KKk2lzopCT19?=
 =?us-ascii?Q?QjdYboR6HeF0UxWD/RlPo6MbqmKW0B1bNmPHM1ALvmzhZ17F6m1M+hPR8Rgy?=
 =?us-ascii?Q?8mDNoy9yU1GHakbRDQXb3RGW9Ctw44DYPIdYP//ZTWOKs1WQqStLXyU6yCiE?=
 =?us-ascii?Q?zPv2vDImIB/VivS3nm0XVFz84kBJk9M66Y/jJR/oG1Latta7kJHf3Ys7bVJl?=
 =?us-ascii?Q?tPMdxdCu05N9043QyZKDm9LIEL9nEESbiqpwTBfzJQk17GNtU/hoW14rLfq5?=
 =?us-ascii?Q?1aqB4kmDTgwdiWRcGIgRyMA5HrQJWO4fBGJHonhPBmYIqUHRtX8KSRjubnDT?=
 =?us-ascii?Q?9Pt9/OJXB0aoBTgr/O9Hdgz2zGrbQM/pt8xhFTjOsO1BfFmJ6+TnK6L7hojr?=
 =?us-ascii?Q?x0EgunGbVDADY6jURe4pOvyTrkqHhR9u/aKJdTaD/ZNx6kUKlU099BhSfr/u?=
 =?us-ascii?Q?iFQAIAI4BeZhh3EsSJLYdV50qiuloQYq3tmHavtDy4izJTxR15+1Ileyqn1b?=
 =?us-ascii?Q?UB3P/f4CtFUfYZyka+zOqYQeJS8p4qb8GWXEyGGIFYBxdMqA7bUjLn0NvJJi?=
 =?us-ascii?Q?DRmzxLF+vgtzbPPyDrkngdH0Te2Ifhtx/NFVZbCkOgxtJG/iEIZwFXRrgDaK?=
 =?us-ascii?Q?uHIeQSW+8VEavmmxnYke0Gmtcwd/BCf2rgMs47ndJtTntuBHwOKG/CM49TgT?=
 =?us-ascii?Q?O8mVpwjgM+v2l6iz4b4oD879oaXZUA03pmZf9y21EwJrRtbTGgdKQFLWTubc?=
 =?us-ascii?Q?adtAbVuQ9+RNydapHj3q4j4WWpfaa8tazaM17BGxK6mPpD8gofKe0NbV0WxD?=
 =?us-ascii?Q?/tR4zVOMmmX1wrTpWNMs0zwBxiS2c0zmzhN/xB8jHPspTOmmq28pfBeX2bHA?=
 =?us-ascii?Q?d1g/cU53V+/+iagD0RQYiko42dQArLEFd6W2IL0KPu5NqqyNEM8sXPDmNRpI?=
 =?us-ascii?Q?xknoLdp93orVLxgit1cFhYCMupEF33i1lPZCh0nn3trGi6uLDDFSU+/oGSHa?=
 =?us-ascii?Q?KUjICCheODjQilFyEGys8MPn+4mYH81n/xQsEj/olxlMMHe7+pVdGLEdZhVB?=
 =?us-ascii?Q?4uUCirER9qme7hLbychOLZglOpbc45jBtrDTKVkc/TrJCSfXJR4/PRedc0Jz?=
 =?us-ascii?Q?W4xV17Z8NimhFJBmp7dXFedClDQJoysdZsc6U8YzCtqQF8FGh9SeP4CprwHt?=
 =?us-ascii?Q?3QxgmrWG2dG+/1gxE1iUMNI7way8SCpgXbo1/Tsx3bOADyU1R0vCYYlTw/dq?=
 =?us-ascii?Q?9XGGUfoBaniDxlsgglH5peE8InNFpnSMvtaPe+v+CMQc9jmbDEVN9xZt1wWa?=
 =?us-ascii?Q?usAjEsj1Gq9QtPUBkB4XzPMMTEvpjSc+H+qAFJz1GFD9LNwOwEqnfR+sU6nW?=
 =?us-ascii?Q?6/8Y5Fz0RpjyCC/x0iOgk9hP8Y6tKcTyMcRLHksYrEHZU3zKTOLVa3Th8y58?=
 =?us-ascii?Q?k0xRb+etXBxYbvZhbsXAIBSIJTDgfkbKNoHVoA1r0+55LvR9Q3V0WMSs57Dl?=
 =?us-ascii?Q?pCdK7kB+uX0zmrzsju9GfKpdRkVZ8JQmSP8UG8zobG3XcaN+nVKu33CbFlBm?=
 =?us-ascii?Q?hohd1IQJp4vnUE2iZJKG4CjSFe008kfSUWUUdqzf5Ppk7UjfY1lu/XyD/n13?=
 =?us-ascii?Q?Aa/nuZVr3Yys4ZjIKdik8V8WsRGqDQr1r8+fSn22d1ia91EJM7XbDBqUC1dQ?=
 =?us-ascii?Q?+cGUynb3IEZDPXvHQRC+TDagsTXXdIRjQ8TzvNM+L1rTD2221M/0lre8p3N4?=
 =?us-ascii?Q?89+Pxt8SDw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7905740-a274-4bf3-57ac-08de51eb45aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:00:06.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAI5L0rdP2HJ8wFlqp8k1Uy5Mr9p2dtqWyI6dGf71luoQcwQye5VGRNC27lNvp3fp1dWytLFEk173jQ1ltA4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9707

On Mon, Jan 12, 2026 at 06:05:40PM +0800, Xu Yang wrote:
> On Thu, Jan 08, 2026 at 11:16:08AM -0500, Frank Li wrote:
> > On Thu, Jan 08, 2026 at 03:43:05PM +0800, Xu Yang wrote:
> > > Based on the reality[1][2] that vb2_dma_sg_alloc() can't alloc buffer with
> > > device DMA limits, those device will always get below error: "swiotlb
> > > buffer is full (sz: 393216 bytes), total 65536 (slots), used 2358 (slots)"
> > > and the uvc gadget function can't work at all.
> > >
> > > The videobuf2-dma-sg.c driver doesn't has a formal improve about this issue
> > > till now. To workaround the issue, lets retry vb2_reqbufs() with
> > > vb_vmalloc_memops if it fails to allocate buffer with vb2_dma_sg_memops.
> > >
> > > Link[1]: https://lore.kernel.org/linux-media/20230828075420.2009568-1-anle.pan@nxp.com/
> > > Link[2]: https://lore.kernel.org/linux-media/20230914145812.12851-1-hui.fang@nxp.com/
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/gadget/function/uvc_queue.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
> > > index 21d80322cb6148ed87eb77f453a1f1644e4923ae..586e5524c171f115d98af5dda43fb800466f46d2 100644
> > > --- a/drivers/usb/gadget/function/uvc_queue.c
> > > +++ b/drivers/usb/gadget/function/uvc_queue.c
> > > @@ -182,7 +182,15 @@ int uvcg_alloc_buffers(struct uvc_video_queue *queue,
> > >  {
> > >  	int ret;
> > >
> > > +retry:
> > >  	ret = vb2_reqbufs(&queue->queue, rb);
> > > +	if (ret < 0 && queue->use_sg) {
> > > +		uvc_trace(UVC_TRACE_IOCTL,
> > > +			  "failed to alloc buffer with sg enabled, try non-sg mode\n");
> > > +		queue->use_sg = 0;
> > > +		queue->queue.mem_ops = &vb2_vmalloc_memops;
> >
> > How it work if dma_sg_alloc() failure,  vmalloc success, follow dma_map()
> > should be failure for vmalloc()
>
> The point is the videobuf2 subsystem doesn't do dma_map() on vmalloc returned big buffer,
> however, it do it for dma_sg returned buffer.
>
> If use vmalloced buffer, UVC gadget already allocate some small buffer for each usb_request
> to do dma transfer, so uvc driver will memcopy data from big buffer to small buffer.

Need add such information to commit message.

Frank

>
> If use dma-sg-ed buffer, uvc driver won't memcopy data, instead it will use part of sg
> buffer each time.
>
> Then USB system will do usb_gadget_map_request() again before each transfer.
>
> Thanks,
> Xu Yang
>
> >
> > Frank
> >
> > > +		goto retry;
> > > +	}
> > >
> > >  	return ret ? ret : rb->count;
> > >  }
> > >
> > > --
> > > 2.34.1
> > >

