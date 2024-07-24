Return-Path: <linux-usb+bounces-12370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8A93AA98
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 03:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2AB22838DF
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 01:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD389A95E;
	Wed, 24 Jul 2024 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ii96iyC3"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABED979F4;
	Wed, 24 Jul 2024 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721784724; cv=fail; b=EARKRLsa1nES018ZPMOQdUZ+c1jIav9CdMWKmRvMCpZErUYu5gS7QNKCyHeJZtzc/ewYDlrA0/JYuTYeJFcJfF/kOt/sOuFfhHOZ23bYQ3uxZR3Oph5b7JplEwGf74WISfnpS8nCFJvQEdNzatGq/MO7ktSWnGmNOuJA/AMD/xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721784724; c=relaxed/simple;
	bh=KnuDxBRutZP0MVuIdLyQoG1dkJ0SsOQJsgQwohSx000=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LKXnWepzofDxuHeln4JbV0sPGwPC98wNOmix77SR1cU+Ttnv2hg8UQRMK5hoas6SzcDk6qNw40fpnxOL7g3XwGDJxq6WL6UdTNCRqNvpahJXOcrDKGx3BkIg/wRMpG1YxPp/8XIrh72RIdYX7BYG/1cLvxf+7qzc53scJ4nr5Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=ii96iyC3; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=az/ENCY4RQCNU4UNEjLuhmrbypuf3EhqXDQxJKE7+UiBM9INIhPP1OnPZf5laRIL/YQWVhbUVR3NZGi5aSlGgYYHg0erJAvQrfnzQD+YLFzBgAm8pvZqkI1hSJOO6rPgKh09rBoDWuHJASrs04o5j+0oz6iwuEK2WYJQ+y3Rt5AjD/ulvgvZ1H7yI2lBKXr9ln2jEVFJXLXH6WXMWNkhaLAm31gJXMmIEsC31Pv7fvwWewItxoOGfD0S2gTwlGaSdhAz+8FIjCHr98a8nldr0q7k/4DYZpgTWReJFdtK/V7ZrHum8Fshsr7BkXSUwh3ZFeM9WcgvLToXbugJFsciNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2FHu6AJ52czJOj/CMFy/JrimHvSwNXvzncKCJZoyrE=;
 b=AD9HZfevAVjyKpPXj6+d5jvixg64eYuNjhFIAKk7UbtJaKZzJEqhTDirwRMUwAKUwcxdixoBARDrQRW+p0DCzVD675v/aGpqoYBt12sDiOfjlgUJuE+6p1St1vwfS8GY8OGU10aQ2BiI8k/VV6zlA6tivlZa0S6uAjIv7G8WZGbf0FdfFe5vQbKagEBj9y7YjMLzLd0qpZq3bGcfm3op79X1WGEZImc3YH+CCitS+QtU1CNrSCMdYG5Kp+f2jvGZCEhXotGd1UUsBbN9s1y5+fWVKz+VCkHRZqvnj0LnjISHzpVc68CypV9xck4toSrMJOQbnkm014ALrPvtRURVVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2FHu6AJ52czJOj/CMFy/JrimHvSwNXvzncKCJZoyrE=;
 b=ii96iyC3mgMAsBGFKqO7xQl6/9y3mFB+u1kOG39krSgEW+LKcGFf7yNX6knZVAJ4RO0UF989KPD/ojfhqEPpM5RIev1eWNfgPfDY8CRj88EArC0Ih4kb73+bUChxOWzfs55xWSPe8xqbn22MaoFNawI2+EJxMWx8nWKAnElHV8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8882.eurprd04.prod.outlook.com (2603:10a6:20b:42d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 01:31:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 01:31:59 +0000
Date: Wed, 24 Jul 2024 09:29:24 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim property
Message-ID: <20240724012924.5x3xe5eosvtfyhhg@hippo>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
 <20240718102637.3964232-3-xu.yang_2@nxp.com>
 <20240723025110.GA199927-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723025110.GA199927-robh@kernel.org>
X-ClientProxiedBy: ME2PR01CA0142.ausprd01.prod.outlook.com
 (2603:10c6:201:2e::34) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 4009b9da-8067-4542-e6b4-08dcab806904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tfOgUbkKsgVAy7/Xjt4Pq+9/AHq8hptsAccAWYWHnY6bEWUV3ur2wQSY6KeT?=
 =?us-ascii?Q?xcM8F6KDWa198N0c4RNyLi0pBg1ck+5nBmplQfMLRg4X63lpzmicNWtnfl+F?=
 =?us-ascii?Q?+SUk8orePHx2+LVi6Dk1u7BlDSglchfSQiHoS5/ryIMtMJQkFmO2uYqJTnD8?=
 =?us-ascii?Q?BPGgDZAx3onIkGv6/fh1JwDmtXs3FBfTyvFi0FstMxpjRUOUpt3ZKBJZNApw?=
 =?us-ascii?Q?M2R1TrslmOCJeEq3UL/p54EqaAbzA5lGWw0sgGtJP2yxXe0b0dcuH8ngAoFY?=
 =?us-ascii?Q?Cl/chFUrivaTTaOGxxyxcRcKhATOsd4XPFbLkntH6KyhXIaZJzoXw1+wNKtn?=
 =?us-ascii?Q?iy6L0A4Zp8+ICykHVV6n/I9x2fUSwvZnRYqblopMdx0hNm8kAlwtyn/hUFeT?=
 =?us-ascii?Q?2uOUE5VzQG8zrux0m/TbcvbkqA53FJM/ErnZcIDlIt24Oz8wJs2MSycdLmzC?=
 =?us-ascii?Q?ploOtX285u49OSsdHiuJkoS2NKINmONJsr58cGCure+hzn0ihArd/4cYV9Qf?=
 =?us-ascii?Q?q1IwVhG5cNvjS/YFfEzj+xRy/QU1j7SKb5QGA+sgC/1Q2EThaTzDSjF03Mnl?=
 =?us-ascii?Q?GaTM97v0rUo2GNiaBu9xru88HZk1a9fS70uvrzekbEoZuuTpQMOsMwBoqCKr?=
 =?us-ascii?Q?ALn7f5B78dEzyofsiBECK9WIrUikWoHvN3HEZv4TLS+zf1VCYhnzQKax4+Z6?=
 =?us-ascii?Q?HwgEOgAIlafTyzzW56wRI4ln88Iv2WbmGdNF37w8gAjWVqSf8HmShI7fKnA6?=
 =?us-ascii?Q?u6P49+VSQasTpiY7F5jhwCGs5RUc1PFeCvyPoVP1fkhIJ2TEkEF964sgH40T?=
 =?us-ascii?Q?DSTpYyin76D2xJlCGKwTnfY9s14Tpz+Akz4G/86Q4gpU1Z8wbVUg87X25/0F?=
 =?us-ascii?Q?Gf1UImIE0YDTPGyUS7TFYP19/AnY4My/elTLeVE0S/Gs8l4brMK1kwlz2NeC?=
 =?us-ascii?Q?uQ/pHy9nMeqYJ4xZdcrlCJhlLudzvkKZ8Nxiq+8hIn4FXxGDdcJsl4FNE95A?=
 =?us-ascii?Q?DUsQEekjISKQNhCzJewwbK7xjSI00TCLx8/BVYHDubVJCMuFeU0UIxBXe2a/?=
 =?us-ascii?Q?XTX7g2ZsXE4sdDyoTgpZiRfif5SbvRnEhPQzqw4glmumpN3rJwaIVpJUWUq6?=
 =?us-ascii?Q?TlpViG0VcXLtWrPt5jEAaumpClEFbdtBV6vzjXnKM3cZiOpJ45AOmP0tGZWk?=
 =?us-ascii?Q?7gppCN+RlCJ0j69B35EibWNAajzoQASCzk5ygMG742I1iInhhZHYssZeiKwn?=
 =?us-ascii?Q?MmdxQpEjyGieASHz8iv5b7VhcqgaxSjoDWmtZs7VutTm914MLYeenAWKUGI0?=
 =?us-ascii?Q?8JaHPmj0fv9WnbG1jGICA8SoNtqaBwGXvQbHcRMbYoQfwOoiryOfGVStqzm1?=
 =?us-ascii?Q?AvRsIy8lsw5O/cs0pC5Q3tl/aeEWA0VETJdwu00cOq0P75duWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZTwB+zkvdw2WzKMAM76j94z/sy5QGWChSzG4V4zif5XIpUTVf9WssxqXazum?=
 =?us-ascii?Q?unM5QIC+gKPNUOrJUPvDd+aQwEoEzM1z4pLuC4ipoFcrQaPLrrtzHSt/vgVi?=
 =?us-ascii?Q?e6CEJPW+yiUXiMN9mNbSyxyGdseReT8+o6eK5fxTck603kN6yS01TUydHwNW?=
 =?us-ascii?Q?b8zKpjpEV7gX9yPuJWJl/pSVdwOUAfhNyqqde3DTl1jSp08DxAAe+AgRXbTf?=
 =?us-ascii?Q?3Kr/jmuv/3AATE2sZhBUzUjUeHYrPzkuYxpWXLeSY9E8ENGowNBmOW7Sxo+5?=
 =?us-ascii?Q?l8lhdInxj5JD/CBzrGFChNNx+GpxUfemiqn9bJcErOLLhgRUpHfPOLv92geR?=
 =?us-ascii?Q?+GMaivmvNygzoJE1xbj70C0Rxl/Xp3W/qMkb6jiLPrZ7p7S9NIFedTBrfIho?=
 =?us-ascii?Q?qGCx+ppw9QCCFeCeeFLw8YW62RGtsbdVdlDbOUQVc/CosCLoyKTdPfHK7TkI?=
 =?us-ascii?Q?AFb32j2hB0DyGKGdn1GVnULH0Fmk0VTVyzBS1owZMTxDv4my8hL/Bw04m3ei?=
 =?us-ascii?Q?SCO77GvrlkzaBwFvkJJClLjcqONEo+55M+AIfoZ+6R1iZ7f529nkfTgkPQd4?=
 =?us-ascii?Q?uhNss21UOvYFtl5E+AI2F6leyqUrtkl85zNyhGcZaWNHGC44Pt5rpijsdsfx?=
 =?us-ascii?Q?/Sotzse1nRnwdhQZDl0kroeGsFQ82LkFXJun7UOnmPyAtITybyVd+2U+B5i2?=
 =?us-ascii?Q?HCL2KsgYaveb0VfJUy0W4A+8+3kZP2rPTL8QLG80VR7tq359w1He/Ymu1Z7B?=
 =?us-ascii?Q?NpaF0+VI9sOgETrt94kSCxWQUu8dx4KOHkBEkeMiock2whQIBA/dByF2Y+WO?=
 =?us-ascii?Q?Ccx4jBIZMYeblbe9tPNyV/CLdcha2dPMK2Sg/BtmO0msXCvHfIZfnp/9CZjK?=
 =?us-ascii?Q?fYOi6x3dESnIu5SfJm0QCSgsPswyj1NfvftRyUOVJoi4etY7/kfPE22HOft7?=
 =?us-ascii?Q?6n0XLKYgvraXrr0U//+x3/8oxVugsBu2jUxJ696fC0wCZCzNPRducnZQHkP2?=
 =?us-ascii?Q?U3NEHtWJaYS/tMp8hfRF/+WdDrJcVVpICIXFcjZZIIW1jAL1j5epUBspqNV2?=
 =?us-ascii?Q?fgzzZL1PGlv14rIkRKAbaLXUQV1vnZBrCdg5/hNORGOS0ASQI7iOI1eOz4U+?=
 =?us-ascii?Q?cYK8Z/usjtH8prLViWOwFCDBCwlPKz9NueQf/LJmAuSYYQexECyhSodTlWra?=
 =?us-ascii?Q?sp0D7e0JTVeFZ4JoV55k+6zO3j1WzOtAf5nr6C/LyK8ANpa4EW8Zri1oDepj?=
 =?us-ascii?Q?I2pNAg3lAMdySOTgywilx3F2P2Wo8aPnw9xfJvhccVeaYqhgVq/zL1MKKWkj?=
 =?us-ascii?Q?TAlWQRvVrgba2INfIG3qb9M2QGHQ/g7M5gy5x8hJA6M3LsLUzOt/H6wxOuCB?=
 =?us-ascii?Q?7MmLIsTPfAmQJvYSZYbyXnefymaI9FoNAEcP20zJx+bFFnuIYtN7BFT6+anz?=
 =?us-ascii?Q?C5xIz11kE/nyx/fHtBOjtAM6RiuxZxlCUWycgtiRgdULeWSb8LstkxLsLN+d?=
 =?us-ascii?Q?eUiySox9d/OCU5AmImQ9+wsFlZ/7OTuhAWaFUs+zG0lLUmAMrzGBfHPOogmn?=
 =?us-ascii?Q?+WOlmHppeaddv3UfGv5GAVSuqialZXM/sazxtn55?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4009b9da-8067-4542-e6b4-08dcab806904
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 01:31:58.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ek0rrxSV2XvpWuq8cDG3Cjl4r2ysgdHmw/WtD3Qg95sfIA08XisinPRTvZxqjZxfYfK3fHQr41g7zSOINsGcAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882

On Mon, Jul 22, 2024 at 08:51:10PM -0600, Rob Herring wrote:
> On Thu, Jul 18, 2024 at 06:26:34PM +0800, Xu Yang wrote:
> > i.MX7ULP need properly set System Integration Module(SIM) module to make
> > usb wakeup work well. This will add a "nxp,sim" property.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml    | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > index f4b1ca2fb562..2141f271f8f1 100644
> > --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > @@ -87,6 +87,12 @@ properties:
> >      maximum: 119
> >      default: 100
> >  
> > +  nxp,sim:
> > +    description:
> > +      The system integration module (SIM) provides system control and chip
> > +      configuration registers.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -110,6 +116,14 @@ allOf:
> >        required:
> >          - fsl,anatop
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: fsl,imx7ulp-usbphy
> > +    then:
> > +      required:
> > +        - nxp,sim
> 
>        else:
>          properties:
>            nxp,sim: false

Okay, I will add it.

Thanks,
Xu Yang

> 
> 
> > +
> >  additionalProperties: false
> >  
> >  examples:
> > -- 
> > 2.34.1
> > 

