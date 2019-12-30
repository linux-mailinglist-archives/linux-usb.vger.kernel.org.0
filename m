Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF2A12D096
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfL3O0S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:18 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3O0S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233459"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:16 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 03/15] usb: typec: More API for cable handling
Date:   Mon, 30 Dec 2019 17:25:59 +0300
Message-Id: <20191230142611.24921-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thunderbolt 3, and probable USB4 too, will need to be able
to get details about the cables. Adding typec_cable_get()
function that the alternate mode drivers can use to gain
access to gain access to the cable.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 46 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  4 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 91d62276b56f..08923637cd88 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -834,6 +834,52 @@ static const struct device_type typec_cable_dev_type = {
 	.release = typec_cable_release,
 };
 
+static int cable_match(struct device *dev, void *data)
+{
+	return is_typec_cable(dev);
+}
+
+/**
+ * typec_cable_get - Get a reference to the USB Type-C cable
+ * @port: The USB Type-C Port the cable is connected to
+ *
+ * The caller must decrement the reference count with typec_cable_put() after
+ * use.
+ */
+struct typec_cable *typec_cable_get(struct typec_port *port)
+{
+	struct device *dev;
+
+	dev = device_find_child(&port->dev, NULL, cable_match);
+	if (!dev)
+		return NULL;
+
+	return to_typec_cable(dev);
+}
+EXPORT_SYMBOL_GPL(typec_cable_get);
+
+/**
+ * typec_cable_get - Decrement the reference count on USB Type-C cable
+ * @cable: The USB Type-C cable
+ */
+void typec_cable_put(struct typec_cable *cable)
+{
+	put_device(&cable->dev);
+}
+EXPORT_SYMBOL_GPL(typec_cable_put);
+
+/**
+ * typec_cable_is_active - Check is the USB Type-C cable active or passive
+ * @cable: The USB Type-C Cable
+ *
+ * Return 1 if the cable is active or 0 if it's passive.
+ */
+int typec_cable_is_active(struct typec_cable *cable)
+{
+	return cable->active;
+}
+EXPORT_SYMBOL_GPL(typec_cable_is_active);
+
 /**
  * typec_cable_set_identity - Report result from Discover Identity command
  * @cable: The cable updated identity values
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 0f52723a11bd..d95ea0d398b8 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -230,6 +230,10 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
 					 struct typec_cable_desc *desc);
 void typec_unregister_cable(struct typec_cable *cable);
 
+struct typec_cable *typec_cable_get(struct typec_port *port);
+void typec_cable_put(struct typec_cable *cable);
+int typec_cable_is_active(struct typec_cable *cable);
+
 struct typec_plug *typec_register_plug(struct typec_cable *cable,
 				       struct typec_plug_desc *desc);
 void typec_unregister_plug(struct typec_plug *plug);
-- 
2.24.1

