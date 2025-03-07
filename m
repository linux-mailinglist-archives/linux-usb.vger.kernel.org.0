Return-Path: <linux-usb+bounces-21493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9078A5630E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 09:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38E98188FD6F
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 08:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4641E1DEB;
	Fri,  7 Mar 2025 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CCTLF0at"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2067.outbound.protection.outlook.com [40.107.105.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A576E1A5B9E;
	Fri,  7 Mar 2025 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337814; cv=fail; b=nW8QMnddVpQMOUsDV72hgyHpavw31ov1K1W/xAUqMGXF7w6b1lJQW/6Oei1yk9JjW67Tv2bRVwJf/WSzGE/awDCTx9f6U5kp7jL5PRYqBBz6JMFAEJU47gIepX9ldIrmgbms0/WODQl6NU1N3RYVukH8bXHadyImvwFSMl6DT6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337814; c=relaxed/simple;
	bh=AFaATb7j4YVRZuvtHIwuYHqOR8JVwXyLtAQCD3dCLQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O5wJ25jw1K7SVgy6K0WunSOR1jDbmUqJB+jBAFwVGsbtYLaqyikKIkf9/0A6OP0tWnPfnbWkqQI3LscTfIjsbkMnXItCK3qHthzD5sNs6QhYSXfDvtP7K6nxSBOwt39TvHH0ZVHfnsqsGtbpQ/gD+ohmZO1FyWNSCgWeDKVF1H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CCTLF0at; arc=fail smtp.client-ip=40.107.105.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rErw5K8wk42I8OnyZ4mL+aUYwiR/rgWj4dXWGL7kxJEhStqQc5+8tkrcMTh6gnlBUNEi3PEx8w4hAB3k9Mi50J0yFIXO2qxZMEoH5uACcK4ygpwQ6bDrHwCuuXuCu6H/1kwSSZ+I9qgBh7BX+nJdQFH/nxek1QqyvY5Pst0gPaTCNS0mxaOstdwpZh/0foDWpC3ffZm7+eWRoYvhIHsKpzlN9VBYKbPp+z+lyyYbaPvZpLt4JeaOr/0E3cq9jyUCBk2uTunq/WhKCW/PKWw9mDoV1DKXZcz6AFjuGC1YO/j5rA8ubjh3l6cjEzcYBESehcxgW5fomkCBOTq0wmU1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7NtBFt0oQ5XW+mdxeWn6sqsPPFo1d/VNfnVMn594J0=;
 b=UhC7WOyPsTfamPnYHAVeYEYaYpwWe5S200XKBuzn+z+6OwA6OsCiPj4Y/gmceR5s54zKToN6PguW0gRwEOJKZN6DjlZmFX833fMFn3zOu+oVx3YzEHkIYl/01l+WH4TSaBUZl+phjps1TI/SFgr+OcPu0553cmfUE2kE6vRukb1NGhUwH+yFU+yq2z1nZ02Kw8WCzr+QVLTMoqBhAuf2EfTqakuo3w5jF1tCTaacttDe/2l/eX/27eY9rPozjmo3VhZ2Crb3phdnFJCeogzrHrM5UKkSpp0ZFAt7KCW7ZrkFRPnLKGO5FJHHFvOJXLmiyuo41vUUHMx5IqyEd8GOaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7NtBFt0oQ5XW+mdxeWn6sqsPPFo1d/VNfnVMn594J0=;
 b=CCTLF0at3GUx6SmqTDmZZCbEf05HiW69reOyoQ9nQyEE8NT4tkC+YS2QWJB7G30t4sn9k5WAyaDFtcPjUa/liSrN4bl1Pqw8Jubl8JXr6yNyw9PQ4wFzsIKsPXzTndEloWZHn5+GeyEP5yTZslinYxpZ2Bwj7AQrmu23uhjDLsMaVvEPPHSDQUv6IxHYcJJjtJrpUkfjceltmxkoteKUrURxLH19a7EVbDJ8N57fpMRM/eDZAw9pth4Qyqwk9zDH0+owTQM9Rp5VfrxRUs458NZYPTQ/aDXdZeWJwes+CAvSI9y3NKJa7vZvsI5Ig21R/kCrI4QCSoJ19/xeVpdRhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 08:56:47 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 08:56:47 +0000
