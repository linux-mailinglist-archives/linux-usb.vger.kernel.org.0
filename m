Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A5734FED4
	for <lists+linux-usb@lfdr.de>; Wed, 31 Mar 2021 13:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbhCaK7h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Mar 2021 06:59:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:21337 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235181AbhCaK7G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 31 Mar 2021 06:59:06 -0400
IronPort-SDR: 3K5bZDcro3qSimAug7mQTuSaWZ8ukX1gsLzcmcv5wbJQCsodLtvtT4O//PRxASLHI4pOSHtV9m
 OrvYbvsic8oA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="277160560"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="277160560"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 03:59:06 -0700
IronPort-SDR: LgsFJoseAodb7w1yKbnwBFpV5iqpXaLLBj4BCNJfTAML77TgYScxtdbqu5IOFQ6Fj1WLpURrZd
 ISYDKzttaXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="516844120"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2021 03:59:04 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] usb: Iterator for ports
Date:   Wed, 31 Mar 2021 13:59:07 +0300
Message-Id: <20210331105908.67066-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105908.67066-1-heikki.krogerus@linux.intel.com>
References: <20210331105908.67066-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introducing usb_for_each_port(). It works the same way as
usb_for_each_dev(), but instead of going through every USB
device in the system, it walks through the USB ports in the
system.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/core/usb.c | 46 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  9 +++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 2ce3667ec6fae..62368c4ed37af 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -398,6 +398,52 @@ int usb_for_each_dev(void *data, int (*fn)(struct usb_device *, void *))
 }
 EXPORT_SYMBOL_GPL(usb_for_each_dev);
 
+struct each_hub_arg {
+	void *data;
+	int (*fn)(struct device *, void *);
+};
+
+static int __each_hub(struct usb_device *hdev, void *data)
+{
+	struct each_hub_arg *arg = (struct each_hub_arg *)data;
+	struct usb_hub *hub;
+	int ret = 0;
+	int i;
+
+	hub = usb_hub_to_struct_hub(hdev);
+	if (!hub)
+		return 0;
+
+	mutex_lock(&usb_port_peer_mutex);
+
+	for (i = 0; i < hdev->maxchild; i++) {
+		ret = arg->fn(&hub->ports[i]->dev, arg->data);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&usb_port_peer_mutex);
+
+	return ret;
+}
+
+/**
+ * usb_for_each_port - interate over all USB ports in the system
+ * @data: data pointer that will be handed to the callback function
+ * @fn: callback function to be called for each USB port
+ *
+ * Iterate over all USB ports and call @fn for each, passing it @data. If it
+ * returns anything other than 0, we break the iteration prematurely and return
+ * that value.
+ */
+int usb_for_each_port(void *data, int (*fn)(struct device *, void *))
+{
+	struct each_hub_arg arg = {data, fn};
+
+	return usb_for_each_dev(&arg, __each_hub);
+}
+EXPORT_SYMBOL_GPL(usb_for_each_port);
+
 /**
  * usb_release_dev - free a usb device structure when all users of it are finished.
  * @dev: device that's been disconnected
diff --git a/include/linux/usb.h b/include/linux/usb.h
index ddd2f5b2a2827..ebcd03d835d04 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -882,6 +882,15 @@ extern struct usb_host_interface *usb_find_alt_setting(
 		unsigned int iface_num,
 		unsigned int alt_num);
 
+#ifdef CONFIG_USB
+int usb_for_each_port(void *data, int (*fn)(struct device *, void *));
+#else
+static inline int usb_for_each_port(void *data, int (*fn)(struct device *, void *))
+{
+	return 0;
+}
+#endif
+
 /* port claiming functions */
 int usb_hub_claim_port(struct usb_device *hdev, unsigned port1,
 		struct usb_dev_state *owner);
-- 
2.30.2

