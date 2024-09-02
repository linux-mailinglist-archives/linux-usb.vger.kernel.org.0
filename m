Return-Path: <linux-usb+bounces-14474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E64968199
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 10:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285D51F2210D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 08:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92BD185B68;
	Mon,  2 Sep 2024 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VuI8iJl0"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B457152E12;
	Mon,  2 Sep 2024 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265366; cv=fail; b=sW5JcFxsfNSl4EmzRUTWbOKl6cG4lGvq+j+4pDHMEMJOb7uSe68d3oYxSH/pAyq1GJD69oRyJUIfiIED0Z1mukdcE3yYwpRSRofM/ob8uQ3d5XIuBk8q/X6J54ybHNElXR6AEK7Y1Ep0z0zexAw/Wd4FX32MW39uoBTGwBurvq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265366; c=relaxed/simple;
	bh=q49QjRAotU02w/0s2ILpoacqcZnudJK1iEHBLIxv/QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E/G/UA+fZM0i/GwEYKeItplENsVqjHPUnvdtNvBtKQZN0jSN95MK0+vz4Yl2t6w+2tdc2NWKLdFKJ6nV2ukGeGh8aCcMCfFbtmznJn+uwd2aegCLWNGOQ4Yz4sfPNlnGZpmRgUYFsuV5One1rGaWyFfhZqzGhVvcDi38GXMxnBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VuI8iJl0; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwns6/uTDJY1ulPONghRzoV0vq4ed3Kf4Z6yMaFWOb4FqW2fjfmEMH0KdKa3USMDl1tXmZKKpDdTcrHNKaCXOiaizLsULKB2LdXLkqNqG3RkEj3EhP1M1nygfQwNHhg6fwOYntDZVbK9h11qO91w8xRhhmmfhN7eblSbDEQVqLu21FakPOwJNBtVcm8MGujI2TjyE8kdLhR4OMrEbwEbipF0rgQzQ0WBxrH08M8oJEPL+jwUBMyam68PYgc8CsNuvHRSkNtECgIJVHxGMPmCc7hQaSpcnobPbAhPOxknKX10tLH+z78Ftif0Lq5F+TlnFKEhSSG5I0R3+zjwTgNESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Wzsntn8o6XrTOKQSgC/CL1F3QpgW/1dizSSqEOJTtU=;
 b=QYylNthbBSePDcyW4gEnHlSxSwV6D2ZDhwiNnce/Rd6EaIY61npkKIuUQvrJoKvpKABD83sxUL2ImeSFL5ZFQUxhVxbeIWHW14UOu+pWwkqLS3XnB+Bhetvo2R1d5RHBv1zMMKpRialKBGu9jeHuTS4uYR5uyEx1s4hDL1gEIm1IX3JkbT32twRIod8bjIOA4JScU7oP/i/EFXKcHvNRdJft/h2QgeB68g+yyhC6swK3Q5Z3f2AtCp7pRqQWx7Mnp6EUGqNmCtts+H4n+mJ1hFXojholW6tC+DRbO9itbNN2c5+BommWPjc4slihYRViQ8YwlB6joPLBp3dDUrU0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wzsntn8o6XrTOKQSgC/CL1F3QpgW/1dizSSqEOJTtU=;
 b=VuI8iJl0yPdsUlkZ+9MEcTIWw3595/bk1ucHrB2bDjVNPff7S9n/rnsxL8fCyQFDJrvD+k+Tddl2aApYZeyH0OOy1c2IF3p/L9kZ9laSFwnCnaWcmLbtuGK1JgqFH/N1dJvF2VeiOulVpo3/JX+VMvTT34uY1sIP8Vr2LXOHz/DzayvZWrFt4IOBKhcyWpJ+hQ9JrggwkgfmRJVWWdqBk7eHUb0zTfYonfLVldCnprWBWPS2EJeDH5gqxxr5qFgdDi8BqhyWHxlWywQH86LlapV3wVOHH1QhwFNwCuiz/gPgLTJLxtTXnqSeGn7CtW4DKHPauOVqwti9aFwSDtuxuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:22:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:22:40 +0000
