Return-Path: <linux-usb+bounces-21182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6205A494B3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 10:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDA718950F4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6472580CC;
	Fri, 28 Feb 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eNZVYnLn"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2044.outbound.protection.outlook.com [40.107.103.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D8257AE4;
	Fri, 28 Feb 2025 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740734418; cv=fail; b=uy/g1OOwMVTbVQXKiL+w2k/kvi/ad++AMi3wBokRpuhTYd53fKbF3vJ1965/SKh129w54ucvbcAmMiwtgwpeiOs2+yeF6QfsdvPQUkET46FkbLo0p4bdjAJUZmWjoejlzBxxh1JKPyjcl3hoP9xXpyfyXCyShi1Y1E6RpsabvKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740734418; c=relaxed/simple;
	bh=DBtIL8iVbBVBtTHlNDL4ozW1+hnkx+xSVt2b05ieUeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ovgSNq7fNB3BWonx1ERu6D+NYtGXWW/0yFDJAvoc0KcOK/6VeJ5uobOmemPSi/DW85iNAnk4sDKAZoUlIGSLxtHX1ca//WYutcmtv7QChcpddhSUl+dG2W+YTgpoDvOLdAlncX9ReA6gFaGGnCGGd1CbQi6qeRIQbl7nTvE+7Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eNZVYnLn; arc=fail smtp.client-ip=40.107.103.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2JXxxUWdXxiBHTSJpnJgikiRsbRblkhR1DJYQvcx2Bc4RFfEUrb8OuWt8z6u0czcPEph+w8a05mdpirREq4UiWz1CtRWc/8dH8hYPTVVBW6ARDUOrM6JQBzhc9Zz3IftRs9r2TTnFDlA1/kc0hGpcztUFpYDKh9pHZFwU1hc0N/qScp32Fd0fF0K7NsQMcZvS9+lck2i8QOwnyuYK1ljKsVeS19D+5rMgB1HEKKThjTgUh/qiW3yhBt1uhldyZLqb8M7C8RIBWmDFTrl7sSav/0V7uTyh1aP6BZEZSbKyKr0cWWWA3KyENqyBiK3X7ucmy9Lm1Lr2YEfi1GM1qaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVx6MDX8h2hqYXJg3VX4HgdfRxSToJ3+ApEbkBheRt8=;
 b=R8m7SEZMOpADy0/jEpba4gKpTCcaaaPdL3+nDzLtKcM9/j+xEQf26dLjLxKVbSnd992j3TeXwaNcgROyc5C5+ce7UuWE2+z4pYUqIORdgJxkxzDip570QwkWPYMPFTcKjGAf7n3z2twJWloVY9+cGIkNZaoksav/ZfeLtyDhBEVFoZu8KLq7IDfmTBH/NPyzYCvWJ6Pni1EQxF+KEfd3ZxJEGJvK67nVfpGIjXGHmO7m3EPcQFTr3HQzPL2OHXrP0bNol3JcCIYNpcix+vn8jowLBG+ME1BbLwlCdN7xWRQmc+akeJ/YJo1OgH/rQN9QCqmxOeUIbBQYXJmpPypgHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVx6MDX8h2hqYXJg3VX4HgdfRxSToJ3+ApEbkBheRt8=;
 b=eNZVYnLn32JZkD+0uIsggqYtEG6ApjZySk+jo2amJsu6FxK8tyWszc0k7F5r4LTV+53Fg3GObtFqsuedbzJsOIjg/u8vt2u5zRpeusMwt9eLgj5YDJq4z/trPx+86Ing1Y1a8IYpcxV1TG3h6ggE0hBq9eEzB6jx5xQJ29XjUBY0OjnwtKnXWdKrSWD4rg/9ONooWzLT63kXYLmh+b2ygg7iuAj8c8uqcASG0gB/NaXmYDssnzOhbOxlSUDi6DyA/nJA7ak2bHpRw6L1tJHKUiklxMOWJtnT1iyO1sPCAMxN8yrvj61jPUn/yFJbgviuHi7LS7AGWJjou4nTvX/K7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 09:20:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 09:20:12 +0000
