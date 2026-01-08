Return-Path: <linux-usb+bounces-32040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0ED019C9
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 09:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70B23111F93
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2727537E2F8;
	Thu,  8 Jan 2026 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IWJEf0on"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D537BE6C;
	Thu,  8 Jan 2026 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859654; cv=fail; b=YMRkBRr8iQcD50zjFZZGnDh/frzh6d4qGyAmk3IWWyebWcfi9KC6eMdpsZwD6PyQMOaULy4OJegTnm+u9CSlb8E8o6DomKdZkYjVNJtj+U1a9LL5Ppy+zd7/lVnH99vEHCPSjqnMMqGY78+8We/PHnAlB1udyIJGE1HPcFTzFjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859654; c=relaxed/simple;
	bh=j0ZTbUAVZ7+Nto9Po9qedqIbGEugMpdEI4f3XQrkUyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kj0Zo87nVUBcvf0eW3moGSVT6sgFJiPuIajz+hnY24y/+mCpczWm+buWf2OlOOtApU31hEO9A+INe0HJmb69eKWHX1jQ4uSA3ks2bVVCmXAE9tRqysuE3viDRc7pEorTCEM34ushxgjEwU04lNpPgxgTLSque1ReWB8kdi3CXZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IWJEf0on; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njbF4tbUvmPbhx31tYOCXOPHIstchUBmlwetJWU8oj3imCnuSzcFOGkJ5O5UmjXgMYCTy0ktumQ4sM0nC3Z6YU4ELHYdLVUH9MLxyTFLQrt+Ixf3kDdYsYJNf5HZru+P6jQMnQnNeWCA+rgNXmHdZuvhJ42/WFPPpdzale7RzGjczo39EjuJ5X5VcGxQQR+Z5y0xJbIcZqQQFA2xPV3p+K1OIXWQVrM7oqUmPxjGEY4G4kNXzGY53nIGa4qZQjBpbWIjGcgtAwISbuCjG4xHRzMEV4N1of7f2pke3vEiSw9LYgBlYXDenujmE022HnDl6aRIBrl9nVw841KDZSBv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkDWPCgU3FxkirDFrhx5XRAT4jrCL6JJRdFEPQc/0m0=;
 b=kyIoF8yTYuUgeda57YWQ8j/VSRuxDKieeT0Ba346WBd+wssW/JTEpIES6WH8TLlo815dJMysm3yrAZ/OmWxDN4jQiGiHiVIQmNP3n2oo5Ydt+NIVMgeoraLvLVV1227l2OE6LFECCfsGOHvjnORxJDVQ9E0dmVMkXHUfrFMe23/1NAH7LXBWp/xod8eR/H0gMAn0Aidh4xMtxPXUdVx96neBu1OOe3jKnZJgzYj9UTiFSVmp/uGcosCg/IvMvl7jBi7mhM5qUGswuXA/vMWLAzaMs3a9AxQNX+hLq68Zv1Vy6zwIw/fJ1A1ezMGQNFLX92PhdFyaAP9GvAsoPCCG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkDWPCgU3FxkirDFrhx5XRAT4jrCL6JJRdFEPQc/0m0=;
 b=IWJEf0onZrJ/CqQ+9VCGaO49iyqV0ZWzQY1jL9haV6dHXkLIjMwtlTswFe7J1p/2guspbKt4dQzj05eySFCuAjYG4vkX/uszfaDnKULXvG7RzR8nsU9mUqsu7YHe3KChqyRUDkqbJ98EL7wLoGEvz34JAHX2M6MiDhqzzrYpxKpPbV5Prc3pi6ZHJth4uLUZESNeP3x7oiD7QKELHK8o3DfYkC9HU18uVjhOUeCQkE0hfiFObQ/v+GuDrr+hkwiYbIlLZHR0aT5j+i1UWdSlFz0w75Q+lgvcq65EZe1JkuK4+QKV3xRbMwtxlvt7ttAk7e34EQCZagpnJzZ0wGl4ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7998.eurprd04.prod.outlook.com (2603:10a6:102:c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:07:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 08:07:21 +0000
Date: Thu, 8 Jan 2026 16:00:10 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH v2 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <ft43w567youffka6qwrpbzkwctk3dttwsnaqgx45atwjhoenc7@rbpluqz7xpm4>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
 <20251205032942.2259671-3-xu.yang_2@nxp.com>
 <20251216232638.rglecm3op6qit5a5@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216232638.rglecm3op6qit5a5@synopsys.com>
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e602ce-6ac7-4a72-7397-08de4e8cf32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MSZxHJDEM2Nj1a3F6PNSMYQGkHhKoIuoTA+nSaS+qqr1Kw4g1H02dhtDQc0S?=
 =?us-ascii?Q?YwfeoDnwVxF0p5lT+Q5O/LdRsHGFp3g8fswlLyh2fsD8o4eREZhvnsJQC1cd?=
 =?us-ascii?Q?vm/u4Ys6IfmRT6aki/QfTgd6XE2eIj/LzmqL0WRGICx4Hvr/CfizF8ZhIJ++?=
 =?us-ascii?Q?4kdCkkvWL9jy/jJ+yRQq8N9vyaROwlEO86nOdGbkS0or/aWPhOAY/+IyGffu?=
 =?us-ascii?Q?mJgzifz4ugPWd37TQrjNbUBjp1UOlD+yPbZQ0A4R8T6ynvq6p75YLaGNcw8h?=
 =?us-ascii?Q?Do57th3OhO7FP7yL0JeLkgezAfQTH2E4J6KD4yvU+hFx8qnUrcjyRt+v818g?=
 =?us-ascii?Q?tqw9UFITiZ4PINuj7g0xbzfuueXHbeQ0BYGqv5hU5Z+iczb5ZX4OLSo/muq8?=
 =?us-ascii?Q?HgRMIOdmpoaP0MvP+AZR0zz+CgVpMngI4Lij7KCpbdqi7IG+QL2HNA8g1yoV?=
 =?us-ascii?Q?Ffo9RTPy0oRNGsMRFMuEhmk9m0Z/gzDX1/HwsLNjQjsfiWjA9l2E6AD9aL6F?=
 =?us-ascii?Q?iQpoidItaAKQmcb13aUI/6t/3fgH+VcCLYWjN7n7rTupqRoeoB5TYGyUNE1V?=
 =?us-ascii?Q?C2pNXSIndSsD5jQjbaXOy79OBCZwi2580fI1hvZbJoaAJtM8iPueZ5pnfi7V?=
 =?us-ascii?Q?8jKu71QZ1/kzHR8lYIYdO3zx1Cue+1xM78+QFzke6+nCIYR5OQqlr1u/gxsO?=
 =?us-ascii?Q?yPbRqYJngiDlr4lZgUpJCx4y1n/iTmNOVsTM4yRqoCobch7yhZhpDJDqNhWe?=
 =?us-ascii?Q?gbB6jsAKpDMaX3Dz1JapHhrV0W0odIajCjeTZHP56wgsoiAcgTZ1F6Bn3XjY?=
 =?us-ascii?Q?shAt5Rh/dHn0+6TtdkTynm104zhfT39QDB/B40WVt5K53JvPyNXokdNZctIA?=
 =?us-ascii?Q?jYIL9IT2YSpOB9Dv0bHNbZAPMPt9v1hArENWFOXmS+q+efIE1af8qSx15Z/O?=
 =?us-ascii?Q?rcdedyl3sFPY14FWeL1beq3gvyx/WTK0LipV/pj7av8hHnHReE0L8k5efnq9?=
 =?us-ascii?Q?CEci3yp+A3rHc+Pdt3H3yaskwD/2WjqMR2v+mGpK4tAZ7SNTxYxtJeJbaJI+?=
 =?us-ascii?Q?rSqXSGCTTFtBjWEZJoW3n800JTKB45TXYL+xAN/D6a2geKlxvXCkBXd7vegk?=
 =?us-ascii?Q?C1DEVuNrUxYN2d4aBUkuH4oTPkyycvlnoLS6xHMtBDXJ7Jq3qAdfPdkV6ORB?=
 =?us-ascii?Q?RN5S4iNz3TQLF5/CZo9kbqCXPxk8319YvaSItVzi5TlKI2Q59NPRSgR5j6Pa?=
 =?us-ascii?Q?7B6Tsokn/VBVLNfWLLiR6Asuln2U/0PmaA9CTNuZkNk2HyYgKOmYaanYBzIy?=
 =?us-ascii?Q?kmHkLIt+6Xxyv4mN91HTFvr/6tMw/dogv7heQoyCtX8nGekxdjRuPHOdKaAE?=
 =?us-ascii?Q?L3LbzEB3yKrHJoHX4f9IYefA1+/X5VWWJM2yc985JXfuN/VZjsMKGWU3iwZ6?=
 =?us-ascii?Q?xm6p06TrLiyYWF4vfDny6jvzlsg/NpmVdkn++5Nl3bv69ChS/97+iF9lYKbE?=
 =?us-ascii?Q?e7R1459u+O2JY4QXUYsdrR0AOczhrUR3F20B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G6VtQncyrZkY+RGHrHmQ0r6fY99Ft0f19e9/3cmn7dzNtySuwq0Vk+dIqhOD?=
 =?us-ascii?Q?x+QO9TJzEJ4sdrDpMq6Q68B8SEsde8qhItmeaOotIrU4ELguJLfOLO3lizr3?=
 =?us-ascii?Q?gQEFJZ9BAV9EAF6XT7mxroPTzbmQlu+VOq2Uy7RGermZa+N3JmKWbcPoinHy?=
 =?us-ascii?Q?esPGtzHEgoHn1eKjIWuAkMYyluLEJHRHuK07fsYbg9ieVbFDJvQ0NmH8jt0m?=
 =?us-ascii?Q?S6wHKXkHoMwlaqsWmiwLQm8rZI0kdIFgPtxFFbGCItxrNsLE/lBUbXubRzzX?=
 =?us-ascii?Q?D4WofVY1Q62ky0GzYe570cLNKGG7NqfL7pR7hmpvxeIhPfPDqGgTNDc0rGIe?=
 =?us-ascii?Q?mg9k2cefswibbaW7LyCINmuxqIF2m4SuL8i2GQzpatMGoUA0cRVf7PGSEtzP?=
 =?us-ascii?Q?W5M4W6IUr8yHfC0TAJTYN07ZtQ01gfovvtiGlbjwG/DX0OasgRq4EvA+5feX?=
 =?us-ascii?Q?v3m2OWxi0M3Epef03FxEhT4DaECRyToPwNa5k8qCiaB/LF+Pbduh5zFicq4e?=
 =?us-ascii?Q?5uSTY6DE1zrCzj/NmlprDuBfo7ciHdUOraJ/yza4ciRLn2g3AvbfEJwcA6ru?=
 =?us-ascii?Q?ZNf7nV2/4gcRJoIY8w6WKo0ET3FfR3qL3lSD9X16tQ8f18D4gr623vnLNvRU?=
 =?us-ascii?Q?hDDlgtTl6Ve+q8wSSBn9IXpY7ALZRFYzMifOlttBtEzG+8VZtGPhPSycc8ei?=
 =?us-ascii?Q?aTbXNYJSK+8pcbsY29g4S8TLJ32jvlB3wYlPZsuGgDipRgk2GjjAV9wqR86y?=
 =?us-ascii?Q?v2xu1Mw5vbF7l073rGToJDL24xh2NFnB2UPN0MW7zbe55+YGTnwytMK6CkKt?=
 =?us-ascii?Q?xu8sCaZ2tRwslgVO4A35QIMBUtJDhzBmQ8o/BF1uV5apKOQKp/aprhUaEHgW?=
 =?us-ascii?Q?Woem0gQJJdJBUH104jxJljjvZvYeDucrLMhCkp6swqwWjfBluFSr9EgdFndL?=
 =?us-ascii?Q?FC5znED9ywmMBZUPOgwLBhCTerYzbpD3SW3CpTsS2U8St+YuhSu8PCXa3iGb?=
 =?us-ascii?Q?IjqB5758OgsCqPLun0MVuxfyE0D8CqvZ/s0FdWk561jC+CVyMVHUvvpdZVY7?=
 =?us-ascii?Q?9EVQZ04UinRykih7D33EC0j6mPJ3cHkBJACBXbNpjJazhMvtDrpRQV529abZ?=
 =?us-ascii?Q?Tl7qH6fQ73liChbdJnJY/dGcLwIVgw/f/WFp+XJhRsTlJOrGdrUcC5tPuOEC?=
 =?us-ascii?Q?YgOpFpUG6NEfnXzKN7oM5HpJMufDkEOgPmWi/cmNQe6UTgktL7ga90BR5Qko?=
 =?us-ascii?Q?EQ66JWr8dNIIMvHlWyDiBJIdT1qPW6Jk8+EeSnuPrZp75cew8emiLE+i9Hh0?=
 =?us-ascii?Q?eMDZyCrYfTvC3h4MK66k7JEZGGUqVe7YjDc3FC6Qk7VvWGl2SZNYm5zy0CjJ?=
 =?us-ascii?Q?1u4RgWb1GqQd3WzwO69cOHueu/DS3CUbjys+4ZHktRWzaPVckMxqCFsCyg0v?=
 =?us-ascii?Q?QAZ7FZhOX6abyxFbUOU9cm2MV4u1YzpqXTwBLj8jp/DrGvsuyOghn9P/YEF0?=
 =?us-ascii?Q?s/Jgntk1DWyD5KurxHbELE0PmkaFBYCsgVg1a0kts1np6mIehLV1AmGbzISQ?=
 =?us-ascii?Q?g+6SpggpGBKROyRNFPowGF7qFRUk33fYsYrzyuo5kA0srY//kMVaw6ZpYvlS?=
 =?us-ascii?Q?jF7e5BUQP5BgiJdORpwKuWMD9xxJPRI2Y2TIKCWdzig8cOER+4XttNuCL4+K?=
 =?us-ascii?Q?mrTLPTp3CSqeig0p0rwHNdrr9CDyUSWLMDzbS6NofhJWGGwS4ls2RhBCqjSh?=
 =?us-ascii?Q?a2ZjjO+E1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e602ce-6ac7-4a72-7397-08de4e8cf32b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:07:21.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hs51xZHYgbEo6FmBzyxtqUy+DiTdAQPJkuhI0wuwkoPQ2hetw5Tf/AMBACAArX54dMnezJmRXrmt8VX+YSLQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7998

On Tue, Dec 16, 2025 at 11:26:40PM +0000, Thinh Nguyen wrote:
> On Fri, Dec 05, 2025, Xu Yang wrote:
> > Do dwc3 core auto suspend enable for device and disable for host
> > , this can make sure dwc3 core device auto suspend setting is
> > correct all the time, the background of disable dwc3 core device
> > auto suspend is to make its parent device suspend immediately
> > (so wakeup enable can be enabled) after xhci-plat device suspended,
> > for device mode, we keep the dwc3 core device auto suspend is to
> > give some wait for gadget to be enumerated.
> > 
> > Note: It's a temporary solution until we switch to using the new
> >       flatten model.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - add a note suggested by Thinh
> > ---
> >  drivers/usb/dwc3/dwc3-imx8mp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> > index 8bece4baecbf..2e13ca588f42 100644
> > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > @@ -158,11 +158,31 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> > +{
> > +	if (role == USB_ROLE_HOST)
> > +		/*
> > +		 * For xhci host, we need disable dwc core auto
> > +		 * suspend, because during this auto suspend delay(5s),
> > +		 * xhci host RUN_STOP is cleared and wakeup is not
> > +		 * enabled, if device is inserted, xhci host can't
> > +		 * response the connection.
> > +		 */
> > +		pm_runtime_dont_use_autosuspend(dwc->dev);
> 
> As noted previously, don't we need to unwind this in dwc3_imx8mp_remove
> if the current mode device?

Thanks for the reminder. I check it, dwc3_core_remove() will call
pm_runtime_dont_use_autosuspend(). So it seems unnecessary to unwind it
again in dwc3_imx8mp_remove().

> 
> > +	else
> > +		pm_runtime_use_autosuspend(dwc->dev);
> > +}
> > +
> > +struct dwc3_glue_ops dwc3_imx_glue_ops = {
> > +	.pre_set_role   = dwc3_imx_pre_set_role,
> > +};
> > +
> >  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  {
> >  	struct device		*dev = &pdev->dev;
> >  	struct device_node	*node = dev->of_node;
> >  	struct dwc3_imx8mp	*dwc3_imx;
> > +	struct dwc3		*dwc3;
> >  	struct resource		*res;
> >  	int			err, irq;
> >  
> > @@ -240,6 +260,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  		goto depopulate;
> >  	}
> >  
> > +	dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
> > +	if (!dwc3) {
> > +		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
> > +		goto depopulate;
> > +	}
> > +
> > +	dwc3->glue_ops = &dwc3_imx_glue_ops;
> > +
> > +	if (dwc3->dr_mode == USB_DR_MODE_HOST)
> > +		pm_runtime_dont_use_autosuspend(dwc3->dev);
> > +
> >  	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
> >  					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
> >  	if (err) {
> > -- 
> > 2.34.1
> > 
> 
> The question above is trivial. You can add this in v3:
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

OK.

Thanks,
Xu Yang

