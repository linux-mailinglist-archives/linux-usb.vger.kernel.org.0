Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE86784219
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 15:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236111AbjHVNcP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 09:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjHVNcO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 09:32:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D3FA1
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692711132; x=1724247132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=br2YQCxJjPLwNeStHNAeyYevb/I8wsgZH/UM8+ugcb4=;
  b=Stlo3X4/Zw9jjT1tRo3LMxVDxH9KpgPCTgc5SffBcFCQ41TSiOgvkEEk
   1eXyCYnx0c8Ozd9MgZ5vb9YdsNMGhqQQnnt5/9WmuwGXHlXODJxT1Xyzb
   4LKZLl9oPvHLAUd1CbKRDEjOVhzoL015biFy5/lU9i12KMZq1yeUbgoDY
   fybYMSfuXi1hCmY2cltHAwyOwg05Xj7Evl7q6852q2cbxoWzKh/t0Hi7A
   nUBykIQ0pWE+Y/pJxn/251WP38Ewq2N+/ECRk/dUAPYVddvUN80aglNYx
   5hqG5dDFeUDahZb5Pj2oXgVE5kP+TFQTWZANXTCKeUjuCKL73dUbfSw6B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440243749"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="440243749"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879955080"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 06:32:15 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Benson Leung <bleung@google.com>
Cc:     Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/2] usb: Inform the USB Type-C class about enumerated devices
Date:   Tue, 22 Aug 2023 16:32:05 +0300
Message-Id: <20230822133205.2063210-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Type-C port drivers can make PM related decitions based
on is the device USB3 or USB2.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/core/hub.c  |  4 ++++
 drivers/usb/core/hub.h  |  3 +++
 drivers/usb/core/port.c | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3c54b218301c..53f5b902ce7d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2266,6 +2266,8 @@ void usb_disconnect(struct usb_device **pdev)
 		 */
 		if (!test_and_set_bit(port1, hub->child_usage_bits))
 			pm_runtime_get_sync(&port_dev->dev);
+
+		typec_deattach(port_dev->connector, &udev->dev);
 	}
 
 	usb_remove_ep_devs(&udev->ep0);
@@ -2612,6 +2614,8 @@ int usb_new_device(struct usb_device *udev)
 
 		if (!test_and_set_bit(port1, hub->child_usage_bits))
 			pm_runtime_get_sync(&port_dev->dev);
+
+		typec_attach(port_dev->connector, &udev->dev);
 	}
 
 	(void) usb_create_ep_devs(&udev->dev, &udev->ep0, udev);
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 37897afd1b64..bba7b40173dd 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -14,6 +14,7 @@
 #include <linux/usb.h>
 #include <linux/usb/ch11.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/typec.h>
 #include "usb.h"
 
 struct usb_hub {
@@ -82,6 +83,7 @@ struct usb_hub {
  * @dev: generic device interface
  * @port_owner: port's owner
  * @peer: related usb2 and usb3 ports (share the same connector)
+ * @connector: USB Type-C connector
  * @req: default pm qos request for hubs without port power control
  * @connect_type: port's connect type
  * @state: device state of the usb device attached to the port
@@ -100,6 +102,7 @@ struct usb_port {
 	struct device dev;
 	struct usb_dev_state *port_owner;
 	struct usb_port *peer;
+	struct typec_connector *connector;
 	struct dev_pm_qos_request *req;
 	enum usb_port_connect_type connect_type;
 	enum usb_device_state state;
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 77be0dc28da9..c17e6edf0ed6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -653,6 +653,7 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 
 static int connector_bind(struct device *dev, struct device *connector, void *data)
 {
+	struct usb_port *port_dev = to_usb_port(dev);
 	int ret;
 
 	ret = sysfs_create_link(&dev->kobj, &connector->kobj, "connector");
@@ -660,16 +661,30 @@ static int connector_bind(struct device *dev, struct device *connector, void *da
 		return ret;
 
 	ret = sysfs_create_link(&connector->kobj, &dev->kobj, dev_name(dev));
-	if (ret)
+	if (ret) {
 		sysfs_remove_link(&dev->kobj, "connector");
+		return ret;
+	}
+
+	port_dev->connector = data;
+
+	/*
+	 * If the USB device was enumerated before this is called, infoming
+	 * the Type-C connector about that device separately.
+	 */
+	if (port_dev->child)
+		typec_attach(port_dev->connector, &port_dev->child->dev);
 
-	return ret;
+	return 0;
 }
 
 static void connector_unbind(struct device *dev, struct device *connector, void *data)
 {
+	struct usb_port *port_dev = to_usb_port(dev);
+
 	sysfs_remove_link(&connector->kobj, dev_name(dev));
 	sysfs_remove_link(&dev->kobj, "connector");
+	port_dev->connector = NULL;
 }
 
 static const struct component_ops connector_ops = {
-- 
2.40.1

