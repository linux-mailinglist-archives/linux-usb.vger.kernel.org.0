Return-Path: <linux-usb+bounces-21178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F7A48EB2
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 03:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D3B16ED61
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 02:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8DB13213E;
	Fri, 28 Feb 2025 02:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d3mOIZoi"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE82F2E;
	Fri, 28 Feb 2025 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740710221; cv=fail; b=S3uA54Q7I9qF41rh40SsgjVGP/SKX8isSMWTcFoqdoHXKBI0NEj/UZwkpkaL0XvMi+BPS0gFIhbvvxuubyACbucob/hqK4QCWYGfQ65J7YY8JsUKY/868Q0VkqLyPzhSqBf6eHxpX0tLMcndV1oPn8m8AnvGyKJg7Oq8UFiN5DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740710221; c=relaxed/simple;
	bh=gTlOrTCC0Hrm3KUgsUIy1RNonrqxc1Dl1G/1HjoXXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eebqvXukHur3R1a9YJnMod5LRXuXjyusZzmbWkU+Wgd3N/hh1iYMUTPdzi9kxxTlDgZ12rx+wvJN5CTCLX++BWTU5NNAmTiMxO+Zbq5lMjiqJmRCiBSup0VEMGW8PzCrZ4VHW/qffcybGPKqKqmG/f6LpqFGDFguKT0t7R2PXLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d3mOIZoi; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC+/u1zck8f/lpqQw/9akN5H+5KLG9ZIj1MTIb80CrZVKYGeNMrD0dPJ3HTeFh7U/CWZ3hngMOUvUvoT4zeWjUIsHBgotnVeOL6+yGia1DEF1YdsZqLWf+W+lLC3d2B11aUzOi5v37qdjABYD1dfLxb9rkMz2q0z/Dt906qp0YfsHxC8Fpnr/15lVBWYsrUT80Y0pweYTckM7xpDvttOoGsaYZAvKE4pOAAFtf3BdMcvQLm47h2XkhB5UV+EPy4I+WbizxeBdreMPgp4fg309HtUJbJ5NU3Kd8qcVuehuhJm2Z4Nek/JQQ+1BZ1sbouX+/2VF/lmrpzDpcLw6RcSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhlikSiV5DRDyM6ha0pg+mxGX2BzHp9cBplcHIL6Yv8=;
 b=OVlT+yECvT4At/Tp16d0nD65vkwx2iAasffLnoEsPRol4sv4HKQeYHa98yk/u0mSBxGdxVAy3rQceDoYKzJFCSpoPJ6LIBfrPoY1T+AONVYGRvWaY+f5UP/GEys/NpeRmZTpEX3TAlUwIzZXidgxjOY07idSt8WaDldGBBuIAeuzBhShWs3mYn9WoHe6ZvDNsolgUn7nhEt5gCxNBaQrnRxmV1iNLzGzH9V2OimynZ56AO3qH9QDTxzIFt6HMdEqloNcItGwXyp4pXKguX9SoNeqX8wtNzSREWZjWg1JAOgV6DCjs8t7tIprGk0lBL3M2/I/XqNpQkeHiQyHNIJuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhlikSiV5DRDyM6ha0pg+mxGX2BzHp9cBplcHIL6Yv8=;
 b=d3mOIZoiLk4WlILL9FXwKXcu8+xkoAJMP0A8i2Qxvhh31wFxsHuASyAfmbuWU3NI5pRPiSnGWL6CoMWwmGk5Tao9xW+jUNM627q9eHm6SroALTab9kMYQYhtSWKftDIOUUtGQFRAL75L8OHxyskDwJJu1k0INA4VXozeKd/bmSiasuadUDybf0NU3oWyfPixlq2CVLpduUBv3y8h1vyg8LAJycGzDJpQxpQrWYAbS2YfYY3tBI1XoN7hAdB1rf4thBHL3Idz8r8OqfuBHT5Ef3dBHYL9qXuHCjVTSx+Yx+JogrhzOyBklIMXJ7R1B4P7OC4NlSk5ixrvEdoRJGGuIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 02:36:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 02:36:54 +0000
