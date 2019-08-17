Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BE59125E
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 20:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfHQSno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 14:43:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41546 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHQSnn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 17 Aug 2019 14:43:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8973CC065131;
        Sat, 17 Aug 2019 18:43:43 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-31.ams2.redhat.com [10.36.116.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 66C57179CC;
        Sat, 17 Aug 2019 18:43:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/3] usb: typec: tcpm: Use usb_debug_root as root for our debugfs entry
Date:   Sat, 17 Aug 2019 20:43:38 +0200
Message-Id: <20190817184340.64086-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 17 Aug 2019 18:43:43 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use usb_debug_root as root for our debugfs entry instead of creating our
own subdirectory under the debugfs root.

Another patch in this series will make the same change to the fusb302
driver, which also uses dev_name() (on the same device) for the debugfs
entry name. So we also prefix dev_name() with "tcpm-" here to avoid a
name conflict.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 15abe1d9958f..5241d17c3399 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -19,6 +19,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/usb.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/pd_ado.h>
 #include <linux/usb/pd_bdo.h>
@@ -571,17 +572,13 @@ static int tcpm_debug_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(tcpm_debug);
 
-static struct dentry *rootdir;
-
 static void tcpm_debugfs_init(struct tcpm_port *port)
 {
-	mutex_init(&port->logbuffer_lock);
-	/* /sys/kernel/debug/tcpm/usbcX */
-	if (!rootdir)
-		rootdir = debugfs_create_dir("tcpm", NULL);
+	char name[NAME_MAX];
 
-	port->dentry = debugfs_create_file(dev_name(port->dev),
-					   S_IFREG | 0444, rootdir,
+	mutex_init(&port->logbuffer_lock);
+	snprintf(name, NAME_MAX, "tcpm-%s", dev_name(port->dev));
+	port->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
 					   port, &tcpm_debug_fops);
 }
 
@@ -597,10 +594,6 @@ static void tcpm_debugfs_exit(struct tcpm_port *port)
 	mutex_unlock(&port->logbuffer_lock);
 
 	debugfs_remove(port->dentry);
-	if (list_empty(&rootdir->d_subdirs)) {
-		debugfs_remove(rootdir);
-		rootdir = NULL;
-	}
 }
 
 #else
-- 
2.23.0.rc2

