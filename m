Return-Path: <linux-usb+bounces-14472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CF968134
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 10:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7035B22E82
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 08:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F9E17D378;
	Mon,  2 Sep 2024 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YfMoe130"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D3155A47
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264035; cv=fail; b=JnDbsAeY25AWkzo90mJWQnXTHDC0haELdxQOS46dwiKocte6OxDUYGufjPbSEs/nhU8+KkkMmTcYItZAMwtmJi/kxUg+Yf1pyDRNoNIGt1fvWXQ7M/pdx60lXD+NLAEcHwNRMcDEKG9o/zYRSKShLlw6vNfNQpr+/6wAWqHjjDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264035; c=relaxed/simple;
	bh=3h9oiGQ8+RohAbrmKCCJooTrXv+epPbWVXitzllyvu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=srUBhyRJgN5oB39KAWx/ZjJ0EEISDw29xwuaWn3HwDh8m3XBWIR33wrW2HbwtJf1q2FmQYHseM4UKQ88s1t0ZvfrN0HsIbM4SKb7m8q00Rf3qKvavZfnbtb9SxXEFNQppjKns5/sYUAj8dOSjljhkUSLeHfhYce8K0AkrCIxpWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YfMoe130; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM7yZYqqp0bjk2RawVzDxJ3lrTyVi9SPJ+f6kvsCOwELGJfKgaxiGYxCASChFo8eRq3D88t+SXSVAz5lFSkBRVhrNzJWOT56eDGidUJ9gMO0KJI0Cl7twmu7zK2yfeLmhm044U6VxSdzFqpVE5Eo5yNvmLu5KvZ+bFphBKS5ucZ93CiUXrACfqc3hVxQEXz6x9bivAIuLBWH87Cw4wYAIi0TzZ4n+Mq7Wehdy/gAbXNYwhJm7MGn79QLsWWPlGSj3tklUZE6s/vLrD6WR9IiqTR6jnhqVHM79YD9Y0RBvVSig5uTRQDU1SIdPy3usIEvHEZhj42EI4CL1xKcIPKNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5XDXyLdyHHb9b8p+3CE+0GA3N1oaksMCrm/o/IXUw8=;
 b=WKc2oMNcuSisHCZM0ubYhfIHTFa9t1jJ1kwbxS1jX5Q0DSZI5oF0jxZt9LJKStPUn7GG4Ra/BvXpsAOtANasRwTLT1tSRndW8hQB3y2LHiMohwcPo0d5cEDrcQb63RDmXH1xaWg/ReXjAX74PfdTWvx+kQerg9lUCK00BQoDtVPbGQosBzc6R0MHNlRS7wdx9E82ENxNTkBX3V3wmUgqcHr/Hp8NWn9auzZzNjAySVOhToVmvn4no1e+NX+tii+z+guj1hnFzUpEkXHZL+BXcUU/YobdlNpqbzWyVQ4KwFg+qrcPOTi7zDxBNm1ycvQMOEryXo9Vo5+XPDOyHrAAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5XDXyLdyHHb9b8p+3CE+0GA3N1oaksMCrm/o/IXUw8=;
 b=YfMoe130unStr06+491uztmnv1nEXSdM/geeggT3bCgTtsDNMDbnyZ30xgcZXsulnNOITlk6AUfSQwIScPHc/XBd7ZhZ9GXMJbk8kRU0wjpZ7YKb4yQNdsfgXU2sT5Nks2RjiwAy0JJAy3tJMWUfDwWo4SLj1g0f/7HaYH6W1GTwoFZhAIz8+Nqu7feQosH0gPkQ32gq6J9TQ9cFifO/ufSWh6VEF7OPKSJqwAUMxDPdiMTndKXGfaV8geTmX+9qZQ0SndVDVA8nhdizdqJPOYUm6Jd7sse3ogLpXrwLIA5kPYYswK6VhKxLeG5wx+Tmf7weX7Jtl6REvx4D24bicQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 08:00:22 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 08:00:22 +0000