Date: Fri, 28 Feb 2025 10:33:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup
 setting
Message-ID: <20250228023258.uznzhfnp7zsrxzed@hippo>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
 <20250227095348.837223-5-xu.yang_2@nxp.com>
 <3535014.QJadu78ljV@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3535014.QJadu78ljV@steina-w>
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: baf2c16b-e6f3-4a3a-b12b-08dd57a0c367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yn6wklyhRusC6Ba2Ui0dEF3AIeT36RO1eYoSAGFuyBU+6GdJgcDxgF+hs0Pv?=
 =?us-ascii?Q?Oj3Wkxwqhc8SGFGICnHGydT2h6uQSsIKYDoY+M6wy7Ne3+Rd7sGuzkOEUQVL?=
 =?us-ascii?Q?2uc7+stz8eqBwLcEw2a7l0+vqRYn5LYo96RnMTScIowl2M+3uv5k+f8cwLu0?=
 =?us-ascii?Q?BsmFChqsTvnG6re25FQXJmXwf7XMLqoq2SQMpzP5YbB8t/Ikn3U7ud8sCFjg?=
 =?us-ascii?Q?VvYii9pgSkvPZcsKjTJY+0BV5aE7xLFrpi5mrRM2mEOj9c8qgyO8M1R2Dh8p?=
 =?us-ascii?Q?sqIPigDtBrQcF3Ku2pDD4o31P7vGgcUrq8i+6Q69cVRLcdMSTbcZRc1iYeng?=
 =?us-ascii?Q?qKAlqkICosApxCqk0Fty9jqTbldw3Z6vZmac1wkVIGu7AqebOaSyl3tLiBg2?=
 =?us-ascii?Q?7199YbwsxlQcu/kZDeG2KnnGIgvayON9u2vRgvWZHflVc/XeMNpvV94Aqmll?=
 =?us-ascii?Q?w8TYas1jn6cvLSLRew3azwlZ7HjTQSSZvkriS+ChVufrPSSEW1YA5sIQBkhe?=
 =?us-ascii?Q?yGjbaNagUHh9KqNWU9+3fMEwf2dxQcCJDjgl3w585zJif/unInnYCAR673os?=
 =?us-ascii?Q?x4r6dBzXdTUPBhj/T6mrkjpmsTTpXLkDi9Xu0NW8rqgR5q3GbolXpW+IyV3+?=
 =?us-ascii?Q?lmBh3EPdTmXesjz3R+7wVabAwTp0zXIW9P5WjtrOF99xGqa9H0qBj+PWJOHq?=
 =?us-ascii?Q?XqBPmLynI9kQR4wvFYUpnfjqGd9jNVQvSwvakEwFaVAyUrn9FnhzHX2/4JWZ?=
 =?us-ascii?Q?40TiWGQEc0SlVcJ1MNnmW4D/SEUqrG/psTmbVO8bIqqvXFwRABUaQQUhdpXX?=
 =?us-ascii?Q?x9PU0Hwsovnb5X45kSqyUKnu+JUsYlzaOmVyzKXLmQoeqO+oaxkggxePKovx?=
 =?us-ascii?Q?phLb/xuOBnahnEHOO3Eqory2ZW1YtERCgOvCyUc2RnHZ5S6piDlnS6arB0NU?=
 =?us-ascii?Q?5I+sguNgj84VZfJCHDgAkJalrS6UAOb/dAQyM13hnJouIAi1a+tHxuLq17Di?=
 =?us-ascii?Q?RtEE6YVIfgcmLQBvegIfmnHlxeNTB5O5nlfzlJsOZPBEMriI3HepD4ZW1m9O?=
 =?us-ascii?Q?gc1T4b4feGCrDRepDb4TfitWLOJGVm5C6UXB+qVcnsmoHxcCrvr3a8om+h+l?=
 =?us-ascii?Q?qXb6FS63UmP/fAfgj3KMBKfX01QwIL6t59Xnve9fXevNhSPTEToVNXcoqfEB?=
 =?us-ascii?Q?xl1oo9gYQKvdaE1o62TP/KhPPap0QBHKRSPea63jhk3spS1nRsusUiJ0GFX3?=
 =?us-ascii?Q?9mDTYrjZFMaeO62+n8GOcUXpvdX8wwB12rQQN7DDhqXSkBP8NAlk7L9yTiP6?=
 =?us-ascii?Q?2J2RSalJJEY41LJMM5aHVXuYRYJSbVgPuGltwXtoWD8HNqltkwas1XGMoCRv?=
 =?us-ascii?Q?FCvwX9R5pysr6TkwcIHYKL5wBvIREGa+yQ0six5r40wu+DaCZXSUsFPZc+8C?=
 =?us-ascii?Q?SCKz9R42gg+9nkTrlgNrKe1EWGOtdFyu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+RRdYJT1jO44JKDkTnynI+9nvNRwAsbUBmgsqPfl5H3TlTNpAg8Q7Gb9sDGS?=
 =?us-ascii?Q?uU2Y5JYuBUQUj+x5VyAHEup3AfJcBfysV7WjWkqhZBsWAfEoJ5FNnQVFWher?=
 =?us-ascii?Q?5z0X1QQleN1l0iscH+OC93HrbYAVEruwVqIeQNFDhZIAcURohba39DxGqaOA?=
 =?us-ascii?Q?1ZT1NNDUnfRGquyjeM46gaClJcgzyybRe0Y5git7cYN7hpt5nRFqADlo/+IS?=
 =?us-ascii?Q?Q4MNbKrXuqMzF2N0Zi/pDvK3h1JIY6OX8BKm0Py79bq38kWLIZmkJ4KSdYvQ?=
 =?us-ascii?Q?89XRrbBLnbH/I3Q3JosYeXIbI2PgBNEQbe3hbhd8JBVaKtp0LFCYEjItM0mM?=
 =?us-ascii?Q?FC54K5pRA3FTr7avb/kt5L5DDraZuespAvcrKILMqNmPzKmel34KHMs3YHfx?=
 =?us-ascii?Q?aUz8RryIO1CF9UK7JAf/+NLpmjW4cflxJpAiBT6DsQgNgHINiVeeS7HqOnXo?=
 =?us-ascii?Q?hbDWZa2BBX1f5VCfEiBnTvNndd+T7rRTPyAhFRxsyI8HjaTW9xhplIys18qT?=
 =?us-ascii?Q?jvHBtNoA6kOQACURXdTRt1j1WFtltmyw6pVgVEDowPgsjByOAcTDo10fjAA6?=
 =?us-ascii?Q?Hz0I8SQDksorGXo+iR+70D2JsipZk20WYiZ4znXcXf3UCnrtvrMGWingzBx4?=
 =?us-ascii?Q?C0ogxfJhdRSPdwuif5oQ5WlibkVhA3HLMDhFfzqXA7L3ugiS0NUsAbJFAQbl?=
 =?us-ascii?Q?XXxkSXqjACLYG689vHtpGUjzoTdALWjPta2xtxWtKTVN5bk2exuVzpfS3Mg0?=
 =?us-ascii?Q?3xyT4eFJ890iGarawkVz1Z7EBYCAk/WZYuCvsF6KqJjdy6c67cb1HDidDtmT?=
 =?us-ascii?Q?OXyFfiVeHQkz8XuFOyDUflghtnvjry5uFti7KUax6ylF813GuG4qqEXsNq2k?=
 =?us-ascii?Q?JGKcqEunt/iQfa4l8h4EhxvKN2J0fT7C5BOUIX1GUGqgxhDjyCkwHekr9q9h?=
 =?us-ascii?Q?u453ae0jEpJMovBd5bmb3y0p+g0qJLtIR9A0vUv4+fJfdKop5HwttvLOOy59?=
 =?us-ascii?Q?xR1+f0G/I4Zv66Cn+q2ZOawB9hn00bwYFl/jTXbnuoLHwEHuKnbYVD/wkgGE?=
 =?us-ascii?Q?VpNvVt/AXhdqNyI+ZzYDkYbQSPsHC+8k6teye/UH9ipw/VWEaAzavIfCrrkr?=
 =?us-ascii?Q?RsXPDoXv1ywAKL7o1dVMy2iyL4wZRhr4uwVTSuoWnDU6bVwo392VxzgZIITQ?=
 =?us-ascii?Q?jvOaWEXqQbGHv0nS9IcnqF3XmeiNqCODD0Iix9UEhVzJQSqsDRULtDAqE3W/?=
 =?us-ascii?Q?PLq4RFcKwX90366dLtPmJxCjg7BWFKTq3VMc8tXBwjD6nx79Q7D8XspCrmRd?=
 =?us-ascii?Q?8E9F7/fM3/152xDIxjHnGZgu5a4aNIcOTGQDZPpq5IvgLIEVZ04dtUni/a/z?=
 =?us-ascii?Q?BMItq+uMLJ00Y5XSMqWPvmfAGd80oekQslDwtxbzLc+hMQSboLrh3fkamxtR?=
 =?us-ascii?Q?Gi4zP6yumHQ5bG5zqOzlpC8dBPbzUfYX1NvifbbaokvTbTF9IOVYVuFFB3Aw?=
 =?us-ascii?Q?l08UW2GdJtMIDLvp/iFFqCGV7P8AMjMJg9Y6qhI5DHJQ6eTztkTXbkMc7T6r?=
 =?us-ascii?Q?Y5Hg0Vc8trIx8H0A1eW7460Z6u1pAGOm174bXeDm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf2c16b-e6f3-4a3a-b12b-08dd57a0c367
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 02:36:54.6487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbMWS+lEMRiY1FaAOQpsMGjMAGlDPUckmEqtV0rmRbZx82ap/LJEEi3d5oHnaou2opdsjjIINfTHSwm0S3DsVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

