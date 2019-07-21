Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23C066F4B0
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2019 20:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfGUSeW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jul 2019 14:34:22 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:6058 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727222AbfGUSeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jul 2019 14:34:21 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6LIWPmO008270;
        Sun, 21 Jul 2019 11:33:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=u3RO98U0p8yO2xUabOpDKtARUMlscTUQRvL0TyUf9h8=;
 b=Nkw59qFcjFYeFSr/PJsWX2v/cYpsh73pGwrDrvUZesD3QiYWyL1DmsLi53T9sYawdRIn
 s5lOP+Zc9fekWrHVMNTu0R3Cw+5FOVI/CK477jV3ZMfGRFHvPO8Ao3u6RQxdRps4i+2W
 iECky+UcBoT6W4hryM2kUTr8Ow9ML1O2+aIc95UdY/YOfhY0cpqL/Ms7LrjF+ApS/Edl
 PMyVw3qdBqmbkha8nmdk31oT5QPVbxbWpwS9pcvnh5vG7aCZIKiIi8pOonxLPeZxdbm7
 cAtQHo0x+wITTPx3JQiOdYnCcr+JALLrb1NUAN0Vltid/qgZwVo3ng4pytEn8ES5wBWe rg== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=pawell@cadence.com
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2059.outbound.protection.outlook.com [104.47.45.59])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2tuygwkrqx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Sun, 21 Jul 2019 11:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSIGXU+fo+gfxHfmo+Tqh4GTS0M0V0/W7k6DIhINnNR4LPXvPlgoUC4vTkbeZVZzLgzsNuOTHstAtlofVaR+RjP5amY6BCSecZJcK1ne3eD1mUW9nvW3x1Ch7Ccm7RCaacFF38IHQVt+t+9eOZAeX5K+KIUcp1fUI/NE6QKk0pvVyKWBjv4gDzM8MY6glLRFU3+J1Avms5EMgVwlTypKsRWQ3GRfkJ7pJZLk914j/Y3HR7MZPyqB2APilhuXKJ7VSdDMTW5sEAv2MOWPmH3nOdXnoaaRe6tiMgjZ+YwUVBfwbeTsOECblXg7mag944c7dEuXV5m0l5nVuxRNk8b5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3RO98U0p8yO2xUabOpDKtARUMlscTUQRvL0TyUf9h8=;
 b=QDwNdgbS5zXFDHYWEi0qhlKBhdh/853u5AKu29/jry4RUJPypsf1OapL6ZHD8fTYeOJWuXl/6CMLj3nncJil97PcJvsezgqIS8U5Gvvel9nC7DwuG9MOCDMziHNbH2trqyxgfYh2ER+seWvOchGGKZlsisvyZys0/1D9loekyu3+cZCIIYFBpMdXfJ238WMzaweUjowqkXNFwfk+AlX8Z/pansDRQlBZr6FPEugHFFZFJyr2IjO/RNsq2P4HnfpMJ8Y3aA4P6zluGy+lxt4QXHaf91m/YAfeI/fR/K8Wt9OiSHO4JVulWj00FTwucpomw+DTqlN2VlIw4wuFU8X7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=softfail (sender ip is
 199.43.4.28) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=cadence.com;dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3RO98U0p8yO2xUabOpDKtARUMlscTUQRvL0TyUf9h8=;
 b=bqh4auRTz4oYhWHlz0LYwIZYUh1mG1Jkl6gBRkpGf3Nc2vFCwwyzHSPaq37gfQ2g1Or4CUN/LdwH9a29kZ/o22U+jW7Uy5ilcGAz92+R/0qza835W9qbOb1txBb9yoRDTNbUXFqLrhFJ+CbTig3QYMBW43axVbrrHjLL7WAP3cQ=
