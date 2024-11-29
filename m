Return-Path: <linux-usb+bounces-17963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490A9DC2ED
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 12:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A821E160877
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC0814D70B;
	Fri, 29 Nov 2024 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f1KlenDx"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2951132C38
	for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2024 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880003; cv=fail; b=So2V2gwzX1LrdIboNzkWNXVAGwW/FUePLDfXyljnYCZwvVuuvS+bhD8v8QnCHdjAuJSI5w3OL2EyrIVLIgVME8xeRsZQhFdFjIjtbUSlL5E7dU/F2kGI6STQlB01wMn5lJi3leedsIm+EmZ1NP9sDRg81n/jIHmPyrLqNmG+dZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880003; c=relaxed/simple;
	bh=By4n+gGaJQSKhKjr+end+S5NxwfqZDwKcdouZurWoow=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=K+jl3+2vq7/9x2IQC/KcpCpVOTef62Y6frm+C4xtciCFfWvVuREZBaLXkAbY1x2BvZnMnHF8yiOdycCCUMByM5KL1CzUBiwocfj+B9B3/l1VFAEZ2nHK/cuJDSlSuNt4OZTxNkqS94rKEpvHtriLIDGMty5EP/2LUZU0fSdyVVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f1KlenDx; arc=fail smtp.client-ip=40.107.249.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHLTuelPZO+oRFzDMt56NADYBXYaSvfPphIo6rz1Bg/4rqjUl52Io/e2wmyfoBl60N18OGNfxSDkPThN8nQhLyoggWCtOlMInhs8BQN2TwflwBtrHq+mXSZNCLmkYs9ALgdMEhX8DXuK2/S5n0vFTgCcoPg9K2bADOqSATB/V32i3lsDK+kC0Mgd7L9Fnl7TsbhVrq2/UrWW9UmdSyQPv1yNEtyYfDFK7H7TrFa3ERJccj8s6z/B5Jet2+6bAIF95OldKLLuRwm+XtwHI+ckqlm0XovoWgTWzzbPP7rG3kp4nqrTc4EjQXAKXffMGo+wcHeBSCE+d/7kroqwphip7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLfjtOWY9Mn3DB+VZb0OaOv0omjEhQBSyDXC7/zaoc4=;
 b=W5nvSNgTFHWdXgrLLPIcbBpaMu91vbLWvWMfyEDvu3/a9L+aL5AiXq00QX8y3ZqEeU18yi5uGxRY6gG0yABgGNkv3/y1Ju5vfJMcpD2YLpUpxNWvKY9ci51jDwPk7qycqDdfiGMeHvCTEXq6QUBFgC/XPKgD6TKrbz+No7VmYVCq34b5MTX6oBmuZ0fmEscsuqjCWVxwUi4s5Dk6YKVMQ6NVUbVBCH9U52nVczeh2bgdWvCKAAHwe4xXXrIKux0CBf6kQwJvDpbExfahs18ISwnExMz1n8mUdtREs8rok0M0dhJj8sbCVSvx367LG7KwXHJy9jqiZW/PUGZBI6xEAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLfjtOWY9Mn3DB+VZb0OaOv0omjEhQBSyDXC7/zaoc4=;
 b=f1KlenDxqoBPUyH17qxPDkcUUMvhOtLbuuRWKyiOBBrAhwQiPREBs5OJjhnIixTrjpHeM9zs9nLMxYlBHgyt+/5o2GyNrqIY88yL7STnKzcg0izRcHGA49E+Jo0J2dDykTdLhYgM24caDElS0aFBMIu0dALEQJyNEOSqo1GStztGQrwdzRnCO2Z/BxfWmBX5uQBNFgY+Gd222lWB6mo2bSAz/ZxvsAm21HWpZBVZzyYdM7J+Ni//kZGFG0HTPDQEJ/cDtu7rF8vF6npZeiiszCR3KJqEHlr4d3UTaIdx6lfXAf/l13rl9MK1POFlGeXRvaoTldXJxnT+zP9GENAi1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10826.eurprd04.prod.outlook.com (2603:10a6:150:226::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 11:33:15 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 11:33:15 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: host: Improve port index sanitizing