Date: Mon, 2 Sep 2024 16:21:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, jun.li@nxp.com,
	l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: imx95: add usb3 related nodes
Message-ID: <20240902082126.spmo5ifgzqlf7gm4@hippo>
References: <20240826070854.1948347-1-xu.yang_2@nxp.com>
 <20240826070854.1948347-4-xu.yang_2@nxp.com>
 <ZtQgpYY9KjP9FUi5@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtQgpYY9KjP9FUi5@dragon>
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 29339fd2-4e39-4673-b37e-08dccb2868fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h8Ee9EMkCNpAn6z99+STzvH/+I0RytiSUPuO2GTzEBTvhnPt6pelsuUpnX6g?=
 =?us-ascii?Q?rmgXxa9XePmpDCFaJIkZ9Wy5AU41NqewKvdOgk10E4toSncU6GePhPAZPxtM?=
 =?us-ascii?Q?wiOSeIyTXKHc12atPbeC7dLRT1RKQXVmhivYo9j/D3vwwwn1ed9EQJlHnbN1?=
 =?us-ascii?Q?CwqNBWUdyUr3Shw2/Jh83hQUoWU4vgJLa5GXHYi5t/yMLA3in1d/as4+tNqm?=
 =?us-ascii?Q?O6jv1nq4hKUaYUy8M8//JA6vJszbjubRjBx6v5XWdR76r3ecj7R3/NIEQuvv?=
 =?us-ascii?Q?ohSDZfebuYcXcu66nfif9U22NDYWfi3M5WZlYkCnBiYUq6zki6kThMqXp84r?=
 =?us-ascii?Q?ZzT8CRPKtPEfqIPbzcK/Hmd+z27rM48lY0+8if/Y7MsoO7aZ9j2rxsBDZ76g?=
 =?us-ascii?Q?Bskp/Lw/Ungr1oSQsLUwoWDuw6N1vQ9OHUp5tSgMY5Pbpvbs3ge4vvhCWkdX?=
 =?us-ascii?Q?Nue5sPN28eym5sSKBEIaN/LU+W82OV5/4wyxjXrawRn3c75N2Khk3yRCPRu3?=
 =?us-ascii?Q?Q1X0u6zUNEqlROM9nuNMLj7oUafnI4PsZN/BN56oIq+nAQc7Ew3VaCcPP2SN?=
 =?us-ascii?Q?85HYWl7izkRovKpCeH/xdCf4sPwwRH3ZKq6M6NNv+R4Dy17M8qGcw1vVlta/?=
 =?us-ascii?Q?zbI7PIEuy7rIV4pV9NnLXYMcJrolaet53e81ROeifbYu77FjsPeQzl/DArng?=
 =?us-ascii?Q?nX+xEO7BN5TUL/69yGmqjE3IVPZgC6UfiqfX5JQ19W1pEs5+lm7H8pLInv6C?=
 =?us-ascii?Q?+H/bvPFJYZ8xgxRxUFqL9POvwVih4qGF8tYh1NVpzN5n5aYOoFk2m1a0Xg3n?=
 =?us-ascii?Q?OtwVS4DgK4P3WsPYac5dpGsOzCCHrM2cy056oXM8DOYbY62TcisT/N8O32lk?=
 =?us-ascii?Q?ztkALDORFq9TRTm8prUvvVM9QWZHLuQKeqy9VpMRFt+UgW/zYVk0MRummt6E?=
 =?us-ascii?Q?Vu5Dzr7micLEFyFUDMxXwEi59vYzswKT95ERcSQSKbB7q2L0lPoplmdFCO4L?=
 =?us-ascii?Q?FQfm8v+38vTpOnxH9MdOCt8SkznLKSu1WbWqtbLlzqC73G3NpG08TutDFZpF?=
 =?us-ascii?Q?TLwlyuKsYk0QSNYoRuH5O7E3S8U5cyJgjC9bS/NXLc03YVNJI2QqNNSOHUBW?=
 =?us-ascii?Q?/zVEUXau4yE9jzU816dpHJ+NJhd1TDbUGlPsHjkCYZf+x/P28yevuiWoT5gk?=
 =?us-ascii?Q?s7M4YU/3VTytheMMC6Npor/hKh6jAshwuLce/vEC0kd/kHeAAi/T8EhUONX/?=
 =?us-ascii?Q?RZ30jV05AfA0nea3fPqYPT/2HQ5nCEvAcuk3hRsbqlWC3IxirES48r5FwGWT?=
 =?us-ascii?Q?DRxnbfyBErotry2gwtJIlMXWxWqFaMXbYD6mRLU+q5DNIJZNdXgnyvHxyhTs?=
 =?us-ascii?Q?UFIgAABeCtdBFT6o81vb9kf9qUu+qsuHLCKu0KQrfPSWio7TBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dHFl0oXwzvNALJQEs5gBmLX9yTTJlHqWTdU+FbWHW7xDXjkTD05SQA70jkSj?=
 =?us-ascii?Q?oqLUsSkZlLLhehj2m8UvyAE3veqLx9DnaDOW7L4nOOAQGa+pVEsXW4TiY1HY?=
 =?us-ascii?Q?zxZKq0ydlL51c4EXdgdUn/p6zMm47YT9arzq2mvAQGpJ7I4uli0aAisroZ1R?=
 =?us-ascii?Q?6dKGm46MBxLI7j/7zFh6O01KlXDiLRzRuOumICpvvFLU6I/RRxzqhQdrOILR?=
 =?us-ascii?Q?9uSNayblAxg2NGF5gn1kio+2fQ19DGuL+9isasOvTGwkaeGsGmo6g6eo5QGS?=
 =?us-ascii?Q?dcQAO62BcyJeFJuFwx0j180zpJH6Q3VQ2GkCZJ7Pkel0LQBQ8x7h67jAV1Qw?=
 =?us-ascii?Q?bKSvsQIl+sEreZ54pb9Q/Q4i88HjwA09KYpSiEI7q+8+SrQrtcddn4nSSJtV?=
 =?us-ascii?Q?Px0hjdq12OK/0Vwh6pWwjYHKmLduNcBc/Evh4X3Tun43+itx1INZ00ENLJB7?=
 =?us-ascii?Q?eIZZXcbYsbqR5VNyg2PvAdfeAWYlMlKpohZOUiZiWRDF9EhKGLRtR2bSHXso?=
 =?us-ascii?Q?i4zFZpjsAnZ4VHggALLlVJzW0p+swT4hMYPIbRHMqTLhTaQuz30KxVMP7qee?=
 =?us-ascii?Q?kwEhEspAmZsttjpqtF68FrycV+ZjPQiVUbwyP0RPtAC4sM8KpWa+N3rTo5mC?=
 =?us-ascii?Q?hOIw+eKAza7qGo8NaPeX5Thk/euwv8P02EGipqDLhuo46AgaTUo1sGcPFOxl?=
 =?us-ascii?Q?MvThTdAhPNFyBDxe/JrAUphXo89n0ahqOtzBO4N9+ibKyYU4rdtXV/rvR09T?=
 =?us-ascii?Q?1TSiWxNQ7U+2TizfSUnmyA7GoHiIMXQ4O2yOwsDtovWAy9pxW+CcYo+hK6cc?=
 =?us-ascii?Q?vd2iElCcpVlQdWYoQPHWMX3HnTUIVIeW1/FRAOHDwcz90eNsu/GonH3Y4Eq7?=
 =?us-ascii?Q?n/rD9e4eMI36EXwpjwxAgAucU+B1479JScIfK3X49LZ8IFBpBXKeq2yYB18x?=
 =?us-ascii?Q?WXCJvlpyrJNRmFASon119uNMlJIQZNaP2ZxEVeix4OnQT6ocGgmW+PZ14+k3?=
 =?us-ascii?Q?okXXQXn4+IzLBb2mL133M9fOuTPbTDzHsJfbGyxBSXzTxsyYNh01LvtLvQhK?=
 =?us-ascii?Q?/jaBvDIbdlr8UvXlGr4sPJofeR/W2vu302xbC95UdDRhlz+AbwKY4g8GUBQD?=
 =?us-ascii?Q?fwJ5+n1zpOayMuHNDi9/FKgpbVz6AaX/3/0artoUqEcTTPIeoGDjGfYlmQxd?=
 =?us-ascii?Q?slCXuML+BGPX6ZmCBhF7oiuhqvH4P9PA4P5hjc2JQMr3Zrtbe0NpSbLgYHcm?=
 =?us-ascii?Q?lXW59Ym+YoNbIMEONoT4ObIG4VBBqnUvBBRFJ9efNOjOw6g6kstmt09i+uNb?=
 =?us-ascii?Q?Hcf7XqY7GssMAUNQ/cT9I5U+KRdet0U5UElS/cFr0FbQ0vqJ+FzWp8Mx5x6j?=
 =?us-ascii?Q?Q3dzO7JHGdPJGBi3Hc4sejMlbbLvibTQjxrB+G9/F5Lsq3QtaPDXXBUpXhoC?=
 =?us-ascii?Q?OYhJbMb1/VMf+zaFFGFno/FS0+D2XQo8rOFLvHLs7l0N4vWYPzlJid5PsIf0?=
 =?us-ascii?Q?70AkfiWbz3rZ3I4J23DwbSgGLWOg7UoY06aUui3sEtCwFQCygurunwxJpMrY?=
 =?us-ascii?Q?FljkM20qGWEopOv4l6sQ/EuIUWQF/6QGx2xOaL8c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29339fd2-4e39-4673-b37e-08dccb2868fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:22:40.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnfTXDeTAbWCyyMEgWgXxvCyjKZBV/ccAJJJyELq4VS36oYZmmAXbpIEz0iAI3WLRoolzkB2jodkkNjPYoRfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936

