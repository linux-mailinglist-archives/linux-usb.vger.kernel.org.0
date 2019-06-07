Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8E2338478
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 08:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfFGGhy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 02:37:54 -0400
Received: from mga09.intel.com ([134.134.136.24]:57977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbfFGGhy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 02:37:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 23:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,562,1557212400"; 
   d="scan'208";a="182572415"
Received: from intel.iind.intel.com ([10.66.245.146])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2019 23:37:51 -0700
From:   Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, rajaram.regupathy@intel.com,
        abhilash.k.v@intel.com, prabhat.chand.pandey@intel.com,
        m.balaji@intel.com
Subject: [PATCH 3/5] usb: xhci: dbc: Provide sysfs option to configure dbc descriptors
Date:   Fri,  7 Jun 2019 12:03:04 +0530
Message-Id: <20190607063306.5612-4-prabhat.chand.pandey@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "K V, Abhilash" <abhilash.k.v@intel.com>

Show the active dbc function and dbc descriptors, allowing
user space to dynamically modify the descriptors

The DBC specific sysfs attributes are separated into two groups,
in the first group there are dbc & dbc_function sysfs attributes and in
second group all other DBC descriptor specific sysfs attributes.

First group of attributes will be populated at the time of dbc_init and
second group of attributes will only be populated when "dbc" attribute
value is set to "enable".

Whenever "dbc" attribute value will be "disable" then second group
of attributes will be removed.

Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Gururaj K <gururaj.k@intel.com>
Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 112 ++++++
 drivers/usb/host/xhci-dbgcap.c                | 339 ++++++++++++++++++
 2 files changed, 451 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index 0088aba4caa8..b46b6afc6c4a 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -23,3 +23,115 @@ Description:
 		Reading this attribute gives the state of the DbC. It
 		can be one of the following states: disabled, enabled,
 		initialized, connected, configured and stalled.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_function
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+
+		This framework can be utilized to provide various interfaces.
+		By Default, it is configured to provide a serial Interface.
+
+		This attribute lets us configure the interface provided
+		by Dbc functionality. By Default, this attribute value
+		is "TTY" corresponding to the the serial interface. Other
+		values can be supported in future to provide a varied
+		interface to use DbC.
+
+		Reading this attribute gives the interface which is
+		currently configured with DbC. If it is "TTY" then serial
+		interface is configured.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_manufacturer
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the manufacturer name as
+		presented by the debug device in the USB Manufacturer String
+		descriptor. The default value is "Linux Foundation".
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_product
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the product name as
+		presented by the debug device in the USB Product String
+		descriptor. The default value is "Linux USB Debug Target".
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_serial
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the serial number as
+		presented by the debug device in the USB Serial Number String
+		descriptor. The default value is "0001".
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_protocol
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the bInterfaceProtocol field as
+		presented by the debug device in the USB Interface descriptor.
+
+		The default value is  1  (GNU Remote Debug command).
+		Other permissible value is 0 which is for vendor defined debug
+		target.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_vid
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the idVendor field as
+		presented by the debug device in the USB Device descriptor.
+		The default value is 0x1d6b (Linux Foundation).
+		It can be any 16-bit integer.
+
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_pid
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the idProduct field as
+		presented by the debug device in the USB Device descriptor.
+		The default value is 0x0010. It can be any 16-bit integer.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_device_rev
+Date:		June 2018
+Contact:	Rajaram Regupathy <rajaram.regupathy@intel.com>
+Description:
+		xHCI USB host controllers provide Debug Capability (Dbc)
+		as an extended feature. When configured Dbc presents a
+		debug device which is fully compliant with the USB
+		framework.
+		This attribute lets us change the bcdDevice field as
+		presented by the debug device in the USB Device descriptor.
+		The default value is 0x0010 (device rev 0.10).
+		It can be any 16-bit integer.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 96adc53b0fdb..d6bd1eacc208 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -873,6 +873,315 @@ static int xhci_do_dbc_init(struct xhci_hcd *xhci)
 	return 0;
 }
 
