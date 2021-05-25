Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550AC390738
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 19:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbhEYRPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 13:15:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233068AbhEYRPw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 13:15:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DD4F6141D;
        Tue, 25 May 2021 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621962862;
        bh=fDkfNMlC9wQ7QHYeWu3hJTuwGFbSKKYtHYUyCFPqNVc=;
        h=From:To:Cc:Subject:Date:From;
        b=XvWewFeNjURqwMK/ax1RVSuYVzgdl8RH7IaMAm/FKpxDSpDCztb5eznOVedwuGFdh
         rLiO6SzGdN3I9ENd/tfFDJEU6xoL0E6Z9pSi/EFukHj0AVNzNqmr9HUqTsWShfxpXw
         0hTACj8BE3eKAciD5JW3qfE1JSlDxh1frGrTgBv0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: chipidea: remove dentry storage for debugfs file
Date:   Tue, 25 May 2021 19:14:19 +0200
Message-Id: <20210525171419.758146-1-gregkh@linuxfoundation.org>
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

Cc: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/chipidea/ci.h    |  2 --
 drivers/usb/chipidea/debug.c | 34 ++++++++++++++--------------------
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 0697eb980e5f..99440baa6458 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -195,7 +195,6 @@ struct hw_bank {
  * @phy: pointer to PHY, if any
  * @usb_phy: pointer to USB PHY, if any and if using the USB PHY framework
  * @hcd: pointer to usb_hcd for ehci host driver
- * @debugfs: root dentry for this controller in debugfs
  * @id_event: indicates there is an id event, and handled at ci_otg_work
  * @b_sess_valid_event: indicates there is a vbus event, and handled
  * at ci_otg_work
@@ -249,7 +248,6 @@ struct ci_hdrc {
 	/* old usb_phy interface */
 	struct usb_phy			*usb_phy;
 	struct usb_hcd			*hcd;
-	struct dentry			*debugfs;
 	bool				id_event;
 	bool				b_sess_valid_event;
 	bool				imx28_write_fix;
diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index da5d18cf6840..faf6b078b6c4 100644
--- a/drivers/usb/chipidea/debug.c
+++ b/drivers/usb/chipidea/debug.c
@@ -342,26 +342,20 @@ DEFINE_SHOW_ATTRIBUTE(ci_registers);
  */
 void dbg_create_files(struct ci_hdrc *ci)
 {
-	ci->debugfs = debugfs_create_dir(dev_name(ci->dev), usb_debug_root);
-
-	debugfs_create_file("device", S_IRUGO, ci->debugfs, ci,
-			    &ci_device_fops);
-	debugfs_create_file("port_test", S_IRUGO | S_IWUSR, ci->debugfs, ci,
-			    &ci_port_test_fops);
-	debugfs_create_file("qheads", S_IRUGO, ci->debugfs, ci,
-			    &ci_qheads_fops);
-	debugfs_create_file("requests", S_IRUGO, ci->debugfs, ci,
-			    &ci_requests_fops);
-
-	if (ci_otg_is_fsm_mode(ci)) {
-		debugfs_create_file("otg", S_IRUGO, ci->debugfs, ci,
-				    &ci_otg_fops);
-	}
+	struct dentry *dir;
+
+	dir = debugfs_create_dir(dev_name(ci->dev), usb_debug_root);
+
+	debugfs_create_file("device", S_IRUGO, dir, ci, &ci_device_fops);
+	debugfs_create_file("port_test", S_IRUGO | S_IWUSR, dir, ci, &ci_port_test_fops);
+	debugfs_create_file("qheads", S_IRUGO, dir, ci, &ci_qheads_fops);
+	debugfs_create_file("requests", S_IRUGO, dir, ci, &ci_requests_fops);
+
+	if (ci_otg_is_fsm_mode(ci))
+		debugfs_create_file("otg", S_IRUGO, dir, ci, &ci_otg_fops);
 
-	debugfs_create_file("role", S_IRUGO | S_IWUSR, ci->debugfs, ci,
-			    &ci_role_fops);
-	debugfs_create_file("registers", S_IRUGO, ci->debugfs, ci,
-			    &ci_registers_fops);
+	debugfs_create_file("role", S_IRUGO | S_IWUSR, dir, ci, &ci_role_fops);
+	debugfs_create_file("registers", S_IRUGO, dir, ci, &ci_registers_fops);
 }
 
 /**
@@ -370,5 +364,5 @@ void dbg_create_files(struct ci_hdrc *ci)
  */
 void dbg_remove_files(struct ci_hdrc *ci)
 {
-	debugfs_remove_recursive(ci->debugfs);
+	debugfs_remove(debugfs_lookup(dev_name(ci->dev), usb_debug_root));
 }
-- 
2.31.1

