Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8251F134B
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbgFHHLL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:11:11 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728956AbgFHHLK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:11:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k16nFP5uBhgSi4tYft3YhVfMsNLvuyhFAzGi+VpdemKD6uMYg/z1+5+4cXT1YQBZ6w5xuLiazSVAbjci+yKDQWOMCQmRTz7lDa2PBrkFYNUZZynmVZcgIJ5srvYV6Dl9cRFC9+Ov/tYNFUHHbi7t2nxtnKzM5KbBohnB0nn9y1qCPgS+5zbBIXo87iv315hQBrmmGRbjlNdV+9AcjoftC9c0AI+k3rCk2dQbMs0xT7nrD4xF7+Pmzm70WcTSKPZvHT9v5oQ34bYBnW3CVXD0Rhyd3vpN7TkAMtr6X2T3UgcbiHULehxhSnkRPc/KBpoHkZz/Ks8KlXKFf9Z0zHFkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=bq22+cBKG7kB9N3Usn7N+GDyhj5kstNUD+a61Hbph7KlRkIqU8mVmPvR5wKXfsTS868Be0PSw2CNUqcriUa8oY1sKpynKHAaQjJzHS2B2ZpYuollvdOiTPr0Y7Qlu4bhb3ADz2dmLnw8eQ5P9u55Id3QdKDUGxk/3K36lbTKnBS7ghhZkCkoHd+W/lDvHLt8UI32wZGCmosKXgiSaq01k5JYHQ4zyMc79QJht/JiQKuhtPPY/ujW2XLnaSuN5dDdDs+E0Y//eiDpNNltUSRMUdETTgDsPc02y5j/rbGowX29i3jyW1kS8vMYJPl7OgaV0AV0ynHA4Eyz1iGpN8t3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=IuuY1x64sIwTvS9Xo0kxWaT5jK/QiOJWY4ixK8gXJ8ewz0a3AfJuSi9jX/XNygqZAUgzgavzv9ogY8AGjisxbZuVnDh9ZpgvPUuweJGOQdaCY2f57BM8BtFLLjOXluOCIozrh7OnjKBG7zFKdf5gWqp0CjYfd1gt7qdDNJDpkR4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:11:05 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:11:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 8/9] usb: cdns3: host: add .suspend_quirk for xhci-plat.c
Date:   Mon,  8 Jun 2020 15:10:51 +0800
Message-Id: <20200608071052.8929-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:11:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d591cec-e6de-4bda-69e5-08d80b7b1c2e
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB687013F53170D4ED563FEB118B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQylDQiE5LkG1UlgF5cBKRCI1sj73e/jukebDtqNMFJtAn3d2xPVRRfuJSZvhROz016s/+o3/ryAgELVqHfuBVgHlDqHVwixtNpS5MR+9WejxVdTwEXCQYVxWPnAlcp0gaEaccEF0RcYbJ+jyg4USzVENpozi9Ea4sJw4B1B+eNYulOQvXsE3kqGVMtUNYECWvgetvmySDMstoxpUv0T9VOa6PyfniXpmicdzuYkmcJBCRfa+Lh6D47pFpCE9Dgmeo0t793smTOVXRx+JYDWccDIJDral06D8BY26V0p8e4KFs9Y0IEZEwPCBdQlfyAX+8sE184wvQ8uzB4W5+fgAWsSP79AwGqtNJ4aqGli+Eu7La6a+14bY1Q6BXmN/6+O
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(15650500001)(4326008)(478600001)(36756003)(52116002)(6666004)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: fQD/3CCiGcKH9u2HqvZc9YvB8/zki8uCMLSh9RyP3rIXx9jU2KnuYF2LQOjbv2JyBBWY4TMo+cFjyscJlFZqNpZd5y1MyHAjKNDzeIIk9y51ER/q1XVbWKDnl0Dn9aQynBorCYat7TBFHaLNBv13hkki1l9ByE3GhwSJ7QJUdMPKNIyxNlrETsRJ6aFDq6sRBNsibEgg6RSJ1hLhAmdpShezuCxq4bB6E0K4VTOnB1/HkmrsWxBgTUAhvi52mbBTzkpL8b39KJo55JwP4E3I1w8Rh6mboprqtne25hT16sPCrfZB4TIGbAG1QZfLshmo+1bYfIG3B6GeVrhEKcV2A9yc6HzpV3gEvvXtMPFRDWi82peEZgC/tzC8D88JNfXfwLEY/BNHM9EYBaMU+IPUMay3qlWD/RyVQRrj58SPp5ymUsPnP+C8YipAxxbb7M2ucjkdKnVvU+uwVGorhD6owudFYmTqsbMBWFxzcw9A5kI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d591cec-e6de-4bda-69e5-08d80b7b1c2e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:11:05.6702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yI2D/wpZuqdyR1nULghIj+nv0nbR0T94mQC5Uczrs+a9fpeemXr0jRe2PY6xHNK/WGLLxFitEZM1Srb44KFUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cdns3 has some special PM sequence between xhci_bus_suspend and
xhci_suspend, add quirk to implement it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host-export.h |  6 +++++
 drivers/usb/cdns3/host.c        | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

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
index b579ef15f4e0..030d6421abd3 100644
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
+#define CFG_RXDET_P3_EN		(1 << 15)
+#define LPM_2_STB_SWITCH_EN	(1 << 25)
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
@@ -56,6 +73,29 @@ static int __cdns3_host_init(struct cdns3 *cdns)
 	return ret;
 }
 
+int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	u32 value;
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