+static ssize_t dbc_function_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	int    count = 0;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (!dbc)
+		return -ENODEV;
+	if (!dbc_registered_func)
+		count += sprintf(buf, "%s\n", "none");
+	else
+		count += sprintf(buf, "%s\n", dbc_registered_func->func_name);
+
+	return count;
+}
+
+static ssize_t dbc_manufacturer_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	struct usb_string_descriptor    *s_desc;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (!dbc || !dbc->string)
+		return -ENODEV;
+	s_desc = (struct usb_string_descriptor *) dbc->string->manufacturer;
+	return utf16s_to_utf8s((wchar_t *) s_desc->wData, s_desc->bLength / 2,
+			UTF16_LITTLE_ENDIAN, buf, DBC_MAX_STRING_LENGTH);
+}
+
+static ssize_t dbc_manufacturer_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	struct usb_string_descriptor    *s_desc;
+	int ret;
+	struct dbc_info_context	*info;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	s_desc = (struct usb_string_descriptor *) dbc->string->manufacturer;
+	ret =  utf8s_to_utf16s(buf, strlen(buf),
+				UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
+				DBC_MAX_STRING_LENGTH);
+	if (ret < 0)
+		return ret;
+	s_desc->bLength         = (strlen(buf) + 1) * 2;
+	info			= (struct dbc_info_context *)dbc->ctx->bytes;
+	info->length		= (info->length & ~(0xffu << 8))
+					|  (s_desc->bLength) << 8;
+	return size;
+}
+
+static ssize_t dbc_product_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	struct usb_string_descriptor    *s_desc;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (!dbc || !dbc->string)
+		return -ENODEV;
+	s_desc = (struct usb_string_descriptor *) dbc->string->product;
+	return utf16s_to_utf8s((wchar_t *) s_desc->wData, s_desc->bLength / 2,
+			UTF16_LITTLE_ENDIAN, buf, DBC_MAX_STRING_LENGTH);
+}
+
+static ssize_t dbc_product_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	struct usb_string_descriptor    *s_desc;
+	int ret;
+	struct dbc_info_context	*info;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	s_desc = (struct usb_string_descriptor *) dbc->string->serial;
+	ret = utf8s_to_utf16s(buf, strlen(buf),
+				UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
+				DBC_MAX_STRING_LENGTH);
+	if (ret < 0)
+		return ret;
+	s_desc->bLength         = (strlen(buf) + 1) * 2;
+	info			= (struct dbc_info_context *)dbc->ctx->bytes;
+	info->length		= (info->length & ~(0xffu << 16))
+					 |  (s_desc->bLength) << 16;
+	return size;
+}
+
+static ssize_t dbc_serial_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	struct usb_string_descriptor    *s_desc;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (!dbc || !dbc->string)
+		return -ENODEV;
+	s_desc = (struct usb_string_descriptor *) dbc->string->serial;
+	return utf16s_to_utf8s((wchar_t *) s_desc->wData, s_desc->bLength / 2,
+			UTF16_LITTLE_ENDIAN, buf, DBC_MAX_STRING_LENGTH);
+}
+
+static ssize_t dbc_serial_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	struct usb_string_descriptor    *s_desc;
+	int ret;
+	struct dbc_info_context	*info;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	s_desc = (struct usb_string_descriptor *) dbc->string->serial;
+	ret = utf8s_to_utf16s(buf, strlen(buf),
+				UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
+				DBC_MAX_STRING_LENGTH);
+	if (ret < 0)
+		return ret;
+	s_desc->bLength         = (strlen(buf) + 1) * 2;
+	info			= (struct dbc_info_context *)dbc->ctx->bytes;
+	info->length		= (info->length & ~(0xffu << 24))
+					 |  (s_desc->bLength) << 24;
+	return size;
+}
+
+static ssize_t dbc_protocol_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	void __iomem *ptr;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	ptr = &dbc->regs->devinfo1;
+	return sprintf(buf, "%02x\n", le32_to_cpu(readl(ptr)) & 0xff);
+}
+
+static ssize_t dbc_protocol_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	int value;
+	int ret;
+	void __iomem *ptr;
+	u32 dev_info;
+
+	ret = kstrtoint(buf, 0, &value);
+	if (ret || value < 0 || value > 0xff)
+		return -EINVAL;
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	ptr = &dbc->regs->devinfo1;
+	dev_info = le32_to_cpu(readl(ptr));
+	dev_info = cpu_to_le32((dev_info & ~(0xffu)) | value);
+	writel(dev_info, ptr);
+	return size;
+}
+
+static ssize_t dbc_vid_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	void __iomem *ptr;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	ptr = &dbc->regs->devinfo1;
+	return sprintf(buf, "%04x\n", ((u32)le32_to_cpu(readl(ptr))) >> 16);
+}
+
+static ssize_t dbc_vid_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	int value;
+	int ret;
+	void __iomem *ptr;
+	u32 dev_info;
+
+	ret = kstrtoint(buf, 0, &value);
+	if (ret || value < 0 || value > 0xffff)
+		return -EINVAL;
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	ptr = &dbc->regs->devinfo1;
+	dev_info = le32_to_cpu(readl(ptr));
+	dev_info = cpu_to_le32((dev_info & ~(0xffffu << 16)) | (value << 16));
+	writel(dev_info, ptr);
+	return size;
+}
+
+
+static ssize_t dbc_pid_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	void __iomem *ptr;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	ptr = &dbc->regs->devinfo2;
+	return sprintf(buf, "%04x\n", le32_to_cpu(readl(ptr)) & 0xffff);
+}
+
+static ssize_t dbc_pid_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	int value;
+	int ret;
+	void __iomem *ptr;
+	u32 dev_info;
+
+	ret = kstrtoint(buf, 0, &value);
+	if (ret || value < 0 || value > 0xffff)
+		return -EINVAL;
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	ptr = &dbc->regs->devinfo2;
+	dev_info = le32_to_cpu(readl(ptr));
+	dev_info = cpu_to_le32((dev_info & ~(0xffffu)) | value);
+	writel(dev_info, ptr);
+	return size;
+}
+
+static ssize_t dbc_device_rev_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	void __iomem *ptr;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	ptr = &dbc->regs->devinfo2;
+	return sprintf(buf, "%04x\n",  ((u32)le32_to_cpu(readl(ptr))) >> 16);
+}
+
+static ssize_t dbc_device_rev_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	int value;
+	int ret;
+	void __iomem *ptr;
+	u32 dev_info;
+
+	ret = kstrtoint(buf, 0, &value);
+	if (ret || value < 0 || value > 0xffff)
+		return -EINVAL;
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+	ptr = &dbc->regs->devinfo2;
+	dev_info = le32_to_cpu(readl(ptr));
+	dev_info = cpu_to_le32((dev_info & ~(0xffffu << 16)) | (value << 16));
+	writel(dev_info, ptr);
+	return size;
+}
+
 static ssize_t dbc_show(struct device *dev,
 			struct device_attribute *attr,
 			char *buf)
