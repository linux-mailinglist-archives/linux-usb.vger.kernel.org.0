Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9E68F447
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 21:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731960AbfHOTSU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 15:18:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45874 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731941AbfHOTST (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 15:18:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A89C2308FEC1;
        Thu, 15 Aug 2019 19:18:19 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 896C361F21;
        Thu, 15 Aug 2019 19:18:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: fusb: Use usb_debug_root as root for our debugfs entry
Date:   Thu, 15 Aug 2019 21:18:14 +0200
Message-Id: <20190815191815.755606-2-hdegoede@redhat.com>
In-Reply-To: <20190815191815.755606-1-hdegoede@redhat.com>
References: <20190815191815.755606-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 15 Aug 2019 19:18:19 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use usb_debug_root as root for our debugfs entry instead of creating our
own subdirectory under the debugfs root.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 93244d6c4bff..69a2afaf8f68 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -26,6 +26,7 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/usb.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/pd.h>
@@ -206,23 +207,17 @@ static int fusb302_debug_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(fusb302_debug);
 
-static struct dentry *rootdir;
-
 static void fusb302_debugfs_init(struct fusb302_chip *chip)
 {
 	mutex_init(&chip->logbuffer_lock);
-	if (!rootdir)
-		rootdir = debugfs_create_dir("fusb302", NULL);
-
 	chip->dentry = debugfs_create_file(dev_name(chip->dev),
-					   S_IFREG | 0444, rootdir,
+					   S_IFREG | 0444, usb_debug_root,
 					   chip, &fusb302_debug_fops);
 }
 
 static void fusb302_debugfs_exit(struct fusb302_chip *chip)
 {
 	debugfs_remove(chip->dentry);
-	debugfs_remove(rootdir);
 }
 
 #else
-- 
2.23.0.rc2

