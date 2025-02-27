Return-Path: <linux-usb+bounces-21129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F8A47982
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 378EF7A3868
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B67227EA0;
	Thu, 27 Feb 2025 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iB6SF1PP"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2073.outbound.protection.outlook.com [40.107.249.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33715270024;
	Thu, 27 Feb 2025 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649517; cv=fail; b=VX+bCtO5CX6n//09LIZP3/IOyrWGV79CyAvJGfYGlrFHdgafcJf/Y6tl80rBp8diwHYzgweMHtJ0IhnhQSWoh21PaYt+va6BPkAjAM1YIIivlcVHZTlucQrGWysN+a1xbKaTU3frMDdzOFEXRfwW/kAAxcdqJ1FlRLx4CdGMVfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649517; c=relaxed/simple;
	bh=TbBfUe1hfgMtJ2IDclzMSUSl9U0bph1OvnF5btLw4kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jB4WgGz8iH60xcARMWHKUJoM099cCdzwW0z2sMBx8VVkXitwlpbV16qC3WNNgm/cRN072PJQxqnrI7POIiOgIxMXckZ106xhDZ5ZfpGH3OHkWyfy+CqtvfHAHrpYDCk1EenKnNnO/B7wUb74HwwZL72imFoBdjxMsNnKRiR2VK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iB6SF1PP; arc=fail smtp.client-ip=40.107.249.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0/Vr8O68XDBm7tfE6YAwL0SuOGdHqPFFht3/uE2vc/YH/ENmgd6q54OLHym4sUaXNDIxyi6B4l6S1PeFFm4129g+IMqRZOk3CN3/dgwschTQCbsckXwZyd2HcpEDtJAd3pPU9rLkOmV3uckosCyIBGbBxJqzZNpa89wePUlE7V4isZiuf6SBz/REohEvzs82U+KpoGYg2hztEh3IhEZ4GLqAOjWQO9jh7IXu6vBm00/VBUU355vF5HHA73qmIPyjE5GTLpE5epU6KoU90SXpZkXf2EBVmwUlLxqfJNwf1tB96o3aBynTYoQVpBCK2mwb6zhD8q3VpttD5+laS/w/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGXRgd18cd2c1jtB7OQ8WgKt/xFGBRAsICCp8wjoVCQ=;
 b=yCHYc7iTR4e2V3qMLGYjfscHKfdQNQ3fbHHtGwFOxhtQcCy2KJXVmt24tXP7tU6pqruxXk1gwDhtPmYAxk+hFVMEJfXSsGumTrhpldKYvVeWXn5ytikyZxDLrVmy5nokunCYTPnumPK9DqzhnJv9VZ8cMv4LG5RWF3SpsWiysByeg1QTQZmf1VJRUuq2a6uo9Qgsu5B7Ayr77JwN0HKzg9B05vsWTZLhszlEMqSGgtNRn68LkQoYHy0JSgE9sQDgF7KUHfQzw16wwevlXTgH8ljfUwVJUxRCN550tr9Q7MQejwkGa/z8YDlGzqAqDyCc5A9z7pGp/zfbd21hMCTFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGXRgd18cd2c1jtB7OQ8WgKt/xFGBRAsICCp8wjoVCQ=;
 b=iB6SF1PPN6coGsw6v/qZRADg4udTa80dbx4Kyu8e8XREl4u52kBlyLWU43CHvdtobvMfChgHu++BnWwYtJhB28YXVIdEQjtHKw8wYom7zPzIYv0JY3HoM7n167IudHTfAcQ0/uqxjw6Y0w3HICitP0Wxq1bWZ9YqHQw6YsNf+15sf0YjIbFqsACvK3O8sTTnqr+ZDWGVhtJahQFHUlRAwURyfy34+JMyE81dQhPyRNUf7ILLRaZoXLNmxC/tQbP9B7BAIZiLcSvuXeYaDBysJVcQsqI4Hn7aOF93i6AHM32xJwuKTZKvLTpPxYawBUq/P1z8zPF3FL1IcxTKzs5FKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 09:45:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:45:12 +0000
Date: Thu, 27 Feb 2025 17:41:48 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 3/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <20250227094148.ovg25ofxuoe454vb@hippo>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-4-xu.yang_2@nxp.com>
 <Z7_Y3KIsyKBOqx3K@nchen-desktop>
 <20250227063235.kwfr4cixcleqbydf@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227063235.kwfr4cixcleqbydf@hippo>
