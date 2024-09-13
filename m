Return-Path: <linux-usb+bounces-15069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815BC9776A9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF35CB23C20
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 01:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EBC2C80;
	Fri, 13 Sep 2024 01:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HBejtfDh"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F972B9B0
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 01:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726192631; cv=fail; b=gAaf2jrKQMz7z6N3nvHzNJPbojASlRCAeODsBkuBLohXr2yL/poDZWObeOCvNDPeYCv+O/kwv5jQUd2SAE2ToOT6MEQkiH56iKl/4Lw7ellx5DXSQwZCH8Ffo9hfd8PQFwztXHRecLDn8RYUzGOyn4TdrdV90VoKlsvH4LZQPZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726192631; c=relaxed/simple;
	bh=Zp51QbZY4zoxnCbiO48GTwBekkJhsmqdASNCFSW1y7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c6GnRcj8vQj2SaN9k1YhMhVQF6bO+nuGs4o7drZAku43iX+wmgwbSS/2VoSdWO1gJcMpbG62EkKvD0qog8c6qhdTgUS/XuTPKcVK4bY7MTJR+i4T001I71mdsW+p3/x/EZE+mqMKtfnJJIGE9aJPLpTNlunrCCPtDGi40CG6v98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HBejtfDh; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbJjp8kCjtfdgSF3/kN/WMKVC9AKuZ0glxHIjPCo2YO9F/zJWhg6/YRpHkkmmIWfYFGsCVFgFzgMbSeoFcmSUg4Omrw1tG7Ktl+lox7Bs0LsLoEHHUraLmhnOVV7/u2k/B0SQM1dsEd5K8n4H6WJVmd30X7+uYDLvpUzMEsEVt38qNmHqH/BRlx06hvyoiU2w3nazvWGGaTnm1hfaxrOEglH9p2wwFKXPnJCIdB/Jqpx/7TFZeF5fEnSHoll/BMFAANNIHXIhvNXzuXYHe1Zh4bIbW68sIqno999EwfUz73HA5+Rm66k6jFE7+/eCicZDC5SQPdbIPfIdXS/TML/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaF5U6NtuWC1L23S6zd/GxXe3HdXy02+3M8FuI3pXIE=;
 b=yMsnEleoZA4UmT15MH2W7ZTQna2pmllS5KrmQvLrbkjlgHHzarr6gjN0gsbE/GqrB9IC1oUyIAsolQa8meT+xXHcdkpm8xre0CWELRSB8m6YC3oIT+W2DN2a8vAlDvMgEPyEMzQOy7otljqAYEOT9wd/pI8M+O7fKA32HQoysFBNmKj1VCO1ZVuiG7xza9QSxZJqGFqBEAmy8S6MpF2/43SXT8rD46eKrBHVZmh75DEYRwZsTKNxoFv+J1ZAj0O1hvfD53fGcMqDZaTnLZyAdDviqng0GXY1n7GFP6E247IccJWl7225nr/cuBuucnps7EU5Wgm8zQ6/RxPGCHj6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaF5U6NtuWC1L23S6zd/GxXe3HdXy02+3M8FuI3pXIE=;
 b=HBejtfDhsSuKB1YC/Wm5VNFXgGYQ2UxImfcmzVZSUCWkJ5RhzyuPKFJYVE6//K/rpZ5yixr4NTYnl5Z78hROA8JfB+uoO3to7rFJiBuR1dHrsGYRLAo8hcb24P5xZsGPJZnRVf7wqLDH4cpBT4mlFjHY1MjJ8h4d18fe/UGEXnuZqFZ3AgyVzG5h8P1BLjSm8EDIFqBRRUeRV5VtJEItNg/WLS8hrnlw1CUGUJKllJ5Ni4mivfc68j47OVLORYKixtlL/PnBSewsPvX62srgUDIpmqWaKFj1xNkmrRi7QrXxiiUZUK47NnYLm+RiKWvAMdNVM+3cAud/A2xa4q6Isw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9154.eurprd04.prod.outlook.com (2603:10a6:102:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Fri, 13 Sep
 2024 01:57:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 01:57:04 +0000
Date: Fri, 13 Sep 2024 09:55:41 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] usb: chipidea: udc: make isoc endpoint a bit error
 tolerant
