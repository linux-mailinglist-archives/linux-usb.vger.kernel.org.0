Return-Path: <linux-usb+bounces-12445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9293D251
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 13:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF8371F22098
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 11:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377E817A93D;
	Fri, 26 Jul 2024 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k59mmxVf"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3E1EF01;
	Fri, 26 Jul 2024 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721993521; cv=fail; b=UborvTHIdW4RzosaCNgqYF9HCaAxTp0unY6dR0jiZxfj5vSZX3IGsmdlXM18c+m/jTagxHbArYxw4uH7RzTv1VhKyWwW56w9DP+3JOAuFM6NTtaylQncwKPaFCYBB44/bFMOLB9h3kOB0U1YlWmCxnBaxhyLrJ8T3OEDo/lRNmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721993521; c=relaxed/simple;
	bh=gIUhgs4AMHVuSZYgp+TUGvPuNHABTsr4VFyBSl3ps+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cUD12pp85GQ/t35b/nr8IMbcEvscfu+Zt7k1uIfygr18AicAVbDIZJQ8eMWKEpdLSmZfAaM6NuQzEHPDv6qVIrMb7enEvo65+T/HEllfmGKb9YwBnP/yZTPVhHb7D7hkqkFRcPGO5O9q8yteAs9Yu3/tyajDdrqD4++79foEx4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k59mmxVf; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jstDzqRtk1Q8J8OOimjeEadH1nAtSBeJYHGXotsZnEjMS0khoU7FHZn1zb/9QLvOOKDvpdtL+QFk2CXpblsi2LmBj7BS9y2W/UKQNaGQ1MeEjqgxTG5ecSw967rTsWZ3BVQi9r0liS0cOYVgL/g+77TPqZsZQbVPeo53R7dsrVtqX/NSKJlL1VcdOK2XelwaO81JV+u2sqzrPrQA1iXePZ69thwrb5PMvabj4TmTykjy2irND90FNEAorctey5LN2XgwrGt1UgCWiExrRczHgiOt1P+P0Rcge/be+ZvwGzI3o5HJdM5fcdp6eyfz7zUaQ3poPYR4ZKMn2x2pNueh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=082CBnKqQey2usj2e1lYqAFijkTNNrz6CRtE3R6EVEA=;
 b=UtuOYFCGLtSIHv/jI3a2vatGn3Mqy2bVXTL/xzT+r0deVhaVA2FZzH7obE3hNmemsEVsYqFpcbqkC8BjjEihX9pz2V/AMqiwHFA06audJLL8gXOs+Nlm2OY4paUWzp0a6MRIFbUp8dKf2KFSi929q6qjZrkF635pMrds37bBJ7HYfwUMCG7wqCEK6utkGfa/3YjYQz5uu1Q0J+KQE6e9iS64DrNZGqDYTbMdQsnZ6HlIMO1DxT3SbnUHwuyNussSM+ya46COtnOn/pKMEGoqJK7cN+mDyh3BNQShsMrf6a2fg8Wfnavz4kdQf51YdlJ5gaV4Bh3PjJgfZKOgKR6oUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=082CBnKqQey2usj2e1lYqAFijkTNNrz6CRtE3R6EVEA=;
 b=k59mmxVfLjtDQSsjHVlPkesDTvTcFOFHORCGDEfFJZa9xajIf8j3PFP7JAzWllujFAY9U0CGqn5z5Mj8cE0x2TmRmAFKk9br4t+2b+qvPFvwytZbszX5uaCWbwSEOXUD9fmfHm6f7Ho8whrSTWzMmcCKAGBYaeZPBOKPMP3x0HEDP9Yq0sGb2m8rvi/AmkXCAIR2Z0liJXqaZ2rB5+FUWNmSLfN0CFM23+3KdMRwW+svVGP2DQ0WMNyKS/Q8GIyaV2vIUbBlam9w/Gh32YYvIP4y373F5kIT1p9OE2VubJ8Z62q5JkZa4rf7WMfchcjhWUiDP2rC20ts4MvrR4AFXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7875.eurprd04.prod.outlook.com (2603:10a6:20b:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 11:31:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 11:31:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v2 2/6] usb: phy: mxs: keep USBPHY2's clk always on
