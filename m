Return-Path: <linux-usb+bounces-20906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C76A3EB56
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 04:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7885D19C42B4
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 03:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D701F758F;
	Fri, 21 Feb 2025 03:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mh6eo2QX"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018386347;
	Fri, 21 Feb 2025 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740108436; cv=fail; b=G/DfZRKVte4NN6GhY9CK82jsCP6/3rnIg93NUPgBoWkkyU9f/iAi9ODa6ySXTxfcgGDb1chXDXUyueMp0f2R/oUT4S4WdMWRXm/hwgdcD3d9owsZhs1IQIU4jIT6+v2JUP3+SMgHNh4XfBO+VW7s0hay1Wbqzr8sCqUX2DAbWlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740108436; c=relaxed/simple;
	bh=zCa+mxe8LV4EqQBhQgwXsNQY6K1iFQjex5Hy0t3Gj68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tx3kOgGjqxivXS68tbe2vR6lCF8WMG78hSgif2V2lT6X+3G4zSGrDvVUz13DRyslJFpEev2k762A0biWmDAhMWNHX/t8zA9T8me3kEua8mWi63e+hF/IqK/koI9zkYiV55GBWoX+seyUAhCFqtdBvgM4HV9fiwyz2f7PDToFNvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mh6eo2QX; arc=fail smtp.client-ip=40.107.21.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIs26MeEZdNL2QKewLR/SeNLJeGNjzNOnM5netP3DbGJyYPd0CdGAGkkLYa/MYV4UPcMkrVegcH+HOQunMnH3GWdTrs3eDBjmRfl0aRrJR9fniHV1aLHOkQshhXwXr4f49SW456kCHHVyblhQdM9RJPbq//1ISw0yUomTaUS10B0sYzUmJuPd1Cn3mxA5H0SVFGzzK3B84K1s69I5x4qZ+tZNttZUrgbGY7bRxpMoqXg9m6brSXB7S4uwjrfiTxlVXSyHiPDmRVDUSht7Ou6PYn8EFW/o8ol/uKEIRMYi9WV1zWL1CuSlEHoqac8KnweZPu4A9UmBEFzQCkRx+YVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pstuSwUjkhuZm+FlnV67vFxk9/Y3Oqdv4wEOt8HjrBU=;
 b=dW80RWXbJFcbBUy5w6pLR/6wFwaZvZpiwJV5FBmlai2VPFfYVRmPGmUiQwwvYtdGhI7BX6+1JkA+EVdblyKdCh23JZE/lFmG2CMla6K41cml4HGcyVLa0I9dwBp9tTHsef3oc6NYvm6jJtnuuMAjA7skOboxFLz1G5qCG/d0IB9NQblV6l85j0+l2woD0ka+VaYjtcplaVU4rFmi5x811Mw7QF2gSoHYcmeSCaCGk2glPi0lwDFVGYiGLOVcU7y3FwvUqH4/izGsM2jojkdmyl6ZP8+4EXy7BLykmcqWMxJS5anLrOnH98yherh8Z3UvY0qlqxrP6mn4ZoY4vfoPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pstuSwUjkhuZm+FlnV67vFxk9/Y3Oqdv4wEOt8HjrBU=;
 b=mh6eo2QXO+iSyA05OoxTcnbq5QN9t69KtHJxfZqA6ySh62a3JU9V0Jhy+X7JzkNtmGQMCgMqX9jlSBqQ33uhbzHCGjF9v3/MyUK7U2h/JvFLOpV0QMcND0i0iq+m1LdRW11T9ONdnntx4uu2Z7j6nne+bm5kvjR6aGUrqrtaK3h3QpstDeNJhNlvQ3A8q52Oo8nES3PFTwDrzi94aA42niHYk3N5CAtXFbkFfM28SjB6ivBnWhkEQIp7fmt1I2HmVDJq0MudoBpwdXMSMIf9j+Vl1QjT0r+i+Wzyhiam5JanV5HDBS9mtG8WAmx+ELhIEvGeV/Y8kDVwjMqBe2aQoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 03:27:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8445.017; Fri, 21 Feb 2025
 03:27:10 +0000
