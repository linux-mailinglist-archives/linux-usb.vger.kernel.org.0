Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBF053B175
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 04:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbiFBB1m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 21:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233172AbiFBB1l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 21:27:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0956DF0B
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 18:27:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwZcd-0000Lw-Cz; Thu, 02 Jun 2022 03:27:35 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwZcd-005wLF-AI; Thu, 02 Jun 2022 03:27:33 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwZcb-00CLRa-8T; Thu, 02 Jun 2022 03:27:33 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: [PATCH v2] usb: hub: port: add sysfs entry to switch port power
Date:   Thu,  2 Jun 2022 03:27:31 +0200
Message-Id: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In some cases the port of an hub needs to be disabled or switched off
and on again. E.g. when the connected device needs to be re-enumerated.
Or it needs to be explicitly disabled while the rest of the usb tree
stays working.

For this purpose this patch adds an sysfs switch to enable/disable the
port on any hub. In the case the hub is supporting power switching, the
power line will be disabled to the connected device.

When the port gets disabled, the associated device gets disconnected and
removed from the logical usb tree. No further device will be enumerated
on that port until the port gets enabled again.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2:
         - improved patch description
	 - moved usb_hub_set_port_power to end of function
	 - renamed value to set
         - removed udev variable
         - added usb_set_configuration set to -1 before removing device
         - calling autosuspend of udev before usb_disconnect, ensuring hub_suspend succeeds
         - removed port_dev->child = NULL assignment
         - directly returning count on no failure success
         - removed test for hub->in_reset
	 - using usb_autopm_get_interface/usb_autopm_put_interface around hub handling
	 - locking usb_disconnect call
	 - using &port_dev->child instead of local udev pointer
	 - added Documentation/ABI

 Documentation/ABI/testing/sysfs-bus-usb | 13 +++++++
 drivers/usb/core/port.c                 | 49 +++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index 7efe31ed3a25c7..9c87ca50bcab79 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -253,6 +253,19 @@ Description:
 		only if the system firmware is capable of describing the
 		connection between a port and its connector.
 
+What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/port_power
+Date:		June 2022
+Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
+Description:
+		To disable or enable a hub port the sysfs file port_power exists
+		for each hub port. When disabling the hub port it is unusable anymore,
+		which means no enumeration will take place on this port until enabled again.
+
+		When disabling the port set (<hubdev-portX>/port_power to 0) the
+		USB_PORT_FEAT_C_CONNECTION, USB_PORT_FEAT_POWER and (for high speed hubs) the
+		USB_PORT_FEAT_C_ENABLE port features are cleared. It all gets reversed when the
+		port will be enabled again (set <hubdev-portX>/port_power to 1).
+
 What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
 Date:		May 2013
 Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index d5bc36ca5b1f77..3e707db88291e9 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -17,6 +17,54 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+static ssize_t port_power_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+	struct usb_device *hdev = to_usb_device(dev->parent->parent);
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	struct usb_interface *intf = to_usb_interface(hub->intfdev);
+	int port1 = port_dev->portnum;
+	bool set;
+	int rc;
+
+	if (!hub)
+		return -EINVAL;
+
+	rc = strtobool(buf, &set);
+	if (rc)
+		return rc;
+
+	rc = usb_autopm_get_interface(intf);
+	if (rc < 0)
+		return rc;
+
+	if (!set) {
+		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
+		if (!port_dev->is_superspeed)
+			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
+
+		if (port_dev->child) {
+			usb_set_configuration(port_dev->child, -1);
+			usb_autosuspend_device(port_dev->child);
+			usb_lock_device(hdev);
+			usb_disconnect(&port_dev->child);
+			usb_unlock_device(hdev);
+		}
+	}
+
+	rc = usb_hub_set_port_power(hdev, hub, port1, set);
+	if (rc) {
+		usb_autopm_put_interface(intf);
+		return rc;
+	}
+
+	usb_autopm_put_interface(intf);
+
+	return count;
+}
+static DEVICE_ATTR_WO(port_power);
+
 static ssize_t location_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -153,6 +201,7 @@ static struct attribute *port_dev_attrs[] = {
 	&dev_attr_location.attr,
 	&dev_attr_quirks.attr,
 	&dev_attr_over_current_count.attr,
+	&dev_attr_port_power.attr,
 	NULL,
 };
 
-- 
2.30.2

