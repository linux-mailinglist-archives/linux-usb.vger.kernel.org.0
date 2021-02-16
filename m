Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6388131CC53
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBPOra (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 09:47:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:36846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbhBPOr3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:47:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCEFA64DF5;
        Tue, 16 Feb 2021 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486809;
        bh=V1M6DWT2xcy+/f9ZChv66lgeujvHL4iFKub1t/fixWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gW7oBTKEEqAqU5M9VA1TpN2ILHey70DwR2UC9qC0t1/EbddKg/y4rRn7A8T5E/7kK
         pgnlDilwv7uE3a8aZMjpqxAomuUCc74X39oqOz/FcuJzVltYYpXCtLlgl6utJIpMuY
         5/owhuTebD99mIqJ/oZCMZbS08qsUCVQPc0f+7iQ=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/6] USB: host: isp1362: remove dentry pointer for debugfs
Date:   Tue, 16 Feb 2021 15:46:41 +0100
Message-Id: <20210216144645.3813043-2-gregkh@linuxfoundation.org>
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
 drivers/usb/host/isp1362-hcd.c | 8 +++-----
 drivers/usb/host/isp1362.h     | 1 -
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index 2cecb36d241b..d8610ce8f2ec 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -2164,15 +2164,13 @@ DEFINE_SHOW_ATTRIBUTE(isp1362);
 /* expect just one isp1362_hcd per system */
 static void create_debug_file(struct isp1362_hcd *isp1362_hcd)
 {
-	isp1362_hcd->debug_file = debugfs_create_file("isp1362", S_IRUGO,
-						      usb_debug_root,
-						      isp1362_hcd,
-						      &isp1362_fops);
+	debugfs_create_file("isp1362", S_IRUGO, usb_debug_root, isp1362_hcd,
+			    &isp1362_fops);
 }
 
 static void remove_debug_file(struct isp1362_hcd *isp1362_hcd)
 {
-	debugfs_remove(isp1362_hcd->debug_file);
+	debugfs_remove(debugfs_lookup("isp1362", usb_debug_root));
 }
 
 /*-------------------------------------------------------------------------*/
diff --git a/drivers/usb/host/isp1362.h b/drivers/usb/host/isp1362.h
index 208705b08d37..74ca4be24723 100644
--- a/drivers/usb/host/isp1362.h
+++ b/drivers/usb/host/isp1362.h
@@ -435,7 +435,6 @@ struct isp1362_hcd {
 
 	struct isp1362_platform_data *board;
 
-	struct dentry		*debug_file;
 	unsigned long		stat1, stat2, stat4, stat8, stat16;
 
 	/* HC registers */
-- 
2.30.1

