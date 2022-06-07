Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753CD53FDC4
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 13:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242054AbiFGLpj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 07:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243081AbiFGLpi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 07:45:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953376EC40
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 04:45:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nyXeQ-0006Jy-SV; Tue, 07 Jun 2022 13:45:34 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nyXeR-006yu4-7d; Tue, 07 Jun 2022 13:45:33 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nyXeP-00E5si-3O; Tue, 07 Jun 2022 13:45:33 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: [PATCH v5] usb: hub: port: add sysfs entry to switch port power
Date:   Tue,  7 Jun 2022 13:45:22 +0200
Message-Id: <20220607114522.3359148-1-m.grzeschik@pengutronix.de>
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
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

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
v3 -> v4:
         - exporting hub_port_status + port_is_power_on
         - changed disable_show from using test_bit(port1, hub->power_bits) to new exported functions
         - renamed set variable to disabled
         - rephrased documentation
         - removed initial check for hub
v4 -> v5:
         - using sysfs_emit instead of sprintf in disable_show
         - prefixed now global functions hub_port_status and port_is_power_on with usb_
         - removed superfluous unlikely in hub->disconnected check

 Documentation/ABI/testing/sysfs-bus-usb | 11 ++++
 drivers/usb/core/hub.c                  | 39 ++++++------
 drivers/usb/core/hub.h                  |  3 +
 drivers/usb/core/port.c                 | 83 +++++++++++++++++++++++++
 4 files changed, 117 insertions(+), 19 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
index 7efe31ed3a25c7..568103d3376ee7 100644
--- a/Documentation/ABI/testing/sysfs-bus-usb
+++ b/Documentation/ABI/testing/sysfs-bus-usb
@@ -253,6 +253,17 @@ Description:
 		only if the system firmware is capable of describing the
 		connection between a port and its connector.
 
