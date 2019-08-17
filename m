Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D54CD9125F
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 20:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfHQSnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 14:43:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41006 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHQSnp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 17 Aug 2019 14:43:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E5B61A391E0;
        Sat, 17 Aug 2019 18:43:44 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-31.ams2.redhat.com [10.36.116.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CDB0D1C3;
        Sat, 17 Aug 2019 18:43:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: fusb302: Use usb_debug_root as root for our debugfs entry
Date:   Sat, 17 Aug 2019 20:43:39 +0200
Message-Id: <20190817184340.64086-2-hdegoede@redhat.com>
In-Reply-To: <20190817184340.64086-1-hdegoede@redhat.com>
References: <20190817184340.64086-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Sat, 17 Aug 2019 18:43:45 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use usb_debug_root as root for our debugfs entry instead of creating our
own subdirectory under the debugfs root.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Prefix debugfs entry filename with "fusb302-"
---
 drivers/usb/typec/tcpm/fusb302.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 93244d6c4bff..603ab87b466e 100644
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
@@ -206,23 +207,19 @@ static int fusb302_debug_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(fusb302_debug);
 
-static struct dentry *rootdir;
-
 static void fusb302_debugfs_init(struct fusb302_chip *chip)
 {
-	mutex_init(&chip->logbuffer_lock);
-	if (!rootdir)
-		rootdir = debugfs_create_dir("fusb302", NULL);
+	char name[NAME_MAX];
 
-	chip->dentry = debugfs_create_file(dev_name(chip->dev),
-					   S_IFREG | 0444, rootdir,
+	mutex_init(&chip->logbuffer_lock);
+	snprintf(name, NAME_MAX, "fusb302-%s", dev_name(chip->dev));
+	chip->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
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

