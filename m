Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26408F446
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 21:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731954AbfHOTSS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 15:18:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58948 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731941AbfHOTSS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 15:18:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4380D5AFF8;
        Thu, 15 Aug 2019 19:18:18 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 239686266B;
        Thu, 15 Aug 2019 19:18:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: tcpm: Use usb_debug_root as root for our debugfs entry
Date:   Thu, 15 Aug 2019 21:18:13 +0200
Message-Id: <20190815191815.755606-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 15 Aug 2019 19:18:18 +0000 (UTC)
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

