Return-Path: <linux-usb+bounces-21844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F352CA676CD
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6C23AA67B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FD520C47B;
	Tue, 18 Mar 2025 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W7R5tiEg"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1220C488;
	Tue, 18 Mar 2025 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309364; cv=fail; b=pTeKcL3H9O5/Uz8S4isEbu9JutVy656qWkxwss5q28FoMmIKqT4WA73X6h8UVBSw28qsyY9uSMTXV5ud58rzR8Gf/k66jlVU7nTNQxalTc9FzemS4NAlCqyAGfhPD11whMF+oAPsINURx3kpzoaLBA1h4ddaJ72IeI5vYEtTVV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309364; c=relaxed/simple;
	bh=G27ng3QAiz8XpBXP/jNmTQHNksoBbW/LRo554GImOh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TuyrcsUGZ3i7ZwF8X7oovGpWP/5pyKzxnjAPrB7pdbmb0X/7A0Cs220SRroHloK21uhPCO7jh/5Ph4HNchA2CzhOCmTiDvPQVEjKFTQTs3VwO9g+CN0/D0d136gPDdXF8uDg/P+9nwUDz3Sszj20JWnBe+6oR129fFdwnP31Hxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W7R5tiEg; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arx++tX0fOzn9Uj3+yKDX8khyO1n7ZhI6vL0a6MYCjjM9Ak9CgCGqKga/GPXkrGh/MVRoy6f+dZS+KC6fOupBd0bUlWGMKHZGTK9oz6BXrZWInepi1nS79KkdmQluv3GL5KO8dSkyQqbwIvEoH8+LLSVJBEhvyQusa3plkeL+uNEV//9fDHILM+fYSKIjD/amMjBIkH2nApilz0T97tpWr714FXZWx2fSwafqvdW/6mV/yYGroohlqa/Q9XBLkBZGqW62Y3RlmiuI3wDxYar3Ai9YFiLxn4FAJlX8zgV4Bl2O2Cbp/4v4c8XD73PmhuV1nDRjbCp74h+LHoaFFtwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOk2/mYEhjEzx3ScEFKaRx/J86648PfMnZ+UHcFjHgk=;
 b=MUmYQUdzNwo5Zj0ET3ARsfbAbbOel0YxixMfhKFC9L3S39tk4JYbB6nXmDKI2YiePGG6xBUdgwuyUXEVfN7E2YXaBWBZoFYesKCPemI1RvaW62DPv0C5TLZJV0h5fIxy/7nWOUmY1xLenA+b8J9JpyV4O3d0dqk6tBSiCpA3elfoFO33K0qdmw4AXIDo0ZrxEU6OyyS3sJ+kPtNrDnFVPw+/uKkfRjEFKuKPMFGpIyG5kUbk7mMRihJ5huckLg5i2tUuQpyGk78qGjwuAKgjKcPEhYMWr4aP/3rne3XO9P1kFP7Sv5umZB8fIPcfn3WQ2eNUN4b+GzTxjJrPrmIIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOk2/mYEhjEzx3ScEFKaRx/J86648PfMnZ+UHcFjHgk=;
 b=W7R5tiEgyUmFTQH1IEXltyeVD2MKsfGW30feCPx+JmP02+BgwGgXYdX++nthUrQdiNy/FTuGitS72z4R0rSTb+kwYp2Sd827Ta11FoaPLJkVuOHDQBKOCusthdZDZ1aMla/SdF9PBbDbDlPu1DjKztNc5U0wPT8EmvudpyDHlGasVJ/Ywaf0nDS3QkZL65GtCY5mQaUzRqka2GDJFFbsLbJt0lXIEzSQ7iCr1mC7Ss0UqeVw9mF8Wpb/7vC/g63envj5i0Yp+SHvTIYB6Xzzb2Bkleij1B/96MQfZUuRhp2iTmecDGlB9UL7WoBIIEHQ8j1nKdipxqaGwsjRz03tPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7788.eurprd04.prod.outlook.com (2603:10a6:10:1e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 14:49:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 14:49:19 +0000
Date: Tue, 18 Mar 2025 22:45:42 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Message-ID: <20250318144542.7qgqqdg5mdcn67zf@hippo>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
 <2025031443-rounding-subject-1f60@gregkh>
 <20250314092137.6m3gmj4irxqwpy22@hippo>
 <2025031404-elite-critter-05b7@gregkh>
 <20250318072414.x5y4kbe2ahl24uzg@hippo>
 <2025031823-certainty-crewman-b90c@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031823-certainty-crewman-b90c@gregkh>
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: b5910275-10c1-4ba0-97cd-08dd662c0fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Q12p0PsKqkWQ1xUdpRN3e4fZXkooTJ3TzFmbryWWkVZNfE3Egg48VyFVWQO?=
 =?us-ascii?Q?zWjAR8IMb+LJjhMWVNp96gfpuMIr5FVuG0v00ArUCssxL7TBpIC4kLciu3FK?=
 =?us-ascii?Q?v/Vy3auxd57K85xtJrpLmpEKhJVaNYHkzxL6CYtM1QyzyWwhxQwajPSIl1tI?=
 =?us-ascii?Q?chn7xTO3XunKwryWYEgKGC+Dp5KrAp7ADDWvZVFUXOB9wXZEvKDKNtFkyOAx?=
 =?us-ascii?Q?15S6jGTSyTpOP3ggPapRY1fz0koI2V88DV0SDyADzrZPTMtlm9NyTd/6ZIWn?=
 =?us-ascii?Q?J/0TCMnclYqfQEHDdFGuLBFUQXqKey6MERofN/qS0vNsmMP6Mxq/Xn3dZ+FZ?=
 =?us-ascii?Q?zO/ho6+F+oBLTCBGrey4p1wejcYu/PoArQVwVqcjDhXGYpP8g6KmKnkXtpdM?=
 =?us-ascii?Q?wmJoHNNY0a0j+nYvvnN1/IfK+HMW8nn+9WCjYUQTwrdFB21F5FBecwG82OLO?=
 =?us-ascii?Q?00q4IJhwJyLeOoDdqG0H+sHydh6iL8QQcuKeFFCORfYFK8YxeyYFdxXRh7BM?=
 =?us-ascii?Q?glSfzn+mgieIh03CpbunfrtOtWJ+duHJMnMuUFE9n+vaukYedIa+IxRliizT?=
 =?us-ascii?Q?zTE50E4k031xBO8xfG2G+Ie+V0F+eTF6MMyse5Md2ekOswMEywqDHzOpYVce?=
 =?us-ascii?Q?STiR8LtJPx0rC2l5VvADG2dblYj84SHwq4EgZG5uwzSa706iRXtxy3QV8gl7?=
 =?us-ascii?Q?u8eHSieDMn/r37myvivu1s9Jul30abejE8BmXVN6kg4zFAUl9cQQtecSgUZ6?=
 =?us-ascii?Q?UtRbDxXWY63kBwRX5aIi1cZMpFPNuURAEAe7TRo1Ai4rrn+LdN065DAyvUSn?=
 =?us-ascii?Q?nB2kqfaHa6Kg5LLT7K5rxAFPkQ+sfJ33CC6quZNnprK2XQox3ZN/OpCEjkwe?=
 =?us-ascii?Q?PKGzsCajA0NyDd6kER5ShAugfxF1q87MDtVGJtXKzVJtJjGCeqj1sssuLJOS?=
 =?us-ascii?Q?i/KxV0ZwkwSg2FvKyR6+uWUgfNBcz9PO3nTBbXHWWyjtkLEtk5GTac/hk1yz?=
 =?us-ascii?Q?SWOI+09wXZ9cZHxdzoC8q7oMqLWaWVkpDy482J36fcNA6HJOb96BkxE2Q9Ei?=
 =?us-ascii?Q?ZAn/Atedr26Bs3AMeH3lEQ9kZOM+rqFD4/PseUu8DQwKrOhudcr8hd2IYbqB?=
 =?us-ascii?Q?rlnvtRr2NI4etqGuQYcvc7qMLAi93QYtYqh+aBstOxzTd8x5k+1dBsvBWPPX?=
 =?us-ascii?Q?EGt+7YWFTGSZsU6UDHKWz0saGcqfVV/++uMqGgGG85T76sjuXPUHbzHO9duu?=
 =?us-ascii?Q?RiHqE5hfHFJWCCeahSbaC4xyN9WHQlNb+qRrcryhGX3I4YojWXsq5An6WJgY?=
 =?us-ascii?Q?kYqZMkbzbN30l7j1D5dyeIHOjoXpfjDdML5rpgq0laT57NX+if7brEWAPCSZ?=
 =?us-ascii?Q?+0ch6TGm2WOISocZ8fOJUh8g/MAnkODDOW+w9Qm8cxL68yU3TeaQmvnb+gPi?=
 =?us-ascii?Q?8uNIlnP5MwKwfmVWYXzjCGmgiU5cSmjK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n4KvBZDU4b/l0Unq75LbpLLZMDRCpIzLjni8OEiBJFfLG0dCXf8Q2aSveTZh?=
 =?us-ascii?Q?DGQBOyADbJQi/jBg3d1hvloKZIwZkFIL/xRo92/4lqrGQo4BfS3w1D/1PHMu?=
 =?us-ascii?Q?eB9v+cWKk8dhPRJ/3qcXwhptvaLNjyZPQD/ZVN5mYZy/DjVhDMORpH6vG6Tm?=
 =?us-ascii?Q?O/XwAX2JLS/8V43ygZZg2VwoMAG5t/YRTDJ8csYnnjFRkrTve+Fr3DQKKplF?=
 =?us-ascii?Q?oakPtsjDaJ2BqHnv2WhH8+CHtkKlEMWF6WuxYUCR6bzJoZ7Ygd6kLnZE385E?=
 =?us-ascii?Q?gI5V1UVyjuLiVrK0qzwtWyGry8A04Z5okfWKk9EUYP7So2hVC/erLVPvDwmC?=
 =?us-ascii?Q?Sgw4PQ36J+MLg9XPTpzqlJh+gxVK+8DWMsoBfMYxIrvdCCBRqhYTDcHeNi/Z?=
 =?us-ascii?Q?THPbogZT4m+ZspdExYMtzvOLI2NsEYQsdmvUg+xXsRsfBQYsSrA49hTxCE/z?=
 =?us-ascii?Q?IR6f4L3fC6/PDVpfjHXeyJxNo5/zUkRJboMRStYngZUAgcvQPb6+wxCAxTpK?=
 =?us-ascii?Q?r4UJgBgfoagZmcWjEhMiyILNlUnLrnIvFYSr5d4EfEcR18YdQYF0RE3gPtdB?=
 =?us-ascii?Q?sGo6W50H3bdCbUMIIwkHiNs1zZ9SJFuowqDJwtnTu/AvENSWqE2ADgS/k+xl?=
 =?us-ascii?Q?O0fAuee8//pxXMfRLGBJWSJj7b/tuTnzpnXi8//gMLRep48AK9UAtwhyeCFN?=
 =?us-ascii?Q?wUiz66l4qLu2XF8UKQAhJy/I0W5JuC4KfxWHnOoxUqrYlARdZyZbp41KyZNQ?=
 =?us-ascii?Q?6DaNpXllbToyCETY/tLf5B644FUEtIT0YRQoGFlrCZbdmSblOgYKIuBw4zL3?=
 =?us-ascii?Q?Qoup2GJM9LzwFvggwBtVDM5jxG5Gin0JfiDmYDV+JjK73Ol1jC2sNF7/paqv?=
 =?us-ascii?Q?XfciLAK4k0HiuMGJ4aX8MEAjidfHlCygyrg4De96h9QmOSpKIP10ResRhzoH?=
 =?us-ascii?Q?VZoTRGiiKzsaab7/uS1D34RPdfMryZ0dbjhnJUCNJsXKz0Xz7/vT0lsYHwU1?=
 =?us-ascii?Q?ThyJ7IaE59KX4n71gjUnvX8qbJ2++zzEVcclTJVDEhTRhJKe9msN5PuVcAlr?=
 =?us-ascii?Q?9EDYqMBzZ3ZiOBfQIp7qTXu8OxFuGoq0D4Z6qqKVgtDkbFlCqAXUctofqrke?=
 =?us-ascii?Q?HbF2IiRFV5Xk4z9jILr8APz6KppBKXJejzLHNwZrF7Liy2v2l2PMUgUGz5OU?=
 =?us-ascii?Q?8WSaWo4T/ybtHlFLTH3yVtzZispqsXRr3gNmGYyuDtZtF8sV8RbUXrcu8BEz?=
 =?us-ascii?Q?D7MhgYzkT+Xd/xSzvFCjJ1Awn0FkGJP2yibdwD7G6wuNNPC2CH00k0nvNPAq?=
 =?us-ascii?Q?EkP3ju53KDkvXtHHV/RNw2Gnv1qAx1IV0lh4d3aUaLJmgInonLTRfwWmmZcW?=
 =?us-ascii?Q?ZeICXloff2gqrIuwonhcp8i6lfJWPZitjuWhBGj4ofSe+tfsxRaZxm5HKJ2s?=
 =?us-ascii?Q?bOCfk+t+c/xOUTKSRL+KggT020PNzAeFblcIH2SKTdQVPTAFpRHt+31b258F?=
 =?us-ascii?Q?VOdjFAZVYwx1AMjaABPuXmJy40xQkEkcoPzMsP9535EvCCcVKCjuRPxD6T6F?=
 =?us-ascii?Q?qnvqdYE3A7WEuRO7hI65kUfjsVNfCDCgnnEhLb12?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5910275-10c1-4ba0-97cd-08dd662c0fdd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 14:49:19.0521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYUvDubbAH4H2GsWX6RngkGDlKO2ss5XBI+InONGB84v/TwxuUwJneACz0ycTyiFjjNQlD2/tovNcdtKNFIDFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7788

On Tue, Mar 18, 2025 at 02:12:46PM +0100, Greg KH wrote:
> On Tue, Mar 18, 2025 at 03:24:14PM +0800, Xu Yang wrote:
> > Hi Greg,
> > 
> > On Fri, Mar 14, 2025 at 01:37:19PM +0100, Greg KH wrote:
> > > On Fri, Mar 14, 2025 at 05:21:37PM +0800, Xu Yang wrote:
> > > > Hi Greg,
> > > > 
> > > > On Fri, Mar 14, 2025 at 09:18:51AM +0100, Greg KH wrote:
> > > > > On Wed, Mar 12, 2025 at 04:26:54PM +0800, Xu Yang wrote:
> > > > > > The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
> > > > > > series primarily introducing USB 2.0 support. In the i.MX95 architecture,
> > > > > > the USB wake-up handling mechanism is integrated within the HSIO block
> > > > > > control module, utilizing a dedicated wake-up interrupt. Therefore, we
> > > > > > also implemented corresponding wake-up logic code to properly manage this
> > > > > > functionality.
> > > > > > 
> > > > > > For detailed changes can refer to patch commit log.
> > > > > 
> > > > > Does not apply to my tree :(
> > > > 
> > > > It'd due to below dts patch #2,3 not in usb tree. However, linux-next already
> > > > have them. I see Shawn just send pull request for 6.15. To make it easy,
> > > > let me ping you when usb tree have them, is it ok?
> > > > 
> > > > https://lore.kernel.org/linux-usb/20241204050907.1081781-1-xu.yang_2@nxp.com/#t
> > > 
> > > That will not be until after 6.15-rc1 is out.
> > 
> > In this series, patch #1-4 should go to usb tree and path #5,6 should go to Shawn
> > tree. You can't apply patch #5,6, right? However, you can ignore patch #5,6 and
> > pick up patch #1-4, am my understanding right? Shawn will pick patch #5,6 to his
> > tree.
> 
> Ok, can you resend just what you want me to take so I can suck in the
> whole patch series at once and don't have to do it "by hand"?

Okay. 

Thanks,
Xu Yang

