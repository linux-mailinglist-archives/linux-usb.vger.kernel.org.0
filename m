Return-Path: <linux-usb+bounces-20837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30FA3C9A8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 21:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0795518922E2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 20:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E90023098D;
	Wed, 19 Feb 2025 20:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YuzAZHhD"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0923026F;
	Wed, 19 Feb 2025 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739996815; cv=fail; b=kZKG6R2La7ia5Z/UCji1xlBiYr9aGVzBXdhVaxejjzVc4bo1kQ0w+piUli9yiXp5e902nCFVkTvR3Ivjex+M8/EPjkuxe1Zx5hRL0YCjBs4p+Y+rYIH8feA6lwvJQuVjg2+SLGnTOm52J3B3aJajUNHMd8xgCktt5wZy+9lUD84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739996815; c=relaxed/simple;
	bh=0tzs0XrcRjN9PSE/XX71+f0Ay+g5WQFNl/Me3YaDhXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nYsbTdAI68svVI3Ubzn5c+cEykT+bbeQ35R04dSwzySoxGSWIGLc5ooXTXn5vaKOTDrnCjZfFK88ZPkQF8Hg6NuwUJffPMyY1wJmkKsBB8uDhYTjJ83XRiGZoNDJncVsi7dUs4Esty/sM3CIuK988XMM9IEX1WipzOEbG/tAq9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YuzAZHhD; arc=fail smtp.client-ip=40.107.241.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3Rm1+Ice7L7vzYnJTqiwxc5vcRWe6t97qu4l1vxvuU9IPL1vwFdoO2A/G8kDNdAmsqVNcn0Oo4qd62ZvMAky4c0N5wAAxehsvaxDZw7sQ9fh66uQd6e227BXrGnDqJAU7fHU9YE68ET0Db9+a+Rlvm5mLofAiV22jBJgzuKXDarPId/F7b+iLlHWjrz1Kqn4Ht1dZxAWwcfK/ZCxg53GS8IoyJx3JTOzOSdw0l+aHR2fD5Xkaf4EejpBTY9QCg8zesN6r+k2mUGAKpNomiWsBZj6cPzTyF9izt6XfHjZ8HMnGX/SpddBe/UIfHftcldKUBfaPT63ckXj46q9Owa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kxq710jjSgk+ZX+/eVYWzzR9ma7prl4Z0+Il74nebJM=;
 b=KNRI0Hm/+nrz3rCN612mXS3fZAUp6v6wdHkA3l/clEttTWcZzITPVwLBu7yA3elCI3B3yhej1GSLMQUGfpqvYF7m7NeddbDr9v6JQpMYGVmXUBcs8YZXRULRnV8brCmcI2foqv6376RMxkLQlSdg3ivuf7007RN/i04SQVQmnlgdsHzkrZE7Jj32f8ZukTZqaQtzTTL0CJd7ZGclTjixTCsVjXmFOed4mwjMKB3DrzRvFcphZNJySy8hzOUlhfRiBs8Ubb0orQovF5wjxR+TEPpar2qpY6FUDTHYWJXHzm0jrjAl0B6BS1pPealAgSZmE7qi58UQB6eS3B4Nk36rxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kxq710jjSgk+ZX+/eVYWzzR9ma7prl4Z0+Il74nebJM=;
 b=YuzAZHhDctmlu4MV604+FgAwc0YT8zboV4krn5uuJCFUsm9JF5PX5OSdjMMxiG3GK1EYw1cSHhM6Ok2l2Vn2wOJM3qCqvTTIpPNXVpHvRc/95OBq+20NINR8c3lnI+prqrAOz6fWatdR2hKvNpsDHg7YzkGx1UqPNveXFim767QW3oQwdy74wsiaT/IZoS4vaGpQKli/nz81VrcxQNWdAgqnphaeE4+NDY+hAE5m5gubDjHVaU39jAfKOdNt3J7q6JXFIp4lcm02DeHqb7DJDw/XHxknMAuIX1ADiUJfRo+lg98w8bWtsdhSp6EXMDlOjR6ZO1EAqPQ1EhuBfodzuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 20:26:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 20:26:50 +0000
