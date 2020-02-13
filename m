Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE9115BF39
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 14:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730040AbgBMNYi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 08:24:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:44559 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730000AbgBMNYh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 08:24:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 05:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="scan'208";a="347728496"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2020 05:24:35 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/9] usb: typec: mux: Allow the mux handles to be requested with fwnode
Date:   Thu, 13 Feb 2020 16:24:22 +0300
Message-Id: <20200213132428.53374-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213132428.53374-1-heikki.krogerus@linux.intel.com>
References: <20200213132428.53374-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introducing fwnode_typec_switch_get() and
fwnode_typec_mux_get() functions that work just like
typec_switch_get() and typec_mux_get() but they take struct
fwnode_handle as the first parameter instead of struct
device.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux.c       | 22 +++++++++++-----------
 include/linux/usb/typec_mux.h | 18 +++++++++++++++---
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 2b10869f0abd..e3a63b33d024 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -59,26 +59,26 @@ static void *typec_switch_match(struct device_connection *con, int ep,
 }
 
 /**
- * typec_switch_get - Find USB Type-C orientation switch
- * @dev: The caller device
+ * fwnode_typec_switch_get - Find USB Type-C orientation switch
+ * @fwnode: The caller device node
  *
  * Finds a switch linked with @dev. Returns a reference to the switch on
  * success, NULL if no matching connection was found, or
  * ERR_PTR(-EPROBE_DEFER) when a connection was found but the switch
  * has not been enumerated yet.
  */
-struct typec_switch *typec_switch_get(struct device *dev)
+struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 {
 	struct typec_switch *sw;
 
-	sw = device_connection_find_match(dev, "orientation-switch", NULL,
+	sw = fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
 					  typec_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
 
 	return sw;
 }
-EXPORT_SYMBOL_GPL(typec_switch_get);
+EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
 
 /**
  * typec_put_switch - Release USB Type-C orientation switch
@@ -258,8 +258,8 @@ static void *typec_mux_match(struct device_connection *con, int ep, void *data)
 }
 
 /**
- * typec_mux_get - Find USB Type-C Multiplexer
- * @dev: The caller device
+ * fwnode_typec_mux_get - Find USB Type-C Multiplexer
+ * @fwnode: The caller device node
  * @desc: Alt Mode description
  *
  * Finds a mux linked to the caller. This function is primarily meant for the
@@ -267,19 +267,19 @@ static void *typec_mux_match(struct device_connection *con, int ep, void *data)
  * matching connection was found, or ERR_PTR(-EPROBE_DEFER) when a connection
  * was found but the mux has not been enumerated yet.
  */
-struct typec_mux *typec_mux_get(struct device *dev,
-				const struct typec_altmode_desc *desc)
+struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
+				       const struct typec_altmode_desc *desc)
 {
 	struct typec_mux *mux;
 
-	mux = device_connection_find_match(dev, "mode-switch", (void *)desc,
+	mux = fwnode_connection_find_match(fwnode, "mode-switch", (void *)desc,
 					   typec_mux_match);
 	if (!IS_ERR_OR_NULL(mux))
 		WARN_ON(!try_module_get(mux->dev.parent->driver->owner));
 
 	return mux;
 }
-EXPORT_SYMBOL_GPL(typec_mux_get);
+EXPORT_SYMBOL_GPL(fwnode_typec_mux_get);
 
 /**
  * typec_mux_put - Release handle to a Multiplexer
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index 4991c93df5d0..a9d9957933dc 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -3,6 +3,7 @@
 #ifndef __USB_TYPEC_MUX
 #define __USB_TYPEC_MUX
 
+#include <linux/property.h>
 #include <linux/usb/typec.h>
 
 struct device;
@@ -21,11 +22,16 @@ struct typec_switch_desc {
 	void *drvdata;
 };
 
-struct typec_switch *typec_switch_get(struct device *dev);
+struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode);
 void typec_switch_put(struct typec_switch *sw);
 int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation);
 
+static inline struct typec_switch *typec_switch_get(struct device *dev)
+{
+	return fwnode_typec_switch_get(dev_fwnode(dev));
+}
+
 struct typec_switch *
 typec_switch_register(struct device *parent,
 		      const struct typec_switch_desc *desc);
@@ -50,11 +56,17 @@ struct typec_mux_desc {
 	void *drvdata;
 };
 
-struct typec_mux *
-typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc);
+struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
+				       const struct typec_altmode_desc *desc);
 void typec_mux_put(struct typec_mux *mux);
 int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
 
+static inline struct typec_mux *
+typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
+{
+	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
+}
+
 struct typec_mux *
 typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
 void typec_mux_unregister(struct typec_mux *mux);
-- 
2.25.0

