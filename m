Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62144AD713
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359515AbiBHLbl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356862AbiBHLKC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 06:10:02 -0500
X-Greylist: delayed 456 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 03:10:00 PST
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14818C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 03:09:59 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 677F020EE50D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: use sysfs_emit() instead of sprintf()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <4248804f-d9eb-5e00-563f-28815cd42b65@omp.ru>
Date:   Tue, 8 Feb 2022 14:02:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

sprintf() (still used in the USB core for the sysfs output) is vulnerable
to the buffer overflow.  Use the new-fangled sysfs_emit() instead.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/core/endpoint.c        |   11 ++---
 drivers/usb/core/ledtrig-usbport.c |    3 -
 drivers/usb/core/port.c            |   11 ++---
 drivers/usb/core/sysfs.c           |   77 ++++++++++++++++++-------------------
 4 files changed, 53 insertions(+), 49 deletions(-)

Index: usb/drivers/usb/core/endpoint.c
===================================================================
--- usb.orig/drivers/usb/core/endpoint.c
+++ usb/drivers/usb/core/endpoint.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/usb.h>
 #include "usb.h"
 
@@ -39,7 +40,7 @@ static ssize_t field##_show(struct devic
 			       char *buf)			\
 {								\
 	struct ep_device *ep = to_ep_device(dev);		\
-	return sprintf(buf, format_string, ep->desc->field);	\
+	return sysfs_emit(buf, format_string, ep->desc->field);	\
 }								\
 static DEVICE_ATTR_RO(field)
 
@@ -52,7 +53,7 @@ static ssize_t wMaxPacketSize_show(struc
 				   struct device_attribute *attr, char *buf)
 {
 	struct ep_device *ep = to_ep_device(dev);
-	return sprintf(buf, "%04x\n", usb_endpoint_maxp(ep->desc));
+	return sysfs_emit(buf, "%04x\n", usb_endpoint_maxp(ep->desc));
 }
 static DEVICE_ATTR_RO(wMaxPacketSize);
 
@@ -76,7 +77,7 @@ static ssize_t type_show(struct device *
 		type = "Interrupt";
 		break;
 	}
-	return sprintf(buf, "%s\n", type);
+	return sysfs_emit(buf, "%s\n", type);
 }
 static DEVICE_ATTR_RO(type);
 
@@ -95,7 +96,7 @@ static ssize_t interval_show(struct devi
 		interval /= 1000;
 	}
 
-	return sprintf(buf, "%d%cs\n", interval, unit);
+	return sysfs_emit(buf, "%d%cs\n", interval, unit);
 }
 static DEVICE_ATTR_RO(interval);
 
@@ -111,7 +112,7 @@ static ssize_t direction_show(struct dev
 		direction = "in";
 	else
 		direction = "out";
-	return sprintf(buf, "%s\n", direction);
+	return sysfs_emit(buf, "%s\n", direction);
 }
 static DEVICE_ATTR_RO(direction);
 
Index: usb/drivers/usb/core/ledtrig-usbport.c
===================================================================
--- usb.orig/drivers/usb/core/ledtrig-usbport.c
+++ usb/drivers/usb/core/ledtrig-usbport.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/usb.h>
 #include <linux/usb/of.h>
 
@@ -87,7 +88,7 @@ static ssize_t usbport_trig_port_show(st
 						      struct usbport_trig_port,
 						      attr);
 
-	return sprintf(buf, "%d\n", port->observed) + 1;
+	return sysfs_emit(buf, "%d\n", port->observed) + 1;
 }
 
 static ssize_t usbport_trig_port_store(struct device *dev,
Index: usb/drivers/usb/core/port.c
===================================================================
--- usb.orig/drivers/usb/core/port.c
+++ usb/drivers/usb/core/port.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/pm_qos.h>
 #include <linux/component.h>
 
@@ -22,7 +23,7 @@ static ssize_t location_show(struct devi
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
-	return sprintf(buf, "0x%08x\n", port_dev->location);
+	return sysfs_emit(buf, "0x%08x\n", port_dev->location);
 }
 static DEVICE_ATTR_RO(location);
 
@@ -47,7 +48,7 @@ static ssize_t connect_type_show(struct
 		break;
 	}
 
-	return sprintf(buf, "%s\n", result);
+	return sysfs_emit(buf, "%s\n", result);
 }
 static DEVICE_ATTR_RO(connect_type);
 
@@ -56,7 +57,7 @@ static ssize_t over_current_count_show(s
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
-	return sprintf(buf, "%u\n", port_dev->over_current_count);
+	return sysfs_emit(buf, "%u\n", port_dev->over_current_count);
 }
 static DEVICE_ATTR_RO(over_current_count);
 