Date: Fri, 26 Jul 2024 19:32:03 +0800
Message-Id: <20240726113207.3393247-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726113207.3393247-1-xu.yang_2@nxp.com>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 5966199e-628d-4282-1d00-08dcad668e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kBYjgdiHQd8zPsL7RidDZWWXEZNEA5bFHNSNSOnkznaIiyPNele9DquJuTLb?=
 =?us-ascii?Q?R09BhYmBY8pyRtyj1s03qzvq6Il0QoG4dxQU2CaQ9DcupbgjmB9WAH4B6Cc7?=
 =?us-ascii?Q?/3OKNHGjMnEuj99frMUMeonZ7RvptU+cvZVslL29jkkYTcq9xwkE52hKvgSc?=
 =?us-ascii?Q?KhAtFwG6LOnEPxyaY+aYC8MeI4+P40AZw5Ro4YXYokRkus6bbG8Q8l2xqPkc?=
 =?us-ascii?Q?g7pjSKhntAJUROI21SPHKRcG+5o5PIDZVlBk6sP2monyCkIrwlvUXwEHPEpO?=
 =?us-ascii?Q?tXSm+qYHxhkn8ZMEJo1BxMuBRYVdSIYtoj5oV2PLAcmMJgjw6uLmoqkfMoXh?=
 =?us-ascii?Q?6a9EgZYdteP3d095cIzHIsLeKnngBnqMVyXyuELsLNhbCPoL+zB9rFLcnp7q?=
 =?us-ascii?Q?c7tWJH3tyKmYMe7SPkW5whdtdqpDWswNinm0NpxNkZ6pQ2V6+O1NjHz8zBjE?=
 =?us-ascii?Q?QHrGRh35qrVTKWxg9u7HLBxsV2fHkQEk93PGVFkl3xx79XleTz6tDHm+BLS3?=
 =?us-ascii?Q?I6yxpPzqc5di3Zy7a+swzlLoHq8m2WRuMbdiPmqWJAeWYUmKH0rmJZ2XTyCS?=
 =?us-ascii?Q?X9Y37esuffE0u5CTMTlaxl3LjjzIpPt9x4hvRIIeYbeyafpTIxFak9HfC9fE?=
 =?us-ascii?Q?DgYNumo6mskBzhiGvFgwaUh2NNm0xfweeP/aJbk4uYInIjur1YxvQ8lbKKGl?=
 =?us-ascii?Q?zpeWJuvA5QvppSVw95A7bQlDGBpC2Z0vi5cAYUIsTJNTOhzaHrz0YtNIdObP?=
 =?us-ascii?Q?DX+UrWuzOGyWe753/mcOfMpClQ9lTmf5TSWD6Q2GTsq/LvTpmG0aRxyJXZR6?=
 =?us-ascii?Q?O+qiIdALhFKoiqh1tjc9mLRYabqo6VQpoa8rToNubaH7HozWVMXNakGaaRS2?=
 =?us-ascii?Q?CU6fziMH8Eo1+x04+GbLvkMbrXuDka4kjHiqUhJdyfEdQSvXYMzXePOq8hGB?=
 =?us-ascii?Q?QYSwYbzKgwZvC2TRfEpCAMavfhf2reqGKCGRdu1rjCufHiyxTrJnkArSe7EB?=
 =?us-ascii?Q?KQWneQ8OkqGQpq7SFCQKUxz/jrWH4brx9FMBwD6TSl8oeiNopQ9i2RrbDOOC?=
 =?us-ascii?Q?XlFyWdsodrKIOoRSI9gByrFgk5H8WTWXRxsYBqO4eC3FqRd4y61KOCqqlVmf?=
 =?us-ascii?Q?NcrSGdKgpvYLuG05e7TZNxVSFvBV/4GBWgiR2vnNCiA6QJZvNHWtu0v1jzKb?=
 =?us-ascii?Q?+hDcEVlzuD/bwD1tauwV8hGcu430R7YyK02TZyw8Nl0gYmhRS3fTHwDkpkOH?=
 =?us-ascii?Q?AO6Tp0Bz9wtMXh+452cGoRbZ6VPD5H6/VB4t5MXua0kki1vIMBlQeYd3hYee?=
 =?us-ascii?Q?kiP2sB2GeRWHD4KvaBMY2IG2/oUg0JjU9lu4KxT6hhObI3Dmy6j4KzUQ+jyi?=
 =?us-ascii?Q?yesHVCXePuuOqiSTA/5r1R9mqyPmro+HKnMfKonKndPLKKGehL7HxHESnzD9?=
 =?us-ascii?Q?YgXA8gdGVVM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQ+U5UugBJrEh9MdAh6qKZbftP+7+7mEIl/Sv5UxuJaSBGGa5DPu5fYzccfV?=
 =?us-ascii?Q?ra3bH5iXMySGl2RrMqd/8BCRW92pKZo5kM5hyPNwrMYmqxKj7s4Yuc3VboE/?=
 =?us-ascii?Q?xjXHWGtrWOA6YCWMz55e/rZTYztCNaQGHH6t4VUpLPCE5whs1VWodINi1Kg7?=
 =?us-ascii?Q?RJP8Cev7wVlUqdd1/z3J31KWPij/tN6O448wqYN9ochH7bn9n//TeGGS87jy?=
 =?us-ascii?Q?BSqy3aJjzS2qF+ZPBt3cMdImvVgZMvOBOl3831YrxD9+Z1TjaJQF0cOiFIQN?=
 =?us-ascii?Q?2Lc4bqu+TO8qI/hq0dSpUg4dAOi1p7fxHyuDcRrtnSZQO6Q0wvr9lxAObH3a?=
 =?us-ascii?Q?I9dI3lmVgB1kXwTMbTyInC+KNU2fE5vYQ2mmqmpbn/TwF4qPdhJWvVsCGtOK?=
 =?us-ascii?Q?L7qhBQH7EXSJC4i0tkOZUOm95AND/Fkv5UrJ1ZOYJH97K2+lBOfwRXk/jgdg?=
 =?us-ascii?Q?6d7bCtxk50CpkBg+urN/o3Y/elbmQVH7o35XIhUUtAzhFu312xe2HXrNfB5R?=
 =?us-ascii?Q?jKZ9WDsc86cxEyJs3RTS8oBqWhO68ioU03VroGor7QqGdoQW0GgKsVReH2bi?=
 =?us-ascii?Q?rNtD8kI1OYlzOG7AXukqq/Lyr44esxKMxCOTeNgdGXbR0VEtru4mgKu3XTSM?=
 =?us-ascii?Q?6MdRhbEhCw7DLrxCsTJlbUdAS350fgimXL4fZoq6c/VpMvIqY2kcAfLNchqP?=
 =?us-ascii?Q?psb+7WTv8O++xZd2comMtwXcYR/RtH+ivRaqACXhExNEIgzH17SiaK2er4yf?=
 =?us-ascii?Q?jXBow4i8EsgDYEzkJGHTYQ2oyJwTo/urTFpAWIFEDu+ucejW01QhdRATYDOA?=
 =?us-ascii?Q?//O/g/GQkFArOBN6zXp4ShnY0RXKq9Fch6WrtWQ3W2AccZyWJXrLNLuge7EH?=
 =?us-ascii?Q?yXFhc+cBvV+o5ystoyW8PMpY1RxJREfRFKgjS4LVH84WuQHOatMyYAWH10UU?=
 =?us-ascii?Q?+ZWf4fP20Wk39VndfShfpELoO29x1OOERr+O+yYaK+gtqNQkl6TwDzk+jdav?=
 =?us-ascii?Q?bXQ2XE+mVQCUXjY1+JGWBNeCejw/RWnPqSApAabe6J72hm20lfBkOnfwLbQF?=
 =?us-ascii?Q?8K4gsPD6BklwYBBz7IYWZPfleTBAiM+kNlTJb75yOG2KwKXDSc5+wuYQ7N5D?=
 =?us-ascii?Q?6wPKwdz2SfVSBj6ttKqSSmM/bUUNVyNSIlA++8bNIwQVWrNCnBFxd0/H7Jcf?=
 =?us-ascii?Q?NgEVZA6dn7efLVtSU4IQufEsOkza76wRqqn67frj6mbJPm09Wvl2jcVvWves?=
 =?us-ascii?Q?IiSZT+3UvbownCS1V9+Ss18HOG/ncQPFlExqarqvuJQ0t6qdbY8nZEy6WN9O?=
 =?us-ascii?Q?dOcnmzPVyuqxdQn7HjcAPYoAhX5TIKBaq3S5zWzWqPTqXIOuBSuKBkgOcN2Q?=
 =?us-ascii?Q?CyokgRZ7wysLGyQI5mplMZfzsafS3ZLhi7KFr5qbleaO9TnHA7Fq43hebqCl?=
 =?us-ascii?Q?HHXNsyIxpj00u1P57W4aH/vgLycs5v+x/XAYpOeGiK+9xn6GwYHAqxrcDk4O?=
 =?us-ascii?Q?w8ktvH4n5qa/cCQQZXgUw2BCLfnT5+9sLw77277wKzecrwF9TElO5AV+fZZz?=
 =?us-ascii?Q?qiaQPS6fyQpo9JXpoMKDqdW05AfCyr6rrBjlBvdz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5966199e-628d-4282-1d00-08dcad668e4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 11:31:56.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EfCex7wd4fDVy6sASvCibj4xVNdAUMSZ+jOGU6gPcrQ+AS6M1MCbcWEDDbDyX41cC3oinn+PfhAdU6CEwpAFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7875

