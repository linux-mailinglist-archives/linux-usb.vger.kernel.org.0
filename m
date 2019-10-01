Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6728AC31C4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 12:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731223AbfJAKvn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 06:51:43 -0400
Received: from mga12.intel.com ([192.55.52.136]:13738 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731030AbfJAKvn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 06:51:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 03:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="205042101"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2019 03:51:41 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: roles: Add usb_role_switch_find_by_fwnode()
Date:   Tue,  1 Oct 2019 13:51:37 +0300
Message-Id: <20191001105138.73036-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001105138.73036-1-heikki.krogerus@linux.intel.com>
References: <20191001105138.73036-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Simple wrapper function that searches USB role switches with
class_find_device_by_fwnode().

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/roles/class.c | 21 +++++++++++++++++++++
 include/linux/usb/role.h  |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 94b4e7db2b94..8273126ffdf4 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -175,6 +175,27 @@ void usb_role_switch_put(struct usb_role_switch *sw)
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_put);
 
+/**
+ * usb_role_switch_find_by_fwnode - Find USB role switch with its fwnode
+ * @fwnode: fwnode of the USB Role Switch
+ *
+ * Finds and returns role switch with @fwnode. The reference count for the
+ * found switch is incremented.
+ */
+struct usb_role_switch *
+usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+
+	if (!fwnode)
+		return NULL;
+
+	dev = class_find_device_by_fwnode(role_class, fwnode);
+
+	return dev ? to_role_switch(dev) : NULL;
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
+
 static umode_t
 usb_role_switch_is_visible(struct kobject *kobj, struct attribute *attr, int n)
 {
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index 2d77f97df72d..efac3af83d6b 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -50,6 +50,9 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev);
 struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *node);
 void usb_role_switch_put(struct usb_role_switch *sw);
 
+struct usb_role_switch *
+usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode);
+
 struct usb_role_switch *
 usb_role_switch_register(struct device *parent,
 			 const struct usb_role_switch_desc *desc);
-- 
2.23.0

