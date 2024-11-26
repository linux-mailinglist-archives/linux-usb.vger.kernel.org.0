Return-Path: <linux-usb+bounces-17854-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2F9D907C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 03:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B1DA167338
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5372940D;
	Tue, 26 Nov 2024 02:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FcpFeVFd"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2040.outbound.protection.outlook.com [40.107.247.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238517C96
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 02:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732589501; cv=fail; b=LD6I8Bwswnt9JRn9v5yXEYW68uplFYEqbUc+QN29er9usdG2FOKjn/VT2hFpemjRxh3++h8b9f//XyKyWARtZUeTattfKsxmtDLZL3EPFbr89xHBrGP7RKn15wDW7yJYVkQ0bAbjkARPovE9cKrRaC5KuQTFX0lSUcaPCc5xgpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732589501; c=relaxed/simple;
	bh=NaJRFOtDaOd7u4O4K2CnAIYuvABpzoxIQyAJcoazMDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IK/aiB/O1jbkYU0KB71KM3y4QyzkY7VhlHKLEFmHHoNoaj3SwTrXAiQ+85OwZtMmag7thNi6Esxod006k6U80hpDk8ZZXdqOiVKNi0bzPHlrg6Om90L8E/Fuog4JVSHuqKpSce/wz59gc7mijz3lbQRngqkCAvsCVTYJ3AR6XUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FcpFeVFd; arc=fail smtp.client-ip=40.107.247.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKVh1C6RBuBjMHDvL6m0UA0EvY51Ctw2V52wGebUfNc5UbgEgSLYbeyFaqa5mCijbmH9lPqw8W9+9eSMOupI7cHaUIaTVS6kZMl+b+edUM3m2a/hLbNHEHyAh0d9PTzIf04GZ85987SFjrMKgXqZE6S/H1DIn757L40RtqylA6YKbFJQPVXD1BFyYLwsOTvClYiQctDkNj7x4Y32pYyfalvTqTtkaGntlBeSeiASavfyS814f9LaR5WvrhFsQTpJKvF/EFnHoTl5DCytzdgQkigN56iY5egj9DWuRPCSW553ZdEEmbmGWoltqVqUz9b9kWU2i8GOn4jUdaw/5Uib/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWuCQaHqr9iHn/snkitf05HWlILWxAkXRNpoWLUEH5A=;
 b=mpPMJYvfoZB8fJ+EMemlinZwKs611pMDT0VKT2agy5Lia2F40kBYL3vN/0MvFtmgY6Gx5WP2qKnYhNsj5wdMxAoqPdg8kOLgZWnr9q+71a2Ue1gE6Lmv1+Y3vthOYYHwCgM8eiA6hiS0AsCJqJJb88Gg/zzMIiHEWSHhnXCsOjQIA/WZks08tdL8Bnj5fEn945aBZkWDOwpUH4FXHBeV7HMdNX8zGduy86LYOiR0LK6NucnU6m87FYlGyXsj3bydp0J2ToFE79eiRADsgzoRWmjLqOogmYPgVBM+8NKQFeQs7VgcOkclLRK6oZVrGyAl4WYU0wJtq1UHqdF1DDLwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWuCQaHqr9iHn/snkitf05HWlILWxAkXRNpoWLUEH5A=;
 b=FcpFeVFdYCoaM5qouFBzNnCRVeFiXIPplRk3RhhnNpTpXR7ZmUJBXtIXyX/i/vhYIctvNgzya3Ptd52XR7CLTb8W7sfGM7bw20/IWhp9CcsjMgeVEvoQhn+qsiL8lDqKppMxcQZo/T0JqKj35SOsDRwE4Y+WxU3Hy83fleGzUYnDmmkddyP1ouJ+vnIBvv6zJ1oxxmNoV1fyjGZdPnANdH9DRlPBsTDRHZYc6+e8SAihmqlA75SrLYO9QRQB3WN+FDmlksqXiN+/7ewiDVWykqv+vBcN4J/x+52j0j0QNIyhbsPSHjxNNdQWjlFqMNUOJCCijfO4UGzKp9qZMrIuqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10151.eurprd04.prod.outlook.com (2603:10a6:150:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 02:51:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 02:51:36 +0000
Date: Tue, 26 Nov 2024 10:49:15 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix software node kernel dump
Message-ID: <20241126024915.tna66hcj6gd5lrjm@hippo>
References: <20241125101017.2398904-1-xu.yang_2@nxp.com>
 <20241125182724.vqw4wp7gkom2i2mf@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125182724.vqw4wp7gkom2i2mf@synopsys.com>
X-ClientProxiedBy: BE1P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10151:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdf8645-8989-4c36-f1e5-08dd0dc53e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XhPDcwS5AzOnBJNjlipm2+fKPboS4tVBLrKLKEGyUhNp+qiR+cO00LTSaC6h?=
 =?us-ascii?Q?XLt3OJ3+Ag7tgw4tP45z50euouFlAP7j9HW2vkoK4n+FTqIwYoAhY88DrhVv?=
 =?us-ascii?Q?EaJd37Ilq+FLWdRAaioA4mKT66/RU8cWAtdn1YfsDCte5daft4hYsfzv3Ufj?=
 =?us-ascii?Q?2CHmvTrKt9UBZBAC/trfFNI7ahH/2cjwmv+tauQmKYLJnr8NUM6rk05cxD5j?=
 =?us-ascii?Q?hn04B+Z2GrW+YVcFUmAmSfEyLYP4g3d4mVfqG75uAEk87gqNsUVDbk80+/7q?=
 =?us-ascii?Q?bM9bUUjeZsDoLdw/Py2DUOXFDBW4t6EF8vxyUb83vm/hcKAzdKgGh2wEZbZs?=
 =?us-ascii?Q?KSCWhDgcic7bOYk0R0iv41PDi+VFkfhP5++230kRA8KnZU7cG+csB5puvbP+?=
 =?us-ascii?Q?h3hBy+iDnCZVNz6SZyFWhkf1qYfdI9XvpduPce6ie+Obk8dvFX7ZG8LMDvTE?=
 =?us-ascii?Q?xyapwPmQdIGcO9fb4GFke97UrR1SbpCztvyDOTg0SlOpaR1Tlcc1vtUfyYuA?=
 =?us-ascii?Q?Bw5Dq0SYqn53O/jfU4wGD3DAKPDHWiuof45Sj3+qxKV4L5Z0wjNe/VctlSdS?=
 =?us-ascii?Q?UsESpUv6YSFhz4A/OqKAYorcLL5Pp0+v7gWQ41XYf2P5dWf/WyqjpIBRNYLz?=
 =?us-ascii?Q?hbTKFDV57ZA9FjwhR5mv01TQexdLbVwzSerVL4pKYmQzi43/i/0f6eDT2DI0?=
 =?us-ascii?Q?7BnnLa1i9ry5JT7ocT3qlDs0NA2OQkCYKLK18vazRgQXkdHyDeodSM/enqTp?=
 =?us-ascii?Q?1k7OTAyZ83p/2YRWTFqz4K52hn2uSA9Lmh0MSdMRuLh6GY/jFjahgNYNqHsR?=
 =?us-ascii?Q?8pdTfssM2aBw+r4oluOhP9oYElUN1xA54fVLVGxl1Wr1iKgR734bySpXHiL4?=
 =?us-ascii?Q?2RXHzQgH4v/UQnhmK0Xov23lfNRRr43ghHQudDHcM5mNEOXDSGlmZgz/hZxN?=
 =?us-ascii?Q?kmPlM2zmtR2k/07DPpM4rPzLgIs1YATyknHaQNGZmEQr11XFWzvBritSoa1K?=
 =?us-ascii?Q?tXlrniNkXhJEyWWVNxTIJCfR7Dmss8yWpMI3d2/kVcjDpsxFoYZ+wv2CDrah?=
 =?us-ascii?Q?W4zUW97Ebrucha0JtG3Y0gZylmHUeKKi6+0J6O1kp0Y13skHE8Yt2yUhFTS/?=
 =?us-ascii?Q?hx6lZjxVulrv7vp9n9dU3oDdB+bEhJv0ba1PwZuhaRXRupx5oaOrH+K/+nbG?=
 =?us-ascii?Q?DxqlepbSN0Wdl7/FTZbXVxueTreAOkkq9ol0KHMYuPyuGjEKYxsFhx6lWJjs?=
 =?us-ascii?Q?qd9v/4ikGaOoQcb/RfYLVMVsE8Ub57N54FvyEQYGKYd4sr07MgUjI8FUqV4+?=
 =?us-ascii?Q?hvrPHQfxHKjkuwLuMWcPkSgtJnfG7coa9iRyeAlbMXvIxbPFcjYHuXuLTBdR?=
 =?us-ascii?Q?qKZirfoosbqozUOtx53LB3iGOHiRfb2lE3DZoFc986HYK6yJ/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?70FiY3A9UoIIcosEW/MT4Ng911//RIN3aVc9CN5FffTDYo8fnIVcByXkPd0L?=
 =?us-ascii?Q?bAlAVajK2Q31mu7iIMMriPu+LI4L4BcFqTxCZBKTKm43BTQ7hidgxzGompr5?=
 =?us-ascii?Q?YVXH+Pe9HLgGH6w7bu0pPed0gxXR56P6N6OdShlFbmCvbgnDPfVQyONo6Tzp?=
 =?us-ascii?Q?AE8JZagDAIX2L2k3zHgWO06XaQumNiBEANBLlmUFSjuIz7fXfRsvAYmfvcHO?=
 =?us-ascii?Q?RI5keIOT5FR8mCsVvaGno5esnTp0q/ox2QZCzL7dPPsu7smifLuE1bXXR40C?=
 =?us-ascii?Q?q+MaF/JhWRukhjxt73brmGDOWDAv9jsfcIhVQY0cxzwejy1fX6uCcqOiyNGs?=
 =?us-ascii?Q?XUg1V3KNcnb6Sz9W11VungKnun9WGx6copA+P41Ts+zZgKb79Qya/VeqeQ6M?=
 =?us-ascii?Q?YtCDOnyjzL/UY5hBKRmUrlX5w3loZaCQAaZ9L+C1Ucnuvi5lVAWUGYAP7OlB?=
 =?us-ascii?Q?5KJy0yCqWNSpTNFmwtL0bGMePPHiX0SwX4+c3be70EJhF5FYUWDQDdzsMlbW?=
 =?us-ascii?Q?MTHbeh9PvWSt4TRlzPZJVF2up60PqPdtM+VY1i1BKNRVSFREUTOTze2mfcxS?=
 =?us-ascii?Q?QfzXmi7Gsm+FJ7aoqGNzMcWs0GAeG5xVdpp2qjyZWYDIyEEmprfecF0sXscl?=
 =?us-ascii?Q?xXwIr7y3GYXECsnazWDTKl+EBY75bv6kkLeVez+m0JK5yXl2uiq+DEQEw28T?=
 =?us-ascii?Q?Wtb92fdMSyVHj44G0xwOvBAxyJ4DaJo6eUed2MjCvHzRVsT+fLCKzCrcqJ3N?=
 =?us-ascii?Q?bUP9ThfJVBpQjHOTTcLEO6AxQf4L0H5t9iOBus0bpgAqH0pnw8qLkvaXcnv4?=
 =?us-ascii?Q?V5nuKlm05YP8AklJ8CG4OmAXjjwYbUUCbMV9LRzy99wmjpd7TAxtG1sxGt/6?=
 =?us-ascii?Q?Frrx345PTPQzczJDUogA9kgxRdybaAVOEMvgj7X+AILzo5MtLKdIcSTZ9z4P?=
 =?us-ascii?Q?BZuvuytEoXNXaPLzrB9mAtSQijbX3mtxS5I3huKpkYuiX6cW1lGVXElh41cR?=
 =?us-ascii?Q?x63+UG6kTiABoTF+RmelNRs3XREZdRdjVRQhopyqqc1Ac4VeQqfkz4RQDOpH?=
 =?us-ascii?Q?cpchYvO0SUGqbTzj7SjRofWFKSFKGYx6bl0W9271rHq71cHIp1g8jsoLUKpu?=
 =?us-ascii?Q?DMC3GNHSdJ0WuPENjt5zqZqJmtGTiLVt1dHXL/bjdAtmcl9O9AH71V9qN6o+?=
 =?us-ascii?Q?NORUH0Hc00nEg/t+ucWhCscLJyJBztqHi9oXcz3yyXNKijEH0P9KTfCaiP/6?=
 =?us-ascii?Q?/kUUIdbjKmguTPwo0GB9lc03efoOy4nbkkE81zpK3wUPi7r1F9C6+9ghX+Pz?=
 =?us-ascii?Q?Z2DvklCWNyjHB4Qsn3aCnHfcv59er9wFUQtJF2avU0+D9OWPQfunjV2FXsRX?=
 =?us-ascii?Q?uXtJ+6ZSmF/XGxzZd+OMEHvk//ZAm3ZHLW0oWAjYUXsghPDclWrte6Jtu2Wr?=
 =?us-ascii?Q?03PSwzW0h/6BuCD2eUHintVqz8+dkqxATLRFqfoOu9kFbt5eWMTmlZZRfLSu?=
 =?us-ascii?Q?at2SsxuQTXTQU1w3KOkxv4HGbSB2GVVBbgqiXaSx5+kkVcmZrgJ6KpjO/my3?=
 =?us-ascii?Q?fotoS+l5BawBV01Gtf9BdS1Yat+zTmXSdvJAbykP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdf8645-8989-4c36-f1e5-08dd0dc53e12
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 02:51:36.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cbt44bU9+jxYNEVRiv9ziTp625VAEPTJb6z1ROlcl/nlvl5TCuGv7XeP6vKg2MgSFRB6exyv3kBcp6pGVIdzeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10151

On Mon, Nov 25, 2024 at 06:27:23PM +0000, Thinh Nguyen wrote:
> On Mon, Nov 25, 2024, Xu Yang wrote:
> > When unbind and bind the device again, kernel will dump below warning:
> > 
> > [  173.972130] sysfs: cannot create duplicate filename '/devices/platform/soc/4c010010.usb/software_node'
> > [  173.981564] CPU: 2 UID: 0 PID: 536 Comm: sh Not tainted 6.12.0-rc6-06344-g2aed7c4a5c56 #144
> > [  173.989923] Hardware name: NXP i.MX95 15X15 board (DT)
> > [  173.995062] Call trace:
> > [  173.997509]  dump_backtrace+0x90/0xe8
> > [  174.001196]  show_stack+0x18/0x24
> > [  174.004524]  dump_stack_lvl+0x74/0x8c
> > [  174.008198]  dump_stack+0x18/0x24
> > [  174.011526]  sysfs_warn_dup+0x64/0x80
> > [  174.015201]  sysfs_do_create_link_sd+0xf0/0xf8
> > [  174.019656]  sysfs_create_link+0x20/0x40
> > [  174.023590]  software_node_notify+0x90/0x100
> > [  174.027872]  device_create_managed_software_node+0xec/0x108
> > ...
> > 
> > The root cause is the '4c010010.usb' device is a platform device which is
> > created during initcall and it will never be removed. So the software node
> > will never be removed too even using device_create_managed_software_node().
> > This will use device_add/remove_software_node() to improve the logic.
> > 
> > Fixes: a9400f1979a0 ("usb: dwc3: imx8mp: add 2 software managed quirk properties for host mode")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/dwc3/dwc3-imx8mp.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> > index 356812cbcd88..edd544c6e1c1 100644
> > --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> > +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> > @@ -129,6 +129,16 @@ static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
> >  	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
> >  }
> >  
> > +static const struct property_entry dwc3_imx8mp_properties[] = {
> > +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> > +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> > +	{},
> > +};
> > +
> > +static const struct software_node dwc3_imx8mp_swnode = {
> > +	.properties = dwc3_imx8mp_properties,
> > +};
> > +
> >  static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> >  {
> >  	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
> > @@ -148,17 +158,6 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static int dwc3_imx8mp_set_software_node(struct device *dev)
> > -{
> > -	struct property_entry props[3] = { 0 };
> > -	int prop_idx = 0;
> > -
> > -	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk");
> > -	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
> > -
> > -	return device_create_managed_software_node(dev, props, NULL);
> > -}
> > -
> >  static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  {
> >  	struct device		*dev = &pdev->dev;
> > @@ -221,10 +220,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
> >  	if (err < 0)
> >  		goto disable_rpm;
> >  
> > -	err = dwc3_imx8mp_set_software_node(dev);
> > +	err = device_add_software_node(dev, &dwc3_imx8mp_swnode);
> 
> You need to check all the fail cases after this to properly remove the
> software node.

Indeed. I will improve it in v2.

Thanks,
Xu Yang

> 
> BR,
> Thinh
> 
> >  	if (err) {
> >  		err = -ENODEV;
> > -		dev_err(dev, "failed to create software node\n");
> > +		dev_err(dev, "failed to add software node\n");
> >  		goto disable_rpm;
> >  	}
> >  
> > @@ -268,6 +267,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
> >  
> >  	pm_runtime_get_sync(dev);
> >  	of_platform_depopulate(dev);
> > +	device_remove_software_node(dev);
> >  
> >  	pm_runtime_disable(dev);
> >  	pm_runtime_put_noidle(dev);
> > -- 
> > 2.34.1
> > 