Date: Fri, 21 Feb 2025 11:23:48 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250221032348.sncjhnldj6ecgeou@hippo>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-4-xu.yang_2@nxp.com>
 <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8fc7a1-5a97-4430-c9fe-08dd52279fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ts5yWUAKCVGFG7JxGgdPMidDp6MvzYOKTGS+0FUHCsUehwvCmcZvF9wyaQCt?=
 =?us-ascii?Q?esIy0acT5f4ko4WBxkRC9Oi8C9wXV33/uj69xbLco7eK98vuvkGXibqhBrAU?=
 =?us-ascii?Q?m6pnKFGESWQOSVZBJXmsgVxsQTnnWxqaw/oKrQM/oJueD729w7VoW0fnxeSI?=
 =?us-ascii?Q?bsItGK3Vk2aFj3ZpudotlwJEDVNC7iyERe52CKZuPPsMvBWGtV30JElU2Jul?=
 =?us-ascii?Q?4LExikBk8VlQlur3Mbys2ZCsgPzDpnC3q6dH6sQrTYzwAEpGh9XEUUXmmlPh?=
 =?us-ascii?Q?9GwyiTaCY52+XetdQkMYoFSgIIqm3CkwCTuuubsRTDXkJAwt+brRCl8BdrzD?=
 =?us-ascii?Q?Qijw+Jfpdzou9zropyL4CwiL0dPLNQoRyjg92/Revn/qOkF4YjWt7ujq0td7?=
 =?us-ascii?Q?2cGB+QXYXvd+HTcEpmKAsGn69pNjh6TlveJGx84x1+BTlQ3izzin59CV15pF?=
 =?us-ascii?Q?zCeGQ/3kuNyaKsR2fCkXfpOzmtlMt01BQcmgUR597+w+KhHNqo7YS3uuozL/?=
 =?us-ascii?Q?CJLGnJuTWxmUE4bSGaKtyFYsuKivBXw8p6t/AZ4AUDhbI58HC4Dqyy9SmH1K?=
 =?us-ascii?Q?0B+Fi7Gj5rV8XRIj1oIBwHHOVrRwmBe8E8l6b95Wfq+yoSiUVOOD/3Oh2dMx?=
 =?us-ascii?Q?zRyHHhVX/WeURmhOwZuQid8KXmPfg6kWTQ8+8Cnf2fN+YGWzOcUgcJqvJfyC?=
 =?us-ascii?Q?9xOxYQOSKeKnbQW1c+L9OlxXerirrhjX33VmYNDH5gSOXmB3LM4L47rR6/C4?=
 =?us-ascii?Q?1NRYhh5+DrK9h8qveyvCnqp9aAZx0ye9pr2ca5U79g8peXlCJYNFTt1ac08x?=
 =?us-ascii?Q?sgBY6hny5RTl0lAgg/mGW8pQDyVyQx5OHsZSbzadsGfmVOMQu6z3CGnIX+Hd?=
 =?us-ascii?Q?fDpRh+8t9mOczxhHjIK4fIHPkj1nhHxY8+bKoJAk9bAvcAqSZFZobMJmtNHJ?=
 =?us-ascii?Q?QDSVj2JIynkN1L8yorPBOSVCcL8t8rNNFXmWRS9Q7NApyx43Z49uX31sDAam?=
 =?us-ascii?Q?Ywtz/m8zkxL5OjIorQXeFSsEQBPqJEmwCF0NXl4dG+4lnQ9HAvAOgCyMVQYw?=
 =?us-ascii?Q?lIoYc7k5O1esfgyLW53c5DB+DbX48ZdpV7/3k08LDwOrOblyFLJ7PAheHUC2?=
 =?us-ascii?Q?38z1GVV2ClPwNOJglPhvhrK8afUi0dzkq3Knkuv0jLbf9QxG0Cy5iqsyGQKe?=
 =?us-ascii?Q?CEnYk0yDJAsWhLTwVsm7BHGzFEEbF4zrNeq4tvpQxbqagJV9to+QfSEzt65r?=
 =?us-ascii?Q?0ofVXo6avDi95ELjG99sA4hdIcfICsC0tU3XZpsvk9v2oVCGnfDICJbfYZB4?=
 =?us-ascii?Q?6Yuwz0IU+FdkgWPgtXA0+qKnqL/1rDavfrxavIZmRvimF35FDKmePBdyhVzD?=
 =?us-ascii?Q?JUWnnRNbTpoc8gg5AyVNII4BjmFeEAL3lUJnmcm6cx6SkYiKBXoIJB6v9lbX?=
 =?us-ascii?Q?ah4/XhVaNnGnEsej1l/oMyPQsS9nNgNL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wR5pIBj70UMZEoYuDa6NERz/jcqSeF411fELJA1LYRSIL2Ky2rEyEyXQjfkQ?=
 =?us-ascii?Q?DKGEIgIxYla7u+JAZithf5ehSmQnDwdAUMO2KEpv6XBwYTue2ke3IAPtuWPo?=
 =?us-ascii?Q?cAa7YjTmxQ7wWi4Cfl3PZlmkMpZj6S5A6lzyhXJ8QbYxhG/2AK/NMtgumNB0?=
 =?us-ascii?Q?sKJOLvMfMI0ifrMXvUcHluTOlrDE5wrATWvSjziH/02dLGrFWNqyQ1x8cefb?=
 =?us-ascii?Q?APlPd594x7FQj1rKP7cQZpvf5ytNIrikBaI+ZkHQIFdrSoS6AYqckwXNHfx/?=
 =?us-ascii?Q?7qmFTkDP/LsTwM8M1L+xHNcW0tahyxURo4lsXhdm7S25f1vvUHKykgiR4Ytk?=
 =?us-ascii?Q?DZY0/+HBXeewh1+eKW7xvz3VHxQ3dfbBTOsdHY9ngafnrdvyZc/3HqdmFaIn?=
 =?us-ascii?Q?6bR68OrKAFLEpod54OnDNo9Azlr/AhYj7oUltQHlkWLtJd2SP3L9pgio7+T7?=
 =?us-ascii?Q?ynA38JEm7Y1g7jvM9vs8Z5xXsI174Lss7FMpfww/tv1ddG/HlYyllpNqZmvI?=
 =?us-ascii?Q?bn3rBC0asBEAdW6CwkZKw3o1iYCWWTA6LNMU32aPcy2qFSK7luRa3g9rJyoY?=
 =?us-ascii?Q?B5kyX9SvN+NCQHjtljUBcIWUWt/2ITfzbeGe71jyxvbDcfcmJdQYH2e6g8jN?=
 =?us-ascii?Q?g1h0DQmxdC0rZFo6aBHJ1uJhjGmb6iguliLt584Wpf0vziMiPKupyLXdqLhD?=
 =?us-ascii?Q?8C9qUZ0sSBJBi0BPSz6VMNq+p3fwsC7i/Xvx22IM8hb9KH1QGdXoo0rFxxM0?=
 =?us-ascii?Q?95g30P1c7KZOWBDvgydxwEKJT+CAo4Yuuo74vYX3613bQt/BubkUL/cw8YwA?=
 =?us-ascii?Q?wlOiWbOQ+/qOK3T/bR5P+J5ELS2MtTAg33QcnGN0Q53eloaxNQzdxpqIZA1a?=
 =?us-ascii?Q?Sto/BqTLUCUlUVtfobELIXPjBHihPj5blyqeY+L6yue7LpAY/Rpo6QJ0iD+o?=
 =?us-ascii?Q?1TywEVPQU1lZEE7P1ro5EjsfiywKDJimogVaCRlfA/9CtO12XhdWBB1TH6b1?=
 =?us-ascii?Q?vX4kwEZrln7nVTr7J+UiC43EbRB2tQyesU8CSWlabcs9nZMJSU62i0yzsiss?=
 =?us-ascii?Q?NCPZ4fAK0bck+fFwKw4WOdsg5ugs/voEmyrMxpWEdtlTe6mNxPXwI7qYTHxu?=
 =?us-ascii?Q?yEYkA17uC0HOekpQJad9Q62z6NxRlWUU2Qv2A7bZvm+bWiO6rIK4FF/jb6mm?=
 =?us-ascii?Q?zOcWJccPJt44r4abVevh/6dpaQPFDW0axcjiu3P7XzXwJkU9Jc5EW7A7283O?=
 =?us-ascii?Q?2M/OfRFpV+TCbBQeACom76OCX0lIwX2JClT7omAljLuVWKesg1flIS+sY3Tt?=
 =?us-ascii?Q?RcvAH6S3myhxmY75x1eFl6nTCBg+fB6OAMkj31aUeqJoRHfU+xcf8eRxOn1t?=
 =?us-ascii?Q?PCin64tHd0tOYQZn6XXvag77ixo8QkSzSXmL68coVL5b2c5RlrWv8Vv8QSqE?=
 =?us-ascii?Q?Yf1eQ+9K+iCmhboyOqa+kah2cFTIjeX7RFPOPRgRJw2MByfJdFYzIXs/XgVW?=
 =?us-ascii?Q?jedUzyACuVBXZO2IvuBKftjCnxuvyxfXppQ8hd2g8zwfO4Asr2Yo1aU5YUps?=
 =?us-ascii?Q?QoA7qzX9PMxPYBjV+pASk2u1v2XZmOvGlBxNJYxC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8fc7a1-5a97-4430-c9fe-08dd52279fe4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 03:27:10.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AISWcZWK5SelGlX3HhFmiCVK1G0rOno6JpK93kJuf+bOp53ZDzi3p13a8FdyulFq4jNSnxmpYXV6R3bMmx3zaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

