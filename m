Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FC03F00E2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 11:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbhHRJsN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 05:48:13 -0400
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com ([40.107.237.50]:53249
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231218AbhHRJsK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 05:48:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcDQotH7uDGxMvjyQd5BPNovz0kNjRzBiNh6kYpm+/yjwJh6NB4aXqry7p1MHot1Vckml2Y+FVZ0FrivkbOzVhA6PZoTgbhe4GDR6DNYoQtJzTUURcN1EYYLgPIj4GIM4BYJ8LtR05l9bIx1qE8Qvhd8pep3Tx1KB2+925OZ22m4+Kdt+wbeDPIdkXgvLPZ/9Im5XE+p/kmFPZbKIXLcEp3Y4Z6Dtq+kzZcZ+ufBqacXDOLMisoDW7hzcFhpG4QFuQQU/fKI69ONnW+b71MJeEKEe1yGIoo0ogkMEjT8jQmVWn+mNplqCQOJF1/nLy3+0OdFFLX1sxEf0SYfQbBeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2U/T7D6QOe603bvA4+qD8uN8tkp3SZTHLpcWMmi0uA=;
 b=msumCxuA9/6aW9GBgF2P0GFVBs/CTTibmoKlB68He5mv169N24HLsMfIFjqSb0eg2+b9rJ+I47IjiB7ZVM7rhJDTVv0vyg+gYRIySSKg3/xsDpLaj3h0Cq5nXJxN69zfw6v3K5VksEw+Hq72GuUr/L0nZXXZXRwnIb3EsmOzEIGoYGT225Iv8tNyi4zgewXQaikCbP58RYwRRz5RtY5/EhXckEqxvDpn7VGYn2XdVrMvAGxocnnAMWXZZsBDNC4bhqM3Yvwo61/drYXitIV3dr/dc00lW5Ur+iNcWADG/ZB+7MEARI+/M9eccGZY1h6IH9QeIybqHgZgdHxiHNqJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2U/T7D6QOe603bvA4+qD8uN8tkp3SZTHLpcWMmi0uA=;
 b=nmyaI4yq9nfivzgg/5PLJKTcvnvsXtlQzDLC3ZmdFlkavmXkG2ZZxvgbS8Rq99b71zjOyujBG/opd3Y8+Rdkmm9cUJL4WLaR8pjk7prAZTbUUQkgine9cXRq5sYf2VK8e3QiHwG5T6fnPp3Ruh4riw3dy5XKzINNpzZPX7gln0Q=
Received: from DM5PR19CA0002.namprd19.prod.outlook.com (2603:10b6:3:151::12)
 by DM8PR02MB8024.namprd02.prod.outlook.com (2603:10b6:8:19::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 09:47:33 +0000
Received: from DM3NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::6c) by DM5PR19CA0002.outlook.office365.com
 (2603:10b6:3:151::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 09:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT006.mail.protection.outlook.com (10.13.4.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 09:47:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 02:47:30 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 02:47:30 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.140.6.39] (port=41392 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mGIAT-0003gj-8w; Wed, 18 Aug 2021 02:47:29 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <michal.simek@xilinx.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] usb: gadget: udc-xilinx: Add clock support
Date:   Wed, 18 Aug 2021 15:17:26 +0530
Message-ID: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bbc3601-69c1-40ac-0b26-08d9622d342f
X-MS-TrafficTypeDiagnostic: DM8PR02MB8024:
X-Microsoft-Antispam-PRVS: <DM8PR02MB8024F3EE8A18DC478DF32573AAFF9@DM8PR02MB8024.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbncHiN8evkjU8TwEhjoHvBBZQcMx6Fy13kWNdq5qMhgyGm/lm3mWrTUl08ralIXJ46rrW96zI2E/5lvx8gaIWrepZYrO75JabHYLLhjq8lvNX5N7+XCkDh+pyxQG4Yr21jHCfLMlU3TpMecLLo7HWwax9Z8PFmhp6+ABq8xOEqRuvyFLxlvZqCF30xm93g2hAZpruIpgR1nRkbCVoplrrPC90w/E67pG56N4Y1np3OOnvXUW6ZhveM7JW1XvDG/XJd/YPo6A21ZJQFXo6OR9eK4RUPPZpVnBsBApIhMNeHA0oZ7TlSrOFu9yNHCgSncJ8VdfIdTcUgUWZXE3JMl9GikZsJfo8gvBGf4+Yg3JhFviesDbhxGqE+Ub8dXWZs1gSWnaqHO4/we7CXyQq7JzlOXiGs1cgQFccxWedZciM46eV97hfccEoPSda9w/AcVWCRJYf2yEI2wViGSyvLHv5nVpoZ7qRtNbqK0g+aplE+EzCo4ooxV4d9yNnq39DCrT7k2pQcCzTYPzIKuuVaUOvMlbKhy5ESEzopX+r5/MZ6GzANDfchmUQ0m8TiFoKnlbx9z5YVybVQLygI/QRn5anvu9XqoZS+KNSWQ5/JtKbqnMnU/5nWhZGzLHCRhFD0fqz3LwuuF91ZEbxQHQ9BG2bnRIgSkuAQwxyxiZneW0lVbYMGNwaGjz4VvnYGFKpdLJWSr5K6vxe20bH+tfAxbKFNRVWCftsDVkQ6BhfGVPeE=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(44832011)(70206006)(336012)(82310400003)(107886003)(82740400003)(316002)(2616005)(36906005)(54906003)(8676002)(478600001)(426003)(8936002)(70586007)(9786002)(5660300002)(6666004)(4326008)(356005)(1076003)(7636003)(83380400001)(6916009)(36756003)(186003)(7696005)(36860700001)(26005)(2906002)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 09:47:33.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbc3601-69c1-40ac-0b26-08d9622d342f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8024
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the driver depends on the  bootloader to enable the clocks.
Add support for clocking. The patch enables the clock at  probe and
disables them at remove.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index fb4ffedd6f0d..30070a488c87 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -11,6 +11,7 @@
  * USB peripheral controller (at91_udc.c).
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -171,6 +172,7 @@ struct xusb_ep {
  * @addr: the usb device base address
  * @lock: instance of spinlock
  * @dma_enabled: flag indicating whether the dma is included in the system
+ * @clk: pointer to struct clk
  * @read_fn: function pointer to read device registers
  * @write_fn: function pointer to write to device registers
  */
@@ -188,6 +190,7 @@ struct xusb_udc {
 	void __iomem *addr;
 	spinlock_t lock;
 	bool dma_enabled;
+	struct clk *clk;
 
 	unsigned int (*read_fn)(void __iomem *);
 	void (*write_fn)(void __iomem *, u32, u32);
@@ -2092,6 +2095,26 @@ static int xudc_probe(struct platform_device *pdev)
 	udc->gadget.ep0 = &udc->ep[XUSB_EP_NUMBER_ZERO].ep_usb;
 	udc->gadget.name = driver_name;
 
+	udc->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(udc->clk)) {
+		if (PTR_ERR(udc->clk) != -ENOENT) {
+			ret = PTR_ERR(udc->clk);
+			goto fail;
+		}
+
+		/*
+		 * Clock framework support is optional, continue on,
+		 * anyways if we don't find a matching clock
+		 */
+		udc->clk = NULL;
+	}
+
+	ret = clk_prepare_enable(udc->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return ret;
+	}
+
 	spin_lock_init(&udc->lock);
 
 	/* Check for IP endianness */
@@ -2147,6 +2170,7 @@ static int xudc_remove(struct platform_device *pdev)
 	struct xusb_udc *udc = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&udc->gadget);
+	clk_disable_unprepare(udc->clk);
 
 	return 0;
 }
-- 
2.25.1