On Sun, Sep 01, 2024 at 04:07:01PM +0800, Shawn Guo wrote:
> On Mon, Aug 26, 2024 at 03:08:53PM +0800, Xu Yang wrote:
> > Add usb3 phy and controller nodes for imx95.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - no changes
> > Changes in v3:
> >  - no changes
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 43 ++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 1bbf9a0468f6..06a7c2f1e211 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1188,5 +1188,48 @@ pcie1_ep: pcie-ep@4c380000 {
> >  			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> >  			status = "disabled";
> >  		};
> > +
> > +		usb3_phy: phy@4c1f0040 {
> > +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> > +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> > +			      <0x0 0x4c1fc000 0x0 0x100>;
> > +			clocks = <&scmi_clk IMX95_CLK_HSIO>;
> > +			clock-names = "phy";
> > +			#phy-cells = <0>;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			orientation-switch;
> > +			status = "disabled";
> > +		};
> > +
> > +		usb3: usb@4c010010 {
> 
> Please try to sort nodes with unit-address in the address.

Okay. Will fix it.

Thanks,
Xu Yang

> 
> Shawn
> 
> > +			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
> > +			reg = <0x0 0x4c010010 0x0 0x04>,
> > +			      <0x0 0x4c1f0000 0x0 0x20>;
> > +			clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > +				 <&scmi_clk IMX95_CLK_32K>;
> > +			clock-names = "hsio", "suspend";
> > +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
> > +			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> > +			status = "disabled";
> > +
> > +			usb3_dwc3: usb@4c100000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0x0 0x4c100000 0x0 0x10000>;
> > +				clocks = <&scmi_clk IMX95_CLK_HSIO>,
> > +					 <&scmi_clk IMX95_CLK_24M>,
> > +					 <&scmi_clk IMX95_CLK_32K>;
> > +				clock-names = "bus_early", "ref", "suspend";
> > +				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> > +				phys = <&usb3_phy>, <&usb3_phy>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> > +				snps,gfladj-refclk-lpm-sel-quirk;
> > +				snps,parkmode-disable-ss-quirk;
> > +				iommus = <&smmu 0xe>;
> > +			};
> > +		};
> >  	};
> >  };
> > -- 
> > 2.34.1
> > 
> 