@@ -65,7 +66,7 @@ static ssize_t quirks_show(struct device
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
-	return sprintf(buf, "%08x\n", port_dev->quirks);
+	return sysfs_emit(buf, "%08x\n", port_dev->quirks);
 }
 
 static ssize_t quirks_store(struct device *dev, struct device_attribute *attr,
@@ -100,7 +101,7 @@ static ssize_t usb3_lpm_permit_show(stru
 			p = "0";
 	}
 
-	return sprintf(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", p);
 }
 
 static ssize_t usb3_lpm_permit_store(struct device *dev,
Index: usb/drivers/usb/core/sysfs.c
===================================================================
--- usb.orig/drivers/usb/core/sysfs.c
+++ usb/drivers/usb/core/sysfs.c
@@ -14,6 +14,7 @@
 
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <linux/sysfs.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/quirks.h>
@@ -35,7 +36,7 @@ static ssize_t field##_show(struct devic
 		return -EINTR;						\
 	actconfig = udev->actconfig;					\
 	if (actconfig)							\
-		rc = sprintf(buf, format_string,			\
+		rc = sysfs_emit(buf, format_string,			\
 				actconfig->desc.field);			\
 	usb_unlock_device(udev);					\
 	return rc;							\
@@ -61,7 +62,8 @@ static ssize_t bMaxPower_show(struct dev
 		return -EINTR;
 	actconfig = udev->actconfig;
 	if (actconfig)
-		rc = sprintf(buf, "%dmA\n", usb_get_max_power(udev, actconfig));
+		rc = sysfs_emit(buf, "%dmA\n",
+				usb_get_max_power(udev, actconfig));
 	usb_unlock_device(udev);
 	return rc;
 }
@@ -80,7 +82,7 @@ static ssize_t configuration_show(struct
 		return -EINTR;
 	actconfig = udev->actconfig;
 	if (actconfig && actconfig->string)
-		rc = sprintf(buf, "%s\n", actconfig->string);
+		rc = sysfs_emit(buf, "%s\n", actconfig->string);
 	usb_unlock_device(udev);
 	return rc;
 }
@@ -114,7 +116,7 @@ static ssize_t devspec_show(struct devic
 {
 	struct device_node *of_node = dev->of_node;
 
-	return sprintf(buf, "%pOF\n", of_node);
+	return sysfs_emit(buf, "%pOF\n", of_node);
 }
 static DEVICE_ATTR_RO(devspec);
 #endif
@@ -131,7 +133,7 @@ static ssize_t  name##_show(struct devic
 	retval = usb_lock_device_interruptible(udev);			\
 	if (retval < 0)							\
 		return -EINTR;						\
-	retval = sprintf(buf, "%s\n", udev->name);			\
+	retval = sysfs_emit(buf, "%s\n", udev->name);			\
 	usb_unlock_device(udev);					\
 	return retval;							\
 }									\
@@ -175,7 +177,7 @@ static ssize_t speed_show(struct device
 	default:
 		speed = "unknown";
 	}
-	return sprintf(buf, "%s\n", speed);
+	return sysfs_emit(buf, "%s\n", speed);
 }
 static DEVICE_ATTR_RO(speed);
 
@@ -185,7 +187,7 @@ static ssize_t rx_lanes_show(struct devi
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->rx_lanes);
+	return sysfs_emit(buf, "%d\n", udev->rx_lanes);
 }
 static DEVICE_ATTR_RO(rx_lanes);
 
@@ -195,7 +197,7 @@ static ssize_t tx_lanes_show(struct devi
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->tx_lanes);
+	return sysfs_emit(buf, "%d\n", udev->tx_lanes);
 }
 static DEVICE_ATTR_RO(tx_lanes);
 
@@ -205,7 +207,7 @@ static ssize_t busnum_show(struct device
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->bus->busnum);
+	return sysfs_emit(buf, "%d\n", udev->bus->busnum);
 }
 static DEVICE_ATTR_RO(busnum);
 
@@ -215,7 +217,7 @@ static ssize_t devnum_show(struct device
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->devnum);
+	return sysfs_emit(buf, "%d\n", udev->devnum);
 }
 static DEVICE_ATTR_RO(devnum);
 
@@ -225,7 +227,7 @@ static ssize_t devpath_show(struct devic
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%s\n", udev->devpath);
+	return sysfs_emit(buf, "%s\n", udev->devpath);
 }
 static DEVICE_ATTR_RO(devpath);
 