On Wed, Feb 19, 2025 at 03:26:42PM -0500, Frank Li wrote:
> On Wed, Feb 19, 2025 at 05:31:01PM +0800, Xu Yang wrote:
> > In previous imx platform, normal USB controller interrupt and wakeup
> > interrupt are bound to one irq line. However, it changes on latest
> > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > This will add wakup interrupt handling for i.MX95 to support various
> > wakeup events.
> >
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index 1a7fc638213e..5779568ebcf6 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
> >  	struct clk *clk;
> >  	struct clk *clk_wakeup;
> >  	struct imx_usbmisc_data *usbmisc_data;
> > +	/* wakeup interrupt*/
> > +	int irq;
> 
> use "wakeup_irq" to avoid confuse with normal controller irq?

It doesn't matter. It can't be confused since the driver is different. The
controller driver is core.c. This glue driver is ci_hdrc_imx.c.

> 
> >  	bool supports_runtime_pm;
> >  	bool override_phy_control;
> >  	bool in_lpm;
> > +	bool wakeup_pending;
> >  	struct pinctrl *pinctrl;
> >  	struct pinctrl_state *pinctrl_hsic_active;
> >  	struct regulator *hsic_pad_regulator;
> > @@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> >  	return ret;
> >  }
> >
> > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > +{
> > +	struct ci_hdrc_imx_data *imx_data = data;
> > +
> > +	if (imx_data->in_lpm) {
> > +		if (imx_data->wakeup_pending)
> > +			return IRQ_HANDLED;
> > +
> > +		disable_irq_nosync(irq);
> > +		imx_data->wakeup_pending = true;
> > +		pm_runtime_resume(&imx_data->ci_pdev->dev);
> 
> Not sure why need pm_runtime_resume here? There are not access register
> here.

It's needed for runtime resume case.
When wakeup event happens, wakeup irq will be triggered. To let controller
resume back, we need enable USB controller clock to trigger controller
irq. So we call pm_runtime_resume() to resume controller's parent back
and the parent device will enable clocks.

> 
> > +
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> > +}
> > +
> >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  {
> >  	struct ci_hdrc_imx_data *data;
> > @@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> >  		data->supports_runtime_pm = true;
> >
> > +	data->irq = platform_get_irq_optional(pdev, 1);
> > +	if (data->irq > 0) {
> > +		ret = devm_request_threaded_irq(dev, data->irq,
> > +				NULL, ci_wakeup_irq_handler,
> > +				IRQF_ONESHOT, pdata.name, data);
> > +		if (ret)
> > +			goto err_clk;
> > +	}
> > +
> >  	ret = imx_usbmisc_init(data->usbmisc_data);
> >  	if (ret) {
> >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > @@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
> >  		goto clk_disable;
> >  	}
> >
> > +	if (data->wakeup_pending) {
> > +		data->wakeup_pending = false;
> > +		enable_irq(data->irq);
> > +	}
> > +
> >  	return 0;
> >
> >  clk_disable:
> > @@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> >  		return ret;
> >
> >  	pinctrl_pm_select_sleep_state(dev);
> > +
> > +	if (device_may_wakeup(dev))
> > +		enable_irq_wake(data->irq);
> > +
> >  	return ret;
> >  }
> >
> > @@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> >  	int ret;
> >
> > +	if (device_may_wakeup(dev))
> > +		disable_irq_wake(data->irq);
> > +
> 
> Look like only want enable wakeup irq between suspend and resume. There are
> some questions to understand hehavor.
> 
> 1 driver probe --> 2. hdrc suspend -->3 hdrc resume --> 4 controller resume
> 
> 1--2,  look like wakeup irq is enabled. maybe controller have some bit to
> disable issue wakeup irq, otherwise flood irq will happen because you check
> lpm in irq handler.

It's not true.

We has a bit WAKE_ENABLE to enable/disable wakeup irq. This bit will only be
enabled when do suspend() and disabled when do resume(). So before suspend()
called, the wakeup irq can't be triggered. No flood irq too.

> 
> after 2. wakeup irq enable,  if wakeup irq happen, system resume.
> ci_hdrc_imx_resume() only clear a flags, not any sync problem.
> 
> But sequence imx_controller_resume() and ci_wakeup_irq_handler() may not
> guaranteed.
> 
> If ci_wakeup_irq_handler() call first, ci_wakeup_irq_handler() disable
> itself. imx_controller_resume() will enable wakeup irq, which will be same
> state 1--2. but if imx_controller_resume() run firstly,

It's not true too. Because WAKE_ENABLE is disabled after resume().

> ci_wakeup_irq_handler() will disable wakeup irq, which difference state
> with 1--2.
> 
> If there are a bit(WAKEUP_EN) in controller can control wakeup irq
> enable/disable,

Yes, WAKE_ENABLE bit. It's already used:

ci_hdrc_imx_suspend()
  imx_controller_suspend() -> enable WAKE_ENABLE

ci_hdrc_imx_resume()
  imx_controller_resume() -> disable WAKE_ENABLE

Thanks,
Xu Yang

> 
> will below logic be simple?
> 
> ci_hdrc_imx_suspend()
> {
> 	writel(WAKEUP_EN, ...);
> 	....
> }
> 
> ci_wakeup_irq_handler()
> {
> 	...
> 	pm_runtime_resume(&imx_data->ci_pdev->dev);
> 	writel(~WAKEUP_EN, ...);
> 	...
> }
> 
> Frank
> 
> >  	pinctrl_pm_select_default_state(dev);
> >  	ret = imx_controller_resume(dev, PMSG_RESUME);
> >  	if (!ret && data->supports_runtime_pm) {
> > --
> > 2.34.1
> >

