Return-Path: <linux-usb+bounces-13489-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDABE9527CD
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 04:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CBF81C208C9
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2024 02:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BD879EA;
	Thu, 15 Aug 2024 02:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ITPrcFxn"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23D23D9E
	for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2024 02:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687409; cv=fail; b=bPxDDF3rsMIhi+ht7SOY1EAvSLVP4r0KaTNdCHHEHNAySDR2hGSK8YouUq21txDUP8oBk6jBg8rzwgqPQ0L5bKP7BYRlV/EhQ5HQmmvkOghcKPnScWiTKNJ5WhgSnBYzNVngBdRkhnqLT9lD38IfsxMuFpSQomMwbNl/K/ZWK2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687409; c=relaxed/simple;
	bh=8Qd5YcV2qMAdtOarMgKVrQo55aQvAOS+sSkYE+6cwYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kM/rDVmGcslPylogl1POLu6QKiaLeFneeX93WNZZ9Hndy1lI+VWWalrSSvCOQgHK4YCfxknbfCkWaZy+p7GqDfdPugyisMruGzKsamy4Z8UCXLof/YpVLdvPMceoqybm3KFC44Oqo1WrY3+SNW0/1IogSIN8NXx0Vlvi0zyWmN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ITPrcFxn; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnLWSqV1KKRgu/Tfd39wntsHDd5QilMCggfKehE1C8JsMdieKsYAbnDaF6stJCMxV/cuZgvDBaCyLVhNZRJLZXKBy48+EffkUFRq3ufcuENNrHRzlfKHACMs8Gmyaize0guvxGgvVHR89NjTA4FmNNZmWrzeUNZtwjjK/92QRir6to4m2j8v76KRrGLPM3EGHSA9V+LwLU/NQFa61wmZyIDZ8kRMMVtrqOlQ/VbZELP1LmTjUpyDi/od12lzq5D6po2w9qXVw6SZ6TB9RIHirItbMoOZe49U/rZjSjfO6LyTpoB6Vpw73+JFiOEDyv2ilz2/crbYXj9MfHav/IS/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUIXML7qJH1he99Bxu+pzsBa5Lfnle/2VysPoCpF0AY=;
 b=NTQq3Ngc6J/+3TGpV7SqWvfZn8tvSuK78gVyI8rblzsEvCqV1ADILqmbHZ89B3XrRQ6MfFdOtsSxbQtd7bQmPtjcO5xKBcfvq7rJYDdNuJj3dVD1e5XZfcMJf/3Fc9jElEEWNEM6aIJfv8rsXug7G8FVuSw4avaGzgTJ3VoOPUXMgFKSzHwD2pNx7ZWzgCXCJrAWeJaHotP+utT6lroWmjikFcEGyPT7Z2xCIHdgSow+rNF0irLhwen1WjQw1WN3bwilpP73Fv0ITJl+Qmn/sCfP5umtp4iFKub9P2ZvCwoNFyWfH7vurQT3Jeus8JiSz99z3GjoYAcez3aygiV7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUIXML7qJH1he99Bxu+pzsBa5Lfnle/2VysPoCpF0AY=;
 b=ITPrcFxnYIk4z1pUIimDC7kGvdB2sDx33kiXvU7kDrj4jfK5YZZomyNDpAQqpvnsI8c9VS9rLztPx4OFyV9/JhCU05uvuyBIOc8H9imgFSSl6nQ8dz1HIZJfxEygoTo28XUfoMCK0PebOYJN9QUaMYs7b/6CImx2j5Zc/zUE+bedywOggS78RFeyxAVwPCfAoz/gfci+BElI9Eg1S/QWhv5/m5wWoIAbROfjOl8suu24IbTjFb9t7ntZDf65ErvpmGCNrcr+jnR/kYIgX1efX31zptVqmzHHbo6yZ2edT7S++4HW5q/wbhJzZe1/XHJZDoL7gPmHGNogIyrlhphf7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 02:03:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 02:03:24 +0000
