Return-Path: <linux-usb+bounces-21134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F19A47997
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 10:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9FA4164A04
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87F4229B10;
	Thu, 27 Feb 2025 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RKFsOP31"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D540228CA3;
	Thu, 27 Feb 2025 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740649980; cv=fail; b=MfZoUbh8Ypu58UEJFDxpM8QEHqunPmKdVVDN21D+u4iYDPWlSUwio7UPToz1InKNUmitppcqy9WHa4QUyJkvzjKi3La6rritSuGqVeoclj1cpE60/yyTzA2BedGoENVAiriRmXt/MFkYFhV4wpVksBRJ8ZeXTEH+R6eBZhHUXO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740649980; c=relaxed/simple;
	bh=fcla7BspTXGANXM799zz9t/pSDcEVZxRz2oCCjyaRUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GjChLtcRzB608GAgyjA4Er1+V9wZCqHtS0D5aroPHldoU4LLlssCqI9F2aifdOGA9Yb1qTtcxJj91nVMjk1GG4rF7/g2b/G92z6yEGD8kJ+z68fH/WPPmeifUYkchsyLuq0muxGTwNrtaqIMrgcAZE2wINAfgmH8bfHYatS7neM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RKFsOP31; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBIKEoOvjGMtNAPPjt2xigBtNC6EACjIMwf63wMYWO6Hw2pKxbxRijkYeXhr5mqFFVYTdAy1iwDXfEVZLTmMHLbb0Vk2IRMmlKIT2hSvziVLbj9+sm5Q4dP1Z5SCkGht+D/yq9gMjrG3bkNG+U17hpsGqouygIda8F/xJO3fcjFXnYeV/7bk8Uerj59ZiaqBIyZdl4WLrZvqmo80oz647D6JeaZvgD03DXL0po77LKKtgwDKrQn52xWExyIr0ruBGEqLlULw+Mavh1Bx43Lnfjg9q6xuLmpM6BGkHLfyPr3+KqTLKTp5lEkBNgEm3O/XzRJ6HDacdsgZRTg8pjbmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5wNm5OYfzdAzWwfKR2y5BACLjxmF1g4B+ygRhKBTnQ=;
 b=JdaGjPAVRDGlrKfpSqAgMJfKimPoKl+tisAh+78N/7dGmEk5olvMszag7L12x8HB/MkR9W7nb+k8WbRhZWeIk3QFQsN8fJe6Z5xo/s1UQs/mZgIdwGl+unAd2PAKZgbDlkbbvlHbBNTugaqvqVwPvXkZQcTAUMec3MVzPe+fL6JVMeLz5vHYsKL2CEjr1VDyxCqfDHcVmtV2NWVmR+yhcUAn+CKs5i+MUwB09u+t2OCh6AuZMYQ/Hnks9mTQoRLEK8bGjAWymylgwQ+qS+9MK/NfzdvhkZN1RWZP40t6cl2gNAddypkP6DScGzwXN+DvD+IdTqtnroK/gx/B6Zq5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5wNm5OYfzdAzWwfKR2y5BACLjxmF1g4B+ygRhKBTnQ=;
 b=RKFsOP31E/uC4mdFLfGfVXgQJA0l2qgYTFrD/5o0aPgCZZPr8ZHqwu56vV7W+zvZb8gaxSkJ2xewwr1MhrRQPW+lL3Wy78VWeVWme5FVK4RGJ5j4rSlJg4PPPx6t8tJ3Wq0qFsYXlTJWvQsgvTjogVmKxUucmQF2+t74Av2pk6Rqi//yaqUJcfoIfwrF+I9/J697OPDsPw5eMDNkvOhqqEtPVic5O1wEYSDTiV0HIlIrBbpD6DbFta9cvGVESPjes4uVzSKtT14kIcfNl9WPqy5PbgX5Ye0wUs9LifHjO+cKyWvKwdUdYOwSl+ai+w8nHlUYNg5xTQgxtOM4YTt6EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB6848.eurprd04.prod.outlook.com (2603:10a6:803:13c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 09:52:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:52:57 +0000
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
Subject: [PATCH v3 4/6] usb: chipidea: imx: add HSIO Block Control wakeup setting
Date: Thu, 27 Feb 2025 17:53:46 +0800
Message-Id: <20250227095348.837223-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227095348.837223-1-xu.yang_2@nxp.com>
References: <20250227095348.837223-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: e85e4c2a-6837-4cd0-3f8c-08dd57148354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rpEzawP27CUWzwYL0diS6NlGTNmvzjlFR5tMBJvY4cCTyBpoC+BhNf6hXx4I?=
 =?us-ascii?Q?GJaJaHXPVAYKaqC+ltBErLtG1BW6f/tkGx9clCyh7QygbBTWvViDe9Fxd8p5?=
 =?us-ascii?Q?U/dbE2kpEe7n8Ng8rpYsX6BVAs2HOJ3gsLRYMIk60XLCe+MM5fMj+uq3x4Kj?=
 =?us-ascii?Q?W0n6eA3YNipuh0evSMPVsFzFzwmSPBOMCA4gfxhqg40pPd3Ncl0J/zh8ZWD8?=
 =?us-ascii?Q?m2vslY3N9mfdOg/IxJMnxBX0DMIQVG75Z23fPLxmO8d3suWDpc3z+ZC1IeCV?=
 =?us-ascii?Q?vp6CcyCu3gw2H8xjt4BQPVfbxHGHtimDMMl8dQJbOAbmZuI/svLMdXFTX632?=
 =?us-ascii?Q?c4XWD3yvbn6H+utgDEYjuib/3jEUC0yqtpjLjqBldYnBtfxPY4e34Oc6my6d?=
 =?us-ascii?Q?urupYchrKEwPzW457FnloWeBpUxrX5kPQB+x/kayAR4I1/Pwu8yunqlSj8pi?=
 =?us-ascii?Q?9vYZATF3kL35QFANk+KFHswExgSnhfR9okDmI4nunf5T6FrH50oyqMeJJLpa?=
 =?us-ascii?Q?KvVSow/aXe7RgYya3re3PIjM8Hs0OZHsEUqNIQojClg5jIYey4kR+nSC4kYF?=
 =?us-ascii?Q?pAgbqe7yItqDqCMO2yjsw+JbTyZyXR13PqzGLHzgVe8TFHMdg8jo4fybWnea?=
 =?us-ascii?Q?4VbW6VODA6J0BIrrRNhAfejwDRPVpa+06CV3xZie8pqqdxdJmVty6BSuW6vt?=
 =?us-ascii?Q?K+sfx/UdZY8lQDGh3sueADqr0VD3bM31dgrV28ZWs3/OA0FCpEPwlIIGQnhs?=
 =?us-ascii?Q?9LD+Vnku8+9E6mSFbHPmo90QlpdolnHSvLho2viLdpB4ByhNDR+xyiUiUGOL?=
 =?us-ascii?Q?e2a+MhxJoRIdH1g5c9navyO/91gasbOCWEAS5fgXEvOMiKDbhebPHLJgVb9H?=
 =?us-ascii?Q?Q3rt2Swe17Fb1njBhQfJngOA3n8CF1tkSDGE9YInwCmtSvDBf5wbuFMfaDz6?=
 =?us-ascii?Q?rQouDjjIFB72PGplE4p89a9weYDXLtRxzZ4bi2RUqlRedINStX1xN8TxIiza?=
 =?us-ascii?Q?/F5OKjqPusLmFFsRBCZnkayFXRKxVolC81t/rXtm6A5b1h3OJp3Y+TF/UKoh?=
 =?us-ascii?Q?f4VLZUxzkVUl/cATaF1gnNQ8aIn+595Tqqimu6C5IM4eoztvWr04iWI5cGy+?=
 =?us-ascii?Q?FIbdashT1r0Tp8XQL8gsU4OapQCux8oPwlkKsXiWxODIKf7lONMlsr+YgDSV?=
 =?us-ascii?Q?7zFU0KVJpo0cJQhNE+p6D4ikx0Sz3MRpjh+1WhZ+Ri0EsURrZ2/ZUyE+RJAN?=
 =?us-ascii?Q?2yQ9BqTAcIQ0N6m+llN14DHdPsvR1FiqMGsAhX9zYG/0uPqJuc5wrII2k7go?=
 =?us-ascii?Q?GfSd8DbBnTq4t0FkBjLxOFRFYYzRrsTYt4pleUOcqlOFLICDqweWJXBjq1Cb?=
 =?us-ascii?Q?CYUbEQvOXe7WL8dDJZGbn7mx75mrsqDrRzpndMWNqDqBJkUYEaINmhlb/1ic?=
 =?us-ascii?Q?TpTETP/Hkmi+PDaxYnuTo17b2O8pABki?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MEHJMxqtjVV/8XIvnGUFclvg5ADMd3PPmG8QMjRC3iwaOb9PlHKAoFm3i3Be?=
 =?us-ascii?Q?M0uyc5YYcCqBPNQwmAIgZkR41Rz1fU00s8ktRMN1Jom+vMXdOmdzNp23SvGn?=
 =?us-ascii?Q?vWJbRiBZMy/Zw+L1GL45B5rt3Lg1NBUXddwdXF4H3FyfSh9Y5WHeK4Q3JJjS?=
 =?us-ascii?Q?lhD6OHN6LO3YXG5O3Sx1d/Dg8bYstc4N783mDa4Oi0bAgo3cA4qxHt0XdQmc?=
 =?us-ascii?Q?n1R4XjuBEPcOE6+x26AmBuhQZlYJa8vJnCLK9KbVUaDEk0TMsVPU18Mq/1sC?=
 =?us-ascii?Q?WYmG6rTkJqJ1ICFJ8k4HsWkrlmUbNcvrF2sZrgjKme+iELTiNu9n02u+/oZy?=
 =?us-ascii?Q?T+X4e87IINBVCCR+90lOviXYUnm4MVquQbUxdN6/pWv+UWtMihgUMwjclaxE?=
 =?us-ascii?Q?/1f56ba95aP+UqU93/aOIlpY61OETESffG315irKpXqdfccfH1M4KuRY2y6N?=
 =?us-ascii?Q?HCqKilhW0TXUbv6Eg0/zzJ+5bQT35zV9aOwVgaNv1RF889Nh560KP0AN1V8G?=
 =?us-ascii?Q?agfdYuY2TaFNotuUU/t9b94DqelOFvzGnee8Qy1G4C5mj+80+YcC6f2q9nbm?=
 =?us-ascii?Q?ltc9Xu1QYZzI2ucSfTpKE2OHFN7aq8LiCMdKvjYL4vsq7ZV7oyw4UmTbQhGe?=
 =?us-ascii?Q?hmBVrcBATFwjdVIt0gVZ0yFJl6Sf7go7PklsSw+cZnLCFId7qWDuXRgL6nsD?=
 =?us-ascii?Q?oYEV1trlQ9fb7ypXTizR7Tkl2a1f2HDEcMPsfVnjgBVbgufR7GT2S/xlhZmC?=
 =?us-ascii?Q?x8rUNuqxyBgphYTxbpvC5drfHurPTcP5j5ey+92qAXQhlc2Bg0yXGVkXvyDs?=
 =?us-ascii?Q?jc7R+qPK1kUtampUjrCU9epHtQXdtRV3wrvCiRBY9vbcWfU8QqV4u5X4We9K?=
 =?us-ascii?Q?eFUcJvJuSYdhDZ+4hXELT30EYmzcBHBZxDwdceWEO7s4fRfRseM18inCjIKS?=
 =?us-ascii?Q?J7r3VEheCrdSUH5wx79Nq//oL82XIj0nyz6Ja1dsmzKBQ59n+Ipcxd9CwSB0?=
 =?us-ascii?Q?kqrtiIC9NiimunmOW+1Q/NeucjI1v+sGyuEuKx3eu81p/4Unysybydpv3Kb4?=
 =?us-ascii?Q?efSzAFw21AnWEr6xOe//dpS5ANmdtjljsh6wPF6vMEh11k2OZezRRTv2wxNT?=
 =?us-ascii?Q?Eqc2FGnzIfrGKsW+Ah2mfSixdaVq/nHBCrvNpCqx6zdnzrx2m+wQF+QZjUXU?=
 =?us-ascii?Q?EleU0TH4UJlZ1dSpjtCBwv3OLggM1apuLGWX9oCZACQfbN+BSeIXWSIZsE09?=
 =?us-ascii?Q?8lf89lIAsn/EZWQ0SfIVe2b+ls2CoEZO+6MvxACNfWJEyI6q7F12l5XTco0t?=
 =?us-ascii?Q?63H8XkzWqrTeIVmWJwandBRgYUlXe5/+8MTofsJe6uLKmBPoJuT4Avnc8N3f?=
 =?us-ascii?Q?d2qcC5l9K4mEE/rMqS+kanrXjuaiMNgNN3KL2rbndb9LVbZ3gOnbuqrEMK/E?=
 =?us-ascii?Q?vamKm9z9Xco+A18REg9IX7RQ7MZUAzO9g3Vntng2HzAClwvFXmCKVffP+Ket?=
 =?us-ascii?Q?uURyHHs1pNPkRZ6tOKyHhq9n9IW3TV9ce+uQIw/kS2zDuA8IkEWsbQR0Vn7A?=
 =?us-ascii?Q?uaD0vvoNZYAOXCCSoR4Fm5BPKeHdsRQpO0MtoQha?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85e4c2a-6837-4cd0-3f8c-08dd57148354
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 09:52:57.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESQytUVhBThC4299E86itX2jLz6UjwQJtiQDNf8WOMCvR4wHwFTf2fZMoc6LZREqbbU9245ST//sC34eFq1feg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6848

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
Changes in v3:
 - remove usbmisc_imx95_init(), use usbmisc_imx7d_init()
Changes in v2:
 - add Rb tag
---
 drivers/usb/chipidea/usbmisc_imx.c | 72 ++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 1394881fde5f..8c30908c11ed 100644
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
@@ -1016,6 +1033,41 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
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
@@ -1068,6 +1120,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
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
@@ -1289,6 +1349,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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
@@ -1296,6 +1360,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
+	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1307,6 +1372,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(data->blkctl))
+			return PTR_ERR(data->blkctl);
+	}
+
 	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


