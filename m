Return-Path: <linux-usb+bounces-18249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DD9E91D9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 12:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 023BD1880437
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2024 11:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B4E339A0;
	Mon,  9 Dec 2024 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WNLDFkhy"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9D21764C
	for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2024 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742780; cv=fail; b=aiNftTIk8xxw+lmaUn3C+aImCBnjHKXMybv5mHr3Kh/gKJgoBt8aUKve3Oznk+d+FXIv7R1jnRclTwtJZDY+5wQxVxa4WR/WpMY7d4IPTnsEIYVsgChdB1oFNsQxbhY+SVt72Ka+ChzJSgXvaTcYTNC1J+RYRtaBW3B2rMlN0lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742780; c=relaxed/simple;
	bh=aAleo3paNREUUsbxv/Buu3IkJ1mI5U+wcrbucJBXb9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mpYLP2bbGo8zXQMfaENtF9h4beiCy8m8YLzZ4gHaDWGbuHoMCl40QN+3hoB4AU6keoHNe7YBwGzoj6Wy55rtS/diZkMglvjQCDAS4JsOo0ROhoXE5XmQUJT26v8x7vbAi66DUv356Kyq+q2TVkQRaIktGg00LAiwrVsDgxQ1JUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WNLDFkhy; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPa46SvU5xeok/CBfxsIcaEAonK7XZMNY+DHf5DV/GQc3lbJnpO/vcQVA+qYZ2wQh595f4I+7je0FoVwUvcOtjYA5PgAWdAFoseYnRILOeSdQbnpz+zAoe0SHXAKnZGVunoMSk28Vms5GZcRybIcl3K1IuWUOm0oYK4eqd7uXV4sFMSJnkkWd14I27Uqq+gS7UXJYyZRhutWs3Ox+g/BHooRrSZPyyI+v/5gsaYebNuXG0wwjKpnqp9tcp+J0cVcz0vrpYZczs8K4TX7Dz+K10XqzP3tlxtg+m3HEP/wqXI+VPzHy1ZFYKKXtoiOHn/Sse4ew9kW7MKAH6Wt+F+dKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cXcYVIKyPxehInG1QheekW5sTnucZCL9/CMnbP0ayY=;
 b=uA9akvrlRxxzbMaBzSj2HP2Gdpp3WZ9ba+4qwBY+2gcBgDoUdM1xkurEwrig7FU69o+DyJS0JmSdAXEbqQvsHGhY4auo9G5xL6i8x3rDY/RttXgAGbK7jeRY4OAZdXPyIA6dm/MQxBRqe3Giu2+2iRmAJF5r7vk9fZ6phO5apXp13ThVQAa+QEz0RT+0MaexwWUOdhvuzPVqzy+JbR1YPbxmtdUnhSS8ztbNt5ojEoEFGssVH8RkEhVsjCRnhkIZSt0OaUIKef2rZTu0eJgkLdNlthkJaLoQNWF7nX9b+ggmYQ+HtQAxBE2xYkiteFBNL8qGzWc6gczUXoMPTlG5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cXcYVIKyPxehInG1QheekW5sTnucZCL9/CMnbP0ayY=;
 b=WNLDFkhyLlMpzTq+KfVxv3rH7+kN4ljj9wsN90ylR5HMXs/xZch5YeXuArEcZLH7f3y5tQNojbOgcm12G7fUZ69JPuoFYCx1sbhhhB4BHFSnn4lHHKrd+2uIR4wR7d5bNNbL7W0wh35aGMYHJLKwjAg4MB+RLV3P+ZyUr1T9veFhurCFTsUKKPV9LFwYAfq51piplWAVPfwQvgxVTV/Ch+4PfRZCXW6Etek3UW97ehj+4HxSJrM7vtCAzv1XkUebu3GXo8M4qygob3tf6g0Vh098HDKw8NovFahvaqfIxypdYEQfxdsUbauxMh4U6sjbZjoImqsWsO5zxQNn6tuCDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10737.eurprd04.prod.outlook.com (2603:10a6:800:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 11:12:53 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 11:12:53 +0000
Date: Mon, 9 Dec 2024 19:10:14 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, Frank.Li@nxp.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <20241209111014.ea3te7uwm522ykor@hippo>
References: <20241209104149.4080315-1-xu.yang_2@nxp.com>
 <2024120913-exploring-pueblo-da0e@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024120913-exploring-pueblo-da0e@gregkh>
X-ClientProxiedBy: AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10737:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c1413b-282b-4509-1851-08dd18426d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xK2zxSXTjSYd9ZuZ+o150MhCBSZFUpv5dvM8ZkcYS4PWiVjWgQALrsidKXtC?=
 =?us-ascii?Q?t14ocI23vVZEDz3j07w+EFmxBEy+wiyPA7w0L8ZLegrfiXyvaQqVTPSpmcdo?=
 =?us-ascii?Q?n2Cg6Krm37+dbRB8pjCS0yL1Lkd7W3WTurzg8hw2KnXq7jUoGn831dMp8NCS?=
 =?us-ascii?Q?4OPSyENxi1UMdK5ocYWinWFgL0cwJx5Xok8x0RemVaUwQJI6Chr2oTjCuFJd?=
 =?us-ascii?Q?GpdL9gzVAOREDeImbX3H/X6Kf/6/Cv8RPOSFrJg7zxS7R6YRe6/h/ZFC7637?=
 =?us-ascii?Q?6iKjxceX+PFchnYKE2U1zuwfQ4Ys1PseFCUb4pJotLzpQ2YuVCm0DzgIJW8d?=
 =?us-ascii?Q?HRTV2b0CNe96xuVG3ZeReCwGmIfLVt4uuqkKzJYNmK8b6RRTWqE4kyKpXmmc?=
 =?us-ascii?Q?UCjbjhrgijZCQdWGt7zDpjiz4LEynnXZD/3n7uXr0XAOlDmltlTsiQOHYohh?=
 =?us-ascii?Q?3E0cdcQ7wQsdXeSdeeZLR4D7xHCUQn6IIUloBHnfPcQh/BxyfYnIzF3V9lZq?=
 =?us-ascii?Q?L10b8I8nxm3BxEaufSVj8D+ubyymxjeAbRxVZB53o2eQX1tAMrpoTLh0xchZ?=
 =?us-ascii?Q?0niwqs1ySTiMIwEUXO99gmAt5UgvBlkPJ694CNwJ8PPjv5j4sUydn0MJlNPO?=
 =?us-ascii?Q?rSJ0YqsY4Mdrg3hJNDlV73POUtCgA5unCJ/tkBmMxQzqSBwhbS7XiTmDu24T?=
 =?us-ascii?Q?9z6QlW2XMGyJcvPfxpkZ9zzbmrU+pIJFaA9uIL/aW0QGBpl8xvPio5eg7ieZ?=
 =?us-ascii?Q?rMvk/EdVCzAmr/cx9iG4DK5S1rWt7291auQsYEZUQTyv7ZdYlbWX9DVsZkkn?=
 =?us-ascii?Q?wCwg7ikDMi8XFsfRF1d0mzUhMaQzkv1+ASzKI/Vbx3XFv58N/Y7rEBVm/pKs?=
 =?us-ascii?Q?z/oIvc4ZH+b5Aje9v7rplrOD7fQMeW1CEkzIMtGJi/9DtP5R+YVfIjUaRgyx?=
 =?us-ascii?Q?vqUk1+vgUr7FKikXA7JgH1r99utA6MKBMV3ifQXsMGlPZo2+6zmvumwKK5Gx?=
 =?us-ascii?Q?nGNWxlj0Fmtluia/zrxxfujr9bXXBnFJ/Wg64ky8RlhcXbgAsIxEdYDQfIDO?=
 =?us-ascii?Q?SeLvkoI+iHaxjvz5NntTkv/UOt2MhWa/MehDJeuTZsqFhJnfjUYYE48AvEf+?=
 =?us-ascii?Q?PyhCFT8ZZGkUINy3bPdP/M72wXbGNbCQTEEUNIvW/yzwSLxq5pXA2bsVGSDc?=
 =?us-ascii?Q?f51V4r0ChvFzQpDsNshjG3w4DF4jF4+xw85TKJws+7GOrXswFublM+v51sA9?=
 =?us-ascii?Q?qC1p09ZiwOAMaH7Q+lTgRAZQbqGVP3gfAvDjDtxAMLr49LAZ+KU/gVtJp/qq?=
 =?us-ascii?Q?5AuPe91Sr4Y/RvOZwhBgMXEf1nSyDw8U3itMEIrnzSG0Ms4elNzZCgynDLks?=
 =?us-ascii?Q?ANcxxzgCvYcHVBGBuPYnKpFAAhQlFbLhxSxDdIpMpAjaocg11w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MHXKSm5rXSe+jrO0kRbO8+SKutQMlNWBK5sg/U35KOxhlI/hB96iqSk14toO?=
 =?us-ascii?Q?XN9b1kI0xdgDJAEoS8k0LyClkEKgFpTlO++0QFYUVOcLBUmCkG5HfMAAWpky?=
 =?us-ascii?Q?HRY4AHnidFeQ9mdrzYfr1mG6y2lvq/6J+Tru5vw/W/l05/2AB9yw1CooSYEp?=
 =?us-ascii?Q?/iOZwxb+nPN7b5jxHlbwy+p61mDqc30yhDQZce7L43gUzw5nKiJ68+WIfrgM?=
 =?us-ascii?Q?sPwIbFXaYF1DT1rk6c/ii5xfEZEEPQaV91S1ocROLsRNw3oM0O9g7xRVEBSY?=
 =?us-ascii?Q?Bxa0GNuY7ef0hTmfzM/umcgBgTKaplbIhNAePi8RCTgmtXPVSXfXW9ZVu10Y?=
 =?us-ascii?Q?qYu3hzma2yN9eL7jJ7P0Zu1B3JhHQh3aKOExFARujvUOmVRyxjTbe0DfZ3Dm?=
 =?us-ascii?Q?42uJn5HOO/qpuu54qXfC4+9G0+71LdDxhb7jZ4gsGa75LSxuG6BRNEh7C1zR?=
 =?us-ascii?Q?HVeV+nQlBLZQdBZiuxII/kn+G/mDQFnCHC2Gac3D7xKZXpYTp99syS26IvuE?=
 =?us-ascii?Q?rltJn698AmXPc7Jin5VTZRxlbwlQsNe02uUVns+USbf+UCBGkGnEGFlkJGSL?=
 =?us-ascii?Q?m1N0Bue74umxRUazpSG/RrTDQT9yXjmgJxl7jg4woH6vKbrxkFAx+YostJRj?=
 =?us-ascii?Q?8x32HzW9lq+sWHIfm8Z/T32goZeSGlZDiQK5EYxohmG8pPCl3QVSM7bES++S?=
 =?us-ascii?Q?QlmYyr4Ox+jHh/wweANRi1dZxbBpH9lHvBkj6KG5gsYE+QoNbKBX7+0zxq0s?=
 =?us-ascii?Q?dyDRfBLRX1roovhXoJldYA3t1dK/h3/EbGiCZI6hz1IXlC2KPUOGv8MS9DP5?=
 =?us-ascii?Q?RFfnZ9nfRkRbk0S/aAQGzzGMj8aQcImFmhVYU7j2p5JbRKFlWsgYmmPY2wo8?=
 =?us-ascii?Q?hzxXKM5yJxvKnrIOHRDm7tNdn9cGnL8H5TBieQ5xE/Nr5IpU5Td6wqCo2BV6?=
 =?us-ascii?Q?KTjZS4Y7c5tttMO4BGh9zeW3Ot2KwLoKw2hrlV95A1HWHRmiQtW3ihGIKuh9?=
 =?us-ascii?Q?vU5hAC/ROUWkJ93qhbuZ5TiE6Z96U8WLCFeOi9t2tJ3bmbxg+3AFZjZTnWCW?=
 =?us-ascii?Q?lHWvUGaEF6ebJfM4CkY3y2W3tA7O1kteCt1r1WZxrN0HsPVpEaPEHx9v9EyK?=
 =?us-ascii?Q?mhavlLYwQkKkjanzftILYXb9VUFkcI/smLVI8bzBpoIAQTDXEURNlPd3Zyn2?=
 =?us-ascii?Q?Pvlx9juL91jin1tqTwiTNLWNn4OqhRmiWJHOQ+13zElBOX8MyYfCon3r5ZU0?=
 =?us-ascii?Q?idTYP0yo27Zh3QNHGw5cJ629cxk0p8Y3bdkLerpNMTQrR5QOx9RAhiVgQ5y9?=
 =?us-ascii?Q?aITbudMbXjr6niG8ieRVrXUDN7X6Ee5IxPnfuoDAV7S4J3vTpOUibZLfStXn?=
 =?us-ascii?Q?k/hw20mX9NJ4SvxRIFLEXN5NwjKlZaAude4UQVJbJZ6xeTLFKqt36p3TggLO?=
 =?us-ascii?Q?qH7oVkciM+nO4kCMy9tEDzfxlIUoktkHkySg6GzGEVdX1YJZ+NwhZpCRLkz4?=
 =?us-ascii?Q?3a5VGoCOzf4Mht58xx9fdkTLxI1jfuWyJKe6Q5hSmg9S26U9Dpy6bmtdhUIk?=
 =?us-ascii?Q?tABCCVuos+1ww4AC3Xpbp2FNsVc3KAR1WdMmLRmx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c1413b-282b-4509-1851-08dd18426d08
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 11:12:53.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcVAeUQAlMeM31kMatflVqwqsKnDAvWUw9/1Ms4zOpD2aThqrcf7M/OT+ZsQAmccg1ipQxVW1KzEvknqoJbsvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10737

On Mon, Dec 09, 2024 at 11:46:59AM +0100, Greg KH wrote:
> On Mon, Dec 09, 2024 at 06:41:49PM +0800, Xu Yang wrote:
> > The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> > software node property. This will set skip_phy_initialization if software
> > node also has XHCI_SKIP_PHY_INIT property.
> > 
> > Fixes: a6cd2b3fa894 ("usb: host: xhci-plat: Parse xhci-missing_cas_quirk and apply quirk")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - fix indentation
> >  - add fix tag and stable list
> > ---
> >  drivers/usb/host/xhci-plat.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > index e6c9006bd568..77853b86794a 100644
> > --- a/drivers/usb/host/xhci-plat.c
> > +++ b/drivers/usb/host/xhci-plat.c
> > @@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
> >  
> >  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
> >  
> > -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> > +	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
> > +		(xhci->quirks & XHCI_SKIP_PHY_INIT))
> 
> Doesn't checkpatch.pl complain about this?  This is still not correct,
> please follow the proper indentation rules here.  If you have questions
> about this, please ask your coworkers who understand the style
> requirements for Linux.

Sorry for wasting your time. It's a mistake. I made the change but it's not included finally.
BTW, checkpatch.pl doesn't complain the format. Not sure why.

Thanks,
Xu Yang

> 
> thanks,
> 
> greg k-h

