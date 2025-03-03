Return-Path: <linux-usb+bounces-21287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC3A4C9D8
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 18:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859733B758A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 17:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FB325DCFC;
	Mon,  3 Mar 2025 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZEVdvW+k"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B684A3E;
	Mon,  3 Mar 2025 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741022027; cv=fail; b=tQgKaCIlkEQj70yn8iq5pOUVStWp0gkONl+/xMQhlKKm9tq7bQtZmnl3GyWQU6PXJjJUs8eaQrhxkVueyrjZPFToTP60f5T8bOIfIwaW0BpI5ddxs3OwvQun9ABXmP7dMpPn234nK+Lfd3kRMAcjnhq5ilqAAKww9HMST60vUeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741022027; c=relaxed/simple;
	bh=hwA73Vi2s174cYHK8sbIHEa5q6dd9whSn1zKwGcLF0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jYNLfO+QdNMpBo9aC49gAsi/xQlI1VKdUgKErnFFs1L+K7Dt5tJ4T1TSCqYyXgmK9iywMtYdmkUXgevr9ty8sUHyB+/NjEv82QUipTPVUsHiCE7RTJ1S4t/hEKLd5cY8/ogtpgtZVOVkuB9VyxdM9nE2Jbi3HvZVm7+4hOZyw6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZEVdvW+k; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxOK8v7qCEQo8h9WPCb8zddpELjVgI6HQQno+LKeKzmBZeuRtm5rP1EKigrtWqXkFKDNjdd1bGG8p+eOy624Dz5DChUarxZXGOY/Iqo4l0ByOaymypvk3BdQJHjxest/UsjedY9bnEfY50AIAVZcFstxWs5/jYtcHlziax4ZqLV15fERIYSWfKjUjvjqKWH5Gawk3rmtJ3J/C34DKTOf76+Ug1uIMuPEvhpMMxYOI6Y/qNADhjNhNnTpdUrGt9USi61GfCGUZk4Tzo+AAZSWsXTwrM7KLYKdVSJu40VvnpWxEa53IRqPU7kvm6oVwBc+d48JworOST3Zjo0AGPj/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRvYqtz1carQqNYSWxbrFqdEvGmnaBCKfkdR2FQEeWo=;
 b=FDwy7nnSOB4ZD8/dS7iDSRVmo1cpw7OsG0o++mLzxSjAV8ry0waNpOVQk2FNzbqzJyEtfSC47ztNcLxkUwYboveDLjH5kTf0/uVHmrkSCnh60SXnrCUvq4+bvjW0cGD8Ax9KUah/qN4NFaBPRv+CbCfLuuXJTkK0XUqXzKSpciXnUIPt9xt768muP0yL4mqBdSMIdtImno4U1xaGUBW3V7bX/m2ZE5S+fSoxQ8jJGxLpnD06Kh2NNHFATe+7Rf9Zyxd48RsyKuXe8eA6RdDgw3vMJt6XwyduvJyVPLIHlUGNfSTkyCyxz2XWG7qxbJzb1Xc8+K0k4p4EpZSPW2s7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRvYqtz1carQqNYSWxbrFqdEvGmnaBCKfkdR2FQEeWo=;
 b=ZEVdvW+ksXTUckbDIUcZWsBGvsQ8XPmoF+DKIS3Loz5hLtj+hFHXFKn8QZxlpW7GBxBDQbUiouOgXb1LJgNi+NeokFg1rUdh1sABCjf/hkLE3A42J4F3RO9GD4Iv9DFYs8LVf11AP1SAsDQg5fvcuML05GGfP0JyFtMxRCU2P1fkg0gzZfptX67Uwpg2zU8VEAKUL/A/dOctAQXxTxz2kBj3iunoIarfaEwFEUqpMzrV+u7OAU7GxzZNoPCVF4b6lTHmRNcwwGzc2CtStMJMpfdhuM35pAhoqMMa/7Jm1fuWNNxocDphJiJIV8h6l7JBkCja8sxbS8PeIzq/g4VmAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 17:13:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Mon, 3 Mar 2025
 17:13:41 +0000
