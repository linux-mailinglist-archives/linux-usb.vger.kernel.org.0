Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C37295619
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894764AbgJVBkN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:40:13 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:61966
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894744AbgJVBkN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:40:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSk737WEXN+VlcxYRUKTAN8Zv+3WG0JXFPsxaXorZ/XEW/eeSK9byQm+33BaK+L3llwG4/T/s2dFIxz4nzBqvcIBDEJnkebAhK7nw3tzbPXZxJ4K2Rv+tZmxNdyExxa9ZJ0uszIaohO7Zl9576OVBZKhBqbPVbSDIlKVXugu2+ZFBxNOV8jpDG9N+YFFq4fyq43fS5iEWvxSqL6V6zcKc4IeSyMiv26ewHCyRD3L8WhI+oWIL1hvthJNiKaiDa4HVVfg5XG8fMZcKwcL4uNijZSqPZA9rI4bXiGndYHPYTgO7RE5zUEIvdu6XiFFalSTyqduawsamQFgYGlM8bmDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42qBS9GtL6OEhjGN/yM5apQ0BKXt5blygYT63dRgrvI=;
 b=V2NsQEvaW0ttevXjZRdbc3h52gF7Xh5P8Uon3c3PZGq0/VPiUfZsFFP34mpQP4kCttdNx3P/HiFxlgzFFRp49XWRSolnIPtP76P3AouBBauhFkYzeYHBVKHqaItQ+x65zyxgIRoQ3/sgi+O2qBgxRZhv4JBPe8I++d3H8XNKjfNk69+oAMa5bjKvJRxD8qvwwDVFNyTLjhyrKdvIOLO6DYaaJvHvaOQMnJNG1NjQ+NbV+LlORhEu+Z3FUB28RZLREkgoTnfwLrLbYlP3bQzz1VcgryfE1uetQUcrGDyTitrFbLpL08QClJI1U3dZV+hpzZ07oRK30niZkDUZITUM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42qBS9GtL6OEhjGN/yM5apQ0BKXt5blygYT63dRgrvI=;
 b=kAc5yv8N55g+4AKF6NfKRAhpIKyMT8ZdIsudY1bbDQwaNSFvFAOpNhOOpdQOrWe//rFljSfl+yPl55QY66uiYzkMy5/9s/Z8ADmBRW2dTJyOwaPbK8VQci1F+NhItCJHqkKtyf8gAHgcSAEAUSNsPtZksTX4ALkbVOlgEZSt8PA=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 01:40:08 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:40:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/6] usb: cdns3: host: add .suspend_quirk for xhci-plat.c
