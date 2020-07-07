Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F34C2167C7
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgGGHuO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:50:14 -0400
Received: from mail-eopbgr60079.outbound.protection.outlook.com ([40.107.6.79]:1351
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbgGGHuO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:50:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0SprZkSf43ulVj6xM/LjqW005JPTyx5YKIX+1Tqw9GzG83kFAQwqUYXvzNxChfPfDdNWCUqfzC85wTvCxZuY8O6PYTy7cPcMzmqjcijhsPx9Usgc5VHFjze32N1Dxi2EP9beqB1Ay4o/qzFcxHjYGnMb4xZng1DD4ZprCbGdxhP/bkKO7ILdyvy5nLkXfuJwN/lOhrlzW9xEAt0zg0KHkQnYSzmBWV2Q9PT7d0rduJi5CtNYXPutdMd3GsWaotgNqNboQ2Ccw769SCtgNpdalPsReeiVijDDOFxm99EEDjsfCSLIN7rkMTX9uVCRIOiMdIl8/uaxnNcf+iBF1rckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=YGxbw42m/BMjre4xB9EV6R8fpH9bS3qR9HfcitJNqpHsDfYQDF+vpU0fhdxO8aewFRnZRvWeeF/EaeAzt2lS5Vgck0sP+Z2FR1h4OUZo9bo2fwwYNpCUf7uVVoyRyPd81ONt4WPkf9XQs5FBwMvGLJi7LLiPy2hM30vPCcN5743IUxfVRpLxpEnLcebs7nk9CIQO1r7fSdZEqnJIzCqI9+zKOce99HSKvUClvDAjtiIkXAP77gfZ/0Z7Dp4RBJcD9/GlxKth4pz+4NI/vKVoMIRfMfdhpUcC3iQBbcjozqkoTY12qqgekLFyrFU/5avMG6SKc3th0nBR9P2xn6j2Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awe7nqB8eZwjtrkIA9n1ZMYGeDJNbopX+R1gbb340Bw=;
 b=DZremkSaP1zmKGud/iWhWWhp89pfW2zJaimpwQXO3k7T5DDuRyHZJEw1Qk5g75lYnFdA2hxEhjkU3v9gKd0J6rh9kBqxZpLp9ON9AKiOXGiNKPOZhhgsTXQNnpyc6RuBX79aHTBfvnsa+S+7CpG0+x0Ca87FrOnazlW6lalscM0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5608.eurprd04.prod.outlook.com (2603:10a6:20b:a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:50:10 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:50:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 8/9] usb: cdns3: host: add .suspend_quirk for xhci-plat.c
Date:   Tue,  7 Jul 2020 15:49:40 +0800
Message-Id: <20200707074941.28078-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:50:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a8dd5df-c68d-4848-b378-08d8224a5f8c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5608D50B2FE0D74CB02D1E7B8B660@AM6PR04MB5608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ich5cFTVW53wmlBOo1WBLHwjSVwYGfontSfK+Typ+0ZXq8CrG7qGzJaELi+zRh+Q4ttNUJNN+rDz5u8HoDvLbOgKu5ND/SNIAo3TDu7ZfAL2LpSRvQYtrrRObsTnaL6xyfMjyTQEulTHDEEf30mlVUcPXs2Vd2KwBv4LpDUpNIThJCepzwoHJWlBEqRvnA7gbXKgVBICzVW9K6L0yn8bhB4gjxYKjo+45H6tiGJI63pfIvebF/8JKVoQ6x5A08Oa921TaIy/jWHnLRTQOK078G45HfTV3D9PeIN6lfjm6qQxUFoVhE9v69wjyaSL1sDEo9lJX9VMtz8zM8Lez7plDJF4dBoNM63zhhIBqBbyHQxNA5VXI+H08YEpuQpygJt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(1076003)(6512007)(2906002)(8676002)(478600001)(16526019)(6486002)(186003)(26005)(52116002)(4326008)(6666004)(6506007)(83380400001)(8936002)(15650500001)(44832011)(5660300002)(36756003)(66556008)(86362001)(66476007)(956004)(2616005)(316002)(66946007)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: RAI5l/FHBB91zFgnkqfO1HLIuQ34wXnWpbSknNj9TaxqN7pwD3xdTI6NwY+tEnui54uh/bdf0921JqBtWCtMpS42lNxkf3XTRZveG+InfVPs+XvpPLSqG+tnqe59qvAhC16b/yviFPZiUeUb0NuAJNl25aHBPVBg82CrHQXQdav8r54yFY3ItQ9zYhqQ/lPmCE32pRgoKlpFGuMT92G/W/JjQYV9UaOhYoZ1DCHv5F4jxQ8NsTDy8OOfObQ+C/KljUitl32NhdU8F3GEaXzxN39gzm6xSrZacXiTmrKojQGP/WYSv7GYe/pe+GVNsEpDw5FivMPmJua2GPnCKDgg05JLf7n2uu3TzvpLcZKpig/wfmmzU0YPD9i8EJ4IvBpsVPCyqa2ZNeWsuWOXew1qYAbgfdjjVLBIE4iYLZjwuhi9khPOWzWO4rFOgo8VeaixWxb9R3lL3z7iz/7NAhYAWiKIbhT01RBH6yC7BfnudRKsJ1SCROgsCL+v4LFYA8Ku
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8dd5df-c68d-4848-b378-08d8224a5f8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:50:10.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUGRR7iNFzOlFtQP/hX1d/q732mumKVaNFYqT12d/j3Fn5uEcc06lkHcHCf9GQ3C0x6IE1SM4mW/KjnMLWYh8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5608
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