Date: Thu, 15 Aug 2024 10:02:36 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	m.grzeschik@pengutronix.de, jun.li@nxp.com, imx@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: Re: [RESEND] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Message-ID: <20240815020236.meup3tfj46mni7rp@hippo>
References: <20240814112537.2608949-1-xu.yang_2@nxp.com>
 <2024081405-sample-duckbill-ffec@gregkh>
 <20240814134802.tksdhu7yexuuknqy@hippo>
 <2024081438-power-surplus-d4d4@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024081438-power-surplus-d4d4@gregkh>
X-ClientProxiedBy: AM0PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:208:55::36) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfeffb1-b364-4503-2bd9-08dcbcce71b2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/7LcX6bnxLYlnvW7hhIMsFKpwg/hWfqBWII+7kUL0Ey6d/EQujM8CFVTdtZA?=
 =?us-ascii?Q?5AMVc5UDKwdwdG/xZw/JG/Io2WBf54fSlWfqfQLBIHmOorBNkv+2HdxTCwU3?=
 =?us-ascii?Q?lpi8VItmT7mHjD4bwa4rU12AgUVUst067jswlPG0PIT1OfcpZ+3cbQhj5TgF?=
 =?us-ascii?Q?gqZue7hy3pxUXwSscwPjYX6XUwOf1x0OvvddFTn7Vrh2ouyIt2IZWic872EP?=
 =?us-ascii?Q?0jw13bVtoZlvAXh6v9SKhJ1NsniIFdEB1D4ZZEQyClPvVp3fktk5RyeFAy+4?=
 =?us-ascii?Q?E8ikXN+mCYgX7WDHR+IkYyd33Eh9+OPkXp0sNOjQVqDQitzE3vYe+VlERRd0?=
 =?us-ascii?Q?y6+S0lA0LdudX5zTyCprdan1BlQGmeZkAE7LUgtRw8yCqu9/DznPMWNZqJ/U?=
 =?us-ascii?Q?BLuPh+Kk9YqA0r9Gol0jFLHHuWZDdGQhHdAt7VvY1ZQGu8f5IcGjsrrin8s+?=
 =?us-ascii?Q?lKOS5pTnLLdaIf7Eo5S2KGs3e/K1d2d7pe/PUseSFQueBw+/A/EGS95SGz9R?=
 =?us-ascii?Q?IOYsS5iDfkVxwEv3GSFJbhuoBYXLrFlIZl2dfPeGOcNxZEJqQxUN80owd3SN?=
 =?us-ascii?Q?y7CA548YrivBkTTVGHG4gKp3GUppIeTqSKIH9zgmgkOzPCefvbeQ32JgL/T2?=
 =?us-ascii?Q?/BgyqTr+wI6lUxEk+9n5YSBsugnwbnwGoO7BjDYxzZjw3+L7vfiTEcLroq9W?=
 =?us-ascii?Q?4slp6ebRB1rDKKiZSp7RaIQ7dk/oGDyb2qD7/WFz/1/FgNwtNJnWSxeqiYH3?=
 =?us-ascii?Q?acV+hAi8c5xd1USWlroBPXz8LFH0qBVyPnMJkBEqOdlOIoAOhxxDTAyiNdQt?=
 =?us-ascii?Q?nHjVGwhisHUvUYU9ZO8rBEh1//G/MstI/VHD2uxumKj8NoahL0ISOMHPOmLS?=
 =?us-ascii?Q?KXoUH2SbiuwrLDYPFtEpLAiFViymiwtbpZ5c91A5gZI6VDuuMYOuQnDYMPRm?=
 =?us-ascii?Q?0tz6QRCUhtfaNrsLULl8Cz8CvponzSrcIHpPVsVhGUI1itWWVoqQb7NCU3R/?=
 =?us-ascii?Q?etfMeRWIbWdwjmTryVBhFUF4PilFE1h8UPyrtY8RHYgBBRKtzYWEtpSp4fl/?=
 =?us-ascii?Q?6gijWtXyNEMr3lAFJalYd+ETWOb2kUR77XwGEiKKhcqi4M7kdT2xMKBFMKLR?=
 =?us-ascii?Q?fxBFU+3HfdpZG2DVPMvgzv6VHJvk6srZv3aLscaA0ftLML/vJAOfSfZxyMqJ?=
 =?us-ascii?Q?wiiEWd+3NlqyVvDvIBusVbZJBi7O2Cgw2BWgyFQlPZ5f62SSscZC6TsPmLex?=
 =?us-ascii?Q?Yx1Iux6KSCEQbGO3E4CEarLIzzwApPC3zWd/mgfkn+EoJ4bLafD/qZ7Ab9iH?=
 =?us-ascii?Q?X5KN50ukgBNEDC9ItPcxR8l+PHsXJxWKbSfFOL26L7vEzD1E4vQhCtpHq8O2?=
 =?us-ascii?Q?c0gze6u5cx5L3tCHnFECcBnQSK15G/n/N71i2ZR/P0eow1mBgA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TJbXmJyLyi0fS/aOXzDtK2gBP2v+vj2HCku0jsrjVuocyl9tkitzWSznwGbL?=
 =?us-ascii?Q?jYqTfWF1vYcoQaEXgtvYEi9Enx1FBqh5GjlK6dydQDwa1T4hrNHril8aemgO?=
 =?us-ascii?Q?elsFiyKJSDtkTmQYdNN5/Lfv5KMVoULskAmjLLMSi/YQZJixXuyR7Du7Q01I?=
 =?us-ascii?Q?4M9oSW69NvGHZj/Un/owNHhzidW3SjJmL76OGoQKXcx8iiX+MBTYgBE6x4KL?=
 =?us-ascii?Q?5u19dO2gP9xCQR/9omJmagFTw++zCAwHmgtK1Twpdid7Cg6Ewyp2ALFTfspO?=
 =?us-ascii?Q?W7o4nCXEImaTd7aLdYx9oARTBTXRKjJxbv4wMCqslKGmxEPzVYMcrJFay2sQ?=
 =?us-ascii?Q?o1qotwq43Gu9mip3yqzdV1183sL1y9/SKHPK/gulbMveLAKbtksv91y56y0h?=
 =?us-ascii?Q?NFwjmdTOvU3Y8LAtO6mBSBM9ch+gk5XrLaIR8t6HZjUtQ0pe9DAhY+74opeA?=
 =?us-ascii?Q?L4HN66TwPCCiaUsQLr4cPl296Z1XcXzFlbDjYbLyn9EZ/1g4DgUGpHUnIzZn?=
 =?us-ascii?Q?lQMmk+Z7hcGpq0HG+qixQnsoSy7GRFr2IU4F3oIDPrrB0l5xCSqlSdZlnLcV?=
 =?us-ascii?Q?epiPNejFtDJcSj6c2DqHIVFVHMryOSFrMDsJDB1bQmC52JA7dwEdrzcrAkmr?=
 =?us-ascii?Q?tc1N6c4ugWoOMecgApWxubIrTWI2lyLnA9fIvMrlPn4XaTkERi3nIvKw2pxT?=
 =?us-ascii?Q?Yr16QBhsuE0/D4Nt/++S8sHi5HFqmZcUTIMWdWOjioTgzTUuOTXYM5j/+fEd?=
 =?us-ascii?Q?k4sm/lMLrFVYkIF89W3ZIwxyJPiN5IaCDIEJTAxnOl4GH/WS+KoaQgSaGTl3?=
 =?us-ascii?Q?m4WsUkNFuOogcFDTmS7mRzVnJeUqDT3Jtu/vVlyDYB97pJBT6e6h0gTWenal?=
 =?us-ascii?Q?P+uRXteoyERZwXSe5xLXZ6YT+EYucLxivHQg8QnPvjlQPqsX8niLjfk/8+sb?=
 =?us-ascii?Q?kwaOseBbfGwAde7NUdfyleaySHg8SR5i+I0sOdjCFk/hJx39zmwnmxMCzJxB?=
 =?us-ascii?Q?N7R5v2DhY0+ftmpLZj3hAU2vxxBoJQO8swJ7IRqeCddu9OSJ1tfjsvELLagx?=
 =?us-ascii?Q?C7wzHqAMTf0I3vdN6c+kFjbLW0fYE2o9ufTYXtqAepjs6aiedC+oPhYbLBna?=
 =?us-ascii?Q?01KCMQ/xJdwl6a6WyQ+xzci4vIRBGvmRIlLVFbzOeExVQYom4mQ4ds6YU6uX?=
 =?us-ascii?Q?JDYNwaC7x+wmPDz9UolYCwSiUG/FPpSJrDBYNULyuZ2l8VF0lZzKmvxdCTaV?=
 =?us-ascii?Q?lxWxwy0wPmmkt5mnJF7wyqsAMptwmwIfBTR5aDkLeNj05naOxWcpKe2hjP5W?=
 =?us-ascii?Q?2L/8VcxfyYm+WArgujysB8gOQdQ/TVDz9n5eWyVTvkNZfRsJzlJo2I7NDamw?=
 =?us-ascii?Q?sAZ9fWL1Lr2AYEoHgTgBRgX9aPI37Hd0PyXiFS47AOdEHs85o8TOeWDmOUSS?=
 =?us-ascii?Q?+fFjWbosisQ7CLmE0xhkJoJpada1dZG8D2FBU5id25aqG70nsRT+yd83WwWl?=
 =?us-ascii?Q?7y6GQDQ9Rtu4wLlPxOoNhqwujQbSa3GcUyorBDR0yK8yuS5pad0wrf4CoXUW?=
 =?us-ascii?Q?UAvOi746W3PWCkiZWfaotlC/K3PoXihR3Ib0jeWA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfeffb1-b364-4503-2bd9-08dcbcce71b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:03:24.0783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPtGXWugUaTfQyjKo7+fIr3+8dVqi+d6JhO6mqnZjBmd+nCPJ1XNmCnfZZE9d4lnGD6ozeNxR6P0PoHkomLO6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