IP require keep USBPHY2's clk always on, so USBPHY2 (PLL7) power can be
controlled by suspend signal. USB remote wakeup needs resume signal be
sent out as soon as possible to match USB requirements.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify commit message
 - remove hardware_control_phy2_clk
---
 drivers/usb/phy/phy-mxs-usb.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index d9d29f0b37de..e172af75f602 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -150,6 +150,15 @@
 #define MXS_PHY_TX_D_CAL_MIN			79
 #define MXS_PHY_TX_D_CAL_MAX			119
 
+/*
+ * At imx6q/6sl/6sx, the PHY2's clock is controlled by hardware directly,
+ * eg, according to PHY's suspend status. In these PHYs, we only need to
+ * open the clock at the initialization and close it at its shutdown routine.
+ * These PHYs can send resume signal without software interfere if not
+ * gate clock.
+ */
+#define MXS_PHY_HARDWARE_CONTROL_PHY2_CLK	BIT(4)
+
 struct mxs_phy_data {
 	unsigned int flags;
 };
@@ -161,12 +170,14 @@ static const struct mxs_phy_data imx23_phy_data = {
 static const struct mxs_phy_data imx6q_phy_data = {
 	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
 		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
-		MXS_PHY_NEED_IP_FIX,
+		MXS_PHY_NEED_IP_FIX |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data imx6sl_phy_data = {
 	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
-		MXS_PHY_NEED_IP_FIX,
+		MXS_PHY_NEED_IP_FIX |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data vf610_phy_data = {
@@ -175,7 +186,8 @@ static const struct mxs_phy_data vf610_phy_data = {
 };
 
 static const struct mxs_phy_data imx6sx_phy_data = {
-	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data imx6ul_phy_data = {
@@ -518,12 +530,19 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
 		}
 		writel(BM_USBPHY_CTRL_CLKGATE,
 		       x->io_priv + HW_USBPHY_CTRL_SET);
-		clk_disable_unprepare(mxs_phy->clk);
+		if (!(mxs_phy->port_id == 1 &&
+			(mxs_phy->data->flags &
+				MXS_PHY_HARDWARE_CONTROL_PHY2_CLK)))
+			clk_disable_unprepare(mxs_phy->clk);
 	} else {
 		mxs_phy_clock_switch_delay();
-		ret = clk_prepare_enable(mxs_phy->clk);
-		if (ret)
-			return ret;
+		if (!(mxs_phy->port_id == 1 &&
+			(mxs_phy->data->flags &
+				MXS_PHY_HARDWARE_CONTROL_PHY2_CLK))) {
+			ret = clk_prepare_enable(mxs_phy->clk);
+			if (ret)
+				return ret;
+		}
 		writel(BM_USBPHY_CTRL_CLKGATE,
 		       x->io_priv + HW_USBPHY_CTRL_CLR);
 		writel(0, x->io_priv + HW_USBPHY_PWD);
-- 
2.34.1


