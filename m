Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F97940F551
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343994AbhIQJxM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:53:12 -0400
Received: from mail-mw2nam12on2055.outbound.protection.outlook.com ([40.107.244.55]:62020
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343983AbhIQJxB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 05:53:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArBkZ8iWqlw2VNayx8V9RY0FMe4y3EbYsDEVPJuczqTkrkChDNfnT0tPeoXnWQ4rhB4RNiskfmgYlLzERc7DEafsVy/Va1d97dNCKp61GoZflsaPthGiNFvOyUMBRRQKmSaZE7kWVCisT72lY+Ict9IKjuFWyqMuEQGkzEHmKKEXsmfwBgtzaHCu+6JE9jKjeLNz8G+toa3FxCcBTV7+9RCCLVTZ8iwMfZpPpa2OJ37mYriu0Na2TD9I5grvbQTWuePtJnyCTzlwy3/BTZ+B9xDHSmfgCA+rZoCgpRgmGy3pM8eqvYq/lLEYKKtzMItivp0UXDc+kj1GMub2fDrCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4WL3Uu/gh806mN30HjCG6DQSvfU3AxJaNk29tXBfTAg=;
 b=eghX56TW2JIo79/OyqfIYPV362wJUUeWecyLKvnS0LRBarspOZg9qg/VrjNiCEXK6a00HmkABpFqLHXjpADtyPIzvoPEqsG/OcMZpvj2nJBMdnkA7soWgst4/7/uo5qfFiolRzBuc6dlqV6COMKjlPb7FbQ/jTH04wn3BpdrIAMdKQ5hTIDqnFLYotNS6MVgjDdFAlwrFmxZ8pRXR/J/sib8VqMzLit0c1joa5X5qCjeLRgQFLeaKp4NR+DWd7kaH4wXySD5n438vQLZNd9EK2jg8Tj7SBw13x5leq6CtbGMqw7bZfXgniV2IxgR289s7FQqUyebMP3NHE3akc7Wlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WL3Uu/gh806mN30HjCG6DQSvfU3AxJaNk29tXBfTAg=;
 b=O6zC3GPG0x752IErr5x3n09wyiPHVqLS2HLwhIJ83+GM5JADc7P9WevtZ2ObrdMyen6OBE7QvVh5QcCwI4KZAFI3dXCMfzwMJi+TQy3ZnWNeNPyUi1ykXAPJ/IxegRh4c3NuRUufBc+xt41Opv60Fgy5Vuo841MLnjUE4rSTjCA=
Received: from DM6PR04CA0010.namprd04.prod.outlook.com (2603:10b6:5:334::15)
 by SN6PR02MB4158.namprd02.prod.outlook.com (2603:10b6:805:2c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 09:51:35 +0000
Received: from DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::4) by DM6PR04CA0010.outlook.office365.com
 (2603:10b6:5:334::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 09:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT021.mail.protection.outlook.com (10.13.4.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 09:51:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 17 Sep 2021 02:51:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 17 Sep 2021 02:51:17 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=47058 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mRAWZ-00069A-P1; Fri, 17 Sep 2021 02:51:16 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2 1/2] usb: gadget: udc-xilinx: Add clock support
Date:   Fri, 17 Sep 2021 15:20:58 +0530
Message-ID: <7341ed525f03f4593958bb3d1232660df23f838f.1631871264.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1631871264.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631871264.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efd4ded5-e60e-4f6a-20c4-08d979c0bcaf
X-MS-TrafficTypeDiagnostic: SN6PR02MB4158:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4158DE036F173A7F10D2378BAADD9@SN6PR02MB4158.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXejFiNd02yfU+u/1IyPbaD1fW6jZTfrrlbCSlYA/geQeTSQ7i5bTOxRs2KcLdlHDtQNKG/YRGAZCL1xMHTvL4hWnxCvqjr7Sf3WnSgy5O/vmUy/8ID5p2KSDHpIiCfAKz578ImOlWjNUeR2TQg+sp8dVmlEfSNtjyUOkxs759YAR/z8ew0sCisUuZVk737R4rwwfE8mGGUKFsFgB0Y3rTf7frynENs8Xgch3NKpIB54NMb8bQLajs5xiNWkeNsT9Uy3oA2Zx4UIKo3gk0pX6ztmiRENrLnRA7mpj42vtGj5Yzyr61BmJnVf4Ub5HswY4zGZ8dz8ZKb72jy95COFhpyY0Q+HjsGNOQMHMTfpwCTS4iZMaIRxwyAl8lwQJ/bmZ2v98UrtRVr8HTTABi8Olwnsy+waYut9wiU1mDCntwqfaHD22+Ofm21G6Em0OiwScFXCZasi/V0R9axIUZbeHGh7qRpODAa+ynziWph1hjKhKx7VLnEMl1UBrSU7P7DRhJjWAtRnejdUcqmdy9yRgzx+TLFYifOfyKTZTk8VMhTz9n3JAulG8UBC6fbYOCwwYkDqUqkxwxrcXzsC2hpvxyAMDeOHhBrqv+GBrLK5Y4l/hrlex1xZyW0aUgNn/DOJDHcOcYgJ58/DdI5gtdWsIr5RkkGjJxl1VmAAlqwA+DJtbsH582zS2Ms+7Qk8jZY0UW9P/YtX+prRnZXdNmxPfK8d2Y3/P8D/WXGIfabN5Vk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(8676002)(8936002)(44832011)(82740400003)(83380400001)(5660300002)(2616005)(36906005)(6916009)(316002)(2906002)(6666004)(7696005)(4326008)(9786002)(54906003)(7636003)(426003)(336012)(107886003)(36756003)(186003)(36860700001)(26005)(478600001)(70586007)(70206006)(47076005)(82310400003)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:51:35.4991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd4ded5-e60e-4f6a-20c4-08d979c0bcaf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4158
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
2.17.1

