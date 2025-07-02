Return-Path: <linux-usb+bounces-25403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD70AF132E
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 13:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AC7189795A
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 11:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF4C2673BF;
	Wed,  2 Jul 2025 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YEUSeYi1"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B5265CDC
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454219; cv=fail; b=mTfNCa5XEgaoU7bAK6Opphsc11JintZ4iRcu2ZKEQ05uVF8Wef3sNHZVQraNnd6vbYlFSafMf6C1Qq+4eWqTORQcnjvQqLW+MNUInZgVyegIfixCFBybfRbgvmtwlnBMWTR+M5A+PRwosljZg+gQELI6UHPuUQIOw/JclPg6H2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454219; c=relaxed/simple;
	bh=6IepLg29oCjgN0aRjiBad3/YSzp3tuwdlM7zS5iDmUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pwMUP8mafn/cM7xL2VjQ5PTuUU14UTdLuTeus0Q5RdBdtjVf+EGkGzDlSu/JClZ3vlXozYUB+wNLrcK9fVOhZAhavxmb+zPQzaFbZpAt2StnrVfJ6M4ZxJIZN47fiqL8iAOWg1fUX0/mp6hfCCU7/uKoFWEI1nWLyvBaa7Qidtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YEUSeYi1; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNC/vZCaI1ZTQUDgGH2iGjwoI/EHfKG2ODzWXO/PCsObqB3x96LhfYAQlTdGIi+viOcthSBrhPJyxjFFj2xELNOn1tnhN5hnOX6PL+N3Bxff3LRTwHXqMhGQrsBnzBsi/U0+SoCqPYfoU1TkWjmDBYywQFtAoqwIVV1BhFlH0dheecT3kU1Pr3dswALmuujwvRfvDL0WGGkSpgKOa/l4ntfJtdUs2HXChjTYPSVHRyIqxuDrnky0NgmzWOM2IZjh4VvdVIihI/mxsIAVaFZ+yUu3pPnc1qKMUQpVkMGr13TVhxWoyc83J02DdbKjdRcQ7t6hu6SLoGYJGcdr/FNlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7OKwNmj+WgKHALyacIN9my1xQIvJ8SuiEgzkXLWN5Y=;
 b=MQYToWcogTXgah7LgH7PWWlk2W+NFViSy7Ncm6mam2t5KHnslqKUWivgpVqshU3Wv2MDZOXhrRMxoOWioZAUFEyjo+ApxoOa8HsW3y8XDSY9dim+yJ0yBAbAgeHm2pIgYbX/9QADItjUyqEhQkRbi2vcVl/kbznXoTdPpeb5DQDBaq/35a81iD05El2SdqXhJ/ZjIzNK/aGqGyepnJylpXifCnGqOGhJ81L2p3o2girp4jhGlzj5VvtCJt2XwtBY3b88BCFGSBAssH1H2uIixu4ljbx9FuS65AkcMIYPckBbH9S6UmkYH4KOIBt0zvuQBKFpU2Jcf6eGCsdYKadGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7OKwNmj+WgKHALyacIN9my1xQIvJ8SuiEgzkXLWN5Y=;
 b=YEUSeYi1kfodWpnlVSMhFr7sJnz743fitjz62qinOn9re1Hm4o9dn4HWoy1xBd5ex1CHS4Jf2hM9HDLDcGsVNQVspZ6cOw4XlmcbiNvFDOr3Fzq2uKjvQYdxIHJBvLw+sgLr993SGiEph1BSYPMbGeZapSubPw5EEKx3NPN2VZXlqTb6G2dqH4uwZtKsG8VTmbeqoyArlf1mNXMvcaaERy3VewK9uM7nGbdCndPaEyIrlW0rC+745WWYuZqs3MPP4FEOobSzTuGmA2DnKPS8W3RLn2jMpwtpIF/NduBw+sWSxodpn2weXfVsi9Y0SIV4FthqV2ng3DXNk5pgVdfMJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Wed, 2 Jul
 2025 11:03:33 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 11:03:33 +0000
