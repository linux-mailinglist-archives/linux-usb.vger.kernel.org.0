Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20B5B514F84
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 17:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378497AbiD2PfG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 11:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346797AbiD2PfF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 11:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 716F9393E3
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651246306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AIxiS7CgnslW2nrcWQZSYzM/KF0YAxgPIHQrUgoS+Ng=;
        b=KNsOBPudFCjZgt8ucFHu1Z7pG+w6palnRoeg1SXI4FKTzcV6NDOadWhMO0xueWoF9idfYY
        1yqiI1cpzIF3/lwWsPn/ZBV/BvYTpyMXhMZft+bT2o6pA2Dg9qXGvwVb3I1LU73393RIkm
        Aaf+yJvaISVOFqklt0J63lsTecukiGA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-7j3CkrRhP8Sf2NFIFJnsvg-1; Fri, 29 Apr 2022 11:31:43 -0400
X-MC-Unique: 7j3CkrRhP8Sf2NFIFJnsvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A763C3C37F24;
        Fri, 29 Apr 2022 15:31:42 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 513A414152EE;
        Fri, 29 Apr 2022 15:31:41 +0000 (UTC)
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     marcel@holtmann.org,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Date:   Fri, 29 Apr 2022 17:31:38 +0200
Message-Id: <20220429153138.935435-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
Trust) hang when they are unbound from 'unbind' sysfs entry and
can not be bound again.

The reason is CSR chip hangs when usb configuration command with
index 0 (used to unconfigure) is sent during disconnection.

To avoid this unwanted result, it is necessary not to send this
command for CSR chip when usb device is unbound.
Besides, "skip_unconfigure" sysfs entry has been created for
testing purposes with these or other devices.

Athough device is not unconfigured, it is better to avoid device
hanging to be able to operate. Even bluetooth can be previously
turned off.
On the other hand, this is not important if usb device is going to
be bound again (normal behavior), i.e. with usbip.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/bluetooth/btusb.c  |  8 +++++++-
 drivers/usb/core/generic.c |  2 +-
 drivers/usb/core/sysfs.c   | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/usb.h        |  2 ++
 4 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b7c72eb96c87..27ad3c2234db 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4835,8 +4835,14 @@ static int btusb_probe(struct usb_interface *intf,
 
 		/* Fake CSR devices with broken commands */
 		if (le16_to_cpu(udev->descriptor.idVendor)  == 0x0a12 &&
-		    le16_to_cpu(udev->descriptor.idProduct) == 0x0001)
+		    le16_to_cpu(udev->descriptor.idProduct) == 0x0001) {
 			hdev->setup = btusb_setup_csr;
+			/* This device hangs when configuration command with
+			 * index 0 (unconfigure) is sent, avoid this at least
+			 * if it is unbound.
+			 */
+			udev->skip_unconfigure = 1;
+		}
 	}
 
 	if (id->driver_info & BTUSB_SNIFFER) {
diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 26f9fb9f67ca..f25171284119 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -256,7 +256,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
 
 	/* if this is only an unbind, not a physical disconnect, then
 	 * unconfigure the device */
-	if (udev->actconfig)
+	if (!udev->skip_unconfigure && udev->actconfig)
 		usb_set_configuration(udev, -1);
 }
 
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index fa2e49d432ff..2e5839b53072 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -1189,6 +1189,41 @@ static struct device_attribute dev_attr_interface_authorized =
 		__ATTR(authorized, S_IRUGO | S_IWUSR,
 		interface_authorized_show, interface_authorized_store);
 
+static ssize_t skip_unconfigure_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct usb_device *udev = interface_to_usbdev(intf);
+	u8 val;
+
+	if (usb_lock_device_interruptible(udev) < 0)
+		return -EINTR;
+	val = udev->skip_unconfigure;
+	usb_unlock_device(udev);
+
+	return sprintf(buf, "%d\n", val);
+}
+
+static ssize_t skip_unconfigure_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct usb_device *udev = interface_to_usbdev(intf);
+	u8 val;
+
+	if (kstrtou8(buf, 0, &val) || val > 1)
+		return -EINVAL;
+
+	if (usb_lock_device_interruptible(udev) < 0)
+		return -EINTR;
+	udev->skip_unconfigure = val;
+	usb_unlock_device(udev);
+
+	return count;
+}
+static DEVICE_ATTR_RW(skip_unconfigure);
+
 static struct attribute *intf_attrs[] = {
 	&dev_attr_bInterfaceNumber.attr,
 	&dev_attr_bAlternateSetting.attr,
@@ -1199,6 +1234,7 @@ static struct attribute *intf_attrs[] = {
 	&dev_attr_modalias.attr,
 	&dev_attr_supports_autosuspend.attr,
 	&dev_attr_interface_authorized.attr,
+	&dev_attr_skip_unconfigure.attr,
 	NULL,
 };
 static const struct attribute_group intf_attr_grp = {
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 86a73d834e38..55828cd0a0d1 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -618,6 +618,7 @@ struct usb3_lpm_parameters {
  *	parent->hub_delay + wHubDelay + tTPTransmissionDelay (40ns)
  *	Will be used as wValue for SetIsochDelay requests.
  * @use_generic_driver: ask driver core to reprobe using the generic driver.
+ * @skip_unconfigure: disable unconfigure operation for devices without support.
  *
  * Notes:
  * Usbcore drivers should not set usbdev->state directly.  Instead use
@@ -704,6 +705,7 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
+	unsigned skip_unconfigure:1;
 };
 #define	to_usb_device(d) container_of(d, struct usb_device, dev)
 
-- 
2.27.0