Date: Fri, 28 Feb 2025 17:16:49 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <20250228091649.prmpcyro27fekgzm@hippo>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
 <3535014.QJadu78ljV@steina-w>
 <20250228023258.uznzhfnp7zsrxzed@hippo>
 <4411149.ejJDZkT8p0@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4411149.ejJDZkT8p0@steina-w>
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 205bc6d4-5a6c-42a8-3c42-08dd57d91a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y6vcQwYS+tF9m2xx0s+LSLpXFdPIcqVdfXVAEkdcIOGT7+uqHDPSHayvmsnA?=
 =?us-ascii?Q?jX4oXJJuqsltmzer+oRc6r1Asf8e0NHRlrIy9UhuewuEEnbBmgqCrSI3Wjhk?=
 =?us-ascii?Q?uLalaYZdN7qZjLArGiMqFzII81Nk04oGk7xzKG4eWcB0/ose8aMy3KfaZuf7?=
 =?us-ascii?Q?bhLs6VGaW8ebMiT1FF6rw9fPutzbOeumjdIzEeC8s4cwtFHe/KMgIcDi/yFg?=
 =?us-ascii?Q?mTfnrSHcKYY00vJTXbk22FxeFr+WOmwAIDOC3UnHMERErbbQpS+j8ZZcGj8z?=
 =?us-ascii?Q?XdiI0NXKk1J7SquwrSK4Avs1aCsSmUfgYueqQYCUvB3Cq9yfpzkY2gq/nCtD?=
 =?us-ascii?Q?+0YD88QXkjg5Sk6qIApZirI6S+3KCFpm1y8NWDHjbR53ty+jQpO/nsS/pAMF?=
 =?us-ascii?Q?Q3WtYGgLIKPbN/gvZrG8gIqOQ1OoWn+YvVeOcnCLlw77z2gYTONtjD2kd4OJ?=
 =?us-ascii?Q?Fy3aaktJMJeuqSb64Mi4bhwhBslJc/zFBg2ZF+ub5Blh0dREPekJwkNRVdfn?=
 =?us-ascii?Q?RnlsVj3qvrEEZdocAH3tptw+Y6xI1dbXQ8civxanbqWz9CU1yJ+k/rspvHlt?=
 =?us-ascii?Q?OiLl6RzMsE5VV6I1FmqPjEkZOg6h5sDDrWHoBJLfrGHLqRIFclmssnjTnw2o?=
 =?us-ascii?Q?ackGab9J3EuQwa85Gsl2rrHUc2FJWJ09eNHm9F1tgaS0WAkdCXFnF0zATI/l?=
 =?us-ascii?Q?9q4DjAGjcMia+fyn30DI+7CvV8EHlOATPAqzpc4YLzBhzEUSGxtV8x7VznRt?=
 =?us-ascii?Q?bo3jMjMUH13d3WiBjslUIBfsJRof+S9/9+RKsI66m6wZ/MK76fxOYNDyRhZy?=
 =?us-ascii?Q?gZGLz82NXW6qKdIU85FV76AyStNajs2rw9SIACZa7c4yhD19M7OYDQKfcjjp?=
 =?us-ascii?Q?0d4h6Em+32UgtmI3CpEAxxvTJUNIpUGwgSScs7ZpJi3QuubB2lUXzrlmtowb?=
 =?us-ascii?Q?XgsMoqv6RBVpiXBvd6DHuvShYOKurUQ5lTrJDnLHU8o7IDBDjfpJPBVtizUn?=
 =?us-ascii?Q?YmlSHvCDodBvn2o2D+j/fkW18JN3qG2/Vt/rgMIw/w/LGYeqPOQbVjXAFMgg?=
 =?us-ascii?Q?1Y4GcW1fCGELA8stdi+1gIDFkUh8KdqShLXrXqGq2frrHDcDwrqs6bleL6tA?=
 =?us-ascii?Q?klrArZqhcaEF+I0D+YLqDefuTESpNYVkHvETcPQmmDRANon9Mypg0i8mwU85?=
 =?us-ascii?Q?87O5rtE6zXmqoDdLVqzKh/AuqgWJ8qrm2KzdGCmoQN84E+qB0afRlCl2WtIy?=
 =?us-ascii?Q?K3wPsFphXOhAXeRXINjJgY8LnbE/IHGDXhpLVV6DGBUJekEDKpOOlvZ1O/Jx?=
 =?us-ascii?Q?n/obqeAqr5H2D/Xd+KKwSEIF7XjQ8SpEQzZ0GQiiHwpaNZnBn9o3GxSDAN1L?=
 =?us-ascii?Q?lNXScwt+dGfLxdPh6L0qYlR9Yy5VYK1uLjLIlA6a7IsFntY5kbbTnhzIbqn1?=
 =?us-ascii?Q?iAEqRjlrzKY4Q28S2sX7DCq6W7wcA9/6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9dVZ9mRSXg4NTgHY3x48sClJ39MabTAKqcBNgFjQFrzZztyQkrU1Fje3nGNd?=
 =?us-ascii?Q?0VOYHq9fI4CGzP5Jyao+kD0CPlEna7QUQTl1TozEeLghEHjEafRa+QwuoLP+?=
 =?us-ascii?Q?9kBHg5nrtPJtsM6sLyMKwqghw7beMudPBP6pwI9T04t9Hv0O/ZP9eDZrMb//?=
 =?us-ascii?Q?k7jGIF6XYOWZwzWWEdz+x/1W0ZWpLrj5gHwMfPxEGs9Nw2sQJQmQ5gRMi39V?=
 =?us-ascii?Q?huJEvKgTzi9XQoxgQwF6XK1f4KEEdznliPor+PvVdLVfQbTJnt/ScE8AcoYs?=
 =?us-ascii?Q?jQY8ccO9ZCmAwtsS0p3u9dJr23oUFxhnb2HaQbNzyiYFT9dSsKP8we7n2c7i?=
 =?us-ascii?Q?ZIvTKO9Q8wIJ2lk6QnzrBFUMq4yYg4GTwK7P2Lh6jAn/qu5C2s49vJ3/3sLu?=
 =?us-ascii?Q?34MRSydLIVnOtaAAgRENRxfQnAl34dqOSk1zIdWXySzuBAHpO/fdLy5HBdAd?=
 =?us-ascii?Q?y7IKRj5YgQ37UHiFEOFjN5F21JEalISs9cNySdAWeUef2zWFU9I5cwJ4YCVW?=
 =?us-ascii?Q?ooENUDWTBJRIXEQ9iDxNmMzdVR3NpF5y/zVXiCu6U5wKJMuz/ac4fPJZ/+KV?=
 =?us-ascii?Q?Ie/X8GKUyrh3QjIoseKCj958tncH7gtj+lpgYoTpTx8oG2f84JI80z7q6QYc?=
 =?us-ascii?Q?Y1yp6rJoiCO8L6pH9m5r3sW6V9f+QllN3/08L+qrtrbIxOcdlMaLfvX7TcMn?=
 =?us-ascii?Q?1eZHELlfVMdhiRH9en29AD1trZofAx/X7VQrJgExsvhTsoBfb1iaF86Lg6l/?=
 =?us-ascii?Q?mlVOZTyLBzhbNZz9UXWZ99wovZMyUxu803Nxbl+g0q9uqfk93Cyn9cdxDFXn?=
 =?us-ascii?Q?S+gG7DJPUBrrQvz6ryQ6/NrdCen7Qu8ddZC9kkmZXN+2Snk++Q370n/T4bbR?=
 =?us-ascii?Q?HRpIOQb+XQaLNZTGRKkQ0hPUyrfezs62lEzj9dpGIXh+a0SlOSwqcKDhIhDR?=
 =?us-ascii?Q?YApzJ/ZBQCyElVGve2CdpLekGWjZSVjAL0eaISYmrjZxkcyD4qd5qe2BHmCn?=
 =?us-ascii?Q?S/gNdZGx3Cgm+vZWYOHiuY2Yyl+K09yIliKy/9lJh2YqrWxI7naeaMrf+mSZ?=
 =?us-ascii?Q?qlZZlTgQoMx6oZcjP9SnPuoTQfX7UtxTal0dEajVyALhJ0WHYPbZd9H3YQzU?=
 =?us-ascii?Q?tE2f54xIReuVKxzEdKt6C2qA7AjiuUc/+dzENzw/yKbpt1oDOPqfYcpXYDr1?=
 =?us-ascii?Q?eAu74EPVKl2t/Jmn75dG79wH95z5vbSoPuv7fzC3edBqTkFMJ/tabSRrce8D?=
 =?us-ascii?Q?6+AOe/MDK9BnVqMonxC9gojk97bNAqrXj2s1A53eRPrw2t9b90E9ie1QIlGJ?=
 =?us-ascii?Q?BPp/Xh9S5kW9a/RR00JGWYpbY4Zkf+ISD+Vu9gjEtKa1Z0aHXzx5hghU2egH?=
 =?us-ascii?Q?pyFGqe101gQK0PL/86mc32+pSaryFhdoT3TeH3jndeJJi6ncsOlmyI4CBKf+?=
 =?us-ascii?Q?/xsU4A02oz84bKpmGEJt1YnZamDS/HY31PJGYAaJm1yAXhB7cWsE584GRxB8?=
 =?us-ascii?Q?RFjDDR6pSGFKqG+4HlUV48Qbx2t4arLcNzdAIQBEbw1FeXsvNdGBrCSmthFT?=
 =?us-ascii?Q?pR5D5D8Is+KRiVMry5wgb6LBLkmVxrNqkuRY4Yb3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205bc6d4-5a6c-42a8-3c42-08dd57d91a9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 09:20:12.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kqpTsSbufeV7lYBEG4pGu7bNe4mD9gompAeletInpmUXk/VfFc3lZ0Kbs20HAWBnoi2oYmTg7OmoivKDmulUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

