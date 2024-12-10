Return-Path: <linux-usb+bounces-18278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 328849EA603
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 03:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B47D8280FDE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 02:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6021AFB35;
	Tue, 10 Dec 2024 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GpcAYKCL"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9811A2550
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 02:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733799040; cv=fail; b=SnQzimW847+zuCrgtmaqL3PEISAEv4H8/nWCGPY1NKlORncDnZ1tYvV/bMRcSge5eRpcL7VY/ILPkFCuQa/J9QVzs8UGmorpQkcxksEFYngNX8KKZBEqvJwq8K5ZfYmr26blNc0YPoF/cyIFc79Lmemm1nG98ANjmOCzQeiGUyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733799040; c=relaxed/simple;
	bh=/dXP3Jey/Si/jbcA+J90z9iOuHK24sEUhAjG8ds4Vjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZIgYBWK3yNs+oK6T6zOgsQ6T4oFU9g7Xuxo4NPPSHemcndzb8YyST7rRZnysm0cBnEWbdQZ3KZMZLfcmIYnoA8xe+l1z5unGjJ1OAzrhmwIgeRSjS551i/SDzyVuBG8sdb5G3jFd28Cz5da7TaOCR4XK/pVJcEml6ZBF1GN+m38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GpcAYKCL; arc=fail smtp.client-ip=40.107.105.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbX3JC7tgna5alNn7a9Lfcl+IXgbep/SmupZwa7RO4aR7nK0cLnDTHx+Uovoy2NoBcU9oGY98fmdEGC5iz+VzjM3sCBXcKUggWTGH08RbZ1KsxWBxETWAc3vB25GGdTjKVNT263bqNwdq54Ih2BPOrdlBt0HiZt+4eTHCjbOH1Bn6QLLYNTSRAGI24R+KmekNaVzKuJLpa98BkvxhX94G6dANhNCT9fK8NQUQEUOjiW0gh+ZTbPlHeRG/ZqbQLAzdT7sF8GFMZJ4jAA85A7ZQVS9UMo8ddDTNgSQXhIlSUoucL9SCol5w/6DbAcmFQucLyigt9Pm+8H5jcTGPKAfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CrCUPxhPYMuzD2wHHs0Dhw2XbNmGwUPUXOI+qm3ndc=;
 b=H6TXF8VDarGSRw3eg8GjUhbGUm3ILoRJ7V215kUwx8fybB23mTY8TKHu7bMx2pN0BZjDNpmXXEHQeJnPJw6Hv68mo21TKRpHTOQzEYCjIoGcsd83b5jz67LR5gTEvvrMSVcoProLfwrWhdbbflOmKtEOxG7V3/6mN6rJSu7OEiPBWM51e0F1UJkT/9G9L9v5/8C35RQA/wNoVJ2ukf28NDm/i8VrybZox1rGLKQBtrWpcUu+PTEt5ZuN/gi1B9fAvf4pxve31hhrqeo6TLjoXHZ3sMcQ5sbNxymjx48GAuKdvchqs7paTFlflhsk92GhOu4hjSb5bcRTZAjTG4zoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CrCUPxhPYMuzD2wHHs0Dhw2XbNmGwUPUXOI+qm3ndc=;
 b=GpcAYKCLdxSUSuDi0FZ9CMzFNuWCfZ6KJcKxWXRGMKHGDs+pzUYtjbCrwOe/94yCG1s0SSjD0BVaRcVUBKuzkzB67l+YSytVXLWn++MT8jFMQIqdcv77s4S6QfrM0JV09igP6F+BaIe4JN3fY+NN/EpY2y9SI9ZGM8D8vEZo4i7kZxpUZRdZghOfDJTNICZ6Y2eRIYg04iQYGoYrazZHLTBPpgSAeFLCJa4HRAUDF8lYIbzwL68C4Y43gsNOmo+wAQg4iQ5lt+R6snPb6sQEE8SDn7lXFihdNnOaQKCoWnkH8lK1+6f2oMkAxDQqjJgHZzhdTft9J0R2yxe9ywdKww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 02:50:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 02:50:35 +0000
