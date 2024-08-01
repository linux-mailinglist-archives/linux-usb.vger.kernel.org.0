Return-Path: <linux-usb+bounces-12860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D09450F2
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 18:42:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81C5F1C256A4
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 16:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694D41B4C39;
	Thu,  1 Aug 2024 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EGFN8ixL"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346B1B3722;
	Thu,  1 Aug 2024 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722530323; cv=fail; b=pAAGyawudaXXMa3nEan8svhnxpZxBQdObuf8de8aJnWjHmqFa0U/dSHq/pDlH6022pwZGt2GXAUem1AlPFLxpU8GKd1qNzWfsmGbBLLvkZ6rhrMuK3s1gplsJ2JuyRU3JrpzhJ4JvKeosqRKJNpkjBlWImFotLyoRXswRlVr9oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722530323; c=relaxed/simple;
	bh=m69uaGOUwDLmUm00VyqR0Jiq7xj/ozAICUt157ilY6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kJ0mh3+zgvVOxKfUv7qNT2MW8zjeIelZ4VQYRkFo0jQ7RyJ6S4A090DFXONldT6G6OQYfdwSnxRSpWQxLyKWizW2+V0KiUPK+hPwHtsTXkvo9LNoZfUuPwQ21nzqBexxqx5zZX7Ai/GUxGgTT51MnIcfBKhqxTCbtHijoREjIFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EGFN8ixL; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvIxiWI+2HHaf+5QjrwAOioo8QA4UbPXrFmbj3O5Ejz9dF49s4Ors8rBItMPd1lHk9qQQcp+ovNJXCaFYPzSsj1ogovJtPrD44TrJHpIpXqeSOQTgk/XcTn20Vu8btVrQDxEsTTOPKAI2FgU30XiJZlrcx2YAGpHa4KblOJkDtPnA4a6ooIqP/lpOPR7qdChQmE3HdFWb9UdmOffBDhUTcEcM74ATG4RB0V+lCvmO4HXWE+2Hnj/sBkEA9cMnA1AVeJTh4LOFzWSIxzvPliiXXDHQ6X6rSa+djFcZM/+W9SoegvTi5aNCjGCckU6AR+VaMiLr819QTVZa8n+0p0+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Y/SBsDEXc3+rsLkRi85aONiYAiRHFhFSCR9Mp/RNfc=;
 b=yawLXZStnpeHdy4av2euxwzLWOTfhdOq8adi7cO7B6RMTDib4CemmzPO82le3t3/ZRhhrWXJW/3lFTfpNNaoYvWLGtgN5MsYUjnEzpWC4j/YEUA/P7cSTgA8Nj7FHtwQtfmXrdyPaZTvSnMa7lATi0JgIJolQxn2ELPN5b4lVM0bCy1l/gnhHRi6uZoex9o/OTMYhUvtoBRPGTvbtegp9h6LRwSugnZPat66PYJiz4AqdOySPgrFeOPHrtDWsyzkVb4ErvpkmLULXUndwWlDKYLfUE6BzMR9ElgG4E8DzVv+W/0ewONuLxwsk4834CJvGcBs0Uj4y0wZuaQN9qHLEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Y/SBsDEXc3+rsLkRi85aONiYAiRHFhFSCR9Mp/RNfc=;
 b=EGFN8ixLH7+M3alw+nwZIKmCVmCe71sDjXmQUwA0xbz+QbIM/CSA6SqDb+T7BoTV79h1S4MFMtazocGHzXhupLa5f8c+X9RQp56emmuhhvTj1xF5BaU6Hr/fgzRRIaxz3UtvrDufUCQLFNl9no03IjLIu+gb/BI9FiHMj3gJ4v6fh6ud9/Yv+Zx5kNvmYWawbqOuTNneA3BeWE6drMe7VpVMYcMpLLIiIIk0yxW7EVLI6p0IHdDQ9g/Qe1HlaXtBp9GU7WRPxkLGNy9srXCYYxk1vc2ZUcClG/FgVB8uvmqMXo6+nsEEnPf7IsnLbyfUss3l8P7UQXDcbtAk+boSYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10256.eurprd04.prod.outlook.com (2603:10a6:800:241::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 16:38:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 16:38:38 +0000
Date: Thu, 1 Aug 2024 12:38:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Xu Yang <xu.yang_2@nxp.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robh@kernel.org,
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
	andersson@kernel.org, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <Zqu6BWEGraMpQqHG@lizhi-Precision-Tower-5810>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
 <20240801141501.yt6ytrf2gzmravwx@hippo>
 <20240801162946.l423ue5ihfcxfiia@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801162946.l423ue5ihfcxfiia@pengutronix.de>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10256:EE_
X-MS-Office365-Filtering-Correlation-Id: 1624560e-1f7e-41d7-2085-08dcb24864ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bk4AsuyeqEfQySNJD6XOibUmmc2XfaBN9SGePo9qPkt0ooWejyNTN46WggqG?=
 =?us-ascii?Q?5bnkGWLABV6Ll3kaOYLZ0+oHRl0TSN0ACJ3pm/E+Tsrr+vp8YKLWNDaDX78o?=
 =?us-ascii?Q?BaRNukrbnF8312oVMm4CNCGZY6oSR/1cLMtqPmVGK4X4xpeiUiM9GTD/0Mf2?=
 =?us-ascii?Q?E1hw5OF2zr1APMngzZp6CAGV7Gd4TvvafbCHr/i0NjpIPtFc2EskGiXEblXa?=
 =?us-ascii?Q?pArmYEfUeqDmZSzeXcn7axSLruC9Pf90vO6rFTO6l46In/GvL7uDFzBGTnhS?=
 =?us-ascii?Q?PTwnD8ZRGspXGM+F+VYaDfA7hp259mf/2dyjHkYKI5RLYtl73tc/HQQgx543?=
 =?us-ascii?Q?zsXmEsxPVmOb7VmyK/eLAvnl5WSLt5ecJpNODr6kiPyXdBcQFsvgdKmCfvDU?=
 =?us-ascii?Q?Ohu8SuBgNKkLUSfI+R9D3pmwkSWML35F8ceV/3aMfZ+dnCevMF2nfZ0cYxSB?=
 =?us-ascii?Q?1X0sQZpkhwtduAoHCFKDpBa9nSRiyMeLxJDRfKJ8vR6GGAW+pJAJK/CrcMUx?=
 =?us-ascii?Q?EpaiESXwHwLUg/g8TlnZM55gEPQMOVUBN8ZjW7E7bg17oD2HvK+bMTahu8gO?=
 =?us-ascii?Q?P+UTKDF7gLSpiJUkqPkUhleGZg1cAssFS+vI7GIsiFtP6ZJyTjTyaHaZaZwD?=
 =?us-ascii?Q?3A1bdRipbiQlZ5oFPZcGvdUE7GEEuR7ieevjM8Ep04hydoQsUgD9K19WV7xn?=
 =?us-ascii?Q?t1TH8Vow3K5f5Sk0KZ8bLu3hI6rnLVmHLf98yl/5+LmOfWDqQ1QgsXP0ds8G?=
 =?us-ascii?Q?tZdFPUjQIOdmUAV0bxM0HWIUw7EwokxVH7gXed5KV1Uvx1mk12odXbNN1ofq?=
 =?us-ascii?Q?cTCFyqXAxK5XTkmOHEV8hAL6NjxtIo/T2AQWIptfcjXwFTUq9dWLRQD4KN79?=
 =?us-ascii?Q?1p7W++TRFd06QGH8APE1DSCSo1R93U5RC+BEVPMt60OGAbhgEt4c71rttiOn?=
 =?us-ascii?Q?d0qqSRb+DU81UHFnPvR9BsQOBbAEzwqk6GoJNA6ucHaci0z2AZ+I5LOMvZF0?=
 =?us-ascii?Q?4JbKfv3x00ysVz5T0He8jQiC6oSQRhPyUntCsJoqwMmLfKwI1VXpXbSm6qv0?=
 =?us-ascii?Q?fxLEf8XtG4dXawaei8bRd4g+fVLOoywW7SfKDC1Ht7AHrYpCimIuqqYchgb0?=
 =?us-ascii?Q?Z4440I1Z0bwzaNmKUXd+dVYFhf3mnFDm4/O9pWppoaBIgsLWxLECavtFJfvy?=
 =?us-ascii?Q?EUxj4KR0MUYgPPI1qf0Wkdzuix/JDUMnu22VI5ff3Kglkz156uukM5lDAldk?=
 =?us-ascii?Q?tr7ev+BfnYKTM2PfkiOqQDcymgPaVA9ePZsE0WbMc/2v8Bq3pArIqk75gWKq?=
 =?us-ascii?Q?boiqJtDz4Xp7hsEHroTApVDPjKD7kOq0HFguI86F3e8v64BKcSW5Usf++MDA?=
 =?us-ascii?Q?1XIbj1Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1KqvNGEAtsd/XQr+X/vtLrMwg3dQbTDR/kxQv677IfC66Vdwyi8mh1U+ESv?=
 =?us-ascii?Q?ny2hGD8TYfQeArfJmrbO0lB8vnwyFc9/wSn6p3P+xvZVvj+xTXETYIaPawjc?=
 =?us-ascii?Q?8LoCvg+LpUgUb+YaInPczngmQsWgB8Z48drjFDgjnLB7d79gQV3V7ed7RFFG?=
 =?us-ascii?Q?ug7UfvaDLEVtwnerzEw4nrSjY7zPLM8ReK3lT8/p2+MtRsJV3E2F0eIIThhx?=
 =?us-ascii?Q?BlrnVnWgUv/DID8TnxXAIK5QguzUZAzn1gC86iuUONIVvQa+ooMuSaO4GHDG?=
 =?us-ascii?Q?61P5dvTf6KpXuM8fLAJZ5Jb8R4xWHMpCcx953AR2CI6Eo0k643uwfz23Ci0Y?=
 =?us-ascii?Q?LDE9fS1l+HDYPgydddf3qNLq19JqyszND7t9svedm9KVvh3dZY/wN5ActvZU?=
 =?us-ascii?Q?1cUgL8Hvf93+C7S3upLwKL7kJIk60z8Ux85w1e+4HhLEQtLSBEed+ZSvJHJ4?=
 =?us-ascii?Q?iIibJ6FKGmqZBasRX9/uyHT06uJdeUVpqzpppS4U69hHUuD1C1WKKPB8nbfx?=
 =?us-ascii?Q?HBoZLSxYWgLsQYhXKuZ2MgRhKcQ6hE9p0nNhDqGnQMa6ShZ/OwPWZ84pdmWW?=
 =?us-ascii?Q?kffZrgSBtyT3t46Ex5io1vdok/aIslv9rKHTOaR1RQxPioA9f1O0bXHMJ91V?=
 =?us-ascii?Q?IyKPGpH5LxX2F+2Qnp2y65C0h6m16UsPpDihYrnzFEyx9OCJq2L3GcooHHSN?=
 =?us-ascii?Q?8IbWxJLx6pyWQxioSosPQ3gEtYRtbe2lV9pu50jRyhIEUrRfxvc1KCAmYV+b?=
 =?us-ascii?Q?NghHFXGGASk/xdBqQnGx4Jidld6+34l3FepC/g2t2qaML7xH6JgFAN9BlSSH?=
 =?us-ascii?Q?ZaU24cqRk2p3VXHpYeLkDNN0xenIm8G0gcqnUvMSxeAm6mYQ0JgKzIJtoJge?=
 =?us-ascii?Q?ydIPYLTRBTWAMaSgDDRss5zt/XsxAgM5L8J2oRRVQTRFrqMhc0Yb+QZVouEh?=
 =?us-ascii?Q?+xBCoHOEeus7i/8ggJ/Yuap5ek9+Gedvm4tMhLY+kqalnukMEN3a6uXWuzLP?=
 =?us-ascii?Q?5iXz1y+9HdjQcgxXMHr6OoG6CaZGuy2leIX4BBUcmYwepogCWyWcEwFjxKiT?=
 =?us-ascii?Q?vxFHrm/SZpWYtUdRgM9Y8H7qYUXt6hZfkffW+ObbEZGg3MmhXfCMxjOL9zm4?=
 =?us-ascii?Q?K1PATTqj62CdqtelxPekcwuLw2aGG/HvAG8/biWAMzonP3EFHttntAtx0LXJ?=
 =?us-ascii?Q?yaay8pvXJav+lhQYHzm/uPBSUd24EK61An7aCNrE7KeRfASPXOf4joFNcs0k?=
 =?us-ascii?Q?umPFLJH0uZ/Heww0tRXsvb462f4UkdUISJ4xI6q+z/LhtX/zys32CLnMtLWe?=
 =?us-ascii?Q?MgHKo/wj41acU3caLwhc3eEain+HyGYpYNd1D0qlfq1K+9+ErQ3r9rG6cT4A?=
 =?us-ascii?Q?+XqrRiM3ihNCBiT+sXccTU0VD9non/Eb7TGiWAPXPef2XET5GZ6hbVQDLT6j?=
 =?us-ascii?Q?sGV+YIrmz28Rt1Th7C/XRa8ihBftW83c2XWroQ7cWtqVFuQcbJwn+CaUXYN5?=
 =?us-ascii?Q?gKzKWj6aDXcsZYntGM9EJj5fGK6VyZu76dKItWH+JzlONdhZ2cxctfz85pl5?=
 =?us-ascii?Q?us/5Wbo2LbnCKBE8jZE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1624560e-1f7e-41d7-2085-08dcb24864ed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 16:38:38.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vd2ffjmeZlbFCTzuD1PLGQpHMBQLGbFD8c7r4jProPd0lG4m8jFEryDUd9TUJ5zY2S0EfgH4bio4w77IUpJhtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10256

On Thu, Aug 01, 2024 at 06:29:46PM +0200, Marco Felsch wrote:
> Hi,
>
> On 24-08-01, Xu Yang wrote:
> > On Thu, Aug 01, 2024 at 02:49:33PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Aug 01, 2024 at 02:49:05PM GMT, Xu Yang wrote:
> > > > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > > > used for connecting, disconnecting and switching orientation of
> > > > the SuperSpeed lines in USB Type-C applications.
> > > >
> > > > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > > >
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > >
> > > > ---
> > > > Changes in v2:
> > > >  - add Acked-by tag
> > > >  - s/SBU/SuperSpeed in commit message
> > > > ---
> > > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > index 8a5f837eff94..152849f744c1 100644
> > > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > > @@ -20,6 +20,7 @@ properties:
> > > >      items:
> > > >        - enum:
> > > >            - nxp,cbdtu02043
> > > > +          - nxp,ptn36043
> > >
> > > PTN36043 isn't an SBU mux, so it is incorrect to declare that it is
> > > compatible with the "gpio-sbu-mux".
> >
> > Well, so I should create a compatible such as "gpio-ss-mux" and make some
> > changes on the driver, right?
>
> You're aware that I already sent patches regarding this topic:
>
> https://lore.kernel.org/all/20230504-b4-v6-3-topic-boards-imx8mp-evk-dual-role-usb-v2-0-3889b1b2050c@pengutronix.de

I just go through this thread. Looks like rob like use gpio mux-control to
to do that. is my understand Correct?

Frank

>
> Regards,
>   Marco
>
> >
> > Thanks,
> > Xu Yang
> >
> > >
> > > >            - onnn,fsusb43l10x
> > > >            - pericom,pi3usb102
> > > >            - ti,tmuxhs4212
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >
> >