Message-ID: <20240913015524.gun6xzctb245gidj@hippo>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <20240912033551.910337-3-xu.yang_2@nxp.com>
 <ZuJ4kr+Bc+LBlF1J@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuJ4kr+Bc+LBlF1J@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3f4ad8-6c80-4a73-6556-08dcd3975dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fG7h7yT9YnA02fuu+uLmLDxET5QVgtMXDqMsjLRgKwSFyTERdZil4cJzkkFS?=
 =?us-ascii?Q?FrQ/PFy5yCJsU5tXG7ZtPwLj5GZCdGMjWApQEosYWUA5iLTn/jyAa5rbM9br?=
 =?us-ascii?Q?oNLWiOJmQ9CjwyCy/UiD+ZWPbsUxTQGvFNDhJdTTir9j7QBrgD2Lil0fCaZ4?=
 =?us-ascii?Q?1/TtxYUN8+Tg//spaF/AWsCzGVWvq0evbN1MGg7dXVBd7R7/p/lDsNGMoort?=
 =?us-ascii?Q?Ddzu2R8jo/9nmZfXF5E7tt/t201ZJFwClx/X0nqloRl176LaAE0F5fAaNff+?=
 =?us-ascii?Q?p5BWsljaO6XtFiG203WMsZNXcw/Bn1pO40V0zPt0/vzOIHuZXo0oQz0E5Tsh?=
 =?us-ascii?Q?Q7XDVE9436R56LxXy89Dbjlg8EeD0ty28omr+mTU8Za/FbdHSu6XiACS/E5c?=
 =?us-ascii?Q?AKyDOJdENL5ibMD8ufu2XAMPmvAJC4MT7LDswp/PakQX42v8ZQOCfdCe1A49?=
 =?us-ascii?Q?pXxg2eC7NdRDl+kSUrT9ly330sIkyojzg3Ogyh3Jo1ly1Nfhzhpa9MSWBRu5?=
 =?us-ascii?Q?4tGOvCBLAcDVDVafiwlG0caCLG/A95VISvShecse5f1ukH7nOY5Vez0Lzex3?=
 =?us-ascii?Q?+uNHarVh7jfyWq5bY8ZvV1aDNcoTKuRqHWrcxU/NmTtveYRuHXJjkOoR2c9G?=
 =?us-ascii?Q?/4pvVTK2BAFBSRRE/nt5BM6bVs7twn7IH2j9wSfRruTe7/WA7BgYTKX0nnc+?=
 =?us-ascii?Q?vNT4j5Z6i4jQ/3bsvmNyCAWULaHOOdRwuMm56sOdq+Tyk+7XffsKTDOVsD2z?=
 =?us-ascii?Q?rzP0l+Sj5R7yjVTci77uT2DmPijO1Q640gBLbC/3FWFTMgAR0CDROHk9aJZ1?=
 =?us-ascii?Q?yOxkRXxtR7DbUtBjRrUeP7vAvzz1C6ll1Czv3nGIaMRStHVSds1h1O+TxvCH?=
 =?us-ascii?Q?ppUsHKCyWRuE1Y86d17+yF+eZtkHbR8R98clYD84BNiV81L3yD5+biugLIJ2?=
 =?us-ascii?Q?YJr+6V/zo0DyoUw5pd3Daj9h9d/kk6SqZrs5Qj77FuNvP/MQyO9ltlaaS7YO?=
 =?us-ascii?Q?jQzcmf2IoTD/stHV+n49JKZHjPyQeXF1OSqlQx6sfZWwSgGB30dIgswWTV7k?=
 =?us-ascii?Q?bmxvs15OiFueVwVSR45BUIKDa5/51VcSQZudTpoTrUKBif4/uL+d0fig/X/1?=
 =?us-ascii?Q?v32Eu89dyDdV+lFxRqRDkR3naqb7OTahPNXQZn1AzTsbMzEUdF6bsGkTerbZ?=
 =?us-ascii?Q?JOTiUGT3tHVlSSrXc+1V3M9gabdqPSYi9N+1ww6tTKy5gil/EfBRK49s0ssV?=
 =?us-ascii?Q?itG9XQOk79Oit2CsxYlks2NGRt/LXTVA/bD5YxJxUmumEUh4qIUv81M1n608?=
 =?us-ascii?Q?nwx+v/FJAGVkjgO5+MSWI7+aW4PKO3RpX7zjRB8Gd2+Ni/DO78QyMxaiw1Nv?=
 =?us-ascii?Q?Y8YTX1o7nlQUQVZzujYcfJUMLI4AgWcPeaU83tnNZz7S//6W+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NUkKg0A3GMCaLmGhxAmxskJp+oglucW0YQxGoJj/eAbD/CPoy1x7ZOCRzMhl?=
 =?us-ascii?Q?YmYaykldJFZFBVKjSYUTdCliW2YhJzo8I//uSJ2F2FEYvFlirWYKo8AXFavZ?=
 =?us-ascii?Q?KLYs5kC9XRarFZdvzet8Rl2jvWTjc9fkRocMMt5FaTSKYxUjN6DwI13YZfq1?=
 =?us-ascii?Q?ieRb8sU1DlX+c6PPLr+KXgfhdHJr3OV6Jd/8Kgn6mB0knFsPVA4uA+WQbFNy?=
 =?us-ascii?Q?Mnn+kaKymfkxqh6kDyl8qgcle6rW12bxcccF6e+199LPF7UcJN5DGodMnzwS?=
 =?us-ascii?Q?u5Jv/e9dZjKLp3y5fP8YYMYVVvcfeRIzN5sp9KKlh+/wFGhF2kP3WCfQf7DZ?=
 =?us-ascii?Q?YC1bKJf1GT8bC5NP47aRAFnbg78Rp4HwiHDcLMpakzZ4AQpiD00iHnPayoSx?=
 =?us-ascii?Q?5CnFFDspLfJzg+yp4Hxqk3AyuYadTvrrJWn2hVx/hI+wOiUU4O1qFdN7omXX?=
 =?us-ascii?Q?/zNcZ4lw1+/VMXoaU1ek+6hbRlRXltA0YB7eudnj6P7Znh7Dm7eNRhRz8ZdO?=
 =?us-ascii?Q?V+XtqhYV/xQz860X6q4pH/SwQ9cMk6K+3PezuJyNpUBbe08vdzqouraBS1he?=
 =?us-ascii?Q?N6LM4PXMQ/hx6d7B7+n25/H9eMkxVkHMZv3QbFAz7NATrSBoJXriheVhtwcK?=
 =?us-ascii?Q?LTfn2EVSFPQ19vSiWPtUWo/t4gNcuYqNSuefGW5+eIsFEZonZbnhBEln2jvz?=
 =?us-ascii?Q?Z7KEJP3BwXCtVJXTRNc+O+i6iRv1tv5lxFdJimYF5xi8fulDtOiUe5B4AWdZ?=
 =?us-ascii?Q?615NJRXkMFN1ftRTwJ4Jh5EO0PxCHV3cpkIhhfptBO1iPEHucA4JFCAtUKPC?=
 =?us-ascii?Q?2R3664BlRHbjyeWHtUOPHbvMXtUx4A/VD1Dt3Zb9J+BVu4f6w75Qs1jggGq0?=
 =?us-ascii?Q?42EnjBXoj4jnpbDz3wb3LgXjaK2WX9I28CIm7Y+99dJvRt5VeKenBLs8X9DT?=
 =?us-ascii?Q?lC9m/4L7LbB9itU4WutY/6D/Xr2Kqmk08ZZhFu2n+ac3m5W9I91DiRRXTmSS?=
 =?us-ascii?Q?65F4BIA5IV6tbRknHdvx+Lg8HClIMXhXcFn800gfC4NjGDHGQnwaJ7gp53h2?=
 =?us-ascii?Q?Jh0pTVzi2qxjmWDrXicUMUYvvish0IdcJL70JiS2tkxlEbj3T6QjlBileNp2?=
 =?us-ascii?Q?bLXywva0T5G7ezBueJD+/lpGpSPB96+L0BF2HdGDxoK2EAsVnZvZGn427oUN?=
 =?us-ascii?Q?l9PxBEvph7Sw4oNNHGq5fJ9rySrpO2Golk99JoQ4Q1EVQwUOcLVU+p3NYXEM?=
 =?us-ascii?Q?6PgjC78TZKxyq6Cz1CD2oYhrtlhUKoPiJ0y0VNIkpgDHa34iYXg24OejG73f?=
 =?us-ascii?Q?9PMspyNjxijM+WHOVrjNNfvSWYWQGAHB4zs4rNFhWiSKQ/j4pv6kAEqx4T3w?=
 =?us-ascii?Q?rq6d3Tji1E9sLMLR2kiR0VNLEbOS2IouTJC0Z8Cc0mdv4V7bq+qepq5Ovgz9?=
 =?us-ascii?Q?ho+BQUjgyHN1wXo/zZ9upqTXAb+wFVFxFFFPYJc6Q55AaxExqT26AhViN7El?=
 =?us-ascii?Q?k8v5aWWZdvQFuSIOb9s5ToQlysHsvEne5r4mUfCmrxEmy4DY1chsABGi+PR3?=
 =?us-ascii?Q?UBdHEugRWeZfccOUhgJnUVW3xcLSC9uSP3AwySKL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3f4ad8-6c80-4a73-6556-08dcd3975dba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 01:57:04.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdsuUXApzfd6gjimmMivSkizs+4z3WnAUyJT8+WXxJSTcEepg7+8oCGum2aYc0Cz3JqDgZJytcNq6o9AKFGszw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9154