Date:   Thu, 22 Oct 2020 09:39:26 +0800
Message-Id: <20201022013930.2166-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 01:40:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c295d98f-bd58-4f3f-4986-08d8762b688b
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3539993792786F1BAF3003778B1D0@AM0PR0402MB3539.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zztuF6mWnFLRKdQGHbbZXBpywdTQpjCeJopY5WZGHG78D8vv4mOFokHaXXKF+CsKvTC9uH+IaZz6Qlim7M3RFen6ojUnbD/15U6MC1+l0Ah3XLrKGvpPHJvYcTew6WZv7k/KPQLgdC7PTC3hbmrENWW3XcGuCqd3AaCqr/Qnu3U3TQFpR7UH7FC1jbQifvcNiWm6qvCgIkb7tdnnmvAUnjtacP/BidHEB26r0zo33IBS7DPmwa9ROaE7Oke/3tJXSFDeoTC0TovSSy+P298VgSkESasASJbuY+YbIjhznr4ECJK6oPstDmpHzTQLy9VtvYn8e/L3hoztQ7/4HjpwG2zdE1dzJrvVX7A6/LH7Q6KnGGnEdr56FX3hijFOSs7z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(66946007)(66476007)(478600001)(5660300002)(6506007)(26005)(6512007)(44832011)(6666004)(8936002)(186003)(16526019)(1076003)(86362001)(4326008)(36756003)(52116002)(2616005)(956004)(6486002)(83380400001)(15650500001)(8676002)(316002)(2906002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8G5FqoIUnI+2Q1FkeciwSPlbw+vqHmmmD3BFRbN5V6wlhljt42HRN/HHcqdw3ptCVnTOrlfJksF5LsHa6Cm1jGpdRhPX/obfEz2IRkmM3n9+eB5qd1aF2XbDnGrfGH/Ntw/9zN0nTvVVZz8D0pb1hMuAL6e3Xhp/K5cFMWEGvsdeq850oCnBbUB5ATVIVLp+XmnoaLF6sx11o7HT8bux7GFlja0uWdHt1f99gyAXAR7JJmxYLhOFZttx6KvT81vVvSBnMMubjLigFrDOR+u8KhiDQRJsRceHK0HLETbm0Xynkq1dbMFHpGAl8y74FQ4ZfvfBu4DbVia4JK+aQ8i8Hjsqu1rnm2pCt/ZXHC7iEvHd89hrNJYD6inHHEvMl/uSnwaO1BB9uK31eoMvgwsTI0T9EPjGDR4Qbx7hKd0NQsrrKGsMS2xV/FN4apPpIKgJlonhnXDWC8AJ0YzL2OWQpOdYnlUYBo7wqrEebVjwPz2vxW6Y2wJ5mHCKZagv49AQLHMWrUo4UyKP0PTLjpbpH2ZG4mCgLrSw3OTavd0JqqTK9v4eM52Kw5BFoqsaW72EiwN40c4QNDH5sgI8tVgR4jKGPkJmjgch9TJT3+ODtCccCJOhfnu8DypNYBOR1iuztFjwK9n3Tlh6mKu1aEdfJQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c295d98f-bd58-4f3f-4986-08d8762b688b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:40:08.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kthe0v8v/QaOGOYYaiuZ5/YS67m5EEQh8aG3T1sLpAnBh7symiAylEWS5ZaUCth7esUyjV2PUOZB4L4n67coAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cdns3 has some special PM sequence between xhci_bus_suspend and
xhci_suspend, add quirk to implement it.

Reviewed-by: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host-export.h |  6 +++++
 drivers/usb/cdns3/host.c        | 43 +++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
index ae11810f8826..26041718a086 100644
--- a/drivers/usb/cdns3/host-export.h
+++ b/drivers/usb/cdns3/host-export.h
@@ -9,9 +9,11 @@
 #ifndef __LINUX_CDNS3_HOST_EXPORT
 #define __LINUX_CDNS3_HOST_EXPORT
 
+struct usb_hcd;
 #ifdef CONFIG_USB_CDNS3_HOST
 
 int cdns3_host_init(struct cdns3 *cdns);
+int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
 
 #else
 
@@ -21,6 +23,10 @@ static inline int cdns3_host_init(struct cdns3 *cdns)
 }
 
 static inline void cdns3_host_exit(struct cdns3 *cdns) { }
+static inline int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
+{
+	return 0;
+}
 
 #endif /* CONFIG_USB_CDNS3_HOST */
 
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index b3e2cb69762c..de8da737fa25 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -14,6 +14,18 @@
 #include "drd.h"
 #include "host-export.h"
 #include <linux/usb/hcd.h>
+#include "../host/xhci.h"
+#include "../host/xhci-plat.h"
+
+#define XECP_PORT_CAP_REG	0x8000
+#define XECP_AUX_CTRL_REG1	0x8120
+
+#define CFG_RXDET_P3_EN		BIT(15)
+#define LPM_2_STB_SWITCH_EN	BIT(25)
+
+static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.suspend_quirk = xhci_cdns3_suspend_quirk,
+};
 
 static int __cdns3_host_init(struct cdns3 *cdns)
 {
@@ -39,6 +51,11 @@ static int __cdns3_host_init(struct cdns3 *cdns)
 		goto err1;
 	}
 
+	ret = platform_device_add_data(xhci, &xhci_plat_cdns3_xhci,
+			sizeof(struct xhci_plat_priv));
+	if (ret)
+		goto err1;
+
 	ret = platform_device_add(xhci);
 	if (ret) {
 		dev_err(cdns->dev, "failed to register xHCI device\n");
@@ -56,6 +73,32 @@ static int __cdns3_host_init(struct cdns3 *cdns)
 	return ret;
 }
 
+int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	u32 value;
+
+	if (pm_runtime_status_suspended(hcd->self.controller))
+		return 0;
+
+	/* set usbcmd.EU3S */
+	value = readl(&xhci->op_regs->command);
+	value |= CMD_PM_INDEX;
+	writel(value, &xhci->op_regs->command);
+
+	if (hcd->regs) {
+		value = readl(hcd->regs + XECP_AUX_CTRL_REG1);
+		value |= CFG_RXDET_P3_EN;
+		writel(value, hcd->regs + XECP_AUX_CTRL_REG1);
+
+		value = readl(hcd->regs + XECP_PORT_CAP_REG);
+		value |= LPM_2_STB_SWITCH_EN;
+		writel(value, hcd->regs + XECP_PORT_CAP_REG);
+	}
+
+	return 0;
+}
+
 static void cdns3_host_exit(struct cdns3 *cdns)
 {
 	platform_device_unregister(cdns->host_dev);
-- 
2.17.1

