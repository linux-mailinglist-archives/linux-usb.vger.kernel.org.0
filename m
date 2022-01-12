Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A2948C13D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 10:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349530AbiALJqh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 04:46:37 -0500
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:19406
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346466AbiALJqg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jan 2022 04:46:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZ/YcADVXzYqqyWCRatuylPPiDdhPeJnNN5TdUKJtjGoagF0v1UZpsCEMcCRC0FxGhNxEqOTf4QwTSonVQqzxabsra0XYVghKxEE1PIMma9mVyuS+7qvKky/frCpt6t74cqqHILTc2SbriDqOpZw8X4u3kjk5FDCDE0W1imdhKrHTjTL7jqNUxgAauL+BZcbv5iuYlIfPvnnvn4HOx8ZB+xNLFzYb8O+NFU5y4RZ8FII9bfMmyzEh6nBQcYuc5hDn3tm4mUt4uHbR1wqEFVHv3jKdWN3rJmJB8r8EhEJH/ipGm+aNT5sgPATaxGMUno6rjwHr6DjENmJxNtVOwbTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssNjeFtG6qwwhNqG0e4VwgHxs616VFpLqOAFddAKzW8=;
 b=dBFFeNX892iZtwQYUP0JkL5ZI8hRsap4nZ0vU6ARCvo+nLUo5IHLKTdcRCqdjUmeiGrSXgF3onbauw0ZbRIbkNxf5fa0rL9UhVt9HZeOjWsZR5HXmy89iFXVDm1HiZuHs8iD58G4rV4Sr1LlVtM+Ehzl6Pkmt3GvCbzMi4fJKhk0pCa/Z2rf6VvrF0evrsvHYyiDsbhl04z/De14Ki7iTxiDMhaNGR+3DZgzL53Pw/fPlM6eqnDrNvlYF8VO6nOdAYEY/z2zuu86jt85HZn2RbvaT9Ll+vEo1o8Ik5q8gFCqaXle6fhDbWTyZnfnF7c5dvcW9zCsBMIPjWpqJzbfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssNjeFtG6qwwhNqG0e4VwgHxs616VFpLqOAFddAKzW8=;
 b=b43/FgJna3/NiXE132ZSVcJnuLx5/SUT5Q9lTBR2B7DrSWn+uOF8aEWBRW/Df8HPKEAlo1Oq9qZjAmIDacLX99q1NO26yAS6L39saeqhZEtave4NQxuqf2oKYpYj9KaEEFXAOnBw3j0uj3CwwVZn7T5U9c+EqgB+z7H6Y1TPNp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by HE1PR04MB2953.eurprd04.prod.outlook.com (2603:10a6:7:1a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 09:46:32 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51%8]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 09:46:32 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: [PATCH v2] usb: typec: tcpci: don't touch CC line if it's Vconn source
