Return-Path: <linux-usb+bounces-15098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1E9784D4
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 17:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E71C2817C0
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 15:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE7826AED;
	Fri, 13 Sep 2024 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gvH8347n"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FD6F2E0
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241204; cv=fail; b=fG4+CoNnkpmcJb3UcZDaecUC9756HZl60l+MhW0ZFYnfSAKIbc+5JX5v7a9jDn5FrAU37yVAmfZxfD38no2hD2RBG/Ln3u4/eRmNUIpExHUfFDJxUOfKanHaAy178v7msoQiq0Uf4lVorXUL4mnB317wiORmV5kL4s3pNRqI2dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241204; c=relaxed/simple;
	bh=o9lTAMKnts6KTam8jBJtk/UnSafeIeOZq3AJ6dskvhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FBwb4XURP5hy6v8Ck9lVcEU82aaUr2ipq9c5G+CaeMYjR1clz/YkPxoJUD+jKaN/5hW1akIdi6ePUiNEDJzCa94WOv/lyjWVRlxKnXzdD3Bwyvui2zJCpft1mrSpkvGqnrOBLWNq3tK0I/poNsObTqd3k88h3MRlOLc4jv0Ag5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gvH8347n; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrFsrTEDNQ3gSgFevVyO6FWkUjrBtq4gb1SVlV7H7GzSHr1xL3viOGWWpQcpOZpO3qYmG3KECCuCCf27B8BFMfh2eGPfedBWjOsELsHIeUqoUWyx5YnlBL5+hE6S5o6DgRak7A41JhAE1HW3SaJSEZ1LKl8+ywE0+VOP+t93c2iIyzghlx1sQ3LqWOe1h5vQiKWeS4/eXLoGWw+FB1l75fJw3JIBiBuRIhYQxKaWFwT1L/Fmvvmrw1gsJZJpAg93YiNkuXmqWe0XjqMvEhAiCrT+3xA8oKzgZlD4vbWfiL/QB7p2H+dU3RVksdwwLTFy9aNNC6ldo+fvelgrdvB61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp/M5brVS9Jcl5aHQbYYQXdvpPkPyLUBNk4yUiYMAnI=;
 b=A1Sk/34HaFnpchfdo6d5gVhgrxP3+E/4FvkfD50rmIQ8zVaRFRH3ltFxvh5Rgoz4iv1Pqw8XV0WZg7BDnphaVES/RIDy1tjTZbYmDBugH+WuGhi8N67LpsX0G7+pJyTjuvDkFlp90dpuVBfCU7lOCA3sPSvwFSb1pYzMly1E2YKQMgOxT+gK9DAvtXKKYCOvgCUlhFfzz2lP5z7nJ5Yz+WilsxHfEF0+3YECvKhF/T6V1l0Nv1kxua3uNQ3eGZWOBKC3sZHjPDFP22GkM5gYiQKH7NA276hHs55j177bXZoPC7iPNve9r6sgNeOvOXC9zZugJ9528LLsOxKj5N5FOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp/M5brVS9Jcl5aHQbYYQXdvpPkPyLUBNk4yUiYMAnI=;
 b=gvH8347nzltLs4HxZ+UdD3/yVZ6eAD1cYJGAaPaGKOWAtoZwqPpzXwXAKazmHumJbzyceXPX5Rg8VkNP7kzIahrxi9xn1n8HyhoBBRmEOIOj/Hbe7RLAN8TR18HXHhriRgQZEzGUvVM8DIS0rC/vQSg1VjTjbP/TEdab3QzmbDt2JAxdjH8OxOrYcgXXryDfRQrO1qZQ6hYeF1sLBUmKCOReUETYDYYBbuoGuUbprt3r2BrZTZkLtfVIi1vueGZYiuFCQKoh6dnMiddb94VdDotKcQYxQmC1oDA1klHfRaDW282OLHOnPb4KTIvABILFf6EWdThw9flhNJ38pAbDug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 13 Sep
 2024 15:26:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 15:26:37 +0000
Date: Fri, 13 Sep 2024 23:25:13 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max
 16KB
Message-ID: <20240913152513.uxgwkedh5ryq5ktl@hippo>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
 <20240913012045.GA320526@nchen-desktop>
 <20240913071133.pstilja3z25yey2p@hippo>
 <20240913095344.GA321485@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913095344.GA321485@nchen-desktop>
