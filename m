Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FFB41476D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 13:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbhIVLNp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 07:13:45 -0400
Received: from mail-bn7nam10on2048.outbound.protection.outlook.com ([40.107.92.48]:35936
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235486AbhIVLNm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Sep 2021 07:13:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeI2i1zyZFOFbAeLzeT7DFavt4wkesFeYd9xuVgP9jI/Omy+US3C2GR5u51lYx6mlDUz1kLwevKbwaRNbmnFVIkb9pWlIW9q96TyNTU1SzqmIbDb9nN58kwQ6MsoNNtCl/Kc/0mUCQ7qOYfSZGF4clxUDvEmTzYPnLZjZWzFqf2pB8BVtmqOBpv8IZnYfsO2jmozqSin5Gos5hIH/dn87+w33CyK88uNqZnvk23FPPXeysZEdIb4LnDqIPNDwgRYFy5u26KXHLyozJoavyrjnGjYTg6NXx0bvQnSl10F785ofcTU4NTNjKhzftN282fWkbzDeZaVO8ijQEJPuqNknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gzJB1sC21gQdkvyTsr4hr4/Jw8MfNFxqOJOtUIpksNw=;
 b=LjE8e/gY1gHh7+Hi5n8w5ROTfc8TPWfmfdThi96iDvieN/+qp+WbzbmznMu7RDWtnPu7x2SbkhixFwHw6tEeZdqKH1iTLQmPFkheiXM/ZlcPiwzdacvBXG9/KJfqGqLBhnfSrmB+Vp1oBjJjLm1Pum1KqQMxlFLIIEvwTy/rRJ6/SIbP498Dnc7T4DfQxhxCViCi0Xs6Cj8biDTnKh/heJXle0ZCG+Vve5gwRv0yd+SaF+zPmOd2TIH9M0Z9/gyJ/C8df2Wc4cfzL74aQNcvFvQROnerlKtEC8GNFO98eiQ/Iq40bzWylNyuxUV+2rKqeq4wL3QbfEcz1FxpQwX6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzJB1sC21gQdkvyTsr4hr4/Jw8MfNFxqOJOtUIpksNw=;
 b=rl4xgp5HCLwR5mmRRZ8yKpF9sEDpQjLnNqaKeAoE1Ir7FugDuAhRMEWr6IRMrxKZJoYTqrbN6YOUvjattYUJsz+MmclFbG7qvtADQ9s4rL2sAjDzVPBLNTJgkyJCQSvoT1bt1V1+CdzshKRDQ6eRnkyQGidGNLGyZ6pzREynsC8=
Received: from BN0PR07CA0015.namprd07.prod.outlook.com (2603:10b6:408:141::30)
 by BYAPR02MB4741.namprd02.prod.outlook.com (2603:10b6:a03:52::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 11:12:10 +0000
Received: from BN1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::75) by BN0PR07CA0015.outlook.office365.com
 (2603:10b6:408:141::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Wed, 22 Sep 2021 11:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT004.mail.protection.outlook.com (10.13.2.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 11:12:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 04:11:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 04:11:40 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=42856 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mT0A4-0005wf-LK; Wed, 22 Sep 2021 04:11:37 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v3 2/2] usb: gadget: udc-xilinx: Add clock support
Date:   Wed, 22 Sep 2021 16:41:26 +0530
Message-ID: <7c3386d2f2b315fa6e248fc664efefb9a2de35e9.1632307026.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 643c7179-0f94-44cf-5ca9-08d97db9d29e
X-MS-TrafficTypeDiagnostic: BYAPR02MB4741:
X-Microsoft-Antispam-PRVS: <BYAPR02MB474129819667564EF3519526AAA29@BYAPR02MB4741.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4vf+KqQI5fzfzN4DmHzPx+yTRJPqPfLzVNh8ww+v+EtpV8VJddY+h8m4mnAuiCph1BTph3Cvtcy/YGbTLa7ro5yQd97B/TdbBgNjSl+lf4cJlM1Uo8yaTFiBs8i2Zk0JDDdqAkvnpRuftkvMiCli3n0369U3bQrtPcjhMOK6NJFKH4Gi3GIfHCbqhjbCI+ISHDfDJUqstpZ56E3US7anQp2AgUnl3yYnSviuJq5PoQKrSJ3MmgllQHykKqCPinTFaEmFvUpQhDkxuAvtAXrKb/eugSublmmZFuimLh+NalDtW8Celua8Z//u6FllNzFk1RIMBgZVeFYJHp88WKaKHcQbNkDfkId+rnkOF8Ooy3fUU/w06Yi4iKLMjzMNjMb5jcUt9z6te/CYhdDgtqsVb1ZTm4og017V+xLLsRJxD7wgVYuLSFoAQzE6usmcIPYpZKZVWhcpYlx+acmgjRBCnF3jSih0epxUkKKMWxfqQeUyaxipop7rPHYlw6Bay+ZFcjncZkQp/hdJkw8VPGmRYh7oDqJoUlU9tn28Ct2/9BvzUudzBC+lGzCx2uxZ1PGVrmm0+chKJyW3tSD5PwrPYaQGrG25DAKz5tUjrFMilfujLW2V3Vtobo1kIGgtDML2QnXjR+X+yiGPsfyjA+F4OH3Ctb1WLLCdWleGZgcqlou801x6yq8utWtnYEd2atqLbpnjQ/c+efEF5opvQV0gU3ruCsDtZfsyx4NLdPssl0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(7696005)(6916009)(7636003)(4326008)(5660300002)(2616005)(356005)(2906002)(70206006)(82310400003)(8676002)(8936002)(36860700001)(316002)(70586007)(54906003)(47076005)(508600001)(107886003)(426003)(186003)(6666004)(36906005)(9786002)(26005)(83380400001)(336012)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 11:12:10.4192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643c7179-0f94-44cf-5ca9-08d97db9d29e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4741
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the driver depends on the  bootloader to enable the clocks.
Add support for clocking. The patch enables the clock at  probe and
disables them at remove.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
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