Date:   Wed, 12 Jan 2022 17:41:16 +0800
Message-Id: <20220112094116.616272-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:3:1::11) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ed80f79-916d-44a0-bb69-08d9d5b06a4d
X-MS-TrafficTypeDiagnostic: HE1PR04MB2953:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB29538A21171973E9F9B39DE18C529@HE1PR04MB2953.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9abtid4OaNppTXUzj4KPMnIvn2ddJgkBbuYUxiyCtFgMzqnJsbGLxalTWkbEM2wtnCXAU5mxGTxGFYTWDi/Qxb7kWbZajp9eT+iNZ5xvP+MA21ODq/6ggBpVpoAnkdCF/M7PqTiK/kQ+gxS6A7Ouhh1dQ5/kgQJO0UbrRTY3EwEoTIL5Gx5rT2GXs8Fy8GueYOx8uNlLQ9yjG7osn2eiovg/e11bHXkNU5HxukGjlRlxtAqE09SlXQjilWZOSzH+98fEO+9aRirYApief45pHHZkxnqEzIwkM+mFqU2CcXhKXKRJDunmbjAaH2NGc66hn14Sp1c1OnUG1YgyiJeMVlcxSQjh9Cib56pRQRj4DKtF2cZH+gnMStvH3LkuJpluW6e2HdAjebkCxpmJ4ullQqyfKURF+M5lHhdkYRBgBNWYFMk1dsrY3OuUFdjVGaqAhSmwH7CcE7c2hJbxb/4DWKkmsUf9abi+JPdrA3GQvOMvdcqvtqmiRIoEOjpDoCy+9seg7VkMl7BBaZ7GE3UUbsnqjSYJI1JJ4yTlap9f7fM78xTePxprO0HJ82BN7jCBDYEOdhSMV+hWCONy8fmTMsshELl27pN2HLdrsBBbB4bsYYb4SGLKhse1tPTn/btMbzYgA5hASmRbGmxlR8GDZxLQqECu2bgGdtgtWznHBE7dXNuWCGhtF4SXOrru6Gv4VF2MtLG4JG9cBkinBAaNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(6486002)(66476007)(66946007)(2616005)(86362001)(38350700002)(6506007)(83380400001)(38100700002)(6512007)(2906002)(6666004)(26005)(316002)(186003)(1076003)(5660300002)(36756003)(52116002)(508600001)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x5XVFSEHjWvmnNGIs2DBtYII27d0fNQCiB1P1gsa8ab0LRo86PVuauhy5y6Z?=
 =?us-ascii?Q?uecyHxfVOO2WJdGEGcPH69nUW9Hm+3cbzPRVj1ivJEMX3Jw465z4OqfmwtgJ?=
 =?us-ascii?Q?2D95Pg0ZFAcXSNdOvBKz/VZBiOaXfgPtQnubml202C110hzIwaxtSp6QspHs?=
 =?us-ascii?Q?ZAqc8dhLjsdWxsAxU8FCnBRvhvw5SD9iE2GTggplmZQrUdNn0GI/O1hbVdCR?=
 =?us-ascii?Q?fRws0GGURdTSXDGyzFQNUlY/asS8uOCoKeZyJnRyADW2gBZ5qQZOwf2urxQf?=
 =?us-ascii?Q?BuBsYpCnqybeZZgS89ylamfgRwh5H0QxbEfH+1KNcWy2rhjGRriwzr2X1fzf?=
 =?us-ascii?Q?kRETVsPDb4fecyrTYxoQqhvAb9QVQhwYzAO0ROiCiX8yg3DNzNF98JwipFLY?=
 =?us-ascii?Q?F/AP1sHCuAm5nmsVK9HPi3rt+mH5N0bBFnCIx4JHZp6qKUHbKGbqWyKdOtse?=
 =?us-ascii?Q?uzJiPIGrjrzLUxwkBa9U/npnj0UKpVO5g2RqDiYxyECJ0L9FcvvlraU2Lb2P?=
 =?us-ascii?Q?deysqZG7By6waNh/eWzvtrCGybml8NY3eFrUy2x/ViIH2YgyzREVpyBTkTfQ?=
 =?us-ascii?Q?jhtv0jUDdvwEaQpuH7ls5GjJsRdNRJhuWDMv+VnnRR0+YExbavzq3MrSAfa6?=
 =?us-ascii?Q?g01faJZEiRkaB1+RVkZBEnY/rcjdu4nhcWsWKOx8N6TF1p4LIUmHT0wFaRJQ?=
 =?us-ascii?Q?Hy+ZAvlQNCf5VKhYF5oAaqhHuymOg54+HS+iPp+E77ZK4w3Q3TppwYYJ9jmK?=
 =?us-ascii?Q?smCwSzUm8LKiW32B+TxEbzcW8powBO4PbuPoQjDG3M2+Vr764t5baYInvM2/?=
 =?us-ascii?Q?Ibbrq5HNiXVDGae0+fqIdlWpkaLz+MzE2ofA27KMgW52ajW+tJHBccBs/dTs?=
 =?us-ascii?Q?tnno+Gg0zJfWE0xFqxO2k43miUHku4tW02I6viWiYoy27g6jzw0gmYbKshR4?=
 =?us-ascii?Q?++McFX9EpSWjLizeWIaBwHYuTb1HyhIvBVM0FIJEqIUCoIwd0wohoMtHRRlJ?=
 =?us-ascii?Q?FCBZju5dz8iqk1++28oy0Vhp7Pgf0MECFBst9E/3bMnnb0wy4LIVtM+YXVCd?=
 =?us-ascii?Q?+uyVapm+07+y4VoIhBKmPG+YHY9B35yy0GnIKZjkTsdwXQoxJI55NtfUeOGq?=
 =?us-ascii?Q?bp0z2+aKwsUEP/vMOVhkV6Z35e0v7W3eP7B/lSuLcH09xXDSNu0kEJNTFTJc?=
 =?us-ascii?Q?wpWwkltk9Reo65QD8JwpqY+GON2eiV5FRXuuAMQMwQK16XmWgTJ6h2B8tHuj?=
 =?us-ascii?Q?xHf7fKUDPr/YYIYci5zuR2DcDOtqeldhMvcFya5P0QEz18qh/QjYI0rweB3n?=
 =?us-ascii?Q?UL63h+HItVb73QpybfJp6vn48DwhWS3uSsu6YRD9NnVkxAjZ+61NH3cxl5cY?=
 =?us-ascii?Q?FAPjXiNA0/zS4uPjdTJ/E8EFpIaEh0bKqmECwOhZQtSIyWUloRkU7EKcg3fd?=
 =?us-ascii?Q?x7NohjfP9KO4/3SyEoCkRa0DoQoFgKzqjk4SF1eRWXk6Bye2rHyJyhLp8uDF?=
 =?us-ascii?Q?pFPhK00/qSR9DjKQtHkbLa877MXBoZAI+iewRqvk3sWkno6sC1UnPcSzCFzd?=
 =?us-ascii?Q?tka370fNU4TfWT9L/uE2Sy4pv70uXbrKAU1ewRQZQ3/pXU2Df148V6vdj4FL?=
 =?us-ascii?Q?mNv3onIkuom5A5eqcChYj48=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed80f79-916d-44a0-bb69-08d9d5b06a4d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 09:46:32.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbnJYlnxIc7cpaV5vc/BW0HW9wlMulr7n3OvDEQGUUcWfY03LIF28WkJykmSSTkIjxaqot2ceBSA5sKit3vdGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2953
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the AMS and Collision Avoidance, tcpm often needs to change the CC's
termination. When one CC line is souring Vconn, if we still change its
termination, the voltage of the another CC line is likely to be fluctuant
and unstable.