Date: Wed, 2 Jul 2025 18:58:44 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <c4k3zlstmp2rdampnzx4idzquok6suxx64myhdn2hrosfsb6jx@5bdkrmhmgejq>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
 <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
 <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
 <fornnnolaxn5zbw2dnepq2higyf5vw4dkdn4uptgz6tuki4zoe@wnclvwajtila>
 <adfbd9c0-4bf5-4dab-974e-4afa61d8492a@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfbd9c0-4bf5-4dab-974e-4afa61d8492a@rowland.harvard.edu>
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d76002-6c66-4c6d-7574-08ddb958161c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v5S2uyvlEVZmiKSPUNQGE9Tw8QX6+Qz83xhuXJEX4t246NVkLglgc+A0Omtc?=
 =?us-ascii?Q?eEvUHDOoUNoU34NYnuCCJCTFw2a6Hrjxje0jrtBwaYSYemuMUlIyr52WQLuQ?=
 =?us-ascii?Q?VOUTPht36eQJmMqscyonfDcAvlEXpCtUiqHKS8WHlzt0A6Ms821r9NjDvEF1?=
 =?us-ascii?Q?lFPNT1ZFYxleaoVGc3IYdPoxY4irwZ1hEXeFAVRn0n+4CpxUfVkkaGbqc3Mu?=
 =?us-ascii?Q?Oo0NjkQndQqfbCV4iMahQx4pkLyqZORskcIjm5N9+sBpqzyHioK4TEtJHtTC?=
 =?us-ascii?Q?1FeoDAaL/qc8RQG5rYlR1ioiRjrOsOiGzw9CJRfq4EVrsZoWmQ7vuVahoQLB?=
 =?us-ascii?Q?XqEZ4TUpv52vY3a6/ieQx5aOFPT6ySj0DBbfImycYHZKxRvXSy/c6lkDFT4Z?=
 =?us-ascii?Q?u3rDDb5gzNTCO12yrFteHAg6DiI7ap/8qki78wXQflP2muRP/3mf3j/uupBc?=
 =?us-ascii?Q?5YGjlk1fT2FGVcVxMg/OThXJ8c/sYfiR/cCRRZKbr0pulwjdEzEA3zhhPpO+?=
 =?us-ascii?Q?6SZOIVb3kjjE7eSYLIhoTmBn1gt4wO38C2Ck0W4SWfv5KpH4DmwMdRyc7dcI?=
 =?us-ascii?Q?cpJKDy4fetkucqq9CCT0WqGbzWRbTmRqgZG0DyIUsslX4UhUmM2giooYWkn1?=
 =?us-ascii?Q?/x/N6ByppsCThL9bRiuPn3qAqKU7OyUUdEq3TK7WV+q0QVmZ0/SCJdfpGyQS?=
 =?us-ascii?Q?PHuCvoMH5PfdKgro4XX/dwRSnr9+b8J+zrQW/d+17giEBlLdvAsEwdENeFns?=
 =?us-ascii?Q?+lIQTOGYYw6ucvEgRdsvQaLir4tAZc4ifm/Mj5HpBsyoPWcQnRudX4kWI3FI?=
 =?us-ascii?Q?yoVv6BaWAhdeMjZQ7ljo0Cq0dAe5HtTon32IUFknOe4duXBbGE0tojre4LpN?=
 =?us-ascii?Q?Grm5+Xz/E4e9jySIgZQE4t5cepgUJvkMzYqf4yYAD+zsrLA5XFpL0i9wOFAw?=
 =?us-ascii?Q?+1A2cvqmBUeHkXppsdXjnu1jXza8ynRuR2ndzzT855SQ3YFA1CNBovgIDmIA?=
 =?us-ascii?Q?gG5llqXsqrvEhJDd9Jwyx4zXOOgRvfENuSsuV7gxJK8BnK1ZnrS/Bvz0Kd8G?=
 =?us-ascii?Q?DCIRalpVbzCowaphcyQGw8DQygZo9ySqf58QYw14g/1GJzrGm4maUEgyZxLV?=
 =?us-ascii?Q?iIBwt2nGBkmT97wAQca9rBk5VlOiucQLWX2PGzF9pP0SiZ+8mlGAisycFYET?=
 =?us-ascii?Q?fs4ZFVR534OITUXyrC+6NwUYgDqkJOy7WRSQUJuhUn+u3Fbypmj9cZ2RRuSe?=
 =?us-ascii?Q?na1pw5DXbYQZPeOW0dzw35+fxFmOYEKN5mkO5YLwJn7X56qpm+Tz9NDkust8?=
 =?us-ascii?Q?0lC+hP23RYknK7nkUkSbDBmpowWX3Mxb0h48U6Ndf4/PBeb5PyBS2trwVRNQ?=
 =?us-ascii?Q?gdbpuUZ21R09cq3bE64U74SpC2Mu6fUp2oGAytUwcFVuAxSNwoU/cG5R/Lfu?=
 =?us-ascii?Q?DEiasgpVaazBBIsdce83jcEafAdU+54zFMEKy4zwUmdNeDoDfrAwrujkgiM4?=
 =?us-ascii?Q?kMZUC1ZmKBas7o0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ILniT0CsM0g92w7MK09y6OGN4cbGMU9t5K8UKWjRSaDg/EuwxxIFMOKEqW74?=
 =?us-ascii?Q?7HCLNBMGUvsaEs7R60cZfFg4Qxby84kDwHhXR1x+Z/wu6yoLRClzQI4nbg7f?=
 =?us-ascii?Q?tnNO9Hn8ZVGYcN2P782h/oKn5TBPjkLJIeqjdht1WPThSoxuOrBwEY+OLyfb?=
 =?us-ascii?Q?uS3ZiOmBBDvNgMW5mBhiTAG8CyfXiTViP3DocjsgQfc3gaxGtIshVZV92iB+?=
 =?us-ascii?Q?9Ws36UOu8fIeVEpfBOkti9kpvo42ZDZaAbFsYFjdgMCmybfTHbu22scznEYY?=
 =?us-ascii?Q?ZZ3CQ15q3h7akmPQzpq2iAMuhUIy8fXguZ0SdyJnrbDAxmYmXygU3ibwOXky?=
 =?us-ascii?Q?twTUb2Em+b5zf7LlgtChWThuGEpIH1Ymfnbtqj19QrH4r8qWMwmn5dxcbYcV?=
 =?us-ascii?Q?mUEfGLcF/bpeJuWQpgm5O5yOBPthSHW1Tc5G5wKSl+EbMgGwd4zz1+YPKSzC?=
 =?us-ascii?Q?31y76W4XwhxRJ56A4UvOWf5FHaNSRyqTuG3UIEOHzvmv+GJqM+WIRs2S224y?=
 =?us-ascii?Q?U4RPQkcsLx0c6+PeGtLZWukeSIH2kdLTbwy0baJ5pi8XJVTHRmEOkKquz6AM?=
 =?us-ascii?Q?8dDwnB29GWNrRxQiPcQZt6zlOaeMmY1lTdNhwAphuFzU7PtFT6iOPeB3crxh?=
 =?us-ascii?Q?tv4XUeCZB0IfYWZpCi0+Yy7Ed3XkV7aBNEXpBGLFxnOiYrDLhgu/ric3oDw3?=
 =?us-ascii?Q?MEvMHrsVnOp0ZodXzgcyHSqcppN+7PpV0md0Jrdmdv4y87WW9ha6/Z8vN6Ao?=
 =?us-ascii?Q?vzS9+CpnuDD4/ZHeTupgk0S2aIZMUhLKXrroG42UnPtI8QLe2qtvjmbr4HoX?=
 =?us-ascii?Q?PxLPh0vp16OWu35AyooIsUn4EPj9iz9YrZC57y0FcNIs/e1l6aTZ6pGDz4ZV?=
 =?us-ascii?Q?lJ3TSUgg7ECSNVzksx5HTZsj+3FXpjBhL5g1j9RjRcSnwb1uZRU10j0/HPPu?=
 =?us-ascii?Q?7YLeeJqPly5az2+0F1hlEm5HZt3uKRAhlAKntpvi0YoaX2jKM02jjIBgCsRO?=
 =?us-ascii?Q?v5H155G5iReAaSNEiTakQd3nOYM/NHGOGFSenJuQ10ZNmQb3OLi43fyvjx1h?=
 =?us-ascii?Q?1y44KFkSe46B8KLRfIEISW3V5nmxlyUGYARAularPY3NphXpq42/pUFNBjgR?=
 =?us-ascii?Q?FFemELZ7a8muT3wnfZnsNgWaUxcKDNkP+VDXFC9LGu5eAmYxDfn9BZujfXiC?=
 =?us-ascii?Q?lxtQ+eth6TjkPTLFDYg2oDhK65Z63oyND8U2rBWmUlngoi04LiVlQ1KY+d7a?=
 =?us-ascii?Q?TZIsjoZ3/wv4vrFC41gEqg9Q+gFmVk7kZbXgBpdSOvTzTGiPEvXU/J9Q+uqA?=
 =?us-ascii?Q?oB131uolePfllwHKy+geRDTZFtcjyNi6gXkmPzSsf4iZxkTS+K5I4zu7jBRL?=
 =?us-ascii?Q?phF3j5yN2yFQmrTSMCjE8g2bgEoiE11wXHUDw3ARMUOKCR6jn24WNk+AbYUu?=
 =?us-ascii?Q?OMoJo3zcSx8L8GbNXT4XTJGYy3e55WF4mwnQoJUe/pNesQbJQmAn7YYR/tJG?=
 =?us-ascii?Q?6Awi0iYeUJfUHaixbGwPmxAaHwg840/0L25k4rDcIJ287NdRhKfxVGTIKHTm?=
 =?us-ascii?Q?Tb570sdRNoRtTY01ZFXBsBKjrXLGqk04JCI2YTHA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d76002-6c66-4c6d-7574-08ddb958161c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:03:33.7054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhAtCv1vjhhxdQLKTstNpxJwZhv2gtsbIfSKqzugDI+FmDxcf4Kq2ZQELyoY0Qn+QWerpD4MSD39dxSuJQZJQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383