Date: Fri, 7 Mar 2025 16:53:18 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250307085304.gng4gdk2hni7vvnm@hippo>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
 <Z8XjPhl4jYdggDKr@lizhi-Precision-Tower-5810>
 <20250304134221.s7wlfauibd2gc5zo@hippo>
 <Z8caUE8k33HoOHOv@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8caUE8k33HoOHOv@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4392bb-2377-480f-a30b-08dd5d55fe11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1VRUiHe5+fkIQyzNFwv0+F6KgB0Aeky2pe9XQm5MZW/A5WdiyDpSj6cpiYap?=
 =?us-ascii?Q?+0lSsz+kdDUQKLZjRvpiPsTZ4SJ8/Mu8vvdXX+jAqVmvrr8edGJ1aAxKST4Q?=
 =?us-ascii?Q?yUylP0Svgk83X0LV6Uzgsw+/6ys7SyvcWC5YFTXNrEAyF3bnRYxg98ksCtA2?=
 =?us-ascii?Q?8JjNsuKxTA8BipgxdsXLskxreIwXPD5AWOvxVTKP8IMb/2kPirco6bM9xhb+?=
 =?us-ascii?Q?J9c+03ug0oCGroVNIMo/rM4VhaEY2xCV95uadNH6CoJhi5H7QNlW1zLXzuaz?=
 =?us-ascii?Q?Uvk5ZFvyAtWvo34ankk6dy3tWA+pdgzGpJYz0+X0wA8h6Eji9DoBn6Tz+eDb?=
 =?us-ascii?Q?PsZMEUaeBeeYYFADJs8hrUHJOpo47jOVZh+4xu8UqUZ7iAydYBRmhdm+o/nX?=
 =?us-ascii?Q?opFaDUwu6i0vjWH0cPMt74R95q872bY8JA3neNhndgNMc6Edtr3p43ty7VF3?=
 =?us-ascii?Q?wyfMarqcBNty+1T9ak88AQwbLoetqEpZfUNR5LP7I01ffYulAhi/rzaGNiBE?=
 =?us-ascii?Q?QokwL3hCYRBrRVCncfstiPwn6hcLsDMxRU9+K/P9weXgrMHLQ5DeUivJPvGW?=
 =?us-ascii?Q?b8XwbTBQ0v0vswc2O7hCzDLCnPrrYoDx/L389l1NiONfigeFcyL09dfTU5Y6?=
 =?us-ascii?Q?j0JkH0kEsG/TErF2XX2scqGgEWbXNy31sigMzKKFuqDj0Dd3cwnt4/wPrZuJ?=
 =?us-ascii?Q?Z7ieMYYYznZCpGywt0qaMauSLavXSN/rQQ6C0sfTtGuXn7jvFjvqAu4lVa3q?=
 =?us-ascii?Q?slwQOHeD67rYlmRV84hwRqV/Zm7I7PdkAqSTu9ukurtwxwNpOFSDYYTVwmlz?=
 =?us-ascii?Q?UaIbY6ceu4CYjaEgpwPwPG+llqTzIdKZLM9FRLmmSo7/fYDtJ5gauwV21PHU?=
 =?us-ascii?Q?//jiQj0d3R2ekm82mI9t+aU9c8/IXgXPO/wRoFQlmE2pi/ePsxCOgoD/1SbM?=
 =?us-ascii?Q?FGhkoBR+blcLzGpMIeLuTQgUv3sfN6tD2s48prQRzE1P5JO/0Spcjr0dYgjv?=
 =?us-ascii?Q?+XLyZB4ONjaJJ/nNf9X+Ro5Kb9vt7exyzzn4e9N4D1/Ot6Z/OLCZBtvHMe8X?=
 =?us-ascii?Q?hHZ+1FD9K2f2/Pdb5UG4sln8Bmn0zI1Odfp9lPhaRD7H4y55RI8y/RLOYLmh?=
 =?us-ascii?Q?XQYPtgTLD7wCwclhJDgtDpH6liq1/Hf3hdLUFCzW9OZDy7Qlu1F/y/TiDKkD?=
 =?us-ascii?Q?xTG8Ij81pVCIvw+ImrYjjiKQidXwISbBf3VCu2jpONBCF7HHU+eAGWPWFRiz?=
 =?us-ascii?Q?xsjuwZyqSzVYLOlYFuDq3a/N81Lxv8nQZ52phTY1cRptDYXyUvK1aUDYoj8W?=
 =?us-ascii?Q?n5KPjhtcj/XAyB8G/JjagicfkqFCxfU+DJnmTSh5g7WoURnEWHYkHQw/BJfw?=
 =?us-ascii?Q?k6CdjuJVQNRUzoB9IEjXVn8MOWbjIbIng6ToMDS21o/DBALi5wYpbVeAnZKf?=
 =?us-ascii?Q?UcaX20cdbLUxiDZo/HYSxjfnwysbSYK1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8tqjXxt/fEp3hOJkUEKIIZdCO8uv87Y0OnPg+Ht17kBhl+DHvXVjr/iiaWIf?=
 =?us-ascii?Q?/7BN32QSjmtWs0BaeBB1QjgpHlmK08bCrD/YJJLWKFiMZAUZwd/R62QbtYZl?=
 =?us-ascii?Q?ZTLXxIpuiHN10sxNzhz0MrWhp5y9yA2yrEzUNQpfe7UGtWogXQ1k8fsPfYBO?=
 =?us-ascii?Q?WHDN6FJLQ8eqmVQUQcZRAkXrfoxzfI7lkiAoP+YAh/00F1wK0LE6rANf21TD?=
 =?us-ascii?Q?RTR+AY4LU4cgHJu6r7+I+f/9SqBSbWxQ5IEgj9V8o1U/gSdlUs3yt9UvJkEu?=
 =?us-ascii?Q?bRcFiJ9mDyN5UGth3kuIFFEORZZK94ZiBGz+VUFWkN2pKxcRvfPsumusibtk?=
 =?us-ascii?Q?nP+P3W4d5RtNI+7N675psWTVD2PzWe1A5i63u7E6+9L9/PZ75v3Ti8+cNmaY?=
 =?us-ascii?Q?DvsEOBTpTbP4A9DGx4wDZ7I+x40o5obocNclDGDTZ61o8PxquHmO+oKTN5A1?=
 =?us-ascii?Q?43vQ0jtQXAjUrsYGwu6S6LnIAPp1C8cUrJl5GW0RqBwocwpek9tkXWyD1Ro7?=
 =?us-ascii?Q?Rueqx17zj2dy7IovblsJTyNRGPphTVhtZKC19GhraPbweV9WCBNHnd3d3lUS?=
 =?us-ascii?Q?Fkw2hWFyv67fFOG+5TAN+cGjbImDpreBFhNSi631jTWgojNU2Ta9JIm8Dekk?=
 =?us-ascii?Q?IzJZdhMViJFm6c8K0BAjkLIwXZm0Wb+VaUFfZiGPmkZNDpL/+hscMSWLp3v2?=
 =?us-ascii?Q?Q8XGQR0PkYb1vb2ZnCaC/VH3ym08sYXC7HxmfsCnZhnrg7THmwrDQ7LnWOyh?=
 =?us-ascii?Q?iDKFa/bTmhrXAcgFZGrMdQkUyclzl7g7c+zbjPuyZtHYjL1JbB8lZBhAIC00?=
 =?us-ascii?Q?zWgOsP8t6WnUsDM7OZIftlpZi98OvlJYdzluwSEzA/VK+t+Fzq2Eq0Hikkb+?=
 =?us-ascii?Q?kb/p7/56eyDlqooEPrj4Y9qhVhYXOcN9gjww52v5m97mzo40TAaF/Jzo895L?=
 =?us-ascii?Q?SHYwWGfnV4ZGfyvsabKBfjCC+0FRzqWTYGnfD0YllnNmh8AZL4cfzJaun/gO?=
 =?us-ascii?Q?gCHxhjaZTRo7eKJLUUEn5UsgA9MAkerw4CFvH15HvaG6SCCCobQjdxr8Dlmc?=
 =?us-ascii?Q?4gS7a9vVqFC2CvLsRi4yXWjiNCAtp0egzzWru8B4LDuSoabzS+wrpv8ps+sg?=
 =?us-ascii?Q?zcMrXrXenaPBn+4kCaIa8Vgl5NoW/HKH2sHMAF4rMgmDgzo81VLNHEcBGZfT?=
 =?us-ascii?Q?Sq82/vOhoLGjbLvxck+/YY3wXczcSm/q7ZRlZ99IlAxH2fXvL8VK1leF4ZeT?=
 =?us-ascii?Q?rVLse2adoDd2K99pdyvWC9yLvjscUV9L7DyM+2mGz/riMHSAQUzAAYE/0/RA?=
 =?us-ascii?Q?ARmG2tc0cTi17rKMg6iWoFgcR0++PEsGznVpU+DePXA/fMYla05gcYABMhO6?=
 =?us-ascii?Q?9CTaX6UsD1RrZBmJm1m7JfSr2elGh/LB8DJdM30x/pyRO/b3Tj5+Wm6IAI7W?=
 =?us-ascii?Q?R9Es3TmMZTRpmMYC55GOCj8daj1zqn33mV0J4yWL8SsQ8Tr8OHsIGbUUMOR6?=
 =?us-ascii?Q?Y60qghtanYUpoyMtKHKkNThIkS0f1b5ismuACtJDKKnNM8Knav/d0YTDQLRN?=
 =?us-ascii?Q?oZtSOEU+MPRGtHqT+GOxtTL+X0v5gr4qmejcuzcY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4392bb-2377-480f-a30b-08dd5d55fe11
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 08:56:47.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCGy5X97F17j0+FFiPtj/d58/YFj5lVQc4EWAs8BGRwp3JifNQVgQApV4CVtF9WAwocC/JKN9LjdD+8GNeCH5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755