Date: Fri, 29 Nov 2024 19:33:18 +0800
Message-Id: <20241129113318.296073-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10826:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce5f502-18ea-4015-6ead-08dd10699d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/6aJIkczYaJxr6XG3LXChmDsXiwoEa7h6WE18eNXM50w0o9GQPKEqPij82/0?=
 =?us-ascii?Q?w2zHSe2Y0UkCHZ6DxFeU5/k3CBOVK02UMG9httkDvHJvAubl1/t5KCMkjcJ3?=
 =?us-ascii?Q?O64JfEBpyO+YzHKRysNLUFHFzBcK8SkwNU6ijK+L01a5mYTU3mW95FlZyahg?=
 =?us-ascii?Q?CmdBy9xc5pMmzF5hLodWMonOt1MmyzJRzU+2i6wc1tX3qpCCITn6XfFPQhUj?=
 =?us-ascii?Q?Be5sA6jiAMSnsteYxAaVWulrCdS6wASILJZkDpWFGaUGSkarZEQGwn47XTqL?=
 =?us-ascii?Q?Ftwo7igqsArYiIBsqYhU/AbsDX3o5etVdl5aPEkWiI+5DchpGR4O6BERoqqD?=
 =?us-ascii?Q?q344BqWyjUM5efsR5k0xkXAfGwzJGggXwLbunhlwN8KkMZeg1bBQULU2hTFf?=
 =?us-ascii?Q?m12UjAlMJw+0Loanmytosw9kaPqeEnoHRAEwWvrxIOoszYpowIwgguv1+qd2?=
 =?us-ascii?Q?5Tv5YwnvE5g7v/KLDgEMz4uJY+QEUyapH2YUgIhtfJBkXpLR1OT2pXiuD5cn?=
 =?us-ascii?Q?ejN3IDGlxrLFnD9ObuqykUyHemI17NWZq5X7FrsU5jmoCrm8XoSNTdvl1/qI?=
 =?us-ascii?Q?dsnCEqy717jUGczB0MXZWb4BQbR7mc4ATM23QOcpJt5TBbF8cTdV7O0CFlD5?=
 =?us-ascii?Q?QR5rwEiHISm9anwLZeedqqRmtCWs0r9tzErGOyisvexPtorRPkEC75NIhtmI?=
 =?us-ascii?Q?YEYUh5AZ3JfFux1hWX49AuUBGwBU9VnLWW9l34nq6N0/1kysotdE/5EZbIbV?=
 =?us-ascii?Q?XFcuWwanIqiXspBh4cgUmPnGpBUYtKoWvUvMAFNj/Avr7mFIbdU2lO225SvQ?=
 =?us-ascii?Q?jzApgfXYD43LtXtmazsT7r8fr5vGnjzdoTQoUR4Tj6xyJojLSMzciFhtOW/J?=
 =?us-ascii?Q?ecZrcAyecTFGLZUk/ZFyV3XMitfFKhMbWsrgeiyD5kcVb1ETyslgj8SDF8Rl?=
 =?us-ascii?Q?VZk0HbHMOP38d1IuPywTWEuCvZ31B6G+1mLN6pY1V0l5/m8oECCDLCv5TEiy?=
 =?us-ascii?Q?16Ge1Y6z7Zd2bBE0XM8ov0+ccAJKucPrqukeitjP6GJxbh14SPUQIYb/rwJP?=
 =?us-ascii?Q?GcEF4gnqtHBxHVjdsbSJJldTO3VWOoO0eTAuJck+JT6nNHgcD0yDO6ZNsXMd?=
 =?us-ascii?Q?chIiQxluFBhrP3agkFRoFnUMxvMWevWIcIsMqGXhx4QRp3aLM+P3sE8d/dFh?=
 =?us-ascii?Q?HwMwoZe1WIwA4yd1BhzHq9iA3/1QJ4dg2LuOWtG1eWEsN4+QQGe7Iy22h74v?=
 =?us-ascii?Q?ytO5rpPszBnPlcLQrqtT2tznNZbbadTTLBgzzamVkoK7lDAHLVdMgTWrDHBE?=
 =?us-ascii?Q?BSJe7EvSQtC4MsmClNYqJa9j5ZzGZ7Cyc8MoeeH9kIgLhmALIc6tfRsCWXXs?=
 =?us-ascii?Q?9lThe1Ca11SzmjIar9OfhYRf51okk+8JeD6Wo2T98UfJb4MtGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eToDV5uQJXcCUWimUOUewU8F92eQJq5OcxIC3c+cRRzs6o1Hv6i/1plA774R?=
 =?us-ascii?Q?wdtRsPvqUx9KGf57uL8nbJgKEYi3ux6Y6Yvm3JHGt+n/sDghfbKkbHcqeauD?=
 =?us-ascii?Q?epKotpvrE0Dx8OUvzKmAgqkJiQtPMTVazRSxX8P9XAhj1lTKxCdCb6Hy51Xy?=
 =?us-ascii?Q?EIK9ykfsFsbMS/upydB2sgFgN2nl+8q7Zs09gZ2YrpJlchqfDMpbjyYvg2yq?=
 =?us-ascii?Q?dW/pnzbhEIJEEpRsOkZhnu700Wp9bPS+v0uEA1KG262oLb+hqmeQNx+Rh98G?=
 =?us-ascii?Q?XXxdmVber4YKV+rDoFnbr0hvD/diyUp+eN+Gw6uoy4tugIuhWyp5tZqD07Xy?=
 =?us-ascii?Q?79wmDydMmTbWlyd7vqZPJZGnhitbdmGnSoXgTxVWzBiwwQe/5o6Rvw+IU5+L?=
 =?us-ascii?Q?vmxmHWGb56qelD/scmsWpu4wcn9oyMcw9lRiZgHr9E3XyVXLnIzq/I9QdKHg?=
 =?us-ascii?Q?ik+oi2Cnx047sR5JM8dbWTj8xGZhOiHWanS+VoB7TbTyXPt/kYYQ5NV0nRvY?=
 =?us-ascii?Q?8z1AcvjDQfSO94id0s6OmoQPdZzdOnrYLNsplvH/Aos8nYlVHY5nGfzAq8s4?=
 =?us-ascii?Q?GcIxRYS5IBhdD+3BjVSTpqFwikRRSyOd1PDs5nICe1ylrVUpImgtHysMUMpq?=
 =?us-ascii?Q?Te9foJ2AZzbyR3OQyLCyRInP+/7YyxDC2WzsTYq0nSaJacJs4wughcivjdrV?=
 =?us-ascii?Q?O029guZnvLP64rP7hSJBsPvNQuQzNygRqXwRj1MhY/Cnld28F9mok2VvEDtZ?=
 =?us-ascii?Q?S9/mIIWM4LeneumFQYmWevrsNnJHDXcHUoj5wzcDBM0NeQgkeT1yXn25KHZz?=
 =?us-ascii?Q?NS/BYzXob5/n490unU51EPixWqqKa9tD5009yilN1P8szuK+VqexIoUoJR0W?=
 =?us-ascii?Q?LfxrIbfOpyvTZxJUzI+OL96pFlMoUb1b6Cl5RsuWcYKuBbsLHeT3dimZVfP3?=
 =?us-ascii?Q?ytJqDsX4D0NCB+/gQTiqFf8NTlzXReMoK/ZEg92mk+NsMFWj5VdzpFGSpADD?=
 =?us-ascii?Q?a3RWXDzAOq1fgmM6WUQ7ZmKvje+OAPa2DWwBHzo4NmlxIXj+mn4nGq2+w32I?=
 =?us-ascii?Q?BpQbH7Cx8DOjxGYCO+GjGq6g7zpC/r9zXE4mbCVNqhJhN/RWuZi+GKO9f9y+?=
 =?us-ascii?Q?ygJ73U8oQu9iCKbX+3c44nvNy3PB/r/i4frSQU4cbSmo9Cf4kEVTgIFO5Q2w?=
 =?us-ascii?Q?wZRB8sYiQMDexjr4XfTCsdNyD3pxPJAsofqGwzbYvcOQdshGsVHi4wccnn9A?=
 =?us-ascii?Q?lsDA5RuACezPd4OVZ47UqtIydtQm8PXltueTZGZ/ZYMHaSaqqxzeuSjN/zDv?=
 =?us-ascii?Q?zKeG7SZ/8Hm+voXKCENaJXRoHBoqF/ZJirbbPjRFN5J49dAuDi6oMUsiC5jc?=
 =?us-ascii?Q?eyxqtZ9g6Gl9uAyjJgNPhhWGnHa9vGjYjVSIERhrQLGpyCHtP8rlZdgzaZbC?=
 =?us-ascii?Q?YkD9BubJOwd0gQQfzlqNQj1GYZOz4sfhFOb+J5u8VJPIiiezKuBh4CcW2zW0?=
 =?us-ascii?Q?yVfPcvySCsgNo1CflRUZVx6ZsdauQtSLu9/zKb5kqcFyxhzxHplZJK6kzjlU?=
 =?us-ascii?Q?8beB4ao1fRDdE2IYpOyvylBP9OPIYsC3rkiEhWaH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce5f502-18ea-4015-6ead-08dd10699d4c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 11:33:15.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEET14COpLVnhb60efFtVKC7rpJ0D8j1aiMZi9kw4xQ1pOUz75GpGgjNhsR77+5fkCwAcWE4MkgJ0x9Zt0IRog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10826

Coverity complains "Illegal address computation (OVERRUN)" on status_reg.
This will follow "846cbf98cbef USB: EHCI: Improve port index sanitizing" to
improve port index sanitizing.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/host.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 0cce19208370..442d79e32a65 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -256,8 +256,14 @@ static int ci_ehci_hub_control(
 	struct device *dev = hcd->self.controller;
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
-	port_index = wIndex & 0xff;
-	port_index -= (port_index > 0);
+	/*
+	 * Avoid out-of-bounds values while calculating the port index
+	 * from wIndex. The compiler doesn't like pointers to invalid
+	 * addresses, even if they are never used.
+	 */
+	port_index = (wIndex - 1) & 0xff;
+	if (port_index >= HCS_N_PORTS_MAX)
+		port_index = 0;
 	status_reg = &ehci->regs->port_status[port_index];
 
 	spin_lock_irqsave(&ehci->lock, flags);
-- 
2.34.1