X-ClientProxiedBy: SG2PR02CA0104.apcprd02.prod.outlook.com
 (2603:1096:4:92::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 15140a7b-0ebc-46dc-6cf0-08dd57136e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NS5lTVJAllFZKojEX9C3XznYF7qUdzCl87MlGyMxye53KuHw4zfFj6ic1Rof?=
 =?us-ascii?Q?HNrDY5trmvQc2U3OCOqdTcbsQlSYnh2GPSy14hH4EC2DgckDCueYZN/8OftJ?=
 =?us-ascii?Q?OkxJR19JRUQGDEEZjgQQGL4mFFFaQsAkJN838sTLWv/Yu4boIZxaT5XUMPsP?=
 =?us-ascii?Q?y+1BAkGw2MBpEBw5M13DAUT2I0mAd4OZSUFaGpXxWEw9bs+hg6KwFtDB7Q4u?=
 =?us-ascii?Q?d/6zB6WB5odZl3BwFHrNBj9Sa/OUcpENml/gE+pFIGRsbyW26LDW5CkjMla2?=
 =?us-ascii?Q?s1SuT+fmm6D2SPrUvjABnD49tN94uej9SzEnxaPuSicKp4bUIY6jQ4HdiqbI?=
 =?us-ascii?Q?MowAq5MvaLEECKH1RkteEaovllLMMRk9lkM/NeEoyqL6CAr/X8/7KqdHj16d?=
 =?us-ascii?Q?aCKejDEn7Sn1L0EhdN0iI2aKpMsU6EV1XIH0QF06MttSjiDcAD8vMMYpzvV5?=
 =?us-ascii?Q?dl27rZizy7nQ3hAZ1C3180UiC3wYGXmQkxPVFZ77RfNee9h/6hg0s6ehsOv3?=
 =?us-ascii?Q?Ld7lsxGju3ynw078aw435YI6UX8R822V3GH8n1ImZ5ZmWb7JsgostfQXurEE?=
 =?us-ascii?Q?4aa4d4ZROquXgHc9NMXxzsLwpeu7G+4fP4u12pkK5RwOzgcdXzZKLK/7/map?=
 =?us-ascii?Q?RCgI2CWnIXIOzFxruFFGlFYRNP4dJKFAXU61+VszGXvjCkPVHKRg6ZhW7R9j?=
 =?us-ascii?Q?cFX4yRrAQzQ1kQdZoBs8AnNqWLEj0I3JSWm7urLW+F7uhXLQzJfB8b+SSYKl?=
 =?us-ascii?Q?vsdeIcXNVvbG9RdyPzUh8oHqJTzQxs/FFmdrAXk5g28e3uTeybkY2lRY80JA?=
 =?us-ascii?Q?2hL3oPTm5txAs2aONoqrZNgg44LwPXsrhTI88U8XGw+uOQjnpWUfeQFXBpyF?=
 =?us-ascii?Q?vaMq6qp8mWfQCbKZ9zUcCNkUacwBhH1RxNTtegdEGkLKG6/OBWa7N8rkEzk9?=
 =?us-ascii?Q?jOOA9L8WjpsFhY5CCMWyJucNBG7/nXCTJ7wUnPueczc3OqL0+/slDgU+uqfz?=
 =?us-ascii?Q?RhnE06tQw9fxDJs085hY3fhwLAj0VJ+0XUUT3Zl2E2AndJTA6BRbH41Ry7MB?=
 =?us-ascii?Q?NiCVLMZntClq5TVGUsWwt8RjvVok5GQis4HytD4NDJV6zDyEgRACu/PKOI46?=
 =?us-ascii?Q?xP2mCzNocXfg6oplFu2LC6yZG6HjqpgwjNsQpn2ByRYrw/R9HWiOvVeVsOCO?=
 =?us-ascii?Q?co+5i+FDRNMDn/eDtaR8tpAtjuT6aM2O19344jiEaVugTh7Qhr4OE8iRmMQP?=
 =?us-ascii?Q?83okK38J2orkhyOY+ez2EcBc4NgdnqTu9Jfd/PDWTJNjmtDvIZgkO40ErYM2?=
 =?us-ascii?Q?uKzEEFfBrrjUX9z3pZyEq2EWtPoOEgO9IdCVFgVN5VzpFIpZo2TKhA3DcOnH?=
 =?us-ascii?Q?OVxG6XX/g2S8ol73ZD2JBr4NbQ2hSbHiL1fhPA2dt97dCgYtzdAPUmbqlLGo?=
 =?us-ascii?Q?FbVbO9gw2PPmBR07ULECZA1L0ezjql8n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vviNeHNqdvn5AglAsnzmY6b82nu72eguoTpJ37i6d3WHSLQ3Gh9JP2T13eC1?=
 =?us-ascii?Q?YOcwIV9o4mpbWIO/T/Fzjgc4WcVA3DZ2aR0ik2XRDBQRpb0Z9gmFRw7z5KjB?=
 =?us-ascii?Q?PZRNGw7mSEWQAfuc7kURCrEQVPCESXAP79DwV8GAv4IrGiiO1uA6Aoo+I2LY?=
 =?us-ascii?Q?blW6AeKW7qblEjagl1cJapk/HXZxXu9eR4+uoDmQ8PK8kQmBCiCBRkQ/fKqE?=
 =?us-ascii?Q?ixx3XUaderBSvFmOSah7Lmi0tqSe/Y13WTfZf83sjGXhfdKndkKWkN8hfm+3?=
 =?us-ascii?Q?IQ+EnJGfPJrtpIFKCeotJ34dQjDg+jTD2pxBebSs50impUu0c+YWypJvAWpN?=
 =?us-ascii?Q?lq56rbjS4heu3WEB2JfjpXQCTUlQWqcpsBwiTtGpo5+GzTrar5/w8GbNJbCx?=
 =?us-ascii?Q?oTHUSA1eO1T7zMJ1GlyqxKd6c+S6hGptRgn8IUBu8T7jOWEDjb7JSat71Ze6?=
 =?us-ascii?Q?soIBnWaPYe+FdUEkTb4BMFAik+7AHuqjxF934pWqFA4m4QziLZAS64c7ibSc?=
 =?us-ascii?Q?JMbnNesDwzwE8rIPaKTV6pXqEr7UkHPz7dEq2sVK/BoCwUrlrp3NgCBjkeCj?=
 =?us-ascii?Q?UsEcJuVs8LFChp3XeJnuA7oX2HF0oSebkZhGxAeEIXawDHKhC8RbE4Xoo4gl?=
 =?us-ascii?Q?02P74pZSkjhFlrbbktCy0rtkB0smG9MHma7g758nG2WYqOioruBtbTRJrVu2?=
 =?us-ascii?Q?bv0YEwCEbSDemOeF27PHLIpJUNK8xFdBc0yKIXC6gZ2I4wU6lvCXmc6LUgfa?=
 =?us-ascii?Q?g+N5opHgAObaw3RtIFG4jKOFDVzJcH9+Ei9TDShtEjfVXpXOoms8D5V5tI3a?=
 =?us-ascii?Q?H4GS842GXlbA2xAyiolCGD5epZxLLTmAMjaWFF7FT8FclXY/DErqbAyP5boa?=
 =?us-ascii?Q?tCO1hdcO8Jg5dcEucGXT2peR4sQ4mA4VimketmDrYRTLPaW43mypsFiKRcCX?=
 =?us-ascii?Q?0zn1NRmgNZvpyZsI6ZHremjc6IJmzq93DiEg64S4Xp7nvk3rtc+2M0c+vfOI?=
 =?us-ascii?Q?GC0GbmfgrS5aEzwtwCQxcfxAKmxNqJzkX14BQwcVmLVyPVvCOb/wJBLQpR3j?=
 =?us-ascii?Q?doMDccSEGzQf7jcmsg31kwc4ohyzZ/xLv2Hwv5w+/dBqNukhEzRi9+bm0ZN8?=
 =?us-ascii?Q?6fiCNliQKWmFy3mc9ymo51niKTBh0l6f49Qv29Ey3jaOB8xlwHHdB/lO7Xty?=
 =?us-ascii?Q?BncO8Rr2G1FV2HVHScGdpunkXZ5pII/AyHiwTMVAjSaI1V5RkmZDsJZC8Y+g?=
 =?us-ascii?Q?ZnsImX83lk6ARvsaP6jUkaibqqa9nAqQu2PuVzwgiUcX5wFgTNpEbBg2cpti?=
 =?us-ascii?Q?c7moTN9OprQNPURqGVdbIGP/KBn8ULZrXBFve5KLuP6Hb9lUcYILhX+/G8m/?=
 =?us-ascii?Q?xwfe8CQvntI0X3Ze+Rn+v+xmiwWf+6mshG4hpPE492M4UUTc5PO9eJzXLsOg?=
 =?us-ascii?Q?djK4tGsuM9OO0Eg57UWhMySRUolftEk0F/N/67OwW1Ft9n70XOoRWvP1Qebf?=
 =?us-ascii?Q?f08gusd+U4vunJioyfNE5DhM//YG+F7+AX3nJfZ7Xl8CX9WzCgaUaikhq/Vj?=
 =?us-ascii?Q?eyfIdqh/cZ4/JqyhQxt5PeuFKpkfJdFYLwLadmcp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15140a7b-0ebc-46dc-6cf0-08dd57136e2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:45:12.4299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/BJPt3cTw7N09gTfDYcFE8a0kkQmznbZtOAoQ0/ctfM30mxifPPG6Q2Z3BZhNZGVEMr8oV6DEPXA4kLJ8o8OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878

On Thu, Feb 27, 2025 at 02:32:35PM +0800, Xu Yang wrote:
> On Thu, Feb 27, 2025 at 11:15:40AM +0800, Peter Chen wrote:
> > On 25-02-25 13:39:52, Xu Yang wrote:
> > > On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
> > > Control:
> > > 
> > > HSIO Block Control Overview:
> > > - The HSIO block control include configuration and status registers that
> > >   provide miscellaneous top-level controls for clocking, beat limiter
> > >   enables, wakeup signal enables and interrupt status for the PCIe and USB
> > >   interfaces.
> > > 
> > > The wakeup function of HSIO blkctl is basically same as non-core, except
> > > improvements about power lost cases. This will add the wakeup setting for
> > > HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
> > > wakeup setting as needs.
> > > 
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - add Rb tag
> > > ---
> > >  drivers/usb/chipidea/usbmisc_imx.c | 107 +++++++++++++++++++++++++++++
> > >  1 file changed, 107 insertions(+)
> > > 
> > > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> > > index 1394881fde5f..f933fc70be66 100644
> > > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > > @@ -139,6 +139,22 @@
> > >  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
> > >  				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
> > >  
> > > +/*
> > > + * HSIO Block Control Register
> > > + */
> > > +
> > > +#define BLKCTL_USB_WAKEUP_CTRL		0x0
> > > +#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
> > > +#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
> > > +#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
> > > +#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
> > > +#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
> > > +
> > > +#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
> > > +					 BLKCTL_OTG_ID_WAKEUP_EN   | \
> > > +					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
> > > +					 BLKCTL_OTG_DPDM_WAKEUP_EN)
> > > +
> > >  struct usbmisc_ops {
> > >  	/* It's called once when probe a usb device */
> > >  	int (*init)(struct imx_usbmisc_data *data);
> > > @@ -159,6 +175,7 @@ struct usbmisc_ops {
> > >  
> > >  struct imx_usbmisc {
> > >  	void __iomem *base;
> > > +	void __iomem *blkctl;
> > >  	spinlock_t lock;
> > >  	const struct usbmisc_ops *ops;
> > >  };
> > > @@ -1016,6 +1033,76 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
> > >  		return 0;
> > >  }
> > >  
> > > +static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
> > > +{
> > > +	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
> > > +
> > > +	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
> > > +		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
> > > +
> > > +	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
> > > +		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
> > > +
> > > +	/* Select session valid as VBUS wakeup source */
> > > +	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
> > > +
> > > +	return wakeup_setting;
> > > +}
> > > +
> > > +static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> > > +{
> > > +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > > +	unsigned long flags;
> > > +	u32 val;
> > > +
> > > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > > +	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > +	val &= ~BLKCTL_WAKEUP_SOURCE;
> > > +
> > > +	if (enabled)
> > > +		val |= usbmisc_blkctl_wakeup_setting(data);
> > > +
> > > +	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
> > > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int usbmisc_imx95_init(struct imx_usbmisc_data *data)
> > > +{
> > > +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > > +	unsigned long flags;
> > > +	u32 reg;
> > > +
> > > +	if (data->index >= 1)
> > > +		return -EINVAL;
> > > +
> > > +	spin_lock_irqsave(&usbmisc->lock, flags);
> > > +	reg = readl(usbmisc->base);
> > > +
> > > +	if (data->disable_oc) {
> > > +		reg |= MX6_BM_OVER_CUR_DIS;
> > > +	} else {
> > > +		reg &= ~MX6_BM_OVER_CUR_DIS;
> > > +
> > > +		if (data->oc_pol_configured && data->oc_pol_active_low)
> > > +			reg |= MX6_BM_OVER_CUR_POLARITY;
> > > +		else if (data->oc_pol_configured)
> > > +			reg &= ~MX6_BM_OVER_CUR_POLARITY;
> > > +	}
> > > +
> > > +	if (data->pwr_pol == 1)
> > > +		reg |= MX6_BM_PWR_POLARITY;
> > > +
> > > +	writel(reg, usbmisc->base);
> > > +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> > > +
> > > +	/* use HSIO blkctl wakeup as source, disable usbmisc setting*/
> > > +	usbmisc_imx7d_set_wakeup(data, false);
> > > +
> > > +	return 0;
> > > +}
> > 
> > Above code has duplicated with some imx7d and imx7ulp init code,
> > Is it possible abstract some common code for all these three platforms?
> 
> Sure. Thanks for your suggestion. I'll do it.

I just double-checked imx95 is totally compatible with imx7d. Therefore,
usbmisc_imx95_init() is not needed anymore. I'll use usbmisc_imx7d_init()
for imx95 too. 

For duplicated code on some platform's init() function, I may improve them
later.

Thanks,
Xu Yang

