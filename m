Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B67158D87
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 12:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgBKLZk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 06:25:40 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbgBKLZj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261840"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:38 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 5/6] usb: typec: altmode: Remove the notification chain
Date:   Tue, 11 Feb 2020 14:25:30 +0300
Message-Id: <20200211112531.86510-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Using the generic notification chain is not reasonable with
the alternate modes because it would require dependencies
between the drivers of the components that need the
notifications, and the typec drivers.

There are no users for the alternate mode notifications, so
removing the chain and the API for it completely.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/driver-api/usb/typec_bus.rst | 22 +------
 drivers/usb/typec/bus.c                    | 12 +---
 drivers/usb/typec/bus.h                    |  2 -
 drivers/usb/typec/class.c                  | 67 +---------------------
 include/linux/usb/typec_altmode.h          |  7 ---
 5 files changed, 3 insertions(+), 107 deletions(-)

diff --git a/Documentation/driver-api/usb/typec_bus.rst b/Documentation/driver-api/usb/typec_bus.rst
index f47a69bff498..03dfa9c018b7 100644
--- a/Documentation/driver-api/usb/typec_bus.rst
+++ b/Documentation/driver-api/usb/typec_bus.rst
@@ -53,9 +53,7 @@ in need to reconfigure the pins on the connector, the alternate mode driver
 needs to notify the bus using :c:func:`typec_altmode_notify()`. The driver
 passes the negotiated SVID specific pin configuration value to the function as
 parameter. The bus driver will then configure the mux behind the connector using
-that value as the state value for the mux, and also call blocking notification
-chain to notify the external drivers about the state of the connector that need
-to know it.
+that value as the state value for the mux.
 
 NOTE: The SVID specific pin configuration values must always start from
 ``TYPEC_STATE_MODAL``. USB Type-C specification defines two default states for
@@ -80,19 +78,6 @@ Helper macro ``TYPEC_MODAL_STATE()`` can also be used::
 #define ALTMODEX_CONF_A = TYPEC_MODAL_STATE(0);
 #define ALTMODEX_CONF_B = TYPEC_MODAL_STATE(1);
 
-Notification chain
-~~~~~~~~~~~~~~~~~~
-
-The drivers for the components that the alternate modes are designed for need to
-get details regarding the results of the negotiation with the partner, and the
-pin configuration of the connector. In case of DisplayPort alternate mode for
-example, the GPU drivers will need to know those details. In case of
-Thunderbolt alternate mode, the thunderbolt drivers will need to know them, and
-so on.
-
-The notification chain is designed for this purpose. The drivers can register
-notifiers with :c:func:`typec_altmode_register_notifier()`.
-
 Cable plug alternate modes
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -129,8 +114,3 @@ Cable Plug operations
 
 .. kernel-doc:: drivers/usb/typec/bus.c
    :functions: typec_altmode_get_plug typec_altmode_put_plug