X-ClientProxiedBy: AM0PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:208:14::41) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: dab338fe-c44e-4061-a7cd-08dcd408752d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LOA8Z8/wZv78q45L3+7N4CZDnSBY+EAtC86F7rInElEnX75D7uJZI1uZLBqd?=
 =?us-ascii?Q?5JYurhbAm95J8x1akGBviRiw9c3OPQdOSqxhfolo6xdRbIeYwn1gHJ4fqvl7?=
 =?us-ascii?Q?TNXHLqRUiBHitaDbTrr3O9sP1WyQ34RvMu/9K0bCrLHnJ1+g+w8WVQyFDWD2?=
 =?us-ascii?Q?W6hn7cPdMl9NeOFyfAsvnTe2fHt2FJ9Mkw/gfOZ21/DplctE1wEuooQXpErL?=
 =?us-ascii?Q?vyZWrm/4r+FlDTaIy8T3qChJAcs86C0aMx1diKLxCtaVTiQa6HWEeSHZvbKw?=
 =?us-ascii?Q?Bu9+4EZvhMghpV3OdRk7S6H4M5RDIeXwXoYQ9U5jQcnUpWVUcoqGpX5hcQTM?=
 =?us-ascii?Q?AD1ykZHgU5ycToHJUvg8KWMxMRxmgBEBb/gDCAcpe0zJr02w6FSA+DQMuWu4?=
 =?us-ascii?Q?ogSk0YzBvVViQFoO3enrgwwPN+PWtKRDoHOZv/Pt/dLed/q6g+kNXK5Nysp3?=
 =?us-ascii?Q?h1O/3z6xKdN+lWDxA478y3AcC66V6PZ+LHd4/gQwk30vU01d+RHC/Ze4FbJp?=
 =?us-ascii?Q?CswrILP/xTxpGpZpC9OFuVn5fyhpEnKQTyVitYq+roNYASZndhh2QrPjwOM/?=
 =?us-ascii?Q?SCuJ53A2DeaQEjZ/sEFDPybRkgRmJf3MLeCMTUCrdiLPDYwULHAsjXWyQfFs?=
 =?us-ascii?Q?rpTgSWuRDh3bqlWw1/FjNlKeZgZyjfHBgJ2zbrT80QqGFkdX7nIwbHJlB+ze?=
 =?us-ascii?Q?LYZ3FMztcWuiKyNEDQwjPl5YlvaiXlJdd4JUbSXprUVPgIfFe2rQCDnjnpY1?=
 =?us-ascii?Q?hgOAL4PEN9+NLUqTp0hEO8dVzxNSUkaueKmbqS6jWDIN4t7f3zUVrhd418QZ?=
 =?us-ascii?Q?lFDn/NFb9M08f51oWOrzIFJMazrxCFOSZeJi7fm7O/LvWd/qpsYeeMYTk0jE?=
 =?us-ascii?Q?h3j/7dJRcwNrobwMyIxYVRdzq0jh8Rt6tZaFHj95cSkmVbyN4X6Y/Ye2ZnRj?=
 =?us-ascii?Q?TyMoKw96Hqca+F3L3domoOp0lS9GOm6VcZq5Ak+XMj6jgblRw9ccS0w4/eB4?=
 =?us-ascii?Q?Gls/EfgLcwYRv3jklzCrZU+DfTsRRw+Q3I28f80mumdPhEDDLyRo2r1x6lxO?=
 =?us-ascii?Q?ilRvBWGXkImuQ/QUeu9GmVF5Z419xd3MRQt2CiIjpBFwZkzXzMZ0fqSfaSup?=
 =?us-ascii?Q?Y6tDlzMpNkUl9bc/LiAHf3JDWnQUQ9GF8ogMTMqZ9tCxMQBQ4chwDa4UhDYq?=
 =?us-ascii?Q?lPzouW6Zn0f3b2JuGrEj2ObDe0/jtTlGU3/JA6sMY+TjM2xbEJeKNbhnqwux?=
 =?us-ascii?Q?9lGkahRiAlagKZD590QRIpSVdZTTLyHOiVP52TUOmnUF3UdHxhW/EIFXv/IV?=
 =?us-ascii?Q?xux4dOWjJnRlTSVFEvXuA7DKur0bTLQyE3z3b3rqPolGCs62yXt0Ek+LPzxy?=
 =?us-ascii?Q?iNyIBzTLoBPRmTO8276BS2Rbh8ci4oFi8Rj+HKhqIZTLnbbIkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BIx7QBO8N3NBv0iR2jRM4taLPrSZFoMrhZVD0MD51YrHCioIXoroOzVTXHU4?=
 =?us-ascii?Q?Fw3zozgqVdg7Z52fkL+YAr0e6wM/COGjdff16KPGBrBK+HI5sT9nRPmTbeLn?=
 =?us-ascii?Q?2G43piZx1qHOHpbBI0XigEG2hOt7ZVdoh5AilVG/ePQs53I4+0XpprR6EfqC?=
 =?us-ascii?Q?qBEcMasJD44I8CnrbNvlX4QScpjpTvQKnkG4ituqOosXUpqnM4UHNJba+ORO?=
 =?us-ascii?Q?beyYjp6uZ7g3oYbPUt1SbR+mAVOp95Bfd9jXQZbhRTGFwFHARIZrhDmt+jih?=
 =?us-ascii?Q?IK+kk+8ICjrzypdSeGwUSeD/5Swaelcnz6gBGO4a4bHzsFdISiniQ+6miB+T?=
 =?us-ascii?Q?xeSbh/52Dukzz3tksVD+LnMsxFaYXUuNUFLADTemxiaLpNo8UcCOUn9GKYsd?=
 =?us-ascii?Q?KbzxP7sG1BAzc1OwVlvfqdKbrUBBoAXsJLPiV7uAVvfpDxt2MXB6D7xEI6yd?=
 =?us-ascii?Q?9tY5o4mKWXSQDrGahFIDr+czBiui0lPe8EfBIV+HiId5BVMYFR8AGmlGhqmN?=
 =?us-ascii?Q?EmRoCDgPJko42iXMl0/nMnl965akD8bQ6qp96WKKwT44g+42Q3Lgi2Hyof19?=
 =?us-ascii?Q?bWI5n2ESL062CGffh19p8CBkpzlBbb6uHgpZHsP6HEiZYsqrYOQR4u04Umcf?=
 =?us-ascii?Q?bd7LVW9mtlsyENZNKAMCPwQ3X7y+INkExhxN/BbdPi0QiN9gTU0FvGDHX5xO?=
 =?us-ascii?Q?xqiVFvhSIbVFW5id893U32mJOWyMvhSW1Wm12F77WOojsxUsBdrBUBdu2eNy?=
 =?us-ascii?Q?DPz9uy0KvFahIYVnlO3OcrUnaioOKD1Pw7FDGWa3V3O/9XxV/t+9DF/9Qgo/?=
 =?us-ascii?Q?EY5CThGkmlYHwUxyRl61a+uamMiyfB+d9eQ7LW4k/y4Kop+0cwOyGf20dx57?=
 =?us-ascii?Q?WDEvC1dbD/D5uawBibaruFhJPl6AUbCMTrBzXb8HmSwtRg6+S6ynYcou1Lvc?=
 =?us-ascii?Q?WkWQHDo8aW2ETxstgthyOSq7VfWZ54WdBQ7WgQ+QqbItb6oKdW5zIjoArbX/?=
 =?us-ascii?Q?4UlKlCDg5ODfScd/3JA+PNMudv7EnTCbc1ZWwu5fmCFS5eMPlnlfAeVKX2kJ?=
 =?us-ascii?Q?NLcfZKOPuQwB5L6EVzrq568l+ftbpxzJhTmtI73o+Wi36nAKzKIK0VD87rzE?=
 =?us-ascii?Q?LQ1J8NH0No8+E2oOKnaH7pQQOWCMPvdXXyDAleZqCk6s3BF1PQ8TGG5sdr9N?=
 =?us-ascii?Q?NQBh8gphJiiAPd0BbZCVD4Wmmd5UBSwcNHL4vWhhj11ARQaeTQDsoj5I4Ge/?=
 =?us-ascii?Q?K5np+U69sh7cEhlvZm2Fumc9i6ZkIS0Fs3+xE1kQi8l45aUfMN8QEWkf2GxE?=
 =?us-ascii?Q?zFgGa8NUQ7Wy3bwUsa7IavJkJ73GZXYyGzkb7BhT+aI4l82RQDhmGEfYGQok?=
 =?us-ascii?Q?OQeUdXxNylmhPAybNliTSRn0dWmsMtfJqjEbc0cCUWYk4zfpg162agFa++sW?=
 =?us-ascii?Q?5xmb1KR9oNskg7JsblHcQsS1bsqI+8cmw50fptR/cbJhj/CzJ/+Og7gUKyne?=
 =?us-ascii?Q?k5Gw6Fx+S1aHJguQrcZ+ySQcDxogwuivBBV5U87gv+axnoTTz9MDK67xHR5B?=
 =?us-ascii?Q?hhfWff5J7uS3xV2kw3lj2kl+qC2j/qIsySbjVxSw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab338fe-c44e-4061-a7cd-08dcd408752d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 15:26:37.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPPvD8gGx+XqI17/4j1oRp+Us+jukGadS0VfRrpz41O/MuCtmPw6KjuGYWKGmghOw0n8gaA2h4dc6BpbC/nkAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634

