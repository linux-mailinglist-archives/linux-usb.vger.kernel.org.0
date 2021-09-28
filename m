Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A6C41A71D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 07:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbhI1F3O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 01:29:14 -0400
Received: from mail-mw2nam12on2052.outbound.protection.outlook.com ([40.107.244.52]:62656
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235246AbhI1F3M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Sep 2021 01:29:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbt4jaApxP2oPWivI4N4H7qgKECVHwsjuLREDrgTmGYYRZqkMHPrtJaRX1tksp13b2jC46GOuJ0HjqRu5qIhkgn3ndHOPcls/gIz4dao11U/6+z/XRRnFruaP8hRDSRejgNUeA/gMP8TfXH42II/2uDhwKx7gY/otAGWA1IPZj9WcMTR9evj3H3nNX0ag924EbqWM37X6+3WWl9sVYgyVEKepJYfW/qlS7ugAKspG2cV6B8/6SvJSgG9Mury4SkhvS8dGRKB76AxkBZ9jCW8m+jbVRwgeNZWyqXUFuSD2USOr0CfcD9HVIFAvLMW2wdwpvi5jOz2g6mVo2esRtPJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/ERvIpNXQhNENrKIP4irG9Vj9UuaodbYK8nogKZZWko=;
 b=BGYc2o/3qxAK4KLN0DFjgr6YfiSAVBfVVal3mnzO18gX9y+Oz9dfxT6F/IOMiItRbxVD7tQ0mg9nmDPf29GWRteCZPzLdWlU/HPkyrbKkw3UBQDjd8wQPFyIk6cTw/JxHZY+LMew1jFI3WqwTtK6xok8uYtqxYykxtNXQPz26mGSFiEw9jMzvNCdUxcUX0wq+WYm68b+Lhpnieena1kx+U1kzhKHs7uZ9Sb3K36LPgI36Ckc63VLoXJ2Hz2LZqYJIIxf48D/iBZ7Y5NnSjbx3mg/OL8xpCRfK6B3j1IMSJtNAxxY54pz3D3ky2CKpiQAdg+bLfgYhPYWkK3uZCDrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ERvIpNXQhNENrKIP4irG9Vj9UuaodbYK8nogKZZWko=;
 b=AtvwtOYO6dTI3glr42rTznnwMlV10mvP96bjKyvrTPA3sbOgH2DY94xPi1v8vi+Gg9MZOOt0g+pUWjyUVMxUfb2j0AAH4CfgwdBdd9Ca2ZdnWEMK4o0hQnCye7dxOfCDSlHggzVhJL/KJAJM+MnS0xUTgWfROSeKrNA0SMAnHq0=
Received: from BN9PR03CA0075.namprd03.prod.outlook.com (2603:10b6:408:fc::20)
 by PH0PR02MB7832.namprd02.prod.outlook.com (2603:10b6:510:57::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 05:27:31 +0000
Received: from BN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::50) by BN9PR03CA0075.outlook.office365.com
 (2603:10b6:408:fc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 05:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT038.mail.protection.outlook.com (10.13.2.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 05:27:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 27 Sep 2021 22:27:21 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 27 Sep 2021 22:27:21 -0700
Envelope-to: devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org,
 balbi@kernel.org
Received: from [10.140.6.39] (port=51432 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mV5eC-0003cY-6a; Mon, 27 Sep 2021 22:27:20 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v4 2/2] usb: gadget: udc-xilinx: Add clock support
Date:   Tue, 28 Sep 2021 10:57:11 +0530
Message-ID: <054de6deeab81020eaf0399add2839c36b64275f.1632805672.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bf8210f-508b-4a4f-b0f8-08d98240ab25
X-MS-TrafficTypeDiagnostic: PH0PR02MB7832:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7832B613E5E2EB1F8D8E51DBAAA89@PH0PR02MB7832.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lb7zloQlW/XxT0XLAazmWC8wF6SkHt0PGc0dece2WXKBfJvWeKfUpsGkgfm6O6dgobosLbipI3/lRWFIgyeHlN8HHIj/jb8C7brVLWRnBUSKVPnnXGD6W2rTTyg3oerFY8oo4hPXtneuyff/mLF5jVrrhpp1INYi8RGxl/kT3U0d2K2tJfs6/weBmOqZss62Qx2MFfTVjHp3EbjouJEdeM1SZVSShMQkxBX0mknODEbyZMCqT4HkWuTYU1Z/BR1o73K7KL/xDnDJZQ0Mvtn2SsIPtigSsxrGpcN1cFbouHzpw86zrK3MjLx6MY/gcYQDqZ1vcZwr3NWDg+F467ybD/ebClLD6NdWm4OE1hA7EqgWWYxEc+Ig4Q0IkAl6Lte1hG+a4ifrNb6NrMTMUm1pNawOb3KtwYNTF4G2S4OwaEP8PJdZZZEZGpKuXen1W4TyQJFR/MY1UcqS/5QTsPirw+mTwLqyBQZUm5MBZh8ZgtL2tHKsw0cLWWfFcyEwoWfWN2jJ9rDAauNhIJCHFyDe3/Co21me1VgD46G5fav/H5DYwv53S23uQx/GXv1xu9aow9QntxQPMIAn95H+n5lnxQ2zIZGC20+QqFYyDgXMeJTmT22Q2NEvryzZ9NLSPMczmDO3dX4XWsTby374t5E6DG00O4IkahKbpI9AsWTpBuTXotUH2ZxWayMbjb7BtJ+lv1Tn5LAzqawVZZwKbBOWknRRkjw1oO5Ozo3uFtK+0gA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(110136005)(26005)(4326008)(36860700001)(70586007)(54906003)(6666004)(83380400001)(316002)(47076005)(36756003)(36906005)(70206006)(8936002)(7636003)(186003)(356005)(8676002)(82310400003)(2906002)(9786002)(336012)(426003)(508600001)(7696005)(44832011)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 05:27:30.9198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf8210f-508b-4a4f-b0f8-08d98240ab25
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7832
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the driver depends on the  bootloader to enable the clocks.
Add support for clocking. The patch enables the clock at  probe and
disables them at remove.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Acked-by: Felipe Balbi <balbi@kernel.org>
---
v3:
Add dev_warn

 drivers/usb/gadget/udc/udc-xilinx.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index fb4ffedd6f0d..f5ca670776a3 100644
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
@@ -2092,6 +2095,27 @@ static int xudc_probe(struct platform_device *pdev)
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
+		dev_warn(&pdev->dev, "s_axi_aclk clock property is not found\n");
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
@@ -2147,6 +2171,7 @@ static int xudc_remove(struct platform_device *pdev)
 	struct xusb_udc *udc = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&udc->gadget);
+	clk_disable_unprepare(udc->clk);
 
 	return 0;
 }
-- 
2.25.1

