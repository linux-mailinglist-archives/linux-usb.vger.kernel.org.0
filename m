Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4462343DA
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 12:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732280AbgGaKAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 06:00:20 -0400
Received: from mail-eopbgr00062.outbound.protection.outlook.com ([40.107.0.62]:52802
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732240AbgGaKAT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 06:00:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U++iFgUzoAJXj6tB9C0uOirDkWV4UGGVRZOohMcXf/rOTKlcVcjQQ9Htu6ZNFo9qUKAqsENAZU8H4ZVZ+1yqSGLtguQJTffC9IYL7l94tA+JTpINQShMLa9lFF+xdp8odYLuEUva5Rmiea+hLRJp3Jx6gKLAIMmFwzi0V2QW1+hGQ3UA8hwA8zgsMHqRTS4AD0jPfcrsnlJNzyqUDFj7p44DCASKEF3K84UhKdJ/xIJRRBA4j1L+nyLatwfJ6cmsE5KdESJ7lbpE+OlwJJVvJsLeWJrcqYG4TE5aIsFRr53+H8xkHexFEzLX661/mBrLkSnu4T3pFejDDe7T9EvLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYGNlS/NQjqqJy1DyJC2odyIB4bO3u+vmvk1NKq/mHg=;
 b=itJQSiWtWzuF+ludV9+cZKQeIWlZbVjK0xYmIvXyhS8hPHr794Vma/51EErvvFwhcwsPETYB2MZQHGKp4hWZXjyr/F3kE0WncVxvN3ZkTj10sXV/XvFuKMVgwS7ytsbuaQCYHaD12QRJaOefrqxnmgNfSdDIxzLqpkYy5DmXq4OoqKW+NMDH/4/BpTUr+XmUquLcr4zBiLiCf597xV0KiK2H94gPLQAdRvHgdSBDC+BqNkDB/zexlMdPgxGi9UbvuwXmpC6ffFJD9OBwGqOrSakeGIQNkybBLdpvCWbm0s3T7qFU0/aw2UO6BtLABfx08/JLIdJI2wA/bYHOayTFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYGNlS/NQjqqJy1DyJC2odyIB4bO3u+vmvk1NKq/mHg=;
 b=WmIY6Nu2xLDOG/KbBWrdmwPWe0ieaPQ1g94SQQ/2HxqJj5QVO4viW9czqSFMeip7z0wtPz9c1GohCRhiqlHp5XJd7bGX1WtK0KYpM9doqH4MUG5FKegt598I4jYAApi3hHWbcWf4Erm29qUGtum/MoCa4UdABVRigVVE/LWS/Po=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB6PR0401MB2517.eurprd04.prod.outlook.com (2603:10a6:4:34::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 10:00:15 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Fri, 31 Jul 2020
 10:00:15 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 1/1] usb: gadget: core: wait gadget device .release finishing at usb_del_gadget_udc
Date:   Fri, 31 Jul 2020 17:59:35 +0800
Message-Id: <20200731095935.23034-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0116.apcprd06.prod.outlook.com
 (2603:1096:1:1d::18) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0116.apcprd06.prod.outlook.com (2603:1096:1:1d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Fri, 31 Jul 2020 10:00:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9cab533-cfac-4fe8-f439-08d8353885e5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2517:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB25176E326F79DF50FD16310B8B4E0@DB6PR0401MB2517.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soVT9j4QiFD8gmLg9F7Vnrob5tLQP8O906EvkwFd+Bz+kalPkCTCe8+F7WMsrLxYQj+zL/S9iJt2m6X1cCBKgzeI6/98tDs67IhYFuRgDlsMsiGfl13BxZbINSx6ZLmvj0+DCgLrwVwNo1vZA+Zd9I/k2UIm0DzrkiCV8o/T5i8X6n/hHI5XharSrvKdcgR5wCcURkrmZtZ7zBQCf6YJqWW4gASjarZ85jv7d8TfK7xN3f6pwQZS6vtAsQwAyUhc5kvyy+FUbpMkILln+NXGYkGRyPwy5Pq1m5PUULeNPpgMSiUTJg32gRUewDFuStJqrMfxZ4lbbUE6zpzuV4wOhzBkrcAqo4UhdW3H8sxf3RaARLLrlSwekn+cGG3ASuZqHcFK/sXJBVq+h5/k5dFUbszS9gD8b4CXVBc1z+l9XC4IFkq828Rh6UrXMSLNdogMOCKMOjCB2/Muii/i3XzUdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(66946007)(66556008)(66476007)(186003)(86362001)(26005)(5660300002)(44832011)(1076003)(956004)(6486002)(2616005)(16526019)(6666004)(316002)(966005)(54906003)(478600001)(2906002)(6512007)(36756003)(52116002)(6916009)(6506007)(8936002)(8676002)(4326008)(83380400001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: F2o0vqtlHpwm/F6ra3XNKX3HjZwuz8LL47Tm60RQY/hlN8o1aMOkgTCmYXv7/X5as454vDA3u5GiLHs96TwC6a029F9pdvRDBmCyEgtxGYsL6LfVXIqogR/4BqUd8VPjNI7B2STVcVmVHJuch8o+Tjf2/hXqyXLdSy0BPxQmmmfTCRotXwRfzx6P8y382FCwoXfSQacM/XCx6VVXMCrHugIc7D5JcLCzTPlIahYsgh0f1Bi1BVnOl+QeRgZdIdPRgJUKhF9I6GicNFthjdvHsNKD8iQsSbUL9MD3vjq+GOgigUc0VgpYYWVZqX1kz7qbjAegBqBqs6y7ugtR/HbuWdCdgcZlAQgKsNMBML9j+X0HBNg3ZbrbPLdhoWxBftrpUJN2YO0Sgx3iLaKT5fTH7Cw6Wc8wGiMmuZ+YWeMPIIFeXniLVHLYJqq4+gFWSg1yEfQM9dWIr2j5V8Mgw4Pxpas8shNcQgvgq2/wBwrDzWNOC/AWQ1JhCnxmd3uOH9/99jWLMdWA+gtwdv/UScRaVmpp5TPHLpOciT33utgXiV5ApM/UmT01LajT1nWXxT8z9R9puYTNzEkWHPqYpurqcfeupR4xDJfN3ywDT3nAt7FFfyEjM/sSP6fO+9GkZgJO34r9Z8LuniJOYrXeWLD1nA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cab533-cfac-4fe8-f439-08d8353885e5
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 10:00:15.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3NRXm+x/wQMvfJ8Ng3lCcjNkCq3B8P+v2vXOX3ALEwq0XETXSP1z2oLQUPZQ4pfkWOq9l/OfCFn39e34TDQJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2517
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Per discussion[1], to avoid UDC driver possible freeing gadget device
memory before device core finishes using it, we add wait-complete
mechanism at usb_del_gadget_udc and gadget device .release callback.
After that, usb_del_gadget_udc will not return back until device
core finishes using gadget device.

For UDC drivers who have own .release callback, it needs to call
complete(&gadget->done) by themselves, if not, the UDC core will
handle it by default .release callback usb_gadget_release.

[1] https://www.spinics.net/lists/linux-usb/msg198790.html

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
If this RFC patch is ok, I will create the formal patches which will change
UDC drivers who have their own .release function.

 drivers/usb/gadget/udc/core.c | 14 +++++++++++---
 include/linux/usb/gadget.h    |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index ee226ad802a4..ed141e1a0dcf 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1138,9 +1138,15 @@ static void usb_udc_release(struct device *dev)
 
 static const struct attribute_group *usb_udc_attr_groups[];
 
-static void usb_udc_nop_release(struct device *dev)
+static void usb_gadget_release(struct device *dev)
 {
+	struct usb_gadget *gadget;
+
 	dev_vdbg(dev, "%s\n", __func__);
+
+	gadget = container_of(dev, struct usb_gadget, dev);
+	complete(&gadget->done);
+	memset(dev, 0x0, sizeof(*dev));
 }
 
 /* should be called with udc_lock held */
@@ -1184,7 +1190,7 @@ int usb_add_gadget_udc_release(struct device *parent, struct usb_gadget *gadget,
 	if (release)
 		gadget->dev.release = release;
 	else
-		gadget->dev.release = usb_udc_nop_release;
+		gadget->dev.release = usb_gadget_release;
 
 	device_initialize(&gadget->dev);
 
@@ -1324,6 +1330,7 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 	dev_vdbg(gadget->dev.parent, "unregistering gadget\n");
 
 	mutex_lock(&udc_lock);
+	init_completion(&gadget->done);
 	list_del(&udc->list);
 
 	if (udc->driver) {
@@ -1338,7 +1345,8 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 	flush_work(&gadget->work);
 	device_unregister(&udc->dev);
 	device_unregister(&gadget->dev);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
+	/* Wait gadget release() is done */
+	wait_for_completion(&gadget->done);
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 298b334e2951..ae346b524591 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -378,6 +378,7 @@ struct usb_gadget_ops {
  * @lpm_capable: If the gadget max_speed is FULL or HIGH, this flag
  *	indicates that it supports LPM as per the LPM ECN & errata.
  * @irq: the interrupt number for device controller.
+ * @done: gadget device's release() is done
  *
  * Gadgets have a mostly-portable "gadget driver" implementing device
  * functions, handling all usb configurations and interfaces.  Gadget
@@ -433,6 +434,7 @@ struct usb_gadget {
 	unsigned			connected:1;
 	unsigned			lpm_capable:1;
 	int				irq;
+	struct completion		done;
 };
 #define work_to_gadget(w)	(container_of((w), struct usb_gadget, work))
 
-- 
2.17.1

