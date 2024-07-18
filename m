Return-Path: <linux-usb+bounces-12275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F59934F44
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 16:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5D8628468D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 14:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378251422DC;
	Thu, 18 Jul 2024 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="A9APUqgo"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013006.outbound.protection.outlook.com [52.101.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F712C7FB;
	Thu, 18 Jul 2024 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721313768; cv=fail; b=KveBSRWGNiBnAMt519hhICpJAhQHhTyUzmHFCB3y9SOMCoWUKWwMf2eoAAm17OGXZOIGUc9GxiWbJXO7KaHoUT0Upo6FUF6CDAL70SYPclhYOa9NZZB5uaMymDCzZ1aI83/TaKc4Ssaolg5AYS2Dlrcg0YUBlmZEbxBNm6qj6KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721313768; c=relaxed/simple;
	bh=94DtSeZs565FASw8QLrtMs5wInBf4MqGBAsIcyZCuK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gepUT7Iafj1tkmXsdU/3vUpB54HqkduowH/Bkhp/YmTsDEL8TOWgJmDBfzXQYJfqIax/zmfbIKXwPBZFMkU1ea2U8MtyEe4XBIzgOnC6+IgqONcYUDGX75Cbnhb6cwDwelDx3iDw6/ZYc2l9abFmeCBRBoJPnLYJNonlWw7dqQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=A9APUqgo; arc=fail smtp.client-ip=52.101.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWGjQ/iJW9S/7YynNayvfx0iytS4yxEG6ZAk/d4H8Y95YsRxNrU3wIwpSe8/wKOUNhMEoboUAJuGHxfFAFLgqqiIJTs0CsijDEyBcrBLJA2gmJZd/T58mCr8rjnTnhNZTZGZ9G9CkcMomKQRZE5MqsvVyyk0gFAjkBUSkjLE1VCC4o2IiTPV52PLPBwYek/qzRsZEZytuJvpqAFlKvFWV7A036ehsex9zcVtUGylLQ+XxsXAA2qJOOOMylbqdnur/Hh61UN4UOWNmoQhlHyA7ZvpewAkTdt0rQrVJAVHofPihojcMOLn9E/eDWrCLuVxV00PzrIqkMjTMtgnmrITcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQNhrdSritfQdhFxutcUeszBY+I9TebduyoKo5S8sak=;
 b=oR68lyowRHl9Cfpg5Z+AQKZ5QEx5p0akOrGTde+G4WZxWlJKeIEhPGHWahpGRUzugS7VZyXEICHy0hDcDgM8bYw/E60GgpzjqrMFFknBukNJ5M0vMbep+ufwE64TPOP9LDwYvKSEXDRZyeU0J/Ip3Fs9fUsRqyPoaBaj7r951OK9xp2umX7LvEtN+egj70ekMGX/MkXDwH4Ugs1wH99Q6zhavRJMlCojREiXLdpWEFZboqspFxeUWv8LED2KoaAtZVM37quWIlegtPqCufq/2rSd98zomGfi9KnlN6jZBiy9Ih2jdEfJSMBngiQ03xJM6LvqypHhavIDh0X7LJgP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQNhrdSritfQdhFxutcUeszBY+I9TebduyoKo5S8sak=;
 b=A9APUqgoeVg5QE3Jo4Re+oJBjylWYVTtnfKUHjdh7gOad/2E8G90H3Lam8YKt66SRG26FgnNgf16FtZcW4Z174cKS/G+bKLvK+sg662lZvEb9p0KJwEDKB5EoVphFugBl8yKjitsqw4etGhkgzBm58lfL6PU5CMFHRtLJugq6sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 14:42:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 14:42:42 +0000
Date: Thu, 18 Jul 2024 10:42:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, peter.chen@kernel.org,
	herve.codina@bootlin.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/6] usb: phy: mxs: Using regulator phy-3p0