Date: Tue, 10 Dec 2024 10:47:53 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: host: xhci-plat: set skip_phy_initialization if
 software node has XHCI_SKIP_PHY_INIT property
Message-ID: <20241210024753.nbm3ykvwqeifnqqh@hippo>
References: <20241209104149.4080315-1-xu.yang_2@nxp.com>
 <2024120913-exploring-pueblo-da0e@gregkh>
 <20241209111014.ea3te7uwm522ykor@hippo>
 <Z1cdp9MxyXJ3qP/w@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1cdp9MxyXJ3qP/w@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM9P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c121d1b-d2b9-4968-1edf-08dd18c56b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XdACxOrrL15oFGA/KCAqZSNKaOYEBns2iQUlQ1hkHjnl+xZ+H7Djc1/w9gxu?=
 =?us-ascii?Q?MaKJxfXLusX0I8VSvd2NEvUs/H5coKMYOnKy/R5FHSC1Tf9ousj+wxD267ZO?=
 =?us-ascii?Q?/drGrR6Yo4CtNQ8WE2GMk0UBarvEGPHnHQet8e5fhBTOs0CvG2EQ45VpFGWo?=
 =?us-ascii?Q?zPTF9nOsnSbDjJi8ARqRgvO4AP55Qvqlpmq8iJPw8tLb0W8yZOrIx0K9uQPf?=
 =?us-ascii?Q?U2u2xIm4EVa+rxmJivwsVfWKsaPLEtRTaxs75dlLb8hxyDDk2yoNOFjIEzDt?=
 =?us-ascii?Q?/ZCrQT5sux6L1Kc4/viFwXJlpOBINBWxpIPtVx1kXwN92OB3mzrkCSZCdRR6?=
 =?us-ascii?Q?tCZNbcjkU2QE4RbynnckZ3HQ0I4H972V/JPMkABBZMdm4WFlsXbpQYQizkg5?=
 =?us-ascii?Q?MdbfCo6051ZjTqBAxpfQ2VEaYPuLOcay+epDVsp4CSyMLRo0xTna7j1RBLsl?=
 =?us-ascii?Q?lhlOqcUOzqzNe5ds7NNXSQyQWRIWqKnlDt27I0qcU636r2er1htegbm6E98a?=
 =?us-ascii?Q?/FZPcCQcO6O9YyNcS7ycsMU8vZPNFaOoIA2TqQVnoXpjNWGcH1M30CGCLXAj?=
 =?us-ascii?Q?mu1SDmpHcq6tumwjmR4eesHsRp/yfwHBhMFGggg46CK+2gn702Ve8Rlgpjg9?=
 =?us-ascii?Q?4UoyQ5PHyimhdXLTQPf/u3aNCIsn9/7XiMQzx0XpEPVH0xeaoswuPJNo78/B?=
 =?us-ascii?Q?A7pNr6Mm4w+pNIiNd8LewudjvhOc0hGzX6wzCRHZxLr5FOKokqfzjPtanVr/?=
 =?us-ascii?Q?WzwUUSy9EnwYVJx2xu+gSiiH/qKyybDwyXZPvLT2jBZMqoXynXGEll/BAlLE?=
 =?us-ascii?Q?lFR5DKO40V/w1zU5bwV6rN5fxBXxaCfGKqqQahGvs79zwu/6jc5MoIspWzDi?=
 =?us-ascii?Q?pzQ8wZOhq6NnsHKuW3hRZThaukEJHdqIkVcA/GhHY7hU5I4i/s3BXLk1GqoQ?=
 =?us-ascii?Q?P3CxwopbQ6JWpnunH/3//tUoGgHYtHDohNovOmVIQ3QztV4OZGciU1bj0JWc?=
 =?us-ascii?Q?A4ul8oe81FSHu28NrYU6vFqFb26JDo9b9PGCUl+HXq11cPBfW56pnmKpQlYT?=
 =?us-ascii?Q?F9ks+v+7ST+6WaUjdee+GLNg4BEWcbT5ynz+xfJNS+hgwcY0meUBWD/jvIn3?=
 =?us-ascii?Q?oVggXBO61ylRjXdBbwLHeQMJQ8gOMZRZeR7c6wNctmqMYBNJEdzfXeFZxI18?=
 =?us-ascii?Q?yN/7DZzYzLbHC6tsnxBIxIBdmEMtjw6Oxht997UPhBYohfRudJH6F9cJmh9f?=
 =?us-ascii?Q?7o3h1ipQVp3Pp1M3I5QyP3k0uNDkpuvZQwmqh1jCdcbSFcS8CN4Ac/AQW4TL?=
 =?us-ascii?Q?cFmIDHi3akqtN/XwPEJIEmxvCLWTHw0L5w1bw4ygnCEJVG/Eh3AefHFx8TFL?=
 =?us-ascii?Q?L+8firlHwnIhHZGZGWvkwKw0od6gCqPSdN3Ao6Paes6RrXsR+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KX+R3zg7tI7VMYVrG49sGt9osGDXoB15uZSIKAo2a2QlYGJlOOtm2g2DLBM6?=
 =?us-ascii?Q?ZQ7AugDcUkQELGMnA2NwrASFsXqJ32+cJx9bH+ZpNv2cfrhZDr9/FG2J9J0g?=
 =?us-ascii?Q?KG62OFBMWWTNHvXeR5su4gNflE8Hhg2zyF4nRx4qL34ZQMVaH+rPf5N6VIvL?=
 =?us-ascii?Q?uxyQA+l6D7qBKLFXCnIfwxrVquLBhOgBWmnlzeJ7gOjEzyNBJh3kytUSYZI0?=
 =?us-ascii?Q?7H5xUY2uw+lNYj/QPKUSZ1I7doaFQ4p5Ui5Xpdz0kLeYu0D0TSwJY5UdSOgB?=
 =?us-ascii?Q?hIsBnHn6XR7GrGJdiik8mnW8VPkmZE2NWuBGoxgN2iOnVF6Qz+6w9XclBSQM?=
 =?us-ascii?Q?IYX0eW6Cu8RXxttHFlzTUAkXpzA4k7oikh+hTmrGVXOikQU120rjr6rAg3IE?=
 =?us-ascii?Q?Cn9Hb5Mte4Cke0uXJLCFQNTYEnexVdXGBSLw8daaoxbBcxBJXLAiKvBusT/o?=
 =?us-ascii?Q?4E6JIMVpXAm7nnlHJwslDP4M2Dy4I59YZnnRoQ2qZc6QHVuMYrhY8eyBwaS3?=
 =?us-ascii?Q?ZwvTOcLDDY4Sr34D21H2cjJJ8I7UayxRCIRE7LReVZQsKJ3AYuiEbKtA0Ogd?=
 =?us-ascii?Q?XUqYLYZZZGp/JXhskb4l4KRzwiYpiw49yr5MS0LwX8n+u0HRo6xKfiKo4hib?=
 =?us-ascii?Q?7coHmU4L78lokg05yzp1kAi3ccYfVR+1v5qWo7WZbo1tvq27wzvszWh/51eI?=
 =?us-ascii?Q?K0fwXmsk5TXSG7DUoohOdR1PJxz5ZOR8aUdUKnonObe45EF6kBKacUI1sOaG?=
 =?us-ascii?Q?YvuMkA+B5y1BRo7dMk13yTKoKMhELItPBJ8AnWWgYjvgQee08ZUdv8+y5qPr?=
 =?us-ascii?Q?O2KvI/ZbV1TqsIMjDaaFHdMRaNqqTVJhXevtFjkT/f4LA1rwpfTZc6ie+jhj?=
 =?us-ascii?Q?b5cDjze996gu3GLDftFK4UT9F4bnKJ8yePdpbO4HatK5UPKl9SFDRa6xKvpm?=
 =?us-ascii?Q?xgUqwmUeh8TmLrEZWdqH3Ns0JZNemEwi7yqg3KOU8qg2A+1j3Rlam3WsHzpH?=
 =?us-ascii?Q?qbW3fKdp/hZ6dx94xiGKtBXWvGfmrV4MUFxKPKVAHbhmzC24W9AL5DpOkq/3?=
 =?us-ascii?Q?5HMJpNq3iBsM90nhlGEmf/KAjwgb9NYWNcDBREP/fdIZgQjxoqEdYGDr9GXL?=
 =?us-ascii?Q?q6gFZ7Hl1XGYuiLSTT6BhNygsyex7/TtuMcyRt8TaL2FURiypq4YRrYVYNlH?=
 =?us-ascii?Q?lTKAPyCeiOgvqaD89jgcyP9UFYBkvPo2GkXonMJN98NjTf9vEhVKuOL3UHhn?=
 =?us-ascii?Q?KbQmsFDt/TKYCynwT8+hAvhbQd3LyuaZz4Liofln1Be5cWQgvuIXiSL/E+pQ?=
 =?us-ascii?Q?/o24aCfmC1j/bIvML3LhzTrFhtF7JM6QyR/AHG8OVGSepvJOLsRj6oP1xYdD?=
 =?us-ascii?Q?H+R0XlTjHS9W8gDN6fr7plh/MeFKEzVXd6nSvP8nGGlNlKpybR5pxENrPJj3?=
 =?us-ascii?Q?I0rbzSqszzauXZBOWxv/M0OQfW6H5rsIia+lL0USWrF/n/7w1QuLyXJXRoHU?=
 =?us-ascii?Q?l4DDqbqww0/DD0hA1BNEy2oIh/MJ9q7+d2LX7DJdOzzh+99wFsNJtl68mdRU?=
 =?us-ascii?Q?QfuJ6nz992pAFrNMDe5yVIflnAKiK8kXwcZA+pEp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c121d1b-d2b9-4968-1edf-08dd18c56b7f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 02:50:34.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6rORcKrnoANaAyj5wUGs4ACyAAJEMjdvFG8sigbMbY0MNJp/tL8WKTD8iHyDdwxsw13YArih8Jq71gtAyyvuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509