@@ -910,6 +1219,29 @@ static ssize_t dbc_show(struct device *dev,
 	return sprintf(buf, "%s\n", p);
 }
 
+static DEVICE_ATTR_RW(dbc_manufacturer);
+static DEVICE_ATTR_RW(dbc_product);
+static DEVICE_ATTR_RW(dbc_serial);
+static DEVICE_ATTR_RW(dbc_protocol);
+static DEVICE_ATTR_RW(dbc_vid);
+static DEVICE_ATTR_RW(dbc_pid);
+static DEVICE_ATTR_RW(dbc_device_rev);
+
+static struct attribute *dbc_descriptor_attributes[] = {
+	&dev_attr_dbc_manufacturer.attr,
+	&dev_attr_dbc_product.attr,
+	&dev_attr_dbc_serial.attr,
+	&dev_attr_dbc_protocol.attr,
+	&dev_attr_dbc_vid.attr,
+	&dev_attr_dbc_pid.attr,
+	&dev_attr_dbc_device_rev.attr,
+	NULL
+};
+
+static const struct attribute_group dbc_descriptor_attrib_grp = {
+	.attrs = dbc_descriptor_attributes,
+};
+
 static ssize_t dbc_store(struct device *dev,
 			 struct device_attribute *attr,
 			 const char *buf, size_t count)
@@ -938,6 +1270,10 @@ static ssize_t dbc_store(struct device *dev,
 			goto err;
 		}
 		xhci_dbc_start(xhci);
+		ret = sysfs_create_group(&dev->kobj,
+					 &dbc_descriptor_attrib_grp);
+		if (ret)
+			goto err;
 	} else if (!strncmp(buf, "disable", 7) && dbc->state != DS_DISABLED) {
 		if (!dbc_registered_func)
 			return -EINVAL;
@@ -945,6 +1281,7 @@ static ssize_t dbc_store(struct device *dev,
 		if (dbc_registered_func->stop)
 			dbc_registered_func->stop(dbc);
 		module_put(dbc_registered_func->owner);
+		sysfs_remove_group(&dev->kobj, &dbc_descriptor_attrib_grp);
 	} else
 		return -EINVAL;
 
@@ -955,9 +1292,11 @@ static ssize_t dbc_store(struct device *dev,
 }
 
 static DEVICE_ATTR_RW(dbc);
+static DEVICE_ATTR_RO(dbc_function);
 
 static struct attribute *dbc_dev_attributes[] = {
 	&dev_attr_dbc.attr,
+	&dev_attr_dbc_function.attr,
 	NULL
 };
 
-- 
2.21.0