On Fri, Sep 13, 2024 at 05:53:44PM +0800, Peter Chen wrote:
> On 24-09-13 15:11:33, Xu Yang wrote:
> > On Fri, Sep 13, 2024 at 09:20:45AM +0800, Peter Chen wrote:
> > > On 24-09-12 12:51:49, Xu Yang wrote:
> > > > Currently, the deivice controller has below limitations:
> > > > 1. can't generate short packet interrupt if IOC not set in dTD. So if one
> > > >    request span more than one dTDs and only the last dTD set IOC, the usb
> > > >    request will pending there if no more data comes.
> > > > 2. the controller can't accurately deliver data to differtent usb requests
> > > >    in some cases due to short packet. For example: one usb request span 3
> > > >    dTDs, then if the controller received a short packet the next packet
> > > >    will go to 2nd dTD of current request rather than the first dTD of next
> > > >    request.
> > > > 
> > > 
> > > Are there any IP errata for it?
> > 
> > No. It's decided by hw IP design. This old design may not suit current
> > requirements.
> > 
> > > 
> > > > To let the device controller work properly, one usb request should only
> > > > correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
> > > > support up to 20KB data transfer if the offset is 0. Due to we cannot
> > > > predetermine the offset, this will limit the usb request length to max
> > > > 16KB. This should be fine since most of the user transfer data based on
> > > > this size policy.
> > > > 
> > > > Although these limitations found on OUT eps, we can put the request to IN
> > > > eps too, this will benefit the following patches.
> > > 
> > > Since IN endpoints have not found the problem, please limit the changes
> > > only for OUT endpoints.
> > 
> > This 1st patch is mainly used to serve the 2nd patch which may impact
> > both IN and OUT eps.
> ...
> > Because it's hard to judge whether a request is
> > suit for transfer if it spans more dTDs. So it's needed for both eps.
> 
> Sorry, I do not understand you above words. First, you may know this
> request is for IN or OUT, second, according to TD size and data buffer
> address, you may know you use one or more dTDs.

