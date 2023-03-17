Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4D66BED3D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjCQPqU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjCQPqT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:19 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D567FB79F0
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067974; x=1710603974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NE/nDKs40g4JfeJ7Gkl4j4LEsrK+PvdHuR6yj0nmtt8=;
  b=hBhBN9KIXS9PzFuDOC7jq5EHE+9T3Myl18Z1cG40KC4ZMGCVDU/A2q12
   TUGg5Bp99RkYZTmryMf9KowmeHSttA+wNELX/nsz92FhHSko8O4jTzPhH
   1cYlgddDeiYLp4xBrx6UOWn8FXKZz0sd6/2DH1J+kUor8H9J5fp1UpCtq
   GN5vSqXoT8R0g9jJb68Z8+bTpl0SDw8XiwxfkEscie4DgoE7uLk59WBZ0
   vXSNnsl1OrDoFi3F2HVW+4UuAbnt4sbMD1/xqJSgidX8vSh7xVQiAkmSd
   IAz8peXuYigINLrbjUuOrY3PPFyA/7+Nti8W0nIkzcqAGEwZdXqfELOEh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309821"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309821"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630312004"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630312004"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:46:13 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 08/14] xhci: dbc: Provide sysfs option to configure dbc descriptors
Date:   Fri, 17 Mar 2023 17:47:09 +0200
Message-Id: <20230317154715.535523-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
References: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
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

When DbC is enabled the first port on the xHC host acts as a usb device.
xHC provides the descriptors automatically when the DbC device is
enumerated. Most of the values are hardcoded, but some fields such as
idProduct, idVendor, bcdDevice and bInterfaceProtocol can be modified.

Add sysfs entries that allow userspace to change these.
User can only change them before dbc is enabled, i.e. before writing
"enable" to dbc sysfs file as we don't want these values to change while
device is connected, or during  enumeration.

Add documentation for these entries in
Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  52 +++++
 drivers/usb/host/xhci-dbgcap.c                | 191 +++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h                |   4 +
 3 files changed, 243 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index 0088aba4caa8..5a775b8f6543 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -23,3 +23,55 @@ Description:
 		Reading this attribute gives the state of the DbC. It
 		can be one of the following states: disabled, enabled,
 		initialized, connected, configured and stalled.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_idVendor
+Date:		March 2023
+Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
+Description:
+		This dbc_idVendor attribute lets us change the idVendor field
+		presented in the USB device descriptor by this xhci debug
+		device.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB device descriptor change while
+		connected to a USB host.
+		The default value is 0x1d6b (Linux Foundation).
+		It can be any 16-bit integer.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_idProduct
+Date:		March 2023
+Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
+Description:
+		This dbc_idProduct attribute lets us change the idProduct field
+		presented in the USB device descriptor by this xhci debug
+		device.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB device descriptor change while
+		connected to a USB host.
+		The default value is 0x0010. It can be any 16-bit integer.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_bcdDevice
+Date:		March 2023
+Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
+Description:
+		This dbc_bcdDevice attribute lets us change the bcdDevice field
+		presented in the USB device descriptor by this xhci debug
+		device.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB device descriptor change while
+		connected to a USB host.
+		The default value is 0x0010. (device rev 0.10)
+		It can be any 16-bit integer.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_bInterfaceProtocol
+Date:		March 2023
+Contact:	Mathias Nyman <mathias.nyman@linux.intel.com>
+Description:
+		This attribute lets us change the bInterfaceProtocol field
+		presented in the USB Interface descriptor by the xhci debug
+		device.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB descriptor change while
+		connected to a USB host.
+		The default value is 1  (GNU Remote Debug command).
+		Other permissible value is 0 which is for vendor defined debug
+		target.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index f1367b53b260..b40d9238d447 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -124,10 +124,10 @@ static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
 	/* Set DbC context and info registers: */
 	lo_hi_writeq(dbc->ctx->dma, &dbc->regs->dccp);
 
-	dev_info = cpu_to_le32((DBC_VENDOR_ID << 16) | DBC_PROTOCOL);
+	dev_info = (dbc->idVendor << 16) | dbc->bInterfaceProtocol;
 	writel(dev_info, &dbc->regs->devinfo1);
 
-	dev_info = cpu_to_le32((DBC_DEVICE_REV << 16) | DBC_PRODUCT_ID);
+	dev_info = (dbc->bcdDevice << 16) | dbc->idProduct;
 	writel(dev_info, &dbc->regs->devinfo2);
 }
 
@@ -971,7 +971,186 @@ static ssize_t dbc_store(struct device *dev,
 	return count;
 }
 
