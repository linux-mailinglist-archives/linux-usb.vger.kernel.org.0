Return-Path: <linux-usb+bounces-21245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D8A4B6BB
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 04:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 232B43AD5FA
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 03:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0681E22FA;
	Mon,  3 Mar 2025 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U/HaUfVl"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DE1DF751;
	Mon,  3 Mar 2025 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972772; cv=fail; b=HwdqtHeBzOuNUmZdEz6e3vD7rVms/qTCqbg52uhqmwtfWmOLTq8fXAk0j6EfeeyJ0PHI5+c42R3rVLCAVMgVXsv9+NRbOPUooFtpGFzA/p0mrNBzo9gdxUNHJ/x4Adcr8Y35OT9pxR7Tu1fJxjxBc4kZNp2BBhUYxY3xc3axZ2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972772; c=relaxed/simple;
	bh=090fhwOTI/k2ez2rEW3h0nVT1rfIENJNhejHQ3fPf28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q5mScAmvj0ekMYfuK7Mx1kpEi7fx/qnFolOHAfTDSpIQQVhwimUsW+jrIX8RrcWpmxWVv591iQJ5/wltKjaWsJ0v5Gy2+kVPdWzJwCGVtIiyJLu1zZl7jT3ZPjJD0eMSLPAoy1rpIBiyiqfmUj3LVH01T2XYB9byUuuMTOLQEds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U/HaUfVl; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP+IpKYbAqJ4wTYyT8DzwQx86HiDSFa6WMrav7/Fq4qtjBvd320htmc9Qo64mkv+SBN/neU2wOPJKle4lpU5ZtdXMLp87PJ0wcnjAQloV2I6+zyrkiCK1/2yeblpo2UXrFP56grWN4T/yWKy3SDPXTnmeKYEKWiKo0rkFHQoa2sTGFAcyggCnsIDWJWVKtPcPAM0k44aVVmJJA7SC02Z1Yl3M7TMUS23FzZmp6Nkq4nukMJ6MuySrOA6LkX9JART+2fSORjLJNwxEiE+hZhHOi/PLtmV/X2iKpKKd1cDUg73H2bk1kvhNcbMjvB1ryccDT/eviqcfXY3ln8RDEKXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgHLJHs2NkxYTxEMN08pX0mtOg5LAHS8UVu24O6aX1k=;
 b=pZOAEsaHRojTj2ATdtUN0BwQH7iBTuaAgHa6W5drtSs72c7Qf2x6srUtZSIGQPUxYfGQ2VKQdyBykkKAFiDPMjXx/6Aqt+NzRVbwCh7jKexZhAupRExmqUQaLLhnRhHiT6SKVlZJTFbKvRjNfiEVjvkVbLDvgZKRAdoclAKn/wpT2qvmTrjGajQCAHFUmgCcmt42cQNQgbNofZcF2OHpzvegCDejjsjDzzRXJ6Ubxc3WgRrANBU4VJUjz3Qn3rTfwKTh1rOPeCx+WJVoONqjpk54aDaZkQr4cCYfFAIlNqOSlHWHDbQVnspa21L9iGccdnfPvYLcSMGX55un9w4X+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgHLJHs2NkxYTxEMN08pX0mtOg5LAHS8UVu24O6aX1k=;
 b=U/HaUfVlh1ObqdiZBdGBm1cB6JNp+wFGg5A805XA9QyRfoTonE6Xyn8r762PWQAJJbTJIgfqxZFoW3fYqksbQ/2cOEg1vXJe3/EuBbXSgawcby1CD8fLYbp8g+6r4e56NJKjU+vV4wYyeY0W9DBpVBTI6Ix8WtzJMYSwsLx+J5WZ/3r5f0632LUqbb+mj5puwr7Qxs4PhEsAxjdWZ6PAr+zkHZwbyxIcnt3FnXdcxB6G2kHsnzk7zy7gJyk0ZTV9FrhPiTNhgJXBKgU3hyJD5UhD5SJYGekPkjibKWb+S7Cbsd1IChjFizjWuwGYorYmXf734VTDb/D0GnXbgJBXfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 03:32:48 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:32:48 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v4 4/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Mon,  3 Mar 2025 11:33:42 +0800
