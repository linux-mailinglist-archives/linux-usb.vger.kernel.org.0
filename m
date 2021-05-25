Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD19E390743
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 19:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbhEYRQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 13:16:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232349AbhEYRQl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 13:16:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B204613F4;
        Tue, 25 May 2021 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621962911;
        bh=fbhRNkEVhF5CHi5oKjA3XQZ+UfaKp1lUOc9fyNrrKWM=;
        h=From:To:Cc:Subject:Date:From;
        b=L1NJV5NrvOdWccf9JyYDNgsfZdxWOPvefg2E8cZu/2EVp4B2L4wMI59+biVbA+TaR
         XSEmYAEJY5IRcHUt4qDntfFNki6ggwKal2AhllC4mgPmVYWSf7lxGRDuT8KZcSofrH
         /kHHVW4xgTuKXqpZlcJOHCErHChyqWwV9vl8JNfA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kevin Cernekee <cernekee@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] USB: gadget: bcm63xx_udc: remove dentry storage for debugfs file
Date:   Tue, 25 May 2021 19:15:08 +0200
Message-Id: <20210525171508.758365-1-gregkh@linuxfoundation.org>
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

Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/bcm63xx_udc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index 9cd4a70ccdd6..a9f07c59fc37 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -288,7 +288,6 @@ struct bcm63xx_req {
  * @ep0_req_completed: ep0 request has completed; worker has not seen it yet.
  * @ep0_reply: Pending reply from gadget driver.
  * @ep0_request: Outstanding ep0 request.
- * @debugfs_root: debugfs directory: /sys/kernel/debug/<DRV_MODULE_NAME>.
  */
 struct bcm63xx_udc {
 	spinlock_t			lock;
@@ -327,8 +326,6 @@ struct bcm63xx_udc {
 	unsigned			ep0_req_completed:1;
 	struct usb_request		*ep0_reply;
 	struct usb_request		*ep0_request;
-
-	struct dentry			*debugfs_root;
 };
 
 static const struct usb_ep_ops bcm63xx_udc_ep_ops;
@@ -2250,8 +2247,6 @@ static void bcm63xx_udc_init_debugfs(struct bcm63xx_udc *udc)
 		return;
 
 	root = debugfs_create_dir(udc->gadget.name, usb_debug_root);
-	udc->debugfs_root = root;
-
 	debugfs_create_file("usbd", 0400, root, udc, &bcm63xx_usbd_dbg_fops);
 	debugfs_create_file("iudma", 0400, root, udc, &bcm63xx_iudma_dbg_fops);
 }
@@ -2264,7 +2259,7 @@ static void bcm63xx_udc_init_debugfs(struct bcm63xx_udc *udc)
  */
 static void bcm63xx_udc_cleanup_debugfs(struct bcm63xx_udc *udc)
 {
-	debugfs_remove_recursive(udc->debugfs_root);
+	debugfs_remove(debugfs_lookup(udc->gadget.name, usb_debug_root));
 }
 
 /***********************************************************************
-- 
2.31.1

