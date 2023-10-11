Return-Path: <linux-usb+bounces-1459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A297C50AD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2461C21074
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295571A727;
	Wed, 11 Oct 2023 10:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaMzdhUu"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B691798E
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:58:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B38E92
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021913; x=1728557913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JhuOaUwahtMLvIe037hZuUyr8OdcYVAOM9DPiM6CTmk=;
  b=OaMzdhUuRW2XkZrFIVJzjMUbx55i1409E9U4FkkutkeDfkDpnmiqy7oJ
   svtfbuY8L2W+mvRjma3OC8HGvbiCNoPGpdDCYpgvB3gNWKjR9tqJ6y6G9
   4jd8sJ1Ialp2AqqaoquvXgRVyoiARrd6ZVT9cdcET8giSqePBovKkvWFk
   PHa44mNIL1YKuQ0tr1XRg9g8Q3rs7qWPIVqqmFCeT+GDftyqo8WVb8lkn
   mEDaXxxnELtND7rKr24nKzHu9+/6wcSbu2pebtYrpOVuuEci6qNdI1feD
   33XayZ5gnb4GcjWqhjLq9Ae1GlsAeLgy1aSX7+1B8v7/F83o44yttgITg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6190653"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6190653"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897589189"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897589189"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 03:56:46 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@google.com>,
	Won Chung <wonchung@google.com>,
	linux-usb@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 2/2] usb: Inform the USB Type-C class about enumerated devices
Date: Wed, 11 Oct 2023 13:58:25 +0300
Message-Id: <20231011105825.320062-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231011105825.320062-1-heikki.krogerus@linux.intel.com>
References: <20231011105825.320062-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The Type-C port drivers can make PM related decisions based
on is the device USB3 or USB2.

Suggested-by: Benson Leung <bleung@chromium.org>
Tested-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/core/hub.c  |  4 ++++
 drivers/usb/core/hub.h  |  3 +++
 drivers/usb/core/port.c | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0ff47eeffb49..b4584a0cd484 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2274,6 +2274,8 @@ void usb_disconnect(struct usb_device **pdev)
 		 */
 		if (!test_and_set_bit(port1, hub->child_usage_bits))
 			pm_runtime_get_sync(&port_dev->dev);
+
+		typec_deattach(port_dev->connector, &udev->dev);
 	}
 
 	usb_remove_ep_devs(&udev->ep0);
@@ -2620,6 +2622,8 @@ int usb_new_device(struct usb_device *udev)
 
 		if (!test_and_set_bit(port1, hub->child_usage_bits))
 			pm_runtime_get_sync(&port_dev->dev);
+
+		typec_attach(port_dev->connector, &udev->dev);
 	}
 
 	(void) usb_create_ep_devs(&udev->dev, &udev->ep0, udev);
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index d44dd7f6623e..43ce21c96a51 100644
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
index 77be0dc28da9..149bedb8e64f 100644
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
+	 * If there is already USB device connected to the port, letting the
+	 * Type-C connector know about it immediately.
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