On Wed, Aug 14, 2024 at 04:10:53PM +0200, Greg KH wrote:
> On Wed, Aug 14, 2024 at 09:48:02PM +0800, Xu Yang wrote:
> > On Wed, Aug 14, 2024 at 01:47:23PM +0200, Greg KH wrote:
> > > On Wed, Aug 14, 2024 at 07:25:37PM +0800, Xu Yang wrote:
> > > > Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
> > > > isoc usb requests", pump work could only be queued in uvc_video_complete()
> > > > and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
> > > > we can only depend on uvc_video_complete() to queue pump work. However,
> > > > this requires some free requests in req_ready list. If req_ready list is
> > > > empty all the time, pump work will never be queued and video datas will
> > > > never be pumped to usb controller. Actually, this situation could happen
> > > > when run uvc-gadget with static image:
> > > > 
> > > > $ ./uvc-gadget -i 1080p.jpg uvc.0
> > > > 
> > > > When capture image from this device, the user app will always block there.
> > > > 
> > > > The issue is uvc driver has queued video buffer before streamon, but the
> > > > req_ready list is empty all the time after streamon. This will queue pump
> > > > work in uvcg_video_enable() to fill some request to req_ready list so the
> > > > uvc device could work properly.
> > > > 
> > > > Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  drivers/usb/gadget/function/uvc_video.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > 
> > > Why is this a RESEND?  What happened to the first one to require this?
> > 
> > I accidentally forgot to cc usb maillist in previous one. So I resend it.
> 
> Please always tell us why you are doing something, otherwise we have no
> idea :(

Okay, understand.

Thanks,
Xu Yang