If req.num_sgs = 0, then we can know how many TDs need to transfer data.

For example:
req.buf = 0xA0001800 req.length = 40KB

 - TD1 addr:0xA0001800 size:18KB
 - TD2 addr:0xA0017000 size:20KB
 - TD3 addr:0xA002D000 size:2KB

We basically won't meet issue for non-sg case. The only expection is that
received short packet on TD1 (or TD2). Then the next data packet will go
to TD2. But it should go to TD1 of next request.

But if num_sgs > 0, we need to check validity of each sg entry due to above
limitations.

For example:
req.num_sgs = 3 req.length = 40KB

 - sg1.addr = 0xA0001800 length = 18KB -> TD1
 - sg2.addr = 0xA0016000 length = 20KB -> TD2
 - sg3.addr = 0xA0028800 length = 2KB  -> TD3

This request can be safty used to transfer data. But we can also meet
previous short packet issue.

req.num_sgs = 5 req.length = 10B + 20KB

 - sg1.addr = 0xA0001800 length = 10B -> TD1
 - sg2.addr = 0xA0016000 length = 6KB -> TD2
 - sg3.addr = 0xA0028800 length = 6KB -> TD3
 - sg4.addr = 0xA003A000 length = 4KB -> TD3
 - sg5.addr = 0xA004C000 length = 4KB -> TD3

This request can't be used to transfer data since sg1 + sg2 can't
form a data packet. The host will see a short packet (100 bytes).

req.num_sgs = 5 req.length = 20KB + 10B

 - sg1.addr = 0xA0001800 length = 2KB -> TD1
 - sg2.addr = 0xA0016400 length = 5KB -> TD2
 - sg3.addr = 0xA0028800 length = 8KB -> TD3
 - sg4.addr = 0xA003A800 length = 5KB -> TD4
 - sg5.addr = 0xA004C200 length = 10B -> TD5

Compared to previous request, it need 5 TDs even though req.length
are same. Most of the sg entries can't share same TD since their
address is not page aligned. For high-speed isoc eps, sg1 + sg2 can't
form a 3KB DATA2 + DATA1 + DATA0 data sequence too. 

Therefore, it's a bit complicated to validate request if num_sgs > 0,
especially when req.length is larger than 16KB (1 TD size).

When add such condition, each of the sg entry must follow below
requirements:
 1. the end address of the first sg buffer must be 4KB aligned.
 2. the start and end address of the middle sg buffer must be 4KB aligned.
 3. the start address of the last sg buffer must be 4KB aligned.

So it will be more easy to validate the request.

Hope this will help you understand the motivation of 1st patch.

Thanks,
Xu Yang

