Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D801E31CC54
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhBPOrv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 09:47:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:36878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229916AbhBPOrh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:47:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9449A64E08;
        Tue, 16 Feb 2021 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486817;
        bh=choReWIN0pqXvzc8anpJKfSAJDfLDEX9wCMLtcLg63w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lbGh2GWs7p6SnuU+/tEkZvsKlYeRwBKxjS0SaPc03Xm0H3cDoEgLX3pEoRv534+FM
         PaV7HrYy46VUEkEPEtj9zqoYGaEN/mZjtpHgq1h/QI/1ZtO1b0ebpYmDEnr53l/rT2
         rFmHZsWWgEBM8QZA6094Nu8zNPomnRAdWX4x8GKI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/6] USB: host: sl811: remove dentry pointer for debugfs
Date:   Tue, 16 Feb 2021 15:46:42 +0100
Message-Id: <20210216144645.3813043-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to keep the dentry pointer around for the created
debugfs file, as it is only needed when removing it from the system.
When it is to be removed, ask debugfs itself for the pointer, to save on
storage and make things a bit simpler.

Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/sl811-hcd.c | 7 +++----
 drivers/usb/host/sl811.h     | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 115ced0d93e1..d49fb656d34b 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1496,14 +1496,13 @@ DEFINE_SHOW_ATTRIBUTE(sl811h_debug);
 /* expect just one sl811 per system */
 static void create_debug_file(struct sl811 *sl811)
 {
-	sl811->debug_file = debugfs_create_file("sl811h", S_IRUGO,
-						usb_debug_root, sl811,
-						&sl811h_debug_fops);
+	debugfs_create_file("sl811h", S_IRUGO, usb_debug_root, sl811,
+			    &sl811h_debug_fops);
 }
 
 static void remove_debug_file(struct sl811 *sl811)
 {
-	debugfs_remove(sl811->debug_file);
+	debugfs_remove(debugfs_lookup("sl811h", usb_debug_root));
 }
 
 /*-------------------------------------------------------------------------*/
diff --git a/drivers/usb/host/sl811.h b/drivers/usb/host/sl811.h
index 2abe51a5db44..ba8c9aa7dee8 100644
--- a/drivers/usb/host/sl811.h
+++ b/drivers/usb/host/sl811.h
@@ -123,7 +123,6 @@ struct sl811 {
 	void __iomem		*addr_reg;
 	void __iomem		*data_reg;
 	struct sl811_platform_data	*board;
-	struct dentry 		*debug_file;
 
 	unsigned long		stat_insrmv;
 	unsigned long		stat_wake;
-- 
2.30.1

