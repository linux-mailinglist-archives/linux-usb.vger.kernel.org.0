Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7733387D45
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 18:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350576AbhERQW2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 12:22:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:52888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350575AbhERQW1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 12:22:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECFD8610E9;
        Tue, 18 May 2021 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621354868;
        bh=Ve5BAOPq6gdoyOzuNdwO8JQHHDggrl0EVR/Yp3mUIZk=;
        h=From:To:Cc:Subject:Date:From;
        b=Q+cb9gjLvLbTWGV2Hj1aCpdKZpDLc1m4KoxOM54xQ9TkN/CPo7tqN7v0PItOcvXA7
         XA2QxVRYMk86gEgWu2OeADMnw459P7Y1Xb6cU5U03hM76ah9FCCJsKJM+PKrPZpzKr
         nOU6nVkfvrciU5hPhOQBskrz/qLjPhNg8ZYCFl00=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: gadget: s3c2410_udc: remove dentry storage for debugfs file
Date:   Tue, 18 May 2021 18:21:05 +0200
Message-Id: <20210518162105.3698090-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to store the dentry pointer for a debugfs file that we
only use to remove it when the device goes away.  debugfs can do the
lookup for us instead, saving us some trouble, and making things smaller
overall.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 7 +++----
 drivers/usb/gadget/udc/s3c2410_udc.h | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index b154b62abefa..5e453ebb2643 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -1843,9 +1843,8 @@ static int s3c2410_udc_probe(struct platform_device *pdev)
 	if (retval)
 		goto err_add_udc;
 
-	udc->regs_info = debugfs_create_file("registers", S_IRUGO,
-					     s3c2410_udc_debugfs_root, udc,
-					     &s3c2410_udc_debugfs_fops);
+	debugfs_create_file("registers", S_IRUGO, s3c2410_udc_debugfs_root, udc,
+			    &s3c2410_udc_debugfs_fops);
 
 	dev_dbg(dev, "probe ok\n");
 
@@ -1889,7 +1888,7 @@ static int s3c2410_udc_remove(struct platform_device *pdev)
 		return -EBUSY;
 
 	usb_del_gadget_udc(&udc->gadget);
-	debugfs_remove(udc->regs_info);
+	debugfs_remove(debugfs_lookup("registers", s3c2410_udc_debugfs_root));
 
 	if (udc_info && !udc_info->udc_command &&
 		gpio_is_valid(udc_info->pullup_pin))
diff --git a/drivers/usb/gadget/udc/s3c2410_udc.h b/drivers/usb/gadget/udc/s3c2410_udc.h
index 68bdf3e5aac2..135a5bff3c74 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.h
+++ b/drivers/usb/gadget/udc/s3c2410_udc.h
@@ -89,7 +89,6 @@ struct s3c2410_udc {
 	unsigned			req_config : 1;
 	unsigned			req_pending : 1;
 	u8				vbus;
-	struct dentry			*regs_info;
 	int				irq;
 };
 #define to_s3c2410(g)	(container_of((g), struct s3c2410_udc, gadget))
-- 
2.31.1