On Thu, Feb 27, 2025 at 04:12:54PM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 27. Februar 2025, 10:53:46 CET schrieb Xu Yang:
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
> > Changes in v3:
> >  - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
> > Changes in v2:
> >  - add Rb tag
> > ---
> >  drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> > index 1394881fde5f..8c30908c11ed 100644
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
> > @@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
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
> 
> usbmisc->blkctl is NULL if DT does not provide a 2nd IORESOURCE_MEM.

Good catch. Thanks!

It may return an errno if usbmisc->blkctl is NULL.

> 
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct usbmisc_ops imx25_usbmisc_ops = {
> >  	.init = usbmisc_imx25_init,
> >  	.post = usbmisc_imx25_post,
> > @@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
> >  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> >  };
> >  
> > +static const struct usbmisc_ops imx95_usbmisc_ops = {
> > +	.init = usbmisc_imx7d_init,
> > +	.set_wakeup = usbmisc_imx95_set_wakeup,
> > +	.charger_detection = imx7d_charger_detection,
> > +	.power_lost_check = usbmisc_imx7d_power_lost_check,
> > +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
> > +};
> > +
> >  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
> >  {
> >  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> > @@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
> >  		.compatible = "fsl,imx8ulp-usbmisc",
> >  		.data = &imx7ulp_usbmisc_ops,
> >  	},
> > +	{
> > +		.compatible = "fsl,imx95-usbmisc",
> > +		.data = &imx95_usbmisc_ops,
> > +	},
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> > @@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> >  static int usbmisc_imx_probe(struct platform_device *pdev)
> >  {
> >  	struct imx_usbmisc *data;
> > +	struct resource *res;
> >  
> >  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> >  	if (!data)
> > @@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
> >  	if (IS_ERR(data->base))
> >  		return PTR_ERR(data->base);
> >  
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	if (res) {
> > +		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
> > +		if (IS_ERR(data->blkctl))
> > +			return PTR_ERR(data->blkctl);
> > +	}
> > +
> 
> Any chance to ensure imx95 has actually data->blkctl?

I think let usbmisc_imx95_set_wakeup() return an error should be enough.
Some errors will be printed for user. Also dt-bindings has restriction for
imx95.

Thanks,
Xu Yang

