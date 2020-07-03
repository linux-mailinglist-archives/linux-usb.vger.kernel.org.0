Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999D7213424
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgGCG1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:24 -0400
Received: from mail-eopbgr150052.outbound.protection.outlook.com ([40.107.15.52]:26597
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG1X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myDptRRhvtG7vVr2F9QaKbRmXCYJpxSrXrblY8tlbINTSDbTSzSE9FZxBLKlsa4FzuMTWKxZ0S+NDaa7pHcsUnr/Kwp04o+XKWOt896VZERW+X77fRxblY3tcRF0eJo8Lqg+yA2wGjnSx7Y4scrkJR8pA/aK1vCrdUeZHhYwTkI9yoMfEHHrx/pgggz+wmUFGYPp97Jd4CP1H3uQEFGFsiybbXsLrYgu4Jt7Mc1VfMFrt0DWyCQ3suG857W4mSx4E8Xpys4J0D/VIHyL0ZoxiT4k9nTVN33fhvKGPjPCmx3+aXDd3apWtFi88++Kk2PLkAcyWlxGyDz/eXhBwhHAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=IlOUUEW7tY8U9IOHFduOQf4obrUWf08y/mrnVyMeLnGR77iyjoCgrS0IrhhSY+me0jh+LQh34xkl/Xl5oXQWBavy7tFcle9ijmXIZCFe+LaHHeJ3iIeuYg9KWdjRpItb9/eTkzAMrIS6zFeUSGNjwRC6TME2d6ug2epz9YSl6rmnv5k6eNHk9ZSRVc2PkyROe9Rn2Ixs959984awcmyGiBTNpFwK6m6f0gMFoWV6Zv9zxaF1FLBYLB25fi0MsVJX1EyL5g55PK1k31BKqSXnOQA0+Km+u8Dw62bVpUn55sd/lJqL02+6KGSirbVhWMekZfRbFt2pFxZxi3IbpfvluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=BG2hPIVr0dy4N9m7VeNAJ/oCAOhcJDZ5DBhi357xcnNQQWahD+2KSWFCIZ+e9tfLTG547Pl4kj+UgLZR3t6U5JXitvZStCN6MlmpCWo/WBxGubukL/Osu6HIWpJyUXPEBihUL+AJOVR82T2DFpM2sd7X2KwVN8P90UKFi6PX8lw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:20 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 8/9] usb: cdns3: host: add .suspend_quirk for xhci-plat.c
Date:   Fri,  3 Jul 2020 14:26:52 +0800
Message-Id: <20200703062653.29159-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41abe3d4-024d-44a3-2b57-08d81f1a23a0
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4166EA5914B259C795810A468B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQf0E9Oz9RGakElzHGVHyz2w0fiT7Bp2x2aSRIy/xIk3HTRch88p3vovCSKSCq10Huvh0JGOG07VQhDQwlUFHFG2jhQ6OIadCRFrc/lIqAsbqC8JmHYJSprcrJEGwy9vmIUjCS+JhPsP6F3S6NtfeCbzKJKe3vjcJsOKxN3wCfitkuzbPSOgUVwEULJ/DaKOpqw7vlABcnPOrgBBBQCzEOEhXk1QETj2a0BUXTFd02nMDJE3aGdN/oQ5ZSFbpk8O+deDcTSX48xxxT7qtVGmUHgAyXSQ/isInDuCSO8pqTEJTtVUAj8OGW+vJNRdxKzHgMom5Qs7tfS0ZVJ7BqMQx4d6eGXQnI6cD1YCpmTLwvUBR2LXxKWhEkpodOxe0aR3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(15650500001)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: x/VnTHkqQxzjlfYg9sYFhIHwH6y9BpNyhjF8e2AgMkypAtNHA20FvUuGONngJ95XZBdAG7uW8uVjnKb3jln2xbjpA3qOxtkrDefO6MqINXWSQ66GzUixB/FC5DEry7XbiSTpWkZTsnX+WzabnMpZ3Vn4eSDQcGl8bYISxje1/svhS1UsCkSK3LmspNBAsJyqDK2opelKkchws8DwzLMyNX5MeMacRpRnCnvNsKJJz3RWxsLmMZwtxSaFA/UQ4hqcqq4cwuXE3XWvND4rUCANBzSbf7RhGbauxr+zsFY+ZpWoGEsO8W2szpWDJVWhYuPhquaPvHAy/szMX35FtxWhHuhrbCgr7nfMxHysWKifmyuptf6mDsmEt1gahz8el9os3ebO1fT2sYg6kJLZ37I1yC0PjuL2xv5+A8ez+VXUPdDQnlTiZTBynd4zBWM496i+DjZX8InC0RlDUBRq90BPad8xzDTWz9hnRvTRWajmeFI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41abe3d4-024d-44a3-2b57-08d81f1a23a0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:20.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUYgnMN8YHt6P1ZM+xKXLc5rEIoh6gEmfpMXL63GkHNearQVkj169Clz3NI+oMmc2418tMdojAyxlbLcXgJb6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
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