Message-Id: <20250303033344.1251076-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303033344.1251076-1-xu.yang_2@nxp.com>
References: <20250303033344.1251076-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: da21513a-581e-45c9-5401-08dd5a0411ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X2xqRl5GHmGcgeGQ3QmcDOmcUNI+dGGZp2VcNF9gCq6GVqjqyHknDa9mzt66?=
 =?us-ascii?Q?N69FOK19THUcwCyJc9HLryC2uZF2os6aYlhOlsne5BkP47edZIdOtBZHYtIz?=
 =?us-ascii?Q?bcy9IPFbqEcswTSwbXQmPY1JdisW4RxgAcy+1rhf6sH62JWq1lzOIjBqCJ1X?=
 =?us-ascii?Q?NXm8isd+704yJDweiFxJU0icR5bXgm2TWMmLy4DIEJ5WYpD3jm05ZRUqoVht?=
 =?us-ascii?Q?/at8EN73SVzw8wU6gtD/YUGWQAzVzqGNeoFw5dgD1GpND69qZVlkXfPyf2tp?=
 =?us-ascii?Q?zJZJ2gcccUbAKO1W9ucsx0HtD54nWmaL1/kGja2ARc9l/lImE0fD40eYzizV?=
 =?us-ascii?Q?/CLwYHVMOPuELg4kZbJGrsNRarn2YNlGmdbl5CWAIk9K4pNAk5+sWRr3HTkx?=
 =?us-ascii?Q?sIM6EnNoYfhe/hzjHKlQqcc+qT688KjTiQNbXKx1rC5JAkq2bNLuAjvALiRn?=
 =?us-ascii?Q?T9z8+qYQKgKxI5aYFjuPNXKHIwF430bMacM27aoEHpngIqiibCDPMpQNhxfd?=
 =?us-ascii?Q?Dc9nRXXShEBrdheS/+zYs0TWjs1azCNailxvHnEwuQpAD5LkFl8PQKd/QTL/?=
 =?us-ascii?Q?TS6xWFbvl76Uol1g4sUiaAeYqs0RV5vu4tbLqpBHDvzHUrEOIj6/5HKK1X1T?=
 =?us-ascii?Q?wsBZ80FaixQ/ZnxluF1oqGYDKDag2FkOAicvMYb09gg+OqNmmUmnTAogU4lV?=
 =?us-ascii?Q?+IHCIe9b6rq3x4z/MIn2Z7Sghtd3w9trH3q9/U8FsDAMbDmNKFsI2WtZmtW6?=
 =?us-ascii?Q?wXe9jedlIrFo+a5TB4Bt7BQr6s//iMcQOq/2d4Uqk5oyawq5H7sPfz0lmOxL?=
 =?us-ascii?Q?vdoX7KDrqjF2HwjvrlptLzXukaKcDNocKF8Qhfbm3okVGctF34KurmQ4H3KL?=
 =?us-ascii?Q?l9OcexXw+3ekbpWtZc6zXtMvogagrEhJxCtNHY+E8JWWCQA0BLJ1SGqiSB4O?=
 =?us-ascii?Q?/BZTADCRHyhklfWDtlf14nohEeDLqVwrMlnu5fTCfhP9mhiUoXRaEDJg7Iph?=
 =?us-ascii?Q?2zr4leI0AgvkxfWoShniGUhR0ihKH3HQh3cTKORqRUuKwwfm3slNgqDYs1hG?=
 =?us-ascii?Q?rHJxk3apnzQALm2t5HheCdjHo35eVjUMZfqvsZy5tXKoNd+17tVi3h6tm1OE?=
 =?us-ascii?Q?tVycs4CrdSiWtuEqTo4+MBcdWOZ9aqJekhYak7tVyqgivY9Lkr7oqZmAdl/Y?=
 =?us-ascii?Q?se09WNWSAffapsnBd8ohi+KNOvQL2VLv6grQruKeYiWNCcLFIxCgW/ySFlAB?=
 =?us-ascii?Q?LGccQEVuI2xoMnKKUGksjfbppPDPg+s3Yotn8ISWn6sQX6fSkP6ND3wIBAbQ?=
 =?us-ascii?Q?mUGlKKgILCXB79v/u6K3ZXg+3btsHcx7LJjFIWUH+byqJtevQmsxk6VHtefP?=
 =?us-ascii?Q?VQoM+D0iX5kxg6tvquW/1XeTo6RCo4+no6R1qaKL6g4ez9QNjep0IlytrF9y?=
 =?us-ascii?Q?g6DJtL4wVytYN8XhnJhFYG4uDrd3vw86?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8yHCHW/vh1CuEFlzPDkhDQLWU8vGOqj0a1elWrljV+e8eAkw/O83zuo4ALcd?=
 =?us-ascii?Q?TPtb51RVeHGZX10/RUqWYVY1NDgG12gEz87M79M9nmNIxQrK6qj2PBYPeWeA?=
 =?us-ascii?Q?Pv5ZUyC3BzSsLdHYCa5I0i3AC+hcZHXDBgnR7HVqC3h/jIp6v5NIxA458a/S?=
 =?us-ascii?Q?QP1ebpREYr9xN2oSMsSvFQIMW2GVnX+CwDZqMankQrPnJ83l9IuFk/9fnbV1?=
 =?us-ascii?Q?gC93ZGeu89gOoKfMYJ0xzlSEkHMLAZ381rS8yj7n13dCib8JdBBwxJq8BUGw?=
 =?us-ascii?Q?00ex4tquzrfwbVg3A4YRYymGHId7XKtXhNSKEzkCOeAo6dOkKx7XiJZ34S6d?=
 =?us-ascii?Q?hH/CjjQuc9eJ+8i0mmwLleMdW39Yhtcjk3g0nZ7IYU1BCKJvq/7MrzoVxSIx?=
 =?us-ascii?Q?pjmduOZLNwmNhyy6myxNBMzWtr2N9lH3kjKzwUkMqMpFcob4qWJmS4pEkKAR?=
 =?us-ascii?Q?z7i5x4whe6Q2JeACiolK3QadsI8SSJ82SRo/n3wyTEsBQh890o03/xSpMlsH?=
 =?us-ascii?Q?4wa+TSa72+ogc7XC6fXxLRWRhJdg/oQunqLBANSuZ99249C5lpHlL5cTD1EM?=
 =?us-ascii?Q?TG2bdJWseR7oB2FNbtajQjfuxtmC0r7nVsZknZ+Gy77u36lhKqTqkddq+rLB?=
 =?us-ascii?Q?m7jufmP6pKGmRwqb5aGL12oZvLdHWq8k+1mkPAIQvrjSUxUkRPjHHalMiIJF?=
 =?us-ascii?Q?5DJnv4dNUuLqzXZr8gFpLuvcKsXs5ubAMmDOVMOPUHqKY6Hp483arT/MPH5L?=
 =?us-ascii?Q?UFW92NrQpTGcsErz0akWm5ZrtmNx0i/5KFkyIdnDXnrsBZ/6i6noUX3wYQlu?=
 =?us-ascii?Q?+yWYJhco38ZRr4Ps9fcUP4KIdff1v5dgzJ+D4w2JmoSb/B2/DCYXm0B4NuXY?=
 =?us-ascii?Q?17QGGBzGF6ABZjEu69F9PS0toXxspVeU2qWlBLYBgphqWsIqmyfTRRzCTKu2?=
 =?us-ascii?Q?njd5UTkazD8FvSsn/Io0HILizzTDdTOzhxjD97PoqYWPC2UVVgcr2MhXc3nx?=
 =?us-ascii?Q?sw6mv+LPn0XdRABqoEd45TjIG9LHnKNNNtSkQlQ0zRJclc4f+6acky56hbLb?=
 =?us-ascii?Q?puRBJf6Zo5jXZx5PAAJ0IsE9E7tUF4mPVU9HXVy03D3MtJrw0mLIEzlKzVjF?=
 =?us-ascii?Q?1mqVwUVBDdyo51O55BiFu6QfBPiDgue9ONBJ76QsbS8GCfaTMjWgIr7m8D6s?=
 =?us-ascii?Q?h8r7t6fUAWgI0FGKpKW70VBdeOfbjVvMjwodQeAmqBcwJ7A9HMRCtYmjWMD/?=
 =?us-ascii?Q?OixD+5hv3j/hKikhn34U+4FOEVr3j0gCtSRDtIurB0xWGKVRoXX5BEW13z5H?=
 =?us-ascii?Q?/r0VRcWYts/JC7I7iaM/d0+qed5ra9MI5Ps2v0hZGArSYnecziEMnDyCyN4G?=
 =?us-ascii?Q?Jm/nT08UeWoymLMFEoe+oGcZMmo9Ss8Loa8vttFT77QCLdO/x2Dk8S5XK5gC?=
 =?us-ascii?Q?j48+f8wPf6T9SUn8V87pB4pd2OqQYMS8t9dUOBSy6/BqVNsFUvga4y8CWonP?=
 =?us-ascii?Q?8sXtqpUq5ZJ9GVoIKsHS4x1if09fFe+ynLy8YJo/CVHztEoxnoF+Ei+bMG7l?=
 =?us-ascii?Q?EDep2+BKnpmr5KYKxYtX4iLX0JIknukFrMK4UcTR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da21513a-581e-45c9-5401-08dd5a0411ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:32:48.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptPjlQ9ImANetSUFYu7jdktoEcHwAwfdKMUHAByUKU9FiKI83mLxycJszI8eIgj9dJwLsr6lO1Ss6WSBibyMqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