+static ssize_t dbc_idVendor_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct xhci_dbc		*dbc;
+	struct xhci_hcd		*xhci;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+
+	return sprintf(buf, "%04x\n", dbc->idVendor);
+}
+
+static ssize_t dbc_idVendor_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct xhci_dbc		*dbc;
+	struct xhci_hcd		*xhci;
+	void __iomem		*ptr;
+	u16			value;
+	u32			dev_info;
+
+	if (kstrtou16(buf, 0, &value))
+		return -EINVAL;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	dbc->idVendor = value;
+	ptr = &dbc->regs->devinfo1;
+	dev_info = readl(ptr);
+	dev_info = (dev_info & ~(0xffffu << 16)) | (value << 16);
+	writel(dev_info, ptr);
+
+	return size;
+}
+
+static ssize_t dbc_idProduct_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+
+	return sprintf(buf, "%04x\n", dbc->idProduct);
+}
+
+static ssize_t dbc_idProduct_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct xhci_dbc         *dbc;
+	struct xhci_hcd         *xhci;
+	void __iomem		*ptr;
+	u32			dev_info;
+	u16			value;
+
+	if (kstrtou16(buf, 0, &value))
+		return -EINVAL;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	dbc->idProduct = value;
+	ptr = &dbc->regs->devinfo2;
+	dev_info = readl(ptr);
+	dev_info = (dev_info & ~(0xffffu)) | value;
+	writel(dev_info, ptr);
+	return size;
+}
+
+static ssize_t dbc_bcdDevice_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct xhci_dbc	*dbc;
+	struct xhci_hcd	*xhci;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+
+	return sprintf(buf, "%04x\n", dbc->bcdDevice);
+}
+
+static ssize_t dbc_bcdDevice_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	struct xhci_dbc	*dbc;
+	struct xhci_hcd	*xhci;
+	void __iomem *ptr;
+	u32 dev_info;
+	u16 value;
+
+	if (kstrtou16(buf, 0, &value))
+		return -EINVAL;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	dbc->bcdDevice = value;
+	ptr = &dbc->regs->devinfo2;
+	dev_info = readl(ptr);
+	dev_info = (dev_info & ~(0xffffu << 16)) | (value << 16);
+	writel(dev_info, ptr);
+
+	return size;
+}
+
+static ssize_t dbc_bInterfaceProtocol_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct xhci_dbc	*dbc;
+	struct xhci_hcd	*xhci;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+
+	return sprintf(buf, "%02x\n", dbc->bInterfaceProtocol);
+}
+
+static ssize_t dbc_bInterfaceProtocol_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	struct xhci_dbc *dbc;
+	struct xhci_hcd *xhci;
+	void __iomem *ptr;
+	u32 dev_info;
+	u8 value;
+	int ret;
+
+	/* bInterfaceProtocol is 8 bit, but xhci only supports values 0 and 1 */
+	ret = kstrtou8(buf, 0, &value);
+	if (ret || value > 1)
+		return -EINVAL;
+
+	xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	dbc = xhci->dbc;
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	dbc->bInterfaceProtocol = value;
+	ptr = &dbc->regs->devinfo1;
+	dev_info = readl(ptr);
+	dev_info = (dev_info & ~(0xffu)) | value;
+	writel(dev_info, ptr);
+
+	return size;
+}
+
 static DEVICE_ATTR_RW(dbc);
+static DEVICE_ATTR_RW(dbc_idVendor);
+static DEVICE_ATTR_RW(dbc_idProduct);
+static DEVICE_ATTR_RW(dbc_bcdDevice);
+static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
+
+static struct attribute *dbc_dev_attributes[] = {
+	&dev_attr_dbc.attr,
+	&dev_attr_dbc_idVendor.attr,
+	&dev_attr_dbc_idProduct.attr,
+	&dev_attr_dbc_bcdDevice.attr,
+	&dev_attr_dbc_bInterfaceProtocol.attr,
+	NULL
+};
+
+static const struct attribute_group dbc_dev_attrib_grp = {
+	.attrs = dbc_dev_attributes,
+};
 
 struct xhci_dbc *
 xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *driver)
@@ -986,6 +1165,10 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	dbc->regs = base;
 	dbc->dev = dev;
 	dbc->driver = driver;
+	dbc->idProduct = DBC_PRODUCT_ID;
+	dbc->idVendor = DBC_VENDOR_ID;
+	dbc->bcdDevice = DBC_DEVICE_REV;
+	dbc->bInterfaceProtocol = DBC_PROTOCOL;
 
 	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
 		goto err;
@@ -993,7 +1176,7 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	INIT_DELAYED_WORK(&dbc->event_work, xhci_dbc_handle_events);
 	spin_lock_init(&dbc->lock);
 
-	ret = device_create_file(dev, &dev_attr_dbc);
+	ret = sysfs_create_group(&dev->kobj, &dbc_dev_attrib_grp);
 	if (ret)
 		goto err;
 
@@ -1012,7 +1195,7 @@ void xhci_dbc_remove(struct xhci_dbc *dbc)
 	xhci_dbc_stop(dbc);
 
 	/* remove sysfs files */
-	device_remove_file(dbc->dev, &dev_attr_dbc);
+	sysfs_remove_group(&dbc->dev->kobj, &dbc_dev_attrib_grp);
 
 	kfree(dbc);
 }
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index ca04192fdab1..51a7ab3ba0ca 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -132,6 +132,10 @@ struct xhci_dbc {
 	struct dbc_str_descs		*string;
 	dma_addr_t			string_dma;
 	size_t				string_size;
+	u16				idVendor;
+	u16				idProduct;
+	u16				bcdDevice;
+	u8				bInterfaceProtocol;
 
 	enum dbc_state			state;
 	struct delayed_work		event_work;
-- 
2.25.1