On Fri, Feb 28, 2025 at 08:22:19AM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Freitag, 28. Februar 2025, 03:33:29 CET schrieb Xu Yang:
> > On Thu, Feb 27, 2025 at 04:12:54PM +0100, Alexander Stein wrote:
> > > Hi,
> > > 
> > > Am Donnerstag, 27. Februar 2025, 10:53:46 CET schrieb Xu Yang:
> > > > On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> > > > Control:
> > > > 
> > > > HSIO Block Control Overview:
> > > > - The HSIO block control include configuration and status registers that
> > > >   provide miscellaneous top-level controls for clocking, beat limiter
> > > >   enables, wakeup signal enables and interrupt status for the PCIe and USB
> > > >   interfaces.
> > > > 
> > > > The wakeup function of HSIO blkctl is basically same as non-core, except
> > > > improvements about power lost cases. This will add the wakeup setting for
> > > > HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
> > > > wakeup setting as needs.
> > > > 
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > 
> > > > ---
> > > > Changes in v3:
> > > >  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> > > > Changes in v2:
> > > >  - add Rb tag
> > > > ---
> > > >  drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 72 insertions(+)
> > > > 
> > > > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> > > > index 1394881fde5f..8c30908c11ed 100644
> > > > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > > > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > > > @@ -139,6 +139,22 @@
> > > >  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
> > > >  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> > > >  
> > > > +/*
> > > > + * HSIO Block Control Register
> > > > + */
> > > > +
> > > > +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> > > > +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> > > > +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> > > > +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> > > > +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> > > > +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> > > > +
> > > > +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> > > > +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> > > > +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> > > > +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> > > > +
> > > >  struct usbmisc_ops {
> > > >  	/* It's called once when probe a usb device */
> > > >  	int (*init)(struct imx_usbmisc_data *data);
> > > > @@ -159,6 +175,7 @@ struct usbmisc_ops {
> > > >  
> > > >  struct imx_usbmisc {
> > > >  	void __iomem *base;
> > > > +	void __iomem *blkctl;
> > > >  	spinlock_t lock;
> > > >  	const struct usbmisc_ops *ops;
> > > >  };
> > > > @@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
> > > >  		return 0;
> > > >  }
> > > >  
> > > > +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> > > > +{
> > > > +	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> > > > +
> > > > +	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
> > > > +		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
> > > > +
> > > > +	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
> > > > +		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> > > > +
> > > > +	/* Select session valid as VBUS wakeup source */
> > > > +	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
> > > > +
> > > > +	return wakeup_setting;
> > > > +}
> > > > +
> > > > +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> > > > +{
> > > > +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > > > +	unsigned long flags;
> > > > +	u32 val;
> > > > +
> > > > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > > > +	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > > +	val &= ~BLKCTL_WAKEUP_SOURCE;
> > > > +
> > > > +	if (enabled)
> > > > +		val |= usbmisc_blkctl_wakeup_setting(data);
> > > > +
> > > > +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > > 
> > > usbmisc->blkctl is NULL if DT does not provide a 2nd IORESOURCE_MEM.
> > 
> > Good catch. Thanks!
> > 
> > It may return an errno if usbmisc->blkctl is NULL.
> > 
> > > 
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static const struct usbmisc_ops imx25_usbmisc_ops = {
> > > >  	.init = usbmisc_imx25_init,
> > > >  	.post = usbmisc_imx25_post,
> > > > @@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
> > > >  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> > > >  };
> > > >  
> > > > +static const struct usbmisc_ops imx95_usbmisc_ops = {
> > > > +	.init = usbmisc_imx7d_init,
> > > > +	.set_wakeup = usbmisc_imx95_set_wakeup,
> > > > +	.charger_detection = imx7d_charger_detection,
> > > > +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> > > > +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> > > > +};
> > > > +
> > > >  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
> > > >  {
> > > >  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > > > @@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
> > > >  		.compatible = "fsl,imx8ulp-usbmisc",
> > > >  		.data = &imx7ulp_usbmisc_ops,
> > > >  	},
> > > > +	{
> > > > +		.compatible = "fsl,imx95-usbmisc",
> > > > +		.data = &imx95_usbmisc_ops,
> > > > +	},
> > > >  	{ /* sentinel */ }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > > @@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > > >  static int usbmisc_imx_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct imx_usbmisc *data;
> > > > +	struct resource *res;
> > > >  
> > > >  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > > >  	if (!data)
> > > > @@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
> > > >  	if (IS_ERR(data->base))
> > > >  		return PTR_ERR(data->base);
> > > >  
> > > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > > +	if (res) {
> > > > +		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
> > > > +		if (IS_ERR(data->blkctl))
> > > > +			return PTR_ERR(data->blkctl);
> > > > +	}
> > > > +
> > > 
> > > Any chance to ensure imx95 has actually data->blkctl?
> > 
> > I think let usbmisc_imx95_set_wakeup() return an error should be enough.
> 
> Better fail early rather than later.
> 
> > Some errors will be printed for user. Also dt-bindings has restriction for
> > imx95.
> 
> That's true, but don't assume the DT is always setup correctly.

Sure, I thought about this question again.

If 2nd IORESOURCE_MEM is not provided, the USB controller could still function
normally in most scenarios except when USB wakeup is required. So if the probe()
return a failure just caused by improper wakeup configurations seems not that
necessary. In this case, ensuring the kernel does not panic should suffice.

Therfore, I prefer to skip wakeup setting if blkctl is NULL now.
Do you have any ideas?

Thanks,
Xu Yang