@@ -237,7 +239,7 @@ static ssize_t version_show(struct devic
 
 	udev = to_usb_device(dev);
 	bcdUSB = le16_to_cpu(udev->descriptor.bcdUSB);
-	return sprintf(buf, "%2x.%02x\n", bcdUSB >> 8, bcdUSB & 0xff);
+	return sysfs_emit(buf, "%2x.%02x\n", bcdUSB >> 8, bcdUSB & 0xff);
 }
 static DEVICE_ATTR_RO(version);
 
@@ -247,7 +249,7 @@ static ssize_t maxchild_show(struct devi
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->maxchild);
+	return sysfs_emit(buf, "%d\n", udev->maxchild);
 }
 static DEVICE_ATTR_RO(maxchild);
 
@@ -257,7 +259,7 @@ static ssize_t quirks_show(struct device
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "0x%x\n", udev->quirks);
+	return sysfs_emit(buf, "0x%x\n", udev->quirks);
 }
 static DEVICE_ATTR_RO(quirks);
 
@@ -267,7 +269,7 @@ static ssize_t avoid_reset_quirk_show(st
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", !!(udev->quirks & USB_QUIRK_RESET));
+	return sysfs_emit(buf, "%d\n", !!(udev->quirks & USB_QUIRK_RESET));
 }
 
 static ssize_t avoid_reset_quirk_store(struct device *dev,
@@ -297,7 +299,7 @@ static ssize_t urbnum_show(struct device
 	struct usb_device *udev;
 
 	udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", atomic_read(&udev->urbnum));
+	return sysfs_emit(buf, "%d\n", atomic_read(&udev->urbnum));
 }
 static DEVICE_ATTR_RO(urbnum);
 
@@ -305,8 +307,8 @@ static ssize_t ltm_capable_show(struct d
 				struct device_attribute *attr, char *buf)
 {
 	if (usb_device_supports_ltm(to_usb_device(dev)))
-		return sprintf(buf, "%s\n", "yes");
-	return sprintf(buf, "%s\n", "no");
+		return sysfs_emit(buf, "%s\n", "yes");
+	return sysfs_emit(buf, "%s\n", "no");
 }
 static DEVICE_ATTR_RO(ltm_capable);
 
@@ -317,7 +319,7 @@ static ssize_t persist_show(struct devic
 {
 	struct usb_device *udev = to_usb_device(dev);
 
-	return sprintf(buf, "%d\n", udev->persist_enabled);
+	return sysfs_emit(buf, "%d\n", udev->persist_enabled);
 }
 
 static ssize_t persist_store(struct device *dev, struct device_attribute *attr,
@@ -372,7 +374,7 @@ static ssize_t connected_duration_show(s
 {
 	struct usb_device *udev = to_usb_device(dev);
 
-	return sprintf(buf, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			jiffies_to_msecs(jiffies - udev->connect_time));
 }
 static DEVICE_ATTR_RO(connected_duration);
@@ -394,14 +396,14 @@ static ssize_t active_duration_show(stru
 		duration = jiffies_to_msecs(jiffies + udev->active_duration);
 	else
 		duration = jiffies_to_msecs(udev->active_duration);
-	return sprintf(buf, "%u\n", duration);
+	return sysfs_emit(buf, "%u\n", duration);
 }
 static DEVICE_ATTR_RO(active_duration);
 
 static ssize_t autosuspend_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d\n", dev->power.autosuspend_delay / 1000);
+	return sysfs_emit(buf, "%d\n", dev->power.autosuspend_delay / 1000);
 }
 
 static ssize_t autosuspend_store(struct device *dev,
@@ -442,7 +444,7 @@ static ssize_t level_show(struct device
 	warn_level();
 	if (udev->state != USB_STATE_SUSPENDED && !udev->dev.power.runtime_auto)
 		p = on_string;
-	return sprintf(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", p);
 }
 
 static ssize_t level_store(struct device *dev, struct device_attribute *attr,
@@ -490,7 +492,7 @@ static ssize_t usb2_hardware_lpm_show(st
 	else
 		p = "disabled";
 
-	return sprintf(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", p);
 }
 
 static ssize_t usb2_hardware_lpm_store(struct device *dev,
@@ -529,7 +531,7 @@ static ssize_t usb2_lpm_l1_timeout_show(
 					char *buf)
 {
 	struct usb_device *udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->l1_params.timeout);
+	return sysfs_emit(buf, "%d\n", udev->l1_params.timeout);
 }
 
 static ssize_t usb2_lpm_l1_timeout_store(struct device *dev,
@@ -552,7 +554,7 @@ static ssize_t usb2_lpm_besl_show(struct
 				  struct device_attribute *attr, char *buf)
 {
 	struct usb_device *udev = to_usb_device(dev);
-	return sprintf(buf, "%d\n", udev->l1_params.besl);
+	return sysfs_emit(buf, "%d\n", udev->l1_params.besl);
 }
 
 static ssize_t usb2_lpm_besl_store(struct device *dev,
@@ -589,7 +591,7 @@ static ssize_t usb3_hardware_lpm_u1_show
 
 	usb_unlock_device(udev);
 
-	return sprintf(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", p);
 }
 static DEVICE_ATTR_RO(usb3_hardware_lpm_u1);
 
@@ -611,7 +613,7 @@ static ssize_t usb3_hardware_lpm_u2_show
 
 	usb_unlock_device(udev);
 
-	return sprintf(buf, "%s\n", p);
+	return sysfs_emit(buf, "%s\n", p);
 }
 static DEVICE_ATTR_RO(usb3_hardware_lpm_u2);
 
@@ -694,7 +696,7 @@ field##_show(struct device *dev, struct
 	struct usb_device *udev;					\
 									\
 	udev = to_usb_device(dev);					\
-	return sprintf(buf, format_string, 				\
+	return sysfs_emit(buf, format_string,				\
 			le16_to_cpu(udev->descriptor.field));		\
 }									\
 static DEVICE_ATTR_RO(field)
@@ -711,7 +713,7 @@ field##_show(struct device *dev, struct
 	struct usb_device *udev;					\
 									\
 	udev = to_usb_device(dev);					\
-	return sprintf(buf, format_string, udev->descriptor.field);	\
+	return sysfs_emit(buf, format_string, udev->descriptor.field);	\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -957,7 +959,7 @@ static ssize_t interface_authorized_defa
 	struct usb_device *usb_dev = to_usb_device(dev);
 	struct usb_hcd *hcd = bus_to_hcd(usb_dev->bus);
 
-	return sprintf(buf, "%u\n", !!HCD_INTF_AUTHORIZED(hcd));
+	return sysfs_emit(buf, "%u\n", !!HCD_INTF_AUTHORIZED(hcd));
 }
 
 /*
@@ -1066,7 +1068,7 @@ iad_##field##_show(struct device *dev, s
 {									\
 	struct usb_interface *intf = to_usb_interface(dev);		\
 									\
-	return sprintf(buf, format_string,				\
+	return sysfs_emit(buf, format_string,				\
 			intf->intf_assoc->field); 			\
 }									\
 static DEVICE_ATTR_RO(iad_##field)
@@ -1085,7 +1087,7 @@ field##_show(struct device *dev, struct
 {									\
 	struct usb_interface *intf = to_usb_interface(dev);		\
 									\
-	return sprintf(buf, format_string,				\
+	return sysfs_emit(buf, format_string,				\
 			intf->cur_altsetting->desc.field); 		\
 }									\
 static DEVICE_ATTR_RO(field)
@@ -1107,7 +1109,7 @@ static ssize_t interface_show(struct dev
 	string = READ_ONCE(intf->cur_altsetting->string);
 	if (!string)
 		return 0;
-	return sprintf(buf, "%s\n", string);
+	return sysfs_emit(buf, "%s\n", string);
 }
 static DEVICE_ATTR_RO(interface);
 
@@ -1122,8 +1124,7 @@ static ssize_t modalias_show(struct devi
 	udev = interface_to_usbdev(intf);
 	alt = READ_ONCE(intf->cur_altsetting);
 
-	return sprintf(buf, "usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02X"
-			"ic%02Xisc%02Xip%02Xin%02X\n",
+	return sysfs_emit(buf, "usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02Xic%02Xisc%02Xip%02Xin%02X\n",
 			le16_to_cpu(udev->descriptor.idVendor),
 			le16_to_cpu(udev->descriptor.idProduct),
 			le16_to_cpu(udev->descriptor.bcdDevice),
@@ -1150,7 +1151,7 @@ static ssize_t supports_autosuspend_show
 	s = (!dev->driver || to_usb_driver(dev->driver)->supports_autosuspend);
 	device_unlock(dev);
 
-	return sprintf(buf, "%u\n", s);
+	return sysfs_emit(buf, "%u\n", s);
 }
 static DEVICE_ATTR_RO(supports_autosuspend);
 
@@ -1163,7 +1164,7 @@ static ssize_t interface_authorized_show
 {
 	struct usb_interface *intf = to_usb_interface(dev);
 
-	return sprintf(buf, "%u\n", intf->authorized);
+	return sysfs_emit(buf, "%u\n", intf->authorized);
 }
 
 /*