+What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>/disable
+Date:		June 2022
+Contact:	Michael Grzeschik <m.grzeschik@pengutronix.de>
+Description:
+		This file controls the state of a USB port, including
+		Vbus power output (but only on hubs that support
+		power switching -- most hubs don't support it). If
+		a port is disabled, the port is unusable: Devices
+		attached to the port will not be detected, initialized,
+		or enumerated.
+
 What:		/sys/bus/usb/devices/.../power/usb2_lpm_l1_timeout
 Date:		May 2013
 Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 68e9121c187882..ba406b8d688da8 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -613,7 +613,7 @@ static int hub_ext_port_status(struct usb_hub *hub, int port1, int type,
 	return ret;
 }
 
-static int hub_port_status(struct usb_hub *hub, int port1,
+int usb_hub_port_status(struct usb_hub *hub, int port1,
 		u16 *status, u16 *change)
 {
 	return hub_ext_port_status(hub, port1, HUB_PORT_STATUS,
@@ -1126,7 +1126,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 		u16 portstatus, portchange;
 
 		portstatus = portchange = 0;
-		status = hub_port_status(hub, port1, &portstatus, &portchange);
+		status = usb_hub_port_status(hub, port1, &portstatus, &portchange);
 		if (status)
 			goto abort;
 
@@ -2855,7 +2855,7 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
 						  &portstatus, &portchange,
 						  &ext_portstatus);
 		else
-			ret = hub_port_status(hub, port1, &portstatus,
+			ret = usb_hub_port_status(hub, port1, &portstatus,
 					      &portchange);
 		if (ret < 0)
 			return ret;
@@ -2956,7 +2956,8 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
 		 * If the caller hasn't explicitly requested a warm reset,
 		 * double check and see if one is needed.
 		 */
-		if (hub_port_status(hub, port1, &portstatus, &portchange) == 0)
+		if (usb_hub_port_status(hub, port1, &portstatus,
+					&portchange) == 0)
 			if (hub_port_warm_reset_required(hub, port1,
 							portstatus))
 				warm = true;
@@ -3008,7 +3009,7 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
 			 * If a USB 3.0 device migrates from reset to an error
 			 * state, re-issue the warm reset.
 			 */
-			if (hub_port_status(hub, port1,
+			if (usb_hub_port_status(hub, port1,
 					&portstatus, &portchange) < 0)
 				goto done;
 
@@ -3074,7 +3075,7 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
 }
 
 /* Check if a port is power on */
-static int port_is_power_on(struct usb_hub *hub, unsigned portstatus)
+int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
 {
 	int ret = 0;
 
@@ -3140,13 +3141,13 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(hub, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
 		if (retries--) {
 			usleep_range(200, 300);
-			status = hub_port_status(hub, port1, &portstatus,
+			status = usb_hub_port_status(hub, port1, &portstatus,
 							     &portchange);
 			goto retry;
 		}
@@ -3409,7 +3410,7 @@ int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
 			u16 portstatus, portchange;
 
 			portstatus = portchange = 0;
-			ret = hub_port_status(hub, port1, &portstatus,
+			ret = usb_hub_port_status(hub, port1, &portstatus,
 					&portchange);
 
 			dev_dbg(&port_dev->dev,
@@ -3587,13 +3588,13 @@ static int wait_for_connected(struct usb_device *udev,
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(hub, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
 		msleep(20);
 		delay_ms += 20;
-		status = hub_port_status(hub, port1, portstatus, portchange);
+		status = usb_hub_port_status(hub, port1, portstatus, portchange);
 	}
 	dev_dbg(&udev->dev, "Waited %dms for CONNECT\n", delay_ms);
 	return status;
@@ -3653,7 +3654,7 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 	usb_lock_port(port_dev);
 
 	/* Skip the initial Clear-Suspend step for a remote wakeup */
-	status = hub_port_status(hub, port1, &portstatus, &portchange);
+	status = usb_hub_port_status(hub, port1, &portstatus, &portchange);
 	if (status == 0 && !port_is_suspended(hub, portstatus)) {
 		if (portchange & USB_PORT_STAT_C_SUSPEND)
 			pm_wakeup_event(&udev->dev, 0);
@@ -3678,7 +3679,7 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 		 * stop resume signaling.  Then finish the resume
 		 * sequence.
 		 */
-		status = hub_port_status(hub, port1, &portstatus, &portchange);
+		status = usb_hub_port_status(hub, port1, &portstatus, &portchange);
 	}
 
  SuspendCleared:
@@ -3791,7 +3792,7 @@ static int check_ports_changed(struct usb_hub *hub)
 		u16 portstatus, portchange;
 		int status;
 
-		status = hub_port_status(hub, port1, &portstatus, &portchange);
+		status = usb_hub_port_status(hub, port1, &portstatus, &portchange);
 		if (!status && portchange)
 			return 1;
 	}
@@ -4554,7 +4555,7 @@ int hub_port_debounce(struct usb_hub *hub, int port1, bool must_be_connected)
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 
 	for (total_time = 0; ; total_time += HUB_DEBOUNCE_STEP) {
-		ret = hub_port_status(hub, port1, &portstatus, &portchange);
+		ret = usb_hub_port_status(hub, port1, &portstatus, &portchange);
 		if (ret < 0)
 			return ret;
 
@@ -5240,7 +5241,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(hub, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
@@ -5557,7 +5558,7 @@ static void port_event(struct usb_hub *hub, int port1)
 	clear_bit(port1, hub->event_bits);
 	clear_bit(port1, hub->wakeup_bits);
 
-	if (hub_port_status(hub, port1, &portstatus, &portchange) < 0)
+	if (usb_hub_port_status(hub, port1, &portstatus, &portchange) < 0)
 		return;
 
 	if (portchange & USB_PORT_STAT_C_CONNECTION) {
@@ -5594,7 +5595,7 @@ static void port_event(struct usb_hub *hub, int port1)
 				USB_PORT_FEAT_C_OVER_CURRENT);
 		msleep(100);	/* Cool down */
 		hub_power_on(hub, true);
-		hub_port_status(hub, port1, &status, &unused);
+		usb_hub_port_status(hub, port1, &status, &unused);
 		if (status & USB_PORT_STAT_OVERCURRENT)
 			dev_err(&port_dev->dev, "over-current condition\n");
 	}
@@ -5638,7 +5639,7 @@ static void port_event(struct usb_hub *hub, int port1)
 			u16 unused;
 
 			msleep(20);
-			hub_port_status(hub, port1, &portstatus, &unused);
+			usb_hub_port_status(hub, port1, &portstatus, &unused);
 			dev_dbg(&port_dev->dev, "Wait for inactive link disconnect detect\n");
 			continue;
 		} else if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 22ea1f4f2d66d7..3fcb38099ce3bb 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -121,6 +121,9 @@ extern int hub_port_debounce(struct usb_hub *hub, int port1,
 		bool must_be_connected);
 extern int usb_clear_port_feature(struct usb_device *hdev,
 		int port1, int feature);
+extern int usb_hub_port_status(struct usb_hub *hub, int port1,
+		u16 *status, u16 *change);
+extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
 
 static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 {
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index d5bc36ca5b1f77..38c1a4f4fdeae5 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -17,6 +17,88 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+static ssize_t disable_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+	struct usb_device *hdev = to_usb_device(dev->parent->parent);
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	struct usb_interface *intf = to_usb_interface(hub->intfdev);
+	int port1 = port_dev->portnum;
+	u16 portstatus, unused;
+	bool disabled;
+	int rc;
+
+	rc = usb_autopm_get_interface(intf);
+	if (rc < 0)
+		return rc;
+
+	usb_lock_device(hdev);
+	if (hub->disconnected) {
+		rc = -ENODEV;
+		goto out_hdev_lock;
+	}
+
+	usb_hub_port_status(hub, port1, &portstatus, &unused);
+	disabled = !usb_port_is_power_on(hub, portstatus);
+
+out_hdev_lock:
+	usb_unlock_device(hdev);
+	usb_autopm_put_interface(intf);
+
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%s\n", disabled ? "1" : "0");
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
+	bool disabled;
+	int rc;
+
+	rc = strtobool(buf, &disabled);
+	if (rc)
+		return rc;
+
+	rc = usb_autopm_get_interface(intf);
+	if (rc < 0)
+		return rc;
+
+	usb_lock_device(hdev);
+	if (hub->disconnected) {
+		rc = -ENODEV;
+		goto out_hdev_lock;
+	}
+
+	if (disabled && port_dev->child)
+		usb_disconnect(&port_dev->child);
+
+	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
+
+	if (disabled) {
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
@@ -153,6 +235,7 @@ static struct attribute *port_dev_attrs[] = {
 	&dev_attr_location.attr,
 	&dev_attr_quirks.attr,
 	&dev_attr_over_current_count.attr,
+	&dev_attr_disable.attr,
 	NULL,
 };
 
-- 
2.30.2

