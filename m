Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C01E390788
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 19:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhEYR1H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 13:27:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:56890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229610AbhEYR1H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 13:27:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9B746135F;
        Tue, 25 May 2021 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621963537;
        bh=JtnU3/F7cnjjJJQsQqUR+lSMZ8Jxo3LnFxU3bn8BBBU=;
        h=From:To:Cc:Subject:Date:From;
        b=OEGm9E5PS13t5hB0WwuDn0fqUXgfLzN6x34t0CcsI/h/TdDWYmqOcPA+Ok3SohqcN
         s4beed8BaUVFvnAwu2jZbxlMvKyAmRsHzyDITZV2WINCk9s9VXEby541HTGnc5ZI21
         O7LDTsfR/8rmXfvoVLSVDCGbtsMygsR4Ad8W/Q8Y=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: fotg210-hcd: remove dentry storage for debugfs file
Date:   Tue, 25 May 2021 19:25:34 +0200
Message-Id: <20210525172534.848775-1-gregkh@linuxfoundation.org>
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

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/fotg210-hcd.c | 5 +++--
 drivers/usb/host/fotg210.h     | 3 ---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 9c2eda0918e1..05fb8d97cf02 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -850,7 +850,6 @@ static inline void create_debug_files(struct fotg210_hcd *fotg210)
 	struct dentry *root;
 
 	root = debugfs_create_dir(bus->bus_name, fotg210_debug_root);
-	fotg210->debug_dir = root;
 
 	debugfs_create_file("async", S_IRUGO, root, bus, &debug_async_fops);
 	debugfs_create_file("periodic", S_IRUGO, root, bus,
@@ -861,7 +860,9 @@ static inline void create_debug_files(struct fotg210_hcd *fotg210)
 
 static inline void remove_debug_files(struct fotg210_hcd *fotg210)
 {
-	debugfs_remove_recursive(fotg210->debug_dir);
+	struct usb_bus *bus = &fotg210_to_hcd(fotg210)->self;
+
+	debugfs_remove(debugfs_lookup(bus->bus_name, fotg210_debug_root));
 }
 
 /* handshake - spin reading hc until handshake completes or fails
diff --git a/drivers/usb/host/fotg210.h b/drivers/usb/host/fotg210.h
index 6cee40ec65b4..0a91061a0551 100644
--- a/drivers/usb/host/fotg210.h
+++ b/drivers/usb/host/fotg210.h
@@ -184,9 +184,6 @@ struct fotg210_hcd {			/* one per controller */
 
 	/* silicon clock */
 	struct clk		*pclk;
-
-	/* debug files */
-	struct dentry		*debug_dir;
 };
 
 /* convert between an HCD pointer and the corresponding FOTG210_HCD */
-- 
2.31.1

