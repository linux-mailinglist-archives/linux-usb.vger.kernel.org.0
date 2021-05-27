Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28911392B8B
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 12:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236103AbhE0KQH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 06:16:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:48944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236023AbhE0KQG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 06:16:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E16BC613AF;
        Thu, 27 May 2021 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622110473;
        bh=aSbVtg3JAL80z7JEB0y4ZLdk3NfLm7kCW19/b4elr74=;
        h=From:To:Cc:Subject:Date:From;
        b=nU/mVeJwy/EVdWWvRYzzQQIqSv3iZdIm4DPjL6PM4GJhyb+9tnouPcqyvr4UtVfnJ
         VDsOrqjh3G7J6ikoBpcsmDh1Trv2U6giAf7L71ivVJv6K+KkkNQ750GSIHq7aG6tMo
         cm3uCHIHtSVEv2B3V/5MSO/Tl59N3hsgQl6CsOQE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] USB: gr_udc: remove dentry storage for debugfs file
Date:   Thu, 27 May 2021 12:14:26 +0200
Message-Id: <20210527101426.3283214-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; h=from:subject; bh=aSbVtg3JAL80z7JEB0y4ZLdk3NfLm7kCW19/b4elr74=; b=owGbwMvMwCRo6H6F97bub03G02pJDAnrC5kcS6VO5594++ZDO+OTarclXwrjJAWX7X3p9iFtwsyy eW8tO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiV/IYFvQ94XPWZvbeFv17UXl491 6Fk1ysPAwLJp7sr/tvLvBhnVCY2i+JS2ZHy5TkAQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to store the dentry pointer for a debugfs file that we
only use to remove it when the device goes away.  debugfs can do the
lookup for us instead, saving us some trouble, and making things smaller
overall.

Cc: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/udc/gr_udc.c | 7 ++++---
 drivers/usb/gadget/udc/gr_udc.h | 2 --
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index f8f3aa52383b..4b35739d3695 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -207,14 +207,15 @@ DEFINE_SHOW_ATTRIBUTE(gr_dfs);
 static void gr_dfs_create(struct gr_udc *dev)
 {
 	const char *name = "gr_udc_state";
+	struct dentry *root;
 
-	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), usb_debug_root);
-	debugfs_create_file(name, 0444, dev->dfs_root, dev, &gr_dfs_fops);
+	root = debugfs_create_dir(dev_name(dev->dev), usb_debug_root);
+	debugfs_create_file(name, 0444, root, dev, &gr_dfs_fops);
 }
 
 static void gr_dfs_delete(struct gr_udc *dev)
 {
-	debugfs_remove_recursive(dev->dfs_root);
+	debugfs_remove(debugfs_lookup(dev_name(dev->dev), usb_debug_root));
 }
 
 #else /* !CONFIG_USB_GADGET_DEBUG_FS */
diff --git a/drivers/usb/gadget/udc/gr_udc.h b/drivers/usb/gadget/udc/gr_udc.h
index ac5b3f65adb5..70134239179e 100644
--- a/drivers/usb/gadget/udc/gr_udc.h
+++ b/drivers/usb/gadget/udc/gr_udc.h
@@ -215,8 +215,6 @@ struct gr_udc {
 	struct list_head ep_list;
 
 	spinlock_t lock; /* General lock, a.k.a. "dev->lock" in comments */
-
-	struct dentry *dfs_root;
 };
 
 #define to_gr_udc(gadget)	(container_of((gadget), struct gr_udc, gadget))
-- 
2.31.1