Date: Wed, 19 Feb 2025 15:26:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219093104.2589449-4-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4b99d4-1e6f-43ad-6528-08dd5123bd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Iw/rGLkUIhcGfpCeoC43AjswX2zmgTp9sJAekFydnCA5ujRlDm2gyx3klN+y?=
 =?us-ascii?Q?zxCBATE7jlF9CNZbDCspnSfDtt2Yanvi9BKGIGVlwvN6wtuXpnJWTuUERPfI?=
 =?us-ascii?Q?tmiIBJDcErJ7HQwFqJ1vg5E3KZ1AOdoDwn8Trj9bvv9VZM/lKrP39Q+TJb+j?=
 =?us-ascii?Q?knTI8ZK6OyYfntU+KdtRXheJ6c66JNm6OEcfXtfPQ4OV1MiwouOB5q6u0RXy?=
 =?us-ascii?Q?4ldPktX0MfRu+IVprzu7+IcqL8/72kAKouyGCy4CUXTbr/Ni1CC/Fj07kVUI?=
 =?us-ascii?Q?HkapBCkLFJDe4gB9nl4hM1l0kD4x6ULjn5efKZEqN6JprR6Uy5Wt9tOnmME7?=
 =?us-ascii?Q?OYjoNVgPZrixKNkgA0wbPiq1EqyXbOFNaW3x9iJyBNNQKPAk9sdHvahkYE/1?=
 =?us-ascii?Q?r/Rc4YDXYFmPmkuB/NDSetqSt1YAJc7Gem6kY673rx8uadditCAiYNXn2uSG?=
 =?us-ascii?Q?Vm/hm84DT9ZbDJg6M7/UZsLgQb7E4ENvIZHFtBK99aaDwMAlE1heRfCQXMco?=
 =?us-ascii?Q?vhx//nGxyE0EoLH8QW7KD52LzkD3XibQDg1TNu0k6nrWlRZdUvGJIT9JrCok?=
 =?us-ascii?Q?ugRY5RgS3nuawGToaDI+J0s/3u1tktk+6+UEQ3AUS08veuBgVnAesen/XBHA?=
 =?us-ascii?Q?iHxIdUQ77fMNlN6XTdWfQwny03i8MBRV1vxmJdBGScfEkA4sFRlyEVucyDkb?=
 =?us-ascii?Q?CWoZgby1gbLJw1FcFzVyflTeSSeL9pKAcic4BBrzi7YYPO20MO6jGQ8hL+sf?=
 =?us-ascii?Q?Qkzcv1pWHF9fbXBsIOlxoLLAGdPpXYLqsqV+D8YXiBpk5vblv09/OwSOQEC9?=
 =?us-ascii?Q?tnkhL2gP2CQJowCai+/E9pepCwGBvTk/HA35R2pD0MFAWNkJBKgHc20PBoOg?=
 =?us-ascii?Q?FOTVpjMmDt247GrajYugeWT0SeVj9BPaQaUoRO8GxEd1xfDsBAPZeYXA0nzQ?=
 =?us-ascii?Q?B6MPXZti2VeWPuRMA/7eMiYadTQ/XHbeWtyl3Xeo2zV47Dy2nc2iNFKp0poQ?=
 =?us-ascii?Q?m4jesiyvNci7PY0hEWkQi1mYfuEkMqH1PPzHUTu1ZgHp4WquD7aK55wGzm9A?=
 =?us-ascii?Q?vHajTAjRrtmAD1nAIYR/uip1aee5M3FI8FHIh8pRwy1h+LQakSxgYxObpWN9?=
 =?us-ascii?Q?VikKJcw/snwFCoXPrdzx2FgAW2pXxzz1s/dJPnYK8j1m1dKbhbd5ahuYDK5c?=
 =?us-ascii?Q?lYyCQ0sFivhLwKBGFsTlamupRIwdzIJkZWz+ObxhTEaCJQVSV3MRlnnTX34g?=
 =?us-ascii?Q?NhzjUF7jb4+4eDO0n0Sr3mk1VXC2g60U/hO3CRb+lLSq25bhA/Qyq497aZxw?=
 =?us-ascii?Q?vvMU8iep9dO0iFdofkINoABbNU+C+UBt2eP3He+aWXVrFYRqGenBbY2XH6DZ?=
 =?us-ascii?Q?EJC1J5MOTrFSFUXtVWeikJOClNEUzNyQLDTdZ3T/BAAEtsWh9j7dA1Ya9LmH?=
 =?us-ascii?Q?+opFGQl8QehpBb9dCXbHApx2KjoU/W7I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvRnjDwP2KGUIIWkL0ivbBjB67xpJAY7AhUTc+bOYs5FDrvhN4SFTW4ZB9HY?=
 =?us-ascii?Q?rmcIAodJhLdHvWkR15F4s6DwQV7gpYUFCHxiyQ2IVtTUvq5DoszpWfj3N3ql?=
 =?us-ascii?Q?r/JuYCkwyWjifdE2Ys2xV0o2j8Q5eUV1q6WjehvVJqfcDmzZLnPbH0n0ZKsq?=
 =?us-ascii?Q?eTHexyC0cagUpSPZz0dNsXF1qsAXHHPBPoeZNsE5LX4LO3RPZUGuk0pB4ppu?=
 =?us-ascii?Q?gpFOb6j92x4/8/DVGwIg8Px1wUAC1ZmfyCiWKCwn7nKi6adbKg9DXYKasHVe?=
 =?us-ascii?Q?1PrBDoz3HoT15V2aEkeN3/P+uDr0uT92VqDzUiBbKITFtoLQmjM7SHL1FXML?=
 =?us-ascii?Q?oCQ43Pj7pNCGlmCAzMnXzKDv2cTRBcseKo0w0Dde1PaKWKW2VOx/8ImJ7fDh?=
 =?us-ascii?Q?kCdFJuaZIFIVvWCAaCMuQDN5wFZzdRQWiQOO1XkHdWeeTqbFYIMbuN0YEi0+?=
 =?us-ascii?Q?hhYvIM9ulDmz9B0wASJcs3kLhxvssNHY0zG+pbRbaSETVgdSZojQPw6C5w9q?=
 =?us-ascii?Q?MUsyXCOhDymY/r/yHxIaskxfHNZtnuXh9VDa8EibzddsOpLc2hR5CwZp1Y2f?=
 =?us-ascii?Q?0PEr8GbEPl1aoTnh0nY0dpw470jAe61lvkCC3kwYBMGN26uRDmY7uYZ2zRnr?=
 =?us-ascii?Q?xYifkH9RImsPH6RJrFXGY7grKdpxI+2xGdmeH2H2PipWgwXZQEqb97CD4Zpq?=
 =?us-ascii?Q?U6I32bRjrEWhdpvXlgaNXJWCkpnB+qk35/K4+Ne9+7vIke6SlJ4oLry8JxBP?=
 =?us-ascii?Q?GjeO71IXEwzkUQbI5+3g+4thx886j7T0jtnqjKtSqjG5tt2LvL3tSsWNJOQv?=
 =?us-ascii?Q?CVLolBJXyw7rMHSrFtXtKVUgG/Y+PWLYvj6Mf/WTfOUWql/7/qdrct0XVQJx?=
 =?us-ascii?Q?eiFnEnEIrU8Cme2T+TJKTwN2mxr+M0in45Pe6uNVmfJ4vWye1h7Wlo340pom?=
 =?us-ascii?Q?F+CA+7NzEWmftCnAgoUxZcKZpVIZL/mxdy5zNV/0pLX5QSem68O26VD8uHqt?=
 =?us-ascii?Q?PnglhzyjvtFJ3O/jXQ/os6+KSvVVV+OfMmmy7OrkA8PDwKNhzgodXOZ7DaZ5?=
 =?us-ascii?Q?U/6UlojpCWJW+27zpx4qTfjx92vyOEfDwfpLBptYIiQiOWJRGun5ZusarNK2?=
 =?us-ascii?Q?RaBoR6i+7xQtFNQRXt65u2wUGuodBlXqMpL5EYWRh+XYrF5sk/Xdv4+z2n+k?=
 =?us-ascii?Q?213iB0oUBjSpL8OrnCYX9Zl7nlHTzNJYtulUs7RJHeXdEc7imk5DxTClkBLy?=
 =?us-ascii?Q?2yd8hqmCmg+OTb0vH8B5tjD5IFt5f40x1BixNAOE62Ll6P3EDHgbXRCjBBgK?=
 =?us-ascii?Q?LkPK+9d0CJ/AdMQDPGb1WrCoBH1tARTzyFizh1UTikhweFJ2Vk7hlEBwm/up?=
 =?us-ascii?Q?p6WxwRMFcDLeKAzKQzcY/q8d8c+vqU1jwPoFV1j2rqOt93yg6V1Ja7a0TuS4?=
 =?us-ascii?Q?0V/yG90n+pSI+FcqxIHp3LdGoGFzz1YcpSgRaPv/PoYzwWPdJdywj/5+jkTN?=
 =?us-ascii?Q?HLgrCbzjfwwj4zdGwG42yP9p8dE+lR+buzc/mvNDkpaOMW/gPhVXppQL9ZJj?=
 =?us-ascii?Q?l3n1Kt1k6CPb0pnyhCg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4b99d4-1e6f-43ad-6528-08dd5123bd57
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:26:49.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H3mCjbALLfhbl+ksr7Uay+7p7r1KQ7PwRPHPrdnOp6PN2XhFu+ORxtgczI5bihu7mtQhsZlIs+myFqViDzqmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602