On Tue, Mar 04, 2025 at 10:20:48AM -0500, Frank Li wrote:
> On Tue, Mar 04, 2025 at 09:42:21PM +0800, Xu Yang wrote:
> > On Mon, Mar 03, 2025 at 12:13:34PM -0500, Frank Li wrote:
> > > On Mon, Mar 03, 2025 at 11:33:41AM +0800, Xu Yang wrote:
> > > > In previous imx platform, normal USB controller interrupt and wakeup
> > > > interrupt are bound to one irq line. However, it changes on latest
> > > > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > > > This will add wakeup interrupt handling for i.MX95 to support various
> > > > wakeup events.
> > > >
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > > Changes in v4:
> > > >  - warning if no irq provided for imx95
> > > > Changes in v3:
> > > >  - include <linux/irq.h> to fix possible build issue
> > > > Changes in v2:
> > > >  - rename irq to wakeup_irq
> > > >  - disable irq by default
> > > >  - enable irq when suspend, disable irq when resume
> > > > ---
> > > >  drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 35 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > index 1a7fc638213e..2baae9e6e673 100644
> > > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > @@ -6,6 +6,7 @@
> > > >   */
> > > >
> > > >  #include <linux/module.h>
> > > > +#include <linux/irq.h>
> > > >  #include <linux/of.h>
> > > >  #include <linux/of_platform.h>
> > > >  #include <linux/platform_device.h>
> > > > @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
> > > >  	struct clk *clk;
> > > >  	struct clk *clk_wakeup;
> > > >  	struct imx_usbmisc_data *usbmisc_data;
> > > > +	int wakeup_irq;
> > > >  	bool supports_runtime_pm;
> > > >  	bool override_phy_control;
> > > >  	bool in_lpm;
> > > > @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> > > >  	return ret;
> > > >  }
> > > >
> > > > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > > > +{
> > > > +	struct ci_hdrc_imx_data *imx_data = data;
> > > > +
> > > > +	disable_irq_nosync(irq);
> > > > +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> > > > +
> > > > +	return IRQ_HANDLED;
> > > > +}
> > > > +
> > > >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct ci_hdrc_imx_data *data;
> > > > @@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> > > >  		data->supports_runtime_pm = true;
> > > >
> > > > +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> > > > +	if (data->wakeup_irq > 0) {
> > > > +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> > > > +						NULL, ci_wakeup_irq_handler,
> > > > +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > > > +						pdata.name, data);
> > > > +		if (ret)
> > > > +			goto err_clk;
> > > > +	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
> > > > +		dev_warn(dev, "wakeup irq is missing\n");
> > > > +	}
> > > > +
> > >
> > > Suggest add imx95_usb_data, and new flags, like have_wakeup_irq.
> > >
> > > 	if (imx_platform_flag->have_wakeup_irq) {
> > > 		...
> > > 		ret = devm_request_threaded_irq();
> > > 		if (ret) {
> > > 			dev_warning(...);
> > > 			goto err_clk;
> > > 		}
> > > 	}
> >
> > Thanks for your suggestion. I might have different understanding about
> > it. I prefer to not add flag here. Given the following points:
> > (1) the wakeup irq is optional, the USB controller can still functional
> > well if properly set. (2) I may need add imx_usb_data for each new Soc,
> > however, it seems like unnecessary.
> 
> You need add more code about device_is_compatible(dev, "fsl,imx95-usb")
> 
> device_is_compatible(dev, "fsl,imx95-usb") |
> device_is_compatible(dev, "abc") |
> ...
> 
> the below code will be simple
> 
> 	if (imx_platform_flag->have_wakeup_irq) {
> 		data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> 		if (data->wakeup_irq > 0)
> 			...
> 		else
> 			dev_warn_once(dev, "wakeup irq is missing\n");
> 
> 	}

