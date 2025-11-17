Return-Path: <linux-usb+bounces-30544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408FC62874
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 07:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 611093B3CB4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 06:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D62315777;
	Mon, 17 Nov 2025 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ev4kAGKF"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F81B4257;
	Mon, 17 Nov 2025 06:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361231; cv=fail; b=r/Lht8RTGqYXSVo+U3iYFRurCU45eA4lDrGbPLzlj6DU1Flr6Dm18OgykvMn1iJYABeATHDLgl5iZuR2sL1teCQH+uEkvsgajN7J1V6ALyw54ecZBlQVgEBO74OhQU1d/o2ysFYjJlEDt7Y9YgAn+geZSUG1w81DRFwFBVYdxu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361231; c=relaxed/simple;
	bh=lhxukA+MJ5c3UM4c+xdg+SwR+hQuWxtVJYVko4J8pn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lhdAyCPc+MlShMUGlnhecbb7XRfzEb73QmrpNlDj9MYekBS6fMH5uTTIFBKYcWtup5z1uEu09foecZmc3EaN9RtrPmSacgWdR5zFhKGbLQDH0dHESClLVvrSyuvSRGoQ9DZp9ajpURmsA3psKcMRcXpgYbAzeTHdU8JYCoRk8o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ev4kAGKF; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYZ13fUG69MRnCK1QBWJMTcosgRqJimlcPPGOdlCCh5UVrbZbFigjz8peTWKYfZQjD436I15pQ22cgY5NbWydxD4MqUg6yBiOw7EAggtuAEQU9NUaMf3Am+8dbmSrBd7O/fiUxetuMP5S8XMZTEo09DZjcTGKIXdq79dJoPtV74ZzHMNsfDYUh1JgypInGcbeEkyCssBZcJJkUPeoUjVVPAC4EstrQKW4Nq2mRkCdocPOT13CC5Q8xxiq3oo+LbREBKgm272euxNIYeyXAVSYyz0z85xdOH2IcHucGRBHYtAmIMmWABRhv+SsyJzSWZG78aTt8caV9/nGkDzOm84vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMbt5C8VBY3S2d0KuZAMg+xkFWwZmCcPO/MBUfphl6A=;
 b=H3p/2qPWPcvH9FAAhbIxdLYDss0HWtW4p+TRz6tIWYineadvOaZt1XP7lJMP0PPvLabmtUjhg2vgjgqmNyN039poz7EKuoBqj2cL43jIoQWC21P10rEHlFlHsT4aWZoY8+t5K3gQb601EG5F5+Sj5jdCol/BXAh+z9SnEkUPliesJU0q1ovNqvQnWv0NnYqwrsNV1sr6tGlDSudL1wIeUqKt1hYoMOVNtht+nxf6EbFDhv6wawcjKsTx1slVTuBXbBI97GLOXJcnsIrRtVnUCHzvzLbwJlUqp0XjQUJs0WiM71PposQn5DXoSXVT7gDRLSlc9zSO8ynjl3jKCj9eLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMbt5C8VBY3S2d0KuZAMg+xkFWwZmCcPO/MBUfphl6A=;
 b=ev4kAGKFz8nwmgeHTQZu5RjmLuw5v+10pnv9c5iXXLZajqHBKqjoyHuF8EGfizKnf1nfhLPxsQ/MWhQip2ZQbTggifKrtQJwmEq3RdkUtFQUXus2xxbYaOqOrLO+r6FK/DRVxGHP679JVnY3avo7p5KsoYtep06DJqJpAIqqgo7OYju3M6swEqa4CHHLUuTQHo9ZAKD7YiP66ii3zISsZ0MADLup+YglzQDrinGqavo5sg/WS1zzG+zDeBSZQmjBMoA+NGRvUxHWGF/s6RaTdTOk8MT47dHGFztb5oH4AvM10ZQMQasqmHxh6OecDFi7hwj0Nw1ZjLoCLlMmINmOgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 DU7PR04MB11140.eurprd04.prod.outlook.com (2603:10a6:10:5b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:33:45 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 06:33:45 +0000
Date: Mon, 17 Nov 2025 14:27:03 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host role
Message-ID: <7kpf7gnftumdwdowutryjz73nkap4vp3cfisrigt6def4f36vg@ijlj2eqwzsip>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251105074504.1427926-2-xu.yang_2@nxp.com>
 <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
X-ClientProxiedBy: AS4PR09CA0005.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::11) To DB9SPRMB0022.eurprd04.prod.outlook.com
 (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|DU7PR04MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2a8daa-e0f7-4fec-51c8-08de25a34213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PnL9OmY68H6yemG0/jVDaNneyz7RkSUufCk2V+xqOdEuL8yAPX1BOq7oiT4B?=
 =?us-ascii?Q?svsJhq+GDMSWRalZZaQeCtc07qb/L/vdGC7ROi1AnyddJMeL66cLqXax49PW?=
 =?us-ascii?Q?TPuPvIfAnUSR6crKTl71PbpE8Wk2L09ao1WSOEqklgQtaVuj1cyamTk/6ucP?=
 =?us-ascii?Q?p/bSOYGyGmFjOE8bIxn1hGgtIAjkFDbQUCBoXsQqQspA1+3CVO3uK7vurxtx?=
 =?us-ascii?Q?3lp8F7XSYV+4Kk5/sJB0mx8yKIdra9MCAZolesxS+vy8Yc77zqBZLR8cDIRu?=
 =?us-ascii?Q?VaI4EGYvZYv7gVZcx8SdiK4MXflC8BMVz1MZMFyth8cECREZk/SO0s3ZdaMc?=
 =?us-ascii?Q?E95xY/a938oWpKpieYhtXx4OSyfqkoliBIXXMEj9lVVcRHBtvgTR5PGg2iWe?=
 =?us-ascii?Q?ejek+jOm6uFSw+qjGgcgQKHSX25ePYuGQEnIh1ThyQjtKSkOJBYwZm6zTP5w?=
 =?us-ascii?Q?zudqcs0oUZ/sJW5xtEwmBCDI+dAFN9+gufhpsmXbLm+7fr/YpDgUMJu1MJ0P?=
 =?us-ascii?Q?N9u3S3AZ7VGjpSEASUy/7t1sbBLm5bUoM8jL5nIt/669/rNxviPPgeaKcuR5?=
 =?us-ascii?Q?AycYehM6DXdFaTKLP8ZpAbV9p3Zgg1m07UduQXoHQaao2zuYWRIDzDDEGGLQ?=
 =?us-ascii?Q?tI7DeIs36rq4AvfJvKWc3quHn1ioLIVbNRkwUO/6nfVQKv580xiyMJ3C2Sy2?=
 =?us-ascii?Q?pM1sNYYVNRVZ9nU+97f4O7BSKkYvPPskaE4DxTIqOMcm2D9Hfv4hUNXbD/Q1?=
 =?us-ascii?Q?vTMtANRX5gCJfFYnzVQXxqWQbANT23Qp1lM5p0pl0kb7LququXHU1wsyJwd0?=
 =?us-ascii?Q?uyLUp3tYzC0yRqWA84wpxEIZqye5CnJhhwlID07d5DHBDK6sZkboCxKc9Qp0?=
 =?us-ascii?Q?otZGMLbcsWVJoGRfrJSG3rkCPnixyM5c7U4RgP9dDnBQPVfrj+BVo2A4fFKc?=
 =?us-ascii?Q?Wz3g0CWeYI4U0YZmNaPageL3ZSQc1F4lASuHSnpUPOeyc+jd1o2EY5D9vSqS?=
 =?us-ascii?Q?nWT6PVgRqbnBddka8I6wiXckYf5kOruovjxaNqD/SxHXz4CBesjxdtmXfw3Y?=
 =?us-ascii?Q?kNlK2lLIfQ0WebIPdqM8leMIm/R+FSHdOZiLNp5T3cVxGmAPCy+I0WnFDYVT?=
 =?us-ascii?Q?ttk1U95oey263CSLzht9JIfHt9CeeeDRFgxHdATrR8WnVF72/dS4RcpBhLCS?=
 =?us-ascii?Q?NjhUIzEaAN2Vscx883RFC/gfteJd6BnUUdt7wU+PWShoADh7c5KjPcqJan52?=
 =?us-ascii?Q?jQsOpwANECX5zBlfFwQVNOBnbOWZYC8+qoceUPwhHeaku2ofsnCRCVznYb06?=
 =?us-ascii?Q?V9pb8srDyYHcv6JCMxH5Xag2JLqd32Ktb08qhIe3j5hvjZFUSw82Mxt7VvnQ?=
 =?us-ascii?Q?vhV8mFp9z8RKyjmUDn4TyfbMm+ptrOijDLgZGht4Xx4hMKsszMv+hxfCIFc+?=
 =?us-ascii?Q?hwLnnbxY+5em6QML1bgcr5klRrVzRb9+8y8QjNbpU5ViiFFbZTZeMQjUB741?=
 =?us-ascii?Q?jxRZWr60LVm/qeBGH6EF25xpSp/xNHTPel9r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2sjxhpuHa2jphiEPMaNPSGc9gyTrrIRhZ8SOoBlzBAU9l/RoCzmQv65f1XH?=
 =?us-ascii?Q?DhflW3IulNg0AZEs7ywsgpOqRHEsneNzScL7IEcOkeYIoChIlyhQZEu1zpOH?=
 =?us-ascii?Q?D7fBN+xVqDrOr3yQQL7LoIGuUCNT5EFjF4M0nieOrC6srhn88i1XAEeUSOQE?=
 =?us-ascii?Q?dCZ5BRkAhOfEJiWhFQxmZSzIw8pmTHNrKlYNxNHZUIq9HTYwzUeUcT4CaiHK?=
 =?us-ascii?Q?pg/lOcaWrva5HBiufjsFwJb0+96ZI+BV5jMLVc+Fpkp2miHXXFi2AjB8CYYH?=
 =?us-ascii?Q?I33LKaLkYs8WMIIUo2KSTF03b4zBfylp8vrl976rLrb7hCzN7ZlPn221T1mM?=
 =?us-ascii?Q?a/okiKD6m0kQLXig0WEut5iOiTjCh4JWgE0DHDgSdHcDBLsnD+sh3Zwti+NH?=
 =?us-ascii?Q?c0G2K0gynBV5OeCdgb1PKV0r8VVkHzhXcfNuuMJi9pGJNCp61hrW401yzKIX?=
 =?us-ascii?Q?I8ElO6pMjgzsDEoc8VE59HoulsJSCJps6faeaQmJooT7c0rxWeXKpDsdTB3v?=
 =?us-ascii?Q?45vWQW/dm14SaEJASNSdP1WoM9bhpyALXth+3qc5wY1UCH6SyoyqLuL9PoFm?=
 =?us-ascii?Q?V2IxYUc9+I2Qn8DluLgpS4P6ns10pQBNDHVCulj8RW6VGbEYsD/Xh3QltEUi?=
 =?us-ascii?Q?JwdvaAyBh1F3Xk7Q8Adzyiw1QfMc56gEsFXhog06v4vXibeMhtq0yIAixWFi?=
 =?us-ascii?Q?mUx8OCekksDijjzuVK2/5uzE3Hp6sXK9ttyUbhTjEl9AucCRXMVilBQFjtrs?=
 =?us-ascii?Q?K/JnjWbNTUbhkXGDppfmr33Yl2E4yGT9GdearKE1KKe8coZObMGU/4/2Vlvx?=
 =?us-ascii?Q?Hpa8U+I/qefJYEORiGvpi2Hio1fErybR1UL23Ci0wk1tZ796aFsdGkmsou34?=
 =?us-ascii?Q?yo7DNKD6wyk7GN+nkzleVCskTURFP4svEIdhU1vfLSR/M57U+Yfr/cWYMqLa?=
 =?us-ascii?Q?ABZPhge3Y+vxKNZIB0RT9o7jTPls1MOq/c6dEGoQGd0My1tkWL9ngzPYMJik?=
 =?us-ascii?Q?RxhUfvb855vKhdmzr7HPQIafLH2zaRrPpEVNvduBWrkAdpl/JMx6gXPFRetb?=
 =?us-ascii?Q?kfZoIa9ch7reNu9rXoSRyrgaw50vYFCfqPHuzuqb69BqjF4cME8dHPmxbYpN?=
 =?us-ascii?Q?YMd2GE/NP2+Sjqcgs3h7u8CDSvAHkcfcDgaBCyojF0E42Suz6cuzX+WbzcvE?=
 =?us-ascii?Q?Sefiq/REbgzZ7w+RreNJvNWnKqCNEUZZRDfoOPgU+oP9uI9TefpwZlssgeFk?=
 =?us-ascii?Q?Kexh1IHNuPM6qmuFpI+0GkFnEH3Ro7Jv+Vrn8vT3CbmvKwwAKu+T2v2qOL4h?=
 =?us-ascii?Q?Fovs1xA489qxekLbZR+0Ta0C2cXEtGomFIiYK8PEVm71t/gC0QOxghy0Jnpy?=
 =?us-ascii?Q?WL73zgT4nWu1SwVHhHq4yQz13VOwFoijZR89WfkwF2z2dLmTyM5GnFEYEw9u?=
 =?us-ascii?Q?ukjtJL5A4dC+UFLVLa1PM627aqT48o0x9Ot40hv2PV0u+PgXH0JkcTcEoSiZ?=
 =?us-ascii?Q?Zziwo8M1NlijrfQUlzguBOTDO4zmFJL6IM8F34/HLDJiaiUlPTXhAyhh+KyS?=
 =?us-ascii?Q?yvgk5UckR3T9G5PcrqTeCCyKSsHcagVkvXth+5wo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2a8daa-e0f7-4fec-51c8-08de25a34213
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 06:33:45.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wTl6OK2vU2WZOp0AJTngp5rj9MmSa+HcMlJ8ePuNngbWAkQ1vCmtLA7YAxzEQFpWPCVt74doVgaMjgIFp22BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11140

On Thu, Nov 13, 2025 at 11:05:43PM +0000, Thinh Nguyen wrote:
> On Wed, Nov 05, 2025, Xu Yang wrote:
> > Do dwc3 core auto suspend enable for device and disable for host
> > , this can make sure dwc3 core device auto suspend setting is
> > correct all the time, the background of disable dwc3 core device
> > auto suspend is to make its parent device suspend immediately
> > (so wakeup enable can be enabled) after xhci-plat device suspended,
> > for device mode, we keep the dwc3 core device auto suspend is to
> > give some wait for gadget to be enumerated.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/dwc3/dwc3-imx8mp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> > index bce6af82f54c..80a431cb6fed 100644
> > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > @@ -158,11 +158,31 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> > +{
> > +	if (role == USB_ROLE_HOST)
> > +		/*
> > +		 * For xhci host, we need disable dwc core auto
> > +		 * suspend, because during this auto suspend delay(5s),
> > +		 * xhci host RUN_STOP is cleared and wakeup is not
> > +		 * enabled, if device is inserted, xhci host can't
> > +		 * response the connection.
> > +		 */
> > +		pm_runtime_dont_use_autosuspend(dwc->dev);
> > +	else
> > +		pm_runtime_use_autosuspend(dwc->dev);
> 
> Would this override the user setting everytime there's a role switch?

From what I know, the user can't control whether to enable or disable
autosuspend feature. So there should be no overriding problem. When
user change autosuspend_delay_ms, the delay setting will be kept
everytime there's a role switch.

> 
> > +}
> > +
> > +struct dwc3_glue_ops dwc3_imx_glue_ops = {
> > +	.pre_set_role   = dwc3_imx_pre_set_role,
> > +};
> > +
> >  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  {
> >  	struct device		*dev = &pdev->dev;
> >  	struct device_node	*node = dev->of_node;
> >  	struct dwc3_imx8mp	*dwc3_imx;
> > +	struct dwc3		*dwc3;
> >  	struct resource		*res;
> >  	int			err, irq;
> >  
> > @@ -240,6 +260,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  		goto depopulate;
> >  	}
> >  
> > +	dwc3 = platform_get_drvdata(dwc3_imx->dwc3);
> 
> It's confusing how dwc3_imx->dwc3 is also named dwc3...

I will rename it later.

> 
> > +	if (!dwc3) {
> > +		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
> > +		goto depopulate;
> > +	}
> > +
> > +	dwc3->glue_ops = &dwc3_imx_glue_ops;
> 
> If you want to use glue_ops, please use the new flatten model. I
> don't want dwc3 to be initialized again after of_platform_populate().

I understand the new flatten model is a more suitable way. Considering that
many i.MX devices are using this legacy unflatten model, do you mind allow
this change firstly and we will switch to the new flatten model in the future?

Thanks,
Xu Yang

> 
> BR,
> Thinh
> 
> > +
> > +	if (dwc3->dr_mode == USB_DR_MODE_HOST)
> > +		pm_runtime_dont_use_autosuspend(dwc3->dev);
> > +
> >  	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
> >  					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
> >  	if (err) {
> > -- 
> > 2.34.1
> > 