On Wed, Feb 19, 2025 at 05:31:01PM +0800, Xu Yang wrote:
> In previous imx platform, normal USB controller interrupt and wakeup
> interrupt are bound to one irq line. However, it changes on latest
> i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> This will add wakup interrupt handling for i.MX95 to support various
> wakeup events.
>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 1a7fc638213e..5779568ebcf6 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
>  	struct clk *clk;
>  	struct clk *clk_wakeup;
>  	struct imx_usbmisc_data *usbmisc_data;
> +	/* wakeup interrupt*/
> +	int irq;

use "wakeup_irq" to avoid confuse with normal controller irq?

>  	bool supports_runtime_pm;
>  	bool override_phy_control;
>  	bool in_lpm;
> +	bool wakeup_pending;
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pinctrl_hsic_active;
>  	struct regulator *hsic_pad_regulator;
> @@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  	return ret;
>  }
>
> +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> +{
> +	struct ci_hdrc_imx_data *imx_data = data;
> +
> +	if (imx_data->in_lpm) {
> +		if (imx_data->wakeup_pending)
> +			return IRQ_HANDLED;
> +
> +		disable_irq_nosync(irq);
> +		imx_data->wakeup_pending = true;
> +		pm_runtime_resume(&imx_data->ci_pdev->dev);

Not sure why need pm_runtime_resume here? There are not access register
here.

> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
>  static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_imx_data *data;
> @@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
>  		data->supports_runtime_pm = true;
>
> +	data->irq = platform_get_irq_optional(pdev, 1);
> +	if (data->irq > 0) {
> +		ret = devm_request_threaded_irq(dev, data->irq,
> +				NULL, ci_wakeup_irq_handler,
> +				IRQF_ONESHOT, pdata.name, data);
> +		if (ret)
> +			goto err_clk;
> +	}
> +
>  	ret = imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> @@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
>  		goto clk_disable;
>  	}
>
> +	if (data->wakeup_pending) {
> +		data->wakeup_pending = false;
> +		enable_irq(data->irq);
> +	}
> +
>  	return 0;
>
>  clk_disable:
> @@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
>  		return ret;
>
>  	pinctrl_pm_select_sleep_state(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(data->irq);
> +
>  	return ret;
>  }
>
> @@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
>  	int ret;
>
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(data->irq);
> +

Look like only want enable wakeup irq between suspend and resume. There are
some questions to understand hehavor.

1 driver probe --> 2. hdrc suspend -->3 hdrc resume --> 4 controller resume

1--2,  look like wakeup irq is enabled. maybe controller have some bit to
disable issue wakeup irq, otherwise flood irq will happen because you check
lpm in irq handler.

after 2. wakeup irq enable,  if wakeup irq happen, system resume.
ci_hdrc_imx_resume() only clear a flags, not any sync problem.

But sequence imx_controller_resume() and ci_wakeup_irq_handler() may not
guaranteed.

If ci_wakeup_irq_handler() call first, ci_wakeup_irq_handler() disable
itself. imx_controller_resume() will enable wakeup irq, which will be same
state 1--2. but if imx_controller_resume() run firstly,
ci_wakeup_irq_handler() will disable wakeup irq, which difference state
with 1--2.

If there are a bit(WAKEUP_EN) in controller can control wakeup irq
enable/disable,

will below logic be simple?

ci_hdrc_imx_suspend()
{
	writel(WAKEUP_EN, ...);
	....
}

ci_wakeup_irq_handler()
{
	...
	pm_runtime_resume(&imx_data->ci_pdev->dev);
	writel(~WAKEUP_EN, ...);
	...
}

Frank

>  	pinctrl_pm_select_default_state(dev);
>  	ret = imx_controller_resume(dev, PMSG_RESUME);
>  	if (!ret && data->supports_runtime_pm) {
> --
> 2.34.1
>

