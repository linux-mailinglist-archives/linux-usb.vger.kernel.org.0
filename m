Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79DB21DFBBD
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388167AbgEWXX1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:27 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388010AbgEWXX1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8/i/iS0E3RQcur+BVSxLA0RnjlBnqD/DIDWP0A+Z7K1rY1Zm/dYpfKlfOJW9I5ugViFzNGlhqhII5MdRVY64xn/VrUdUofEuHyjAXVBeU41iejph4MFG6n8FHAL93dhH0HcJL5P+ercQO9rRdBFfwSZ0qhz1yDn1vzAb40IsgOkYjx1905H/MHh3D/LBCQZ3RKrc3FQS8wShWI4v/st2HYH6UjpxN0NzDYOdLYizGl8FTW5qfeaJaC4NlPxAJqmpnUABQWxDOH1yh+pUWK3Tz/AVUuu3L5ZJWVLZdZVDmXzYFl9bBamoBnXKW5Ai/r8KQbWM9mJFKNJIVo9oqDMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=oX7m29qEXmYAoYWRzxr5AZX2yvPJaYfZ4G0yReudQfVjznK+Xk7xAFl64JaHHj/7gLwfd4FA0oDlUQYx42/A8cLIF0awBwzEDYpY34kcS6z7RI0WGk+z9DAfUS/6IQF7WVhDNxiwCZPHQMdRktw8miG8TYdHg0DhrLNrVoGYHGwDhNqq8ohBB5KDGe6gqUEb4o9nCtdcdI1jbcUmk+/u3V7/L0CvlXyOuhWpK8bxZSffldnenWdIIjQ1eUQ7+W9K7IkIyG0ecD2axXRMviuTUA0OMYWoDmkbOu8LqKlgsBsr62eoU9EFGQcFRyqWCV77bO2eODJ7NRNiPxQq+Y0Wag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=dzvr3MpXrxJOF8vdLT7qfFERWR5FQjdUZQPMUzuQ2x2hDORYN5Unogmlszk4EbZctzrDyfi6cwt4F8NXjQ+u6zbOkZDxxjvwWE9EZyxU/x8mobAFa4CYZ5NaGF+qbG7WCqleg97vpaE0fkBvi+xrSeV65HvGrtm8Vmbl/Y1r0mg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:16 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 8/9] usb: cdns3: host: add .suspend_quirk for xhci-plat.c
Date:   Sun, 24 May 2020 07:23:03 +0800
Message-Id: <20200523232304.23976-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:23:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 480dea07-3ba8-48ca-ce32-08d7ff70455d
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB691816FCFB5DF48A1D4E93D78BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sLbRe3yoDgTkvtbawhekvuW5U4mlXhU9E5TcREjqrtPd/14RhY4Et3eB34y+mM7XIYqV9EvHo4VLk8uyJhc5857UZzUk1QVJg7sFJh2VcsyVZnMJtfaAlI73tkjc2xzxu6ZLwoDFccCY3ZCoIK1ybNUKDO8Oh9OKH3A1Dh0aWSJlPKt8uSPkX2yA720ZI25mcZfIVBJhmai4D9tskmoHTqR5xJjEtk5Mk5vW1TxQMdh4ztMBUgt6weBwEYUNcWLPXaOj4Ly5my/S+QDfuBdBc6Av5IIkzXq9i5Z/TEY9RfGWdr58dwxaRAQjsavQ/dfxqWf63v4e+j4wusc0P5isjCBGghObj3QH1dbDdR1a0T9GXeLYtu1lAZO+SDJ1OvAH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(15650500001)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007)(6666004)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5NjCr1cfxxgZSttPnoIch16+63IsdgbHTCltXa8NqNgdSTIW+vkEZYFmWVOlvIEMMxWuGstATkXm97kpGq+BXOUvYjD5IcNm7+IkOwYoiKpUU7IWsRNf9+fao4kFBjuAx0MvLKwTGAtNpzwzEKHG83V+9d/Y9XZVipDJ4pMsG+PTjNSDZcqVvweZO4HxRbIpQizt0sOIyORSUXDvqIni/J4dioYJJRS4ELI0Hw8PmaskCxiDDRL2lWfTvM/IFcEOkI6ejeteQNYcfThO9K/6KzRCC8iHGPcp+XLER79CTb1KzRf6PUv1EB+fZbstZTM1HZ9wIi2LLXzB6WLiD0p5uEN1qqyofzM9iNC2o/nPstuqPoX1bpa/7xcyVI5+nAUhiHf7q3TBcPCcupPgJADOBVEuFuhxsjT5Wp0mpDVXf79KbO+Lf3yWj3Q4p5hSd5wLB3Mi6O5fNjVqcbGMzYWmFuQdM0tPjdIiYNJDb2vbNso=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480dea07-3ba8-48ca-ce32-08d7ff70455d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:16.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwsx/+hlAu+eDl7XlE4Vh7nHS+zEHHvzpe/2MlHmZ+XxPpWwTQTB/OmZMjc4X1egceYfn6SgM5xMy23oU8DQkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
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

