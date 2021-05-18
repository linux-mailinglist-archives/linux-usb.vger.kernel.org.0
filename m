Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E74387D43
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 18:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350572AbhERQWJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 12:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350581AbhERQWC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 12:22:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 566996100C;
        Tue, 18 May 2021 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621354843;
        bh=xR5miwTWOxrzpHAPCfD5zPEEV6zL8yul7Kbm37taVWw=;
        h=From:To:Cc:Subject:Date:From;
        b=UHJR7kuddEE5HQtA7uDSXscClkLMhSy7s5tVmhdPFV3UQsa9EyVjCOT0BGjzsBvMK
         hUFbLECdU4mZJXjGwx7ErPt4HdNktWWkSjdUhqTMAIQDu/sRh1W9JhArsnZkm5plkK
         PF7BPkx7IZ7ODZjnrJnPGp/cHKQ9BBsvfC5BXoJM=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] USB: gadget: lpc32xx_udc: remove debugfs dentry variable
Date:   Tue, 18 May 2021 18:20:35 +0200
Message-Id: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to store the dentry for a fixed filename that we have
the string for.  So just have debugfs look it up when we need it to
remove the file, no need to store it anywhere locally.

Note, this driver is broken in that debugfs will not work for more than
one instance of the device it supports.  But given that this patch does
not change that, and no one has ever seemed to notice, it must not be an
issue...

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 3f1c62adce4b..a25d01c89564 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -127,7 +127,6 @@ struct lpc32xx_udc {
 	struct usb_gadget_driver *driver;
 	struct platform_device	*pdev;
 	struct device		*dev;
-	struct dentry		*pde;
 	spinlock_t		lock;
 	struct i2c_client	*isp1301_i2c_client;
 
@@ -528,12 +527,12 @@ DEFINE_SHOW_ATTRIBUTE(udc);
 
 static void create_debug_file(struct lpc32xx_udc *udc)
 {
-	udc->pde = debugfs_create_file(debug_filename, 0, NULL, udc, &udc_fops);
+	debugfs_create_file(debug_filename, 0, NULL, udc, &udc_fops);
 }
 
 static void remove_debug_file(struct lpc32xx_udc *udc)
 {
-	debugfs_remove(udc->pde);
+	debugfs_remove(debugfs_lookup(debug_filename, NULL));
 }
 
 #else
-- 
2.31.1