Sure, thanks for your comments.

Given that this irq is optional, it appears reasonable not to print a
warning, especially since the dt-binding check will provide warnings.
Then, I'll need not to add device_is_compatible() or have_wakeup_irq
flag.

Thanks,
Xu Yang

> 
> Frank
> 
> >
> > >
> > > >  	ret = imx_usbmisc_init(data->usbmisc_data);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > > > @@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
> > > >  	}
> > > >
> > > >  	imx_disable_unprepare_clks(dev);
> > > > +	enable_irq(data->wakeup_irq);
> > >
> > > Suggest check data->wakeup_irq and other places.
> > >
> > > 	if (data->wakeup_irq > 0)
> > > 		enable_irq(data->wakeup_irq);
> > >
> > > And you should check enable_irq()'s return value also.
> >
> > I just find dedicated wakeirq mechanism (drivers/base/power/wakeirq.c)
> > basically fit my needs. I'm going to switch to use wakeirq. Then I'll
> > needn't to do such thing manually.
> >
> > Thanks,
> > Xu Yang
> >
> > >
> > > Frank
> > >
> > > >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> > > >  		cpu_latency_qos_remove_request(&data->pm_qos_req);
> > > >
> > > > @@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
> > > >  	if (data->plat_data->flags & CI_HDRC_PMQOS)
> > > >  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
> > > >
> > > > +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> > > > +		disable_irq_nosync(data->wakeup_irq);
> > > > +
> > > >  	ret = imx_prepare_enable_clks(dev);
> > > >  	if (ret)
> > > >  		return ret;
> > > > @@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> > > >  		return ret;
> > > >
> > > >  	pinctrl_pm_select_sleep_state(dev);
> > > > +
> > > > +	if (device_may_wakeup(dev))
> > > > +		enable_irq_wake(data->wakeup_irq);
> > > > +
> > > >  	return ret;
> > > >  }
> > > >
> > > > @@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> > > >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> > > >  	int ret;
> > > >
> > > > +	if (device_may_wakeup(dev))
> > > > +		disable_irq_wake(data->wakeup_irq);
> > > > +
> > > >  	pinctrl_pm_select_default_state(dev);
> > > >  	ret = imx_controller_resume(dev, PMSG_RESUME);
> > > >  	if (!ret && data->supports_runtime_pm) {
> > > > --
> > > > 2.34.1
> > > >