On Thu, Sep 12, 2024 at 01:13:54AM -0400, Frank Li wrote:
> On Thu, Sep 12, 2024 at 11:35:51AM +0800, Xu Yang wrote:
> 
> usb: chipidea: udc: improve error recovery for ISO transfer

Okay.

> 
> > When a endpoint met errors, the usb controller will firstly assert
> > related error bit in status filed of dTD, then ENDPTCOMPLETE will be
> > asserted. Finally, USBSTS.UEI will be set.
> 
> Look like this information is not related with this patch.

I'll remove it.

> 
> >
> > Due to isoc transfers are error-tolerant transfers, we can make isoc
> > endpoint a bit error tolerant on device mode too. In case of error,
> > it's possilbe to resume the endpoint by reprime the corresponding
> > endpoint.
> 
> Impove device mode ISO transfer error tolerant by reprime the corresponding
> endpont.

Okay.

> 
> >
> > When error occurs, this will allow error dTD be deleted from dQH and
> > giveback request to user. Then, a reprime/prime operation is executed
> > depends on whether dQH is empty or not. If dQH is not empty, reprime
> > will be done during dequeue process. If dQH is empty, prime will be
> > done when new dTD is linked. In this way, isoc transfer can be recovered
> > from a small number of errors.
> 
> The recovery steps when error occurs:
> - Delete the error dTD from dQH and giveback request to user.
> - Do reprime if dQH is not empty.
> - Do prime when new dTD is queued if dQH is empty

