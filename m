Return-Path: <linux-usb+bounces-37221-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ8lEJtCAWpwTAEAu9opvQ
	(envelope-from <linux-usb+bounces-37221-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:44:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6495074AC
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32E703031823
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 02:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536412FE071;
	Mon, 11 May 2026 02:42:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022138.outbound.protection.outlook.com [40.107.75.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AC2FFDF8;
	Mon, 11 May 2026 02:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467375; cv=fail; b=DePKSKlFpTOjWHaJf7stDxB+kFAyoG7NzXutD6HRpAO/vleKyay6PVhoGNyOjhxQ9nzjEE0JUpsIYzGe/mHyH781IWZwC9fClYvnVJ+mHbLAtTeMX31dYkCT2krDPKS7+qilLTFumJDMxGmKGD+BsmQHfDsy2a0roAuNEN0lTTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467375; c=relaxed/simple;
	bh=rPLo1gIK+HpJLgJxdr+ulLPxl+ByMNCSWWYDzGwft6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PTbe4uRxr5gfmQASHMxWmvOCzvmchO5mOOzLzxiONslcH1PbkbjBrCBnu1NK5YYHQAZXfeM2neCI0rI2CSOUzLdi5Kpe8wL3skQv/QgD01MUOALWeEyJeGiAERfDcR+8/Bu1miGHljKEoAu9cRxNOEpVM1/A5vmjkCgi0vCjdqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZomEZJab37TQKlxirplH5mkEmVz4WDeTwXJns+zdFNRhkhq6SYvjlLwJfcVjLPUAO5OlfLo3x5r6Wv0qUdUmz/1KacIM84ZTb07GY4AfVeT7g4eoSNng9UYyD/SNC6H1YICTmVmdH/bxAux+0QDhJB/vU8NedwbUQce6QjwtPKiJ6FLyM2cOkdo50iPG5hJjXne/czGYKP3/R1pzC0gw/prlR1a+wm8AJbLtf8ZTQPhP84Cl4P03VtWsmaZXVh/C94BYR8a3FKzhPLSwJbybikQ+gA/Q/rVwoF7iCfSYmkQeDkAx1KnzOdhzLjc8t5NBE1MdlQDkW65XWQ5s6218lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEONwdvWSOZVDiRJQfYjimFlhGZB4X1lXbjgFUt0viA=;
 b=dMOW7qBx+/9UP3axuwPgd5qS942jpwagjCVD/A5M/HdqNF/iOKxp03ojL2bb1VGm/ZlYpQpcMa+IJgzu4DJ/mH/j3h2xhcbiPyl/8nEsvUYYo6ir9t3NWKAHpgF7q3jnODWAS4GMtg/XC9q1bmKPkPU6WQ2GxsGDyb7qnwakQjaOshGtKuhSZIGZ8EXVXbEYn9rwRC4C/to6LF1tHdSAytXUKECH2dTsTpFFblEr1zcgwjDq4BQwV2PsYLemNI0jFxAJ0dGdQjUSmksNvUTmMFHi0hxl/cmzo5OM7Hhxl75mlaHXSK6OkKQLbFJ9OrCvWcrBUUrCas6HyGPggZXN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6) by
 KL1PR06MB5895.apcprd06.prod.outlook.com (2603:1096:820:c9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.22; Mon, 11 May 2026 02:42:47 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:4:c6:cafe::13) by SG2P153CA0037.outlook.office365.com
 (2603:1096:4:c6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.4 via Frontend Transport; Mon, 11
 May 2026 02:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:42:46 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 369754126F93;
	Mon, 11 May 2026 10:42:45 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 2/4] usb: cdns3: sky1: Add cdnsp-sky1 glue driver
Date: Mon, 11 May 2026 10:42:42 +0800
Message-ID: <20260511024244.981941-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511024244.981941-1-peter.chen@cixtech.com>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KL1PR06MB5895:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e41cdc2-d62e-4a58-71f9-08deaf06fc03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wsbJa23UKvMc5Hz3IzJfSv7MocZNm7MBMyGIyuusJnpnKYjKQflI0S5EtDfq9G9iYQ0+xMrEw6vxviRQj2zGNwQdf825fHZHm26fQT45OgX2TnCUh+ru85r85u+qN/dVRluW3vmp2xUCjqWZ0rCFU7ot9WxTSd1nbtMCokzkp4/EVvZ2V6SpYqywiktP1FcZd1zavN81KF5c0oICNijBaNL6YvlvnfNtxt1tLJbf7JLRHiyB4D2xKK/oD/DavjXd7VpsBgsnCtIekHGUCbDg5c+SyonzemPoEf1j6HLgDqCuA2TPXk84fmD8ihz9jrHjdeYAhcXCo5erLsscGnupfC0l/nNWzeZBLClK367KF6lxbttFmd9mxHBNzevL0D96W0S/cYQ8egNebYbJCFxF8PcAUb7rNHRKfpUrYJYXLRHB2iaXRuweUIxMRAaaCVpVVXqIFlDe8WNJ7IBOyL4s1YdCuB8mFbb5iLvp+dhWfWrV1IaNDTliKiDB0Nv/F73G9dFOVryCvjEQ/SxzHO+R/h1Oo7zrNdCmOXnDKf0lT8LpE7uLDNSPgMnM1RC30YdZAIURiy3ReX9TU2WDTU/KUkPIIKoCcqAIOOMf5FwMQV2eO2ENIVftY+HBznXltni30JkRniRCzDRq91xGDzHYkvQazgzrmXklHP3iDWteozHeNK1qxF1Mxi2sz7JTm+snunWDUTSb1KJIYkcT8iR4RYUrtJnGH/1pcu1K3Fxnlac=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V1HNuG7OD43eGXvTytpH3S1vIrXiDau36xthE5W8k7jJC7C0h7/D6rHgJkka7Pg/kGpgqfwclK4YdQfNY7ZhT8erzxcfDx7vGFrI67zjgQyGdVW73R2NLW0wjo+rzTtzHa8YkXRJIPWqqGLSWbE6Fw4Cz04SSDTA/Jz3umpHB6uzKB+H21sfCYdKw7tJ+TBBOUzObH7Pims5jpGevv/0EZ0fiMYlHZCVIEEXEbgMLIHylhPRSySlHPLWLaevt2Fn+hKBOVJq+FOrI4gwGFlsuiHipIvJWyPWaJHOwZhr5j+8CfJvBFL/M7ZIiqGirpim2pRGY++yeeDBeFKd8XJwOuF16T/ICbj1SJzQqlGLf6nf3rewOMDNStNRDdR7vG8YTs/EUL6H8L6KuTydGRYfzb9iaKxTUC7n+aFObLURNX2us6QrL4PS4a37imC87Gcs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:42:46.3674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e41cdc2-d62e-4a58-71f9-08deaf06fc03
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5895
X-Rspamd-Queue-Id: AC6495074AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[cixtech.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37221-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.667];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a CIX sky1 platform glue driver with Kconfig and Makefile entry.
It calls APIs exported from cdns3-plat.c for probe/remote/suspend/resume
routines.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 drivers/usb/cdns3/Kconfig      |  13 ++
 drivers/usb/cdns3/Makefile     |   1 +
 drivers/usb/cdns3/cdnsp-sky1.c | 252 +++++++++++++++++++++++++++++++++
 3 files changed, 266 insertions(+)
 create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index 39ad23d1ada8..7d7c322ea865 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -110,6 +110,19 @@ config USB_CDNS3_STARFIVE
 	  If you choose to build this driver as module it will
 	  be dynamically linked and module will be called cdns3-starfive.ko
 
+config USB_CDNSP_SKY1
+	tristate "Cadence USB3 support on CIX Sky1 SoC platforms"
+	depends on USB_CDNS3
+	depends on ARCH_CIX || COMPILE_TEST
+	default USB_CDNS3
+	help
+	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
+	  (device tree compatible cix,sky1-usb3). It enables clocks and resets
+	  from the SoC, then uses the shared cdns3 platform core (cdns.ko).
+
+	  If built as a module, the module is named cdnsp-sky1.ko and must be
+	  loaded after the cdns core module when both are loadable modules.
+
 endif # USB_CDNS3
 
 endif # USB_CDNS_SUPPORT
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index b2e4ba6a49a3..ab813aaf9940 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_USB_CDNSP_PCI)			+= cdnsp-pci.o
 obj-$(CONFIG_USB_CDNS3_TI)			+= cdns3-ti.o
 obj-$(CONFIG_USB_CDNS3_IMX)			+= cdns3-imx.o
 obj-$(CONFIG_USB_CDNS3_STARFIVE)		+= cdns3-starfive.o
