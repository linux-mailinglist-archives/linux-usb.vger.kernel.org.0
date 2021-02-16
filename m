Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D806031CC55
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhBPOrw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 09:47:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:36862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbhBPOrc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:47:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F6A264E02;
        Tue, 16 Feb 2021 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486811;
        bh=TEBV9VpD6nk0YI4sr84nQAcKYMYfEM1N6EDn0jtm5uo=;
        h=From:To:Cc:Subject:Date:From;
        b=MoSPiqkOdnhLOdtjDgsK+M4QjDdtVcSHYAWKUmMQjnmb/t65HQR6nqG1zSiYNeR9J
         Zj+6ZDgRgnFJn9DBope+zHoLLrXvN3VHhATtQ6SaGVDkxcDtZWeFBRNlTBI/9fpk3y
         s1W3U2yanZguusNf2SqtqjjQsNeh75e6UZMCr/VY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Olav Kongas <ok@artecdesign.ee>
Subject: [PATCH 1/6] USB: host: isp116x: remove dentry pointer for debugfs
Date:   Tue, 16 Feb 2021 15:46:40 +0100
Message-Id: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to keep the dentry pointer around for the created
debugfs file, as it is only needed when removing it from the system.
When it is to be removed, ask debugfs itself for the pointer, to save on
storage and make things a bit simpler.

Cc: Olav Kongas <ok@artecdesign.ee>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/isp116x-hcd.c | 7 +++----
 drivers/usb/host/isp116x.h     | 1 -
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 8544a2a2c1e6..8835f6bd528e 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -1200,14 +1200,13 @@ DEFINE_SHOW_ATTRIBUTE(isp116x_debug);
 
 static void create_debug_file(struct isp116x *isp116x)
 {
-	isp116x->dentry = debugfs_create_file(hcd_name,
-					      S_IRUGO, NULL, isp116x,
-					      &isp116x_debug_fops);
+	debugfs_create_file(hcd_name, S_IRUGO, usb_debug_root, isp116x,
+			    &isp116x_debug_fops);
 }
 
 static void remove_debug_file(struct isp116x *isp116x)
 {
-	debugfs_remove(isp116x->dentry);
+	debugfs_remove(debugfs_lookup(hcd_name, usb_debug_root));
 }
 
 #else
diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
index a5e929c10d53..84904025fe7f 100644
--- a/drivers/usb/host/isp116x.h
+++ b/drivers/usb/host/isp116x.h
@@ -260,7 +260,6 @@ struct isp116x {
 
 	struct isp116x_platform_data *board;
 
-	struct dentry *dentry;
 	unsigned long stat1, stat2, stat4, stat8, stat16;
 
 	/* HC registers */
-- 
2.30.1