Okay.

Thanks,
Xu Yang

> 
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 0ab57b87b07b..b1a1be6439b6 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -683,6 +683,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  	unsigned remaining_length;
> >  	unsigned actual = hwreq->req.length;
> >  	struct ci_hdrc *ci = hwep->ci;
> > +	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
> >
> >  	if (hwreq->req.status != -EALREADY)
> >  		return -EINVAL;
> > @@ -696,7 +697,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  			int n = hw_ep_bit(hwep->num, hwep->dir);
> >
> >  			if (ci->rev == CI_REVISION_24 ||
> > -			    ci->rev == CI_REVISION_22)
> > +			    ci->rev == CI_REVISION_22 || is_isoc)
> >  				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
> >  					reprime_dtd(ci, hwep, node);
> >  			hwreq->req.status = -EALREADY;
> > @@ -707,7 +708,6 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  		remaining_length >>= __ffs(TD_TOTAL_BYTES);
> >  		actual -= remaining_length;
> >
> > -		hwreq->req.status = tmptoken & TD_STATUS;
> >  		if ((TD_STATUS_HALTED & hwreq->req.status)) {
> >  			hwreq->req.status = -EPIPE;
> >  			break;
> > @@ -715,11 +715,13 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >  			hwreq->req.status = -EPROTO;
> >  			break;
> >  		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
> > -			hwreq->req.status = -EILSEQ;
> > -			break;
> > +			if (!is_isoc) {
> > +				hwreq->req.status = -EILSEQ;
> > +				break;
> > +			}
> >  		}
> >
> > -		if (remaining_length) {
> > +		if (remaining_length && !is_isoc) {
> >  			if (hwep->dir == TX) {
> >  				hwreq->req.status = -EPROTO;
> >  				break;
> > --
> > 2.34.1
> >