+obj-$(CONFIG_USB_CDNSP_SKY1)			+= cdnsp-sky1.o
diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky1.c
new file mode 100644
index 000000000000..049044e3d09b
--- /dev/null
+++ b/drivers/usb/cdns3/cdnsp-sky1.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * cdnsp-sky1.c - CIX Sky1 glue for Cadence USBSSP DRD controller
+ *
+ * Copyright (C) 2026 CIX Technology Group Co., Ltd.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include "glue.h"
+
+#define AXI_SETTING_OFFSET		0x0
+/* Normal Non-cacheable Bufferable */
+#define SKY1_USB_AXI_WR_CACHE_VALUE	0x33
+
+/* USB mode strap in S5 syscon */
+#define USB_MODE_STRAP_S5_DOMAIN	0x424
+#define MODE_STRAP_OTG			0
+
+#define U3_TYPEC_DRD_ID			0
+#define U3_TYPEC_HOST0_ID		1
+#define U3_TYPEC_HOST1_ID		2
+#define U3_TYPEC_HOST2_ID		3
+#define U3_TYPEA_CTRL0_ID		4
+#define U3_TYPEA_CTRL1_ID		5
+#define U2_HOST0_ID			6
+#define U2_HOST1_ID			7
+#define U2_HOST2_ID			8
+#define U2_HOST3_ID			9
+#define SKY1_USB_S5_NUM			10
+
+#define U3_TYPEC_DRD_MODE_STRAP_BIT		12
+#define U3_TYPEC_HOST0_MODE_STRAP_BIT		14
+#define U3_TYPEC_HOST1_MODE_STRAP_BIT		16
+#define U3_TYPEC_HOST2_MODE_STRAP_BIT		18
+#define U3_TYPEA_CTRL0_MODE_STRAP_BIT		8
+#define U3_TYPEA_CTRL1_MODE_STRAP_BIT		10
+#define U2_HOST0_MODE_STRAP_BIT			0
+#define U2_HOST1_MODE_STRAP_BIT			2
+#define U2_HOST2_MODE_STRAP_BIT			4
+#define U2_HOST3_MODE_STRAP_BIT			6
+
+struct cdnsp_sky1_strap_signal {
+	unsigned int offset, bit;
+};
+
+static const struct cdnsp_sky1_strap_signal strap_signals[SKY1_USB_S5_NUM] = {
+	[U3_TYPEC_DRD_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_DRD_MODE_STRAP_BIT },
+	[U3_TYPEC_HOST0_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_HOST0_MODE_STRAP_BIT },
+	[U3_TYPEC_HOST1_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_HOST1_MODE_STRAP_BIT },
+	[U3_TYPEC_HOST2_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEC_HOST2_MODE_STRAP_BIT },
+	[U3_TYPEA_CTRL0_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEA_CTRL0_MODE_STRAP_BIT },
+	[U3_TYPEA_CTRL1_ID]	= { USB_MODE_STRAP_S5_DOMAIN, U3_TYPEA_CTRL1_MODE_STRAP_BIT },
+	[U2_HOST0_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST0_MODE_STRAP_BIT },
+	[U2_HOST1_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST1_MODE_STRAP_BIT },
+	[U2_HOST2_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST2_MODE_STRAP_BIT },
+	[U2_HOST3_ID]		= { USB_MODE_STRAP_S5_DOMAIN, U2_HOST3_MODE_STRAP_BIT },
+};
+
+struct cdnsp_sky1 {
+	struct device *dev;
+	struct cdns cdns;
+	struct regmap *usb_syscon;
+	void __iomem *glue_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+};
+
+/**
+ * sky1_set_mode_by_id - program one USB controller mode strap
+ * @syscon: regmap for S5 syscon (from DT property cix,syscon-usb)
+ * @id: controller slot ID (U3_TYPEC_DRD_ID .. U2_HOST3_ID)
+ * @mode: MODE_STRAP_OTG, MODE_STRAP_HOST, or MODE_STRAP_DEVICE
+ */
+static int cdnsp_sky1_set_mode_by_id(struct regmap *syscon, int id, int mode)
+{
+	if (id < 0 || id >= SKY1_USB_S5_NUM)
+		return -EINVAL;
+
+	return regmap_update_bits(syscon,
+				  strap_signals[id].offset,
+				  GENMASK(strap_signals[id].bit + 1,
+					  strap_signals[id].bit),
+				  (unsigned int)mode << strap_signals[id].bit);
+}
+
+static int cdnsp_sky1_set_all_controllers_otg(struct regmap *syscon)
+{
+	int id, ret;
+
+	for (id = 0; id < SKY1_USB_S5_NUM; id++) {
+		ret = cdnsp_sky1_set_mode_by_id(syscon, id, MODE_STRAP_OTG);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct clk_bulk_data cdnsp_sky1_cdns_core_clks[] = {
+	{ .id = "sof" },
+	{ .id = "aclk" },
+	{ .id = "lpm" },
+	{ .id = "pclk" },
+};
+
+static int cdnsp_sky1_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdnsp_sky1 *priv;
+	struct cdns *cdns;
+	struct cdns3_probe_data probe_data;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->num_clks = ARRAY_SIZE(cdnsp_sky1_cdns_core_clks);
+	priv->clks = devm_kmemdup(dev, cdnsp_sky1_cdns_core_clks,
+				   sizeof(cdnsp_sky1_cdns_core_clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
+	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+
+	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clocks\n");
+
+	priv->usb_syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
+							   "cix,syscon-usb");
+	if (IS_ERR(priv->usb_syscon))
+		return dev_err_probe(dev, PTR_ERR(priv->usb_syscon),
+				     "failed to get cix,syscon-usb regmap\n");
+
+	ret = cdnsp_sky1_set_all_controllers_otg(priv->usb_syscon);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to set USB controllers to OTG strap\n");
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
+	if (!res)
+		goto err_clk;
+
+	priv->glue_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->glue_base)) {
+		ret = PTR_ERR(priv->glue_base);
+		goto err_clk;
+	}
+
+	/* Set ARCACHE and AWCACHE */
+	writel(SKY1_USB_AXI_WR_CACHE_VALUE, priv->glue_base + AXI_SETTING_OFFSET);
+
+	cdns = &priv->cdns;
+	cdns->dev = dev;
+
+	probe_data.cdns = cdns;
+	probe_data.pdev = pdev;
+
+	ret = cdns3_core_probe(&probe_data);
+	if (ret)
+		goto err_clk;
+
+	return 0;
+
+err_clk:
+	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
+
+	return ret;
+}
+
+static void cdnsp_sky1_remove(struct platform_device *pdev)
+{
+	struct cdns *cdns = platform_get_drvdata(pdev);
+	struct cdnsp_sky1 *priv;
+
+	if (!cdns)
+		return;
+
+	cdns3_core_remove(cdns);
+	priv = container_of(cdns, struct cdnsp_sky1, cdns);
+	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
+}
+
+#ifdef CONFIG_PM
+static int cdnsp_sky1_runtime_suspend(struct device *dev)
+{
+	return cdns3_runtime_suspend(dev_get_drvdata(dev));
+}
+
+static int cdnsp_sky1_runtime_resume(struct device *dev)
+{
+	return cdns3_runtime_resume(dev_get_drvdata(dev));
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int cdnsp_sky1_suspend(struct device *dev)
+{
+	return cdns3_pm_suspend(dev_get_drvdata(dev));
+}
+
+static int cdnsp_sky1_resume(struct device *dev)
+{
+	return cdns3_pm_resume(dev_get_drvdata(dev));
+}
+#endif /* CONFIG_PM_SLEEP */
+#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops cdnsp_sky1_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cdnsp_sky1_suspend, cdnsp_sky1_resume)
+	SET_RUNTIME_PM_OPS(cdnsp_sky1_runtime_suspend,
+			   cdnsp_sky1_runtime_resume, NULL)
+};
+
+static const struct of_device_id cdnsp_sky1_of_match[] = {
+	{ .compatible = "cix,sky1-usb3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cdnsp_sky1_of_match);
+
+static struct platform_driver cdnsp_sky1_driver = {
+	.probe		= cdnsp_sky1_probe,
+	.remove		= cdnsp_sky1_remove,
+	.driver		= {
+		.name		= "cdnsp-sky1",
+		.of_match_table	= of_match_ptr(cdnsp_sky1_of_match),
+		.pm		= &cdnsp_sky1_pm_ops,
+	},
+};
+
+module_platform_driver(cdnsp_sky1_driver);
+
+MODULE_SOFTDEP("pre: cdns");
+MODULE_ALIAS("platform:cdnsp-sky1");
+MODULE_DESCRIPTION("CIX Sky1 Cadence USBSSP DRD glue driver");
+MODULE_AUTHOR("Peter Chen <peter.chen@cixtech.com>");
+MODULE_LICENSE("GPL");
-- 
2.50.1