Control:

HSIO Block Control Overview:
- The HSIO block control include configuration and status registers that
  provide miscellaneous top-level controls for clocking, beat limiter
  enables, wakeup signal enables and interrupt status for the PCIe and USB
  interfaces.

The wakeup function of HSIO blkctl is basically same as non-core, except
improvements about power lost cases. This will add the wakeup setting for
HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory, then do
wakeup setting as needs.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - add blkctl NULL checking
 - warning if no blkctl reg provided for imx95
Changes in v3:
 - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
Changes in v2:
 - add Rb tag
---
 drivers/usb/chipidea/usbmisc_imx.c | 77 ++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 1394881fde5f..3b35efd95cdb 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -139,6 +139,22 @@
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
 
+/*
+ * HSIO Block Control Register
+ */
+
+#define BLKCTL_USB_WAKEUP_CTRL		0x0
+#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
+#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
+#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
+#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
+#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
+
+#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
+					 BLKCTL_OTG_ID_WAKEUP_EN   | \
+					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
+					 BLKCTL_OTG_DPDM_WAKEUP_EN)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -159,6 +175,7 @@ struct usbmisc_ops {
 
 struct imx_usbmisc {
 	void __iomem *base;
+	void __iomem *blkctl;
 	spinlock_t lock;
 	const struct usbmisc_ops *ops;
 };
@@ -1016,6 +1033,44 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
+{
+	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
+
+	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
+		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
+
+	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
+		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
+
+	/* Select session valid as VBUS wakeup source */
+	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
+
+	return wakeup_setting;
+}
+
+static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	if (!usbmisc->blkctl)
+		return 0;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	val &= ~BLKCTL_WAKEUP_SOURCE;
+
+	if (enabled)
+		val |= usbmisc_blkctl_wakeup_setting(data);
+
+	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -1068,6 +1123,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
+static const struct usbmisc_ops imx95_usbmisc_ops = {
+	.init = usbmisc_imx7d_init,
+	.set_wakeup = usbmisc_imx95_set_wakeup,
+	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1289,6 +1352,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx8ulp-usbmisc",
 		.data = &imx7ulp_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx95-usbmisc",
+		.data = &imx95_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
@@ -1296,6 +1363,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
+	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1307,6 +1375,15 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(data->blkctl))
+			return PTR_ERR(data->blkctl);
+	} else if (device_is_compatible(&pdev->dev, "fsl,imx95-usbmisc")) {
+		dev_warn(&pdev->dev, "wakeup setting is missing");
+	}
+
 	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