On Tue, Jul 01, 2025 at 10:51:21AM -0400, Alan Stern wrote:
> On Tue, Jul 01, 2025 at 06:16:23PM +0800, Xu Yang wrote:
> > On Mon, Jun 30, 2025 at 10:26:56AM -0400, Alan Stern wrote:
> > > So overall, I guess this change won't make any noticeable difference.  
> > > But theoretically, how would the user know that the usbmon output didn't 
> > > start at the beginning of the buffer?  I think you would need to update 
> > > the documentation as well as the code.
> > 
> > Does the user need know such information? As a user, I don't need it at all.
> > I just want to see the data transferred on the USB bus.
> 
> What you want is relatively unimportant, because this API is meant to be 
> available to _all_ Linux users.  If it is changed, it must be changed in 
> a way that is acceptable to all users.
> 
> And of course users need to know how the data is presented.  Otherwise 
> there's no way to understand it.
> 
> Currently, Documentation/usb/usbmon.rst says this:
> 
>   In the case of an Isochronous input (Zi)
>   completion where the received data is sparse in the buffer, the length of
>   the collected data can be greater than the Data Length value (because Data
>   Length counts only the bytes that were received whereas the Data words
>   contain the entire transfer buffer).
> 
> It doesn't say anything about the collected data beginning after the 
> start of the buffer.  Just the opposite, in fact: "... the Data words 
> contain the entire transfer buffer".
> 
> If somebody has been using usbmon for a long time, he won't expect its 
> behavior to change suddenly -- particularly if the documentation has not 
> updated.

Sure, understand.

Thanks,
Xu Yang

> 
> Alan Stern