Date: Mon, 2 Sep 2024 15:59:12 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: peter.chen@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	balbi@ti.com, linux-usb@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: add USB PHY event
Message-ID: <20240902075600.mubftf5ryv3txdlz@hippo>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627110353.1879477-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA2PR04MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c8c2ce-7a6c-4c20-35ba-08dccb254b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2R+mx7RwVxyQv15oivAExKdbcjO5FaclQmkEiVyECYkEISg/n6hthkEfOceN?=
 =?us-ascii?Q?H6G9huyhT8cWF+kIArZbE8eKDu5s/bJkxutfd9kNfCGr2mwz8k7YljKtdgKm?=
 =?us-ascii?Q?OqLkz4kpEHhxNpdRYXHPc04YPhSA2tKapZA9bJyixSMlpqn+Lei5PzoG8CEr?=
 =?us-ascii?Q?JHjEa0T5sgQ0KtbCaWK3gp9H95O7pjMQAlrKf5IS7T3Thlym87dk1q9630vJ?=
 =?us-ascii?Q?LeK7D6AZi45iqmfPnv1oRTOr/eca7KP7oLHsWMRrClCV2d02USOoL6JXAuLS?=
 =?us-ascii?Q?8iQP2wbDgpRYhubAEiWLqJbG1dAKVh1BOMW2pzJR4RAI15TCq6oNHaN6kNy6?=
 =?us-ascii?Q?rfmrpsSjZLcPPsIpH7s21UCqlp7gQdi7o086C0nQdXbdTMUUS14c+3gMmlur?=
 =?us-ascii?Q?hLVsFMi4SiiU6iQjxlfhi0liASY2u1NWOK3HBaT4YRZe0Kw6pVPWLIKq6zJ6?=
 =?us-ascii?Q?QJ3FZ7pzm+853dOlGtw8fIJ+OXU56AhXnBtzvzMFJQVMGhV+lwrMoHueBXrh?=
 =?us-ascii?Q?l3M8IO5R7tNmJyOIPh7lZJCYZbUUkJF0FlcnUf4faWwxUBAAj4u70vD84qJO?=
 =?us-ascii?Q?ZjWLoJjnf/vqRmBPrYzJOue1E3ADuoK5jYgLKgMHZgZlqbL+cYjFyvLhE3rq?=
 =?us-ascii?Q?gm5ny6jqyr+tpbJFL8InEpm9pID7uwiXFgGYKqt1PaDg1OEJgQi4sPkTR/01?=
 =?us-ascii?Q?2q30ntr9dF/bw//UGtWqX0wbxOkm7RWBH0LHhyUs53vmGDcFe8IhpWMX91EZ?=
 =?us-ascii?Q?JIYYjQ2wc7mIjYsIcZQv/6T48pXQvC+m0pQIQ/MvJTovtC/r0Sce9k74lKCG?=
 =?us-ascii?Q?XJmTXI5zbBLSsvqxOfukcGm3OjNrA4wL8YoXZK6yxzOTY3pXLzyO7ptzkb6M?=
 =?us-ascii?Q?b2HT8Ow0mPsLnSqN+aWZ7a99Td7Zcyj3l57D/I4O7IL4eD6BKgIyKFASwUx9?=
 =?us-ascii?Q?IqESuj1awGDyRcons5Bzfc+T7hEW/gwE3uyvY38lmSAdHb7VFqMxzUE291Ol?=
 =?us-ascii?Q?Cfg8kzQYoo20LQZfVeUxZ4rxz+k6l0WnKMy9Lq3Y24bqzp+GPVJgBTrEVfFm?=
 =?us-ascii?Q?lqPx74YmIC64dejmP8vC0a/yVEMxC0Vd+qxBfT8RKQItXHDlSor/MhnE6G7S?=
 =?us-ascii?Q?YR/1GziVIwd3IlTUp4A7pP4DVxjuJ6K1JynQr4L7NVIUpqUGpRlICSg0JLKw?=
 =?us-ascii?Q?Z5BN+5+iJ5pUQl9TD/+LEKvTUDo0I/JqJw67ybOByvfKts1DCQ0guEC9+748?=
 =?us-ascii?Q?Jt/qOHXW6WgKAnKiUzVUzeJHIIQK0k6XxH2202xrGmtAybFXWN56hsnnDtdN?=
 =?us-ascii?Q?0GSYpltXa055k/ENWnA/gqdnECqclzvAUwPiC/ZMcWiO/Rfh7XBjSp15H/z6?=
 =?us-ascii?Q?zXoF2a0XEGd6JIu5ZDV+W/prO05w+Dq2M3MFGDvyAJR+10O4Vg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MvHnWDnFyVXw5kt/Nf+mMtR8HrBgLJGA/6znSW6ZNPe+NLzkXm/5LJah3t7T?=
 =?us-ascii?Q?dYHQkkaLeLzQhJMfXagJkFJt70EjNvHEStNDgmO+0ateWDc6SDBwoV0QIkyu?=
 =?us-ascii?Q?6DUPoW/gAJ4YR/xWpKaO/H+df8kH4yc9/HoO9BPMj/BQ99xaw/LiCkp3Z69k?=
 =?us-ascii?Q?ZJ3nISdR067GjHSfDJYBmXLOLWqnIPS/tm1ODL7gOMdvIpGGM6AYmKsj+jk9?=
 =?us-ascii?Q?EC6zVB9kmZuMsx+grIIjVrybDi5t8l/msXkcBSWbxYZMnwLL7zUjf9Ogkw8T?=
 =?us-ascii?Q?1MG1U7JoDNDYv2H19tGdwB9KXsDgGTK0QboPkn48JP2tvBjK70JNTRgzVHIh?=
 =?us-ascii?Q?b0aOSiOHqlG9mTWBBE2eGP+bpWOTQFi0GqZIfk/OBVLyuE5sR1A79kVehAHB?=
 =?us-ascii?Q?za5ez4okWSOVJjHsGJh2QBbssX1fuK1jzuRxuD3i47T8sfEJngu4FBV/G7O4?=
 =?us-ascii?Q?3B+FIcsdE+vT41yZdkH96ddcwGXxPkbwqk/aFTU+nD4ml5u6HkB1TRD+wtlI?=
 =?us-ascii?Q?V5YNa6GIRdRojyi0lduTOiqS6c+ycId1IkfPNhJK3lOAHvq196ug9tQbADsh?=
 =?us-ascii?Q?7FSrWk43YSr18feiG8rKNdVkbTUGe1hjLL5XAlnFyX91jDsXduMT5CoeWLi3?=
 =?us-ascii?Q?fLZgc5gdP48khyUJX99J3HDuCbnTnUgs1vCvrKepdwPX+mVnyxUUDzHGPeGt?=
 =?us-ascii?Q?pB80HQQWV6Vw345noGmixOB6ZdikE2KHyzNdjuSdsRxAfpQeVqpPP8KBijcJ?=
 =?us-ascii?Q?evF+iD44OAZt1ZbTCIh6DMm9EncPn8mCxNSi9XC5SDGMaGyyROq2HvmvrD+o?=
 =?us-ascii?Q?MtlmJb8xZ1BlvH0/FMgBTdsCkmMk9k5rLcCzvGIMaGbGERpNURQLpZOopU8n?=
 =?us-ascii?Q?J6j+ptNofZ63vyf9fliTJSWUidSJduU/ZW3dFv4n05NTrgceRPJDJh9Ew0VR?=
 =?us-ascii?Q?p12wFWiRzfsfLEojFzWpOer5m5FfCL3TAcb1+A5MyrB8RAhGP4jIz3aUr7Dz?=
 =?us-ascii?Q?ajhvBEfa6UDOppv1TABWe/qgymKuHXB6A76E7/QOeMGD3zTUqnJuuXoAMovR?=
 =?us-ascii?Q?1hD2rV/bI/dBCqYw0qEL3bj760mZGHy1EyYb2DrClI9kuAdg3QpiXqssI2qj?=
 =?us-ascii?Q?23vub8l1NusAi5wdQXZGeOZ78tba+PxMypJD4R00wH2q7uVPDeCGshG4Mv+k?=
 =?us-ascii?Q?CaFI8nHDvbwp+A9YfviPefguiZjz2Y1m42nJRuaif5JNgJ7TTLJTXiCylzcI?=
 =?us-ascii?Q?/e2wbXI5t/UOPmXb4aRmAJ//+diV45aMoo3HkbqMQ2akyZ9qo+BiwnTdCTDA?=
 =?us-ascii?Q?oFVKlMxn5S/1yEP5qem1agpe5Q/U832B+dQ2+a67CPgxQAY/0LykG/QhZv1M?=
 =?us-ascii?Q?Ruk/nm9vF9EMytbtL0i3K5nY30WUSqMLCrXeNrreFD3DAP7dNVwyhabdSD8K?=
 =?us-ascii?Q?0/w9ZmDQR4Ri/a7WBpGBrqqd3XGBxU6vBDuzMMuTPf//V7Je4v7G/8JfgFvV?=
 =?us-ascii?Q?YeNToWMKdqv7guqUR+M6mnpp2ljJVnU605UdkODJz03srCpLjDksJo+iIds4?=
 =?us-ascii?Q?PUESoDXvlrOnpgZHKFyipogrySzXrnRI7rM0XfOc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c8c2ce-7a6c-4c20-35ba-08dccb254b5d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 08:00:21.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uyrY3dT+DU4it/VIiVMEW6VdZ6VheL7ZgaKEm6oa3BQmIc7pyNwvxykor4qcPJORGEzTVm6d26JjBeQ4cn/lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