On Mon, Dec 09, 2024 at 11:41:11AM -0500, Frank Li wrote:
> On Mon, Dec 09, 2024 at 07:10:14PM +0800, Xu Yang wrote:
> > On Mon, Dec 09, 2024 at 11:46:59AM +0100, Greg KH wrote:
> > > On Mon, Dec 09, 2024 at 06:41:49PM +0800, Xu Yang wrote:
> > > > The source of quirk XHCI_SKIP_PHY_INIT comes from xhci_plat_priv.quirks or
> > > > software node property. This will set skip_phy_initialization if software
> > > > node also has XHCI_SKIP_PHY_INIT property.
> > > >
> > > > Fixes: a6cd2b3fa894 ("usb: host: xhci-plat: Parse xhci-missing_cas_quirk and apply quirk")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > >
> > > > ---
> > > > Changes in v2:
> > > >  - fix indentation
> > > >  - add fix tag and stable list
> > > > ---
> > > >  drivers/usb/host/xhci-plat.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > > > index e6c9006bd568..77853b86794a 100644
> > > > --- a/drivers/usb/host/xhci-plat.c
> > > > +++ b/drivers/usb/host/xhci-plat.c
> > > > @@ -290,7 +290,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
> > > >
> > > >  	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
> > > >
> > > > -	if (priv && (priv->quirks & XHCI_SKIP_PHY_INIT))
> > > > +	if ((priv && (priv->quirks & XHCI_SKIP_PHY_INIT)) ||
> > > > +		(xhci->quirks & XHCI_SKIP_PHY_INIT))
> > >
> > > Doesn't checkpatch.pl complain about this?  This is still not correct,
> > > please follow the proper indentation rules here.  If you have questions
> > > about this, please ask your coworkers who understand the style
> > > requirements for Linux.
> >
> > Sorry for wasting your time. It's a mistake. I made the change but it's not included finally.
> > BTW, checkpatch.pl doesn't complain the format. Not sure why.
> 
> try --strict option.

It works.
Thank you Frank!