Date: Mon, 3 Mar 2025 12:13:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <Z8XjPhl4jYdggDKr@lizhi-Precision-Tower-5810>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
 <20250303033344.1251076-4-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303033344.1251076-4-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:510:23c::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eed2f4e-7355-49a9-9efa-08dd5a76bf46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ikxg29ssoig5g9slqr/CXOZv4OObglKrtgx8gLcOG7zdBzD9MSzQshvDycnm?=
 =?us-ascii?Q?LBdZGPKC1wb9lhUafVg29VHQe/tJavN9Ey86rkPEk13CkQLEJIurEYKQ2YxB?=
 =?us-ascii?Q?s3VwgYXxZBrvA3WXhXb+f7/X/o+utYGXPAI4qZVFp4zSfnSMyJB9qY12pfyI?=
 =?us-ascii?Q?n6n53EbrEZrvZoca4XY+6LwvzTlZTk5QGpUHO0v6OZ9GgDy+mVoc3IcrL4x4?=
 =?us-ascii?Q?VvsIxKJnrGw8KiRG4mUcaMjq1Ve1Rs6c5LYmeUY6o+Q6rGJVtSflBTK63ZIw?=
 =?us-ascii?Q?oXKUN8OhXIVIr94WSeDdGlOcPbRSiECL5Ys7pTguASPJktf7e2jZewD9dVD8?=
 =?us-ascii?Q?/Vyl++zg4aI7cVTGiS+GcWRFjl76p3VVymj+iALUXn5cuo/huKLWVH7YX/k7?=
 =?us-ascii?Q?ngK7uUi54ISDmtz28a4yM6iKD5IIu0nwoKOO6geCaFY2CxhMD+hikSJ0ELiC?=
 =?us-ascii?Q?rV2wQUG9apR4r3gwZa+gw+Bky8Ba3dwKC9054eWmi9JjDOjuahuQKI9pdgHm?=
 =?us-ascii?Q?Y2IhlHQTC+SGiUj+CTi0kyISnK4VbSkxayjwMwLMur+xj0y+O09XB9REQMzo?=
 =?us-ascii?Q?WbT8GMAkuz+XA7Po48tYoVtgTp3e6PrOEVhEjZ8V3b04wmRVcTb2FyyzddRm?=
 =?us-ascii?Q?fuDebIXMjEE3DAablXdmUFVO3TmeaHK/5AiuaYZr+sro6x9QxFEMPsnw98aY?=
 =?us-ascii?Q?CHDqCxyJaw8H8iYhUUV6AxshvaONXu67QN4e1zimbkFidTdL/Wnkiyml8i05?=
 =?us-ascii?Q?IcSvSQ/tBdFwhUq8OJTkaDIsntSS00aYiOi5bwPZL5EFYtY8ymxr8Y8luP88?=
 =?us-ascii?Q?aF0lYV6inBknCzeScCN4R0tPzysi1mJkQ31PSFeMDQ1QeLR4W26in4NI0t2t?=
 =?us-ascii?Q?6y0TIBc54g5MQVOT8+NDAZTMW0g0OM7Sc7y64iY2SwbSrZTF5smkYcMJ3WsH?=
 =?us-ascii?Q?YLJiSNT2O0rQJfxhHgYjgHNs6S4Bw3p31/5uBPoLt+H7bKr+rDcXqz3YuiR9?=
 =?us-ascii?Q?5iLfcxxqsx2/QX8L4w053KinyJTTDtmJyWfmrKgATVP38TFebi2bfg5P984A?=
 =?us-ascii?Q?bOdgCbZMa1wyUJt5Ex7udPm2C05qOVputDJDQWHZWYQTPrWaCqJICLm/o3Mz?=
 =?us-ascii?Q?q89V4SuXVcpCvQwQ4wJTPNkqPc3SRngNFa8ws069Mkq1ZVtCl8SdctVw1xUY?=
 =?us-ascii?Q?vg14ptw4xwxwKIjVIkIHVFHaSP3VhKPQ+Q+2Te1tpU+IlIlmUNB0N3Q5fQaL?=
 =?us-ascii?Q?y3Y0LsEf7LsVr9lV2Rnl2mFBF3y3FG4S8y6fzq1blJ45hfR1t2B1xVSKqD69?=
 =?us-ascii?Q?RPiPli3IgS+DCkeU72Q1RFdBBQGbSedQQKfAdhk/Dn/D0wSLsQ+4M2BinvD2?=
 =?us-ascii?Q?dciXlRlEnuseLbiJwt2SXMd2ayEjgPQwl11jWuEZfIVQ6Y0ifbMmb/HxMv3X?=
 =?us-ascii?Q?6TNDQpWm/58bJxFR7k3we9AirLebvTl9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i40FAE80s6DCUJmzIbbNtEt5T/pwFRna3cyLH4TagwQ5YntHuxMggkxhcKdT?=
 =?us-ascii?Q?alAbeHn3X3FqCVV9vgKnSo35DnAjWfbc5oS8ZcZiLs/fCmilpJwPxkhUOkb+?=
 =?us-ascii?Q?cZRUD07JpeHQ7Zb8c+J2CB1CDHFMWsJRovOn1FUdEXakeEmg/0hwFQrTqFYu?=
 =?us-ascii?Q?kb5Vh6TSYocOW0Ra8klsTXmJ3C7S3Qa7ifg+d9bVhpzyrIDoSWWDX53cy30o?=
 =?us-ascii?Q?mHILGRV/9zOwU+2VKkkDqY5p8yISW9MVl2cKqV422OtANeOu1yK7ozvPJcx1?=
 =?us-ascii?Q?zm2cIzxRCHZV35vr0EjkHGPYFfOmloRQsid43jSu1nyov+HnpJkLm7jaJ0WT?=
 =?us-ascii?Q?ZeHSRqLjZMWTkpOk46AHk3Ta9Khsj3r6ulJxtYNotbSkyh3NAi5KqTY/Oy1a?=
 =?us-ascii?Q?hH4mBjD3sL7DlXiNvNvyzV3ak/DD9aF/PaZU2AtCvQ2Jci+Mx4wvMxFyNVXt?=
 =?us-ascii?Q?OCf5YgmJztLAV7d1YI0BRTo+LgdFKXeDsdGfP7tflDtUgoEXMSPYF47M88zZ?=
 =?us-ascii?Q?VisXzjUtHEAA61q0WNA6PeL2kl6gFIEoiLAfkbd/Py6iZ0ZWwCZCWGbPb5SL?=
 =?us-ascii?Q?y9IxlU8kpcX6gKvQWpXk/z2+hoLenDNp/+Sa0la0Dms23kLmJIDPWMOihe/w?=
 =?us-ascii?Q?Kn1JrB88e3DvP1Fuqeolg+oIjNxXJvLubKiGfrSVsnQinflkjcIaSj1eF6aN?=
 =?us-ascii?Q?egipxJGXpLT7x9lmJhHAJUd/FKmO2HxEPPer+ywbIoDqbP4ZfTKSUYFb9OGT?=
 =?us-ascii?Q?3ABxCyIhC5cgLgwcFlTGyi0Os0q/MXKO49NN+BZ5xEjyLV4abLPC3b4Juk3y?=
 =?us-ascii?Q?QuSbkY1MbbL4tdMcvkhlNOV9goSpM68RXI5KjaKYwKPiW1h/VDs5VRI3QQAl?=
 =?us-ascii?Q?6vOmdhxzpXxZXt2t75PS2ipxi4oX/O1BX79DfckZBfpJts8uU5Qx9Kcj1oIJ?=
 =?us-ascii?Q?jjgc6vIN+dR1hZSDtd6MUHEH/bILxY/tWaoLMfyNEvdQRhAQFm8+6HZWkwTw?=
 =?us-ascii?Q?FVJ01M6eylkW+BjtG+Mgl0tb4XO5fUE+efhrfy8wi4ud+cqDV0C16cBBzSyV?=
 =?us-ascii?Q?CA9p1SYTGxZJaWbZDuWvNt9fxpczXREnsMJ2k1LRnT1klYA/5/fkYHcFnBwT?=
 =?us-ascii?Q?mfF/o8Mb3MvP+h/pNU7Gs/dBLPjas+Td6U63MeKUyZV3oHqMcbzM/dwDGo2F?=
 =?us-ascii?Q?b789EnRYHm8WRghN3fbdgRiTD58PGScZp7fXZ+Ec+zf012LxlcXmZdWmaOHl?=
 =?us-ascii?Q?0UwyE+KQoHZ+EOH1eXVu+0tMBLclRsVOlSYW5SGf7StO4QEsD4JQZ5jApa5q?=
 =?us-ascii?Q?nSKDxLCeIpSlPDK8InIRAuNkRSYa9Q1rcZImOA+iaGexdtYyZp4y8j3dphqN?=
 =?us-ascii?Q?jr+GfWzgx0zeTkQOBHWf8xks/M2IR7dyN2qiAr2GuU38JAHJUn5lotEL4Spo?=
 =?us-ascii?Q?jfy6sCiNRqjBUzqA0De0b7hwKbvLwCNbH+QOvl1TDfXIpHhBL5okyPlBhsF2?=
 =?us-ascii?Q?n4tJ1LsrXR6IRYU8+XnbIDy9Bz09RQfG4nw5hyzN0mK9kcIu2+pTnwBnagrp?=
 =?us-ascii?Q?QEp3YEFtcwwOVtFc1T38qDmx+ixnbaOaVPLmgbfs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eed2f4e-7355-49a9-9efa-08dd5a76bf46
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:13:41.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f4w/AFpI9delzg8giomQD39Benv6apcT6ukA47vDgFl/0wBJ8WTXKARy6iCZUWeDxRCaiNgANAl2loVmvTHCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978

