Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2CB1DE482
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbgEVKdL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:33:11 -0400
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:22662
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728966AbgEVKdK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:33:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBs5iVtDqCqIj2km69nU1uKm0NCJAebMMSisvkXzaFelyCGmHgSuNScrOEzb9OqHeL8QGh5FAmPIiAE1Gm2VHLQ6GnvPQ4jGw9KoPr73uetMgcFNbkkEKovJt83iN/5ctnc6dn7FGk7zLZQLKFV022zEucDlRd2PqijG5Y68mzJnqBuNAbGCcgIkWB5gzLBOKFdXV1dnE3pyfats/E32Uk8Pk6Q4x/Or26d2NV+jNQbZcOZN+dsG+WTPXjBZVZTG5fOA2kvya4V5DjR/xF1aJkvqZfhOYSK/+B3YmCHeoeickX+JdEA+i7YFrRi5iC5RSBhkOK47EaHyi9szygZuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=nzsM3r4FfhSSTSKjf5LvSu/vDSex7pM5WnK7bQ89cOsd2Kme1xDDPq1cik9NY39x5i6P4WWhy8/rt8E6Nri6n3zjj5UulLldKDkMFmzsWWcacLphsSfcIFjhTOZQRS7PQlJAxjds39vCxx26I5pcAseATMsNllq/o/6YyNeVXs4Jn9dL5o2xv7rBlmDhBcmmQ180ntBtljsQBPbJ0ETpXhxJVuwKIcSgL1VGCQ3UPVLsrce3nutDQ7zhi5mS8sYetcv/dro8m3nKyPm2ok+H4fYuUH26EkQ9YH1NG863n5VPRDoI/AWctAAzurM4H0Ia+o7IyqvbnwgmCobjHI9Vdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=dAYZrklZ21a2RSI04KcSaLDixCh45guszftLefRjIUnWeeae7GT2AQIWmR0Df0a+JjAJgPtWmg4aKPpRXZF+KyEqHrj0/Zk5XanQXQJb3Rxo038FC02jKmJ9SPRfgWrqtAw35Vg6GpQOZ/YysTMknah4LflyFFgb0pl2YoTdohU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 10:33:07 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:33:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 7/8] usb: cdns3: host: add .suspend_quirk for xhci-plat.c
Date:   Fri, 22 May 2020 18:32:55 +0800
Message-Id: <20200522103256.16322-8-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:33:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a75b0ca2-9227-4192-9622-08d7fe3b840a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6984A59647988532B6A1335B8BB40@AM7PR04MB6984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kBx1+MYHTqrjoMZhc72jB/tQtonmzhGg9R6pAd1sA7z0u+7RvBe3ziVjO/wgnoaaLT3UT3KFtz26I58oYLOq8zclhcZdOqWcXnuEVv+LDDDq3qMuWsACf7zHdF52VY7NcXF0vwCxOBo5EMDFD748USVuMGueTUvocwUBmBvt3S9+tt1aC7lTjwPRnIJSAvMVxNWRqDPq32xFMk6Q5HIXaLcjcGTUKh+MOqGg6bNGTx32r4c2W7UI291a3j/aITaiWVTUx5Ad9fpZxSdqplDj25jMJ61+rFA9UT74jlmC4fFEqj+eTalabIC+ww+gVVxp81gMLmhIeN7LD2Uzg7q78o3YuNOXKVBV5Fu4NBUzZb4imrmOWM2t8uNAl9+C6hI4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2616005)(956004)(316002)(16526019)(186003)(2906002)(6486002)(15650500001)(86362001)(52116002)(44832011)(8936002)(5660300002)(6666004)(8676002)(6506007)(6512007)(4326008)(36756003)(26005)(478600001)(66946007)(66556008)(66476007)(1076003)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: w6Vw2jDJTQEzGjekzs7CF+Rei0WiW2UtbnLewQ1jOWwy5g5yG33fej3Cal1U2qwDOpEYhyAPhfmDQ8wav71qGqyVd78mtDT1kyfiO0UvATOZ92OOjDlONfowH7m88KZrHgAKGk1FOYlXnKdfttNl8ZBksyiR2Riz6ZvSbG2NnWI19HSMtXF+Hxi9HtH7h4KxmvdGnA1DSzVRbFAHCZsX4uTxfPBWUYsHqui5O7KZqFUPeCsJ2/MbT0epiyAIi/ACWzlcCRY/SGzGBKLY+YftPaBepvBKuC+Rg3l4urgy2kKgvT5yD6BR/3qdtU9Y1l8NGnGA14o8WC9EMUqyuymtxjNhsjFBhy764n9P8S+m7sIu19FBmph/zfoB7e7zfOSBkj3fNQgjjU9HveA3T9Nusn1E6LLcnGXL2l+ePyoOLTQEMvPeo2U1eL6KFUtnwW5KO+lSkS8hLgJHKOmyQ6t7fvrpqvkUT/HxyTxf9YDBTC0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75b0ca2-9227-4192-9622-08d7fe3b840a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:33:07.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuiTTIZSwViTV7vlQoVXDVT8+pkZ9hFPghUyB7MgRH11GDL1CC7ucPVRr+ODhMkzvMs+pxkKqERF2JiMjZLJEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
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