Therefore, we should verify whether a CC line is soucing Vconn before
changing its termination. And only changing the termination that is
not a Vconn line. This can be done by reading the VCONN Present bit of
POWER_ STATUS register. To determinate the polarity, we can read the
Plug Orientation bit of TCPC_CONTROL register. Since only if Plug
Orientation is set, Vconn can be sourced.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
v2: changed subject line
---
 drivers/usb/typec/tcpm/tcpci.c | 27 +++++++++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 35a1307349a2..0bf4cbfaa21c 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -75,9 +75,26 @@ static int tcpci_write16(struct tcpci *tcpci, unsigned int reg, u16 val)
 static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	bool vconn_pres = false;
+	enum typec_cc_polarity polarity = TYPEC_POLARITY_CC1;
 	unsigned int reg;
 	int ret;
 
+	ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS, &reg);
+	if (ret < 0)
+		return ret;
+
+	if (reg & TCPC_POWER_STATUS_VCONN_PRES) {
+		vconn_pres = true;
+
+		ret = regmap_read(tcpci->regmap, TCPC_TCPC_CTRL, &reg);
+		if (ret < 0)
+			return ret;
+
+		if (reg & TCPC_TCPC_CTRL_ORIENTATION)
+			polarity = TYPEC_POLARITY_CC2;
+	}
+
 	switch (cc) {
 	case TYPEC_CC_RA:
 		reg = (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT) |
@@ -112,6 +129,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc)
 		break;
 	}
 
+	if (vconn_pres) {
+		if (polarity == TYPEC_POLARITY_CC2) {
+			reg &= ~(TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT);
+			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC1_SHIFT);
+		} else {
+			reg &= ~(TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT);
+			reg |= (TCPC_ROLE_CTRL_CC_OPEN << TCPC_ROLE_CTRL_CC2_SHIFT);
+		}
+	}
+
 	ret = regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 2be7a77d400e..b2edd45f13c6 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -98,6 +98,7 @@
 #define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
 #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
 #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
+#define TCPC_POWER_STATUS_VCONN_PRES	BIT(1)
 #define TCPC_POWER_STATUS_SINKING_VBUS	BIT(0)
 
 #define TCPC_FAULT_STATUS		0x1f
-- 
2.25.1