On Mon, Mar 03, 2025 at 11:33:41AM +0800, Xu Yang wrote:
> In previous imx platform, normal USB controller interrupt and wakeup
> interrupt are bound to one irq line. However, it changes on latest
> i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> This will add wakeup interrupt handling for i.MX95 to support various
> wakeup events.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
> Changes in v4:
>  - warning if no irq provided for imx95
> Changes in v3:
>  - include <linux/irq.h> to fix possible build issue
> Changes in v2:
>  - rename irq to wakeup_irq
>  - disable irq by default
>  - enable irq when suspend, disable irq when resume
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 1a7fc638213e..2baae9e6e673 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/module.h>
> +#include <linux/irq.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> @@ -98,6 +99,7 @@ struct ci_hdrc_imx_data {
>  	struct clk *clk;
>  	struct clk *clk_wakeup;
>  	struct imx_usbmisc_data *usbmisc_data;
> +	int wakeup_irq;
>  	bool supports_runtime_pm;
>  	bool override_phy_control;
>  	bool in_lpm;
> @@ -336,6 +338,16 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  	return ret;
>  }
>
> +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> +{
> +	struct ci_hdrc_imx_data *imx_data = data;
> +
> +	disable_irq_nosync(irq);
> +	pm_runtime_resume(&imx_data->ci_pdev->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  {
>  	struct ci_hdrc_imx_data *data;
> @@ -476,6 +488,18 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
>  		data->supports_runtime_pm = true;
>
> +	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
> +	if (data->wakeup_irq > 0) {
> +		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
> +						NULL, ci_wakeup_irq_handler,
> +						IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +						pdata.name, data);
> +		if (ret)
> +			goto err_clk;
> +	} else if (device_is_compatible(dev, "fsl,imx95-usb")) {
> +		dev_warn(dev, "wakeup irq is missing\n");
> +	}
> +

Suggest add imx95_usb_data, and new flags, like have_wakeup_irq.

	if (imx_platform_flag->have_wakeup_irq) {
		...
		ret = devm_request_threaded_irq();
		if (ret) {
			dev_warning(...);
			goto err_clk;
		}
	}

>  	ret = imx_usbmisc_init(data->usbmisc_data);
>  	if (ret) {
>  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> @@ -584,6 +608,7 @@ static int imx_controller_suspend(struct device *dev,
>  	}
>
>  	imx_disable_unprepare_clks(dev);
> +	enable_irq(data->wakeup_irq);

Suggest check data->wakeup_irq and other places.

	if (data->wakeup_irq > 0)
		enable_irq(data->wakeup_irq);

And you should check enable_irq()'s return value also.

Frank

>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_remove_request(&data->pm_qos_req);
>
> @@ -608,6 +633,9 @@ static int imx_controller_resume(struct device *dev,
>  	if (data->plat_data->flags & CI_HDRC_PMQOS)
>  		cpu_latency_qos_add_request(&data->pm_qos_req, 0);
>
> +	if (!irqd_irq_disabled(irq_get_irq_data(data->wakeup_irq)))
> +		disable_irq_nosync(data->wakeup_irq);
> +
>  	ret = imx_prepare_enable_clks(dev);
>  	if (ret)
>  		return ret;
> @@ -643,6 +671,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
>  		return ret;
>
>  	pinctrl_pm_select_sleep_state(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(data->wakeup_irq);
> +
>  	return ret;
>  }
>
> @@ -651,6 +683,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
>  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
>  	int ret;
>
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(data->wakeup_irq);
> +
>  	pinctrl_pm_select_default_state(dev);
>  	ret = imx_controller_resume(dev, PMSG_RESUME);
>  	if (!ret && data->supports_runtime_pm) {
> --
> 2.34.1
>

