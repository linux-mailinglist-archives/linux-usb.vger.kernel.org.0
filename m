Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354E94224B3
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 13:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhJELM2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:12:28 -0400
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com ([40.107.92.40]:29024
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233886AbhJELMZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:12:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXNTY34QKdi1GHSqkT3ooGErokrcCHIN9tehZrcjIV3WrGvoeFD7bovbG+J/QquKfspRxcCGE5mM+wqA+I1uufXRHitIgc/u7vPkRgIZ7u+RvznPM/GccnGrsZrQeFHisOrUp3tYlKOjDGayrAGjuC6zLqum4J2QpXe6OpLhdD0OTHMIcNZR0Gm1LUV27QBmNaaC67wcioenkrTx7uMDK48H/ZwHjuMLqa4ZrE8QSXEaaDCnEoGSqoXPSVXazY1qov9gXMGz5/ZUqqvZ44RGCGBtL4SKBAVgpe92nsMor1rZYyISgZf48sgUdlse+jq/ZzbhPTbty83VgboVvvkfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5D0XtZlXRqA8VMZ3ywk6gTCmEL2hR8geSVggziVmrc=;
 b=hs50PeJ+B3tIxWb/HMJ10H6cFkx4F14a3IkuuTZatKLZMPtr86X6sBFiLk/Y5QzAfLdYS4X37e3DgX8N6XeCU5hiP3BpsOeoUAoDMo1XQWxRzyuaZDmclhzm5nPTsLDtK7DoObLchLyRCrZ+p4G9KgUNsxkRMKjDFjK1vZoamUFDPsiCFj1pq6/B+qcP7jk5M5CMTpndtBmwHNI5UyQIs4jboT3w3tjsjAiZKXsehsKoJCN52Mp4svH1tQnf7WqvMURKTyml2j6R5TW/RQDGxWTGOr4QBcNxHaK17m3mijO/5LmNBSvMSRcNerV1eraRcwH/Sr25bXFAqSmhaF23Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5D0XtZlXRqA8VMZ3ywk6gTCmEL2hR8geSVggziVmrc=;
 b=MybABaODSgUE3DmhyPXc/zx2R071+1Fg7ZQE3sHFCme1wR3bSE6qKzCmjBv35K3P9GXwtH8j0ZMpQcZo2F3i6UZZOaZ4rLoD+LlEN+S5dri58gNGMoFZk+eAMwsMk1MZLouK3O1RJSpRE8c8ggPN5LE6MnCdzB/8/skcfx+P8H0=
Received: from BN9PR03CA0324.namprd03.prod.outlook.com (2603:10b6:408:112::29)
 by BY5PR02MB6802.namprd02.prod.outlook.com (2603:10b6:a03:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 11:10:33 +0000
Received: from BN1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::f4) by BN9PR03CA0324.outlook.office365.com
 (2603:10b6:408:112::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Tue, 5 Oct 2021 11:10:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT045.mail.protection.outlook.com (10.13.2.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 11:10:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 04:10:31 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 04:10:31 -0700
Envelope-to: linux-usb@vger.kernel.org,
 balbi@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=55654 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mXiL7-0002I1-MU; Tue, 05 Oct 2021 04:10:30 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <michal.simek@xilinx.com>, <shubhrajyoti.datta@gmail.com>,
        <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] usb: xilinx: Add suspend resume support
Date:   Tue, 5 Oct 2021 16:40:25 +0530
Message-ID: <20211005111025.3514231-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe8e9c4c-acd8-437f-a478-08d987f0bfd7
X-MS-TrafficTypeDiagnostic: BY5PR02MB6802:
X-Microsoft-Antispam-PRVS: <BY5PR02MB680212BBAC91949CD2ECB22CAAAF9@BY5PR02MB6802.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrDliGXpR/qaHII4bRycloGXJN2HBEVnAn2uXJht7yAsAQ5Z6R7SDAir21RJfHfmrSj6n7WzjQOpvqaOuycQt/EL8nUC/7Nd8mzs817t7OFtSwIEbLDnBPvQAI7Gif0dlASRxm8fsd0CJ6f+yBWuMneRiJzU6mZ8PMkb6JdFD4B6b3KFjsuLXemYfTeuuy0toCc8KGyvqRd+cRl/lg0wc5spU9cLOnmojYasjsFCDA/7IOJRc5GgnpdaNHygfx6T6lQ743tBloUlUTnTX4btdB2u9FZA6MWgozf34RM7/dOq4X1T1XUXxA4rupFFDa/i/+ZIvy7fhFvSXqTZ+zJp6f9icp3fJBT79UqEfk1wELlb1AVXdpwN81oC3v8qQT3m8nIjv5Jmp7GgcbESH+uGFPDCa2U4LtQf5qAcv8bqUzrGYfus2yNqRRrD9Wnp0vlLrWJhv2q14dweisRs4bM0EhrKamKoDv3hpbtmTbNGuXbA/n0NVk2MXg7cCScO/OtZL8uVgEcGePr60Y8QNqLIcyS9hEfFD/Xuk+1tnHycpNO7IjmRcMfs/U9s+FJESdE6bYx1752w7Hgft3ipgFV/HTo3gUaEsQNI1txKOmyP/HIHsgL6KnVlSr+3Y/gNpTpzWJE2Mj9Y9+wVj6wVtBzep4l/jukF2sCCmzzPT9mgJjF8gZKTo1IXA16VIm73ezVMkrR+R1lmUIRC0ql8K/GS5wI9OuzkID0lcscgZrsHqOY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(5660300002)(44832011)(186003)(54906003)(82310400003)(36906005)(8936002)(6916009)(36756003)(1076003)(2616005)(83380400001)(356005)(7636003)(15650500001)(9786002)(316002)(70206006)(8676002)(7696005)(36860700001)(70586007)(47076005)(426003)(2906002)(6666004)(4326008)(26005)(508600001)(336012)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 11:10:32.8797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8e9c4c-acd8-437f-a478-08d987f0bfd7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6802
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add suspend resume support. In the suspend udc is disconnected
and it is set to ready at resume for it to be functional.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index f5ca670776a3..1369792f195a 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2176,6 +2176,57 @@ static int xudc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int xudc_suspend(struct device *dev)
+{
+	struct xusb_udc *udc;
+	u32 crtlreg;
+	unsigned long flags;
+
+	udc = dev_get_drvdata(dev);
+
+	spin_lock_irqsave(&udc->lock, flags);
+
+	crtlreg = udc->read_fn(udc->addr + XUSB_CONTROL_OFFSET);
+	crtlreg &= ~XUSB_CONTROL_USB_READY_MASK;
+
+	udc->write_fn(udc->addr, XUSB_CONTROL_OFFSET, crtlreg);
+
+	spin_unlock_irqrestore(&udc->lock, flags);
+	if (udc->driver && udc->driver->disconnect)
+		udc->driver->disconnect(&udc->gadget);
+
+	clk_disable(udc->clk);
+
+	return 0;
+}
+
+static int xudc_resume(struct device *dev)
+{
+	struct xusb_udc *udc;
+	u32 crtlreg;
+	unsigned long flags;
+
+	udc = dev_get_drvdata(dev);
+
+	clk_enable(udc->clk);
+	spin_lock_irqsave(&udc->lock, flags);
+
+	crtlreg = udc->read_fn(udc->addr + XUSB_CONTROL_OFFSET);
+	crtlreg |= XUSB_CONTROL_USB_READY_MASK;
+
+	udc->write_fn(udc->addr, XUSB_CONTROL_OFFSET, crtlreg);
+
+	spin_unlock_irqrestore(&udc->lock, flags);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops xudc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(xudc_suspend, xudc_resume)
+};
+
 /* Match table for of_platform binding */
 static const struct of_device_id usb_of_match[] = {
 	{ .compatible = "xlnx,usb2-device-4.00.a", },
@@ -2187,6 +2238,7 @@ static struct platform_driver xudc_driver = {
 	.driver = {
 		.name = driver_name,
 		.of_match_table = usb_of_match,
+		.pm	= &xudc_pm_ops,
 	},
 	.probe = xudc_probe,
 	.remove = xudc_remove,
-- 
2.25.1

