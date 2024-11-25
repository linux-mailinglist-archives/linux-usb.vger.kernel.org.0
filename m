Return-Path: <linux-usb+bounces-17840-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E144C9D8B75
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 18:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A6C284B57
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 17:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922C51B85D7;
	Mon, 25 Nov 2024 17:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k+Aq6zIK"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06B51B4F2B
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732556435; cv=fail; b=eLjYJfMOgUqDzdQRQqJha1Q+RCpW3AVBwYwtY3WQjg2RHw7TO4v0g5JzRvzasXniaPdxFI64w2oMGoJ/Nz4/8bGwg2LXaGTypliuXlFTh1HBzSd4Ojki2jt1nSbAz1b0roWX4IRDG4h2xm7iHx2G1wzDH9vZz0Aj+Lh1oO3uYq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732556435; c=relaxed/simple;
	bh=VrzDmvfyX/NLpv3s9IQXG8vuJpAZB367Gj744q+viAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBc1ChTEBjoVLYkQ8gIYh3ohC4j1r/RpzWL0Idrw8pOLl+BT30dvDXEc2xf/q2DV5IxN2+20LKBgwy5H/0X0qdD+WaGVH2fa5gaMrVw0ZmEq60CvFgZ7dLXSPRzQY2iV0q3zr4XCglRkUcS2X2hSb1pk/O3HZLWiFJJGpPSPV8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k+Aq6zIK; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeVFmsUNTPV3I/4pJFnstClKGWs/uj2GRrjCwHW6uVKlb37jtsmR2ZlA2yXcPejSTRNeZ0MXS04Fn5mb/P9OsCrDms5c/QKHub10EYptyFukohYToVWNPD8eSPDZjcOvk1xwkEHLdrvq4yA4g8L9g2y89BCKJZ9rgzt+ixQkgWmKUxnRgJp4vEy+sMvS1ZE2bvpBS9t43oWYcPxiMH0wTUPNLG1e7Ehn1wr7k/OwgcnK0qg91JKSaEnSpG2T9R1mnOA3yEhPgukjOs0TNM0TshUD33uZo3QvgrsypvD0QeetqosmOrkLoSYnu6+4eAq/LbPNuWtUMGAItXW7yYZ7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u3fSYTpiqBtXcZeQkfF8gZ26zrdUmhl/BeI3xF1auQ=;
 b=dkEAeFydGuSBVPcGSGa9Dndnfnt0zIWlbttvuLB1TEgm+bA+C5wUG21ZqfIH6UPIduKv1zmearHLSyw0jPfSMMBv7bT7pE2gfEKaMISNrawZufU1fQK6ZVP3JUZoq8AEDrntNHGiGp1/lRLjKYxw7b6s9eSQ7jVPOy/TBhdKee0MC0Q0VyapnbU+yO1iE/BBJWoh460VUjeAnWVpqLSkmh8lz6dU/ENjt/1gEon0StIWdVCbCUc+GiVFe6xR7j9rXTA4SwLX4+1nlBwWGDq5WfMa4EmEfhHtyusg+213kOtEWwtdjcAnoFxrs3HxiMdjrhtWr9zKhFdNnX2HVEJg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u3fSYTpiqBtXcZeQkfF8gZ26zrdUmhl/BeI3xF1auQ=;
 b=k+Aq6zIK48Lhg+Cbbz0E6SzHPZBTNStvAbS1lXxlsj3wU9AcdTsrOPGFzuq5g8GGhUjv2MDJX9xDySB8/0NmOD3gfIbwrgcdGp75kapQe8blMgtgtHE6fcLTw2JfoZuhpzCYC3XK1+l91oKO7kzy5+TowJ90k+ihw+ieBMzRXmrorZm4uMH2A4CvurXIP2+gD+k+LoVyxwEkz6xtsdTgsugDGpBwSFKoTqr8ROT6x7hfHj+31ZDsafbiZQjmAyunh8RmawJoasdcCuLXbx+EtkbIVoL8rVYzi3/3HI52T/ECk6JTTFStargCUHo7SurvP8ovRdNkqBxYOyOlohZPbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10363.eurprd04.prod.outlook.com (2603:10a6:10:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:40:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:40:29 +0000
Date: Mon, 25 Nov 2024 12:40:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix software node kernel dump
Message-ID: <Z0S2GtHltFC08Fui@lizhi-Precision-Tower-5810>
References: <20241125101017.2398904-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125101017.2398904-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH7P220CA0090.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10363:EE_
X-MS-Office365-Filtering-Correlation-Id: 4030adb8-58df-42f4-2ad5-08dd0d784138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMB+P8H5+qhmyR6PKkqO7rahRNEfixGJgnQocJ9lCKGfgA65jghutgkulaqB?=
 =?us-ascii?Q?3oHNGHwKEOXRXBhqSrNltdrzpXEuvmmRomn8ynXxN/BOZc40iajROyiIdy6k?=
 =?us-ascii?Q?t/9sh4qP8+BYCVdIOzZdN/H54koL0dUSFf9npo9JFMGJx0PNvCouXxyv/3+U?=
 =?us-ascii?Q?Q0/7JVdnlc5WdWCsKZcRHTkTeAsD7N9JgEjdlxqlimUtX5FIPXHv5Mtw9mOG?=
 =?us-ascii?Q?Qvlm3D1LUis5nbQMsx1TN3kpRUMfLn0oz0xRPI380w8EONoP8JT3m1HlAHNc?=
 =?us-ascii?Q?C+czU5l0sF7yVQDl8U6r51TrWz1rWywZcOggCzezjy3buYf0313R0dZHQqo5?=
 =?us-ascii?Q?UarGLnyKBlhR8cDyic0fzVQU9qwqlGAG4ejNIITStdrhIDMIooed6FTj3sJS?=
 =?us-ascii?Q?GJWRn+g575+iZRBPITLtH0BUFAW+IY4EqrAfh2dvVA2dh95lRm7gyVZ8iXWH?=
 =?us-ascii?Q?HbcqiViiknYH7yIpYzOVHvl1dgI4GpGgJ0J6oxiiHpKnrKDgOeDN8BWcZFc4?=
 =?us-ascii?Q?qi33rtjOI/iUoXxoua5FAVIAdxE2mbLBF2zvILxxH3DXbMNzP/WDQWxO7G6/?=
 =?us-ascii?Q?4PWR9g0hsDKFxkv1WlVHz5jNQLfcL07shM1aLqxE19IMlT25aY4rrv9Sm46J?=
 =?us-ascii?Q?Z/yUBBc5AGsCDR57aAzAL55g+TcRNOOlovNL/EIJ+sVfni+HWOauv3pkDBjv?=
 =?us-ascii?Q?rS9M9ZVcmCeZsIsP79/nTzm/X/p6f1jpBG/RFn4Lmqa5A/7yDF6pJuL3bW6Q?=
 =?us-ascii?Q?TCKt4xWrayMBiqODSckpZyqGYIsOM6q2NeRqDwnzAOfmuhOo/T9Pcm6UhX2N?=
 =?us-ascii?Q?WnQAqR++px+K/M/RaPQuQWDJoirbb0PFtTfcJrtqDT4fHwqVutSqGsYE4FBL?=
 =?us-ascii?Q?K315gyon/oDjq0kJQfBNgm9JBatopr6HGLKJYUZBtsfKIO66lzkzqa1gOyO6?=
 =?us-ascii?Q?twIUHjhxoOWLfEDdpbp41ZiQ7eWYi1iyKgZmEZfW4Tf8A6T9evvD/wiUPUeQ?=
 =?us-ascii?Q?4qfjQBPtLJ+IrPADHSUQAXTXI8OE2EWS6cOI3xJccUOQD34Iv3h8qYvCEiWv?=
 =?us-ascii?Q?izpqjgv+fUSrny61/vq3fPiPKzoXl/vIyHIPmq0V/4GhIAJi1KxVI5kPDCWG?=
 =?us-ascii?Q?Diw9SlQc1EsHsSdWyGw25Rx1rmuzch/evrRN+pE/Y0CeabnJnepVd39UEJh4?=
 =?us-ascii?Q?TCRnCUXmU2Xrxom9+6z1Ikkvn7LLCT5/X13IqR5nbzkbHAlUo//Xfn9GEJQB?=
 =?us-ascii?Q?webFGPJ3OcaudH2izvYW3fOtxOFnNMdsLF8uiQWMJ1SSOpqbv3wmx4HFxmUu?=
 =?us-ascii?Q?Y5pLTC7pGnombi8HAYVz0XepsJC8Be71Hu1uxzsZkQKhHZV6MbX3e28YYEkL?=
 =?us-ascii?Q?ROr1UiNZdrVTn8F7Vn4pQ6SJbv3gl9WUeUl3dd53+7T79kJHeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r98secLuknXpjC+SN+PSdyEf/T8H1kDXY+j1ch3241Wb+jdgA58XjTJ7KQJt?=
 =?us-ascii?Q?Hq+Vkmx+3vjNuFyBy2Mw3KWmyVP20lBhFQSglMLJKzne8XYqMR3HdA+ukAc4?=
 =?us-ascii?Q?wbjSPhUZasojyyX1Aonsxkhjzk7MsUQkx0pBEIhaYHWwSwSEFvApurtCV18F?=
 =?us-ascii?Q?TSw2NdAxEpwACK5EKrtpSOL4EybfC6djIvhJogg8JG9txGqSQfDCTnwTlwcL?=
 =?us-ascii?Q?aISc3ylmh9F/oCk8Wj8nTse+q3Zjw4yXWCZP0M/3WVQp3NR6EHIt+7SOe7K9?=
 =?us-ascii?Q?K06vOj67ly48rGvwZswFYxP90UFDciyTvK1S5Tq6Uzj6N375vSTNDDxj+RYd?=
 =?us-ascii?Q?BKdMYCKIKunrhRTBNCED/89FIWG3F4YguH8BQ1fl7ErAXlFJFOCdXPp8mIRH?=
 =?us-ascii?Q?qe3UDP8qHKYSvprHPfTENJ0DPogcuIWEtu4V9ZiMprVUXQ4jCX3ebDmTawfU?=
 =?us-ascii?Q?RQSiuuSNN/KPuGyJTt+L+UXoel+lZH6/vWgJ5o6ap1lW53gX7a2li+8Wfk4x?=
 =?us-ascii?Q?bx94b1iQkPl4TwWugcOpfsGyl4uRZeKgwZQS1avh5fYX3M0z8gpW4Ghv9o0f?=
 =?us-ascii?Q?w81uthQdnF7fIRoeB8mdHCsefMY4xcC/8kjlcu/Wab9WYbsCtKk0tHzDHQqf?=
 =?us-ascii?Q?f+pn3FiMloiNLIc6+0VU3Dls8PM/OZwwazxR71RwUqMw5E4WbrMoWy+BXPYv?=
 =?us-ascii?Q?mDp8BrP8w2DvhwPbCLj7t8ldDjAxXx/F0uU/THPWRHQHdaun3+FIUPwG0/Em?=
 =?us-ascii?Q?PkLQKLbSv7wGhskDL+tgrHurZFdz7+eEip3o+NVe0ghNlp2HfmC0+ycAe0sm?=
 =?us-ascii?Q?npeN6FJircL2CZubzrWkrBNLMkcmOYDVNLcLcah/y/VqoD4njYq2yKVaNQRx?=
 =?us-ascii?Q?rV5Zuyg49Co7FBAohMWPlog3rMRx1oKlWIfmoy7z4nF9HR1t4+kWrcoDVgYd?=
 =?us-ascii?Q?AdZyqOHMG/aJpgnwpuikUmUBSr9xDVUy+V2gsPVR0m8fADZZykfzdriyTgDI?=
 =?us-ascii?Q?a/zOw3+oiM1SUL5xALVYqGXXieLcS1g1ZYEwCllVWe9YrlBJ8rcwvBwb0mAi?=
 =?us-ascii?Q?wdH5Vycvnl5ZSQ7rdT5Vwr1VNv/yBJQ2Y4sMczDIR2IqviC3+NgMGroCVBCp?=
 =?us-ascii?Q?1/bzxJRVQfafjN3esYjsbyjgu1eb+QIa64VH1wccqN1pOwvz6nfUz7fb5MGA?=
 =?us-ascii?Q?RHehbfK6nseY+Qw1kYa/YN98svqpBCffdbSOpk5El0qgFoCDL+m6p8WPyh7i?=
 =?us-ascii?Q?CnPyE5Nbu92LYvCxwwng9pGNRVar445nrFNgo/UJsHgSqN5Wwj7GsMHPmrdH?=
 =?us-ascii?Q?RpQoawOZcOW7eW2el+7Syw0ltnj9wijywepHL/AXG+hMtDDiNwhOAfEsaOdU?=
 =?us-ascii?Q?scByZLlJvUL5p3JKnss0OcwXnsz8n6lv6/cu3+jVoyjmkIDIHLidk0KGMFvO?=
 =?us-ascii?Q?uMPZDMLQBzjrbgN0xaF6Ps0dEp/OGd2u74Fdi29xaLxyqsK35tMvvJ326Q8G?=
 =?us-ascii?Q?HhVnGeb+pBb5HjFqVXoWSOn0NoYxCxKCQl3cDw2eAiB3Z8oqkb/Mi42LzUws?=
 =?us-ascii?Q?2jlAixwUSKw3A7QKq/w=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4030adb8-58df-42f4-2ad5-08dd0d784138
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:40:29.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMilmqQfTF8HhzQvl14VJh5flGQOVgtkZ4/wePHeFHNanHojhkRjxxxxdyrf5ZhydCqR9rIfAii0FiTttGgQAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10363

On Mon, Nov 25, 2024 at 06:10:17PM +0800, Xu Yang wrote:
> When unbind and bind the device again, kernel will dump below warning:
>
> [  173.972130] sysfs: cannot create duplicate filename '/devices/platform/soc/4c010010.usb/software_node'
> [  173.981564] CPU: 2 UID: 0 PID: 536 Comm: sh Not tainted 6.12.0-rc6-06344-g2aed7c4a5c56 #144
> [  173.989923] Hardware name: NXP i.MX95 15X15 board (DT)
> [  173.995062] Call trace:
> [  173.997509]  dump_backtrace+0x90/0xe8
> [  174.001196]  show_stack+0x18/0x24
> [  174.004524]  dump_stack_lvl+0x74/0x8c
> [  174.008198]  dump_stack+0x18/0x24
> [  174.011526]  sysfs_warn_dup+0x64/0x80
> [  174.015201]  sysfs_do_create_link_sd+0xf0/0xf8
> [  174.019656]  sysfs_create_link+0x20/0x40
> [  174.023590]  software_node_notify+0x90/0x100
> [  174.027872]  device_create_managed_software_node+0xec/0x108
> ...
>
> The root cause is the '4c010010.usb' device is a platform device which is
> created during initcall and it will never be removed. So the software node
> will never be removed too even using device_create_managed_software_node().
> This will use device_add/remove_software_node() to improve the logic.

The '4c010010.usb' device is a platform device created during the initcall
and is never removed, which causes its associated software node to persist
indefinitely.

The existing device_create_managed_software_node() does not provide a
corresponding removal function.

Replace device_create_managed_software_node() with the
device_add_software_node() and device_remove_software_node() pair to ensure
proper addition and removal of software nodes, addressing this issue.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Fixes: a9400f1979a0 ("usb: dwc3: imx8mp: add 2 software managed quirk properties for host mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 356812cbcd88..edd544c6e1c1 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -129,6 +129,16 @@ static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
>  	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
>  }
>
> +static const struct property_entry dwc3_imx8mp_properties[] = {
> +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> +	{},
> +};
> +
> +static const struct software_node dwc3_imx8mp_swnode = {
> +	.properties = dwc3_imx8mp_properties,
> +};
> +
>  static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
>  {
>  	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
> @@ -148,17 +158,6 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
>  	return IRQ_HANDLED;
>  }
>
> -static int dwc3_imx8mp_set_software_node(struct device *dev)
> -{
> -	struct property_entry props[3] = { 0 };
> -	int prop_idx = 0;
> -
> -	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk");
> -	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
> -
> -	return device_create_managed_software_node(dev, props, NULL);
> -}
> -
>  static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  {
>  	struct device		*dev = &pdev->dev;
> @@ -221,10 +220,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto disable_rpm;
>
> -	err = dwc3_imx8mp_set_software_node(dev);
> +	err = device_add_software_node(dev, &dwc3_imx8mp_swnode);
>  	if (err) {
>  		err = -ENODEV;
> -		dev_err(dev, "failed to create software node\n");
> +		dev_err(dev, "failed to add software node\n");
>  		goto disable_rpm;
>  	}
>
> @@ -268,6 +267,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
>
>  	pm_runtime_get_sync(dev);
>  	of_platform_depopulate(dev);
> +	device_remove_software_node(dev);
>
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> --
> 2.34.1
>