-
-Notifications
-~~~~~~~~~~~~~
-.. kernel-doc:: drivers/usb/typec/class.c
-   :functions: typec_altmode_register_notifier typec_altmode_unregister_notifier
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 2e45eb479386..c823122f9cb7 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -30,17 +30,10 @@ static int typec_altmode_set_state(struct typec_altmode *adev,
 {
 	bool is_port = is_typec_port(adev->dev.parent);
 	struct altmode *port_altmode;
-	int ret;
 
 	port_altmode = is_port ? to_altmode(adev) : to_altmode(adev)->partner;
 
-	ret = typec_altmode_set_mux(port_altmode, conf, data);
-	if (ret)
-		return ret;
-
-	blocking_notifier_call_chain(&port_altmode->nh, conf, NULL);
-
-	return 0;
+	return typec_altmode_set_mux(port_altmode, conf, data);
 }
 
 /* -------------------------------------------------------------------------- */
@@ -82,9 +75,6 @@ int typec_altmode_notify(struct typec_altmode *adev,
 	if (ret)
 		return ret;
 
-	blocking_notifier_call_chain(is_port ? &altmode->nh : &partner->nh,
-				     conf, data);
-
 	if (partner->adev.ops && partner->adev.ops->notify)
 		return partner->adev.ops->notify(&partner->adev, conf, data);
 
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 0c9661c96473..8ba8112d2740 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -22,8 +22,6 @@ struct altmode {
 
 	struct altmode			*partner;
 	struct altmode			*plug[2];
-
-	struct blocking_notifier_head	nh;
 };
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9cf4f6deb5a6..12be5bb6d32c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -206,69 +206,6 @@ static void typec_altmode_put_partner(struct altmode *altmode)
 	put_device(&adev->dev);
 }
 
-static void *typec_port_match(struct device_connection *con, int ep, void *data)
-{
-	struct device *dev;
-
-	/*
-	 * FIXME: Check does the fwnode supports the requested SVID. If it does
-	 * we need to return ERR_PTR(-PROBE_DEFER) when there is no device.
-	 */
-	if (con->fwnode)
-		return class_find_device_by_fwnode(typec_class, con->fwnode);
-
-	dev = class_find_device_by_name(typec_class, con->endpoint[ep]);
-
-	return dev ? dev : ERR_PTR(-EPROBE_DEFER);
-}
-
-struct typec_altmode *
-typec_altmode_register_notifier(struct device *dev, u16 svid, u8 mode,
-				struct notifier_block *nb)
-{
-	struct typec_device_id id = { svid, mode, };
-	struct device *altmode_dev;
-	struct device *port_dev;
-	struct altmode *altmode;
-	int ret;
-
-	/* Find the port linked to the caller */
-	port_dev = device_connection_find_match(dev, NULL, NULL,
-						typec_port_match);
-	if (IS_ERR_OR_NULL(port_dev))
-		return port_dev ? ERR_CAST(port_dev) : ERR_PTR(-ENODEV);
-
-	/* Find the altmode with matching svid */
-	altmode_dev = device_find_child(port_dev, &id, altmode_match);
-
-	put_device(port_dev);
-
-	if (!altmode_dev)
-		return ERR_PTR(-ENODEV);
-
-	altmode = to_altmode(to_typec_altmode(altmode_dev));
-
-	/* Register notifier */
-	ret = blocking_notifier_chain_register(&altmode->nh, nb);
-	if (ret) {
-		put_device(altmode_dev);
-		return ERR_PTR(ret);
-	}
-
-	return &altmode->adev;
-}
-EXPORT_SYMBOL_GPL(typec_altmode_register_notifier);
-
-void typec_altmode_unregister_notifier(struct typec_altmode *adev,
-				       struct notifier_block *nb)
-{
-	struct altmode *altmode = to_altmode(adev);
-
-	blocking_notifier_chain_unregister(&altmode->nh, nb);
-	put_device(&adev->dev);
-}
-EXPORT_SYMBOL_GPL(typec_altmode_unregister_notifier);
-
 /**
  * typec_altmode_update_active - Report Enter/Exit mode
  * @adev: Handle to the alternate mode
@@ -538,9 +475,7 @@ typec_register_altmode(struct device *parent,
 	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
 
 	/* Link partners and plugs with the ports */
-	if (is_port)
-		BLOCKING_INIT_NOTIFIER_HEAD(&alt->nh);
-	else
+	if (!is_port)
 		typec_altmode_set_partner(alt);
 
 	/* The partners are bind to drivers */
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 923ff3af0628..d834e236c6df 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -126,13 +126,6 @@ void typec_altmode_put_plug(struct typec_altmode *plug);
 struct typec_altmode *typec_match_altmode(struct typec_altmode **altmodes,
 					  size_t n, u16 svid, u8 mode);
 
-struct typec_altmode *
-typec_altmode_register_notifier(struct device *dev, u16 svid, u8 mode,
-				struct notifier_block *nb);
-
-void typec_altmode_unregister_notifier(struct typec_altmode *adev,
-				       struct notifier_block *nb);
-
 /**
  * typec_altmode_get_orientation - Get cable plug orientation
  * altmode: Handle to the alternate mode
-- 
2.25.0

