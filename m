Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C7C53C99A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 13:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244108AbiFCLwc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 07:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241403AbiFCLwb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 07:52:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A7320BF4
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 04:52:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nx5qu-0007F3-JW; Fri, 03 Jun 2022 13:52:28 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nx5qu-006DAJ-S8; Fri, 03 Jun 2022 13:52:27 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nx5qs-0091fD-Vb; Fri, 03 Jun 2022 13:52:26 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: [PATCH v3] usb: hub: port: add sysfs entry to switch port power
Date:   Fri,  3 Jun 2022 13:52:22 +0200
Message-Id: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
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

v2 -> v3:
         - renamed sysfs file to disable instead of port_power
         - added disable_show function to read out the current port state
         - moved usb_lock/unlock_device near put/get_interface
         - removed unnecessary usb_set_configuration of port_dev->child before disconnect
         - removed unnecessary usb_autosuspend of port_dev->child before disconnect
         - moved clearing of port_feature flags to be done after usb_hub_set_port_power
         - checking for hub->disconnected after locking hdev
         - updated the ABI documentation

 Documentation/ABI/testing/sysfs-bus-usb | 11 +++++
 drivers/usb/core/port.c                 | 61 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index 7efe31ed3a25c7..d907123ac5d0f9 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -253,6 +253,17 @@ Description:
 		only if the system firmware is capable of describing the
 		connection between a port and its connector.
 
+What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/disable
+Date:		June 2022
+Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
+Description:
+		This file controls the state to USB ports, including
+		Vbus power output (but only on hubs that support
+		power switching -- most hubs don't support it). When
+		turning a port off, the port is unusable: Devices
+		attached to the port will not be detected, initialized,
+		or enumerated.
+
 What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
 Date:		May 2013
 Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index d5bc36ca5b1f77..8343590c3800f8 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -17,6 +17,66 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+static ssize_t disable_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+	struct usb_device *hdev = to_usb_device(dev->parent->parent);
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	int port1 = port_dev->portnum;
+	bool state = test_bit(port1, hub->power_bits);
+
+	return sprintf(buf, "%s\n", state ? "0" : "1");
+}
+
+static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
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
+	usb_lock_device(hdev);
+	if (unlikely(hub->disconnected))
+		goto out_hdev_lock;
+
+	if (set && port_dev->child)
+		usb_disconnect(&port_dev->child);
+
+	rc = usb_hub_set_port_power(hdev, hub, port1, !set);
+
+	if (set) {
+		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
+		if (!port_dev->is_superspeed)
+			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
+	}
+
+	if (!rc)
+		rc = count;
+
+out_hdev_lock:
+	usb_unlock_device(hdev);
+	usb_autopm_put_interface(intf);
+
+	return rc;
+}
+static DEVICE_ATTR_RW(disable);
+
 static ssize_t location_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -153,6 +213,7 @@ static struct attribute *port_dev_attrs[] = {
 	&dev_attr_location.attr,
 	&dev_attr_quirks.attr,
 	&dev_attr_over_current_count.attr,
+	&dev_attr_disable.attr,
 	NULL,
 };
 
-- 
2.30.2

