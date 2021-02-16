Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7018231CC61
	for <lists+linux-usb@lfdr.de>; Tue, 16 Feb 2021 15:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhBPOsU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Feb 2021 09:48:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:37010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230224AbhBPOsK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Feb 2021 09:48:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9054F64E13;
        Tue, 16 Feb 2021 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613486825;
        bh=mH/H18163IIJ2OaGuTNJPli4BjvCJzElmH558oT96uI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vxE/we7ZsXt8B8dYszOaEN7l/+EZhv29HXLhSOdSxdIn63DXDUEiGgvks5S6askHH
         gMHVMe8q9u7zsVP5IJd0sgQh7K27b+ysIhmRLQFbecFbqeL2OWXahPj995JGgNHRUm
         kJFA51XVjzI+k7u72bqtXRU9AwpH44ERkBmGNZ2g=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 6/6] USB: typec: tcpm: create debugfs subdir for the driver
Date:   Tue, 16 Feb 2021 15:46:45 +0100
Message-Id: <20210216144645.3813043-6-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The single debugfs file for this driver really is a log file, so make a
subdir and call it "log" to make it obvious this is what it is for.
This makes cleanup simpler as we just remove the whole directory, no
need to handle individual files anymore.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 22a85b396f69..d4dd40c95a56 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -636,8 +636,9 @@ static void tcpm_debugfs_init(struct tcpm_port *port)
 
 	mutex_init(&port->logbuffer_lock);
 	snprintf(name, NAME_MAX, "tcpm-%s", dev_name(port->dev));
-	port->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
-					   port, &tcpm_debug_fops);
+	port->dentry = debugfs_create_dir(name, usb_debug_root);
+	debugfs_create_file("log", S_IFREG | 0444, port->dentry, port,
+			    &tcpm_debug_fops);
 }
 
 static void tcpm_debugfs_exit(struct tcpm_port *port)
-- 
2.30.1

