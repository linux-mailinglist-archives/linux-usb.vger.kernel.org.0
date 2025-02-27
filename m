Return-Path: <linux-usb+bounces-21125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DDA475FD
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 07:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFD6A7A3DE5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 06:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B6E21C9FB;
	Thu, 27 Feb 2025 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jhc+g2DB"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9EBE65;
	Thu, 27 Feb 2025 06:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740638166; cv=fail; b=LuIMbwf7LClwsseOr7XZuKbQRcAWPAmbLwwqivu5kton6GpsWIbNF3S2wlQBmTrzo9sJnogfxVX2Ti2OXnySl9FB8bRPOMEhEJ9t9YJN0HnxiJk9F8ZYw8GCIeQWfqxGkrw9xJhHAoAQjpxpM4vD4uLd/nNdmx6zkHpl6V9z+B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740638166; c=relaxed/simple;
	bh=YrD3rvi2aIWNx0+hmXiI7CNDEpbjRO+5YOUSwkM0pGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NSbnewwSnLN6KSV7PS75cugU5pWuH/Ad8IymOaB6+m5Ab2lc19RUA0UnGH7mhf+PqDBqmEradi28qLkBxZG+TRn5DXFkzhU5H8AjdEKlQCdW44+KenbPczPwtaDj8RctP5+FcCx4xsRYea6B8kgca6/Gvihi6Bx9o5/3dtQDXOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jhc+g2DB; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/QBDmqLMpYh9m5Mw0qkqlcx0rDOc/uGcIxAXWL2wJHef7zAHTv2DZu1ksSW9LdA7fOBcNpIxodNqnoJFSYTysIdwloxkD/XPHPN9ZrbIprOiH8+dZjVqeXN8PLoKqz72CrYI0lz+t0XMN3IVzHADSUbo7cK9AgXKDAbY02m0uqZXPCpAMXO2aDvtIZIdvbYqpOl6W98OLRLXuKoWnzPpXeO3/BoLmUiQujD9ep9Vk/8xkMN2URch/ch/PKk03AlqVbHveb+jAGbZ3kBzRvtTT9wpFckMp3YptNDI9XsUZ+kCHBXGhSuVZX3oGjzWSbpyC+jjrERqWfvzy3NVutytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fgvBqqvch4nf3PvfqnfNOTf9RgUsmGf4Z/sNrh9bZo=;
 b=LnOJVewZivivwfhP9TJvQ9b0t2i7O9Jq7WzemJsEfT09C4au9K/DzzjscwOj8zuh3u2vhJL1VSkUws2II8SVVlmv3fAjScr7UOepC75d7+OfvVBX+UB8r1iAS4fqSonUtcnLqPAYICzc6/zDASyEmh6ZmgcNLK8jB0ZndH/LtsMB6Suw1NFUIrD9WGeOaB2jppRZHkgMqc0KC0Og3NagS/iJ3HuFDTkvPEaCvpnfW8DYalqXrDdJ7bWvqya4PIQHF5dNsDRcT9DRGiIKk1jHOGld4dxtc+ITVnbv73/lITECI4wftr3aqRgGEpQaI1Kq7oZ/UQOgl4PvQmReM4ikUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fgvBqqvch4nf3PvfqnfNOTf9RgUsmGf4Z/sNrh9bZo=;
 b=Jhc+g2DB1htCCbn2BkzbRmrtQjCz8Yx+QtFRk6hkLs+BAeLzc5bGYNtuSBxwjrc/oa9x93PXIQqJkGWDD5s6Fue5hrTrYbyxN0xnXfJg2fJxOJvaL8FlPYRflPWFVlu17i2vYF5Mf6QerrK/DMVK+Zi8Ry62NGOzuLuikALDXZgZWMU3ketnCPzokKJPQOEJ5QelWYBenlzW7UlsKy6PTGTI8UH3R6DkW7TmB1wi8rjWGbAzx7gM4t5gDRl5an88oj9RwyArH0UVQfEskhF89BKfBM/arpQ/a9Z3++dtjM2Ixwd9GKtD59EGTp2C4HBZI0DDUiiyTLeNRc9Q29E1uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7873.eurprd04.prod.outlook.com (2603:10a6:20b:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 06:36:00 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 06:36:00 +0000
Date: Thu, 27 Feb 2025 14:32:35 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 3/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <20250227063235.kwfr4cixcleqbydf@hippo>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-4-xu.yang_2@nxp.com>
 <Z7_Y3KIsyKBOqx3K@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7_Y3KIsyKBOqx3K@nchen-desktop>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ea5ed6-b5e7-4b2d-8fd1-08dd56f8ff7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xswMLIubAuBK8WMDM3fJuDrndDEnmYgX1zxv91+czqSlt1xk3C6c8fS3wcb1?=
 =?us-ascii?Q?vYcxRm0kIixlso1ifqkP1Aaik1wzUCE6VofALFu8jfTOXZEkgS6pczzb4CP0?=
 =?us-ascii?Q?lSZNGuU5mxgC3au83VQjSRCDQPYYFEVcOAUc7xBmc1UqcMohDnGRTVJhyW5g?=
 =?us-ascii?Q?BE4QBjHK8huFc/4alyScThV+oUl9btzPVh9E+mBmatz/dQj/CZpx3S9WjsK8?=
 =?us-ascii?Q?NJE4rq4+aNFrWD95MsOTkj+WXadU3d/9p7Wl0t/6q6l5UMF4kW8+xduCBjgu?=
 =?us-ascii?Q?4L1L56Hc/583cUSG0F5QCRkctDr1HhRd7Z4ClRYe6VFSlqAaYoSahdFdAxW5?=
 =?us-ascii?Q?JZ8PhrB9yLbd8KdT6h/WyGT2CVtZEe0IZ9W9Fh7mg3R43woyIEVIyNJXA0Ge?=
 =?us-ascii?Q?wTz383NbfhdaniKIIjNqauRHUj8rpWJZA1JOyzfLS0Wg/kb5a1TYiHIltPCf?=
 =?us-ascii?Q?ubCaoOE1OpWDj545bAexr6SOyude2IYlllUgOXS4s9WUpn6bAngXN5mL8RO7?=
 =?us-ascii?Q?aGmJJqJlFug+VH4pJaodI/HE7jjoaPvBpUp5tkoKhvBpLH+Ih4qjXhJGOAlz?=
 =?us-ascii?Q?jkjp1l3YxeAqgK7JvdbGR7lQpCStGchNl+xTGTyJkMCKBSDSGMS+ljnYbX6a?=
 =?us-ascii?Q?sHabqCLJAPALbd0EG8Fme2Sne5fJAHjOm0EPkbB/Drt62LuNpo1yIRevv+L+?=
 =?us-ascii?Q?rY5NDLajiv9hjAUn85IH5bNEYzW7wfOLlUUQA39jwirqaCp8oSkq+QHwr/nA?=
 =?us-ascii?Q?frgF9cZ2tTfgfyu9SY2yFX4Oh+IoWTNpTOq+K2p5b5HeqXUOfYYTriJc62B7?=
 =?us-ascii?Q?OjfvoQKrVNXSZRMbVkh02UxC/wWfWDUt9OmmxXlWJUNGl4Cbb12LhanMkFik?=
 =?us-ascii?Q?QCVjO+47kuT3IqS+mpwhl3P5rxNttp7YhIMAs+9lQIEyYjW4+fbnmTBXI9th?=
 =?us-ascii?Q?gldVLRjcEWv5ZTbgweFZpMMDGdsOOCjTFjtSuGn4nEIgReeYcB7bROvck5Sn?=
 =?us-ascii?Q?Lt5Jh9X2lUcgn0FUf8AFQq5EfSYlJF+KZXkSyUgKJEbvD2c5RNR08FYZsQo2?=
 =?us-ascii?Q?s814IkEZK6e1PNjLUjHHGDBW/5A4FQGutPsvLjXVoyDC1/lwgvhVS09o5z0d?=
 =?us-ascii?Q?NzqGb9mGo5YX1+6ootzYht/iVmxarVvw3meJvAVQd5uT8hQ+8c6tUfLaTl9d?=
 =?us-ascii?Q?6Ak2Egcw2Xg6KZen++4OlaRTRcPfq68e50Xg1SCZ3RZPv5Tc/hwBerCUsaC7?=
 =?us-ascii?Q?8T3b10MIhWm3xVrcpP8IGudCPmsENV0m/Ow29UaK3swcOeIK14e0ShlwMPUx?=
 =?us-ascii?Q?tU8BAmHX5JxnU0QRUYQ1N1nB5pFeSzFNPNomuqkrs4AirSDE8GQHLStJ4jKi?=
 =?us-ascii?Q?n9S/HgHKA6rHAna9yMb/yU5fMD3LgJ1Kt8xZWTL0eyK1/mTQe6dYedAAkUZN?=
 =?us-ascii?Q?ei3FdK1sUDAMEtvBQ33cRsvqMT0cNTaT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0/XzPxSaeUpenEp0mN1VJDWWoLipqpD3g+i/KkDc+SBVU08Eq4EAgbzf3lsc?=
 =?us-ascii?Q?3yMo9KId/ljdauJaLPPCr3LhxExZDX8SgkWQ2qa9jrJ/wxM38s3DLD7OgPMG?=
 =?us-ascii?Q?KTMWD0nCmMh54gQ06wFc9zizBLCS56sADo/hFZ/ZNIWezWVMDNGORtM+ZcR6?=
 =?us-ascii?Q?KxSPG2+Tm7oyrGyak3QBV7ndlfZzPTNrlPfA2HgopkuhKU+jGu14XiDbyS+M?=
 =?us-ascii?Q?+3Nxqtb3L8hGyx9TeYzsVu64PlgCKRJBp2bfwXReU4ARz9UI/diGpzqsBai+?=
 =?us-ascii?Q?qVXL7BGOoxMfhwWGIGwGHzxGuJHmzYeFGvoCkEntbRp44ALn+IuqosT0lmNa?=
 =?us-ascii?Q?JoKrVUkJxeATvpEEcmDVbfWrGhzQ/ALEMdmvWkTuyecifpbmLC/e+2+Yr9pv?=
 =?us-ascii?Q?kwqisioJcsU6veiaxbjTifonUH/Tk0dSSe70HeUnl1ZBDDdM32lmDayQGoKv?=
 =?us-ascii?Q?Jk85jc+2NAWBKHRm/BXTjwuQULushY+OSJ2DQuOsfaqqQeyNMgrHz+JC5Kw+?=
 =?us-ascii?Q?eXFsRLSBHUCprwce9cANSIeHdrbUJFH3nJb6NIWbsg4Mkpa0FJetmQiCuPXD?=
 =?us-ascii?Q?xYZwwHav1UrgIbIjEY0Y//of7QxsZ4ch47MP2/Ar2D4KBvdn96q+sSTuDg6C?=
 =?us-ascii?Q?wkhZXAfwuVHc6RGcIWawnX7bNjNCQYGIqiY+P3zWgASD8uucn9+fPaQbvwcb?=
 =?us-ascii?Q?CZziH5wk9kIQpCpFM3iuhGDroQAmOpNpNK6thp8siieU0OkfqgMLYr14irkY?=
 =?us-ascii?Q?6422jEMID1fQERDitUKt9AI3c9790AJnIDuBa/DStllpJzxgm2n1GQ/DE9Aq?=
 =?us-ascii?Q?CmheFIImVM7DkZYcqGtWSx8eoJjicizQFIvwxBm9rmyqq9qTW51/tc1Fy+Gu?=
 =?us-ascii?Q?RUxiuq0RVgDq7osA428awsdvdQxIAmJuXPrbOGEmHcuyq2rgppwK5gurVRat?=
 =?us-ascii?Q?flKNIthRagyMeylAduyHPbK3cng2qFs/akpYruayfraZTdnrG/ArgTU/b44Y?=
 =?us-ascii?Q?KQe6eMcE/ll0Sbba/cAxNAXnlOFx7Rv51NgVmoMCRYsnSYVm8hM/WTzDiqBn?=
 =?us-ascii?Q?ybvfBlD52O0cSn7Bi4JF/i2Fg7gdTXjVV9wojHgdVQkv5ug8B9waRaFEtuK2?=
 =?us-ascii?Q?SrM+LWSs4gjEX06ATwZYYDXZ2Pbcno8onKMQ4MP1juYYsVA586iopTpDCUoM?=
 =?us-ascii?Q?pCoS1VRemwrAseUqaAOZfDuhxLi681xVdD8mUcceMHfF986i+/0ir9rf1DYH?=
 =?us-ascii?Q?rax/qBjCjKuZNerTd0SJWI/QpvhtqBAdbr3jzBbzYDZsrvcCt9a1Ndsb3uhb?=
 =?us-ascii?Q?XBsB1OtJgKdEA01xfwCrSZQiGb9aqIWrTqbQspQiuOXfZCNkbejma/7EdofR?=
 =?us-ascii?Q?Jgsyl04I/qws4dzNRTMnHj/vyfGz9JGcCJ3xFRBUnQt0hxGUqoiwxAzHE/CP?=
 =?us-ascii?Q?gJ5inAVFl+ajr6Gq+MovD1q0VIzoD77nBm9XgaKjxxulTHYAWZxS2wAH4T/k?=
 =?us-ascii?Q?N9T/PW8Jq7WYHY2SFil6jbQskb2rF5YBPoHsrcJxAXxi1dizyNd6UywKgeQc?=
 =?us-ascii?Q?QFMD+3zQCPrRs+N8rOxdZ7DbxqyOcBiN3OEcXnD4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ea5ed6-b5e7-4b2d-8fd1-08dd56f8ff7f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 06:36:00.1288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i29BZgleT7sG07sEkfTrf0WHtQo0KxD7FVPyEcBvLl2uxD7J/DcLnpM3zvBTR6GXxzpyYjTIhyeqR9h6yzO96A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7873

On Thu, Feb 27, 2025 at 11:15:40AM +0800, Peter Chen wrote:
> On 25-02-25 13:39:52, Xu Yang wrote:
> > On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> > Control:
> > 
> > HSIO Block Control Overview:
> > - The HSIO block control include configuration and status registers that
> >   provide miscellaneous top-level controls for clocking, beat limiter
> >   enables, wakeup signal enables and interrupt status for the PCIe and USB
> >   interfaces.
> > 
> > The wakeup function of HSIO blkctl is basically same as non-core, except
> > improvements about power lost cases. This will add the wakeup setting for
> > HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
> > wakeup setting as needs.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - add Rb tag
> > ---
> >  drivers/usb/chipidea/usbmisc_imx.c | 107 +++++++++++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> > index 1394881fde5f..f933fc70be66 100644
> > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > @@ -139,6 +139,22 @@
> >  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
> >  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> >  
> > +/*
> > + * HSIO Block Control Register
> > + */
> > +
> > +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> > +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> > +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> > +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> > +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> > +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> > +
> > +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> > +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> > +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> > +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> > +
> >  struct usbmisc_ops {
> >  	/* It's called once when probe a usb device */
> >  	int (*init)(struct imx_usbmisc_data *data);
> > @@ -159,6 +175,7 @@ struct usbmisc_ops {
> >  
> >  struct imx_usbmisc {
> >  	void __iomem *base;
> > +	void __iomem *blkctl;
> >  	spinlock_t lock;
> >  	const struct usbmisc_ops *ops;
> >  };
> > @@ -1016,6 +1033,76 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
> >  		return 0;
> >  }
> >  
> > +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> > +{
> > +	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> > +
> > +	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
> > +		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
> > +
> > +	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
> > +		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> > +
> > +	/* Select session valid as VBUS wakeup source */
> > +	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
> > +
> > +	return wakeup_setting;
> > +}
> > +
> > +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> > +{
> > +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > +	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > +	val &= ~BLKCTL_WAKEUP_SOURCE;
> > +
> > +	if (enabled)
> > +		val |= usbmisc_blkctl_wakeup_setting(data);
> > +
> > +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static int usbmisc_imx95_init(struct imx_usbmisc_data *data)
> > +{
> > +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > +	unsigned long flags;
> > +	u32 reg;
> > +
> > +	if (data->index >= 1)
> > +		return -EINVAL;
> > +
> > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > +	reg = readl(usbmisc->base);
> > +
> > +	if (data->disable_oc) {
> > +		reg |= MX6_BM_OVER_CUR_DIS;
> > +	} else {
> > +		reg &= ~MX6_BM_OVER_CUR_DIS;
> > +
> > +		if (data->oc_pol_configured && data->oc_pol_active_low)
> > +			reg |= MX6_BM_OVER_CUR_POLARITY;
> > +		else if (data->oc_pol_configured)
> > +			reg &= ~MX6_BM_OVER_CUR_POLARITY;
> > +	}
> > +
> > +	if (data->pwr_pol == 1)
> > +		reg |= MX6_BM_PWR_POLARITY;
> > +
> > +	writel(reg, usbmisc->base);
> > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > +
> > +	/* use HSIO blkctl wakeup as source, disable usbmisc setting*/
> > +	usbmisc_imx7d_set_wakeup(data, false);
> > +
> > +	return 0;
> > +}
> 
> Above code has duplicated with some imx7d and imx7ulp init code,
> Is it possible abstract some common code for all these three platforms?

Sure. Thanks for your suggestion. I'll do it.

Thanks,
Xu Yang