Received: from SN4PR0701CA0028.namprd07.prod.outlook.com
 (2603:10b6:803:2d::29) by CH2SPR01MB0016.namprd07.prod.outlook.com
 (2603:10b6:610:3a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Sun, 21 Jul
 2019 18:33:02 +0000
Received: from CO1NAM05FT014.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::206) by SN4PR0701CA0028.outlook.office365.com
 (2603:10b6:803:2d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Sun, 21 Jul 2019 18:33:02 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 CO1NAM05FT014.mail.protection.outlook.com (10.152.96.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.4 via Frontend Transport; Sun, 21 Jul 2019 18:33:01 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x6LIWoeY006437
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Sun, 21 Jul 2019 14:32:57 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 21 Jul 2019 20:32:51 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 21 Jul 2019 20:32:51 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
        by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x6LIWpKb022420;
        Sun, 21 Jul 2019 19:32:51 +0100
Received: (from pawell@localhost)
        by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x6LIWpMh022419;
        Sun, 21 Jul 2019 19:32:51 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <felipe.balbi@linux.intel.com>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <jbergsagel@ti.com>, <nsekhar@ti.com>, <nm@ti.com>,
        <sureshp@cadence.com>, <jpawar@cadence.com>, <kurahul@cadence.com>,
        <aniljoy@cadence.com>, Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v10 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date:   Sun, 21 Jul 2019 19:32:18 +0100
Message-ID: <1563733939-21214-6-git-send-email-pawell@cadence.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1563733939-21214-1-git-send-email-pawell@cadence.com>
References: <1563733939-21214-1-git-send-email-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(51234002)(36092001)(199004)(189003)(50466002)(2906002)(54906003)(42186006)(107886003)(16586007)(81156014)(81166006)(14444005)(316002)(19627235002)(50226002)(53946003)(53936002)(305945005)(2351001)(4326008)(48376002)(8936002)(11346002)(426003)(5660300002)(446003)(8676002)(186003)(126002)(2616005)(476003)(4720700003)(6916009)(51416003)(76176011)(70586007)(70206006)(336012)(36756003)(30864003)(76130400001)(486006)(86362001)(69596002)(26005)(47776003)(87636003)(6666004)(478600001)(356004)(68736007)(26826003)(559001)(579004)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2SPR01MB0016;H:rmmaillnx1.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:InfoDomainNonexistent;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ffb84bf-809b-4639-159f-08d70e09dcad
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:CH2SPR01MB0016;
X-MS-TrafficTypeDiagnostic: CH2SPR01MB0016:
X-Microsoft-Antispam-PRVS: <CH2SPR01MB00168F177DB5514E16959FBFDDC50@CH2SPR01MB0016.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0105DAA385
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: g3MWRsIOglRg3wJtHnGAo15vsxlENVr1P8Qs5xMhseN/l+Zj1bnTl6AwdEgpSGuvxq3ZaL5y5BLn7upgHGzijv6ZwRiEENwRzdYH4dbyOg5lWlPeGgK7WYa8/PUMLXrFlvbOrXq0DzARlpRR+FeZ0rQS6ckC99aeYpXOq31cvXIFo7hBBjQPHoGToej5zAohYcxdDZsuAeUVzn7QOTwOLlgTj78LK8P8pEQq+twdNj787VTK1mnJ/yLP1PYnG3E4BC1lLTZz8feTrYBcXmKAMI62awXwelulEK1++5QtsXxNV6FZujOeBpeF4gHHpxNNRaoVCojVDOWoHqpDSLE9eXFwYjPHnBnUCSL3z+JI4FxD/1etGzvbTmabYoO+H3TODsSY2Tqlno+TutmnVXNtIlmplYNuS/KYFq0qzjPLMv8=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2019 18:33:01.2306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffb84bf-809b-4639-159f-08d70e09dcad
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[199.43.4.28];Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2SPR01MB0016
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-21_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907210215
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch introduce new Cadence USBSS DRD driver to Linux kernel.

The Cadence USBSS DRD Controller is a highly configurable IP Core which
can be instantiated as Dual-Role Device (DRD), Peripheral Only and
Host Only (XHCI)configurations.

The current driver has been validated with FPGA platform. We have
support for PCIe bus, which is used on FPGA prototyping.

The host side of USBSS-DRD controller is compliant with XHCI
specification, so it works with standard XHCI Linux driver.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/Kconfig                |    2 +
 drivers/usb/Makefile               |    2 +
 drivers/usb/cdns3/Kconfig          |   46 +
 drivers/usb/cdns3/Makefile         |   17 +
 drivers/usb/cdns3/cdns3-pci-wrap.c |  203 +++
 drivers/usb/cdns3/core.c           |  554 +++++++
 drivers/usb/cdns3/core.h           |  109 ++
 drivers/usb/cdns3/debug.h          |  171 ++
 drivers/usb/cdns3/debugfs.c        |   87 ++
 drivers/usb/cdns3/drd.c            |  390 +++++
 drivers/usb/cdns3/drd.h            |  166 ++
 drivers/usb/cdns3/ep0.c            |  914 +++++++++++
 drivers/usb/cdns3/gadget-export.h  |   28 +
 drivers/usb/cdns3/gadget.c         | 2338 ++++++++++++++++++++++++++++
 drivers/usb/cdns3/gadget.h         | 1321 ++++++++++++++++
 drivers/usb/cdns3/host-export.h    |   28 +
 drivers/usb/cdns3/host.c           |   71 +
 drivers/usb/cdns3/trace.c          |   11 +
 drivers/usb/cdns3/trace.h          |  493 ++++++
 19 files changed, 6951 insertions(+)
 create mode 100644 drivers/usb/cdns3/Kconfig
 create mode 100644 drivers/usb/cdns3/Makefile
 create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
 create mode 100644 drivers/usb/cdns3/core.c
 create mode 100644 drivers/usb/cdns3/core.h
 create mode 100644 drivers/usb/cdns3/debug.h
 create mode 100644 drivers/usb/cdns3/debugfs.c
 create mode 100644 drivers/usb/cdns3/drd.c
 create mode 100644 drivers/usb/cdns3/drd.h
 create mode 100644 drivers/usb/cdns3/ep0.c
 create mode 100644 drivers/usb/cdns3/gadget-export.h
 create mode 100644 drivers/usb/cdns3/gadget.c
 create mode 100644 drivers/usb/cdns3/gadget.h
 create mode 100644 drivers/usb/cdns3/host-export.h
 create mode 100644 drivers/usb/cdns3/host.c
 create mode 100644 drivers/usb/cdns3/trace.c
 create mode 100644 drivers/usb/cdns3/trace.h

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index e4b27413f528..c2e78882f8c2 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -113,6 +113,8 @@ source "drivers/usb/usbip/Kconfig"
 
 endif
 
+source "drivers/usb/cdns3/Kconfig"
+
 source "drivers/usb/mtu3/Kconfig"
 
 source "drivers/usb/musb/Kconfig"
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 7d1b8c82b208..ab125b966cac 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -12,6 +12,8 @@ obj-$(CONFIG_USB_DWC3)		+= dwc3/
 obj-$(CONFIG_USB_DWC2)		+= dwc2/
 obj-$(CONFIG_USB_ISP1760)	+= isp1760/
 
+obj-$(CONFIG_USB_CDNS3)		+= cdns3/
+
 obj-$(CONFIG_USB_MON)		+= mon/
 obj-$(CONFIG_USB_MTU3)		+= mtu3/
 
diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
new file mode 100644
index 000000000000..d0331613a355
--- /dev/null
+++ b/drivers/usb/cdns3/Kconfig
@@ -0,0 +1,46 @@
+config USB_CDNS3
+	tristate "Cadence USB3 Dual-Role Controller"
+	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
+	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	select USB_ROLE_SWITCH
+	help
+	  Say Y here if your system has a Cadence USB3 dual-role controller.
+	  It supports: dual-role switch, Host-only, and Peripheral-only.
+
+	  If you choose to build this driver is a dynamically linked
+	  as module, the module will be called cdns3.ko.
+
+if USB_CDNS3
+
+config USB_CDNS3_GADGET
+	bool "Cadence USB3 device controller"
+	depends on USB_GADGET=y || USB_GADGET=USB_CDNS3
+	help
+	  Say Y here to enable device controller functionality of the
+	  Cadence USBSS-DEV driver.
+
+	  This controller supports FF, HS and SS mode. It doesn't support
+	  LS and SSP mode.
+
+config USB_CDNS3_HOST
+	bool "Cadence USB3 host controller"
+	depends on USB=y || USB=USB_CDNS3
+	help
+	  Say Y here to enable host controller functionality of the
+	  Cadence driver.
+
+	  Host controller is compliant with XHCI so it will use
+	  standard XHCI driver.
+
+config USB_CDNS3_PCI_WRAP
+	tristate "Cadence USB3 support on PCIe-based platforms"
+	depends on USB_PCI && ACPI
+	default USB_CDNS3
+	help
+	  If you're using the USBSS Core IP with a PCIe, please say
+	  'Y' or 'M' here.
+
+	  If you choose to build this driver as module it will
+	  be dynamically linked and module will be called cdns3-pci.ko
+
+endif
diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
new file mode 100644
index 000000000000..6c58660b9cd1
--- /dev/null
+++ b/drivers/usb/cdns3/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+# define_trace.h needs to know how to find our header
+CFLAGS_trace.o				:= -I$(src)
+
+cdns3-y					:= core.o drd.o
+
+obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
+cdns3-$(CONFIG_DEBUG_FS)		+= debugfs.o
+cdns3-$(CONFIG_USB_CDNS3_GADGET)	+= gadget.o ep0.o
+
+ifneq ($(CONFIG_USB_CDNS3_GADGET),)
+cdns3-$(CONFIG_TRACING)			+= trace.o
+endif
+
+cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
+
+obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci-wrap.o
diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
new file mode 100644
index 000000000000..c41ddb61b857
--- /dev/null
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS PCI Glue driver
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+
+struct cdns3_wrap {
+	struct platform_device *plat_dev;
+	struct resource dev_res[6];
+	int devfn;
+};
+
+#define RES_IRQ_HOST_ID		0
+#define RES_IRQ_PERIPHERAL_ID	1
+#define RES_IRQ_OTG_ID		2
+#define RES_HOST_ID		3
+#define RES_DEV_ID		4
+#define RES_DRD_ID		5
+
+#define PCI_BAR_HOST		0
+#define PCI_BAR_DEV		2
+#define PCI_BAR_OTG		0
+
+#define PCI_DEV_FN_HOST_DEVICE	0
+#define PCI_DEV_FN_OTG		1
+
+#define PCI_DRIVER_NAME		"cdns3-pci-usbss"
+#define PLAT_DRIVER_NAME	"cdns-usb3"
+
+#define CDNS_VENDOR_ID		0x17cd
+#define CDNS_DEVICE_ID		0x0100
+
+static struct pci_dev *cdns3_get_second_fun(struct pci_dev *pdev)
+{
+	struct pci_dev *func;
+
+	/*
+	 * Gets the second function.
+	 * It's little tricky, but this platform has two function.
+	 * The fist keeps resources for Host/Device while the second
+	 * keeps resources for DRD/OTG.
+	 */
+	func = pci_get_device(pdev->vendor, pdev->device, NULL);
+	if (unlikely(!func))
+		return NULL;
+
+	if (func->devfn == pdev->devfn) {
+		func = pci_get_device(pdev->vendor, pdev->device, func);
+		if (unlikely(!func))
+			return NULL;
+	}
+
+	return func;
+}
+
+static int cdns3_pci_probe(struct pci_dev *pdev,
+			   const struct pci_device_id *id)
+{
+	struct platform_device_info plat_info;
+	struct cdns3_wrap *wrap;
+	struct resource *res;
+	struct pci_dev *func;
+	int err;
+
+	/*
+	 * for GADGET/HOST PCI (devfn) function number is 0,
+	 * for OTG PCI (devfn) function number is 1
+	 */
+	if (!id || (pdev->devfn != PCI_DEV_FN_HOST_DEVICE &&
+		    pdev->devfn != PCI_DEV_FN_OTG))
+		return -EINVAL;
+
+	func = cdns3_get_second_fun(pdev);
+	if (unlikely(!func))
+		return -EINVAL;
+
+	err = pcim_enable_device(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "Enabling PCI device has failed %d\n", err);
+		return err;
+	}
+
+	pci_set_master(pdev);
+
+	if (pci_is_enabled(func)) {
+		wrap = pci_get_drvdata(func);
+	} else {
+		wrap = kzalloc(sizeof(*wrap), GFP_KERNEL);
+		if (!wrap) {
+			pci_disable_device(pdev);
+			return -ENOMEM;
+		}
+	}
+
+	res = wrap->dev_res;
+
+	if (pdev->devfn == PCI_DEV_FN_HOST_DEVICE) {
+		/* function 0: host(BAR_0) + device(BAR_1).*/
+		dev_dbg(&pdev->dev, "Initialize Device resources\n");
+		res[RES_DEV_ID].start = pci_resource_start(pdev, PCI_BAR_DEV);
+		res[RES_DEV_ID].end =   pci_resource_end(pdev, PCI_BAR_DEV);
+		res[RES_DEV_ID].name = "dev";
+		res[RES_DEV_ID].flags = IORESOURCE_MEM;
+		dev_dbg(&pdev->dev, "USBSS-DEV physical base addr: %pa\n",
+			&res[RES_DEV_ID].start);
+
+		res[RES_HOST_ID].start = pci_resource_start(pdev, PCI_BAR_HOST);
+		res[RES_HOST_ID].end = pci_resource_end(pdev, PCI_BAR_HOST);
+		res[RES_HOST_ID].name = "xhci";
+		res[RES_HOST_ID].flags = IORESOURCE_MEM;
+		dev_dbg(&pdev->dev, "USBSS-XHCI physical base addr: %pa\n",
+			&res[RES_HOST_ID].start);
+
+		/* Interrupt for XHCI */
+		wrap->dev_res[RES_IRQ_HOST_ID].start = pdev->irq;
+		wrap->dev_res[RES_IRQ_HOST_ID].name = "host";
+		wrap->dev_res[RES_IRQ_HOST_ID].flags = IORESOURCE_IRQ;
+
+		/* Interrupt device. It's the same as for HOST. */
+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].start = pdev->irq;
+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].name = "peripheral";
+		wrap->dev_res[RES_IRQ_PERIPHERAL_ID].flags = IORESOURCE_IRQ;
+	} else {
+		res[RES_DRD_ID].start = pci_resource_start(pdev, PCI_BAR_OTG);
+		res[RES_DRD_ID].end =   pci_resource_end(pdev, PCI_BAR_OTG);
+		res[RES_DRD_ID].name = "otg";
+		res[RES_DRD_ID].flags = IORESOURCE_MEM;
+		dev_dbg(&pdev->dev, "USBSS-DRD physical base addr: %pa\n",
+			&res[RES_DRD_ID].start);
+
+		/* Interrupt for OTG/DRD. */
+		wrap->dev_res[RES_IRQ_OTG_ID].start = pdev->irq;
+		wrap->dev_res[RES_IRQ_OTG_ID].name = "otg";
+		wrap->dev_res[RES_IRQ_OTG_ID].flags = IORESOURCE_IRQ;
+	}
+
+	if (pci_is_enabled(func)) {
+		/* set up platform device info */
+		memset(&plat_info, 0, sizeof(plat_info));
+		plat_info.parent = &pdev->dev;
+		plat_info.fwnode = pdev->dev.fwnode;
+		plat_info.name = PLAT_DRIVER_NAME;
+		plat_info.id = pdev->devfn;
+		wrap->devfn  = pdev->devfn;
+		plat_info.res = wrap->dev_res;
+		plat_info.num_res = ARRAY_SIZE(wrap->dev_res);
+		plat_info.dma_mask = pdev->dma_mask;
+		/* register platform device */
+		wrap->plat_dev = platform_device_register_full(&plat_info);
+		if (IS_ERR(wrap->plat_dev)) {
+			pci_disable_device(pdev);
+			kfree(wrap);
+			return PTR_ERR(wrap->plat_dev);
+		}
+	}
+
+	pci_set_drvdata(pdev, wrap);
+	return err;
+}
+
+static void cdns3_pci_remove(struct pci_dev *pdev)
+{
+	struct cdns3_wrap *wrap;
+	struct pci_dev *func;
+
+	func = cdns3_get_second_fun(pdev);
+
+	wrap = (struct cdns3_wrap *)pci_get_drvdata(pdev);
+	if (wrap->devfn == pdev->devfn)
+		platform_device_unregister(wrap->plat_dev);
+
+	if (!pci_is_enabled(func))
+		kfree(wrap);
+}
+
+static const struct pci_device_id cdns3_pci_ids[] = {
+	{ PCI_DEVICE(CDNS_VENDOR_ID, CDNS_DEVICE_ID), },
+	{ 0, }
+};
+
+static struct pci_driver cdns3_pci_driver = {
+	.name = PCI_DRIVER_NAME,
+	.id_table = cdns3_pci_ids,
+	.probe = cdns3_pci_probe,
+	.remove = cdns3_pci_remove,
+};
+
+module_pci_driver(cdns3_pci_driver);
+MODULE_DEVICE_TABLE(pci, cdns3_pci_ids);
+
+MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cadence USBSS PCI wrapperr");
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
new file mode 100644
index 000000000000..900b2ce08162
--- /dev/null
+++ b/drivers/usb/cdns3/core.c
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver.
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ * Copyright (C) 2017-2018 NXP
+ * Copyright (C) 2019 Texas Instruments
+ *
+ * Author: Peter Chen <peter.chen@nxp.com>
+ *         Pawel Laszczak <pawell@cadence.com>
+ *         Roger Quadros <rogerq@ti.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+
+#include "gadget.h"
+#include "core.h"
+#include "host-export.h"
+#include "gadget-export.h"
+#include "drd.h"
+#include "debug.h"
+
+static inline
+struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
+{
+	WARN_ON(!cdns->roles[cdns->role]);
+	return cdns->roles[cdns->role];
+}
+
+static int cdns3_role_start(struct cdns3 *cdns, enum usb_role role)
+{
+	int ret;
+
+	if (WARN_ON(role > USB_ROLE_DEVICE))
+		return 0;
+
+	mutex_lock(&cdns->mutex);
+	cdns->role = role;
+	mutex_unlock(&cdns->mutex);
+
+	if (role == USB_ROLE_NONE)
+		return 0;
+
+	if (!cdns->roles[role])
+		return -ENXIO;
+
+	if (cdns->roles[role]->state == CDNS3_ROLE_STATE_ACTIVE)
+		return 0;
+
+	mutex_lock(&cdns->mutex);
+	if (role == USB_ROLE_HOST)
+		cdns3_drd_switch_host(cdns, 1);
+	else
+		cdns3_drd_switch_gadget(cdns, 1);
+
+	ret = cdns->roles[role]->start(cdns);
+	if (!ret)
+		cdns->roles[role]->state = CDNS3_ROLE_STATE_ACTIVE;
+	mutex_unlock(&cdns->mutex);
+
+	return ret;
+}
+
+static void cdns3_role_stop(struct cdns3 *cdns)
+{
+	enum usb_role role = cdns->role;
+
+	if (WARN_ON(role > USB_ROLE_DEVICE))
+		return;
+
+	if (role == USB_ROLE_NONE)
+		return;
+
+	if (cdns->roles[role]->state == CDNS3_ROLE_STATE_INACTIVE)
+		return;
+
+	mutex_lock(&cdns->mutex);
+	cdns->roles[role]->stop(cdns);
+	if (role == USB_ROLE_HOST)
+		cdns3_drd_switch_host(cdns, 0);
+	else
+		cdns3_drd_switch_gadget(cdns, 0);
+
+	cdns->roles[role]->state = CDNS3_ROLE_STATE_INACTIVE;
+	mutex_unlock(&cdns->mutex);
+}
+
+static void cdns3_exit_roles(struct cdns3 *cdns)
+{
+	cdns3_role_stop(cdns);
+	cdns3_drd_exit(cdns);
+}
+
+enum usb_role cdsn3_real_role_switch_get(struct device *dev);
+
+/**
+ * cdns3_core_init_role - initialize role of operation
+ * @cdns: Pointer to cdns3 structure
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+static int cdns3_core_init_role(struct cdns3 *cdns)
+{
+	struct device *dev = cdns->dev;
+	enum usb_dr_mode best_dr_mode;
+	enum usb_dr_mode dr_mode;
+	int ret = 0;
+
+	dr_mode = usb_get_dr_mode(dev);
+	cdns->role = USB_ROLE_NONE;
+
+	/*
+	 * If driver can't read mode by means of usb_get_dr_mode function then
+	 * chooses mode according with Kernel configuration. This setting
+	 * can be restricted later depending on strap pin configuration.
+	 */
+	if (dr_mode == USB_DR_MODE_UNKNOWN) {
+		if (IS_ENABLED(CONFIG_USB_CDNS3_HOST) &&
+		    IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
+			dr_mode = USB_DR_MODE_OTG;
+		else if (IS_ENABLED(CONFIG_USB_CDNS3_HOST))
+			dr_mode = USB_DR_MODE_HOST;
+		else if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET))
+			dr_mode = USB_DR_MODE_PERIPHERAL;
+	}
+
+	/*
+	 * At this point cdns->dr_mode contains strap configuration.
+	 * Driver try update this setting considering kernel configuration
+	 */
+	best_dr_mode = cdns->dr_mode;
+
+	if (dr_mode == USB_DR_MODE_OTG) {
+		best_dr_mode = cdns->dr_mode;
+	} else if (cdns->dr_mode == USB_DR_MODE_OTG) {
+		best_dr_mode = dr_mode;
+	} else if (cdns->dr_mode != dr_mode) {
+		dev_err(dev, "Incorrect DRD configuration\n");
+		return -EINVAL;
+	}
+
+	dr_mode = best_dr_mode;
+
+	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_HOST) {
+		ret = cdns3_host_init(cdns);
+		if (ret) {
+			dev_err(dev, "Host initialization failed with %d\n",
+				ret);
+			goto err;
+		}
+	}
+
+	if (dr_mode == USB_DR_MODE_OTG || dr_mode == USB_DR_MODE_PERIPHERAL) {
+		ret = cdns3_gadget_init(cdns);
+		if (ret) {
+			dev_err(dev, "Device initialization failed with %d\n",
+				ret);
+			goto err;
+		}
+	}
+
+	cdns->desired_dr_mode = dr_mode;
+	cdns->dr_mode = dr_mode;
+
+	/*
+	 * desired_dr_mode might have changed so we need to update
+	 * the controller configuration"?
+	 */
+	ret = cdns3_drd_update_mode(cdns);
+	if (ret)
+		goto err;
+
+	cdns->role = cdsn3_real_role_switch_get(cdns->dev);
+
+	ret = cdns3_role_start(cdns, cdns->role);
+	if (ret) {
+		dev_err(dev, "can't start %s role\n",
+			cdns3_get_current_role_driver(cdns)->name);
+		goto err;
+	}
+
+	return ret;
+err:
+	cdns3_exit_roles(cdns);
+	return ret;
+}
+
+/**
+ * cdsn3_real_role_switch_get - get real role of controller based on hardware
+ *   settings.
+ * @dev: Pointer to device structure
+ *
+ * Returns role
+ */
+enum usb_role cdsn3_real_role_switch_get(struct device *dev)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	enum usb_role role;
+	int id, vbus;
+
+	if (cdns->current_dr_mode != USB_DR_MODE_OTG)
+		goto not_otg;
+
+	id = cdns3_get_id(cdns);
+	vbus = cdns3_get_vbus(cdns);
+
+	/*
+	 * Role change state machine
+	 * Inputs: ID, VBUS
+	 * Previous state: cdns->role
+	 * Next state: role
+	 */
+	role = cdns->role;
+
+	switch (role) {
+	case USB_ROLE_NONE:
+		/*
+		 * Driver treat USB_ROLE_NONE synonymous to IDLE state from
+		 * controller specification.
+		 */
+		if (!id)
+			role = USB_ROLE_HOST;
+		else if (vbus)
+			role = USB_ROLE_DEVICE;
+		break;
+	case USB_ROLE_HOST: /* from HOST, we can only change to NONE */
+		if (id)
+			role = USB_ROLE_NONE;
+		break;
+	case USB_ROLE_DEVICE: /* from GADGET, we can only change to NONE*/
+		if (!vbus)
+			role = USB_ROLE_NONE;
+		break;
+	}
+
+	dev_dbg(cdns->dev, "role %d -> %d\n", cdns->role, role);
+
+	return role;
+
+not_otg:
+	if (cdns3_is_host(cdns))
+		role = USB_ROLE_HOST;
+	if (cdns3_is_device(cdns))
+		role = USB_ROLE_DEVICE;
+
+	return role;
+}
+
+/**
+ * cdns3_role_switch_set - work queue handler for role switch
+ *
+ * @dev: pointer to device object
+ * @role - the previous role
+ * Handles below events:
+ * - Role switch for dual-role devices
+ * - USB_ROLE_GADGET <--> USB_ROLE_NONE for peripheral-only devices
+ */
+static int cdns3_role_switch_set(struct device *dev, enum usb_role role)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	enum usb_role real_role = USB_ROLE_NONE;
+	enum usb_role current_role;
+	int ret = 0;
+
+	/* Check if dr_mode was changed.*/
+	ret = cdns3_drd_update_mode(cdns);
+	if (ret)
+		return ret;
+
+	pm_runtime_get_sync(cdns->dev);
+
+	real_role = cdsn3_real_role_switch_get(cdns->dev);
+
+	/* Do nothing if nothing changed */
+	if (cdns->role == real_role)
+		goto exit;
+
+	cdns3_role_stop(cdns);
+
+	real_role = cdsn3_real_role_switch_get(cdns->dev);
+
+	current_role = role;
+	dev_dbg(cdns->dev, "Switching role");
+
+	ret = cdns3_role_start(cdns, real_role);
+	if (ret) {
+		/* Back to current role */
+		dev_err(cdns->dev, "set %d has failed, back to %d\n",
+			role, current_role);
+		ret = cdns3_role_start(cdns, current_role);
+		if (ret)
+			dev_err(cdns->dev, "back to %d failed too\n",
+				current_role);
+	}
+exit:
+	pm_runtime_put_sync(cdns->dev);
+	return ret;
+}
+
+static const struct usb_role_switch_desc cdns3_switch_desc = {
+	.set = cdns3_role_switch_set,
+	.get = cdsn3_real_role_switch_get,
+	.allow_userspace_control = true,
+};
+
+/**
+ * cdns3_probe - probe for cdns3 core device
+ * @pdev: Pointer to cdns3 core platform device
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+static int cdns3_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource	*res;
+	struct cdns3 *cdns;
+	void __iomem *regs;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "error setting dma mask: %d\n", ret);
+		return -ENODEV;
+	}
+
+	cdns = devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
+	if (!cdns)
+		return -ENOMEM;
+
+	cdns->dev = dev;
+
+	platform_set_drvdata(pdev, cdns);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_IRQ, "host");
+	if (!res) {
+		dev_err(dev, "missing host IRQ\n");
+		return -ENODEV;
+	}
+
+	cdns->xhci_res[0] = *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "xhci");
+	if (!res) {
+		dev_err(dev, "couldn't get xhci resource\n");
+		return -ENXIO;
+	}
+
+	cdns->xhci_res[1] = *res;
+
+	cdns->dev_irq = platform_get_irq_byname(pdev, "peripheral");
+	if (cdns->dev_irq == -EPROBE_DEFER)
+		return cdns->dev_irq;
+
+	if (cdns->dev_irq < 0)
+		dev_err(dev, "couldn't get peripheral irq\n");
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dev");
+	regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(regs)) {
+		dev_err(dev, "couldn't iomap dev resource\n");
+		return PTR_ERR(regs);
+	}
+	cdns->dev_regs	= regs;
+
+	cdns->otg_irq = platform_get_irq_byname(pdev, "otg");
+	if (cdns->otg_irq == -EPROBE_DEFER)
+		return cdns->otg_irq;
+
+	if (cdns->otg_irq < 0) {
+		dev_err(dev, "couldn't get otg irq\n");
+		return cdns->otg_irq;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
+	if (!res) {
+		dev_err(dev, "couldn't get otg resource\n");
+		return -ENXIO;
+	}
+
+	cdns->otg_res = *res;
+
+	mutex_init(&cdns->mutex);
+
+	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
+	if (IS_ERR(cdns->usb2_phy))
+		return PTR_ERR(cdns->usb2_phy);
+
+	phy_init(cdns->usb2_phy);
+	ret = phy_init(cdns->usb2_phy);
+	if (ret)
+		return ret;
+
+	cdns->usb3_phy = devm_phy_optional_get(dev, "cdns3,usb3-phy");
+	if (IS_ERR(cdns->usb3_phy))
+		return PTR_ERR(cdns->usb3_phy);
+
+	phy_init(cdns->usb3_phy);
+	ret = phy_init(cdns->usb3_phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(cdns->usb2_phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(cdns->usb3_phy);
+	if (ret)
+		goto err1;
+
+	cdns->role_sw = usb_role_switch_register(dev, &cdns3_switch_desc);
+	if (IS_ERR(cdns->role_sw)) {
+		ret = PTR_ERR(cdns->role_sw);
+		dev_warn(dev, "Unable to register Role Switch\n");
+		goto err2;
+	}
+
+	ret = cdns3_drd_init(cdns);
+	if (ret)
+		goto err3;
+
+	ret = cdns3_core_init_role(cdns);
+	if (ret)
+		goto err3;
+
+	cdns3_debugfs_init(cdns);
+	device_set_wakeup_capable(dev, true);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	/*
+	 * The controller needs less time between bus and controller suspend,
+	 * and we also needs a small delay to avoid frequently entering low
+	 * power mode.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 20);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_use_autosuspend(dev);
+	dev_dbg(dev, "Cadence USB3 core: probe succeed\n");
+
+	return 0;
+err3:
+	usb_role_switch_unregister(cdns->role_sw);
+err2:
+	phy_power_off(cdns->usb3_phy);
+
+err1:
+	phy_power_off(cdns->usb2_phy);
+	phy_exit(cdns->usb2_phy);
+	phy_exit(cdns->usb3_phy);
+
+	return ret;
+}
+
+/**
+ * cdns3_remove - unbind drd driver and clean up
+ * @pdev: Pointer to Linux platform device
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+static int cdns3_remove(struct platform_device *pdev)
+{
+	struct cdns3 *cdns = platform_get_drvdata(pdev);
+
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	cdns3_debugfs_exit(cdns);
+	cdns3_exit_roles(cdns);
+	usb_role_switch_unregister(cdns->role_sw);
+	phy_power_off(cdns->usb2_phy);
+	phy_power_off(cdns->usb3_phy);
+	phy_exit(cdns->usb2_phy);
+	phy_exit(cdns->usb3_phy);
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+
+static int cdns3_suspend(struct device *dev)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	if (cdns->role == USB_ROLE_HOST)
+		return 0;
+
+	if (pm_runtime_status_suspended(dev))
+		pm_runtime_resume(dev);
+
+	if (cdns->roles[cdns->role]->suspend) {
+		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
+		cdns->roles[cdns->role]->suspend(cdns, false);
+		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
+	}
+
+	return 0;
+}
+
+static int cdns3_resume(struct device *dev)
+{
+	struct cdns3 *cdns = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	if (cdns->role == USB_ROLE_HOST)
+		return 0;
+
+	if (cdns->roles[cdns->role]->resume) {
+		spin_lock_irqsave(&cdns->gadget_dev->lock, flags);
+		cdns->roles[cdns->role]->resume(cdns, false);
+		spin_unlock_irqrestore(&cdns->gadget_dev->lock, flags);
+	}
+
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops cdns3_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cdns3_suspend, cdns3_resume)
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_cdns3_match[] = {
+	{ .compatible = "cdns,usb3" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_cdns3_match);
+#endif
+
+static struct platform_driver cdns3_driver = {
+	.probe		= cdns3_probe,
+	.remove		= cdns3_remove,
+	.driver		= {
+		.name	= "cdns-usb3",
+		.of_match_table	= of_match_ptr(of_cdns3_match),
+		.pm	= &cdns3_pm_ops,
+	},
+};
+
+module_platform_driver(cdns3_driver);
+
+MODULE_ALIAS("platform:cdns3");
+MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cadence USB3 DRD Controller Driver");
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
new file mode 100644
index 000000000000..581a2f28aca4
--- /dev/null
+++ b/drivers/usb/cdns3/core.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USBSS DRD Header File.
+ *
+ * Copyright (C) 2017-2018 NXP
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Authors: Peter Chen <peter.chen@nxp.com>
+ *          Pawel Laszczak <pawell@cadence.com>
+ */
+#include <linux/usb/otg.h>
+#include <linux/usb/role.h>
+
+#ifndef __LINUX_CDNS3_CORE_H
+#define __LINUX_CDNS3_CORE_H
+
+struct cdns3;
+
+/**
+ * struct cdns3_role_driver - host/gadget role driver
+ * @start: start this role
+ * @stop: stop this role
+ * @suspend: suspend callback for this role
+ * @resume: resume callback for this role
+ * @irq: irq handler for this role
+ * @name: role name string (host/gadget)
+ * @state: current state
+ */
+struct cdns3_role_driver {
+	int (*start)(struct cdns3 *cdns);
+	void (*stop)(struct cdns3 *cdns);
+	int (*suspend)(struct cdns3 *cdns, bool do_wakeup);
+	int (*resume)(struct cdns3 *cdns, bool hibernated);
+	const char *name;
+#define CDNS3_ROLE_STATE_INACTIVE	0
+#define CDNS3_ROLE_STATE_ACTIVE		1
+	int state;
+};
+
+#define CDNS3_XHCI_RESOURCES_NUM	2
+/**
+ * struct cdns3 - Representation of Cadence USB3 DRD controller.
+ * @dev: pointer to Cadence device struct
+ * @xhci_regs: pointer to base of xhci registers
+ * @xhci_res: the resource for xhci
+ * @dev_regs: pointer to base of dev registers
+ * @otg_res: the resource for otg
+ * @otg_v0_regs: pointer to base of v0 otg registers
+ * @otg_v1_regs: pointer to base of v1 otg registers
+ * @otg_regs: pointer to base of otg registers
+ * @otg_irq: irq number for otg controller
+ * @dev_irq: irq number for device controller
+ * @roles: array of supported roles for this controller
+ * @role: current role
+ * @host_dev: the child host device pointer for cdns3 core
+ * @gadget_dev: the child gadget device pointer for cdns3 core
+ * @usb2_phy: pointer to USB2 PHY
+ * @usb3_phy: pointer to USB3 PHY
+ * @mutex: the mutex for concurrent code at driver
+ * @dr_mode: supported mode of operation it can be only Host, only Device
+ *           or OTG mode that allow to switch between Device and Host mode.
+ *           This field based on firmware setting, kernel configuration
+ *           and hardware configuration.
+ * @current_dr_mode: current mode of operation when in dual-role mode
+ * @desired_dr_mode: desired mode of operation when in dual-role mode.
+ *           This value can be changed during runtime.
+ *           Available options depends on  dr_mode:
+ *           dr_mode                 |  desired_dr_mode and current_dr_mode
+ *           ----------------------------------------------------------------
+ *           USB_DR_MODE_HOST        | only USB_DR_MODE_HOST
+ *           USB_DR_MODE_PERIPHERAL  | only USB_DR_MODE_PERIPHERAL
+ *           USB_DR_MODE_OTG         | USB_DR_MODE_OTG or USB_DR_MODE_HOST or
+ *                                   | USB_DR_MODE_PERIPHERAL
+ *           Desired_dr_role can be changed by means of debugfs.
+ * @role_sw: pointer to role switch object.
+ * @root: debugfs root folder pointer
+ */
+struct cdns3 {
+	struct device			*dev;
+	void __iomem			*xhci_regs;
+	struct resource			xhci_res[CDNS3_XHCI_RESOURCES_NUM];
+	struct cdns3_usb_regs __iomem	*dev_regs;
+
+	struct resource			otg_res;
+	struct cdns3_otg_legacy_regs	*otg_v0_regs;
+	struct cdns3_otg_regs		*otg_v1_regs;
+	struct cdns3_otg_common_regs	*otg_regs;
+#define CDNS3_CONTROLLER_V0	0
+#define CDNS3_CONTROLLER_V1	1
+	u32				version;
+
+	int				otg_irq;
+	int				dev_irq;
+	struct cdns3_role_driver	*roles[USB_ROLE_DEVICE + 1];
+	enum usb_role			role;
+	struct platform_device		*host_dev;
+	struct cdns3_device		*gadget_dev;
+	struct phy			*usb2_phy;
+	struct phy			*usb3_phy;
+	/* mutext used in workqueue*/
+	struct mutex			mutex;
+	enum usb_dr_mode		dr_mode;
+	enum usb_dr_mode		current_dr_mode;
+	enum usb_dr_mode		desired_dr_mode;
+	struct usb_role_switch		*role_sw;
+	struct dentry			*root;
+};
+
+#endif /* __LINUX_CDNS3_CORE_H */
diff --git a/drivers/usb/cdns3/debug.h b/drivers/usb/cdns3/debug.h
new file mode 100644
index 000000000000..4fcd826cf930
--- /dev/null
+++ b/drivers/usb/cdns3/debug.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USBSS DRD Driver.
+ * Debug header file.
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+#ifndef __LINUX_CDNS3_DEBUG
+#define __LINUX_CDNS3_DEBUG
+
+#include "core.h"
+
+static inline char *cdns3_decode_usb_irq(char *str,
+					 enum usb_device_speed speed,
+					 u32 usb_ists)
+{
+	int ret;
+
+	ret = sprintf(str, "IRQ %08x = ", usb_ists);
+
+	if (usb_ists & (USB_ISTS_CON2I | USB_ISTS_CONI)) {
+		ret += sprintf(str + ret, "Connection %s\n",
+			       usb_speed_string(speed));
+	}
+	if (usb_ists & USB_ISTS_DIS2I || usb_ists & USB_ISTS_DISI)
+		ret += sprintf(str + ret, "Disconnection ");
+	if (usb_ists & USB_ISTS_L2ENTI)
+		ret += sprintf(str + ret, "suspended ");
+	if (usb_ists & USB_ISTS_L1ENTI)
+		ret += sprintf(str + ret, "L1 enter ");
+	if (usb_ists & USB_ISTS_L1EXTI)
+		ret += sprintf(str + ret, "L1 exit ");
+	if (usb_ists & USB_ISTS_L2ENTI)
+		ret += sprintf(str + ret, "L2 enter ");
+	if (usb_ists & USB_ISTS_L2EXTI)
+		ret += sprintf(str + ret, "L2 exit ");
+	if (usb_ists & USB_ISTS_U3EXTI)
+		ret += sprintf(str + ret, "U3 exit ");
+	if (usb_ists & USB_ISTS_UWRESI)
+		ret += sprintf(str + ret, "Warm Reset ");
+	if (usb_ists & USB_ISTS_UHRESI)
+		ret += sprintf(str + ret, "Hot Reset ");
+	if (usb_ists & USB_ISTS_U2RESI)
+		ret += sprintf(str + ret, "Reset");
+
+	return str;
+}
+
+static inline  char *cdns3_decode_ep_irq(char *str,
+					 u32 ep_sts,
+					 const char *ep_name)
+{
+	int ret;
+
+	ret = sprintf(str, "IRQ for %s: %08x ", ep_name, ep_sts);
+
+	if (ep_sts & EP_STS_SETUP)
+		ret += sprintf(str + ret, "SETUP ");
+	if (ep_sts & EP_STS_IOC)
+		ret += sprintf(str + ret, "IOC ");
+	if (ep_sts & EP_STS_ISP)
+		ret += sprintf(str + ret, "ISP ");
+	if (ep_sts & EP_STS_DESCMIS)
+		ret += sprintf(str + ret, "DESCMIS ");
+	if (ep_sts & EP_STS_STREAMR)
+		ret += sprintf(str + ret, "STREAMR ");
+	if (ep_sts & EP_STS_MD_EXIT)
+		ret += sprintf(str + ret, "MD_EXIT ");
+	if (ep_sts & EP_STS_TRBERR)
+		ret += sprintf(str + ret, "TRBERR ");
+	if (ep_sts & EP_STS_NRDY)
+		ret += sprintf(str + ret, "NRDY ");
+	if (ep_sts & EP_STS_PRIME)
+		ret += sprintf(str + ret, "PRIME ");
+	if (ep_sts & EP_STS_SIDERR)
+		ret += sprintf(str + ret, "SIDERRT ");
+	if (ep_sts & EP_STS_OUTSMM)
+		ret += sprintf(str + ret, "OUTSMM ");
+	if (ep_sts & EP_STS_ISOERR)
+		ret += sprintf(str + ret, "ISOERR ");
+	if (ep_sts & EP_STS_IOT)
+		ret += sprintf(str + ret, "IOT ");
+
+	return str;
+}
+
+static inline char *cdns3_decode_epx_irq(char *str,
+					 char *ep_name,
+					 u32 ep_sts)
+{
+	return cdns3_decode_ep_irq(str, ep_sts, ep_name);
+}
+
+static inline char *cdns3_decode_ep0_irq(char *str,
+					 int dir,
+					 u32 ep_sts)
+{
+	return cdns3_decode_ep_irq(str, ep_sts,
+				   dir ? "ep0IN" : "ep0OUT");
+}
+
+/**
+ * Debug a transfer ring.
+ *
+ * Prints out all TRBs in the endpoint ring, even those after the Link TRB.
+ *.
+ */
+static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
+				   struct cdns3_trb *ring, char *str)
+{
+	dma_addr_t addr = priv_ep->trb_pool_dma;
+	struct cdns3_trb *trb;
+	int trb_per_sector;
+	int ret = 0;
+	int i;
+
+	trb_per_sector = GET_TRBS_PER_SEGMENT(priv_ep->type);
+
+	trb = &priv_ep->trb_pool[priv_ep->dequeue];
+	ret += sprintf(str + ret, "\n\t\tRing contents for %s:", priv_ep->name);
+
+	ret += sprintf(str + ret,
+		       "\n\t\tRing deq index: %d, trb: %p (virt), 0x%llx (dma)\n",
+		       priv_ep->dequeue, trb,
+		       (unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
+
+	trb = &priv_ep->trb_pool[priv_ep->enqueue];
+	ret += sprintf(str + ret,
+		       "\t\tRing enq index: %d, trb: %p (virt), 0x%llx (dma)\n",
+		       priv_ep->enqueue, trb,
+		       (unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
+
+	ret += sprintf(str + ret,
+		       "\t\tfree trbs: %d, CCS=%d, PCS=%d\n",
+		       priv_ep->free_trbs, priv_ep->ccs, priv_ep->pcs);
+
+	if (trb_per_sector > TRBS_PER_SEGMENT)
+		trb_per_sector = TRBS_PER_SEGMENT;
+
+	if (trb_per_sector > TRBS_PER_SEGMENT) {
+		sprintf(str + ret, "\t\tTo big transfer ring %d\n",
+			trb_per_sector);
+		return str;
+	}
+
+	for (i = 0; i < trb_per_sector; ++i) {
+		trb = &ring[i];
+		ret += sprintf(str + ret,
+			"\t\t@%pad %08x %08x %08x\n", &addr,
+			le32_to_cpu(trb->buffer),
+			le32_to_cpu(trb->length),
+			le32_to_cpu(trb->control));
+		addr += sizeof(*trb);
+	}
+
+	return str;
+}
+
+#ifdef CONFIG_DEBUG_FS
+void cdns3_debugfs_init(struct cdns3 *cdns);
+void cdns3_debugfs_exit(struct cdns3 *cdns);
+#else
+void cdns3_debugfs_init(struct cdns3 *cdns);
+{  }
+void cdns3_debugfs_exit(struct cdns3 *cdns);
+{  }
+#endif
+
+#endif /*__LINUX_CDNS3_DEBUG*/
diff --git a/drivers/usb/cdns3/debugfs.c b/drivers/usb/cdns3/debugfs.c
new file mode 100644
index 000000000000..6a4dcde8dac9
--- /dev/null
+++ b/drivers/usb/cdns3/debugfs.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Controller DebugFS filer.
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+#include "core.h"
+#include "gadget.h"
+#include "drd.h"
+
+static int cdns3_mode_show(struct seq_file *s, void *unused)
+{
+	struct cdns3 *cdns = s->private;
+
+	seq_printf(s, "%s\n", usb_dr_mode_to_string(cdns->current_dr_mode));
+	return 0;
+}
+
+static int cdns3_mode_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cdns3_mode_show, inode->i_private);
+}
+
+static ssize_t cdns3_mode_write(struct file *file,
+				const char __user *ubuf,
+				size_t count, loff_t *ppos)
+{
+	struct seq_file	 *s = file->private_data;
+	struct cdns3 *cdns = s->private;
+	char buf[32];
+	int ret;
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	buf[count - 1] = '\0';
+
+	ret = usb_get_dr_mode_from_string(buf);
+	if (ret == USB_DR_MODE_UNKNOWN) {
+		dev_err(cdns->dev, "Failed: incorrect mode setting\n");
+		return -EINVAL;
+	}
+
+	if (cdns->current_dr_mode != ret) {
+		cdns->desired_dr_mode = ret;
+
+		if (cdns->role != USB_ROLE_NONE)
+			usb_role_switch_set_role(cdns->role_sw, cdns->role);
+
+		usb_role_switch_set_role(cdns->role_sw, cdns->role);
+	}
+
+	return count;
+}
+
+static const struct file_operations cdns3_mode_fops = {
+	.open			= cdns3_mode_open,
+	.write			= cdns3_mode_write,
+	.read			= seq_read,
+	.llseek			= seq_lseek,
+	.release		= single_release,
+};
+
+void cdns3_debugfs_init(struct cdns3 *cdns)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir(dev_name(cdns->dev), usb_debug_root);
+	cdns->root = root;
+	if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET) &&
+	    IS_ENABLED(CONFIG_USB_CDNS3_HOST))
+		debugfs_create_file("mode", 0644, root, cdns,
+				    &cdns3_mode_fops);
+}
+
+void cdns3_debugfs_exit(struct cdns3 *cdns)
+{
+	debugfs_remove_recursive(cdns->root);
+}
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
new file mode 100644
index 000000000000..77f8a1516140
--- /dev/null
+++ b/drivers/usb/cdns3/drd.c
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver.
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ * Copyright (C) 2019 Texas Instruments
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ *         Roger Quadros <rogerq@ti.com>
+ *
+ *
+ */
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/usb/otg.h>
+
+#include "gadget.h"
+#include "drd.h"
+#include "core.h"
+
+/**
+ * cdns3_set_mode - change mode of OTG Core
+ * @cdns: pointer to context structure
+ * @mode: selected mode from cdns_role
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+int cdns3_set_mode(struct cdns3 *cdns, enum usb_dr_mode mode)
+{
+	int ret = 0;
+	u32 reg;
+
+	cdns->current_dr_mode = mode;
+
+	switch (mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		break;
+	case USB_DR_MODE_HOST:
+		break;
+	case USB_DR_MODE_OTG:
+		dev_dbg(cdns->dev, "Set controller to OTG mode\n");
+		if (cdns->version == CDNS3_CONTROLLER_V1) {
+			reg = readl(&cdns->otg_v1_regs->override);
+			reg |= OVERRIDE_IDPULLUP;
+			writel(reg, &cdns->otg_v1_regs->override);
+		} else {
+			reg = readl(&cdns->otg_v0_regs->ctrl1);
+			reg |= OVERRIDE_IDPULLUP_V0;
+			writel(reg, &cdns->otg_v0_regs->ctrl1);
+		}
+
+		/*
+		 * Hardware specification says: "ID_VALUE must be valid within
+		 * 50ms after idpullup is set to '1" so driver must wait
+		 * 50ms before reading this pin.
+		 */
+		usleep_range(50000, 60000);
+		break;
+	default:
+		cdns->current_dr_mode = USB_DR_MODE_UNKNOWN;
+		dev_err(cdns->dev, "Unsupported mode of operation %d\n", mode);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+int cdns3_get_id(struct cdns3 *cdns)
+{
+	int id;
+
+	id = readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
+	dev_dbg(cdns->dev, "OTG ID: %d", id);
+
+	return id;
+}
+
+int cdns3_get_vbus(struct cdns3 *cdns)
+{
+	int vbus;
+
+	vbus = !!(readl(&cdns->otg_regs->sts) & OTGSTS_VBUS_VALID);
+	dev_dbg(cdns->dev, "OTG VBUS: %d", vbus);
+
+	return vbus;
+}
+
+int cdns3_is_host(struct cdns3 *cdns)
+{
+	if (cdns->current_dr_mode == USB_DR_MODE_HOST)
+		return 1;
+	else if (!cdns3_get_id(cdns))
+		return 1;
+
+	return 0;
+}
+
+int cdns3_is_device(struct cdns3 *cdns)
+{
+	if (cdns->current_dr_mode == USB_DR_MODE_PERIPHERAL)
+		return 1;
+	else if (cdns->current_dr_mode == USB_DR_MODE_OTG)
+		if (cdns3_get_id(cdns))
+			return 1;
+
+	return 0;
+}
+
+/**
+ * cdns3_otg_disable_irq - Disable all OTG interrupts
+ * @cdns: Pointer to controller context structure
+ */
+static void cdns3_otg_disable_irq(struct cdns3 *cdns)
+{
+	writel(0, &cdns->otg_regs->ien);
+}
+
+/**
+ * cdns3_otg_enable_irq - enable id and sess_valid interrupts
+ * @cdns: Pointer to controller context structure
+ */
+static void cdns3_otg_enable_irq(struct cdns3 *cdns)
+{
+	writel(OTGIEN_ID_CHANGE_INT | OTGIEN_VBUSVALID_RISE_INT |
+	       OTGIEN_VBUSVALID_FALL_INT, &cdns->otg_regs->ien);
+}
+
+/**
+ * cdns3_drd_switch_host - start/stop host
+ * @cdns: Pointer to controller context structure
+ * @on: 1 for start, 0 for stop
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+int cdns3_drd_switch_host(struct cdns3 *cdns, int on)
+{
+	int ret, val;
+	u32 reg = OTGCMD_OTG_DIS;
+
+	/* switch OTG core */
+	if (on) {
+		writel(OTGCMD_HOST_BUS_REQ | reg, &cdns->otg_regs->cmd);
+
+		dev_dbg(cdns->dev, "Waiting till Host mode is turned on\n");
+		ret = readl_poll_timeout_atomic(&cdns->otg_regs->sts, val,
+						val & OTGSTS_XHCI_READY,
+						1, 100000);
+		if (ret) {
+			dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
+			return ret;
+		}
+	} else {
+		writel(OTGCMD_HOST_BUS_DROP | OTGCMD_DEV_BUS_DROP |
+		       OTGCMD_DEV_POWER_OFF | OTGCMD_HOST_POWER_OFF,
+		       &cdns->otg_regs->cmd);
+		/* Waiting till H_IDLE state.*/
+		readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
+					  !(val & OTGSTATE_HOST_STATE_MASK),
+					  1, 2000000);
+	}
+
+	return 0;
+}
+
+/**
+ * cdns3_drd_switch_gadget - start/stop gadget
+ * @cdns: Pointer to controller context structure
+ * @on: 1 for start, 0 for stop
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+int cdns3_drd_switch_gadget(struct cdns3 *cdns, int on)
+{
+	int ret, val;
+	u32 reg = OTGCMD_OTG_DIS;
+
+	/* switch OTG core */
+	if (on) {
+		writel(OTGCMD_DEV_BUS_REQ | reg, &cdns->otg_regs->cmd);
+
+		dev_dbg(cdns->dev, "Waiting till Device mode is turned on\n");
+
+		ret = readl_poll_timeout_atomic(&cdns->otg_regs->sts, val,
+						val & OTGSTS_DEV_READY,
+						1, 100000);
+		if (ret) {
+			dev_err(cdns->dev, "timeout waiting for dev_ready\n");
+			return ret;
+		}
+	} else {
+		/*
+		 * driver should wait at least 10us after disabling Device
+		 * before turning-off Device (DEV_BUS_DROP)
+		 */
+		usleep_range(20, 30);
+		writel(OTGCMD_HOST_BUS_DROP | OTGCMD_DEV_BUS_DROP |
+		       OTGCMD_DEV_POWER_OFF | OTGCMD_HOST_POWER_OFF,
+		       &cdns->otg_regs->cmd);
+		/* Waiting till DEV_IDLE state.*/
+		readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
+					  !(val & OTGSTATE_DEV_STATE_MASK),
+					  1, 2000000);
+	}
+
+	return 0;
+}
+
+/**
+ * cdns3_init_otg_mode - initialize drd controller
+ * @cdns: Pointer to controller context structure
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+static int cdns3_init_otg_mode(struct cdns3 *cdns)
+{
+	int ret = 0;
+
+	cdns3_otg_disable_irq(cdns);
+	/* clear all interrupts */
+	writel(~0, &cdns->otg_regs->ivect);
+
+	ret = cdns3_set_mode(cdns, USB_DR_MODE_OTG);
+	if (ret)
+		return ret;
+
+	cdns3_otg_enable_irq(cdns);
+	return ret;
+}
+
+/**
+ * cdns3_drd_update_mode - initialize mode of operation
+ * @cdns: Pointer to controller context structure
+ *
+ * Returns 0 on success otherwise negative errno
+ */
+int cdns3_drd_update_mode(struct cdns3 *cdns)
+{
+	int ret = 0;
+
+	if (cdns->desired_dr_mode == cdns->current_dr_mode)
+		return ret;
+
+	switch (cdns->desired_dr_mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		ret = cdns3_set_mode(cdns, USB_DR_MODE_PERIPHERAL);
+		break;
+	case USB_DR_MODE_HOST:
+		ret = cdns3_set_mode(cdns, USB_DR_MODE_HOST);
+		break;
+	case USB_DR_MODE_OTG:
+		ret = cdns3_init_otg_mode(cdns);
+		break;
+	default:
+		dev_err(cdns->dev, "Unsupported mode of operation %d\n",
+			cdns->dr_mode);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static irqreturn_t cdns3_drd_thread_irq(int irq, void *data)
+{
+	struct cdns3 *cdns = data;
+
+	usb_role_switch_set_role(cdns->role_sw, cdns->role);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * cdns3_drd_irq - interrupt handler for OTG events
+ *
+ * @irq: irq number for cdns3 core device
+ * @data: structure of cdns3
+ *
+ * Returns IRQ_HANDLED or IRQ_NONE
+ */
+static irqreturn_t cdns3_drd_irq(int irq, void *data)
+{
+	irqreturn_t ret = IRQ_NONE;
+	struct cdns3 *cdns = data;
+	u32 reg;
+
+	if (cdns->dr_mode != USB_DR_MODE_OTG)
+		return ret;
+
+	reg = readl(&cdns->otg_regs->ivect);
+
+	if (!reg)
+		return ret;
+
+	if (reg & OTGIEN_ID_CHANGE_INT) {
+		dev_dbg(cdns->dev, "OTG IRQ: new ID: %d\n",
+			cdns3_get_id(cdns));
+
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	if (reg & (OTGIEN_VBUSVALID_RISE_INT | OTGIEN_VBUSVALID_FALL_INT)) {
+		dev_dbg(cdns->dev, "OTG IRQ: new VBUS: %d\n",
+			cdns3_get_vbus(cdns));
+
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	writel(~0, &cdns->otg_regs->ivect);
+	return ret;
+}
+
+int cdns3_drd_init(struct cdns3 *cdns)
+{
+	void __iomem *regs;
+	int ret = 0;
+	u32 state;
+
+	regs = devm_ioremap_resource(cdns->dev, &cdns->otg_res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	/* Detection of DRD version. Controller has been released
+	 * in two versions. Both are similar, but they have same changes
+	 * in register maps.
+	 * The first register in old version is command register and it's read
+	 * only, so driver should read 0 from it. On the other hand, in v1
+	 * the first register contains device ID number which is not set to 0.
+	 * Driver uses this fact to detect the proper version of
+	 * controller.
+	 */
+	cdns->otg_v0_regs = regs;
+	if (!readl(&cdns->otg_v0_regs->cmd)) {
+		cdns->version  = CDNS3_CONTROLLER_V0;
+		cdns->otg_v1_regs = NULL;
+		cdns->otg_regs = regs;
+		writel(1, &cdns->otg_v0_regs->simulate);
+		dev_info(cdns->dev, "DRD version v0 (%08x)\n",
+			 readl(&cdns->otg_v0_regs->version));
+	} else {
+		cdns->otg_v0_regs = NULL;
+		cdns->otg_v1_regs = regs;
+		cdns->otg_regs = (void *)&cdns->otg_v1_regs->cmd;
+		cdns->version  = CDNS3_CONTROLLER_V1;
+		writel(1, &cdns->otg_v1_regs->simulate);
+		dev_info(cdns->dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
+			 readl(&cdns->otg_v1_regs->did),
+			 readl(&cdns->otg_v1_regs->rid));
+	}
+
+	state = OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
+
+	/* Update dr_mode according to STRAP configuration. */
+	cdns->dr_mode = USB_DR_MODE_OTG;
+	if (state == OTGSTS_STRAP_HOST) {
+		dev_dbg(cdns->dev, "Controller strapped to HOST\n");
+		cdns->dr_mode = USB_DR_MODE_HOST;
+	} else if (state == OTGSTS_STRAP_GADGET) {
+		dev_dbg(cdns->dev, "Controller strapped to PERIPHERAL\n");
+		cdns->dr_mode = USB_DR_MODE_PERIPHERAL;
+	}
+
+	cdns->desired_dr_mode = cdns->dr_mode;
+	cdns->current_dr_mode = USB_DR_MODE_UNKNOWN;
+
+	ret = devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
+					cdns3_drd_irq,
+					cdns3_drd_thread_irq,
+					IRQF_SHARED,
+					dev_name(cdns->dev), cdns);
+
+	if (ret) {
+		dev_err(cdns->dev, "couldn't get otg_irq\n");
+		return ret;
+	}
+
+	state = readl(&cdns->otg_regs->sts);
+	if (OTGSTS_OTG_NRDY(state) != 0) {
+		dev_err(cdns->dev, "Cadence USB3 OTG device not ready\n");
+		return -ENODEV;
+	}
+
+	return ret;
+}
+
+int cdns3_drd_exit(struct cdns3 *cdns)
+{
+	cdns3_otg_disable_irq(cdns);
+	return 0;
+}
diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
new file mode 100644
index 000000000000..bf6c7bc41b58
--- /dev/null
+++ b/drivers/usb/cdns3/drd.h
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USB3 DRD header file.
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+#ifndef __LINUX_CDNS3_DRD
+#define __LINUX_CDNS3_DRD
+
+#include <linux/usb/otg.h>
+#include <linux/phy/phy.h>
+#include "core.h"
+
+/*  DRD register interface for version v1. */
+struct cdns3_otg_regs {
+	__le32 did;
+	__le32 rid;
+	__le32 capabilities;
+	__le32 reserved1;
+	__le32 cmd;
+	__le32 sts;
+	__le32 state;
+	__le32 reserved2;
+	__le32 ien;
+	__le32 ivect;
+	__le32 refclk;
+	__le32 tmr;
+	__le32 reserved3[4];
+	__le32 simulate;
+	__le32 override;
+	__le32 susp_ctrl;
+	__le32 reserved4;
+	__le32 anasts;
+	__le32 adp_ramp_time;
+	__le32 ctrl1;
+	__le32 ctrl2;
+};
+
+/*  DRD register interface for version v0. */
+struct cdns3_otg_legacy_regs {
+	__le32 cmd;
+	__le32 sts;
+	__le32 state;
+	__le32 refclk;
+	__le32 ien;
+	__le32 ivect;
+	__le32 reserved1[3];
+	__le32 tmr;
+	__le32 reserved2[2];
+	__le32 version;
+	__le32 capabilities;
+	__le32 reserved3[2];
+	__le32 simulate;
+	__le32 reserved4[5];
+	__le32 ctrl1;
+};
+
+/*
+ * Common registers interface for both version of DRD.
+ */
+struct cdns3_otg_common_regs {
+	__le32 cmd;
+	__le32 sts;
+	__le32 state;
+	__le32 different1;
+	__le32 ien;
+	__le32 ivect;
+};
+
+/* CDNS_RID - bitmasks */
+#define CDNS_RID(p)			((p) & GENMASK(15, 0))
+
+/* CDNS_VID - bitmasks */
+#define CDNS_DID(p)			((p) & GENMASK(31, 0))
+
+/* OTGCMD - bitmasks */
+/* "Request the bus for Device mode. */
+#define OTGCMD_DEV_BUS_REQ		BIT(0)
+/* Request the bus for Host mode */
+#define OTGCMD_HOST_BUS_REQ		BIT(1)
+/* Enable OTG mode. */
+#define OTGCMD_OTG_EN			BIT(2)
+/* Disable OTG mode */
+#define OTGCMD_OTG_DIS			BIT(3)
+/*"Configure OTG as A-Device. */
+#define OTGCMD_A_DEV_EN			BIT(4)
+/*"Configure OTG as A-Device. */
+#define OTGCMD_A_DEV_DIS		BIT(5)
+/* Drop the bus for Device mod	e. */
+#define OTGCMD_DEV_BUS_DROP		BIT(8)
+/* Drop the bus for Host mode*/
+#define OTGCMD_HOST_BUS_DROP		BIT(9)
+/* Power Down USBSS-DEV. */
+#define OTGCMD_DEV_POWER_OFF		BIT(11)
+/* Power Down CDNSXHCI. */
+#define OTGCMD_HOST_POWER_OFF		BIT(12)
+
+/* OTGIEN - bitmasks */
+/* ID change interrupt enable */
+#define OTGIEN_ID_CHANGE_INT		BIT(0)
+/* Vbusvalid fall detected interrupt enable.*/
+#define OTGIEN_VBUSVALID_RISE_INT	BIT(4)
+/* Vbusvalid fall detected interrupt enable */
+#define OTGIEN_VBUSVALID_FALL_INT	BIT(5)
+
+/* OTGSTS - bitmasks */
+/*
+ * Current value of the ID pin. It is only valid when idpullup in
+ *  OTGCTRL1_TYPE register is set to '1'.
+ */
+#define OTGSTS_ID_VALUE			BIT(0)
+/* Current value of the vbus_valid */
+#define OTGSTS_VBUS_VALID		BIT(1)
+/* Current value of the b_sess_vld */
+#define OTGSTS_SESSION_VALID		BIT(2)
+/*Device mode is active*/
+#define OTGSTS_DEV_ACTIVE		BIT(3)
+/* Host mode is active. */
+#define OTGSTS_HOST_ACTIVE		BIT(4)
+/* OTG Controller not ready. */
+#define OTGSTS_OTG_NRDY_MASK		BIT(11)
+#define OTGSTS_OTG_NRDY(p)		((p) & OTGSTS_OTG_NRDY_MASK)
+/*
+ * Value of the strap pins.
+ * 000 - no default configuration
+ * 010 - Controller initiall configured as Host
+ * 100 - Controller initially configured as Device
+ */
+#define OTGSTS_STRAP(p)			(((p) & GENMASK(14, 12)) >> 12)
+#define OTGSTS_STRAP_NO_DEFAULT_CFG	0x00
+#define OTGSTS_STRAP_HOST_OTG		0x01
+#define OTGSTS_STRAP_HOST		0x02
+#define OTGSTS_STRAP_GADGET		0x04
+/* Host mode is turned on. */
+#define OTGSTS_XHCI_READY		BIT(26)
+/* "Device mode is turned on .*/
+#define OTGSTS_DEV_READY		BIT(27)
+
+/* OTGSTATE- bitmasks */
+#define OTGSTATE_DEV_STATE_MASK		GENMASK(2, 0)
+#define OTGSTATE_HOST_STATE_MASK	GENMASK(5, 3)
+#define OTGSTATE_HOST_STATE_IDLE	0x0
+#define OTGSTATE_HOST_STATE_VBUS_FALL	0x7
+#define OTGSTATE_HOST_STATE(p)		(((p) & OTGSTATE_HOST_STATE_MASK) >> 3)
+
+/* OTGREFCLK - bitmasks */
+#define OTGREFCLK_STB_CLK_SWITCH_EN	BIT(31)
+
+/* OVERRIDE - bitmasks */
+#define OVERRIDE_IDPULLUP		BIT(0)
+/* Only for CDNS3_CONTROLLER_V0 version */
+#define OVERRIDE_IDPULLUP_V0		BIT(24)
+
+int cdns3_is_host(struct cdns3 *cdns);
+int cdns3_is_device(struct cdns3 *cdns);
+int cdns3_get_id(struct cdns3 *cdns);
+int cdns3_get_vbus(struct cdns3 *cdns);
+int cdns3_drd_init(struct cdns3 *cdns);
+int cdns3_drd_exit(struct cdns3 *cdns);
+int cdns3_drd_update_mode(struct cdns3 *cdns);
+int cdns3_drd_switch_gadget(struct cdns3 *cdns, int on);
+int cdns3_drd_switch_host(struct cdns3 *cdns, int on);
+
+#endif /* __LINUX_CDNS3_DRD */
diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
new file mode 100644
index 000000000000..48c7f34db8a5
--- /dev/null
+++ b/drivers/usb/cdns3/ep0.c
@@ -0,0 +1,914 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver - gadget side.
+ *
+ * Copyright (C) 2018 Cadence Design Systems.
+ * Copyright (C) 2017-2018 NXP
+ *
+ * Authors: Pawel Jez <pjez@cadence.com>,
+ *          Pawel Laszczak <pawell@cadence.com>
+ *          Peter Chen <peter.chen@nxp.com>
+ */
+
+#include <linux/usb/composite.h>
+#include <linux/iopoll.h>
+
+#include "gadget.h"
+#include "trace.h"
+
+static struct usb_endpoint_descriptor cdns3_gadget_ep0_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+	.bmAttributes =	USB_ENDPOINT_XFER_CONTROL,
+};
+
+/**
+ * cdns3_ep0_run_transfer - Do transfer on default endpoint hardware
+ * @priv_dev: extended gadget object
+ * @dma_addr: physical address where data is/will be stored
+ * @length: data length
+ * @erdy: set it to 1 when ERDY packet should be sent -
+ *        exit from flow control state
+ */
+static void cdns3_ep0_run_transfer(struct cdns3_device *priv_dev,
+				   dma_addr_t dma_addr,
+				   unsigned int length, int erdy, int zlp)
+{
+	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
+	struct cdns3_endpoint *priv_ep = priv_dev->eps[0];
+
+	priv_ep->trb_pool[0].buffer = TRB_BUFFER(dma_addr);
+	priv_ep->trb_pool[0].length = TRB_LEN(length);
+
+	if (zlp) {
+		priv_ep->trb_pool[0].control = TRB_CYCLE | TRB_TYPE(TRB_NORMAL);
+		priv_ep->trb_pool[1].buffer = TRB_BUFFER(dma_addr);
+		priv_ep->trb_pool[1].length = TRB_LEN(0);
+		priv_ep->trb_pool[1].control = TRB_CYCLE | TRB_IOC |
+		    TRB_TYPE(TRB_NORMAL);
+	} else {
+		priv_ep->trb_pool[0].control = TRB_CYCLE | TRB_IOC |
+		    TRB_TYPE(TRB_NORMAL);
+		priv_ep->trb_pool[1].control = 0;
+	}
+
+	trace_cdns3_prepare_trb(priv_ep, priv_ep->trb_pool);
+
+	cdns3_select_ep(priv_dev, priv_dev->ep0_data_dir);
+
+	writel(EP_STS_TRBERR, &regs->ep_sts);
+	writel(EP_TRADDR_TRADDR(priv_ep->trb_pool_dma), &regs->ep_traddr);
+	trace_cdns3_doorbell_ep0(priv_dev->ep0_data_dir ? "ep0in" : "ep0out",
+				 readl(&regs->ep_traddr));
+
+	/* TRB should be prepared before starting transfer. */
+	writel(EP_CMD_DRDY, &regs->ep_cmd);
+
+	/* Resume controller before arming transfer. */
+	__cdns3_gadget_wakeup(priv_dev);
+
+	if (erdy)
+		writel(EP_CMD_ERDY, &priv_dev->regs->ep_cmd);
+}
+
+/**
+ * cdns3_ep0_delegate_req - Returns status of handling setup packet
+ * Setup is handled by gadget driver
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns zero on success or negative value on failure
+ */
+static int cdns3_ep0_delegate_req(struct cdns3_device *priv_dev,
+				  struct usb_ctrlrequest *ctrl_req)
+{
+	int ret;
+
+	spin_unlock(&priv_dev->lock);
+	priv_dev->setup_pending = 1;
+	ret = priv_dev->gadget_driver->setup(&priv_dev->gadget, ctrl_req);
+	priv_dev->setup_pending = 0;
+	spin_lock(&priv_dev->lock);
+	return ret;
+}
+
+static void cdns3_prepare_setup_packet(struct cdns3_device *priv_dev)
+{
+	priv_dev->ep0_data_dir = 0;
+	priv_dev->ep0_stage = CDNS3_SETUP_STAGE;
+	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma,
+			       sizeof(struct usb_ctrlrequest), 0, 0);
+}
+
+static void cdns3_ep0_complete_setup(struct cdns3_device *priv_dev,
+				     u8 send_stall, u8 send_erdy)
+{
+	struct cdns3_endpoint *priv_ep = priv_dev->eps[0];
+	struct usb_request *request;
+
+	request = cdns3_next_request(&priv_ep->pending_req_list);
+	if (request)
+		list_del_init(&request->list);
+
+	if (send_stall) {
+		trace_cdns3_halt(priv_ep, send_stall, 0);
+		/* set_stall on ep0 */
+		cdns3_select_ep(priv_dev, 0x00);
+		writel(EP_CMD_SSTALL, &priv_dev->regs->ep_cmd);
+	} else {
+		cdns3_prepare_setup_packet(priv_dev);
+	}
+
+	priv_dev->ep0_stage = CDNS3_SETUP_STAGE;
+	writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
+	       &priv_dev->regs->ep_cmd);
+
+	cdns3_allow_enable_l1(priv_dev, 1);
+}
+
+/**
+ * cdns3_req_ep0_set_configuration - Handling of SET_CONFIG standard USB request
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns 0 if success, USB_GADGET_DELAYED_STATUS on deferred status stage,
+ * error code on error
+ */
+static int cdns3_req_ep0_set_configuration(struct cdns3_device *priv_dev,
+					   struct usb_ctrlrequest *ctrl_req)
+{
+	enum usb_device_state device_state = priv_dev->gadget.state;
+	struct cdns3_endpoint *priv_ep;
+	u32 config = le16_to_cpu(ctrl_req->wValue);
+	int result = 0;
+	int i;
+
+	switch (device_state) {
+	case USB_STATE_ADDRESS:
+		/* Configure non-control EPs */
+		for (i = 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++) {
+			priv_ep = priv_dev->eps[i];
+			if (!priv_ep)
+				continue;
+
+			if (priv_ep->flags & EP_CLAIMED)
+				cdns3_ep_config(priv_ep);
+		}
+
+		result = cdns3_ep0_delegate_req(priv_dev, ctrl_req);
+
+		if (result)
+			return result;
+
+		if (config) {
+			cdns3_set_hw_configuration(priv_dev);
+		} else {
+			cdns3_hw_reset_eps_config(priv_dev);
+			usb_gadget_set_state(&priv_dev->gadget,
+					     USB_STATE_ADDRESS);
+		}
+		break;
+	case USB_STATE_CONFIGURED:
+		result = cdns3_ep0_delegate_req(priv_dev, ctrl_req);
+
+		if (!config && !result) {
+			cdns3_hw_reset_eps_config(priv_dev);
+			usb_gadget_set_state(&priv_dev->gadget,
+					     USB_STATE_ADDRESS);
+		}
+		break;
+	default:
+		result = -EINVAL;
+	}
+
+	return result;
+}
+
+/**
+ * cdns3_req_ep0_set_address - Handling of SET_ADDRESS standard USB request
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns 0 if success, error code on error
+ */
+static int cdns3_req_ep0_set_address(struct cdns3_device *priv_dev,
+				     struct usb_ctrlrequest *ctrl_req)
+{
+	enum usb_device_state device_state = priv_dev->gadget.state;
+	u32 reg;
+	u32 addr;
+
+	addr = le16_to_cpu(ctrl_req->wValue);
+
+	if (addr > USB_DEVICE_MAX_ADDRESS) {
+		dev_err(priv_dev->dev,
+			"Device address (%d) cannot be greater than %d\n",
+			addr, USB_DEVICE_MAX_ADDRESS);
+		return -EINVAL;
+	}
+
+	if (device_state == USB_STATE_CONFIGURED) {
+		dev_err(priv_dev->dev,
+			"can't set_address from configured state\n");
+		return -EINVAL;
+	}
+
+	reg = readl(&priv_dev->regs->usb_cmd);
+
+	writel(reg | USB_CMD_FADDR(addr) | USB_CMD_SET_ADDR,
+	       &priv_dev->regs->usb_cmd);
+
+	usb_gadget_set_state(&priv_dev->gadget,
+			     (addr ? USB_STATE_ADDRESS : USB_STATE_DEFAULT));
+
+	return 0;
+}
+
+/**
+ * cdns3_req_ep0_get_status - Handling of GET_STATUS standard USB request
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns 0 if success, error code on error
+ */
+static int cdns3_req_ep0_get_status(struct cdns3_device *priv_dev,
+				    struct usb_ctrlrequest *ctrl)
+{
+	__le16 *response_pkt;
+	u16 usb_status = 0;
+	u32 recip;
+	u32 reg;
+
+	recip = ctrl->bRequestType & USB_RECIP_MASK;
+
+	switch (recip) {
+	case USB_RECIP_DEVICE:
+		/* self powered */
+		if (priv_dev->is_selfpowered)
+			usb_status = BIT(USB_DEVICE_SELF_POWERED);
+
+		if (priv_dev->wake_up_flag)
+			usb_status |= BIT(USB_DEVICE_REMOTE_WAKEUP);
+
+		if (priv_dev->gadget.speed != USB_SPEED_SUPER)
+			break;
+
+		reg = readl(&priv_dev->regs->usb_sts);
+
+		if (priv_dev->u1_allowed)
+			usb_status |= BIT(USB_DEV_STAT_U1_ENABLED);
+
+		if (priv_dev->u2_allowed)
+			usb_status |= BIT(USB_DEV_STAT_U2_ENABLED);
+
+		break;
+	case USB_RECIP_INTERFACE:
+		return cdns3_ep0_delegate_req(priv_dev, ctrl);
+	case USB_RECIP_ENDPOINT:
+		/* check if endpoint is stalled */
+		cdns3_select_ep(priv_dev, ctrl->wIndex);
+		if (EP_STS_STALL(readl(&priv_dev->regs->ep_sts)))
+			usb_status =  BIT(USB_ENDPOINT_HALT);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	response_pkt = (__le16 *)priv_dev->setup_buf;
+	*response_pkt = cpu_to_le16(usb_status);
+
+	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma,
+			       sizeof(*response_pkt), 1, 0);
+	return 0;
+}
+
+static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev,
+					   struct usb_ctrlrequest *ctrl,
+					   int set)
+{
+	enum usb_device_state state;
+	enum usb_device_speed speed;
+	int ret = 0;
+	u32 wValue;
+	u32 wIndex;
+	u16 tmode;
+
+	wValue = le16_to_cpu(ctrl->wValue);
+	wIndex = le16_to_cpu(ctrl->wIndex);
+	state = priv_dev->gadget.state;
+	speed = priv_dev->gadget.speed;
+
+	switch (ctrl->wValue) {
+	case USB_DEVICE_REMOTE_WAKEUP:
+		priv_dev->wake_up_flag = !!set;
+		break;
+	case USB_DEVICE_U1_ENABLE:
+		if (state != USB_STATE_CONFIGURED || speed != USB_SPEED_SUPER)
+			return -EINVAL;
+
+		priv_dev->u1_allowed = !!set;
+		break;
+	case USB_DEVICE_U2_ENABLE:
+		if (state != USB_STATE_CONFIGURED || speed != USB_SPEED_SUPER)
+			return -EINVAL;
+
+		priv_dev->u2_allowed = !!set;
+		break;
+	case USB_DEVICE_LTM_ENABLE:
+		ret = -EINVAL;
+		break;
+	case USB_DEVICE_TEST_MODE:
+		if (state != USB_STATE_CONFIGURED || speed > USB_SPEED_HIGH)
+			return -EINVAL;
+
+		tmode = le16_to_cpu(ctrl->wIndex);
+
+		if (!set || (tmode & 0xff) != 0)
+			return -EINVAL;
+
+		switch (tmode >> 8) {
+		case TEST_J:
+		case TEST_K:
+		case TEST_SE0_NAK:
+		case TEST_PACKET:
+			cdns3_ep0_complete_setup(priv_dev, 0, 1);
+			/**
+			 *  Little delay to give the controller some time
+			 * for sending status stage.
+			 * This time should be less then 3ms.
+			 */
+			usleep_range(1000, 2000);
+			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
+					       USB_CMD_STMODE |
+					       USB_STS_TMODE_SEL(tmode - 1));
+			break;
+		default:
+			ret = -EINVAL;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int cdns3_ep0_feature_handle_intf(struct cdns3_device *priv_dev,
+					 struct usb_ctrlrequest *ctrl,
+					 int set)
+{
+	u32 wValue;
+	int ret = 0;
+
+	wValue = le16_to_cpu(ctrl->wValue);
+
+	switch (wValue) {
+	case USB_INTRF_FUNC_SUSPEND:
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int cdns3_ep0_feature_handle_endpoint(struct cdns3_device *priv_dev,
+					     struct usb_ctrlrequest *ctrl,
+					     int set)
+{
+	struct cdns3_endpoint *priv_ep;
+	int ret = 0;
+	u8 index;
+	int val;
+
+	if (le16_to_cpu(ctrl->wValue) != USB_ENDPOINT_HALT)
+		return -EINVAL;
+
+	if (!(ctrl->wIndex & ~USB_DIR_IN))
+		return 0;
+
+	index = cdns3_ep_addr_to_index(ctrl->wIndex);
+	priv_ep = priv_dev->eps[index];
+
+	cdns3_select_ep(priv_dev, ctrl->wIndex);
+
+	if (set) {
+		writel(EP_CMD_SSTALL, &priv_dev->regs->ep_cmd);
+		trace_cdns3_halt(priv_ep, set, 0);
+		priv_ep->flags |= EP_STALL;
+	} else {
+		struct usb_request *request;
+
+		if (priv_dev->eps[index]->flags & EP_WEDGE) {
+			cdns3_select_ep(priv_dev, 0x00);
+			return 0;
+		}
+
+		trace_cdns3_halt(priv_ep, set, 0);
+
+		writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
+
+		/* wait for EPRST cleared */
+		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+					  !(val & EP_CMD_EPRST), 1, 100);
+		if (ret)
+			return -EINVAL;
+
+		priv_ep->flags &= ~EP_STALL;
+
+		request = cdns3_next_request(&priv_ep->pending_req_list);
+		if (request)
+			cdns3_rearm_transfer(priv_ep, 1);
+	}
+
+	return ret;
+}
+
+/**
+ * cdns3_req_ep0_handle_feature -
+ * Handling of GET/SET_FEATURE standard USB request
+ *
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ * @set: must be set to 1 for SET_FEATURE request
+ *
+ * Returns 0 if success, error code on error
+ */
+static int cdns3_req_ep0_handle_feature(struct cdns3_device *priv_dev,
+					struct usb_ctrlrequest *ctrl,
+					int set)
+{
+	int ret = 0;
+	u32 recip;
+
+	recip = ctrl->bRequestType & USB_RECIP_MASK;
+
+	switch (recip) {
+	case USB_RECIP_DEVICE:
+		ret = cdns3_ep0_feature_handle_device(priv_dev, ctrl, set);
+		break;
+	case USB_RECIP_INTERFACE:
+		ret = cdns3_ep0_feature_handle_intf(priv_dev, ctrl, set);
+		break;
+	case USB_RECIP_ENDPOINT:
+		ret = cdns3_ep0_feature_handle_endpoint(priv_dev, ctrl, set);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+/**
+ * cdns3_req_ep0_set_sel - Handling of SET_SEL standard USB request
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns 0 if success, error code on error
+ */
+static int cdns3_req_ep0_set_sel(struct cdns3_device *priv_dev,
+				 struct usb_ctrlrequest *ctrl_req)
+{
+	if (priv_dev->gadget.state < USB_STATE_ADDRESS)
+		return -EINVAL;
+
+	if (ctrl_req->wLength != 6) {
+		dev_err(priv_dev->dev, "Set SEL should be 6 bytes, got %d\n",
+			ctrl_req->wLength);
+		return -EINVAL;
+	}
+
+	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma, 6, 1, 0);
+	return 0;
+}
+
+/**
+ * cdns3_req_ep0_set_isoch_delay -
+ * Handling of GET_ISOCH_DELAY standard USB request
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns 0 if success, error code on error
+ */
+static int cdns3_req_ep0_set_isoch_delay(struct cdns3_device *priv_dev,
+					 struct usb_ctrlrequest *ctrl_req)
+{
+	if (ctrl_req->wIndex || ctrl_req->wLength)
+		return -EINVAL;
+
+	priv_dev->isoch_delay = ctrl_req->wValue;
+
+	return 0;
+}
+
+/**
+ * cdns3_ep0_standard_request - Handling standard USB requests
+ * @priv_dev: extended gadget object
+ * @ctrl_req: pointer to received setup packet
+ *
+ * Returns 0 if success, error code on error
+ */
+static int cdns3_ep0_standard_request(struct cdns3_device *priv_dev,
+				      struct usb_ctrlrequest *ctrl_req)
+{
+	int ret;
+
+	switch (ctrl_req->bRequest) {
+	case USB_REQ_SET_ADDRESS:
+		ret = cdns3_req_ep0_set_address(priv_dev, ctrl_req);
+		break;
+	case USB_REQ_SET_CONFIGURATION:
+		ret = cdns3_req_ep0_set_configuration(priv_dev, ctrl_req);
+		break;
+	case USB_REQ_GET_STATUS:
+		ret = cdns3_req_ep0_get_status(priv_dev, ctrl_req);
+		break;
+	case USB_REQ_CLEAR_FEATURE:
+		ret = cdns3_req_ep0_handle_feature(priv_dev, ctrl_req, 0);
+		break;
+	case USB_REQ_SET_FEATURE:
+		ret = cdns3_req_ep0_handle_feature(priv_dev, ctrl_req, 1);
+		break;
+	case USB_REQ_SET_SEL:
+		ret = cdns3_req_ep0_set_sel(priv_dev, ctrl_req);
+		break;
+	case USB_REQ_SET_ISOCH_DELAY:
+		ret = cdns3_req_ep0_set_isoch_delay(priv_dev, ctrl_req);
+		break;
+	default:
+		ret = cdns3_ep0_delegate_req(priv_dev, ctrl_req);
+		break;
+	}
+
+	return ret;
+}
+
+static void __pending_setup_status_handler(struct cdns3_device *priv_dev)
+{
+	struct usb_request *request = priv_dev->pending_status_request;
+
+	if (priv_dev->status_completion_no_call && request &&
+	    request->complete) {
+		request->complete(&priv_dev->eps[0]->endpoint, request);
+		priv_dev->status_completion_no_call = 0;
+	}
+}
+
+void cdns3_pending_setup_status_handler(struct work_struct *work)
+{
+	struct cdns3_device *priv_dev = container_of(work, struct cdns3_device,
+			pending_status_wq);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+	__pending_setup_status_handler(priv_dev);
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+}
+
+/**
+ * cdns3_ep0_setup_phase - Handling setup USB requests
+ * @priv_dev: extended gadget object
+ */
+static void cdns3_ep0_setup_phase(struct cdns3_device *priv_dev)
+{
+	struct usb_ctrlrequest *ctrl = priv_dev->setup_buf;
+	struct cdns3_endpoint *priv_ep = priv_dev->eps[0];
+	int result;
+
+	priv_dev->ep0_data_dir = ctrl->bRequestType & USB_DIR_IN;
+
+	trace_cdns3_ctrl_req(ctrl);
+
+	if (!list_empty(&priv_ep->pending_req_list)) {
+		struct usb_request *request;
+
+		request = cdns3_next_request(&priv_ep->pending_req_list);
+		priv_ep->dir = priv_dev->ep0_data_dir;
+		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
+				      -ECONNRESET);
+	}
+
+	if (le16_to_cpu(ctrl->wLength))
+		priv_dev->ep0_stage = CDNS3_DATA_STAGE;
+	else
+		priv_dev->ep0_stage = CDNS3_STATUS_STAGE;
+
+	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD)
+		result = cdns3_ep0_standard_request(priv_dev, ctrl);
+	else
+		result = cdns3_ep0_delegate_req(priv_dev, ctrl);
+
+	if (result == USB_GADGET_DELAYED_STATUS)
+		return;
+
+	if (result < 0)
+		cdns3_ep0_complete_setup(priv_dev, 1, 1);
+	else if (priv_dev->ep0_stage == CDNS3_STATUS_STAGE)
+		cdns3_ep0_complete_setup(priv_dev, 0, 1);
+}
+
+static void cdns3_transfer_completed(struct cdns3_device *priv_dev)
+{
+	struct cdns3_endpoint *priv_ep = priv_dev->eps[0];
+
+	if (!list_empty(&priv_ep->pending_req_list)) {
+		struct usb_request *request;
+
+		trace_cdns3_complete_trb(priv_ep, priv_ep->trb_pool);
+		request = cdns3_next_request(&priv_ep->pending_req_list);
+
+		request->actual =
+			TRB_LEN(le32_to_cpu(priv_ep->trb_pool->length));
+
+		priv_ep->dir = priv_dev->ep0_data_dir;
+		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request), 0);
+	}
+
+	cdns3_ep0_complete_setup(priv_dev, 0, 0);
+}
+
+/**
+ * cdns3_check_new_setup - Check if controller receive new SETUP packet.
+ * @priv_dev: extended gadget object
+ *
+ * The SETUP packet can be kept in on-chip memory or in system memory.
+ */
+static bool cdns3_check_new_setup(struct cdns3_device *priv_dev)
+{
+	u32 ep_sts_reg;
+
+	cdns3_select_ep(priv_dev, 0 | USB_DIR_OUT);
+	ep_sts_reg = readl(&priv_dev->regs->ep_sts);
+
+	return !!(ep_sts_reg & (EP_STS_SETUP | EP_STS_STPWAIT));
+}
+
+/**
+ * cdns3_check_ep0_interrupt_proceed - Processes interrupt related to endpoint 0
+ * @priv_dev: extended gadget object
+ * @dir: USB_DIR_IN for IN direction, USB_DIR_OUT for OUT direction
+ */
+void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, int dir)
+{
+	u32 ep_sts_reg;
+
+	cdns3_select_ep(priv_dev, dir);
+
+	ep_sts_reg = readl(&priv_dev->regs->ep_sts);
+	writel(ep_sts_reg, &priv_dev->regs->ep_sts);
+
+	trace_cdns3_ep0_irq(priv_dev, ep_sts_reg);
+
+	__pending_setup_status_handler(priv_dev);
+
+	if (ep_sts_reg & EP_STS_SETUP)
+		priv_dev->wait_for_setup = 1;
+
+	if (priv_dev->wait_for_setup && ep_sts_reg & EP_STS_IOC) {
+		priv_dev->wait_for_setup = 0;
+		cdns3_allow_enable_l1(priv_dev, 0);
+		cdns3_ep0_setup_phase(priv_dev);
+	} else if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP)) {
+		priv_dev->ep0_data_dir = dir;
+		cdns3_transfer_completed(priv_dev);
+	}
+
+	if (ep_sts_reg & EP_STS_DESCMIS) {
+		if (dir == 0 && !priv_dev->setup_pending)
+			cdns3_prepare_setup_packet(priv_dev);
+	}
+}
+
+/**
+ * cdns3_gadget_ep0_enable
+ * Function shouldn't be called by gadget driver,
+ * endpoint 0 is allways active
+ */
+static int cdns3_gadget_ep0_enable(struct usb_ep *ep,
+				   const struct usb_endpoint_descriptor *desc)
+{
+	return -EINVAL;
+}
+
+/**
+ * cdns3_gadget_ep0_disable
+ * Function shouldn't be called by gadget driver,
+ * endpoint 0 is allways active
+ */
+static int cdns3_gadget_ep0_disable(struct usb_ep *ep)
+{
+	return -EINVAL;
+}
+
+/**
+ * cdns3_gadget_ep0_set_halt
+ * @ep: pointer to endpoint zero object
+ * @value: 1 for set stall, 0 for clear stall
+ *
+ * Returns 0
+ */
+static int cdns3_gadget_ep0_set_halt(struct usb_ep *ep, int value)
+{
+	/* TODO */
+	return 0;
+}
+
+/**
+ * cdns3_gadget_ep0_queue Transfer data on endpoint zero
+ * @ep: pointer to endpoint zero object
+ * @request: pointer to request object
+ * @gfp_flags: gfp flags
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
+				  struct usb_request *request,
+				  gfp_t gfp_flags)
+{
+	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	unsigned long flags;
+	int erdy_sent = 0;
+	int ret = 0;
+	u8 zlp = 0;
+
+	trace_cdns3_ep0_queue(priv_dev, request);
+
+	/* cancel the request if controller receive new SETUP packet. */
+	if (cdns3_check_new_setup(priv_dev))
+		return -ECONNRESET;
+
+	/* send STATUS stage. Should be called only for SET_CONFIGURATION */
+	if (priv_dev->ep0_stage == CDNS3_STATUS_STAGE) {
+		spin_lock_irqsave(&priv_dev->lock, flags);
+		cdns3_select_ep(priv_dev, 0x00);
+
+		erdy_sent = !priv_dev->hw_configured_flag;
+		cdns3_set_hw_configuration(priv_dev);
+
+		if (!erdy_sent)
+			cdns3_ep0_complete_setup(priv_dev, 0, 1);
+
+		cdns3_allow_enable_l1(priv_dev, 1);
+
+		request->actual = 0;
+		priv_dev->status_completion_no_call = true;
+		priv_dev->pending_status_request = request;
+		spin_unlock_irqrestore(&priv_dev->lock, flags);
+
+		/*
+		 * Since there is no completion interrupt for status stage,
+		 * it needs to call ->completion in software after
+		 * ep0_queue is back.
+		 */
+		queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
+		return 0;
+	}
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+	if (!list_empty(&priv_ep->pending_req_list)) {
+		dev_err(priv_dev->dev,
+			"can't handle multiple requests for ep0\n");
+		spin_unlock_irqrestore(&priv_dev->lock, flags);
+		return -EBUSY;
+	}
+
+	ret = usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
+					    priv_dev->ep0_data_dir);
+	if (ret) {
+		spin_unlock_irqrestore(&priv_dev->lock, flags);
+		dev_err(priv_dev->dev, "failed to map request\n");
+		return -EINVAL;
+	}
+
+	request->status = -EINPROGRESS;
+	list_add_tail(&request->list, &priv_ep->pending_req_list);
+
+	if (request->zero && request->length &&
+	    (request->length % ep->maxpacket == 0))
+		zlp = 1;
+
+	cdns3_ep0_run_transfer(priv_dev, request->dma, request->length, 1, zlp);
+
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+
+	return ret;
+}
+
+/**
+ * cdns3_gadget_ep_set_wedge Set wedge on selected endpoint
+ * @ep: endpoint object
+ *
+ * Returns 0
+ */
+int cdns3_gadget_ep_set_wedge(struct usb_ep *ep)
+{
+	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+
+	dev_dbg(priv_dev->dev, "Wedge for %s\n", ep->name);
+	cdns3_gadget_ep_set_halt(ep, 1);
+	priv_ep->flags |= EP_WEDGE;
+
+	return 0;
+}
+
+const struct usb_ep_ops cdns3_gadget_ep0_ops = {
+	.enable = cdns3_gadget_ep0_enable,
+	.disable = cdns3_gadget_ep0_disable,
+	.alloc_request = cdns3_gadget_ep_alloc_request,
+	.free_request = cdns3_gadget_ep_free_request,
+	.queue = cdns3_gadget_ep0_queue,
+	.dequeue = cdns3_gadget_ep_dequeue,
+	.set_halt = cdns3_gadget_ep0_set_halt,
+	.set_wedge = cdns3_gadget_ep_set_wedge,
+};
+
+/**
+ * cdns3_ep0_config - Configures default endpoint
+ * @priv_dev: extended gadget object
+ *
+ * Functions sets parameters: maximal packet size and enables interrupts
+ */
+void cdns3_ep0_config(struct cdns3_device *priv_dev)
+{
+	struct cdns3_usb_regs __iomem *regs;
+	struct cdns3_endpoint *priv_ep;
+	u32 max_packet_size = 64;
+
+	regs = priv_dev->regs;
+
+	if (priv_dev->gadget.speed == USB_SPEED_SUPER)
+		max_packet_size = 512;
+
+	priv_ep = priv_dev->eps[0];
+
+	if (!list_empty(&priv_ep->pending_req_list)) {
+		struct usb_request *request;
+
+		request = cdns3_next_request(&priv_ep->pending_req_list);
+		list_del_init(&request->list);
+	}
+
+	priv_dev->u1_allowed = 0;
+	priv_dev->u2_allowed = 0;
+
+	priv_dev->gadget.ep0->maxpacket = max_packet_size;
+	cdns3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(max_packet_size);
+
+	/* init ep out */
+	cdns3_select_ep(priv_dev, USB_DIR_OUT);
+
+	if (priv_dev->dev_ver >= DEV_VER_V3) {
+		cdns3_set_register_bit(&priv_dev->regs->dtrans,
+				       BIT(0) | BIT(16));
+		cdns3_set_register_bit(&priv_dev->regs->tdl_from_trb,
+				       BIT(0) | BIT(16));
+	}
+
+	writel(EP_CFG_ENABLE | EP_CFG_MAXPKTSIZE(max_packet_size),
+	       &regs->ep_cfg);
+
+	writel(EP_STS_EN_SETUPEN | EP_STS_EN_DESCMISEN | EP_STS_EN_TRBERREN,
+	       &regs->ep_sts_en);
+
+	/* init ep in */
+	cdns3_select_ep(priv_dev, USB_DIR_IN);
+
+	writel(EP_CFG_ENABLE | EP_CFG_MAXPKTSIZE(max_packet_size),
+	       &regs->ep_cfg);
+
+	writel(EP_STS_EN_SETUPEN | EP_STS_EN_TRBERREN, &regs->ep_sts_en);
+
+	cdns3_set_register_bit(&regs->usb_conf, USB_CONF_U1DS | USB_CONF_U2DS);
+}
+
+/**
+ * cdns3_init_ep0 Initializes software endpoint 0 of gadget
+ * @priv_dev: extended gadget object
+ * @ep_priv: extended endpoint object
+ *
+ * Returns 0 on success else error code.
+ */
+int cdns3_init_ep0(struct cdns3_device *priv_dev,
+		   struct cdns3_endpoint *priv_ep)
+{
+	sprintf(priv_ep->name, "ep0");
+
+	/* fill linux fields */
+	priv_ep->endpoint.ops = &cdns3_gadget_ep0_ops;
+	priv_ep->endpoint.maxburst = 1;
+	usb_ep_set_maxpacket_limit(&priv_ep->endpoint,
+				   CDNS3_EP0_MAX_PACKET_LIMIT);
+	priv_ep->endpoint.address = 0;
+	priv_ep->endpoint.caps.type_control = 1;
+	priv_ep->endpoint.caps.dir_in = 1;
+	priv_ep->endpoint.caps.dir_out = 1;
+	priv_ep->endpoint.name = priv_ep->name;
+	priv_ep->endpoint.desc = &cdns3_gadget_ep0_desc;
+	priv_dev->gadget.ep0 = &priv_ep->endpoint;
+	priv_ep->type = USB_ENDPOINT_XFER_CONTROL;
+
+	return cdns3_allocate_trb_pool(priv_ep);
+}
diff --git a/drivers/usb/cdns3/gadget-export.h b/drivers/usb/cdns3/gadget-export.h
new file mode 100644
index 000000000000..577469eee961
--- /dev/null
+++ b/drivers/usb/cdns3/gadget-export.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USBSS DRD Driver - Gadget Export APIs.
+ *
+ * Copyright (C) 2017 NXP
+ * Copyright (C) 2017-2018 NXP
+ *
+ * Authors: Peter Chen <peter.chen@nxp.com>
+ */
+#ifndef __LINUX_CDNS3_GADGET_EXPORT
+#define __LINUX_CDNS3_GADGET_EXPORT
+
+#ifdef CONFIG_USB_CDNS3_GADGET
+
+int cdns3_gadget_init(struct cdns3 *cdns);
+void cdns3_gadget_exit(struct cdns3 *cdns);
+#else
+
+static inline int cdns3_gadget_init(struct cdns3 *cdns)
+{
+	return -ENXIO;
+}
+
+static inline void cdns3_gadget_exit(struct cdns3 *cdns) { }
+
+#endif
+
+#endif /* __LINUX_CDNS3_GADGET_EXPORT */
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
new file mode 100644
index 000000000000..291f08be56fe
--- /dev/null
+++ b/drivers/usb/cdns3/gadget.c
@@ -0,0 +1,2338 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver - gadget side.
+ *
+ * Copyright (C) 2018-2019 Cadence Design Systems.
+ * Copyright (C) 2017-2018 NXP
+ *
+ * Authors: Pawel Jez <pjez@cadence.com>,
+ *          Pawel Laszczak <pawell@cadence.com>
+ *          Peter Chen <peter.chen@nxp.com>
+ */
+
+/*
+ * Work around 1:
+ * At some situations, the controller may get stale data address in TRB
+ * at below sequences:
+ * 1. Controller read TRB includes data address
+ * 2. Software updates TRBs includes data address and Cycle bit
+ * 3. Controller read TRB which includes Cycle bit
+ * 4. DMA run with stale data address
+ *
+ * To fix this problem, driver needs to make the first TRB in TD as invalid.
+ * After preparing all TRBs driver needs to check the position of DMA and
+ * if the DMA point to the first just added TRB and doorbell is 1,
+ * then driver must defer making this TRB as valid. This TRB will be make
+ * as valid during adding next TRB only if DMA is stopped or at TRBERR
+ * interrupt.
+ *
+ * Issue has been fixed in DEV_VER_V3 version of controller.
+ *
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/usb/gadget.h>
+#include <linux/module.h>
+#include <linux/iopoll.h>
+
+#include "core.h"
+#include "gadget-export.h"
+#include "gadget.h"
+#include "trace.h"
+#include "drd.h"
+
+static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
+				   struct usb_request *request,
+				   gfp_t gfp_flags);
+
+/**
+ * cdns3_set_register_bit - set bit in given register.
+ * @ptr: address of device controller register to be read and changed
+ * @mask: bits requested to set
+ */
+void cdns3_set_register_bit(void __iomem *ptr, u32 mask)
+{
+	mask = readl(ptr) | mask;
+	writel(mask, ptr);
+}
+
+/**
+ * cdns3_ep_addr_to_index - Macro converts endpoint address to
+ * index of endpoint object in cdns3_device.eps[] container
+ * @ep_addr: endpoint address for which endpoint object is required
+ *
+ */
+u8 cdns3_ep_addr_to_index(u8 ep_addr)
+{
+	return (((ep_addr & 0x7F)) + ((ep_addr & USB_DIR_IN) ? 16 : 0));
+}
+
+static int cdns3_get_dma_pos(struct cdns3_device *priv_dev,
+			     struct cdns3_endpoint *priv_ep)
+{
+	int dma_index;
+
+	dma_index = readl(&priv_dev->regs->ep_traddr) - priv_ep->trb_pool_dma;
+
+	return dma_index / TRB_SIZE;
+}
+
+/**
+ * cdns3_next_request - returns next request from list
+ * @list: list containing requests
+ *
+ * Returns request or NULL if no requests in list
+ */
+struct usb_request *cdns3_next_request(struct list_head *list)
+{
+	return list_first_entry_or_null(list, struct usb_request, list);
+}
+
+/**
+ * cdns3_next_align_buf - returns next buffer from list
+ * @list: list containing buffers
+ *
+ * Returns buffer or NULL if no buffers in list
+ */
+struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
+{
+	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
+}
+
+/**
+ * select_ep - selects endpoint
+ * @priv_dev:  extended gadget object
+ * @ep: endpoint address
+ */
+void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep)
+{
+	if (priv_dev->selected_ep == ep)
+		return;
+
+	priv_dev->selected_ep = ep;
+	writel(ep, &priv_dev->regs->ep_sel);
+}
+
+dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
+				 struct cdns3_trb *trb)
+{
+	u32 offset = (char *)trb - (char *)priv_ep->trb_pool;
+
+	return priv_ep->trb_pool_dma + offset;
+}
+
+int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
+{
+	switch (priv_ep->type) {
+	case USB_ENDPOINT_XFER_ISOC:
+		return TRB_ISO_RING_SIZE;
+	case USB_ENDPOINT_XFER_CONTROL:
+		return TRB_CTRL_RING_SIZE;
+	default:
+		return TRB_RING_SIZE;
+	}
+}
+
+/**
+ * cdns3_allocate_trb_pool - Allocates TRB's pool for selected endpoint
+ * @priv_ep:  endpoint object
+ *
+ * Function will return 0 on success or -ENOMEM on allocation error
+ */
+int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	int ring_size = cdns3_ring_size(priv_ep);
+	struct cdns3_trb *link_trb;
+
+	if (!priv_ep->trb_pool) {
+		priv_ep->trb_pool = dma_alloc_coherent(priv_dev->sysdev,
+						       ring_size,
+						       &priv_ep->trb_pool_dma,
+						       GFP_DMA32 | GFP_ATOMIC);
+		if (!priv_ep->trb_pool)
+			return -ENOMEM;
+	} else {
+		memset(priv_ep->trb_pool, 0, ring_size);
+	}
+
+	if (!priv_ep->num)
+		return 0;
+
+	priv_ep->num_trbs = ring_size / TRB_SIZE;
+	/* Initialize the last TRB as Link TRB. */
+	link_trb = (priv_ep->trb_pool + (priv_ep->num_trbs - 1));
+	link_trb->buffer = TRB_BUFFER(priv_ep->trb_pool_dma);
+	link_trb->control = TRB_CYCLE | TRB_TYPE(TRB_LINK) | TRB_TOGGLE;
+
+	return 0;
+}
+
+static void cdns3_free_trb_pool(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+
+	if (priv_ep->trb_pool) {
+		dma_free_coherent(priv_dev->sysdev,
+				  cdns3_ring_size(priv_ep),
+				  priv_ep->trb_pool, priv_ep->trb_pool_dma);
+		priv_ep->trb_pool = NULL;
+	}
+}
+
+/**
+ * cdns3_ep_stall_flush - Stalls and flushes selected endpoint
+ * @priv_ep: endpoint object
+ *
+ * Endpoint must be selected before call to this function
+ */
+static void cdns3_ep_stall_flush(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	int val;
+
+	trace_cdns3_halt(priv_ep, 1, 1);
+
+	writel(EP_CMD_DFLUSH | EP_CMD_ERDY | EP_CMD_SSTALL,
+	       &priv_dev->regs->ep_cmd);
+
+	/* wait for DFLUSH cleared */
+	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+				  !(val & EP_CMD_DFLUSH), 1, 1000);
+	priv_ep->flags |= EP_STALL;
+}
+
+/**
+ * cdns3_hw_reset_eps_config - reset endpoints configuration kept by controller.
+ * @priv_dev: extended gadget object
+ */
+void cdns3_hw_reset_eps_config(struct cdns3_device *priv_dev)
+{
+	writel(USB_CONF_CFGRST, &priv_dev->regs->usb_conf);
+
+	cdns3_allow_enable_l1(priv_dev, 0);
+	priv_dev->hw_configured_flag = 0;
+	priv_dev->onchip_used_size = 0;
+	priv_dev->out_mem_is_allocated = 0;
+	priv_dev->wait_for_setup = 0;
+}
+
+/**
+ * cdns3_ep_inc_trb - increment a trb index.
+ * @index: Pointer to the TRB index to increment.
+ * @cs: Cycle state
+ * @trb_in_seg: number of TRBs in segment
+ *
+ * The index should never point to the link TRB. After incrementing,
+ * if it is point to the link TRB, wrap around to the beginning and revert
+ * cycle state bit The
+ * link TRB is always at the last TRB entry.
+ */
+static void cdns3_ep_inc_trb(int *index, u8 *cs, int trb_in_seg)
+{
+	(*index)++;
+	if (*index == (trb_in_seg - 1)) {
+		*index = 0;
+		*cs ^=  1;
+	}
+}
+
+/**
+ * cdns3_ep_inc_enq - increment endpoint's enqueue pointer
+ * @priv_ep: The endpoint whose enqueue pointer we're incrementing
+ */
+static void cdns3_ep_inc_enq(struct cdns3_endpoint *priv_ep)
+{
+	priv_ep->free_trbs--;
+	cdns3_ep_inc_trb(&priv_ep->enqueue, &priv_ep->pcs, priv_ep->num_trbs);
+}
+
+/**
+ * cdns3_ep_inc_deq - increment endpoint's dequeue pointer
+ * @priv_ep: The endpoint whose dequeue pointer we're incrementing
+ */
+static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
+{
+	priv_ep->free_trbs++;
+	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
+}
+
+void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
+{
+	struct cdns3_endpoint *priv_ep = priv_req->priv_ep;
+	int current_trb = priv_req->start_trb;
+
+	while (current_trb != priv_req->end_trb) {
+		cdns3_ep_inc_deq(priv_ep);
+		current_trb = priv_ep->dequeue;
+	}
+
+	cdns3_ep_inc_deq(priv_ep);
+}
+
+/**
+ * cdns3_allow_enable_l1 - enable/disable permits to transition to L1.
+ * @priv_dev: Extended gadget object
+ * @enable: Enable/disable permit to transition to L1.
+ *
+ * If bit USB_CONF_L1EN is set and device receive Extended Token packet,
+ * then controller answer with ACK handshake.
+ * If bit USB_CONF_L1DS is set and device receive Extended Token packet,
+ * then controller answer with NYET handshake.
+ */
+void cdns3_allow_enable_l1(struct cdns3_device *priv_dev, int enable)
+{
+	if (enable)
+		writel(USB_CONF_L1EN, &priv_dev->regs->usb_conf);
+	else
+		writel(USB_CONF_L1DS, &priv_dev->regs->usb_conf);
+}
+
+enum usb_device_speed cdns3_get_speed(struct cdns3_device *priv_dev)
+{
+	u32 reg;
+
+	reg = readl(&priv_dev->regs->usb_sts);
+
+	if (DEV_SUPERSPEED(reg))
+		return USB_SPEED_SUPER;
+	else if (DEV_HIGHSPEED(reg))
+		return USB_SPEED_HIGH;
+	else if (DEV_FULLSPEED(reg))
+		return USB_SPEED_FULL;
+	else if (DEV_LOWSPEED(reg))
+		return USB_SPEED_LOW;
+	return USB_SPEED_UNKNOWN;
+}
+
+/**
+ * cdns3_start_all_request - add to ring all request not started
+ * @priv_dev: Extended gadget object
+ * @priv_ep: The endpoint for whom request will be started.
+ *
+ * Returns return ENOMEM if transfer ring i not enough TRBs to start
+ *         all requests.
+ */
+static int cdns3_start_all_request(struct cdns3_device *priv_dev,
+				   struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_request *priv_req;
+	struct usb_request *request;
+	int ret = 0;
+
+	while (!list_empty(&priv_ep->deferred_req_list)) {
+		request = cdns3_next_request(&priv_ep->deferred_req_list);
+		priv_req = to_cdns3_request(request);
+
+		ret = cdns3_ep_run_transfer(priv_ep, request);
+		if (ret)
+			return ret;
+
+		list_del(&request->list);
+		list_add_tail(&request->list,
+			      &priv_ep->pending_req_list);
+	}
+
+	priv_ep->flags &= ~EP_RING_FULL;
+	return ret;
+}
+
+/**
+ * cdns3_gadget_giveback - call struct usb_request's ->complete callback
+ * @priv_ep: The endpoint to whom the request belongs to
+ * @priv_req: The request we're giving back
+ * @status: completion code for the request
+ *
+ * Must be called with controller's lock held and interrupts disabled. This
+ * function will unmap @req and call its ->complete() callback to notify upper
+ * layers that it has completed.
+ */
+void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
+			   struct cdns3_request *priv_req,
+			   int status)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct usb_request *request = &priv_req->request;
+
+	list_del_init(&request->list);
+
+	if (request->status == -EINPROGRESS)
+		request->status = status;
+
+	usb_gadget_unmap_request_by_dev(priv_dev->sysdev, request,
+					priv_ep->dir);
+
+	if ((priv_req->flags & REQUEST_UNALIGNED) &&
+	    priv_ep->dir == USB_DIR_OUT && !request->status)
+		memcpy(request->buf, priv_req->aligned_buf->buf,
+		       request->length);
+
+	priv_req->flags &= ~(REQUEST_PENDING | REQUEST_UNALIGNED);
+	trace_cdns3_gadget_giveback(priv_req);
+
+	if (request->complete) {
+		spin_unlock(&priv_dev->lock);
+		usb_gadget_giveback_request(&priv_ep->endpoint,
+					    request);
+		spin_lock(&priv_dev->lock);
+	}
+
+	if (request->buf == priv_dev->zlp_buf)
+		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
+}
+
+void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
+{
+	/* Work around for stale data address in TRB*/
+	if (priv_ep->wa1_set) {
+		trace_cdns3_wa1(priv_ep, "restore cycle bit");
+
+		priv_ep->wa1_set = 0;
+		priv_ep->wa1_trb_index = 0xFFFF;
+		if (priv_ep->wa1_cycle_bit) {
+			priv_ep->wa1_trb->control =
+				priv_ep->wa1_trb->control | 0x1;
+		} else {
+			priv_ep->wa1_trb->control =
+				priv_ep->wa1_trb->control & ~0x1;
+		}
+	}
+}
+
+static int cdns3_prepare_aligned_request_buf(struct cdns3_request *priv_req)
+{
+	struct cdns3_endpoint *priv_ep = priv_req->priv_ep;
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct cdns3_aligned_buf *buf;
+
+	/* check if buffer is aligned to 8. */
+	if (!((uintptr_t)priv_req->request.buf & 0x7))
+		return 0;
+
+	buf = priv_req->aligned_buf;
+
+	if (!buf || priv_req->request.length > buf->size) {
+		buf = kzalloc(sizeof(*buf), GFP_ATOMIC);
+		if (!buf)
+			return -ENOMEM;
+
+		buf->size = priv_req->request.length;
+
+		buf->buf = dma_alloc_coherent(priv_dev->sysdev,
+					      buf->size,
+					      &buf->dma,
+					      GFP_ATOMIC);
+		if (!buf->buf) {
+			kfree(buf);
+			return -ENOMEM;
+		}
+
+		if (priv_req->aligned_buf) {
+			trace_cdns3_free_aligned_request(priv_req);
+			priv_req->aligned_buf->in_use = 0;
+			priv_dev->run_garbage_collector = 1;
+		}
+
+		buf->in_use = 1;
+		priv_req->aligned_buf = buf;
+
+		list_add_tail(&buf->list,
+			      &priv_dev->aligned_buf_list);
+	}
+
+	if (priv_ep->dir == USB_DIR_IN) {
+		memcpy(buf->buf, priv_req->request.buf,
+		       priv_req->request.length);
+	}
+
+	priv_req->flags |= REQUEST_UNALIGNED;
+	trace_cdns3_prepare_aligned_request(priv_req);
+
+	return 0;
+}
+
+static int cdns3_wa1_update_guard(struct cdns3_endpoint *priv_ep,
+				  struct cdns3_trb *trb)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+
+	if (!priv_ep->wa1_set) {
+		u32 doorbell;
+
+		doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
+
+		if (doorbell) {
+			priv_ep->wa1_cycle_bit = priv_ep->pcs ? TRB_CYCLE : 0;
+			priv_ep->wa1_set = 1;
+			priv_ep->wa1_trb = trb;
+			priv_ep->wa1_trb_index = priv_ep->enqueue;
+			trace_cdns3_wa1(priv_ep, "set guard");
+			return 0;
+		}
+	}
+	return 1;
+}
+
+static void cdns3_wa1_tray_restore_cycle_bit(struct cdns3_device *priv_dev,
+					     struct cdns3_endpoint *priv_ep)
+{
+	int dma_index;
+	u32 doorbell;
+
+	doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
+	dma_index = cdns3_get_dma_pos(priv_dev, priv_ep);
+
+	if (!doorbell || dma_index != priv_ep->wa1_trb_index)
+		cdns3_wa1_restore_cycle_bit(priv_ep);
+}
+
+/**
+ * cdns3_ep_run_transfer - start transfer on no-default endpoint hardware
+ * @priv_ep: endpoint object
+ *
+ * Returns zero on success or negative value on failure
+ */
+int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
+			  struct usb_request *request)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct cdns3_request *priv_req;
+	struct cdns3_trb *trb;
+	dma_addr_t trb_dma;
+	u32 togle_pcs = 1;
+	int sg_iter = 0;
+	int num_trb;
+	int address;
+	u32 control;
+	int pcs;
+
+	if (priv_ep->type == USB_ENDPOINT_XFER_ISOC)
+		num_trb = priv_ep->interval;
+	else
+		num_trb = request->num_sgs ? request->num_sgs : 1;
+
+	if (num_trb > priv_ep->free_trbs) {
+		priv_ep->flags |= EP_RING_FULL;
+		return -ENOBUFS;
+	}
+
+	priv_req = to_cdns3_request(request);
+	address = priv_ep->endpoint.desc->bEndpointAddress;
+
+	priv_ep->flags |= EP_PENDING_REQUEST;
+
+	/* must allocate buffer aligned to 8 */
+	if (priv_req->flags & REQUEST_UNALIGNED)
+		trb_dma = priv_req->aligned_buf->dma;
+	else
+		trb_dma = request->dma;
+
+	trb = priv_ep->trb_pool + priv_ep->enqueue;
+	priv_req->start_trb = priv_ep->enqueue;
+	priv_req->trb = trb;
+
+	cdns3_select_ep(priv_ep->cdns3_dev, address);
+
+	/* prepare ring */
+	if ((priv_ep->enqueue + num_trb)  >= (priv_ep->num_trbs - 1)) {
+		struct cdns3_trb *link_trb;
+		int doorbell, dma_index;
+		u32 ch_bit = 0;
+
+		doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
+		dma_index = cdns3_get_dma_pos(priv_dev, priv_ep);
+
+		/* Driver can't update LINK TRB if it is current processed. */
+		if (doorbell && dma_index == priv_ep->num_trbs - 1) {
+			priv_ep->flags |= EP_DEFERRED_DRDY;
+			return -ENOBUFS;
+		}
+
+		/*updating C bt in  Link TRB before starting DMA*/
+		link_trb = priv_ep->trb_pool + (priv_ep->num_trbs - 1);
+		/*
+		 * For TRs size equal 2 enabling TRB_CHAIN for epXin causes
+		 * that DMA stuck at the LINK TRB.
+		 * On the other hand, removing TRB_CHAIN for longer TRs for
+		 * epXout cause that DMA stuck after handling LINK TRB.
+		 * To eliminate this strange behavioral driver set TRB_CHAIN
+		 * bit only for TR size > 2.
+		 */
+		if (priv_ep->type == USB_ENDPOINT_XFER_ISOC ||
+		    TRBS_PER_SEGMENT > 2)
+			ch_bit = TRB_CHAIN;
+
+		link_trb->control = ((priv_ep->pcs) ? TRB_CYCLE : 0) |
+				    TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit;
+	}
+
+	if (priv_dev->dev_ver <= DEV_VER_V2)
+		togle_pcs = cdns3_wa1_update_guard(priv_ep, trb);
+
+	/* set incorrect Cycle Bit for first trb*/
+	control = priv_ep->pcs ? 0 : TRB_CYCLE;
+
+	do {
+		u32 length;
+		u16 td_size = 0;
+
+		/* fill TRB */
+		control |= TRB_TYPE(TRB_NORMAL);
+		trb->buffer = TRB_BUFFER(request->num_sgs == 0
+				? trb_dma : request->sg[sg_iter].dma_address);
+
+		if (likely(!request->num_sgs))
+			length = request->length;
+		else
+			length = request->sg[sg_iter].length;
+
+		if (likely(priv_dev->dev_ver >= DEV_VER_V2))
+			td_size = DIV_ROUND_UP(length,
+					       priv_ep->endpoint.maxpacket);
+
+		trb->length = TRB_BURST_LEN(priv_ep->trb_burst_size) |
+					TRB_LEN(length);
+		if (priv_dev->gadget.speed == USB_SPEED_SUPER)
+			trb->length |= TRB_TDL_SS_SIZE(td_size);
+		else
+			control |= TRB_TDL_HS_SIZE(td_size);
+
+		pcs = priv_ep->pcs ? TRB_CYCLE : 0;
+
+		/*
+		 * first trb should be prepared as last to avoid processing
+		 *  transfer to early
+		 */
+		if (sg_iter != 0)
+			control |= pcs;
+
+		if (priv_ep->type == USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir) {
+			control |= TRB_IOC | TRB_ISP;
+		} else {
+			/* for last element in TD or in SG list */
+			if (sg_iter == (num_trb - 1) && sg_iter != 0)
+				control |= pcs | TRB_IOC | TRB_ISP;
+		}
+
+		if (sg_iter)
+			trb->control = control;
+		else
+			priv_req->trb->control = control;
+
+		control = 0;
+		++sg_iter;
+		priv_req->end_trb = priv_ep->enqueue;
+		cdns3_ep_inc_enq(priv_ep);
+		trb = priv_ep->trb_pool + priv_ep->enqueue;
+	} while (sg_iter < num_trb);
+
+	trb = priv_req->trb;
+
+	priv_req->flags |= REQUEST_PENDING;
+
+	if (sg_iter == 1)
+		trb->control |= TRB_IOC | TRB_ISP;
+	/*
+	 * Memory barrier - cycle bit must be set before other filds in trb.
+	 */
+	wmb();
+
+	/* give the TD to the consumer*/
+	if (togle_pcs)
+		trb->control =  trb->control ^ 1;
+
+	if (priv_dev->dev_ver <= DEV_VER_V2)
+		cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
+
+	trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
+
+	/*
+	 * Memory barrier - Cycle Bit must be set before trb->length  and
+	 * trb->buffer fields.
+	 */
+	wmb();
+
+	/*
+	 * For DMULT mode we can set address to transfer ring only once after
+	 * enabling endpoint.
+	 */
+	if (priv_ep->flags & EP_UPDATE_EP_TRBADDR) {
+		/*
+		 * Until SW is not ready to handle the OUT transfer the ISO OUT
+		 * Endpoint should be disabled (EP_CFG.ENABLE = 0).
+		 * EP_CFG_ENABLE must be set before updating ep_traddr.
+		 */
+		if (priv_ep->type == USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir &&
+		    !(priv_ep->flags & EP_QUIRK_ISO_OUT_EN)) {
+			priv_ep->flags |= EP_QUIRK_ISO_OUT_EN;
+			cdns3_set_register_bit(&priv_dev->regs->ep_cfg,
+					       EP_CFG_ENABLE);
+		}
+
+		writel(EP_TRADDR_TRADDR(priv_ep->trb_pool_dma +
+					priv_req->start_trb * TRB_SIZE),
+					&priv_dev->regs->ep_traddr);
+
+		priv_ep->flags &= ~EP_UPDATE_EP_TRBADDR;
+	}
+
+	if (!priv_ep->wa1_set && !(priv_ep->flags & EP_STALL)) {
+		trace_cdns3_ring(priv_ep);
+		/*clearing TRBERR and EP_STS_DESCMIS before seting DRDY*/
+		writel(EP_STS_TRBERR | EP_STS_DESCMIS, &priv_dev->regs->ep_sts);
+		writel(EP_CMD_DRDY, &priv_dev->regs->ep_cmd);
+		trace_cdns3_doorbell_epx(priv_ep->name,
+					 readl(&priv_dev->regs->ep_traddr));
+	}
+
+	/* WORKAROUND for transition to L0 */
+	__cdns3_gadget_wakeup(priv_dev);
+
+	return 0;
+}
+
+void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
+{
+	struct cdns3_endpoint *priv_ep;
+	struct usb_ep *ep;
+	int val;
+
+	if (priv_dev->hw_configured_flag)
+		return;
+
+	writel(USB_CONF_CFGSET, &priv_dev->regs->usb_conf);
+	writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
+
+	cdns3_set_register_bit(&priv_dev->regs->usb_conf,
+			       USB_CONF_U1EN | USB_CONF_U2EN);
+
+	/* wait until configuration set */
+	readl_poll_timeout_atomic(&priv_dev->regs->usb_sts, val,
+				  val & USB_STS_CFGSTS_MASK, 1, 100);
+
+	priv_dev->hw_configured_flag = 1;
+
+	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
+		if (ep->enabled) {
+			priv_ep = ep_to_cdns3_ep(ep);
+			cdns3_start_all_request(priv_dev, priv_ep);
+		}
+	}
+}
+
+/**
+ * cdns3_request_handled - check whether request has been handled by DMA
+ *
+ * @priv_ep: extended endpoint object.
+ * @priv_req: request object for checking
+ *
+ * Endpoint must be selected before invoking this function.
+ *
+ * Returns false if request has not been handled by DMA, else returns true.
+ *
+ * SR - start ring
+ * ER -  end ring
+ * DQ = priv_ep->dequeue - dequeue position
+ * EQ = priv_ep->enqueue -  enqueue position
+ * ST = priv_req->start_trb - index of first TRB in transfer ring
+ * ET = priv_req->end_trb - index of last TRB in transfer ring
+ * CI = current_index - index of processed TRB by DMA.
+ *
+ * As first step, function checks if cycle bit for priv_req->start_trb is
+ * correct.
+ *
+ * some rules:
+ * 1. priv_ep->dequeue never exceed current_index.
+ * 2  priv_ep->enqueue never exceed priv_ep->dequeue
+ * 3. exception: priv_ep->enqueue == priv_ep->dequeue
+ *    and priv_ep->free_trbs is zero.
+ *    This case indicate that TR is full.
+ *
+ * Then We can split recognition into two parts:
+ * Case 1 - priv_ep->dequeue < current_index
+ *      SR ... EQ ... DQ ... CI ... ER
+ *      SR ... DQ ... CI ... EQ ... ER
+ *
+ *      Request has been handled by DMA if ST and ET is between DQ and CI.
+ *
+ * Case 2 - priv_ep->dequeue > current_index
+ * This situation take place when CI go through the LINK TRB at the end of
+ * transfer ring.
+ *      SR ... CI ... EQ ... DQ ... ER
+ *
+ *      Request has been handled by DMA if ET is less then CI or
+ *      ET is greater or equal DQ.
+ */
+static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
+				  struct cdns3_request *priv_req)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct cdns3_trb *trb = priv_req->trb;
+	int current_index = 0;
+	int handled = 0;
+	int doorbell;
+
+	current_index = cdns3_get_dma_pos(priv_dev, priv_ep);
+	doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
+
+	trb = &priv_ep->trb_pool[priv_req->start_trb];
+
+	if ((trb->control  & TRB_CYCLE) != priv_ep->ccs)
+		goto finish;
+
+	if (doorbell == 1 && current_index == priv_ep->dequeue)
+		goto finish;
+
+	/* The corner case for TRBS_PER_SEGMENT equal 2). */
+	if (TRBS_PER_SEGMENT == 2 && priv_ep->type != USB_ENDPOINT_XFER_ISOC) {
+		handled = 1;
+		goto finish;
+	}
+
+	if (priv_ep->enqueue == priv_ep->dequeue &&
+	    priv_ep->free_trbs == 0) {
+		handled = 1;
+	} else if (priv_ep->dequeue < current_index) {
+		if ((current_index == (priv_ep->num_trbs - 1)) &&
+		    !priv_ep->dequeue)
+			goto finish;
+
+		if (priv_req->end_trb >= priv_ep->dequeue &&
+		    priv_req->end_trb < current_index)
+			handled = 1;
+	} else if (priv_ep->dequeue  > current_index) {
+		if (priv_req->end_trb  < current_index ||
+		    priv_req->end_trb >= priv_ep->dequeue)
+			handled = 1;
+	}
+
+finish:
+	trace_cdns3_request_handled(priv_req, current_index, handled);
+
+	return handled;
+}
+
+static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
+				     struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_request *priv_req;
+	struct usb_request *request;
+	struct cdns3_trb *trb;
+
+	while (!list_empty(&priv_ep->pending_req_list)) {
+		request = cdns3_next_request(&priv_ep->pending_req_list);
+		priv_req = to_cdns3_request(request);
+
+		/* Re-select endpoint. It could be changed by other CPU during
+		 * handling usb_gadget_giveback_request.
+		 */
+		cdns3_select_ep(priv_dev, priv_ep->endpoint.address);
+
+		if (!cdns3_request_handled(priv_ep, priv_req))
+			goto prepare_next_td;
+
+		trb = priv_ep->trb_pool + priv_ep->dequeue;
+		trace_cdns3_complete_trb(priv_ep, trb);
+
+		if (trb != priv_req->trb)
+			dev_warn(priv_dev->dev,
+				 "request_trb=0x%p, queue_trb=0x%p\n",
+				 priv_req->trb, trb);
+
+		request->actual = TRB_LEN(le32_to_cpu(trb->length));
+		cdns3_move_deq_to_next_trb(priv_req);
+		cdns3_gadget_giveback(priv_ep, priv_req, 0);
+
+		if (priv_ep->type != USB_ENDPOINT_XFER_ISOC &&
+		    TRBS_PER_SEGMENT == 2)
+			break;
+	}
+	priv_ep->flags &= ~EP_PENDING_REQUEST;
+
+prepare_next_td:
+	cdns3_start_all_request(priv_dev, priv_ep);
+}
+
+void cdns3_rearm_transfer(struct cdns3_endpoint *priv_ep, u8 rearm)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+
+	cdns3_wa1_restore_cycle_bit(priv_ep);
+
+	if (rearm) {
+		trace_cdns3_ring(priv_ep);
+
+		/* Cycle Bit must be updated before arming DMA. */
+		wmb();
+		writel(EP_CMD_DRDY, &priv_dev->regs->ep_cmd);
+
+		__cdns3_gadget_wakeup(priv_dev);
+
+		trace_cdns3_doorbell_epx(priv_ep->name,
+					 readl(&priv_dev->regs->ep_traddr));
+	}
+}
+
+/**
+ * cdns3_check_ep_interrupt_proceed - Processes interrupt related to endpoint
+ * @priv_ep: endpoint object
+ *
+ * Returns 0
+ */
+static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	u32 ep_sts_reg;
+
+	cdns3_select_ep(priv_dev, priv_ep->endpoint.address);
+
+	trace_cdns3_epx_irq(priv_dev, priv_ep);
+
+	ep_sts_reg = readl(&priv_dev->regs->ep_sts);
+	writel(ep_sts_reg, &priv_dev->regs->ep_sts);
+
+	if (ep_sts_reg & EP_STS_TRBERR) {
+		/*
+		 * For isochronous transfer driver completes request on
+		 * IOC or on TRBERR. IOC appears only when device receive
+		 * OUT data packet. If host disable stream or lost some packet
+		 * then the only way to finish all queued transfer is to do it
+		 * on TRBERR event.
+		 */
+		if (priv_ep->type == USB_ENDPOINT_XFER_ISOC &&
+		    !priv_ep->wa1_set) {
+			if (!priv_ep->dir) {
+				u32 ep_cfg = readl(&priv_dev->regs->ep_cfg);
+
+				ep_cfg &= ~EP_CFG_ENABLE;
+				writel(ep_cfg, &priv_dev->regs->ep_cfg);
+				priv_ep->flags &= ~EP_QUIRK_ISO_OUT_EN;
+			}
+			cdns3_transfer_completed(priv_dev, priv_ep);
+		} else {
+			if (priv_ep->flags & EP_DEFERRED_DRDY) {
+				priv_ep->flags &= ~EP_DEFERRED_DRDY;
+				cdns3_start_all_request(priv_dev, priv_ep);
+			} else {
+				cdns3_rearm_transfer(priv_ep, priv_ep->wa1_set);
+			}
+		}
+	}
+
+	if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP))
+		cdns3_transfer_completed(priv_dev, priv_ep);
+
+	return 0;
+}
+
+static void cdns3_disconnect_gadget(struct cdns3_device *priv_dev)
+{
+	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect) {
+		spin_unlock(&priv_dev->lock);
+		priv_dev->gadget_driver->disconnect(&priv_dev->gadget);
+		spin_lock(&priv_dev->lock);
+	}
+}
+
+/**
+ * cdns3_check_usb_interrupt_proceed - Processes interrupt related to device
+ * @priv_dev: extended gadget object
+ * @usb_ists: bitmap representation of device's reported interrupts
+ * (usb_ists register value)
+ */
+static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
+					      u32 usb_ists)
+{
+	int speed = 0;
+
+	trace_cdns3_usb_irq(priv_dev, usb_ists);
+	if (usb_ists & USB_ISTS_L1ENTI) {
+		/*
+		 * WORKAROUND: CDNS3 controller has issue with hardware resuming
+		 * from L1. To fix it, if any DMA transfer is pending driver
+		 * must starts driving resume signal immediately.
+		 */
+		if (readl(&priv_dev->regs->drbl))
+			__cdns3_gadget_wakeup(priv_dev);
+	}
+
+	/* Connection detected */
+	if (usb_ists & (USB_ISTS_CON2I | USB_ISTS_CONI)) {
+		speed = cdns3_get_speed(priv_dev);
+		priv_dev->gadget.speed = speed;
+		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_POWERED);
+		cdns3_ep0_config(priv_dev);
+	}
+
+	/* Disconnection detected */
+	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
+		cdns3_disconnect_gadget(priv_dev);
+		priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
+		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
+		cdns3_hw_reset_eps_config(priv_dev);
+	}
+
+	if (usb_ists & (USB_ISTS_L2ENTI | USB_ISTS_U3ENTI)) {
+		if (priv_dev->gadget_driver &&
+		    priv_dev->gadget_driver->suspend) {
+			spin_unlock(&priv_dev->lock);
+			priv_dev->gadget_driver->suspend(&priv_dev->gadget);
+			spin_lock(&priv_dev->lock);
+		}
+	}
+
+	if (usb_ists & (USB_ISTS_L2EXTI | USB_ISTS_U3EXTI)) {
+		if (priv_dev->gadget_driver &&
+		    priv_dev->gadget_driver->resume) {
+			spin_unlock(&priv_dev->lock);
+			priv_dev->gadget_driver->resume(&priv_dev->gadget);
+			spin_lock(&priv_dev->lock);
+		}
+	}
+
+	/* reset*/
+	if (usb_ists & (USB_ISTS_UWRESI | USB_ISTS_UHRESI | USB_ISTS_U2RESI)) {
+		if (priv_dev->gadget_driver) {
+			spin_unlock(&priv_dev->lock);
+			usb_gadget_udc_reset(&priv_dev->gadget,
+					     priv_dev->gadget_driver);
+			spin_lock(&priv_dev->lock);
+
+			/*read again to check the actual speed*/
+			speed = cdns3_get_speed(priv_dev);
+			priv_dev->gadget.speed = speed;
+			cdns3_hw_reset_eps_config(priv_dev);
+			cdns3_ep0_config(priv_dev);
+		}
+	}
+}
+
+/**
+ * cdns3_device_irq_handler- interrupt handler for device part of controller
+ *
+ * @irq: irq number for cdns3 core device
+ * @data: structure of cdns3
+ *
+ * Returns IRQ_HANDLED or IRQ_NONE
+ */
+static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
+{
+	struct cdns3_device *priv_dev;
+	struct cdns3 *cdns = data;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	u32 reg;
+
+	priv_dev = cdns->gadget_dev;
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	/* check USB device interrupt */
+	reg = readl(&priv_dev->regs->usb_ists);
+
+	if (reg) {
+		writel(reg, &priv_dev->regs->usb_ists);
+		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
+		ret = IRQ_HANDLED;
+	}
+
+	/* check endpoint interrupt */
+	reg = readl(&priv_dev->regs->ep_ists);
+
+	if (reg) {
+		priv_dev->shadow_ep_en |= reg;
+		reg = ~reg & readl(&priv_dev->regs->ep_ien);
+		/* mask deferred interrupt. */
+		writel(reg, &priv_dev->regs->ep_ien);
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return ret;
+}
+
+/**
+ * cdns3_device_thread_irq_handler- interrupt handler for device part
+ * of controller
+ *
+ * @irq: irq number for cdns3 core device
+ * @data: structure of cdns3
+ *
+ * Returns IRQ_HANDLED or IRQ_NONE
+ */
+static irqreturn_t cdns3_device_thread_irq_handler(int irq, void *data)
+{
+	struct cdns3_device *priv_dev;
+	struct cdns3 *cdns = data;
+	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+	u32 ep_ien;
+	int bit;
+	u32 reg;
+
+	priv_dev = cdns->gadget_dev;
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	reg = readl(&priv_dev->regs->ep_ists);
+
+	/* handle default endpoint OUT */
+	if (reg & EP_ISTS_EP_OUT0) {
+		cdns3_check_ep0_interrupt_proceed(priv_dev, USB_DIR_OUT);
+		ret = IRQ_HANDLED;
+	}
+
+	/* handle default endpoint IN */
+	if (reg & EP_ISTS_EP_IN0) {
+		cdns3_check_ep0_interrupt_proceed(priv_dev, USB_DIR_IN);
+		ret = IRQ_HANDLED;
+	}
+
+	/* check if interrupt from non default endpoint, if no exit */
+	reg &= ~(EP_ISTS_EP_OUT0 | EP_ISTS_EP_IN0);
+	if (!reg)
+		goto irqend;
+
+	for_each_set_bit(bit, (unsigned long *)&reg,
+			 sizeof(u32) * BITS_PER_BYTE) {
+		priv_dev->shadow_ep_en |= BIT(bit);
+		cdns3_check_ep_interrupt_proceed(priv_dev->eps[bit]);
+		ret = IRQ_HANDLED;
+	}
+
+	if (priv_dev->run_garbage_collector) {
+		struct cdns3_aligned_buf *buf, *tmp;
+
+		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_list,
+					 list) {
+			if (!buf->in_use) {
+				list_del(&buf->list);
+
+				spin_unlock_irqrestore(&priv_dev->lock, flags);
+				dma_free_coherent(priv_dev->sysdev, buf->size,
+						  buf->buf,
+						  buf->dma);
+				spin_lock_irqsave(&priv_dev->lock, flags);
+
+				kfree(buf);
+			}
+		}
+
+		priv_dev->run_garbage_collector = 0;
+	}
+
+irqend:
+	ep_ien = readl(&priv_dev->regs->ep_ien) | priv_dev->shadow_ep_en;
+	priv_dev->shadow_ep_en = 0;
+	/* Unmask all handled EP interrupts */
+	writel(ep_ien, &priv_dev->regs->ep_ien);
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return ret;
+}
+
+/**
+ * cdns3_ep_onchip_buffer_reserve - Try to reserve onchip buf for EP
+ *
+ * The real reservation will occur during write to EP_CFG register,
+ * this function is used to check if the 'size' reservation is allowed.
+ *
+ * @priv_dev: extended gadget object
+ * @size: the size (KB) for EP would like to allocate
+ * @is_in: endpoint direction
+ *
+ * Return 0 if the required size can met or negative value on failure
+ */
+static int cdns3_ep_onchip_buffer_reserve(struct cdns3_device *priv_dev,
+					  int size, int is_in)
+{
+	int remained;
+
+	/* 2KB are reserved for EP0*/
+	remained = priv_dev->onchip_buffers - priv_dev->onchip_used_size - 2;
+
+	if (is_in) {
+		if (remained < size)
+			return -EPERM;
+
+		priv_dev->onchip_used_size += size;
+	} else {
+		int required;
+
+		/**
+		 *  ALL OUT EPs are shared the same chunk onchip memory, so
+		 * driver checks if it already has assigned enough buffers
+		 */
+		if (priv_dev->out_mem_is_allocated >= size)
+			return 0;
+
+		required = size - priv_dev->out_mem_is_allocated;
+
+		if (required > remained)
+			return -EPERM;
+
+		priv_dev->out_mem_is_allocated += required;
+		priv_dev->onchip_used_size += required;
+	}
+
+	return 0;
+}
+
+void cdns3_configure_dmult(struct cdns3_device *priv_dev,
+			   struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
+
+	/* For dev_ver > DEV_VER_V2 DMULT is configured per endpoint */
+	if (priv_dev->dev_ver <= DEV_VER_V2)
+		writel(USB_CONF_DMULT, &regs->usb_conf);
+
+	if (priv_dev->dev_ver == DEV_VER_V2)
+		writel(USB_CONF2_EN_TDL_TRB, &regs->usb_conf2);
+
+	if (priv_dev->dev_ver >= DEV_VER_V3 && priv_ep) {
+		u32 mask;
+
+		if (priv_ep->dir)
+			mask = BIT(priv_ep->num + 16);
+		else
+			mask = BIT(priv_ep->num);
+
+		if (priv_ep->type != USB_ENDPOINT_XFER_ISOC) {
+			cdns3_set_register_bit(&regs->tdl_from_trb, mask);
+			cdns3_set_register_bit(&regs->tdl_beh, mask);
+			cdns3_set_register_bit(&regs->tdl_beh2, mask);
+			cdns3_set_register_bit(&regs->dma_adv_td, mask);
+		}
+
+		if (priv_ep->type == USB_ENDPOINT_XFER_ISOC && !priv_ep->dir)
+			cdns3_set_register_bit(&regs->tdl_from_trb, mask);
+
+		cdns3_set_register_bit(&regs->dtrans, mask);
+	}
+}
+
+/**
+ * cdns3_ep_config Configure hardware endpoint
+ * @priv_ep: extended endpoint object
+ */
+void cdns3_ep_config(struct cdns3_endpoint *priv_ep)
+{
+	bool is_iso_ep = (priv_ep->type == USB_ENDPOINT_XFER_ISOC);
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	u32 bEndpointAddress = priv_ep->num | priv_ep->dir;
+	u32 max_packet_size = 0;
+	u8 maxburst = 0;
+	u32 ep_cfg = 0;
+	u8 buffering;
+	u8 mult = 0;
+	int ret;
+
+	buffering = CDNS3_EP_BUF_SIZE - 1;
+
+	cdns3_configure_dmult(priv_dev, priv_ep);
+
+	switch (priv_ep->type) {
+	case USB_ENDPOINT_XFER_INT:
+		ep_cfg = EP_CFG_EPTYPE(USB_ENDPOINT_XFER_INT);
+
+		if ((priv_dev->dev_ver == DEV_VER_V2 && !priv_ep->dir) ||
+		    priv_dev->dev_ver > DEV_VER_V2)
+			ep_cfg |= EP_CFG_TDL_CHK;
+		break;
+	case USB_ENDPOINT_XFER_BULK:
+		ep_cfg = EP_CFG_EPTYPE(USB_ENDPOINT_XFER_BULK);
+
+		if ((priv_dev->dev_ver == DEV_VER_V2  && !priv_ep->dir) ||
+		    priv_dev->dev_ver > DEV_VER_V2)
+			ep_cfg |= EP_CFG_TDL_CHK;
+		break;
+	default:
+		ep_cfg = EP_CFG_EPTYPE(USB_ENDPOINT_XFER_ISOC);
+		mult = CDNS3_EP_ISO_HS_MULT - 1;
+		buffering = mult + 1;
+	}
+
+	switch (priv_dev->gadget.speed) {
+	case USB_SPEED_FULL:
+		max_packet_size = is_iso_ep ? 1023 : 64;
+		break;
+	case USB_SPEED_HIGH:
+		max_packet_size = is_iso_ep ? 1024 : 512;
+		break;
+	case USB_SPEED_SUPER:
+		/* It's limitation that driver assumes in driver. */
+		mult = 0;
+		max_packet_size = 1024;
+		if (priv_ep->type == USB_ENDPOINT_XFER_ISOC) {
+			maxburst = CDNS3_EP_ISO_SS_BURST - 1;
+			buffering = (mult + 1) *
+				    (maxburst + 1);
+
+			if (priv_ep->interval > 1)
+				buffering++;
+		} else {
+			maxburst = CDNS3_EP_BUF_SIZE - 1;
+		}
+		break;
+	default:
+		/* all other speed are not supported */
+		return;
+	}
+
+	if (max_packet_size == 1024)
+		priv_ep->trb_burst_size = 128;
+	else if (max_packet_size >= 512)
+		priv_ep->trb_burst_size = 64;
+	else
+		priv_ep->trb_burst_size = 16;
+
+	ret = cdns3_ep_onchip_buffer_reserve(priv_dev, buffering + 1,
+					     !!priv_ep->dir);
+	if (ret) {
+		dev_err(priv_dev->dev, "onchip mem is full, ep is invalid\n");
+		return;
+	}
+
+	ep_cfg |= EP_CFG_MAXPKTSIZE(max_packet_size) |
+		  EP_CFG_MULT(mult) |
+		  EP_CFG_BUFFERING(buffering) |
+		  EP_CFG_MAXBURST(maxburst);
+
+	cdns3_select_ep(priv_dev, bEndpointAddress);
+	writel(ep_cfg, &priv_dev->regs->ep_cfg);
+
+	dev_dbg(priv_dev->dev, "Configure %s: with val %08x\n",
+		priv_ep->name, ep_cfg);
+}
+
+/* Find correct direction for HW endpoint according to description */
+static int cdns3_ep_dir_is_correct(struct usb_endpoint_descriptor *desc,
+				   struct cdns3_endpoint *priv_ep)
+{
+	return (priv_ep->endpoint.caps.dir_in && usb_endpoint_dir_in(desc)) ||
+	       (priv_ep->endpoint.caps.dir_out && usb_endpoint_dir_out(desc));
+}
+
+static struct
+cdns3_endpoint *cdns3_find_available_ep(struct cdns3_device *priv_dev,
+					struct usb_endpoint_descriptor *desc)
+{
+	struct usb_ep *ep;
+	struct cdns3_endpoint *priv_ep;
+
+	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
+		unsigned long num;
+		int ret;
+		/* ep name pattern likes epXin or epXout */
+		char c[2] = {ep->name[2], '\0'};
+
+		ret = kstrtoul(c, 10, &num);
+		if (ret)
+			return ERR_PTR(ret);
+
+		priv_ep = ep_to_cdns3_ep(ep);
+		if (cdns3_ep_dir_is_correct(desc, priv_ep)) {
+			if (!(priv_ep->flags & EP_CLAIMED)) {
+				priv_ep->num  = num;
+				return priv_ep;
+			}
+		}
+	}
+
+	return ERR_PTR(-ENOENT);
+}
+
+/*
+ *  Cadence IP has one limitation that all endpoints must be configured
+ * (Type & MaxPacketSize) before setting configuration through hardware
+ * register, it means we can't change endpoints configuration after
+ * set_configuration.
+ *
+ * This function set EP_CLAIMED flag which is added when the gadget driver
+ * uses usb_ep_autoconfig to configure specific endpoint;
+ * When the udc driver receives set_configurion request,
+ * it goes through all claimed endpoints, and configure all endpoints
+ * accordingly.
+ *
+ * At usb_ep_ops.enable/disable, we only enable and disable endpoint through
+ * ep_cfg register which can be changed after set_configuration, and do
+ * some software operation accordingly.
+ */
+static struct
+usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
+			      struct usb_endpoint_descriptor *desc,
+			      struct usb_ss_ep_comp_descriptor *comp_desc)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+	struct cdns3_endpoint *priv_ep;
+	unsigned long flags;
+
+	priv_ep = cdns3_find_available_ep(priv_dev, desc);
+	if (IS_ERR(priv_ep)) {
+		dev_err(priv_dev->dev, "no available ep\n");
+		return NULL;
+	}
+
+	dev_dbg(priv_dev->dev, "match endpoint: %s\n", priv_ep->name);
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+	priv_ep->endpoint.desc = desc;
+	priv_ep->dir  = usb_endpoint_dir_in(desc) ? USB_DIR_IN : USB_DIR_OUT;
+	priv_ep->type = usb_endpoint_type(desc);
+	priv_ep->flags |= EP_CLAIMED;
+	priv_ep->interval = desc->bInterval ? BIT(desc->bInterval - 1) : 0;
+
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return &priv_ep->endpoint;
+}
+
+/**
+ * cdns3_gadget_ep_alloc_request Allocates request
+ * @ep: endpoint object associated with request
+ * @gfp_flags: gfp flags
+ *
+ * Returns allocated request address, NULL on allocation error
+ */
+struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
+						  gfp_t gfp_flags)
+{
+	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
+	struct cdns3_request *priv_req;
+
+	priv_req = kzalloc(sizeof(*priv_req), gfp_flags);
+	if (!priv_req)
+		return NULL;
+
+	priv_req->priv_ep = priv_ep;
+
+	trace_cdns3_alloc_request(priv_req);
+	return &priv_req->request;
+}
+
+/**
+ * cdns3_gadget_ep_free_request Free memory occupied by request
+ * @ep: endpoint object associated with request
+ * @request: request to free memory
+ */
+void cdns3_gadget_ep_free_request(struct usb_ep *ep,
+				  struct usb_request *request)
+{
+	struct cdns3_request *priv_req = to_cdns3_request(request);
+
+	if (priv_req->aligned_buf)
+		priv_req->aligned_buf->in_use = 0;
+
+	trace_cdns3_free_request(priv_req);
+	kfree(priv_req);
+}
+
+/**
+ * cdns3_gadget_ep_enable Enable endpoint
+ * @ep: endpoint object
+ * @desc: endpoint descriptor
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+static int cdns3_gadget_ep_enable(struct usb_ep *ep,
+				  const struct usb_endpoint_descriptor *desc)
+{
+	struct cdns3_endpoint *priv_ep;
+	struct cdns3_device *priv_dev;
+	u32 reg = EP_STS_EN_TRBERREN;
+	u32 bEndpointAddress;
+	unsigned long flags;
+	int enable = 1;
+	int ret;
+	int val;
+
+	priv_ep = ep_to_cdns3_ep(ep);
+	priv_dev = priv_ep->cdns3_dev;
+
+	if (!ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT) {
+		dev_dbg(priv_dev->dev, "usbss: invalid parameters\n");
+		return -EINVAL;
+	}
+
+	if (!desc->wMaxPacketSize) {
+		dev_err(priv_dev->dev, "usbss: missing wMaxPacketSize\n");
+		return -EINVAL;
+	}
+
+	if (dev_WARN_ONCE(priv_dev->dev, priv_ep->flags & EP_ENABLED,
+			  "%s is already enabled\n", priv_ep->name))
+		return 0;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	priv_ep->endpoint.desc = desc;
+	priv_ep->type = usb_endpoint_type(desc);
+	priv_ep->interval = desc->bInterval ? BIT(desc->bInterval - 1) : 0;
+
+	if (priv_ep->interval > ISO_MAX_INTERVAL &&
+	    priv_ep->type == USB_ENDPOINT_XFER_ISOC) {
+		dev_err(priv_dev->dev, "Driver is limited to %d period\n",
+			ISO_MAX_INTERVAL);
+
+		ret =  -EINVAL;
+		goto exit;
+	}
+
+	ret = cdns3_allocate_trb_pool(priv_ep);
+
+	if (ret)
+		goto exit;
+
+	bEndpointAddress = priv_ep->num | priv_ep->dir;
+	cdns3_select_ep(priv_dev, bEndpointAddress);
+
+	trace_cdns3_gadget_ep_enable(priv_ep);
+
+	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
+
+	ret = readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+					!(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
+					1, 1000);
+
+	if (unlikely(ret)) {
+		cdns3_free_trb_pool(priv_ep);
+		ret =  -EINVAL;
+		goto exit;
+	}
+
+	/* enable interrupt for selected endpoint */
+	cdns3_set_register_bit(&priv_dev->regs->ep_ien,
+			       BIT(cdns3_ep_addr_to_index(bEndpointAddress)));
+
+	writel(reg, &priv_dev->regs->ep_sts_en);
+
+	/*
+	 * For some versions of controller at some point during ISO OUT traffic
+	 * DMA reads Transfer Ring for the EP which has never got doorbell.
+	 * This issue was detected only on simulation, but to avoid this issue
+	 * driver add protection against it. To fix it driver enable ISO OUT
+	 * endpoint before setting DRBL. This special treatment of ISO OUT
+	 * endpoints are recommended by controller specification.
+	 */
+	if (priv_ep->type == USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir)
+		enable = 0;
+
+	if (enable)
+		cdns3_set_register_bit(&priv_dev->regs->ep_cfg, EP_CFG_ENABLE);
+
+	ep->desc = desc;
+	priv_ep->flags &= ~(EP_PENDING_REQUEST | EP_STALL |
+			    EP_QUIRK_ISO_OUT_EN);
+	priv_ep->flags |= EP_ENABLED | EP_UPDATE_EP_TRBADDR;
+	priv_ep->wa1_set = 0;
+	priv_ep->enqueue = 0;
+	priv_ep->dequeue = 0;
+	reg = readl(&priv_dev->regs->ep_sts);
+	priv_ep->pcs = !!EP_STS_CCS(reg);
+	priv_ep->ccs = !!EP_STS_CCS(reg);
+	/* one TRB is reserved for link TRB used in DMULT mode*/
+	priv_ep->free_trbs = priv_ep->num_trbs - 1;
+exit:
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+
+	return ret;
+}
+
+/**
+ * cdns3_gadget_ep_disable Disable endpoint
+ * @ep: endpoint object
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+static int cdns3_gadget_ep_disable(struct usb_ep *ep)
+{
+	struct cdns3_endpoint *priv_ep;
+	struct cdns3_device *priv_dev;
+	struct usb_request *request;
+	unsigned long flags;
+	int ret = 0;
+	u32 ep_cfg;
+	int val;
+
+	if (!ep) {
+		pr_err("usbss: invalid parameters\n");
+		return -EINVAL;
+	}
+
+	priv_ep = ep_to_cdns3_ep(ep);
+	priv_dev = priv_ep->cdns3_dev;
+
+	if (dev_WARN_ONCE(priv_dev->dev, !(priv_ep->flags & EP_ENABLED),
+			  "%s is already disabled\n", priv_ep->name))
+		return 0;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	trace_cdns3_gadget_ep_disable(priv_ep);
+
+	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
+
+	ep_cfg = readl(&priv_dev->regs->ep_cfg);
+	ep_cfg &= ~EP_CFG_ENABLE;
+	writel(ep_cfg, &priv_dev->regs->ep_cfg);
+
+	/**
+	 * Driver needs some time before resetting endpoint.
+	 * It need waits for clearing DBUSY bit or for timeout expired.
+	 * 10us is enough time for controller to stop transfer.
+	 */
+	readl_poll_timeout_atomic(&priv_dev->regs->ep_sts, val,
+				  !(val & EP_STS_DBUSY), 1, 10);
+	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
+
+	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+				  !(val & (EP_CMD_CSTALL | EP_CMD_EPRST)),
+				  1, 1000);
+	if (unlikely(ret))
+		dev_err(priv_dev->dev, "Timeout: %s resetting failed.\n",
+			priv_ep->name);
+
+	while (!list_empty(&priv_ep->pending_req_list)) {
+		request = cdns3_next_request(&priv_ep->pending_req_list);
+
+		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
+				      -ESHUTDOWN);
+	}
+
+	while (!list_empty(&priv_ep->deferred_req_list)) {
+		request = cdns3_next_request(&priv_ep->deferred_req_list);
+
+		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
+				      -ESHUTDOWN);
+	}
+
+	ep->desc = NULL;
+	priv_ep->flags &= ~EP_ENABLED;
+
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+
+	return ret;
+}
+
+/**
+ * cdns3_gadget_ep_queue Transfer data on endpoint
+ * @ep: endpoint object
+ * @request: request object
+ * @gfp_flags: gfp flags
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
+				   struct usb_request *request,
+				   gfp_t gfp_flags)
+{
+	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct cdns3_request *priv_req;
+	int ret = 0;
+
+	request->actual = 0;
+	request->status = -EINPROGRESS;
+	priv_req = to_cdns3_request(request);
+	trace_cdns3_ep_queue(priv_req);
+
+	ret = cdns3_prepare_aligned_request_buf(priv_req);
+	if (ret < 0)
+		return ret;
+
+	ret = usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
+					    usb_endpoint_dir_in(ep->desc));
+	if (ret)
+		return ret;
+
+	list_add_tail(&request->list, &priv_ep->deferred_req_list);
+
+	/*
+	 * If hardware endpoint configuration has not been set yet then
+	 * just queue request in deferred list. Transfer will be started in
+	 * cdns3_set_hw_configuration.
+	 */
+	if (priv_dev->hw_configured_flag)
+		cdns3_start_all_request(priv_dev, priv_ep);
+
+	return 0;
+}
+
+static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
+				 gfp_t gfp_flags)
+{
+	struct usb_request *zlp_request;
+	struct cdns3_endpoint *priv_ep;
+	struct cdns3_device *priv_dev;
+	unsigned long flags;
+	int ret;
+
+	if (!request || !ep)
+		return -EINVAL;
+
+	priv_ep = ep_to_cdns3_ep(ep);
+	priv_dev = priv_ep->cdns3_dev;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	ret = __cdns3_gadget_ep_queue(ep, request, gfp_flags);
+
+	if (ret == 0 && request->zero && request->length &&
+	    (request->length % ep->maxpacket == 0)) {
+		struct cdns3_request *priv_req;
+
+		zlp_request = cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		zlp_request->buf = priv_dev->zlp_buf;
+		zlp_request->length = 0;
+
+		priv_req = to_cdns3_request(zlp_request);
+		priv_req->flags |= REQUEST_ZLP;
+
+		dev_dbg(priv_dev->dev, "Queuing ZLP for endpoint: %s\n",
+			priv_ep->name);
+		ret = __cdns3_gadget_ep_queue(ep, zlp_request, gfp_flags);
+	}
+
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return ret;
+}
+
+/**
+ * cdns3_gadget_ep_dequeue Remove request from transfer queue
+ * @ep: endpoint object associated with request
+ * @request: request object
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
+			    struct usb_request *request)
+{
+	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct usb_request *req, *req_temp;
+	struct cdns3_request *priv_req;
+	struct cdns3_trb *link_trb;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep || !request || !ep->desc)
+		return -EINVAL;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	priv_req = to_cdns3_request(request);
+
+	trace_cdns3_ep_dequeue(priv_req);
+
+	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
+
+	list_for_each_entry_safe(req, req_temp, &priv_ep->pending_req_list,
+				 list) {
+		if (request == req)
+			goto found;
+	}
+
+	list_for_each_entry_safe(req, req_temp, &priv_ep->deferred_req_list,
+				 list) {
+		if (request == req)
+			goto found;
+	}
+
+	goto not_found;
+
+found:
+
+	if (priv_ep->wa1_trb == priv_req->trb)
+		cdns3_wa1_restore_cycle_bit(priv_ep);
+
+	link_trb = priv_req->trb;
+	cdns3_move_deq_to_next_trb(priv_req);
+	cdns3_gadget_giveback(priv_ep, priv_req, -ECONNRESET);
+
+	/* Update ring */
+	request = cdns3_next_request(&priv_ep->deferred_req_list);
+	if (request) {
+		priv_req = to_cdns3_request(request);
+
+		link_trb->buffer = TRB_BUFFER(priv_ep->trb_pool_dma +
+					      (priv_req->start_trb * TRB_SIZE));
+		link_trb->control = (link_trb->control & TRB_CYCLE) |
+				    TRB_TYPE(TRB_LINK) | TRB_CHAIN | TRB_TOGGLE;
+	} else {
+		priv_ep->flags |= EP_UPDATE_EP_TRBADDR;
+	}
+
+not_found:
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return ret;
+}
+
+/**
+ * cdns3_gadget_ep_set_halt Sets/clears stall on selected endpoint
+ * @ep: endpoint object to set/clear stall on
+ * @value: 1 for set stall, 0 for clear stall
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value)
+{
+	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	unsigned long flags;
+	int ret = 0;
+	int val;
+
+	if (!(priv_ep->flags & EP_ENABLED))
+		return -EPERM;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+
+	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
+	if (value) {
+		cdns3_ep_stall_flush(priv_ep);
+	} else {
+		priv_ep->flags &= ~EP_WEDGE;
+
+		trace_cdns3_halt(priv_ep, value, 0);
+
+		writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
+
+		/* wait for EPRST cleared */
+		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+					  !(val & EP_CMD_EPRST), 1, 100);
+		if (unlikely(ret)) {
+			dev_err(priv_dev->dev,
+				"Clearing halt condition failed for %s\n",
+				priv_ep->name);
+			goto finish;
+		} else {
+			priv_ep->flags &= ~EP_STALL;
+		}
+	}
+
+	priv_ep->flags &= ~EP_PENDING_REQUEST;
+finish:
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+
+	return ret;
+}
+
+extern const struct usb_ep_ops cdns3_gadget_ep0_ops;
+
+static const struct usb_ep_ops cdns3_gadget_ep_ops = {
+	.enable = cdns3_gadget_ep_enable,
+	.disable = cdns3_gadget_ep_disable,
+	.alloc_request = cdns3_gadget_ep_alloc_request,
+	.free_request = cdns3_gadget_ep_free_request,
+	.queue = cdns3_gadget_ep_queue,
+	.dequeue = cdns3_gadget_ep_dequeue,
+	.set_halt = cdns3_gadget_ep_set_halt,
+	.set_wedge = cdns3_gadget_ep_set_wedge,
+};
+
+/**
+ * cdns3_gadget_get_frame Returns number of actual ITP frame
+ * @gadget: gadget object
+ *
+ * Returns number of actual ITP frame
+ */
+static int cdns3_gadget_get_frame(struct usb_gadget *gadget)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+
+	return readl(&priv_dev->regs->usb_itpn);
+}
+
+int __cdns3_gadget_wakeup(struct cdns3_device *priv_dev)
+{
+	enum usb_device_speed speed;
+
+	speed = cdns3_get_speed(priv_dev);
+
+	if (speed >= USB_SPEED_SUPER)
+		return 0;
+
+	/* Start driving resume signaling to indicate remote wakeup. */
+	writel(USB_CONF_LGO_L0, &priv_dev->regs->usb_conf);
+
+	return 0;
+}
+
+static int cdns3_gadget_wakeup(struct usb_gadget *gadget)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+	ret = __cdns3_gadget_wakeup(priv_dev);
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return ret;
+}
+
+static int cdns3_gadget_set_selfpowered(struct usb_gadget *gadget,
+					int is_selfpowered)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+	priv_dev->is_selfpowered = !!is_selfpowered;
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return 0;
+}
+
+static int cdns3_gadget_pullup(struct usb_gadget *gadget, int is_on)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+
+	if (is_on)
+		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
+	else
+		writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
+
+	return 0;
+}
+
+static void cdns3_gadget_config(struct cdns3_device *priv_dev)
+{
+	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
+	u32 reg;
+
+	cdns3_ep0_config(priv_dev);
+
+	/* enable interrupts for endpoint 0 (in and out) */
+	writel(EP_IEN_EP_OUT0 | EP_IEN_EP_IN0, &regs->ep_ien);
+
+	/*
+	 * Driver needs to modify LFPS minimal U1 Exit time for DEV_VER_TI_V1
+	 * revision of controller.
+	 */
+	if (priv_dev->dev_ver == DEV_VER_TI_V1) {
+		reg = readl(&regs->dbg_link1);
+
+		reg &= ~DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_MASK;
+		reg |= DBG_LINK1_LFPS_MIN_GEN_U1_EXIT(0x55) |
+		       DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_SET;
+		writel(reg, &regs->dbg_link1);
+	}
+
+	/*
+	 * By default some platforms has set protected access to memory.
+	 * This cause problem with cache, so driver restore non-secure
+	 * access to memory.
+	 */
+	reg = readl(&regs->dma_axi_ctrl);
+	reg = DMA_AXI_CTRL_MARPROT(DMA_AXI_CTRL_NON_SECURE) |
+	      DMA_AXI_CTRL_MAWPROT(DMA_AXI_CTRL_NON_SECURE);
+	writel(reg, &regs->dma_axi_ctrl);
+
+	/* enable generic interrupt*/
+	writel(USB_IEN_INIT, &regs->usb_ien);
+	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
+
+	cdns3_configure_dmult(priv_dev, NULL);
+
+	cdns3_gadget_pullup(&priv_dev->gadget, 1);
+}
+
+/**
+ * cdns3_gadget_udc_start Gadget start
+ * @gadget: gadget object
+ * @driver: driver which operates on this gadget
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
+				  struct usb_gadget_driver *driver)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv_dev->lock, flags);
+	priv_dev->gadget_driver = driver;
+	cdns3_gadget_config(priv_dev);
+	spin_unlock_irqrestore(&priv_dev->lock, flags);
+	return 0;
+}
+
+/**
+ * cdns3_gadget_udc_stop Stops gadget
+ * @gadget: gadget object
+ *
+ * Returns 0
+ */
+static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
+{
+	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
+	struct cdns3_endpoint *priv_ep;
+	u32 bEndpointAddress;
+	struct usb_ep *ep;
+	int ret = 0;
+	int val;
+
+	priv_dev->gadget_driver = NULL;
+
+	priv_dev->onchip_used_size = 0;
+	priv_dev->out_mem_is_allocated = 0;
+	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
+
+	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
+		priv_ep = ep_to_cdns3_ep(ep);
+		bEndpointAddress = priv_ep->num | priv_ep->dir;
+		cdns3_select_ep(priv_dev, bEndpointAddress);
+		writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
+		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
+					  !(val & EP_CMD_EPRST), 1, 100);
+	}
+
+	/* disable interrupt for device */
+	writel(0, &priv_dev->regs->usb_ien);
+	writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
+
+	return ret;
+}
+
+static const struct usb_gadget_ops cdns3_gadget_ops = {
+	.get_frame = cdns3_gadget_get_frame,
+	.wakeup = cdns3_gadget_wakeup,
+	.set_selfpowered = cdns3_gadget_set_selfpowered,
+	.pullup = cdns3_gadget_pullup,
+	.udc_start = cdns3_gadget_udc_start,
+	.udc_stop = cdns3_gadget_udc_stop,
+	.match_ep = cdns3_gadget_match_ep,
+};
+
+static void cdns3_free_all_eps(struct cdns3_device *priv_dev)
+{
+	int i;
+
+	/* ep0 OUT point to ep0 IN. */
+	priv_dev->eps[16] = NULL;
+
+	for (i = 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++)
+		if (priv_dev->eps[i]) {
+			cdns3_free_trb_pool(priv_dev->eps[i]);
+			devm_kfree(priv_dev->dev, priv_dev->eps[i]);
+		}
+}
+
+/**
+ * cdns3_init_eps Initializes software endpoints of gadget
+ * @cdns3: extended gadget object
+ *
+ * Returns 0 on success, error code elsewhere
+ */
+static int cdns3_init_eps(struct cdns3_device *priv_dev)
+{
+	u32 ep_enabled_reg, iso_ep_reg;
+	struct cdns3_endpoint *priv_ep;
+	int ep_dir, ep_number;
+	u32 ep_mask;
+	int ret = 0;
+	int i;
+
+	/* Read it from USB_CAP3 to USB_CAP5 */
+	ep_enabled_reg = readl(&priv_dev->regs->usb_cap3);
+	iso_ep_reg = readl(&priv_dev->regs->usb_cap4);
+
+	dev_dbg(priv_dev->dev, "Initializing non-zero endpoints\n");
+
+	for (i = 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++) {
+		ep_dir = i >> 4;	/* i div 16 */
+		ep_number = i & 0xF;	/* i % 16 */
+		ep_mask = BIT(i);
+
+		if (!(ep_enabled_reg & ep_mask))
+			continue;
+
+		if (ep_dir && !ep_number) {
+			priv_dev->eps[i] = priv_dev->eps[0];
+			continue;
+		}
+
+		priv_ep = devm_kzalloc(priv_dev->dev, sizeof(*priv_ep),
+				       GFP_KERNEL);
+		if (!priv_ep) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		/* set parent of endpoint object */
+		priv_ep->cdns3_dev = priv_dev;
+		priv_dev->eps[i] = priv_ep;
+		priv_ep->num = ep_number;
+		priv_ep->dir = ep_dir ? USB_DIR_IN : USB_DIR_OUT;
+
+		if (!ep_number) {
+			ret = cdns3_init_ep0(priv_dev, priv_ep);
+			if (ret) {
+				dev_err(priv_dev->dev, "Failed to init ep0\n");
+				goto err;
+			}
+		} else {
+			snprintf(priv_ep->name, sizeof(priv_ep->name), "ep%d%s",
+				 ep_number, !!ep_dir ? "in" : "out");
+			priv_ep->endpoint.name = priv_ep->name;
+
+			usb_ep_set_maxpacket_limit(&priv_ep->endpoint,
+						   CDNS3_EP_MAX_PACKET_LIMIT);
+			priv_ep->endpoint.max_streams = CDNS3_EP_MAX_STREAMS;
+			priv_ep->endpoint.ops = &cdns3_gadget_ep_ops;
+			if (ep_dir)
+				priv_ep->endpoint.caps.dir_in = 1;
+			else
+				priv_ep->endpoint.caps.dir_out = 1;
+
+			if (iso_ep_reg & ep_mask)
+				priv_ep->endpoint.caps.type_iso = 1;
+
+			priv_ep->endpoint.caps.type_bulk = 1;
+			priv_ep->endpoint.caps.type_int = 1;
+
+			list_add_tail(&priv_ep->endpoint.ep_list,
+				      &priv_dev->gadget.ep_list);
+		}
+
+		priv_ep->flags = 0;
+
+		dev_info(priv_dev->dev, "Initialized  %s support: %s %s\n",
+			 priv_ep->name,
+			 priv_ep->endpoint.caps.type_bulk ? "BULK, INT" : "",
+			 priv_ep->endpoint.caps.type_iso ? "ISO" : "");
+
+		INIT_LIST_HEAD(&priv_ep->pending_req_list);
+		INIT_LIST_HEAD(&priv_ep->deferred_req_list);
+	}
+
+	return 0;
+err:
+	cdns3_free_all_eps(priv_dev);
+	return -ENOMEM;
+}
+
+void cdns3_gadget_exit(struct cdns3 *cdns)
+{
+	struct cdns3_device *priv_dev;
+
+	priv_dev = cdns->gadget_dev;
+
+	devm_free_irq(cdns->dev, cdns->dev_irq, cdns);
+
+	pm_runtime_mark_last_busy(cdns->dev);
+	pm_runtime_put_autosuspend(cdns->dev);
+
+	usb_del_gadget_udc(&priv_dev->gadget);
+
+	cdns3_free_all_eps(priv_dev);
+
+	while (!list_empty(&priv_dev->aligned_buf_list)) {
+		struct cdns3_aligned_buf *buf;
+
+		buf = cdns3_next_align_buf(&priv_dev->aligned_buf_list);
+		dma_free_coherent(priv_dev->sysdev, buf->size,
+				  buf->buf,
+				  buf->dma);
+
+		list_del(&buf->list);
+		kfree(buf);
+	}
+
+	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
+			  priv_dev->setup_dma);
+
+	kfree(priv_dev->zlp_buf);
+	kfree(priv_dev);
+	cdns->gadget_dev = NULL;
+}
+
+static int cdns3_gadget_start(struct cdns3 *cdns)
+{
+	struct cdns3_device *priv_dev;
+	u32 max_speed;
+	int ret;
+
+	priv_dev = kzalloc(sizeof(*priv_dev), GFP_KERNEL);
+	if (!priv_dev)
+		return -ENOMEM;
+
+	cdns->gadget_dev = priv_dev;
+	priv_dev->sysdev = cdns->dev;
+	priv_dev->dev = cdns->dev;
+	priv_dev->regs = cdns->dev_regs;
+
+	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
+				 &priv_dev->onchip_buffers);
+
+	if (priv_dev->onchip_buffers <=  0) {
+		u32 reg = readl(&priv_dev->regs->usb_cap2);
+
+		priv_dev->onchip_buffers = USB_CAP2_ACTUAL_MEM_SIZE(reg);
+	}
+
+	if (!priv_dev->onchip_buffers)
+		priv_dev->onchip_buffers = 256;
+
+	max_speed = usb_get_maximum_speed(cdns->dev);
+
+	/* Check the maximum_speed parameter */
+	switch (max_speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		break;
+	default:
+		dev_err(cdns->dev, "invalid maximum_speed parameter %d\n",
+			max_speed);
+		/* fall through */
+	case USB_SPEED_UNKNOWN:
+		/* default to superspeed */
+		max_speed = USB_SPEED_SUPER;
+		break;
+	}
+
+	/* fill gadget fields */
+	priv_dev->gadget.max_speed = max_speed;
+	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
+	priv_dev->gadget.ops = &cdns3_gadget_ops;
+	priv_dev->gadget.name = "usb-ss-gadget";
+	priv_dev->gadget.sg_supported = 1;
+
+	spin_lock_init(&priv_dev->lock);
+	INIT_WORK(&priv_dev->pending_status_wq,
+		  cdns3_pending_setup_status_handler);
+
+	/* initialize endpoint container */
+	INIT_LIST_HEAD(&priv_dev->gadget.ep_list);
+	INIT_LIST_HEAD(&priv_dev->aligned_buf_list);
+
+	ret = cdns3_init_eps(priv_dev);
+	if (ret) {
+		dev_err(priv_dev->dev, "Failed to create endpoints\n");
+		goto err1;
+	}
+
+	/* allocate memory for setup packet buffer */
+	priv_dev->setup_buf = dma_alloc_coherent(priv_dev->sysdev, 8,
+						 &priv_dev->setup_dma, GFP_DMA);
+	if (!priv_dev->setup_buf) {
+		ret = -ENOMEM;
+		goto err2;
+	}
+
+	priv_dev->dev_ver = readl(&priv_dev->regs->usb_cap6);
+
+	dev_dbg(priv_dev->dev, "Device Controller version: %08x\n",
+		readl(&priv_dev->regs->usb_cap6));
+	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
+		readl(&priv_dev->regs->usb_cap1));
+	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
+		readl(&priv_dev->regs->usb_cap2));
+
+	priv_dev->dev_ver = GET_DEV_BASE_VERSION(priv_dev->dev_ver);
+
+	priv_dev->zlp_buf = kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
+	if (!priv_dev->zlp_buf) {
+		ret = -ENOMEM;
+		goto err3;
+	}
+
+	/* add USB gadget device */
+	ret = usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
+	if (ret < 0) {
+		dev_err(priv_dev->dev,
+			"Failed to register USB device controller\n");
+		goto err4;
+	}
+
+	return 0;
+err4:
+	kfree(priv_dev->zlp_buf);
+err3:
+	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
+			  priv_dev->setup_dma);
+err2:
+	cdns3_free_all_eps(priv_dev);
+err1:
+	cdns->gadget_dev = NULL;
+	return ret;
+}
+
+static int __cdns3_gadget_init(struct cdns3 *cdns)
+{
+	struct cdns3_device *priv_dev;
+	int ret = 0;
+
+	pm_runtime_get_sync(cdns->dev);
+
+	ret = cdns3_gadget_start(cdns);
+	if (ret)
+		return ret;
+
+	priv_dev = cdns->gadget_dev;
+	ret = devm_request_threaded_irq(cdns->dev, cdns->dev_irq,
+					cdns3_device_irq_handler,
+					cdns3_device_thread_irq_handler,
+					IRQF_SHARED, dev_name(cdns->dev), cdns);
+
+	if (ret)
+		goto err0;
+
+	return 0;
+err0:
+	cdns3_gadget_exit(cdns);
+	return ret;
+}
+
+static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
+{
+	struct cdns3_device *priv_dev = cdns->gadget_dev;
+
+	cdns3_disconnect_gadget(priv_dev);
+
+	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
+	usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
+	cdns3_hw_reset_eps_config(priv_dev);
+
+	/* disable interrupt for device */
+	writel(0, &priv_dev->regs->usb_ien);
+
+	cdns3_gadget_pullup(&priv_dev->gadget, 0);
+
+	return 0;
+}
+
+static int cdns3_gadget_resume(struct cdns3 *cdns, bool hibernated)
+{
+	struct cdns3_device *priv_dev = cdns->gadget_dev;
+
+	if (!priv_dev->gadget_driver)
+		return 0;
+
+	cdns3_gadget_config(priv_dev);
+
+	return 0;
+}
+
+/**
+ * cdns3_gadget_init - initialize device structure
+ *
+ * cdns: cdns3 instance
+ *
+ * This function initializes the gadget.
+ */
+int cdns3_gadget_init(struct cdns3 *cdns)
+{
+	struct cdns3_role_driver *rdrv;
+
+	rdrv = devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
+	if (!rdrv)
+		return -ENOMEM;
+
+	rdrv->start	= __cdns3_gadget_init;
+	rdrv->stop	= cdns3_gadget_exit;
+	rdrv->suspend	= cdns3_gadget_suspend;
+	rdrv->resume	= cdns3_gadget_resume;
+	rdrv->state	= CDNS3_ROLE_STATE_INACTIVE;
+	rdrv->name	= "gadget";
+	cdns->roles[USB_ROLE_DEVICE] = rdrv;
+
+	return 0;
+}
diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
new file mode 100644
index 000000000000..2a97c16aea4b
--- /dev/null
+++ b/drivers/usb/cdns3/gadget.h
@@ -0,0 +1,1321 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * USBSS device controller driver header file
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ * Copyright (C) 2017-2018 NXP
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ *         Pawel Jez <pjez@cadence.com>
+ *         Peter Chen <peter.chen@nxp.com>
+ */
+#ifndef __LINUX_CDNS3_GADGET
+#define __LINUX_CDNS3_GADGET
+#include <linux/usb/gadget.h>
+
+/*
+ * USBSS-DEV register interface.
+ * This corresponds to the USBSS Device Controller Interface
+ */
+
+/**
+ * struct cdns3_usb_regs - device controller registers.
+ * @usb_conf:      Global Configuration Register.
+ * @usb_sts:       Global Status Register.
+ * @usb_cmd:       Global Command Register.
+ * @usb_itpn:      ITP/SOF number Register.
+ * @usb_lpm:       Global Command Register.
+ * @usb_ien:       USB Interrupt Enable Register.
+ * @usb_ists:      USB Interrupt Status Register.
+ * @ep_sel:        Endpoint Select Register.
+ * @ep_traddr:     Endpoint Transfer Ring Address Register.
+ * @ep_cfg:        Endpoint Configuration Register.
+ * @ep_cmd:        Endpoint Command Register.
+ * @ep_sts:        Endpoint Status Register.
+ * @ep_sts_sid:    Endpoint Status Register.
+ * @ep_sts_en:     Endpoint Status Register Enable.
+ * @drbl:          Doorbell Register.
+ * @ep_ien:        EP Interrupt Enable Register.
+ * @ep_ists:       EP Interrupt Status Register.
+ * @usb_pwr:       Global Power Configuration Register.
+ * @usb_conf2:     Global Configuration Register 2.
+ * @usb_cap1:      Capability Register 1.
+ * @usb_cap2:      Capability Register 2.
+ * @usb_cap3:      Capability Register 3.
+ * @usb_cap4:      Capability Register 4.
+ * @usb_cap5:      Capability Register 5.
+ * @usb_cap6:      Capability Register 6.
+ * @usb_cpkt1:     Custom Packet Register 1.
+ * @usb_cpkt2:     Custom Packet Register 2.
+ * @usb_cpkt3:     Custom Packet Register 3.
+ * @ep_dma_ext_addr: Upper address for DMA operations Register.
+ * @buf_addr:      Address for On-chip Buffer operations Register.
+ * @buf_data:      Data for On-chip Buffer operations Register.
+ * @buf_ctrl:      On-chip Buffer Access Control Registe.
+ * @dtrans:        DMA Transfer Mode Register.
+ * @tdl_from_trb:  Source of TD Configuration Register.
+ * @tdl_beh:       TDL Behavior Configuration Register.
+ * @ep_tdl:        Endpoint TDL Register.
+ * @tdl_beh2:      TDL Behavior 2 Configuration Register.
+ * @dma_adv_td:    DMA Advance TD Configuration Register.
+ * @reserved1:     Reserved.
+ * @cfg_regs:      Configuration registers.
+ * @reserved2:     Reserved.
+ * @dma_axi_ctrl:  AXI Control register.
+ * @dma_axi_id:    AXI ID register.
+ * @dma_axi_cap:   AXI Capability register.
+ * @dma_axi_ctrl0: AXI Control 0 register.
+ * @dma_axi_ctrl1: AXI Control 1 register.
+ */
+struct cdns3_usb_regs {
+	__le32 usb_conf;
+	__le32 usb_sts;
+	__le32 usb_cmd;
+	__le32 usb_itpn;
+	__le32 usb_lpm;
+	__le32 usb_ien;
+	__le32 usb_ists;
+	__le32 ep_sel;
+	__le32 ep_traddr;
+	__le32 ep_cfg;
+	__le32 ep_cmd;
+	__le32 ep_sts;
+	__le32 ep_sts_sid;
+	__le32 ep_sts_en;
+	__le32 drbl;
+	__le32 ep_ien;
+	__le32 ep_ists;
+	__le32 usb_pwr;
+	__le32 usb_conf2;
+	__le32 usb_cap1;
+	__le32 usb_cap2;
+	__le32 usb_cap3;
+	__le32 usb_cap4;
+	__le32 usb_cap5;
+	__le32 usb_cap6;
+	__le32 usb_cpkt1;
+	__le32 usb_cpkt2;
+	__le32 usb_cpkt3;
+	__le32 ep_dma_ext_addr;
+	__le32 buf_addr;
+	__le32 buf_data;
+	__le32 buf_ctrl;
+	__le32 dtrans;
+	__le32 tdl_from_trb;
+	__le32 tdl_beh;
+	__le32 ep_tdl;
+	__le32 tdl_beh2;
+	__le32 dma_adv_td;
+	__le32 reserved1[26];
+	__le32 cfg_reg1;
+	__le32 dbg_link1;
+	__le32 dbg_link2;
+	__le32 cfg_regs[74];
+	__le32 reserved2[34];
+	__le32 dma_axi_ctrl;
+	__le32 dma_axi_id;
+	__le32 dma_axi_cap;
+	__le32 dma_axi_ctrl0;
+	__le32 dma_axi_ctrl1;
+};
+
+/* USB_CONF - bitmasks */
+/* Reset USB device configuration. */
+#define USB_CONF_CFGRST		BIT(0)
+/* Set Configuration. */
+#define USB_CONF_CFGSET		BIT(1)
+/* Disconnect USB device in SuperSpeed. */
+#define USB_CONF_USB3DIS	BIT(3)
+/* Disconnect USB device in HS/FS */
+#define USB_CONF_USB2DIS	BIT(4)
+/* Little Endian access - default */
+#define USB_CONF_LENDIAN	BIT(5)
+/*
+ * Big Endian access. Driver assume that byte order for
+ * SFRs access always is as Little Endian so this bit
+ * is not used.
+ */
+#define USB_CONF_BENDIAN	BIT(6)
+/* Device software reset. */
+#define USB_CONF_SWRST		BIT(7)
+/* Singular DMA transfer mode. Only for VER < DEV_VER_V3*/
+#define USB_CONF_DSING		BIT(8)
+/* Multiple DMA transfers mode. Only for VER < DEV_VER_V3 */
+#define USB_CONF_DMULT		BIT(9)
+/* DMA clock turn-off enable. */
+#define USB_CONF_DMAOFFEN	BIT(10)
+/* DMA clock turn-off disable. */
+#define USB_CONF_DMAOFFDS	BIT(11)
+/* Clear Force Full Speed. */
+#define USB_CONF_CFORCE_FS	BIT(12)
+/* Set Force Full Speed. */
+#define USB_CONF_SFORCE_FS	BIT(13)
+/* Device enable. */
+#define USB_CONF_DEVEN		BIT(14)
+/* Device disable. */
+#define USB_CONF_DEVDS		BIT(15)
+/* L1 LPM state entry enable (used in HS/FS mode). */
+#define USB_CONF_L1EN		BIT(16)
+/* L1 LPM state entry disable (used in HS/FS mode). */
+#define USB_CONF_L1DS		BIT(17)
+/* USB 2.0 clock gate disable. */
+#define USB_CONF_CLK2OFFEN	BIT(18)
+/* USB 2.0 clock gate enable. */
+#define USB_CONF_CLK2OFFDS	BIT(19)
+/* L0 LPM state entry request (used in HS/FS mode). */
+#define USB_CONF_LGO_L0		BIT(20)
+/* USB 3.0 clock gate disable. */
+#define USB_CONF_CLK3OFFEN	BIT(21)
+/* USB 3.0 clock gate enable. */
+#define USB_CONF_CLK3OFFDS	BIT(22)
+/* Bit 23 is reserved*/
+/* U1 state entry enable (used in SS mode). */
+#define USB_CONF_U1EN		BIT(24)
+/* U1 state entry disable (used in SS mode). */
+#define USB_CONF_U1DS		BIT(25)
+/* U2 state entry enable (used in SS mode). */
+#define USB_CONF_U2EN		BIT(26)
+/* U2 state entry disable (used in SS mode). */
+#define USB_CONF_U2DS		BIT(27)
+/* U0 state entry request (used in SS mode). */
+#define USB_CONF_LGO_U0		BIT(28)
+/* U1 state entry request (used in SS mode). */
+#define USB_CONF_LGO_U1		BIT(29)
+/* U2 state entry request (used in SS mode). */
+#define USB_CONF_LGO_U2		BIT(30)
+/* SS.Inactive state entry request (used in SS mode) */
+#define USB_CONF_LGO_SSINACT	BIT(31)
+
+/* USB_STS - bitmasks */
+/*
+ * Configuration status.
+ * 1 - device is in the configured state.
+ * 0 - device is not configured.
+ */
+#define USB_STS_CFGSTS_MASK	BIT(0)
+#define USB_STS_CFGSTS(p)	((p) & USB_STS_CFGSTS_MASK)
+/*
+ * On-chip memory overflow.
+ * 0 - On-chip memory status OK.
+ * 1 - On-chip memory overflow.
+ */
+#define USB_STS_OV_MASK		BIT(1)
+#define USB_STS_OV(p)		((p) & USB_STS_OV_MASK)
+/*
+ * SuperSpeed connection status.
+ * 0 - USB in SuperSpeed mode disconnected.
+ * 1 - USB in SuperSpeed mode connected.
+ */
+#define USB_STS_USB3CONS_MASK	BIT(2)
+#define USB_STS_USB3CONS(p)	((p) & USB_STS_USB3CONS_MASK)
+/*
+ * DMA transfer configuration status.
+ * 0 - single request.
+ * 1 - multiple TRB chain
+ * Supported only for controller version <  DEV_VER_V3
+ */
+#define USB_STS_DTRANS_MASK	BIT(3)
+#define USB_STS_DTRANS(p)	((p) & USB_STS_DTRANS_MASK)
+/*
+ * Device speed.
+ * 0 - Undefined (value after reset).
+ * 1 - Low speed
+ * 2 - Full speed
+ * 3 - High speed
+ * 4 - Super speed
+ */
+#define USB_STS_USBSPEED_MASK	GENMASK(6, 4)
+#define USB_STS_USBSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) >> 4)
+#define USB_STS_LS		(0x1 << 4)
+#define USB_STS_FS		(0x2 << 4)
+#define USB_STS_HS		(0x3 << 4)
+#define USB_STS_SS		(0x4 << 4)
+#define DEV_UNDEFSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) == (0x0 << 4))
+#define DEV_LOWSPEED(p)		(((p) & USB_STS_USBSPEED_MASK) == USB_STS_LS)
+#define DEV_FULLSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) == USB_STS_FS)
+#define DEV_HIGHSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) == USB_STS_HS)
+#define DEV_SUPERSPEED(p)	(((p) & USB_STS_USBSPEED_MASK) == USB_STS_SS)
+/*
+ * Endianness for SFR access.
+ * 0 - Little Endian order (default after hardware reset).
+ * 1 - Big Endian order
+ */
+#define USB_STS_ENDIAN_MASK	BIT(7)
+#define USB_STS_ENDIAN(p)	((p) & USB_STS_ENDIAN_MASK)
+/*
+ * HS/FS clock turn-off status.
+ * 0 - hsfs clock is always on.
+ * 1 - hsfs clock turn-off in L2 (HS/FS mode) is enabled
+ *          (default after hardware reset).
+ */
+#define USB_STS_CLK2OFF_MASK	BIT(8)
+#define USB_STS_CLK2OFF(p)	((p) & USB_STS_CLK2OFF_MASK)
+/*
+ * PCLK clock turn-off status.
+ * 0 - pclk clock is always on.
+ * 1 - pclk clock turn-off in U3 (SS mode) is enabled
+ *          (default after hardware reset).
+ */
+#define USB_STS_CLK3OFF_MASK	BIT(9)
+#define USB_STS_CLK3OFF(p)	((p) & USB_STS_CLK3OFF_MASK)
+/*
+ * Controller in reset state.
+ * 0 - Internal reset is active.
+ * 1 - Internal reset is not active and controller is fully operational.
+ */
+#define USB_STS_IN_RST_MASK	BIT(10)
+#define USB_STS_IN_RST(p)	((p) & USB_STS_IN_RST_MASK)
+/*
+ * Status of the "TDL calculation basing on TRB" feature.
+ * 0 - disabled
+ * 1 - enabled
+ * Supported only for DEV_VER_V2 controller version.
+ */
+#define USB_STS_TDL_TRB_ENABLED	BIT(11)
+/*
+ * Device enable Status.
+ * 0 - USB device is disabled (VBUS input is disconnected from internal logic).
+ * 1 - USB device is enabled (VBUS input is connected to the internal logic).
+ */
+#define USB_STS_DEVS_MASK	BIT(14)
+#define USB_STS_DEVS(p)		((p) & USB_STS_DEVS_MASK)
+/*
+ * Address status.
+ * 0 - USB device is default state.
+ * 1 - USB device is at least in address state.
+ */
+#define USB_STS_ADDRESSED_MASK	BIT(15)
+#define USB_STS_ADDRESSED(p)	((p) & USB_STS_ADDRESSED_MASK)
+/*
+ * L1 LPM state enable status (used in HS/FS mode).
+ * 0 - Entering to L1 LPM state disabled.
+ * 1 - Entering to L1 LPM state enabled.
+ */
+#define USB_STS_L1ENS_MASK	BIT(16)
+#define USB_STS_L1ENS(p)	((p) & USB_STS_L1ENS_MASK)
+/*
+ * Internal VBUS connection status (used both in HS/FS  and SS mode).
+ * 0 - internal VBUS is not detected.
+ * 1 - internal VBUS is detected.
+ */
+#define USB_STS_VBUSS_MASK	BIT(17)
+#define USB_STS_VBUSS(p)	((p) & USB_STS_VBUSS_MASK)
+/*
+ * HS/FS LPM  state (used in FS/HS mode).
+ * 0 - L0 State
+ * 1 - L1 State
+ * 2 - L2 State
+ * 3 - L3 State
+ */
+#define USB_STS_LPMST_MASK	GENMASK(19, 18)
+#define DEV_L0_STATE(p)		(((p) & USB_STS_LPMST_MASK) == (0x0 << 18))
+#define DEV_L1_STATE(p)		(((p) & USB_STS_LPMST_MASK) == (0x1 << 18))
+#define DEV_L2_STATE(p)		(((p) & USB_STS_LPMST_MASK) == (0x2 << 18))
+#define DEV_L3_STATE(p)		(((p) & USB_STS_LPMST_MASK) == (0x3 << 18))
+/*
+ * Disable HS status (used in FS/HS mode).
+ * 0 - the disconnect bit for HS/FS mode is set .
+ * 1 - the disconnect bit for HS/FS mode is not set.
+ */
+#define USB_STS_USB2CONS_MASK	BIT(20)
+#define USB_STS_USB2CONS(p)	((p) & USB_STS_USB2CONS_MASK)
+/*
+ * HS/FS mode connection status (used in FS/HS mode).
+ * 0 - High Speed operations in USB2.0 (FS/HS) mode not disabled.
+ * 1 - High Speed operations in USB2.0 (FS/HS).
+ */
+#define USB_STS_DISABLE_HS_MASK	BIT(21)
+#define USB_STS_DISABLE_HS(p)	((p) & USB_STS_DISABLE_HS_MASK)
+/*
+ * U1 state enable status (used in SS mode).
+ * 0 - Entering to  U1 state disabled.
+ * 1 - Entering to  U1 state enabled.
+ */
+#define USB_STS_U1ENS_MASK	BIT(24)
+#define USB_STS_U1ENS(p)	((p) & USB_STS_U1ENS_MASK)
+/*
+ * U2 state enable status (used in SS mode).
+ * 0 - Entering to  U2 state disabled.
+ * 1 - Entering to  U2 state enabled.
+ */
+#define USB_STS_U2ENS_MASK	BIT(25)
+#define USB_STS_U2ENS(p)	((p) & USB_STS_U2ENS_MASK)
+/*
+ * SuperSpeed Link LTSSM state. This field reflects USBSS-DEV current
+ * SuperSpeed link state
+ */
+#define USB_STS_LST_MASK	GENMASK(29, 26)
+#define DEV_LST_U0		(((p) & USB_STS_LST_MASK) == (0x0 << 26))
+#define DEV_LST_U1		(((p) & USB_STS_LST_MASK) == (0x1 << 26))
+#define DEV_LST_U2		(((p) & USB_STS_LST_MASK) == (0x2 << 26))
+#define DEV_LST_U3		(((p) & USB_STS_LST_MASK) == (0x3 << 26))
+#define DEV_LST_DISABLED	(((p) & USB_STS_LST_MASK) == (0x4 << 26))
+#define DEV_LST_RXDETECT	(((p) & USB_STS_LST_MASK) == (0x5 << 26))
+#define DEV_LST_INACTIVE	(((p) & USB_STS_LST_MASK) == (0x6 << 26))
+#define DEV_LST_POLLING		(((p) & USB_STS_LST_MASK) == (0x7 << 26))
+#define DEV_LST_RECOVERY	(((p) & USB_STS_LST_MASK) == (0x8 << 26))
+#define DEV_LST_HOT_RESET	(((p) & USB_STS_LST_MASK) == (0x9 << 26))
+#define DEV_LST_COMP_MODE	(((p) & USB_STS_LST_MASK) == (0xa << 26))
+#define DEV_LST_LB_STATE	(((p) & USB_STS_LST_MASK) == (0xb << 26))
+/*
+ * DMA clock turn-off status.
+ * 0 - DMA clock is always on (default after hardware reset).
+ * 1 - DMA clock turn-off in U1, U2 and U3 (SS mode) is enabled.
+ */
+#define USB_STS_DMAOFF_MASK	BIT(30)
+#define USB_STS_DMAOFF(p)	((p) & USB_STS_DMAOFF_MASK)
+/*
+ * SFR Endian status.
+ * 0 - Little Endian order (default after hardware reset).
+ * 1 - Big Endian order.
+ */
+#define USB_STS_ENDIAN2_MASK	BIT(31)
+#define USB_STS_ENDIAN2(p)	((p) & USB_STS_ENDIAN2_MASK)
+
+/* USB_CMD -  bitmasks */
+/* Set Function Address */
+#define USB_CMD_SET_ADDR	BIT(0)
+/*
+ * Function Address This field is saved to the device only when the field
+ * SET_ADDR is set '1 ' during write to USB_CMD register.
+ * Software is responsible for entering the address of the device during
+ * SET_ADDRESS request service. This field should be set immediately after
+ * the SETUP packet is decoded, and prior to confirmation of the status phase
+ */
+#define USB_CMD_FADDR_MASK	GENMASK(7, 1)
+#define USB_CMD_FADDR(p)	(((p) << 1) & USB_CMD_FADDR_MASK)
+/* Send Function Wake Device Notification TP (used only in SS mode). */
+#define USB_CMD_SDNFW		BIT(8)
+/* Set Test Mode (used only in HS/FS mode). */
+#define USB_CMD_STMODE		BIT(9)
+/* Test mode selector (used only in HS/FS mode) */
+#define USB_STS_TMODE_SEL_MASK	GENMASK(11, 10)
+#define USB_STS_TMODE_SEL(p)	(((p) << 10) & USB_STS_TMODE_SEL_MASK)
+/*
+ *  Send Latency Tolerance Message Device Notification TP (used only
+ *  in SS mode).
+ */
+#define USB_CMD_SDNLTM		BIT(12)
+/* Send Custom Transaction Packet (used only in SS mode) */
+#define USB_CMD_SPKT		BIT(13)
+/*Device Notification 'Function Wake' - Interface value (only in SS mode. */
+#define USB_CMD_DNFW_INT_MASK	GENMASK(23, 16)
+#define USB_STS_DNFW_INT(p)	(((p) << 16) & USB_CMD_DNFW_INT_MASK)
+/*
+ * Device Notification 'Latency Tolerance Message' -373 BELT value [7:0]
+ * (used only in SS mode).
+ */
+#define USB_CMD_DNLTM_BELT_MASK	GENMASK(27, 16)
+#define USB_STS_DNLTM_BELT(p)	(((p) << 16) & USB_CMD_DNLTM_BELT_MASK)
+
+/* USB_ITPN - bitmasks */
+/*
+ * ITP(SS) / SOF (HS/FS) number
+ * In SS mode this field represent number of last ITP received from host.
+ * In HS/FS mode this field represent number of last SOF received from host.
+ */
+#define USB_ITPN_MASK		GENMASK(13, 0)
+#define USB_ITPN(p)		((p) & USB_ITPN_MASK)
+
+/* USB_LPM - bitmasks */
+/* Host Initiated Resume Duration. */
+#define USB_LPM_HIRD_MASK	GENMASK(3, 0)
+#define USB_LPM_HIRD(p)		((p) & USB_LPM_HIRD_MASK)
+/* Remote Wakeup Enable (bRemoteWake). */
+#define USB_LPM_BRW		BIT(4)
+
+/* USB_IEN - bitmasks */
+/* SS connection interrupt enable */
+#define USB_IEN_CONIEN		BIT(0)
+/* SS disconnection interrupt enable. */
+#define USB_IEN_DISIEN		BIT(1)
+/* USB SS warm reset interrupt enable. */
+#define USB_IEN_UWRESIEN	BIT(2)
+/* USB SS hot reset interrupt enable */
+#define USB_IEN_UHRESIEN	BIT(3)
+/* SS link U3 state enter interrupt enable (suspend).*/
+#define USB_IEN_U3ENTIEN	BIT(4)
+/* SS link U3 state exit interrupt enable (wakeup). */
+#define USB_IEN_U3EXTIEN	BIT(5)
+/* SS link U2 state enter interrupt enable.*/
+#define USB_IEN_U2ENTIEN	BIT(6)
+/* SS link U2 state exit interrupt enable.*/
+#define USB_IEN_U2EXTIEN	BIT(7)
+/* SS link U1 state enter interrupt enable.*/
+#define USB_IEN_U1ENTIEN	BIT(8)
+/* SS link U1 state exit interrupt enable.*/
+#define USB_IEN_U1EXTIEN	BIT(9)
+/* ITP/SOF packet detected interrupt enable.*/
+#define USB_IEN_ITPIEN		BIT(10)
+/* Wakeup interrupt enable.*/
+#define USB_IEN_WAKEIEN		BIT(11)
+/* Send Custom Packet interrupt enable.*/
+#define USB_IEN_SPKTIEN		BIT(12)
+/* HS/FS mode connection interrupt enable.*/
+#define USB_IEN_CON2IEN		BIT(16)
+/* HS/FS mode disconnection interrupt enable.*/
+#define USB_IEN_DIS2IEN		BIT(17)
+/* USB reset (HS/FS mode) interrupt enable.*/
+#define USB_IEN_U2RESIEN	BIT(18)
+/* LPM L2 state enter interrupt enable.*/
+#define USB_IEN_L2ENTIEN	BIT(20)
+/* LPM  L2 state exit interrupt enable.*/
+#define USB_IEN_L2EXTIEN	BIT(21)
+/* LPM L1 state enter interrupt enable.*/
+#define USB_IEN_L1ENTIEN	BIT(24)
+/* LPM  L1 state exit interrupt enable.*/
+#define USB_IEN_L1EXTIEN	BIT(25)
+/* Configuration reset interrupt enable.*/
+#define USB_IEN_CFGRESIEN	BIT(26)
+/* Start of the USB SS warm reset interrupt enable.*/
+#define USB_IEN_UWRESSIEN	BIT(28)
+/* End of the USB SS warm reset interrupt enable.*/
+#define USB_IEN_UWRESEIEN	BIT(29)
+
+#define USB_IEN_INIT  (USB_IEN_U2RESIEN | USB_ISTS_DIS2I | USB_IEN_CON2IEN \
+		       | USB_IEN_UHRESIEN | USB_IEN_UWRESIEN | USB_IEN_DISIEN \
+		       | USB_IEN_CONIEN | USB_IEN_U3EXTIEN | USB_IEN_L2ENTIEN \
+		       | USB_IEN_L2EXTIEN | USB_IEN_L1ENTIEN)
+
+/* USB_ISTS - bitmasks */
+/* SS Connection detected. */
+#define USB_ISTS_CONI		BIT(0)
+/* SS Disconnection detected. */
+#define USB_ISTS_DISI		BIT(1)
+/* UUSB warm reset detectede. */
+#define USB_ISTS_UWRESI		BIT(2)
+/* USB hot reset detected. */
+#define USB_ISTS_UHRESI		BIT(3)
+/* U3 link state enter detected (suspend).*/
+#define USB_ISTS_U3ENTI		BIT(4)
+/* U3 link state exit detected (wakeup). */
+#define USB_ISTS_U3EXTI		BIT(5)
+/* U2 link state enter detected.*/
+#define USB_ISTS_U2ENTI		BIT(6)
+/* U2 link state exit detected.*/
+#define USB_ISTS_U2EXTI		BIT(7)
+/* U1 link state enter detected.*/
+#define USB_ISTS_U1ENTI		BIT(8)
+/* U1 link state exit detected.*/
+#define USB_ISTS_U1EXTI		BIT(9)
+/* ITP/SOF packet detected.*/
+#define USB_ISTS_ITPI		BIT(10)
+/* Wakeup detected.*/
+#define USB_ISTS_WAKEI		BIT(11)
+/* Send Custom Packet detected.*/
+#define USB_ISTS_SPKTI		BIT(12)
+/* HS/FS mode connection detected.*/
+#define USB_ISTS_CON2I		BIT(16)
+/* HS/FS mode disconnection detected.*/
+#define USB_ISTS_DIS2I		BIT(17)
+/* USB reset (HS/FS mode) detected.*/
+#define USB_ISTS_U2RESI		BIT(18)
+/* LPM L2 state enter detected.*/
+#define USB_ISTS_L2ENTI		BIT(20)
+/* LPM  L2 state exit detected.*/
+#define USB_ISTS_L2EXTI		BIT(21)
+/* LPM L1 state enter detected.*/
+#define USB_ISTS_L1ENTI		BIT(24)
+/* LPM L1 state exit detected.*/
+#define USB_ISTS_L1EXTI		BIT(25)
+/* USB configuration reset detected.*/
+#define USB_ISTS_CFGRESI	BIT(26)
+/* Start of the USB warm reset detected.*/
+#define USB_ISTS_UWRESSI	BIT(28)
+/* End of the USB warm reset detected.*/
+#define USB_ISTS_UWRESEI	BIT(29)
+
+/* USB_SEL - bitmasks */
+#define EP_SEL_EPNO_MASK	GENMASK(3, 0)
+/* Endpoint number. */
+#define EP_SEL_EPNO(p)		((p) & EP_SEL_EPNO_MASK)
+/* Endpoint direction bit - 0 - OUT, 1 - IN. */
+#define EP_SEL_DIR		BIT(7)
+
+#define select_ep_in(nr)	(EP_SEL_EPNO(p) | EP_SEL_DIR)
+#define select_ep_out		(EP_SEL_EPNO(p))
+
+/* EP_TRADDR - bitmasks */
+/* Transfer Ring address. */
+#define EP_TRADDR_TRADDR(p)	((p))
+
+/* EP_CFG - bitmasks */
+/* Endpoint enable */
+#define EP_CFG_ENABLE		BIT(0)
+/*
+ *  Endpoint type.
+ * 1 - isochronous
+ * 2 - bulk
+ * 3 - interrupt
+ */
+#define EP_CFG_EPTYPE_MASK	GENMASK(2, 1)
+#define EP_CFG_EPTYPE(p)	(((p) << 1)  & EP_CFG_EPTYPE_MASK)
+/* Stream support enable (only in SS mode). */
+#define EP_CFG_STREAM_EN	BIT(3)
+/* TDL check (only in SS mode for BULK EP). */
+#define EP_CFG_TDL_CHK		BIT(4)
+/* SID check (only in SS mode for BULK OUT EP). */
+#define EP_CFG_SID_CHK		BIT(5)
+/* DMA transfer endianness. */
+#define EP_CFG_EPENDIAN		BIT(7)
+/* Max burst size (used only in SS mode). */
+#define EP_CFG_MAXBURST_MASK	GENMASK(11, 8)
+#define EP_CFG_MAXBURST(p)	(((p) << 8) & EP_CFG_MAXBURST_MASK)
+/* ISO max burst. */
+#define EP_CFG_MULT_MASK	GENMASK(15, 14)
+#define EP_CFG_MULT(p)		(((p) << 14) & EP_CFG_MULT_MASK)
+/* ISO max burst. */
+#define EP_CFG_MAXPKTSIZE_MASK	GENMASK(26, 16)
+#define EP_CFG_MAXPKTSIZE(p)	(((p) << 16) & EP_CFG_MAXPKTSIZE_MASK)
+/* Max number of buffered packets. */
+#define EP_CFG_BUFFERING_MASK	GENMASK(31, 27)
+#define EP_CFG_BUFFERING(p)	(((p) << 27) & EP_CFG_BUFFERING_MASK)
+
+/* EP_CMD - bitmasks */
+/* Endpoint reset. */
+#define EP_CMD_EPRST		BIT(0)
+/* Endpoint STALL set. */
+#define EP_CMD_SSTALL		BIT(1)
+/* Endpoint STALL clear. */
+#define EP_CMD_CSTALL		BIT(2)
+/* Send ERDY TP. */
+#define EP_CMD_ERDY		BIT(3)
+/* Request complete. */
+#define EP_CMD_REQ_CMPL		BIT(5)
+/* Transfer descriptor ready. */
+#define EP_CMD_DRDY		BIT(6)
+/* Data flush. */
+#define EP_CMD_DFLUSH		BIT(7)
+/*
+ * Transfer Descriptor Length write  (used only for Bulk Stream capable
+ * endpoints in SS mode).
+ * Bit Removed from DEV_VER_V3 controller version.
+ */
+#define EP_CMD_STDL		BIT(8)
+/*
+ * Transfer Descriptor Length (used only in SS mode for bulk endpoints).
+ * Bits Removed from DEV_VER_V3 controller version.
+ */
+#define EP_CMD_TDL_MASK		GENMASK(15, 9)
+#define EP_CMD_TDL(p)		(((p) << 9) & EP_CMD_TDL_MASK)
+/* ERDY Stream ID value (used in SS mode). */
+#define EP_CMD_ERDY_SID_MASK	GENMASK(31, 16)
+#define EP_CMD_ERDY_SID(p)	(((p) << 16) & EP_CMD_SID_MASK)
+
+/* EP_STS - bitmasks */
+/* Setup transfer complete. */
+#define EP_STS_SETUP		BIT(0)
+/* Endpoint STALL status. */
+#define EP_STS_STALL(p)		((p) & BIT(1))
+/* Interrupt On Complete. */
+#define EP_STS_IOC		BIT(2)
+/* Interrupt on Short Packet. */
+#define EP_STS_ISP		BIT(3)
+/* Transfer descriptor missing. */
+#define EP_STS_DESCMIS		BIT(4)
+/* Stream Rejected (used only in SS mode) */
+#define EP_STS_STREAMR		BIT(5)
+/* EXIT from MOVE DATA State (used only for stream transfers in SS mode). */
+#define EP_STS_MD_EXIT		BIT(6)
+/* TRB error. */
+#define EP_STS_TRBERR		BIT(7)
+/* Not ready (used only in SS mode). */
+#define EP_STS_NRDY		BIT(8)
+/* DMA busy bit. */
+#define EP_STS_DBUSY		BIT(9)
+/* Endpoint Buffer Empty */
+#define EP_STS_BUFFEMPTY(p)	((p) & BIT(10))
+/* Current Cycle Status */
+#define EP_STS_CCS(p)		((p) & BIT(11))
+/* Prime (used only in SS mode. */
+#define EP_STS_PRIME		BIT(12)
+/* Stream error (used only in SS mode). */
+#define EP_STS_SIDERR		BIT(13)
+/* OUT size mismatch. */
+#define EP_STS_OUTSMM		BIT(14)
+/* ISO transmission error. */
+#define EP_STS_ISOERR		BIT(15)
+/* Host Packet Pending (only for SS mode). */
+#define EP_STS_HOSTPP(p)	((p) & BIT(16))
+/* Stream Protocol State Machine State (only for Bulk stream endpoints). */
+#define EP_STS_SPSMST_MASK		GENMASK(18, 17)
+#define EP_STS_SPSMST_DISABLED(p)	(((p) & EP_STS_SPSMST_MASK) >> 17)
+#define EP_STS_SPSMST_IDLE(p)		(((p) & EP_STS_SPSMST_MASK) >> 17)
+#define EP_STS_SPSMST_START_STREAM(p)	(((p) & EP_STS_SPSMST_MASK) >> 17)
+#define EP_STS_SPSMST_MOVE_DATA(p)	(((p) & EP_STS_SPSMST_MASK) >> 17)
+/* Interrupt On Transfer complete. */
+#define EP_STS_IOT		BIT(19)
+/* OUT queue endpoint number. */
+#define EP_STS_OUTQ_NO_MASK	GENMASK(27, 24)
+#define EP_STS_OUTQ_NO(p)	(((p) & EP_STS_OUTQ_NO_MASK) >> 24)
+/* OUT queue valid flag. */
+#define EP_STS_OUTQ_VAL_MASK	BIT(28)
+#define EP_STS_OUTQ_VAL(p)	((p) & EP_STS_OUTQ_VAL_MASK)
+/* SETUP WAIT. */
+#define EP_STS_STPWAIT		BIT(31)
+
+/* EP_STS_SID - bitmasks */
+/* Stream ID (used only in SS mode). */
+#define EP_STS_SID_MASK		GENMASK(15, 0)
+#define EP_STS_SID(p)		((p) & EP_STS_SID_MASK)
+
+/* EP_STS_EN - bitmasks */
+/* SETUP interrupt enable. */
+#define EP_STS_EN_SETUPEN	BIT(0)
+/* OUT transfer missing descriptor enable. */
+#define EP_STS_EN_DESCMISEN	BIT(4)
+/* Stream Rejected enable. */
+#define EP_STS_EN_STREAMREN	BIT(5)
+/* Move Data Exit enable.*/
+#define EP_STS_EN_MD_EXITEN	BIT(6)
+/* TRB enable. */
+#define EP_STS_EN_TRBERREN	BIT(7)
+/* NRDY enable. */
+#define EP_STS_EN_NRDYEN	BIT(8)
+/* Prime enable. */
+#define EP_STS_EN_PRIMEEEN	BIT(12)
+/* Stream error enable. */
+#define EP_STS_EN_SIDERREN	BIT(13)
+/* OUT size mismatch enable. */
+#define EP_STS_EN_OUTSMMEN	BIT(14)
+/* ISO transmission error enable. */
+#define EP_STS_EN_ISOERREN	BIT(15)
+/* Interrupt on Transmission complete enable. */
+#define EP_STS_EN_IOTEN		BIT(19)
+/* Setup Wait interrupt enable. */
+#define EP_STS_EN_STPWAITEN	BIT(31)
+
+/* DRBL- bitmasks */
+#define DB_VALUE_BY_INDEX(index) (1 << (index))
+#define DB_VALUE_EP0_OUT	BIT(0)
+#define DB_VALUE_EP0_IN		BIT(16)
+
+/* EP_IEN - bitmasks */
+#define EP_IEN(index)		(1 << (index))
+#define EP_IEN_EP_OUT0		BIT(0)
+#define EP_IEN_EP_IN0		BIT(16)
+
+/* EP_ISTS - bitmasks */
+#define EP_ISTS(index)		(1 << (index))
+#define EP_ISTS_EP_OUT0		BIT(0)
+#define EP_ISTS_EP_IN0		BIT(16)
+
+/* USB_PWR- bitmasks */
+/*Power Shut Off capability enable*/
+#define PUSB_PWR_PSO_EN		BIT(0)
+/*Power Shut Off capability disable*/
+#define PUSB_PWR_PSO_DS		BIT(1)
+/*
+ * Enables turning-off Reference Clock.
+ * This bit is optional and implemented only when support for OTG is
+ * implemented (indicated by OTG_READY bit set to '1').
+ */
+#define PUSB_PWR_STB_CLK_SWITCH_EN	BIT(8)
+/*
+ * Status bit indicating that operation required by STB_CLK_SWITCH_EN write
+ * is completed
+ */
+#define PUSB_PWR_STB_CLK_SWITCH_DONE	BIT(9)
+/* This bit informs if Fast Registers Access is enabled. */
+#define PUSB_PWR_FST_REG_ACCESS_STAT	BIT(30)
+/* Fast Registers Access Enable. */
+#define PUSB_PWR_FST_REG_ACCESS		BIT(31)
+
+/* USB_CONF2- bitmasks */
+/*
+ * Writing 1 disables TDL calculation basing on TRB feature in controller
+ * for DMULT mode.
+ * Bit supported only for DEV_VER_V2 version.
+ */
+#define USB_CONF2_DIS_TDL_TRB		BIT(1)
+/*
+ * Writing 1 enables TDL calculation basing on TRB feature in controller
+ * for DMULT mode.
+ * Bit supported only for DEV_VER_V2 version.
+ */
+#define USB_CONF2_EN_TDL_TRB		BIT(2)
+
+/* USB_CAP1- bitmasks */
+/*
+ * SFR Interface type
+ * These field reflects type of SFR interface implemented:
+ * 0x0 - OCP
+ * 0x1 - AHB,
+ * 0x2 - PLB
+ * 0x3 - AXI
+ * 0x4-0xF - reserved
+ */
+#define USB_CAP1_SFR_TYPE_MASK	GENMASK(3, 0)
+#define DEV_SFR_TYPE_OCP(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) == 0x0)
+#define DEV_SFR_TYPE_AHB(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) == 0x1)
+#define DEV_SFR_TYPE_PLB(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) == 0x2)
+#define DEV_SFR_TYPE_AXI(p)	(((p) & USB_CAP1_SFR_TYPE_MASK) == 0x3)
+/*
+ * SFR Interface width
+ * These field reflects width of SFR interface implemented:
+ * 0x0 - 8 bit interface,
+ * 0x1 - 16 bit interface,
+ * 0x2 - 32 bit interface
+ * 0x3 - 64 bit interface
+ * 0x4-0xF - reserved
+ */
+#define USB_CAP1_SFR_WIDTH_MASK	GENMASK(7, 4)
+#define DEV_SFR_WIDTH_8(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) == (0x0 << 4))
+#define DEV_SFR_WIDTH_16(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) == (0x1 << 4))
+#define DEV_SFR_WIDTH_32(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) == (0x2 << 4))
+#define DEV_SFR_WIDTH_64(p)	(((p) & USB_CAP1_SFR_WIDTH_MASK) == (0x3 << 4))
+/*
+ * DMA Interface type
+ * These field reflects type of DMA interface implemented:
+ * 0x0 - OCP
+ * 0x1 - AHB,
+ * 0x2 - PLB
+ * 0x3 - AXI
+ * 0x4-0xF - reserved
+ */
+#define USB_CAP1_DMA_TYPE_MASK	GENMASK(11, 8)
+#define DEV_DMA_TYPE_OCP(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) == (0x0 << 8))
+#define DEV_DMA_TYPE_AHB(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) == (0x1 << 8))
+#define DEV_DMA_TYPE_PLB(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) == (0x2 << 8))
+#define DEV_DMA_TYPE_AXI(p)	(((p) & USB_CAP1_DMA_TYPE_MASK) == (0x3 << 8))
+/*
+ * DMA Interface width
+ * These field reflects width of DMA interface implemented:
+ * 0x0 - reserved,
+ * 0x1 - reserved,
+ * 0x2 - 32 bit interface
+ * 0x3 - 64 bit interface
+ * 0x4-0xF - reserved
+ */
+#define USB_CAP1_DMA_WIDTH_MASK	GENMASK(15, 12)
+#define DEV_DMA_WIDTH_32(p)	(((p) & USB_CAP1_DMA_WIDTH_MASK) == (0x2 << 12))
+#define DEV_DMA_WIDTH_64(p)	(((p) & USB_CAP1_DMA_WIDTH_MASK) == (0x3 << 12))
+/*
+ * USB3 PHY Interface type
+ * These field reflects type of USB3 PHY interface implemented:
+ * 0x0 - USB PIPE,
+ * 0x1 - RMMI,
+ * 0x2-0xF - reserved
+ */
+#define USB_CAP1_U3PHY_TYPE_MASK GENMASK(19, 16)
+#define DEV_U3PHY_PIPE(p) (((p) & USB_CAP1_U3PHY_TYPE_MASK) == (0x0 << 16))
+#define DEV_U3PHY_RMMI(p) (((p) & USB_CAP1_U3PHY_TYPE_MASK) == (0x1 << 16))
+/*
+ * USB3 PHY Interface width
+ * These field reflects width of USB3 PHY interface implemented:
+ * 0x0 - 8 bit PIPE interface,
+ * 0x1 - 16 bit PIPE interface,
+ * 0x2 - 32 bit PIPE interface,
+ * 0x3 - 64 bit PIPE interface
+ * 0x4-0xF - reserved
+ * Note: When SSIC interface is implemented this field shows the width of
+ * internal PIPE interface. The RMMI interface is always 20bit wide.
+ */
+#define USB_CAP1_U3PHY_WIDTH_MASK GENMASK(23, 20)
+#define DEV_U3PHY_WIDTH_8(p) \
+	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) == (0x0 << 20))
+#define DEV_U3PHY_WIDTH_16(p) \
+	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) == (0x1 << 16))
+#define DEV_U3PHY_WIDTH_32(p) \
+	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) == (0x2 << 20))
+#define DEV_U3PHY_WIDTH_64(p) \
+	(((p) & USB_CAP1_U3PHY_WIDTH_MASK) == (0x3 << 16))
+
+/*
+ * USB2 PHY Interface enable
+ * These field informs if USB2 PHY interface is implemented:
+ * 0x0 - interface NOT implemented,
+ * 0x1 - interface implemented
+ */
+#define USB_CAP1_U2PHY_EN(p)	((p) & BIT(24))
+/*
+ * USB2 PHY Interface type
+ * These field reflects type of USB2 PHY interface implemented:
+ * 0x0 - UTMI,
+ * 0x1 - ULPI
+ */
+#define DEV_U2PHY_ULPI(p)	((p) & BIT(25))
+/*
+ * USB2 PHY Interface width
+ * These field reflects width of USB2 PHY interface implemented:
+ * 0x0 - 8 bit interface,
+ * 0x1 - 16 bit interface,
+ * Note: The ULPI interface is always 8bit wide.
+ */
+#define DEV_U2PHY_WIDTH_16(p)	((p) & BIT(26))
+/*
+ * OTG Ready
+ * 0x0 - pure device mode
+ * 0x1 - some features and ports for CDNS USB OTG controller are implemented.
+ */
+#define USB_CAP1_OTG_READY(p)	((p) & BIT(27))
+
+/*
+ * When set, indicates that controller supports automatic internal TDL
+ * calculation basing on the size provided in TRB (TRB[22:17]) for DMULT mode
+ * Supported only for DEV_VER_V2 controller version.
+ */
+#define USB_CAP1_TDL_FROM_TRB(p)	((p) & BIT(28))
+
+/* USB_CAP2- bitmasks */
+/*
+ * The actual size of the connected On-chip RAM memory in kB:
+ * - 0 means 256 kB (max supported mem size)
+ * - value other than 0 reflects the mem size in kB
+ */
+#define USB_CAP2_ACTUAL_MEM_SIZE(p) ((p) & GENMASK(7, 0))
+/*
+ * Max supported mem size
+ * These field reflects width of on-chip RAM address bus width,
+ * which determines max supported mem size:
+ * 0x0-0x7 - reserved,
+ * 0x8 - support for 4kB mem,
+ * 0x9 - support for 8kB mem,
+ * 0xA - support for 16kB mem,
+ * 0xB - support for 32kB mem,
+ * 0xC - support for 64kB mem,
+ * 0xD - support for 128kB mem,
+ * 0xE - support for 256kB mem,
+ * 0xF - reserved
+ */
+#define USB_CAP2_MAX_MEM_SIZE(p) ((p) & GENMASK(11, 8))
+
+/* USB_CAP3- bitmasks */
+#define EP_IS_IMPLEMENTED(reg, index) ((reg) & (1 << (index)))
+
+/* USB_CAP4- bitmasks */
+#define EP_SUPPORT_ISO(reg, index) ((reg) & (1 << (index)))
+
+/* USB_CAP5- bitmasks */
+#define EP_SUPPORT_STREAM(reg, index) ((reg) & (1 << (index)))
+
+/* USB_CAP6- bitmasks */
+/* The USBSS-DEV Controller  Internal build number. */
+#define GET_DEV_BASE_VERSION(p) ((p) & GENMASK(23, 0))
+/* The USBSS-DEV Controller version number. */
+#define GET_DEV_CUSTOM_VERSION(p) ((p) & GENMASK(31, 24))
+
+#define DEV_VER_NXP_V1		0x00024502
+#define DEV_VER_TI_V1		0x00024509
+#define DEV_VER_V2		0x0002450C
+#define DEV_VER_V3		0x0002450d
+
+/* DBG_LINK1- bitmasks */
+/*
+ * LFPS_MIN_DET_U1_EXIT value This parameter configures the minimum
+ * time required for decoding the received LFPS as an LFPS.U1_Exit.
+ */
+#define DBG_LINK1_LFPS_MIN_DET_U1_EXIT(p)	((p) & GENMASK(7, 0))
+/*
+ * LFPS_MIN_GEN_U1_EXIT value This parameter configures the minimum time for
+ * phytxelecidle deassertion when LFPS.U1_Exit
+ */
+#define DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_MASK	GENMASK(15, 8)
+#define DBG_LINK1_LFPS_MIN_GEN_U1_EXIT(p)	(((p) << 8) & GENMASK(15, 8))
+/*
+ * RXDET_BREAK_DIS value This parameter configures terminating the Far-end
+ * Receiver termination detection sequence:
+ * 0: it is possible that USBSS_DEV will terminate Farend receiver
+ *    termination detection sequence
+ * 1: USBSS_DEV will not terminate Far-end receiver termination
+ *    detection sequence
+ */
+#define DBG_LINK1_RXDET_BREAK_DIS		BIT(16)
+/* LFPS_GEN_PING value This parameter configures the LFPS.Ping generation */
+#define DBG_LINK1_LFPS_GEN_PING(p)		(((p) << 17) & GENMASK(21, 17))
+/*
+ * Set the LFPS_MIN_DET_U1_EXIT value Writing '1' to this bit writes the
+ * LFPS_MIN_DET_U1_EXIT field value to the device. This bit is automatically
+ * cleared. Writing '0' has no effect
+ */
+#define DBG_LINK1_LFPS_MIN_DET_U1_EXIT_SET	BIT(24)
+/*
+ * Set the LFPS_MIN_GEN_U1_EXIT value. Writing '1' to this bit writes the
+ * LFPS_MIN_GEN_U1_EXIT field value to the device. This bit is automatically
+ * cleared. Writing '0' has no effect
+ */
+#define DBG_LINK1_LFPS_MIN_GEN_U1_EXIT_SET	BIT(25)
+/*
+ * Set the RXDET_BREAK_DIS value Writing '1' to this bit writes
+ * the RXDET_BREAK_DIS field value to the device. This bit is automatically
+ * cleared. Writing '0' has no effect
+ */
+#define DBG_LINK1_RXDET_BREAK_DIS_SET		BIT(26)
+/*
+ * Set the LFPS_GEN_PING_SET value Writing '1' to this bit writes
+ * the LFPS_GEN_PING field value to the device. This bit is automatically
+ * cleared. Writing '0' has no effect."
+ */
+#define DBG_LINK1_LFPS_GEN_PING_SET		BIT(27)
+
+/* DMA_AXI_CTRL- bitmasks */
+/* The mawprot pin configuration. */
+#define DMA_AXI_CTRL_MARPROT(p) ((p) & GENMASK(2, 0))
+/* The marprot pin configuration. */
+#define DMA_AXI_CTRL_MAWPROT(p) (((p) < 16) & GENMASK(18, 16))
+#define DMA_AXI_CTRL_NON_SECURE 0x02
+
+#define gadget_to_cdns3_device(g) (container_of(g, struct cdns3_device, gadget))
+
+#define ep_to_cdns3_ep(ep) (container_of(ep, struct cdns3_endpoint, endpoint))
+
+/*-------------------------------------------------------------------------*/
+/*
+ * USBSS-DEV DMA interface.
+ */
+#define TRBS_PER_SEGMENT	40
+
+#define ISO_MAX_INTERVAL	10
+
+#if TRBS_PER_SEGMENT < 2
+#error "Incorrect TRBS_PER_SEGMENT. Minimal Transfer Ring size is 2."
+#endif
+
+/*
+ *Only for ISOC endpoints - maximum number of TRBs is calculated as
+ * pow(2, bInterval-1) * number of usb requests. It is limitation made by
+ * driver to save memory. Controller must prepare TRB for each ITP even
+ * if bInterval > 1. It's the reason why driver needs so many TRBs for
+ * isochronous endpoints.
+ */
+#define TRBS_PER_ISOC_SEGMENT	(ISO_MAX_INTERVAL * 8)
+
+#define GET_TRBS_PER_SEGMENT(ep_type) ((ep_type) == USB_ENDPOINT_XFER_ISOC ? \
+				      TRBS_PER_ISOC_SEGMENT : TRBS_PER_SEGMENT)
+/**
+ * struct cdns3_trb - represent Transfer Descriptor block.
+ * @buffer:	pointer to buffer data
+ * @length:	length of data
+ * @control:	control flags.
+ *
+ * This structure describes transfer block serviced by DMA module.
+ */
+struct cdns3_trb {
+	__le32 buffer;
+	__le32 length;
+	__le32 control;
+};
+
+#define TRB_SIZE		(sizeof(struct cdns3_trb))
+#define TRB_RING_SIZE		(TRB_SIZE * TRBS_PER_SEGMENT)
+#define TRB_ISO_RING_SIZE	(TRB_SIZE * TRBS_PER_ISOC_SEGMENT)
+#define TRB_CTRL_RING_SIZE	(TRB_SIZE * 2)
+
+/* TRB bit mask */
+#define TRB_TYPE_BITMASK	GENMASK(15, 10)
+#define TRB_TYPE(p)		((p) << 10)
+#define TRB_FIELD_TO_TYPE(p)	(((p) & TRB_TYPE_BITMASK) >> 10)
+
+/* TRB type IDs */
+/* bulk, interrupt, isoc , and control data stage */
+#define TRB_NORMAL		1
+/* TRB for linking ring segments */
+#define TRB_LINK		6
+
+/* Cycle bit - indicates TRB ownership by driver or hw*/
+#define TRB_CYCLE		BIT(0)
+/*
+ * When set to '1', the device will toggle its interpretation of the Cycle bit
+ */
+#define TRB_TOGGLE		BIT(1)
+
+/*
+ * Short Packet (SP). OUT EPs at DMULT=1 only. Indicates if the TRB was
+ * processed while USB short packet was received. No more buffers defined by
+ * the TD will be used. DMA will automatically advance to next TD.
+ * - Shall be set to 0 by Software when putting TRB on the Transfer Ring
+ * - Shall be set to 1 by Controller when Short Packet condition for this TRB
+ *   is detected independent if ISP is set or not.
+ */
+#define TRB_SP			BIT(1)
+
+/* Interrupt on short packet*/
+#define TRB_ISP			BIT(2)
+/*Setting this bit enables FIFO DMA operation mode*/
+#define TRB_FIFO_MODE		BIT(3)
+/* Set PCIe no snoop attribute */
+#define TRB_CHAIN		BIT(4)
+/* Interrupt on completion */
+#define TRB_IOC			BIT(5)
+
+/* stream ID bitmasks. */
+#define TRB_STREAM_ID(p)	((p) & GENMASK(31, 16))
+
+/* Size of TD expressed in USB packets for HS/FS mode. */
+#define TRB_TDL_HS_SIZE(p)	(((p) << 16) & GENMASK(31, 16))
+#define TRB_TDL_HS_SIZE_GET(p)	(((p) & GENMASK(31, 16)) >> 16)
+
+/* transfer_len bitmasks. */
+#define TRB_LEN(p)		((p) & GENMASK(16, 0))
+
+/* Size of TD expressed in USB packets for SS mode. */
+#define TRB_TDL_SS_SIZE(p)	(((p) << 17) & GENMASK(23, 17))
+#define TRB_TDL_SS_SIZE_GET(p)	(((p) & GENMASK(23, 17)) >> 17)
+
+/* transfer_len bitmasks - bits 31:24 */
+#define TRB_BURST_LEN(p)	(((p) << 24) & GENMASK(31, 24))
+#define TRB_BURST_LEN_GET(p)	(((p) & GENMASK(31, 24)) >> 24)
+
+/* Data buffer pointer bitmasks*/
+#define TRB_BUFFER(p)		((p) & GENMASK(31, 0))
+
+/*-------------------------------------------------------------------------*/
+/* Driver numeric constants */
+
+/* Such declaration should be added to ch9.h */
+#define USB_DEVICE_MAX_ADDRESS		127
+
+/* Endpoint init values */
+#define CDNS3_EP_MAX_PACKET_LIMIT	1024
+#define CDNS3_EP_MAX_STREAMS		15
+#define CDNS3_EP0_MAX_PACKET_LIMIT	512
+
+/* All endpoints including EP0 */
+#define CDNS3_ENDPOINTS_MAX_COUNT	32
+#define CDNS3_EP_ZLP_BUF_SIZE		1024
+
+#define CDNS3_EP_BUF_SIZE		2	/* KB */
+#define CDNS3_EP_ISO_HS_MULT		3
+#define CDNS3_EP_ISO_SS_BURST		3
+#define CDNS3_MAX_NUM_DESCMISS_BUF	32
+#define CDNS3_DESCMIS_BUF_SIZE		2048	/* Bytes */
+/*-------------------------------------------------------------------------*/
+/* Used structs */
+
+struct cdns3_device;
+
+/**
+ * struct cdns3_endpoint - extended device side representation of USB endpoint.
+ * @endpoint: usb endpoint
+ * @pending_req_list: list of requests queuing on transfer ring.
+ * @deferred_req_list: list of requests waiting for queuing on transfer ring.
+ * @trb_pool: transfer ring - array of transaction buffers
+ * @trb_pool_dma: dma address of transfer ring
+ * @cdns3_dev: device associated with this endpoint
+ * @name: a human readable name e.g. ep1out
+ * @flags: specify the current state of endpoint
+ * @dir: endpoint direction
+ * @num: endpoint number (1 - 15)
+ * @type: set to bmAttributes & USB_ENDPOINT_XFERTYPE_MASK
+ * @interval: interval between packets used for ISOC endpoint.
+ * @free_trbs: number of free TRBs in transfer ring
+ * @num_trbs: number of all TRBs in transfer ring
+ * @pcs: producer cycle state
+ * @ccs: consumer cycle state
+ * @enqueue: enqueue index in transfer ring
+ * @dequeue: dequeue index in transfer ring
+ * @trb_burst_size: number of burst used in trb.
+ */
+struct cdns3_endpoint {
+	struct usb_ep		endpoint;
+	struct list_head	pending_req_list;
+	struct list_head	deferred_req_list;
+
+	struct cdns3_trb	*trb_pool;
+	dma_addr_t		trb_pool_dma;
+
+	struct cdns3_device	*cdns3_dev;
+	char			name[20];
+
+#define EP_ENABLED		BIT(0)
+#define EP_STALL		BIT(1)
+#define EP_WEDGE		BIT(2)
+#define EP_TRANSFER_STARTED	BIT(3)
+#define EP_UPDATE_EP_TRBADDR	BIT(4)
+#define EP_PENDING_REQUEST	BIT(5)
+#define EP_RING_FULL		BIT(6)
+#define EP_CLAIMED		BIT(7)
+#define EP_DEFERRED_DRDY	BIT(8)
+#define EP_QUIRK_ISO_OUT_EN	BIT(9)
+	u32			flags;
+
+	u8			dir;
+	u8			num;
+	u8			type;
+	int			interval;
+
+	int			free_trbs;
+	int			num_trbs;
+	u8			pcs;
+	u8			ccs;
+	int			enqueue;
+	int			dequeue;
+	u8			trb_burst_size;
+
+	unsigned int		wa1_set:1;
+	struct cdns3_trb	*wa1_trb;
+	unsigned int		wa1_trb_index;
+	unsigned int		wa1_cycle_bit:1;
+};
+
+/**
+ * struct cdns3_aligned_buf - represent aligned buffer used for DMA transfer
+ * @buf: aligned to 8 bytes data buffer. Buffer address used in
+ *       TRB shall be aligned to 8.
+ * @dma: dma address
+ * @size: size of buffer
+ * @in_use: inform if this buffer is associated with usb_request
+ * @list: used to adding instance of this object to list
+ */
+struct cdns3_aligned_buf {
+	void			*buf;
+	dma_addr_t		dma;
+	u32			size;
+	int			in_use:1;
+	struct list_head	list;
+};
+
+/**
+ * struct cdns3_request - extended device side representation of usb_request
+ *                        object .
+ * @request: generic usb_request object describing single I/O request.
+ * @priv_ep: extended representation of usb_ep object
+ * @trb: the first TRB association with this request
+ * @start_trb: number of the first TRB in transfer ring
+ * @end_trb: number of the last TRB in transfer ring
+ * @aligned_buf: object holds information about aligned buffer associated whit
+ *               this endpoint
+ * @flags: flag specifying special usage of request
+ */
+struct cdns3_request {
+	struct usb_request		request;
+	struct cdns3_endpoint		*priv_ep;
+	struct cdns3_trb		*trb;
+	int				start_trb;
+	int				end_trb;
+	struct cdns3_aligned_buf	*aligned_buf;
+#define REQUEST_PENDING			BIT(0)
+#define REQUEST_INTERNAL		BIT(1)
+#define REQUEST_INTERNAL_CH		BIT(2)
+#define REQUEST_ZLP			BIT(3)
+#define REQUEST_UNALIGNED		BIT(4)
+	u32				flags;
+	struct list_head		list;
+};
+
+#define to_cdns3_request(r) (container_of(r, struct cdns3_request, request))
+
+/*Stages used during enumeration process.*/
+#define CDNS3_SETUP_STAGE		0x0
+#define CDNS3_DATA_STAGE		0x1
+#define CDNS3_STATUS_STAGE		0x2
+
+/**
+ * struct cdns3_device - represent USB device.
+ * @dev: pointer to device structure associated whit this controller
+ * @sysdev: pointer to the DMA capable device
+ * @gadget: device side representation of the peripheral controller
+ * @gadget_driver: pointer to the gadget driver
+ * @dev_ver: device controller version.
+ * @lock: for synchronizing
+ * @regs: base address for device side registers
+ * @setup_buf: used while processing usb control requests
+ * @setup_dma: dma address for setup_buf
+ * @zlp_buf - zlp buffer
+ * @ep0_stage: ep0 stage during enumeration process.
+ * @ep0_data_dir: direction for control transfer
+ * @eps: array of pointers to all endpoints with exclusion ep0
+ * @aligned_buf_list: list of aligned buffers internally allocated by driver
+ * @run_garbage_collector: infroms that at least one element of aligned_buf_list
+ *                        can be freed
+ * @selected_ep: actually selected endpoint. It's used only to improve
+ *               performance.
+ * @isoch_delay: value from Set Isoch Delay request. Only valid on SS/SSP.
+ * @u1_allowed: allow device transition to u1 state
+ * @u2_allowed: allow device transition to u2 state
+ * @is_selfpowered: device is self powered
+ * @setup_pending: setup packet is processing by gadget driver
+ * @hw_configured_flag: hardware endpoint configuration was set.
+ * @wake_up_flag: allow device to remote up the host
+ * @status_completion_no_call: indicate that driver is waiting for status s
+ *     stage completion. It's used in deferred SET_CONFIGURATION request.
+ * @onchip_buffers: number of available on-chip buffers.
+ * @onchip_used_size: actual size of on-chip memory assigned to endpoints.
+ * @pending_status_wq: workqueue handling status stage for deferred requests.
+ * @shadow_ep_en: hold information about endpoints that will be enabled
+ *     in soft irq.
+ * @pending_status_request: request for which status stage was deferred
+ */
+struct cdns3_device {
+	struct device			*dev;
+	struct device			*sysdev;
+
+	struct usb_gadget		gadget;
+	struct usb_gadget_driver	*gadget_driver;
+
+#define CDNS_REVISION_V0		0x00024501
+#define CDNS_REVISION_V1		0x00024509
+	u32				dev_ver;
+
+	/* generic spin-lock for drivers */
+	spinlock_t			lock;
+
+	struct cdns3_usb_regs		__iomem *regs;
+
+	struct usb_ctrlrequest		*setup_buf;
+	dma_addr_t			setup_dma;
+	void				*zlp_buf;
+
+	u8				ep0_stage;
+	int				ep0_data_dir;
+
+	struct cdns3_endpoint		*eps[CDNS3_ENDPOINTS_MAX_COUNT];
+
+	struct list_head		aligned_buf_list;
+	unsigned			run_garbage_collector:1;
+
+	u32				selected_ep;
+	u16				isoch_delay;
+
+	unsigned			wait_for_setup:1;
+	unsigned			u1_allowed:1;
+	unsigned			u2_allowed:1;
+	unsigned			is_selfpowered:1;
+	unsigned			setup_pending:1;
+	int				hw_configured_flag:1;
+	int				wake_up_flag:1;
+	unsigned			status_completion_no_call:1;
+	int				out_mem_is_allocated;
+
+	struct work_struct		pending_status_wq;
+	struct usb_request		*pending_status_request;
+	u32				shadow_ep_en;
+	/*in KB */
+	u16				onchip_buffers;
+	u16				onchip_used_size;
+};
+
+void cdns3_set_register_bit(void __iomem *ptr, u32 mask);
+dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
+				 struct cdns3_trb *trb);
+enum usb_device_speed cdns3_get_speed(struct cdns3_device *priv_dev);
+void cdns3_pending_setup_status_handler(struct work_struct *work);
+void cdns3_hw_reset_eps_config(struct cdns3_device *priv_dev);
+void cdns3_set_hw_configuration(struct cdns3_device *priv_dev);
+void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep);
+void cdns3_allow_enable_l1(struct cdns3_device *priv_dev, int enable);
+struct usb_request *cdns3_next_request(struct list_head *list);
+int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
+			  struct usb_request *request);
+void cdns3_rearm_transfer(struct cdns3_endpoint *priv_ep, u8 rearm);
+int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep);
+u8 cdns3_ep_addr_to_index(u8 ep_addr);
+int cdns3_gadget_ep_set_wedge(struct usb_ep *ep);
+int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value);
+struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
+						  gfp_t gfp_flags);
+void cdns3_gadget_ep_free_request(struct usb_ep *ep,
+				  struct usb_request *request);
+int cdns3_gadget_ep_dequeue(struct usb_ep *ep, struct usb_request *request);
+void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
+			   struct cdns3_request *priv_req,
+			   int status);
+
+int cdns3_init_ep0(struct cdns3_device *priv_dev,
+		   struct cdns3_endpoint *priv_ep);
+void cdns3_ep0_config(struct cdns3_device *priv_dev);
+void cdns3_ep_config(struct cdns3_endpoint *priv_ep);
+void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, int dir);
+int __cdns3_gadget_wakeup(struct cdns3_device *priv_dev);
+
+#endif /* __LINUX_CDNS3_GADGET */
diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
new file mode 100644
index 000000000000..b498a170b7e8
--- /dev/null
+++ b/drivers/usb/cdns3/host-export.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence USBSS DRD Driver - Host Export APIs
+ *
+ * Copyright (C) 2017-2018 NXP
+ *
+ * Authors: Peter Chen <peter.chen@nxp.com>
+ */
+#ifndef __LINUX_CDNS3_HOST_EXPORT
+#define __LINUX_CDNS3_HOST_EXPORT
+
+#ifdef CONFIG_USB_CDNS3_HOST
+
+int cdns3_host_init(struct cdns3 *cdns);
+void cdns3_host_exit(struct cdns3 *cdns);
+
+#else
+
+static inline int cdns3_host_init(struct cdns3 *cdns)
+{
+	return -ENXIO;
+}
+
+static inline void cdns3_host_exit(struct cdns3 *cdns) { }
+
+#endif /* CONFIG_USB_CDNS3_HOST */
+
+#endif /* __LINUX_CDNS3_HOST_EXPORT */
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
new file mode 100644
index 000000000000..a7629ab2c20c
--- /dev/null
+++ b/drivers/usb/cdns3/host.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver - host side
+ *
+ * Copyright (C) 2018-2019 Cadence Design Systems.
+ * Copyright (C) 2017-2018 NXP
+ *
+ * Authors: Peter Chen <peter.chen@nxp.com>
+ *          Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include <linux/platform_device.h>
+#include "core.h"
+#include "drd.h"
+
+static int __cdns3_host_init(struct cdns3 *cdns)
+{
+	struct platform_device *xhci;
+	int ret;
+
+	xhci = platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
+	if (!xhci) {
+		dev_err(cdns->dev, "couldn't allocate xHCI device\n");
+		return -ENOMEM;
+	}
+
+	xhci->dev.parent = cdns->dev;
+	cdns->host_dev = xhci;
+
+	ret = platform_device_add_resources(xhci, cdns->xhci_res,
+					    CDNS3_XHCI_RESOURCES_NUM);
+	if (ret) {
+		dev_err(cdns->dev, "couldn't add resources to xHCI device\n");
+		goto err1;
+	}
+
+	ret = platform_device_add(xhci);
+	if (ret) {
+		dev_err(cdns->dev, "failed to register xHCI device\n");
+		goto err1;
+	}
+
+	return 0;
+err1:
+	platform_device_put(xhci);
+	return ret;
+}
+
+static void cdns3_host_exit(struct cdns3 *cdns)
+{
+	platform_device_unregister(cdns->host_dev);
+	cdns->host_dev = NULL;
+}
+
+int cdns3_host_init(struct cdns3 *cdns)
+{
+	struct cdns3_role_driver *rdrv;
+
+	rdrv = devm_kzalloc(cdns->dev, sizeof(*rdrv), GFP_KERNEL);
+	if (!rdrv)
+		return -ENOMEM;
+
+	rdrv->start	= __cdns3_host_init;
+	rdrv->stop	= cdns3_host_exit;
+	rdrv->state	= CDNS3_ROLE_STATE_INACTIVE;
+	rdrv->name	= "host";
+
+	cdns->roles[USB_ROLE_HOST] = rdrv;
+
+	return 0;
+}
diff --git a/drivers/usb/cdns3/trace.c b/drivers/usb/cdns3/trace.c
new file mode 100644
index 000000000000..459fa72d9c74
--- /dev/null
+++ b/drivers/usb/cdns3/trace.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USBSS device controller driver Trace Support
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/usb/cdns3/trace.h b/drivers/usb/cdns3/trace.h
new file mode 100644
index 000000000000..725dcfa65f2b
--- /dev/null
+++ b/drivers/usb/cdns3/trace.h
@@ -0,0 +1,493 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * USBSS device controller driver.
+ * Trace support header file.
+ *
+ * Copyright (C) 2018-2019 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM cdns3
+
+#if !defined(__LINUX_CDNS3_TRACE) || defined(TRACE_HEADER_MULTI_READ)
+#define __LINUX_CDNS3_TRACE
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+#include <asm/byteorder.h>
+#include <linux/usb/ch9.h>
+#include "core.h"
+#include "gadget.h"
+#include "debug.h"
+
+#define CDNS3_MSG_MAX	500
+
+TRACE_EVENT(cdns3_halt,
+	TP_PROTO(struct cdns3_endpoint *ep_priv, u8 halt, u8 flush),
+	TP_ARGS(ep_priv, halt, flush),
+	TP_STRUCT__entry(
+		__string(name, ep_priv->name)
+		__field(u8, halt)
+		__field(u8, flush)
+	),
+	TP_fast_assign(
+		__assign_str(name, ep_priv->name);
+		__entry->halt = halt;
+		__entry->flush = flush;
+	),
+	TP_printk("Halt %s for %s: %s", __entry->flush ? " and flush" : "",
+		  __get_str(name), __entry->halt ? "set" : "cleared")
+);
+
+TRACE_EVENT(cdns3_wa1,
+	TP_PROTO(struct cdns3_endpoint *ep_priv, char *msg),
+	TP_ARGS(ep_priv, msg),
+	TP_STRUCT__entry(
+		__string(ep_name, ep_priv->name)
+		__string(msg, msg)
+	),
+	TP_fast_assign(
+		__assign_str(ep_name, ep_priv->name);
+		__assign_str(msg, msg);
+	),
+	TP_printk("WA1: %s %s", __get_str(ep_name), __get_str(msg))
+);
+
+TRACE_EVENT(cdns3_wa2,
+	TP_PROTO(struct cdns3_endpoint *ep_priv, char *msg),
+	TP_ARGS(ep_priv, msg),
+	TP_STRUCT__entry(
+		__string(ep_name, ep_priv->name)
+		__string(msg, msg)
+	),
+	TP_fast_assign(
+		__assign_str(ep_name, ep_priv->name);
+		__assign_str(msg, msg);
+	),
+	TP_printk("WA2: %s %s", __get_str(ep_name), __get_str(msg))
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_doorbell,
+	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
+	TP_ARGS(ep_name, ep_trbaddr),
+	TP_STRUCT__entry(
+		__string(name, ep_name)
+		__field(u32, ep_trbaddr)
+	),
+	TP_fast_assign(
+		__assign_str(name, ep_name);
+		__entry->ep_trbaddr = ep_trbaddr;
+	),
+	TP_printk("%s, ep_trbaddr %08x", __get_str(name),
+		  __entry->ep_trbaddr)
+);
+
+DEFINE_EVENT(cdns3_log_doorbell, cdns3_doorbell_ep0,
+	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
+	TP_ARGS(ep_name, ep_trbaddr)
+);
+
+DEFINE_EVENT(cdns3_log_doorbell, cdns3_doorbell_epx,
+	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
+	TP_ARGS(ep_name, ep_trbaddr)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_usb_irq,
+	TP_PROTO(struct cdns3_device *priv_dev, u32 usb_ists),
+	TP_ARGS(priv_dev, usb_ists),
+	TP_STRUCT__entry(
+		__field(enum usb_device_speed, speed)
+		__field(u32, usb_ists)
+		__dynamic_array(char, str, CDNS3_MSG_MAX)
+	),
+	TP_fast_assign(
+		__entry->speed = cdns3_get_speed(priv_dev);
+		__entry->usb_ists = usb_ists;
+	),
+	TP_printk("%s", cdns3_decode_usb_irq(__get_str(str), __entry->speed,
+					     __entry->usb_ists))
+);
+
+DEFINE_EVENT(cdns3_log_usb_irq, cdns3_usb_irq,
+	TP_PROTO(struct cdns3_device *priv_dev, u32 usb_ists),
+	TP_ARGS(priv_dev, usb_ists)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_epx_irq,
+	TP_PROTO(struct cdns3_device *priv_dev, struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_dev, priv_ep),
+	TP_STRUCT__entry(
+		__string(ep_name, priv_ep->name)
+		__field(u32, ep_sts)
+		__field(u32, ep_traddr)
+		__dynamic_array(char, str, CDNS3_MSG_MAX)
+	),
+	TP_fast_assign(
+		__assign_str(ep_name, priv_ep->name);
+		__entry->ep_sts = readl(&priv_dev->regs->ep_sts);
+		__entry->ep_traddr = readl(&priv_dev->regs->ep_traddr);
+	),
+	TP_printk("%s, ep_traddr: %08x",
+		  cdns3_decode_epx_irq(__get_str(str),
+				       __get_str(ep_name),
+				       __entry->ep_sts),
+		  __entry->ep_traddr)
+);
+
+DEFINE_EVENT(cdns3_log_epx_irq, cdns3_epx_irq,
+	TP_PROTO(struct cdns3_device *priv_dev, struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_dev, priv_ep)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_ep0_irq,
+	TP_PROTO(struct cdns3_device *priv_dev,  u32 ep_sts),
+	TP_ARGS(priv_dev, ep_sts),
+	TP_STRUCT__entry(
+		__field(int, ep_dir)
+		__field(u32, ep_sts)
+		__dynamic_array(char, str, CDNS3_MSG_MAX)
+	),
+	TP_fast_assign(
+		__entry->ep_dir = priv_dev->ep0_data_dir;
+		__entry->ep_sts = ep_sts;
+	),
+	TP_printk("%s", cdns3_decode_ep0_irq(__get_str(str),
+					     __entry->ep_dir,
+					     __entry->ep_sts))
+);
+
+DEFINE_EVENT(cdns3_log_ep0_irq, cdns3_ep0_irq,
+	TP_PROTO(struct cdns3_device *priv_dev, u32 ep_sts),
+	TP_ARGS(priv_dev, ep_sts)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_ctrl,
+	TP_PROTO(struct usb_ctrlrequest *ctrl),
+	TP_ARGS(ctrl),
+	TP_STRUCT__entry(
+		__field(u8, bRequestType)
+		__field(u8, bRequest)
+		__field(u16, wValue)
+		__field(u16, wIndex)
+		__field(u16, wLength)
+		__dynamic_array(char, str, CDNS3_MSG_MAX)
+	),
+	TP_fast_assign(
+		__entry->bRequestType = ctrl->bRequestType;
+		__entry->bRequest = ctrl->bRequest;
+		__entry->wValue = le16_to_cpu(ctrl->wValue);
+		__entry->wIndex = le16_to_cpu(ctrl->wIndex);
+		__entry->wLength = le16_to_cpu(ctrl->wLength);
+	),
+	TP_printk("%s", usb_decode_ctrl(__get_str(str), CDNS3_MSG_MAX,
+					__entry->bRequestType,
+					__entry->bRequest, __entry->wValue,
+					__entry->wIndex, __entry->wLength)
+	)
+);
+
+DEFINE_EVENT(cdns3_log_ctrl, cdns3_ctrl_req,
+	TP_PROTO(struct usb_ctrlrequest *ctrl),
+	TP_ARGS(ctrl)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_request,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req),
+	TP_STRUCT__entry(
+		__string(name, req->priv_ep->name)
+		__field(struct cdns3_request *, req)
+		__field(void *, buf)
+		__field(unsigned int, actual)
+		__field(unsigned int, length)
+		__field(int, status)
+		__field(int, zero)
+		__field(int, short_not_ok)
+		__field(int, no_interrupt)
+		__field(int, start_trb)
+		__field(int, end_trb)
+		__field(struct cdns3_trb *, start_trb_addr)
+		__field(int, flags)
+	),
+	TP_fast_assign(
+		__assign_str(name, req->priv_ep->name);
+		__entry->req = req;
+		__entry->buf = req->request.buf;
+		__entry->actual = req->request.actual;
+		__entry->length = req->request.length;
+		__entry->status = req->request.status;
+		__entry->zero = req->request.zero;
+		__entry->short_not_ok = req->request.short_not_ok;
+		__entry->no_interrupt = req->request.no_interrupt;
+		__entry->start_trb = req->start_trb;
+		__entry->end_trb = req->end_trb;
+		__entry->start_trb_addr = req->trb;
+		__entry->flags = req->flags;
+	),
+	TP_printk("%s: req: %p, req buff %p, length: %u/%u %s%s%s, status: %d,"
+		  " trb: [start:%d, end:%d: virt addr %pa], flags:%x ",
+		__get_str(name), __entry->req, __entry->buf, __entry->actual,
+		__entry->length,
+		__entry->zero ? "Z" : "z",
+		__entry->short_not_ok ? "S" : "s",
+		__entry->no_interrupt ? "I" : "i",
+		__entry->status,
+		__entry->start_trb,
+		__entry->end_trb,
+		__entry->start_trb_addr,
+		__entry->flags
+	)
+);
+
+DEFINE_EVENT(cdns3_log_request, cdns3_alloc_request,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+DEFINE_EVENT(cdns3_log_request, cdns3_free_request,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+DEFINE_EVENT(cdns3_log_request, cdns3_ep_queue,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+DEFINE_EVENT(cdns3_log_request, cdns3_ep_dequeue,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+DEFINE_EVENT(cdns3_log_request, cdns3_gadget_giveback,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+TRACE_EVENT(cdns3_ep0_queue,
+	TP_PROTO(struct cdns3_device *dev_priv, struct usb_request *request),
+	TP_ARGS(dev_priv, request),
+	TP_STRUCT__entry(
+		__field(int, dir)
+		__field(int, length)
+	),
+	TP_fast_assign(
+		__entry->dir = dev_priv->ep0_data_dir;
+		__entry->length = request->length;
+	),
+	TP_printk("Queue to ep0%s length: %u", __entry->dir ? "in" : "out",
+		  __entry->length)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_aligned_request,
+	TP_PROTO(struct cdns3_request *priv_req),
+	TP_ARGS(priv_req),
+	TP_STRUCT__entry(
+		__string(name, priv_req->priv_ep->name)
+		__field(struct usb_request *, req)
+		__field(void *, buf)
+		__field(dma_addr_t, dma)
+		__field(void *, aligned_buf)
+		__field(dma_addr_t, aligned_dma)
+		__field(u32, aligned_buf_size)
+	),
+	TP_fast_assign(
+		__assign_str(name, priv_req->priv_ep->name);
+		__entry->req = &priv_req->request;
+		__entry->buf = priv_req->request.buf;
+		__entry->dma = priv_req->request.dma;
+		__entry->aligned_buf = priv_req->aligned_buf->buf;
+		__entry->aligned_dma = priv_req->aligned_buf->dma;
+		__entry->aligned_buf_size = priv_req->aligned_buf->size;
+	),
+	TP_printk("%s: req: %p, req buf %p, dma %pad a_buf %p a_dma %pad, size %d",
+		__get_str(name), __entry->req, __entry->buf, &__entry->dma,
+		__entry->aligned_buf, &__entry->aligned_dma,
+		__entry->aligned_buf_size
+	)
+);
+
+DEFINE_EVENT(cdns3_log_aligned_request, cdns3_free_aligned_request,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+DEFINE_EVENT(cdns3_log_aligned_request, cdns3_prepare_aligned_request,
+	TP_PROTO(struct cdns3_request *req),
+	TP_ARGS(req)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_trb,
+	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
+	TP_ARGS(priv_ep, trb),
+	TP_STRUCT__entry(
+		__string(name, priv_ep->name)
+		__field(struct cdns3_trb *, trb)
+		__field(u32, buffer)
+		__field(u32, length)
+		__field(u32, control)
+		__field(u32, type)
+	),
+	TP_fast_assign(
+		__assign_str(name, priv_ep->name);
+		__entry->trb = trb;
+		__entry->buffer = trb->buffer;
+		__entry->length = trb->length;
+		__entry->control = trb->control;
+		__entry->type = usb_endpoint_type(priv_ep->endpoint.desc);
+	),
+	TP_printk("%s: trb %p, dma buf: 0x%08x, size: %ld, burst: %d ctrl: 0x%08x (%s%s%s%s%s%s%s)",
+		__get_str(name), __entry->trb, __entry->buffer,
+		TRB_LEN(__entry->length),
+		(u8)TRB_BURST_LEN_GET(__entry->length),
+		__entry->control,
+		__entry->control & TRB_CYCLE ? "C=1, " : "C=0, ",
+		__entry->control & TRB_TOGGLE ? "T=1, " : "T=0, ",
+		__entry->control & TRB_ISP ? "ISP, " : "",
+		__entry->control & TRB_FIFO_MODE ? "FIFO, " : "",
+		__entry->control & TRB_CHAIN ? "CHAIN, " : "",
+		__entry->control & TRB_IOC ? "IOC, " : "",
+		TRB_FIELD_TO_TYPE(__entry->control) == TRB_NORMAL ? "Normal" : "LINK"
+	)
+);
+
+DEFINE_EVENT(cdns3_log_trb, cdns3_prepare_trb,
+	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
+	TP_ARGS(priv_ep, trb)
+);
+
+DEFINE_EVENT(cdns3_log_trb, cdns3_complete_trb,
+	TP_PROTO(struct cdns3_endpoint *priv_ep, struct cdns3_trb *trb),
+	TP_ARGS(priv_ep, trb)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_ring,
+	TP_PROTO(struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_ep),
+	TP_STRUCT__entry(
+		__dynamic_array(u8, ring, TRB_RING_SIZE)
+		__dynamic_array(u8, priv_ep, sizeof(struct cdns3_endpoint))
+		__dynamic_array(char, buffer,
+				(TRBS_PER_SEGMENT * 65) + CDNS3_MSG_MAX)
+	),
+	TP_fast_assign(
+		memcpy(__get_dynamic_array(priv_ep), priv_ep,
+		       sizeof(struct cdns3_endpoint));
+		memcpy(__get_dynamic_array(ring), priv_ep->trb_pool,
+		       TRB_RING_SIZE);
+	),
+
+	TP_printk("%s",
+		  cdns3_dbg_ring((struct cdns3_endpoint *)__get_str(priv_ep),
+				 (struct cdns3_trb *)__get_str(ring),
+				 __get_str(buffer)))
+);
+
+DEFINE_EVENT(cdns3_log_ring, cdns3_ring,
+	TP_PROTO(struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_ep)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_ep,
+	TP_PROTO(struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_ep),
+	TP_STRUCT__entry(
+		__string(name, priv_ep->name)
+		__field(unsigned int, maxpacket)
+		__field(unsigned int, maxpacket_limit)
+		__field(unsigned int, max_streams)
+		__field(unsigned int, maxburst)
+		__field(unsigned int, flags)
+		__field(unsigned int, dir)
+		__field(u8, enqueue)
+		__field(u8, dequeue)
+	),
+	TP_fast_assign(
+		__assign_str(name, priv_ep->name);
+		__entry->maxpacket = priv_ep->endpoint.maxpacket;
+		__entry->maxpacket_limit = priv_ep->endpoint.maxpacket_limit;
+		__entry->max_streams = priv_ep->endpoint.max_streams;
+		__entry->maxburst = priv_ep->endpoint.maxburst;
+		__entry->flags = priv_ep->flags;
+		__entry->dir = priv_ep->dir;
+		__entry->enqueue = priv_ep->enqueue;
+		__entry->dequeue = priv_ep->dequeue;
+	),
+	TP_printk("%s: mps: %d/%d. streams: %d, burst: %d, enq idx: %d, "
+		  "deq idx: %d, flags %s%s%s%s%s%s%s%s, dir: %s",
+		__get_str(name), __entry->maxpacket,
+		__entry->maxpacket_limit, __entry->max_streams,
+		__entry->maxburst, __entry->enqueue,
+		__entry->dequeue,
+		__entry->flags & EP_ENABLED ? "EN | " : "",
+		__entry->flags & EP_STALL ? "STALL | " : "",
+		__entry->flags & EP_WEDGE ? "WEDGE | " : "",
+		__entry->flags & EP_TRANSFER_STARTED ? "STARTED | " : "",
+		__entry->flags & EP_UPDATE_EP_TRBADDR ? "UPD TRB | " : "",
+		__entry->flags & EP_PENDING_REQUEST ? "REQ PEN | " : "",
+		__entry->flags & EP_RING_FULL ? "RING FULL |" : "",
+		__entry->flags & EP_CLAIMED ?  "CLAIMED " : "",
+		__entry->dir ? "IN" : "OUT"
+	)
+);
+
+DEFINE_EVENT(cdns3_log_ep, cdns3_gadget_ep_enable,
+	TP_PROTO(struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_ep)
+);
+
+DEFINE_EVENT(cdns3_log_ep, cdns3_gadget_ep_disable,
+	TP_PROTO(struct cdns3_endpoint *priv_ep),
+	TP_ARGS(priv_ep)
+);
+
+DECLARE_EVENT_CLASS(cdns3_log_request_handled,
+	TP_PROTO(struct cdns3_request *priv_req, int current_index,
+		 int handled),
+	TP_ARGS(priv_req, current_index, handled),
+	TP_STRUCT__entry(
+		__field(struct cdns3_request *, priv_req)
+		__field(unsigned int, dma_position)
+		__field(unsigned int, handled)
+		__field(unsigned int, dequeue_idx)
+		__field(unsigned int, enqueue_idx)
+		__field(unsigned int, start_trb)
+		__field(unsigned int, end_trb)
+	),
+	TP_fast_assign(
+		__entry->priv_req = priv_req;
+		__entry->dma_position = current_index;
+		__entry->handled = handled;
+		__entry->dequeue_idx = priv_req->priv_ep->dequeue;
+		__entry->enqueue_idx = priv_req->priv_ep->enqueue;
+		__entry->start_trb = priv_req->start_trb;
+		__entry->end_trb = priv_req->end_trb;
+	),
+	TP_printk("Req: %p %s, DMA pos: %d, ep deq: %d, ep enq: %d,"
+		  " start trb: %d, end trb: %d",
+		__entry->priv_req,
+		__entry->handled ? "handled" : "not handled",
+		__entry->dma_position, __entry->dequeue_idx,
+		__entry->enqueue_idx, __entry->start_trb,
+		__entry->end_trb
+	)
+);
+
+DEFINE_EVENT(cdns3_log_request_handled, cdns3_request_handled,
+	TP_PROTO(struct cdns3_request *priv_req, int current_index,
+		 int handled),
+	TP_ARGS(priv_req, current_index, handled)
+);
+#endif /* __LINUX_CDNS3_TRACE */
+
+/* this part must be outside header guard */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
-- 
2.17.1

