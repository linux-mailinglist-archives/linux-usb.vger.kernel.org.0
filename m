Return-Path: <linux-usb+bounces-32075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34496D0476F
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 17:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AF3930AA722
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 16:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDBA1DFDB8;
	Thu,  8 Jan 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SkKMeXHV"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE02459DD;
	Thu,  8 Jan 2026 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888514; cv=fail; b=ELPJoiVY+yHNyvPF5rpEMqfNCJ+TNUydB9R8H9ky85DQh6OxE9ixzCK0fUl5s9+LyKJYDiwN90MaweQ1akoQNzQsExBiN3FcMiRF8SrkPU4n27mGSR4CUYywyZk2KvuI4kKpRbCqXYSf2CYpnDT//RfqpN2tPlz9W0DEw/Z5B7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888514; c=relaxed/simple;
	bh=FP7n1UdYUBX3B1YmcW5UxxYnGvt95WS7TRj1xqONU3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DWT8eaCmwDSjptTu3iYtVt1E9xM5XNaK0a3tY8AXZMSAz9QsnpI/DkLd2VTl8lgOzvOU+ljW5i5xIWNLcSkeGjC7VbAajdtOoSzchF0ueSrKtXGa8qTYMxZyXgetD/LTQ0BdMLkerULPlpAcpJ6DHAx3yKcSnYtE8xoOkvxhWeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SkKMeXHV; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eijaPPWyDpwkk9ZF34ae0hm9YC+PnDhqIAGG8wRHuhjvwFX8hn3I6WjtpzeYrEfbvP6oj4iDflrOuzDY5v8P4Fw1jroz7p/W/fkc/EVlByjzZG21v7o0+hRu8vyCuFanBx7JgkDHFcH/eht81mJVwJQVa3+jDTecuhSsxQ96j+4r5g3hTsYbN6r/SvJ6itl5WZCQwEVc4LQfyrs9VSbAgatQqsJ6MmLQNejnXPJoGecWGsJkFTkyQkwQLxu41jwKLxGo/hisBAXXeJfvJojSHgdKYtCmyQ2w5q44t5IcqxCWOODsQ83VcyMOcaNWl5YqxQUMNbtfvU2nnvPmmUJq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEkbBOLg++xCFzUFpkYQ1y5WgatnMhDsQMT8W0ggTiQ=;
 b=vW5a8wuAiLyuH1hly7Xv5/vwRDdlAOkX9dWilp9JSvLSPSRtocSDNxroUrqIuGs7gchZUJt0/YDpxvRW7im1PXoxxFzqmD4MjwnnzGxs6AIcDZ2gq02jDbN9uX0KqkQ7j3ORS0f2E3p6ESjrfpuig4We4YXkRt5EITWHxvSPR6Pa9XJHaUbpm+DWtv554lInqZ1iPj9DjhiwsvjPX0SE8oTVxsqbud9iTa3pnLT2gyrTeMz1mQRTCVTxiZ5u6gHvyw0zO/YVc38cxu2DCxUIExJfnPJbFM0hPlzGcnqqs5ra55QHzmywRbBJG1BOEt4QWj2vFSKK1SWOOcOgjdMBmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEkbBOLg++xCFzUFpkYQ1y5WgatnMhDsQMT8W0ggTiQ=;
 b=SkKMeXHVxmutgiOYeQlPbZ8hMhp8rHxFuS3CW0fVJIJMhzgAZxqj1gUEnoSQZWo0Mqn7pK6v9eEi4yMCzCLVkPUFDTPWfAn2UVwXg3BkslB4NaGclx6vhCEMo1biCdtH9bBuCiMlwgVhT7wbgbA/5fR8l06orhEeF8HuoF5Pr5zoXUjB4XhYPosQps5O15auJ6fW9F4mEqrALqFqlfvfN+NIq4H2PWiXlqBvlJaqKkfU/bq3FV+ww8M7xW3BaP03tIEAIA7fr1BChu9Iv81FszzEsfJ8gO2CHevEYoxo1DJInHuGcI0dwGLSAGteWkHCVYP5uirnS1cUH71FHuBo3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11361.eurprd04.prod.outlook.com (2603:10a6:10:5cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:08:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 16:08:30 +0000
Date: Thu, 8 Jan 2026 11:08:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>, jun.li@nxp.com,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: gadget: uvc: improve error handling in
 uvcg_video_init()
Message-ID: <aV/WeW9ufsmAbZSY@lizhi-Precision-Tower-5810>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
 <20260108-uvc-gadget-fix-patch-v1-3-8b571e5033cc@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-uvc-gadget-fix-patch-v1-3-8b571e5033cc@nxp.com>
X-ClientProxiedBy: SA0PR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:806:d0::32) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: 14381506-44c5-4e0a-d2cf-08de4ed02a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/DGILtY/YL3a9NJ/LMz7hrS9O7CwTquPiGC9sjuYb3YMCHm9/9BrkR7eGsI5?=
 =?us-ascii?Q?3cFH7OercVVCPFJ+WwfFj6HFkCH7OTKXpBsp01KwRaD0BSMkDnWFDaZAATZj?=
 =?us-ascii?Q?EjparMwXUjw4e3Bbwdce42A/8TpvBO5tI1PRuIzbQFFY4tdhZkYwtYdrmJ8+?=
 =?us-ascii?Q?B0A1AnWMKqFpIH0+F+YDFzvK+uwPZoz5VFjsay0CmX2muV8IoUBIy1YKVu3K?=
 =?us-ascii?Q?jRBFaMsUVEKdYIciFKYICp3Y+55acVcdbIST0f5MeKpgzk9WHAQLgdPWoo08?=
 =?us-ascii?Q?QWDkzLvc/DpMtxeV9h8SUizvGZJtSL6z/rsKmLI/ewUH6qIgCH8tLotKaZ15?=
 =?us-ascii?Q?QzPVgZ3BHqsufkbwMydatYFWEOdJjKjuAZi2yB6GITQeAQiF6z8w/tWqLjPV?=
 =?us-ascii?Q?CoEvpHrzkAmRmmSA2tDm8DoycN40u4NnKHWTa8BdCD8APoI89T4JAImEzUwq?=
 =?us-ascii?Q?BtOj3BInkSdDqzvRMz1hk9W2anZlvke4FeGMrLEGHrNFrVxL8j89MZcv99d4?=
 =?us-ascii?Q?KPSp24fNOgTNov0ZwWUoMPAT3KK5J/squYv5EYhTgdOZu/mbImxSzWcuBx5B?=
 =?us-ascii?Q?FF+oBYgHVHWBpUy1DQiG3TUb5+WFg+7O4xq+/FqB/NPS8mQ9c/CVZsFbtsdf?=
 =?us-ascii?Q?CqWwMU9VPkPBwWSsOGkBtxmQjki+P/5NLYk6P9x+07cSu7GsYfeaGVt5U4G7?=
 =?us-ascii?Q?qpe33jU58NkAlRkBiIo026U+1G0iUbszDqWlpskFt9iYc46tOSnRNWPMvP3X?=
 =?us-ascii?Q?m2VByl1PxskIAJhajxDV+pWMt7OCDejTrRcba3Kdn3KmFS8IJBmbvS5lecEm?=
 =?us-ascii?Q?mHyw1HptvcuY5DblwCpX4t/JUF7Sdxs/xEBZvO9RU1lXh8gVTQSIoxhNaxv4?=
 =?us-ascii?Q?5hNKHMUSlE1JoAwk0/lP4MEjWGHRKYBe3igV4zDWYPCkSATtVyaa5iukEI76?=
 =?us-ascii?Q?IaV/fdxS/EDn4MSe4JYRcd52k0Lr66masKI13nJMM5+EG93qE3HbnuyLE0dD?=
 =?us-ascii?Q?5gmxIclaDP+IAXD/SzVfMIr8K3VnJldauZwFX8PgEaRJoE+CSsR0KARBlynj?=
 =?us-ascii?Q?eiJJ66dyGU8dUXCQDTWQBqeiv+kD8BMo1+NNLyjgfshgdM19OMoOrCO5S3QH?=
 =?us-ascii?Q?jTyMsNZL/KCXFfnxhWF9/5fIYhEqzgLaB0kgSfm/WChwIkXlBm5bcRFgBlcl?=
 =?us-ascii?Q?+EQaba9bzns/yHRaicyAlrv86Rj7ThkKqUQnnd8yvfOQzZt1pqvfYn/chF+P?=
 =?us-ascii?Q?nSSy4Yw6IdKWD19zGvFOS41B49ytucZ4A0B0d+DaQ29iAQKOx5PfiM7uktVi?=
 =?us-ascii?Q?PdjUPl9wB4fmYqneP/QJX4yiQucrBw8iOvvXEBFWVOuM36PsDMhqpLyavpm9?=
 =?us-ascii?Q?JUIosiT1WeAA0rC1/XnBuSm7vCtG2iW/qnajYlCL3OqOVoMhBlmmM0+sc1+Y?=
 =?us-ascii?Q?Rr0yRP9So7vGBF6wc6p30q+ZyYQVcS96j78ftTgCB8dX0ULY2XSefpt4TaHB?=
 =?us-ascii?Q?QZ9d2Nn0xFbd6Xzxovqf8A0WE5Yx2zRsFdyk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LKhiwHE4yV8xlBI9nNK55dO2+IlevIS7Mg6oKkHkvxQpjSHXpk2eZza68SZc?=
 =?us-ascii?Q?JpjaNrK3Ru32m1LFupO4WjFDILO4q1IQXzWtLO5rI4TW8v+uFpVfla2BadZX?=
 =?us-ascii?Q?uJwO8i2jqEsDqP4j/TxmXRUzF9CzOwAvGuakGaQemg5lYa8kXsGsXuPn+TRe?=
 =?us-ascii?Q?2TqETLTM+X7QwWXotqhQutGiLSDPLS6WSXi8H50X61YEYgaBBPYWxXigKfd5?=
 =?us-ascii?Q?qFj41lCdKU3CNQnMtwu6hVNEARzmwg+HtfXGimkpstvwCq9eagWpObzI3HZP?=
 =?us-ascii?Q?jiWWx5/VWytrc2ayQ520FQJ5Ht78bMdMPomy8/kFr3si2/rZVk9pC21Wfbbk?=
 =?us-ascii?Q?3iMDW1aooXDiECbFKI8mnGiquQ4iHY0k7vKOuR/wwH0hcC6rPluhkm0JgD4h?=
 =?us-ascii?Q?1ROH2aDtbpYmSNH5UWb8w8tEFW2PopPEny5IagBm/3+LFvHeEZ0jBv30zhmR?=
 =?us-ascii?Q?ishRWUi7RTDbJuNnOLo+W8z12xL0haQliKJuTp9Wiv+rrEE1Ow7hzk4xtfia?=
 =?us-ascii?Q?TbulBmbV0Kq3SbKjSanbZ/CJhmxMimbec7OvLf22dHcD/byhVKmOPu6J9uGr?=
 =?us-ascii?Q?Ulr9/p2pk983312YBUsIiLwNNgYwsu5DDNgMdWq4cCwn23WFVmTj98dEiZin?=
 =?us-ascii?Q?bma6JxAtF2gBavlOpI/NLgbnNZoTzmFxn7SrcjxiWHYT2OxFyyMLHo4LCe8s?=
 =?us-ascii?Q?IhMHkbZZMifu9QKdDTaUQN5bc6Od7A2zdEzC24dNn2QqmH7bxjom7T2JYAvT?=
 =?us-ascii?Q?mujz3mBsr/qnzTH3ParP90TVwXArRb1uKYpdjFvL1+mL9DQPFjHe4HqFuhne?=
 =?us-ascii?Q?1p2C2HJ7gWoa+SHvdjQ6X3g2ptumFakPkeSRNMP/5QT1RQcyr3TsG+asftWU?=
 =?us-ascii?Q?A3K9Om+YgIeMbDQ6iPX7HjdG2Eba2iescHHJkkAqI4uwTpqf29t2r2iwevJZ?=
 =?us-ascii?Q?wHtWBMLilvm9y0wUU/nSBaUzKhxNgGnD1GDf8U+lcseTL+v0anLO3voG+0/J?=
 =?us-ascii?Q?jGqQ3Y4SF4JLpq6UMSwqZA7Bw+OAY5C8KrkofCqLh7abu5rEaEtl84altz79?=
 =?us-ascii?Q?wIa6kkOXgYETh5IJ4hrVLr2ON6nJkjq3GZJ0zb2TKkaG3dYhiQTZyp5Yz81Y?=
 =?us-ascii?Q?N72at+UswYffP/sR8+hvDuzkSpyVG4DUH8hkxKoXIUt7xssrHRMbxUkLmoIC?=
 =?us-ascii?Q?fWXl4t/yDaijMfDDPJJbNTRTY4vVmePoZI+fLzdUbCKO2Lc1NOVIIOb6qeyd?=
 =?us-ascii?Q?F0pTFswPUAsFltDAruzjxRiQ6QKz2xkKwxFf1Jg3xDBh8nVQF4YDrnOGEL9B?=
 =?us-ascii?Q?KWYEZRpfwwmjTyt7MbbECIMTCG2rj7ytG9zlxQ7uLgPUy74h3jJy0JcPjdUE?=
 =?us-ascii?Q?9Tyfl5mWFJ6EyGt6CLqo6bOuDn2fS3aiBydq/kIrONo1jl5MzfiG5tG5tP5b?=
 =?us-ascii?Q?DVxARMaI1XD7TaPhD423/dHg+S2c2b96mWrHvf/9rVOKoMIer+pWq2FQSZh6?=
 =?us-ascii?Q?FwFuq078xXW4v7X+XYweFzwr6kA3CLFcTolyCPYGtJRN/V1Eg+vARfheyekV?=
 =?us-ascii?Q?PkPaLqF8le+efyrJdcJs9TJhSH85fkH1wcA81bddm5tBbWCJ51UZIdGCR/XA?=
 =?us-ascii?Q?qTssRjo6smph9fx7aN8bVu86PWSzaKC3E4GkRjhWd2cHT/229W2hjySMhAfU?=
 =?us-ascii?Q?6ZQH+FcvlXaGVBJdVhJWcmbNkELcXwyfNTI7VoP1a7/0ZVgr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14381506-44c5-4e0a-d2cf-08de4ed02a4c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:08:30.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tveKWxsxS3wxE2rtA6hsWe1TSnlH03AJrfB4gaTDKXtCrgURkThAxCHrrTRsFp+uGrl9LwnqomKBBtmLIEC9Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11361

On Thu, Jan 08, 2026 at 03:43:04PM +0800, Xu Yang wrote:
> Let uvcg_video_init() return correct code so that error can be handled
> correctly.

usb: gadget: uvc: Return error from uvcg_queue_init()

uvcg_queue_init() may fail, but its return value is currently ignored.
Propagate the error code from uvcg_queue_init() to correctly report
initialization failures.

Frank
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index b1c5c1d3e9390c82cc84e736a7f288626ee69d51..ede300190f591d39e306aecb565c614cdff5e664 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -838,7 +838,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  	video->interval = 666666;
>
>  	/* Initialize the video buffers queue. */
> -	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
> +	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
>  			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
> -	return 0;
>  }
>
> --
> 2.34.1
>