Hi Greg and Sasha,

On Tue, Jun 27, 2023 at 07:03:51PM +0800, Xu Yang wrote:
> Add USB PHY event for below situation:
> - usb role changed
> - vbus connect
> - vbus disconnect
> - gadget driver is enumerated
> 
> USB PHY driver can get the last event after above situation occurs
> and deal with different situations.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

These 3 patches had already merged to usb tree. But I didn't add fix tag
to patch #1 and #3, therefore, only patch #2 went to stable tree. Now
the stable tree linux-5.15.y and linux-6.1.y have issue due to patch #2
depends on patch #1. So could you please add patch #1 and patch #3 to
linux-5.15.y and linux-6.1.y? Or should I post a normal request to achieve
this? 

Thanks in advance!

Best Regards,
Xu Yang

> ---
>  drivers/usb/chipidea/ci.h  | 18 ++++++++++++++++--
>  drivers/usb/chipidea/udc.c | 10 ++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index f210b7489fd5..d262b9df7b3d 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -281,8 +281,19 @@ static inline int ci_role_start(struct ci_hdrc *ci, enum ci_role role)
>  		return -ENXIO;
>  
>  	ret = ci->roles[role]->start(ci);
> -	if (!ret)
> -		ci->role = role;
> +	if (ret)
> +		return ret;
> +
> +	ci->role = role;
> +
> +	if (ci->usb_phy) {
> +		if (role == CI_ROLE_HOST)
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_ID);
> +		else
> +			/* in device mode but vbus is invalid*/
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> +	}
> +
>  	return ret;
>  }
>  
> @@ -296,6 +307,9 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
>  	ci->role = CI_ROLE_END;
>  
>  	ci->roles[role]->stop(ci);
> +
> +	if (ci->usb_phy)
> +		usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
>  }
>  
>  static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci)
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 54c09245ad05..d58355427eeb 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1718,6 +1718,13 @@ static int ci_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
>  		ret = ci->platdata->notify_event(ci,
>  				CI_HDRC_CONTROLLER_VBUS_EVENT);
>  
> +	if (ci->usb_phy) {
> +		if (is_active)
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_VBUS);
> +		else
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> +	}
> +
>  	if (ci->driver)
>  		ci_hdrc_gadget_connect(_gadget, is_active);
>  
> @@ -2034,6 +2041,9 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  		if (USBi_PCI & intr) {
>  			ci->gadget.speed = hw_port_is_high_speed(ci) ?
>  				USB_SPEED_HIGH : USB_SPEED_FULL;
> +			if (ci->usb_phy)
> +				usb_phy_set_event(ci->usb_phy,
> +					USB_EVENT_ENUMERATED);
>  			if (ci->suspended) {
>  				if (ci->driver->resume) {
>  					spin_unlock(&ci->lock);
> -- 
> 2.34.1
> 

