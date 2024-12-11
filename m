Return-Path: <linux-usb+bounces-18398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B18539ECE60
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 15:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16427188CAE8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2DC236941;
	Wed, 11 Dec 2024 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MzMMQRbx"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185B236938
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926247; cv=fail; b=gwK2FpwQ5yZkpNU7Z9+i28q6/enENH+4lBunp75h6LtLi2Eo4NEl2yeH80Ntwulp+qn5wj1HC6hM1m4OtDe94bm7fTomYqwtBF6UkD3d035vfnBtpp0xz/uiGLaT4goOLCR7mkauOlu8rmbhkGdopdDnngOYImKI6nXru5ZiAkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926247; c=relaxed/simple;
	bh=mjsLYzigF+F9qm/d3Wgo+yb/xcaXuixjflclLpGDPQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F8OFUFONw8ZLR/emJjXq/mn4ZID0LyPRcR0Gvc8NQiR/pD5YCk3q6CsXAuOhQtO4uARyO3AiKh1dLsga7cHqxS5I1CoevDXIrV6F/iSFMN0kP5KjgTCBvuO3lQFDtfqiv9cpbdy6d8VhPQ0ZXuitW5rHvLFxSsEcLU0p/LRp2DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MzMMQRbx; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnUMppqt+7O+x3bQYQHT6KFeYiIwCsX9rokUAlwyda80tAfQRmMxlM4yLG2aiPWu/+jtsUWRQUVsXVeFqFGXipFrr9PGEeLJGRHOsgOc4PWPBUqJ4yzPiKbyFFIBSYyAzaoD0tuf4AhTJFmu7PbszPkZ7edN1FndLCgWGGCSh83f7VNrDe1WcP/ltsOHLi9N8MLWBr/AKrYzhoQ4iXsVd+xnEG1XVAHquRqN2wpUaApjezXvMH8kq2psJN8CJW2DJ+4DrkBNuDQQEv48ZIbooWI14q4SDOxPPUzldikv0tRjO/hyZYYlYiGiKBKLYSoAnCsDZozoQLidAdbS1aRMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwHVjNPpflm8ofrI4DNh53l/cjCvWVl7fQ5cXPzx0ps=;
 b=Umhi9ZOXrDu+GSAgKMdRoyUiI3EllDpjECcPTp4+u0GMtPPBhJ0ovEXCSomgj4cPg37URphpIPLrNjxvAZpHOTQQZ3m3BJWdaUy1T65a2ieNh5Gd4YgN+qfrb18gHn1a+OTdHinI+yps6XwQQ95mQxDDFXdYT7w8GNMuMhMi3jeo3MsCmTWGD5v+/TNDOtZuD8mqUx8ArwdHCIIlJRP160sgavSz5YSMBx8GRpJ8230nSjDNYauiqg677kNvetc7Pu7zek4rls1zLM6XNTKDJ3tVVzJPacp09WXy3fMfnn7srSaVCJKF4nVJEyOpUR2detbjm08XsrAkzzTZdCM1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwHVjNPpflm8ofrI4DNh53l/cjCvWVl7fQ5cXPzx0ps=;
 b=MzMMQRbxZyFDe5m+ggwlqCgUMWahMCMKLSFJX2siWPOrlsxIrP+5GHeuRwOrIxGT2k+r2Is/6GCT/lXGguLEPYPYwzaTBqCBaVuwtNO0B1RMXLIX2WNnyzVgKvJqNEl4WXlReK+MH60KUEzWTBm+dRvANqpZECW7WYu/KQRh60IDwQcPrI+iMd6Lqv7IZ/d9OtETQq6I4qMqMNMzig5QGz++un4fgPFZIC2PTSRgMcJJvdKGkJGm+JPwZR/jD90f8GD46Zf8HyHTXfqa3wOA5MLPYL1TrRM0qKU+ErzSPTdrPQ4loH4kjHDGUlbSNMUpOYxwFDg0RnlWLFa4+DgX7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9861.eurprd04.prod.outlook.com (2603:10a6:102:381::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 14:10:38 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 14:10:38 +0000
Date: Wed, 11 Dec 2024 22:07:55 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: fix NULL pointer issue on shared irq
 case
Message-ID: <20241211140550.ce3htcg6mhak2zvy@hippo>
References: <20241211105953.1205343-1-xu.yang_2@nxp.com>
 <20241211110928.GA25492@francesco-nb>
 <20241211114006.ebrut7rvmixznc22@hippo>
 <Z1l8qiIu-169Gyxj@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1l8qiIu-169Gyxj@gaggiata.pivistrello.it>
X-ClientProxiedBy: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: cae0fb49-8c67-4564-b198-08dd19ed9670
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ijrEaEk8JA7Wi9+zcPNERnu8Gegrt67mTfuUW5T5BbzP3dJZoIlKqgheKst9?=
 =?us-ascii?Q?Yn10Qa2NQJTfRbskcjtATQuuu+6Ik5IZSbz9cm8AT8RfWC8JAvw+DlHyzeKi?=
 =?us-ascii?Q?+qf/2QC9sYXDA9m4LnZJzI/jw7QWlOYDSLmLcdux+oOth50AKg+/XZJyMw5j?=
 =?us-ascii?Q?QZwm9LZMvEeEtJnDQM4zgY9qoXjT8G5Ipnm0uhOBLjlPGaBEkwASilqADAP8?=
 =?us-ascii?Q?BxT0L4nH1m2dKLwlQuPLzOZqIAeTF2tSFixk9FirwdHEUk+jRo2HBG37w6eh?=
 =?us-ascii?Q?B8Qs+XYnH+JZM3xrnVfzMtHFbvtvcBXUUciujfvB3s0llo7kNSx1flyOD0nL?=
 =?us-ascii?Q?u9MM8VoPR7l/Jn1XKwsFMocxT0o7WvUjxOivWAk9GSzcNLymxRBhBkWX4/yJ?=
 =?us-ascii?Q?krVjNhywdXsvHL6Fkpc+Sge1dQ1A0tNPtGHIUDTAyOTWbFHGdLqXKMa8I7KJ?=
 =?us-ascii?Q?x4m/draYU5eWBaWxaepI5hrCV7Eo36IC7jyWHpAtM3yWmlPZWBX+CYH8xZS6?=
 =?us-ascii?Q?XXbp3sgdGlYL+idvzYGzTBxi2TwyCLabeBxeaRtRj1NPPRDNLUba9nw/GBgX?=
 =?us-ascii?Q?aLET1nB4fjGBXpGpdx7CGdgK966sI5gCwqjLEkQiH1MIAT9VZjWwXhDNsCdD?=
 =?us-ascii?Q?euXMjb0nt9B9xQqYczaRGK5C4+61Xmrgo19r2R89XwGqXFuHZpEd53LJw7FY?=
 =?us-ascii?Q?qFbW9TkPTu33CaYY2WPTJ2xbtOcut/Cf9XUcjbDLNB6x+5f5J/f2rRLbz8W9?=
 =?us-ascii?Q?ps60gYo5ydi2wICxrdMgAZAZY/YH40bwWkRa8QVfWcLbjwlEQeqPzPx/CrTb?=
 =?us-ascii?Q?hnMJn1B7tcoBqUa2xPvHCxq29KSgok+PmSYM68SpdaMdolOBVmubW6S8XyOP?=
 =?us-ascii?Q?2v4PahlrpgO6zDHRqm1FtE8nuoUKUO1MEBQMLsaYvmZiXNKeWEUi5Ergq7ta?=
 =?us-ascii?Q?6O1dY3fYyOFbrCj5+/MtMrW/t8M4/FGVQdo0Jl2v/sr/J3nG+Z3AGdy0Tur1?=
 =?us-ascii?Q?U0vjySeMC5hYRqawb2JzKpCEroJGlr4c3s60AjPX2xrmrPQlnNlALf/wl7lX?=
 =?us-ascii?Q?2cGzK3fpPGRmrsmmC4R73oawJk5Q3S/dwgpY6Q24lmQwPpKp2/TYRASzk45y?=
 =?us-ascii?Q?DycwEy7GepmjV9yxs6oTg3HfkPtAz8JYaBO3yV5ELi3NRtLucsqcbzqQjBwg?=
 =?us-ascii?Q?PqxvE6wZU0eW3HO1ZXxrTWHmFw+qIU8GY8bQRpqWM75B5BmIwSxCHxh3UKvh?=
 =?us-ascii?Q?Tr3hxL8Waosd0sDPomfhamnVXcGnCl4m5meI91qAxkxIEizt2hMq3JzC+8qy?=
 =?us-ascii?Q?Q8LpmdJF5gnsHS/EqnqzGkv3ui3TtrYp/o58ywgQvhnInbZ1FaSYk7471zRJ?=
 =?us-ascii?Q?QuOqdke1SzBQgXnWv/Nuvei8xMxb3wRHAP5oxm/OheTcZ9IMAQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xtaIKgWWo7HBRa7bMbwXAVBxopJldrP76WhlqiwgoB5kodnz+Qg2c6JTHR52?=
 =?us-ascii?Q?WbA8IOHMbZBqBQ7qcgDYJApq9XHbyzn/6Djr2/Foi8G+9Pyd/VVHEo8c+e9O?=
 =?us-ascii?Q?HQQaJWtyrsrjxyMhgJ8qQQnEuRYkXsKS0fGX4gLv7+jyX0mrQJc+MhVIvh2L?=
 =?us-ascii?Q?a3y5SpwR+LDxdUCiPbrSH+sTKHciKOp2sSN04EWGQ0oq5KDpURZQFtV/4ZmG?=
 =?us-ascii?Q?FU8OeN0zyrw8/gPK3tHMc5z/0dgK3BSTq+ROo5vc+2h72A7acGo/VhFhBqSX?=
 =?us-ascii?Q?Owu9hcinTgdquVRRTzA4M/DJHoPWmy7xGmbKTNO38Qc/E+qUPd/Vd3HjJTXt?=
 =?us-ascii?Q?NHB7II/0YiE9xFRTLLu9pFq7IjS41Gow1zwcAvp/5BpSh2uG3NkujNEz1vmc?=
 =?us-ascii?Q?D4TP5/iJbxXGl1K6xf72B9K5TJ2zDYbFRgiZv/IvzXYG/d8z6XKCZ/jF2fuh?=
 =?us-ascii?Q?EXb0SZYDhm8B3U833ZGw4wVicDdmquE7ngi44DDgVFjWzW4yUvcowX5/+GBk?=
 =?us-ascii?Q?ibOWcQ6DqbpJePx1U2iWwCGHyGnqjjUu12O7s4oza1xWtim+bU0GoPphm9ye?=
 =?us-ascii?Q?CHakTdjwufFH3bB19/6hvdUetHX/ibwEhwa01oSSikVx5SU4CYL7w2ANtDdl?=
 =?us-ascii?Q?Kf1BBLGaWPQ+96QGuW+ht4d6kRCvsgXUt6ykWKN2EwvZrTtvv/Hg4Qe215eJ?=
 =?us-ascii?Q?DJisUmd+Mw9SgiWirCSPP3OOJRLJP2AIrV7A22mMkk0q71/CY7qlgjfR/BjB?=
 =?us-ascii?Q?gKc0YqXSavNBCL/hWOYhw+m0gzgoHpRiJqtzY5o1ETj3iPEJTGfNeFunuyYx?=
 =?us-ascii?Q?DyXqC0EEUqvsARcPueIwYngHAl9oXt9K/qubOmz1KO+nY7pNWqtA+BAH6/1b?=
 =?us-ascii?Q?lL1xvM6RtgzflFXuOrWWItx6k1oGgfKWjFCO5WeTe3H30G3EL0T5ormCDNrh?=
 =?us-ascii?Q?XOPaF4Qc5Sib80wmdsvMsnE8yQZ+E+cAJwGJbfdYv//gMahWTQxL62qtuVn1?=
 =?us-ascii?Q?Fbat92vxTYWx6EqweIHeOY0HAH+Bd5RBuoCs9FAlifWE8beIE7FhHc1eF/+t?=
 =?us-ascii?Q?7gu98hkUQMF0wMs+SZjcsj8uIETgVA3EdDMN3nwnvYN81W0XuXgjAEAwYqCL?=
 =?us-ascii?Q?MF6vQevGMu0IIg4maguu0eingSFDRVY6tEiYe2jS86CllsP41UlEXdx5zhho?=
 =?us-ascii?Q?iNgLil5/x0tL34qAZAIFnsJRylO7c4bEfMJQlzLp4Ef++bBx3OLQfOXuy5+j?=
 =?us-ascii?Q?m7sJypPrMPqgrgjGkJBj2FVdugrxAqH36TWvPOgBUq6LuTh1mlp9uHDC46Lt?=
 =?us-ascii?Q?OC+OgtPlg0pu46VsbN+PO5tTyRzTZAR5O3Z9UJksWOUqCQ38QQkLSwtREJJh?=
 =?us-ascii?Q?7bSmEvAnrNB3/mf0MvXoVucgp5S/Xr5bWMRZxPenyE7W41FSeZHXyzLGvr+J?=
 =?us-ascii?Q?vVBshiOWMjSdO7XeqyJ5Jhi73V5g+nYFnWnsMIwCN7I72uis+i9yzB2++psM?=
 =?us-ascii?Q?trdd2rfesVY+KWFLm+TP6xYYqiRT+3TD9QLtg6S0jHFXRtrSK/XM7LSjAYNo?=
 =?us-ascii?Q?RKewrFn5LsBhubvNx/0TebvEio2IolPD2ZJF/7r1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae0fb49-8c67-4564-b198-08dd19ed9670
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 14:10:38.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXcFNmRot3yonaSWINlj4glis4RoU4tAykn5yE4o2LC6fi0yZfMNy3GfkDK7TT6MTSiDbC9dVJAkJt2y1Mi3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9861

On Wed, Dec 11, 2024 at 12:51:06PM +0100, Francesco Dolcini wrote:
> On Wed, Dec 11, 2024 at 07:40:51PM +0800, Xu Yang wrote:
> > On Wed, Dec 11, 2024 at 12:09:28PM +0100, Francesco Dolcini wrote:
> > > Hello,
> > > 
> > > On Wed, Dec 11, 2024 at 06:59:53PM +0800, Xu Yang wrote:
> > > > The tcpci_irq() may meet below NULL pointer dereference issue:
> > > > 
> > > > [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> > > > [    2.641951] status 0x1, 0x37f
> > > > [    2.650659] Mem abort info:
> > > > [    2.656490]   ESR = 0x0000000096000004
> > > > [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits

[...]

> > > 
> > > I do not think this is the correct fix, what about using
> > > IRQF_NO_AUTOEN ? Would it solve the issue? You need to adjust also the
> > > disable/enable irq accordingly.
> > 
> > Not work. Probe failed directly.
> > 
> > [    2.646391] tcpci 2-0050: probe with driver tcpci failed with error -22
> > [    2.680086] tcpci 2-0051: probe with driver tcpci failed with error -22
> 
> Ok, clear. The reason is the shared IRQ.
> 
> I think your change will break the support for edge IRQ, because we have
> interrupt generated calling tcpci_register_port and they will just be lost if
> the interrupt is not already requested.

Do you really meet issue where interrupts got lost?

I can't find the case because ALERT_MASK is set to 0 firstly, and
ALERT_MASK is assigned some value in tcpci_init() which should be
the last step of tcpm_register_port(). So the interrupts are masked
before tcpci_register_port() completed. That's say, typec chip can't
pull down ALERT line during this stage even though you don't call
disable_irq(). This behavior is suit for both level and edge type
interrupt.