Message-ID: <Zpkp2URtnfSdm0EL@lizhi-Precision-Tower-5810>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718102637.3964232-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: BYAPR02CA0058.namprd02.prod.outlook.com
 (2603:10b6:a03:54::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f22709c-607d-43cb-cfdb-08dca737e161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v/7TAGrhwmd4U9/6p1X8R7GUguvQFXoVRTWLdFwzLyM+SS24lLEVXAFmAi/N?=
 =?us-ascii?Q?zgzAK/l7vmKpcsqIhExnLTLEPgILh1fqWG2HNExXCvYMnti/waWn6vV8Mgsg?=
 =?us-ascii?Q?okRtYtYbFQE2kHhsEB1fVPVWKQ87QTCP3s8inQu8NbytlgWe9pY4803hogC2?=
 =?us-ascii?Q?IPgjeqlvhr5fJKDCY2AqfRVdCcPc3zq47jk7DDKJgHz7VaY2ByIoFcqBk/Ao?=
 =?us-ascii?Q?BAoGKYPFH2XN0GR/bVRwZg8I5jkB9P21Xd33IB7oL4NPnlmloNjDY453oOdN?=
 =?us-ascii?Q?lSROF1WHSM0ISvtduAD9F7LvCo7aSdJJhXDFGX3gU9OSPqOoj4YDELKCnYb1?=
 =?us-ascii?Q?ry+wDxaO8/Jk2BaYs9fu/eRsLjVoCFX0WXx6k63ggtfks51+CCyXfRm9OLx5?=
 =?us-ascii?Q?/KHbO+lyBcld/TAalJgmlvt+/b3h/pl1aDEbwT2ujEnGyrk3uDOKJxt7xgQp?=
 =?us-ascii?Q?BcysbLXwy8+pwUEPKNTkG7/S26vX52qwMhFcO4iLxWRemZvAbLMIT+E4apo/?=
 =?us-ascii?Q?OD1/DmEbsKYlrq85crfm9Mdeiq5TO9XjZa1e+LIh6vWvA1JcpPtYHXuY0t0b?=
 =?us-ascii?Q?f21LfbL6SaOsPku8z/X01Txwwo1N/AhtRK0FgjTLEJFbvJKCprsVCZuK30l4?=
 =?us-ascii?Q?rGarBALB0XBeHWnPqTpobcymKjX68CLfaUi6nvtvdKA3bIEq3XckiJFAclee?=
 =?us-ascii?Q?r97enryABwTcaG8TfQHFgORcVE/JaiSmMzAdwxz0u95RuhY7sAEiXJjPoTKc?=
 =?us-ascii?Q?+rN3r7qsG136SQWDG6IiJbg+RKYPDUAUVFue7oBtBI/GpW5kmlMHlY1aswXV?=
 =?us-ascii?Q?UranitlSkqOJVL4YXa4DV+uMt7tYNK+wmZSPP7ieLvgfJuQGUwtNsh7Il+wT?=
 =?us-ascii?Q?W+zz+i2uXJ2U29pLt4/l8gy/jfOdnllHB21mORpo7sKEQ9ZBCMfTCKo4h3LI?=
 =?us-ascii?Q?LYsndJBZ53oPS4JgFjmchQoPP/fsGnqdEkXpbEqq5uIhzNIrvTW1odnodvPb?=
 =?us-ascii?Q?qeeto5ZxE4ZNAedC3lJBXdF2peGHi2UX6cEzp5cdR98kS2xaoW+cMn8F9Z8t?=
 =?us-ascii?Q?LjTl+//63uzzl9YwUhdpUvDCx3D0yrHWnnCw/E+8hKUMHLepUg4Bn293HD/J?=
 =?us-ascii?Q?TR22z4GvEk5efKNndQBE8sTt6V8NGJMIO9JitfydQh6yfEkTptHfOMluY/7n?=
 =?us-ascii?Q?B79CP/QysmDxlnLzB3UijDMxmFiiNiGZ3pu3Ftehk04fJDne3EJOZxD6tUeL?=
 =?us-ascii?Q?SUnApDmUbJ+3ysGkkzbA5bNQZUXhP7CrbPwHzwK3sgJFaUqx2gAz3N+hNH28?=
 =?us-ascii?Q?V0Gfl2TKoK3N71s0QE9BRVGzGFwXUHQooyQmwJu2oUxM0t/OA6UO96Dq2gp4?=
 =?us-ascii?Q?+P5sCiF9O90iu5v+qV5/SIArqQoDoKRg1UyB/+SdaAqQUIs9HQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4jKtxrJprSvO3z60PWh8TDoFFtU2w7bAI+4/j0AT2XsrAzWiOsHc5gOhbiN9?=
 =?us-ascii?Q?no6zvKFrJyWDWojN1etl4g7TKH5Zv3F4GxAXZN3otuDfVRPLqqXf33JycskY?=
 =?us-ascii?Q?pMLkZWOTN/d4YHSsD7MXyR/AYxVsAaT2ZOU8c6cN5yGIYcGd5gN4G6o6PIV2?=
 =?us-ascii?Q?8rQM6TcJGrvrFJtmn9O0u+WmqViJKudOzAt3cW7rQBIjk0VydyBodidl8CQx?=
 =?us-ascii?Q?MJoDuakMOEBkl4zR+Tc7HXY6ICAIOAKZ8FY654wYIAMGQLb73CgxOFd7mZdt?=
 =?us-ascii?Q?yrc9KjveqQJYXXEPX7jdH+RLOw1WXfzmDd6jzf+EidV6htPx/M66utHYiv9x?=
 =?us-ascii?Q?qmDMkyJ1b8bZWb/Gfl6gvibzXPtK6Z9xANaXuZ+N4QbiyxnyHBLiKvkLSW5t?=
 =?us-ascii?Q?7udKTtW7qpbRZjfkQxCb257MxXvFOfI+PWjRz72hmMoL06/qWRJkgUgBIGJx?=
 =?us-ascii?Q?zRNobC5oGEgjUbuVIujpIdTwCaPqLbj82z6GAf8Kz8GzDYPWyTppyAiqTj8I?=
 =?us-ascii?Q?IC/9gY4jPSQ6+iI3zGkCD35YJ8JMEI/V34FV+Nu3h3RF5FuRH86kncl/iBu8?=
 =?us-ascii?Q?FMy3FzG9ko8QMBKLFaBtNH2uLvqLLds1uuS4oYnSze7IRCgDU6P8/A0cT3Hk?=
 =?us-ascii?Q?ClV1UlvsQzCkFElcCTt5fK8HLPRf1VqBNqTaS1plnIS+7QrOgLdWgWjX82Mc?=
 =?us-ascii?Q?hwiKe74qvyRcIINWdWfVk4Nbp+CzzKz+1X1awDfIQ9K6j8jJ2abasW1555uE?=
 =?us-ascii?Q?2MBM3wjDRYNlPTnhnNi7aYCAKfFBXWScbQpvuhzQC/3visEJZ8yBu1N12HSj?=
 =?us-ascii?Q?It8FhL/cgtWtRbLfrQIUe80k9JSPLsC2zK1qtduAJkjxYQkl768LCTGp8SEb?=
 =?us-ascii?Q?KuFe+R/TbWEPt8XqLW4WquM/fYOJcKWD9v5YR1WJzQS9d2AvOnBt9/Oe794c?=
 =?us-ascii?Q?FBUqGr/+uvYj/y4NlX8qZbolMDsL6yStRtmNQstG14vXYXmUBoMHkcGwipBT?=
 =?us-ascii?Q?BkuXWH/qRZ4y6Z3Tkzhyd+E3ODvjkjWppFlzguPrjxc34DJMacdIuDhtEfuu?=
 =?us-ascii?Q?2oTIobS4iPqdUupOuZl/KzblXDuHuJLcP2JRAAyVU8NVu6nrabL6ZJ7PTJx8?=
 =?us-ascii?Q?a4vxvloxF+DDz3rhZ6w8PStqI1bCgP4wP1OgfqZb51sr3DjnXOowgqHwP/ed?=
 =?us-ascii?Q?LtolexF20ZQtRFs+I/9ybA/i1V/3sqx5L1ix3z6MCfrF2HdNyF/nSO0d+ngg?=
 =?us-ascii?Q?rDe/onhwezT+HEtgg6ZiTPx6vybJUsesxbpTttr3F5SWIGkRwAj0pn+n66PR?=
 =?us-ascii?Q?dFG7adomiUbAK32JJLEqgfrMrtq/fUKxIlDNLxMGLC2W4QcNoBR0IaLqu8mu?=
 =?us-ascii?Q?fvhQr/HPfVQimVNdVY8LJVcDYScN99UVdguEZYzt26loSb8EZ8PiJsx9l9d/?=
 =?us-ascii?Q?V9W0ti1dUeK13dtZAuO/+R4tzDVomAkQAlf7vndsD2C/OnsgDM97yI9bq04B?=
 =?us-ascii?Q?N+1tvFUa5VCfY0ngyTT7dsSp1ABK9FhXo7fjpykBYGBL76wyYxFW466Rptd1?=
 =?us-ascii?Q?eKnSdC93Mcrj6kpOy2c=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f22709c-607d-43cb-cfdb-08dca737e161
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 14:42:42.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySqU3rZeOLP2OD2U+4mDTQh3Rs0wwpqMKSmVeB9qn6CHkNqdMoVz2jPPm/A5ii/hVIYSVxkudzZys6mKnI2s+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852

On Thu, Jul 18, 2024 at 06:26:32PM +0800, Xu Yang wrote:
> It is one of PHY's power, and we need to enable it to keep signal
> quality good, and pass eye diagram test.

"Enable regulator 'phy-3p0' to pass eye diagram test since it improve signal
qualilty."

My question is why it just improve signal quality instead of make it work.
It should not work if no power supply. 

> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 920a32cd094d..42fcc8ad9492 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -18,6 +18,7 @@
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/iopoll.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define DRIVER_NAME "mxs_phy"
>  
> @@ -204,6 +205,7 @@ struct mxs_phy {
>  	int port_id;
>  	u32 tx_reg_set;
>  	u32 tx_reg_mask;
> +	struct regulator *phy_3p0;
>  };
>  
>  static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
> @@ -288,6 +290,16 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  	if (ret)
>  		goto disable_pll;
>  
> +	if (mxs_phy->phy_3p0) {
> +		ret = regulator_enable(mxs_phy->phy_3p0);
> +		if (ret) {
> +			dev_err(mxs_phy->phy.dev,
> +				"Failed to enable 3p0 regulator, ret=%d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
>  	/* Power up the PHY */
>  	writel(0, base + HW_USBPHY_PWD);
>  
> @@ -448,6 +460,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
>  	if (is_imx7ulp_phy(mxs_phy))
>  		mxs_phy_pll_enable(phy->io_priv, false);
>  
> +	if (mxs_phy->phy_3p0)
> +		regulator_disable(mxs_phy->phy_3p0);
> +
>  	clk_disable_unprepare(mxs_phy->clk);
>  }
>  
> @@ -789,6 +804,21 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  	mxs_phy->clk = clk;
>  	mxs_phy->data = of_device_get_match_data(&pdev->dev);
>  
> +	mxs_phy->phy_3p0 = devm_regulator_get(&pdev->dev, "phy-3p0");

Does binding doc update?

> +	if (PTR_ERR(mxs_phy->phy_3p0) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (PTR_ERR(mxs_phy->phy_3p0) == -ENODEV) {
> +		/* not exist */
> +		mxs_phy->phy_3p0 = NULL;
> +	} else if (IS_ERR(mxs_phy->phy_3p0)) {
> +		dev_err(&pdev->dev, "Getting regulator error: %ld\n",
> +			PTR_ERR(mxs_phy->phy_3p0));
> +		return PTR_ERR(mxs_phy->phy_3p0);
> +	}

just need call dev_err_probe()

> +
> +	if (mxs_phy->phy_3p0)
> +		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
> +
>  	platform_set_drvdata(pdev, mxs_phy);
>  
>  	device_set_wakeup_capable(&pdev->dev, true);
> -- 
> 2.34.1
> 

