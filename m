Return-Path: <linux-usb+bounces-14524-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF14A9695C3
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 09:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD3C1F246B8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 07:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F711D6C48;
	Tue,  3 Sep 2024 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PHX/mgQj"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0FD1D6DBE;
	Tue,  3 Sep 2024 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348995; cv=fail; b=YY2ksHL0v7GiPkAv76fM0mbLrebbMatoeo4hXJ9yq0wmZpZgBfgDulCyYJPyT25zDYv+Iaf5Dk5xJSwCRAJ/8jvY1NSNdxpTwoYJeyMsTVJ42nsQkw3XEjLjnvR0iY0krA2iU4+IojeVzDqpcsKFzXienXB4w+vE6PBzxOVmjLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348995; c=relaxed/simple;
	bh=cmSH7t78lgIYbW3BOkPciMHD4gJib63aU/13qQ88Alc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mcYMXfpMFxsAdyQT3uE/RHgouvh1QLQkhNiEeC2c9lwTzAnrkJVNuLJLfflFRSDkPbIzUL1H4jYw8fyjbf9gKnVTo1iu3W5wSC58Anr2+zkbPYVrB6UpN08cSoETJjvZb3wCe6tYyLAVyP2eHdiZOtfQvHMcr91PhSacTBYQ8YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PHX/mgQj; arc=fail smtp.client-ip=40.107.20.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqmAl9OvJ73hgBPtoy+DF2z8K9SF6twftAY6lFpW0qrwXGZQ88nw3KkOHdPlp3J6FwwNwbVX7e36iXQ2vzlc7r56DSf53MuM4RBLh5Ln8hb2HEAMvQbxCsc314GMHuMgsv3PLtEYDfCBxRpha/V3j5UBKb6/U6tyE5YPNM08YqauXRBB6QjP27FgLDhCW56zHiIctoygpJwGln6d9f+CIEfqquK2Adan/G3RFWh4MPtl3qudwno/TOL9K2jLaIVGgV83ahltN6PLlbiUofXfMkuPHb81hxR1hxxdj2HSgbAqHGy1px17CQk2IlYLJ9Z1o5RqSSxPSBQaz8q4hULm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVraK8nhVOVulJAZxC5aqFjqd4IazwcmU0v2dw5i+as=;
 b=N5XJI0uASBq+dvLPcpAoAuK/m72cZPcZJvRdF+hIdlziwPZALLRI5qi/q9Wo1HYjOegkI0WJQ9rXBad/8nnxNRdNGTqx2UuS/hs9si29bzI7kADtNtV1FsE+RZeNOchlaXuHeAKpyeMAHIPsMGhcIUqEe+xV+JWi0QrpqfIonush3L6X8Vm03DloqGfD4Ywb3fmnRzny5TeazXMF5KoBvG6Z8BzrlNwuLyH9tnIpN7y/VlwcdyjC3pI0OcE7qZl3DFMFiquZS9NmDxmlhxnUuK2VIilV+bkf1Ri+CDsX+sdrgFAkb/Jqu+K3cipSLargMvFk1GmU6GDzw/QfvHkX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVraK8nhVOVulJAZxC5aqFjqd4IazwcmU0v2dw5i+as=;
 b=PHX/mgQjRtMXW2DwArednA/QLr1cboxn5UZ+9AwwY3eWKjMocQNXd0IstiqhUZ2vBooNH/nLIHi/dY/MpEYWZj8TKOI4niPzyR9daF93mWfaLfYeKb2F74naYkgw3MYnHwzzi0ecAsByVbLOssaILrGT81dLv+50BYVZsvcpfGD45/2N503Awj0OwcSq0f7Lz4AMnek2LHO/GlbQ/iCOojhGA5XOTJMw7r7KbvYTMom7DintFnZ63bxM49cnNnwoNraIWSytDcAA2Yc5u+Mu2etNiDiiYjqcEKWnSu4rVzFRyjH19f0baY48FhZ6BtyFUhAn1WI0bef9waavfoH+uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8362.eurprd04.prod.outlook.com (2603:10a6:10:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:36:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:36:28 +0000
Date: Tue, 3 Sep 2024 15:35:09 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	peter.chen@kernel.org, herve.codina@bootlin.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Message-ID: <20240903073509.7fb6izjnbhtiocjn@hippo>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-3-xu.yang_2@nxp.com>
 <20240829090935.ktc7jgd2en4qay2h@hippo>
 <2024090332-smokiness-virus-5f65@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024090332-smokiness-virus-5f65@gregkh>
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f7b52e-fd6d-43de-c289-08dccbeb1f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lkdt3oaqVumTOb0sl09ebbMtY4SuZCpd1m1b6ks37ZcDylpC0gsCx7zq43yd?=
 =?us-ascii?Q?Hx1LOx6Y00xZrl+YFa6qTZfzvZy0Fc3VfTeRGoG/zi+WIurNntSPtbUYhFyT?=
 =?us-ascii?Q?OO/RjcL3vEXDQv6FcLTlsEMOFDB28Ijk/Dp/96D5/NzLFZiRZhUwQ6bDL+sz?=
 =?us-ascii?Q?20E5+wpwwRnB7BPsmuCHF+6dJRxvFPNeOLaWeiZmTelvP8HPMcxE7/Jeph/5?=
 =?us-ascii?Q?2xmLMn+/un9PhCUnbcXGPcx7h6UIV0ZMqchSpp3xGhpeZxIOe//GF1y5nCOv?=
 =?us-ascii?Q?qETOB5hkTg4jmkUuuh/EIL+roHAGdlRJ+JWuW4AFm7gW/S65Y5RZQXVCq6fu?=
 =?us-ascii?Q?u9pqRk/0KFOtJWtzbdfJafcD6I+UNq3oV0MLCerCPLXhPK0zv9yHWaEDNtIC?=
 =?us-ascii?Q?IZpXpJ5/UB+H1LcKWomG4FM0aJVy38vrI9jznWkFrK4qp7LDbdXAOfaT4yPb?=
 =?us-ascii?Q?Sm6FKbdGSw0JKwR6zjv3hewsOibU/BD7CfSiM/VFhuVdyNj2xGWxh4ita5PP?=
 =?us-ascii?Q?oOmxeHZvWvy1a2S2JKq+Sq5CkHgXnL8lC5gpYNLUSXypLf7zAcda9Ukvv20A?=
 =?us-ascii?Q?UT1FrFWUBKh+kxmOMRj+JZt6v/JS1g5oaQXyvL48JlQt0AL7b1KOeDBkR3P/?=
 =?us-ascii?Q?aTqmqZ9EqOZ2Fi8FLHVoTOiy44FitNoHn2bGF81l8nk4NuYym4HzrcvJKzpW?=
 =?us-ascii?Q?aRCP9FQ2yvCbN76/+V78F6M66+EKp71q3KeqdUQ8Y7NbKR2xr0bfPlJfzrhC?=
 =?us-ascii?Q?yKP01Vi8Yay0wg32SFQz1EeZ4ktkvJoRq3KESI1l/dOuBEcEHjN0u7h70Hag?=
 =?us-ascii?Q?YFkiycUMhaiJEJ8uCL5XHrDUFnJO7A1ZMdO0RIFNC71aeY8eJX+6X0FpfrNg?=
 =?us-ascii?Q?/36bsd6+Uf/9S3o3kb5so9iNbYCmdRkwwnUnLhhr9zHEbL36bN/ohYZ2PIWt?=
 =?us-ascii?Q?bKfmnVJ5QQ8rQouB5Alq2Q85GILWuRTHDPQu1+pkY2uXj3WkFCUl7ejE3r6q?=
 =?us-ascii?Q?7P+qmZUBT2FPYdmuHRqs06jCd2rTunJRhQDecwhY+t+LDcOc9Up4VgPJBe9v?=
 =?us-ascii?Q?paKxgTaDTQhxZ1C1xDT+likPcYFICXM97V8LnXcwVqTn0soi0O/iffkojceK?=
 =?us-ascii?Q?UR9AjhUNzmZalKwsbNfcaIos1hg8c2zI8PNN7WInMv4nef1bPpGpsYkdMXO4?=
 =?us-ascii?Q?tAIn9Mwmll4a8hVQS8UlqiLLyDvwaZGor550obcB49mktb/b91Mta2ToPZux?=
 =?us-ascii?Q?e8bykY9iKw1Aoq8/KCKz6LXc1pD8y/3LTHSrKKnKhr4T//mTfPVR+guf9AQj?=
 =?us-ascii?Q?RmyLxydKX2WzciU5EoP4OCosBbCQKQCwDwwk+xelje0Brq1hKmTCbsdJneMd?=
 =?us-ascii?Q?PqSKeVmh90AlvrdVZXHe1iv9mVNZZ0KjbvhiG8YQQXksrBeZBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TTGYARAkgq/r/uYD14ZShwWeJQjbNQIcp6ssfov+OzL0gfQjppqDgaL+05L0?=
 =?us-ascii?Q?GmaUAfF9E/tbbEEm3j7GhbJX1Lh+ZQCcT2p+3yvKOjt8Ouze+l3wty1Hdiye?=
 =?us-ascii?Q?pXW7VxGP2XadZnFXq/XnpZdAhRdvL4XCDx5dIwRjK/AMZnuIyRbSOdcapMAx?=
 =?us-ascii?Q?UmwTQwQozKmxWFJn0JPhTyNdgJyLFy7XLsWZ4WHuCMKPxeQ6a8mFJEhou48/?=
 =?us-ascii?Q?BbOr62e5oNUC2X5xg1IIRtRJUo/LakOVL5weTG6ESTFYcDWCGlcagK5tQ/Io?=
 =?us-ascii?Q?HGBoNrJxab68crPRIqJnD7NrkPBRg8B63FB8HnM3VH2UPY/llSkWsjeGiB8Q?=
 =?us-ascii?Q?n/f3t3zHhjZwGpWx5MXaXdKW2Ki7xLYaCKsvzTOcchJctYvRSsPq63Gmq2G1?=
 =?us-ascii?Q?wrkc8zBEuY0U3eB+QvTSntcY7SYkn9RK3TQ83FmNblAnFyQrRVzlvSD+cMkH?=
 =?us-ascii?Q?r6tY7/CqNv8o2tRipls7XD8yCyMOw0GNeki3HLE6IUg8okBcIphW+DMi5xWL?=
 =?us-ascii?Q?aapQU/gwvUloaSFysD9eabOFEnHIijMy2Ha4r4MLTbL8EzDFWJI63ahGKDrY?=
 =?us-ascii?Q?iDeESX5gWssfj7XJe3a+Xt+RiEZG4yTZ6htYdD+LQIe7aA9kvEar2JXXyNZI?=
 =?us-ascii?Q?uEkoNNE1K15vIt2DHDW/p4FwLSrEDE++M2xMOdk+DgoGa45A/xaiYDrWFBuJ?=
 =?us-ascii?Q?YZq/KCbIs67B1DFvT66QgiavoRwI7TOcDT77/RYX2s6x2N9iKXHOhbX8qxb3?=
 =?us-ascii?Q?5bMeyNruvZcqdR2m7BIEseXaky3fl6fomgBN+a32yckW3xeZo3eb6JcBVqug?=
 =?us-ascii?Q?I8XDNMDsbz4MPRhCDGn8H0qBGn8HaY3wV27QeXg/5sdbjznKeetmwxc1aoAW?=
 =?us-ascii?Q?/A/GpTulgAQ2Hf0n8rpXexOd39oocsVTal3hdT/S63pd13+EP3p9B42QJNO7?=
 =?us-ascii?Q?jSNA8d2CdM4+uVyY51AgReaO1phvwplVsoyFrT5hyNmG7roaA7HOn5a+U1Dz?=
 =?us-ascii?Q?qfctbUzrl/aWvllq1T0TT/HlxxxcjP+GTznbr0gZDRN+A3fx4CYx3RdsdAi7?=
 =?us-ascii?Q?R60sineFM/uERjXlj/ACB2jj1gCGtfdqR8m8fJ1Rq0JOowtruaPvPfS5kADB?=
 =?us-ascii?Q?scnwl6jIHMqF0kC5YNuQ7waIf3oMFLvsyLz4dAwV4dareR0S+SBuNVoy8o1j?=
 =?us-ascii?Q?tZFq3oQS53TUEGj668VETtmYLBgUaiaubZLROMhJW6uitmW2bSxixQVHdmQk?=
 =?us-ascii?Q?UhOVyKG47seIRTjP9U3WDXPOueSVbI2bl/56zEptzBEc5RxUAGJvMaK9+eBw?=
 =?us-ascii?Q?E3TMAfxTDKCUaQf+/HE6hhSb5/F/fQVo4YVa2IJhVvKeV+pSygqTEdw77V9l?=
 =?us-ascii?Q?oCpoYLlF//9ADMWvEirFhheT5HoOTfmZfi+lLdmXAKDmkHAneumUrg7bfzgY?=
 =?us-ascii?Q?ue9WYbQJkJKadaUK5NSns7wdYC0GFSNKffG7/jb8LoLjjOAPmkFA1BrRodtP?=
 =?us-ascii?Q?PgQ024u7hhnb3dwBhm3iBpU2saLQAbRI4BKCca7VZAx2FNIVdxUYD3sQYyLh?=
 =?us-ascii?Q?h1s5gbhKJE4dk2eVq3Sp66ayA+H00KJmQTWMfPCZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f7b52e-fd6d-43de-c289-08dccbeb1f4a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:36:28.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2OFfAtaGRWzdrUONS439N7Wbh30b7o5oNzUm6GrVeOhd5hqCgbQ+k6dw+VBm0qET/0OHTy+O6H1GAp+tORTbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8362

On Tue, Sep 03, 2024 at 09:08:52AM +0200, Greg KH wrote:
> On Thu, Aug 29, 2024 at 05:09:35PM +0800, Xu Yang wrote:
> > Hi Greg,
> > 
> > On Fri, Jul 26, 2024 at 07:32:04PM +0800, Xu Yang wrote:
> > > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > > usb wakeup work well. This will add a "nxp,sim" property.
> > > 
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - add else branch suggested by Rob
> > > ---
> > >  .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > > index f4b1ca2fb562..ce665a2779b7 100644
> > > --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > > @@ -87,6 +87,12 @@ properties:
> > >      maximum: 119
> > >      default: 100
> > >  
> > > +  nxp,sim:
> > > +    description:
> > > +      The system integration module (SIM) provides system control and chip
> > > +      configuration registers.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -110,6 +116,17 @@ allOf:
> > >        required:
> > >          - fsl,anatop
> > >  
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          const: fsl,imx7ulp-usbphy
> > > +    then:
> > > +      required:
> > > +        - nxp,sim
> > > +    else:
> > > +      properties:
> > > +        nxp,sim: false
> > > +
> > >  additionalProperties: false
> > >  
> > >  examples:
> > 
> > 
> > Could you please pick up patch #3? Rest of the patches are mainlined.
> 
> Can you please resend it as an individual patch with the reviewed-by
> added to it?

Sure. Will do it later.

Thanks,
Xu Yang

