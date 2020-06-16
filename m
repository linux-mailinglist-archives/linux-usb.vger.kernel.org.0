Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948071FB366
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 16:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgFPOEb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 10:04:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:36218 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729109AbgFPOE3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 10:04:29 -0400
IronPort-SDR: YdaiwlB5Ywa5mOSAwtSjNJKam/TkjY8f2E8fUCdvd8/evRg+LGXk2Tna1HBsBES80/944APuEd
 RGTk3u7lfJLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:25 -0700
IronPort-SDR: T7JWllKoSle3ECZlRfSC/Lc4PTe+SwhNjav8yTY3Xp99rLPCRhPw43ROrlCcp77dD50+RTfuTt
 L5D2O6GGOekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="420769365"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 16 Jun 2020 06:56:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5CBE8946; Tue, 16 Jun 2020 16:56:18 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 6/6] thunderbolt: Add support for on-board retimers
Date:   Tue, 16 Jun 2020 16:56:17 +0300
Message-Id: <20200616135617.85752-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kranthi Kuntala <kranthi.kuntala@intel.com>

USB4 spec specifies standard access to retimers (both on-board and
cable) through USB4 port sideband access. This makes it possible to
upgrade their firmware in the same way than we already do with the
routers.

This enumerates on-board retimers under each USB4 port when the link
comes up and adds them to the bus under the router the retimer belongs
to. Retimers are exposed in sysfs with name like <device>:<port>.<index>
where device is the router the retimer belongs to, port is the USB4 port
the retimer is connected to and index is the retimer index under that
port (starting from 1). This applies to the upstream USB4 port as well
so if there is on-board retimer between the port and the router it is
also added accordingly.

At this time we do not add cable retimers but there is no techincal
restriction to do so in the future if needed. It is not clear whether it
makes sense to upgrade their firmwares and at least Thunderbolt 3 cables
it has not been done outside of lab environments.

The sysfs interface is made to follow the router NVM upgrade to make it
easy to extend the existing userspace (fwupd) to handle these as well.

Signed-off-by: Kranthi Kuntala <kranthi.kuntala@intel.com>
Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         |  33 ++
 Documentation/admin-guide/thunderbolt.rst     |  11 +-
 drivers/thunderbolt/Makefile                  |   2 +-
 drivers/thunderbolt/retimer.c                 | 485 ++++++++++++++++++
 drivers/thunderbolt/sb_regs.h                 |   2 +
 drivers/thunderbolt/switch.c                  |   3 +
 drivers/thunderbolt/tb.c                      |  10 +
 drivers/thunderbolt/tb.h                      |  38 ++
 8 files changed, 578 insertions(+), 6 deletions(-)
 create mode 100644 drivers/thunderbolt/retimer.c

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index 82e80de78dd0..bd504ed323e8 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -236,3 +236,36 @@ KernelVersion:	4.15
 Contact:	thunderbolt-software@lists.01.org
 Description:	This contains XDomain service specific settings as
 		bitmask. Format: %x
+
+What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/device
+Date:		Oct 2020
+KernelVersion:	v5.9
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Retimer device identifier read from the hardware.
+
+What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/nvm_authenticate
+Date:		Oct 2020
+KernelVersion:	v5.9
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	When new NVM image is written to the non-active NVM
+		area (through non_activeX NVMem device), the
+		authentication procedure is started by writing 1 to
+		this file. If everything goes well, the device is
+		restarted with the new NVM firmware. If the image
+		verification fails an error code is returned instead.
+
+		When read holds status of the last authentication
+		operation if an error occurred during the process.
+		Format: %x.
+
+What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/nvm_version
+Date:		Oct 2020
+KernelVersion:	v5.9
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Holds retimer NVM version number. Format: %x.%x, major.minor.
+
+What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/vendor
+Date:		Oct 2020
+KernelVersion:	v5.9
+Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Description:	Retimer vendor identifier read from the hardware.
diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 10c4f0ce2ad0..613cb24c76c7 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -173,8 +173,8 @@ following ``udev`` rule::
 
   ACTION=="add", SUBSYSTEM=="thunderbolt", ATTRS{iommu_dma_protection}=="1", ATTR{authorized}=="0", ATTR{authorized}="1"
 
-Upgrading NVM on Thunderbolt device or host
--------------------------------------------
+Upgrading NVM on Thunderbolt device, host or retimer
+----------------------------------------------------
 Since most of the functionality is handled in firmware running on a
 host controller or a device, it is important that the firmware can be
 upgraded to the latest where possible bugs in it have been fixed.
@@ -185,9 +185,10 @@ for some machines:
 
   `Thunderbolt Updates <https://thunderbolttechnology.net/updates>`_
 
-Before you upgrade firmware on a device or host, please make sure it is a
-suitable upgrade. Failing to do that may render the device (or host) in a
-state where it cannot be used properly anymore without special tools!
+Before you upgrade firmware on a device, host or retimer, please make
+sure it is a suitable upgrade. Failing to do that may render the device
+in a state where it cannot be used properly anymore without special
+tools!
 
 Host NVM upgrade on Apple Macs is not supported.
 
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index 7ee257cee7ff..cf7e1b42f4ad 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -2,6 +2,6 @@
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o nhi_ops.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
-thunderbolt-objs += nvm.o
+thunderbolt-objs += nvm.o retimer.o
 
 obj-${CONFIG_USB4_KUNIT_TEST} += test.o
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
new file mode 100644
index 000000000000..620bcf586ee2
--- /dev/null
+++ b/drivers/thunderbolt/retimer.c
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Thunderbolt/USB4 retimer support.
+ *
+ * Copyright (C) 2020, Intel Corporation
+ * Authors: Kranthi Kuntala <kranthi.kuntala@intel.com>
+ *	    Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <linux/sched/signal.h>
+
+#include "sb_regs.h"
+#include "tb.h"
+
+#define TB_MAX_RETIMER_INDEX	6
+
+static int tb_retimer_nvm_read(void *priv, unsigned int offset, void *val,
+			       size_t bytes)
+{
+	struct tb_nvm *nvm = priv;
+	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
+	int ret;
+
+	pm_runtime_get_sync(&rt->dev);
+
+	if (!mutex_trylock(&rt->tb->lock)) {
+		ret = restart_syscall();
+		goto out;
+	}
+
+	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, offset, val, bytes);
+	mutex_unlock(&rt->tb->lock);
+
+out:
+	pm_runtime_mark_last_busy(&rt->dev);
+	pm_runtime_put_autosuspend(&rt->dev);
+
+	return ret;
+}
+
+static int tb_retimer_nvm_write(void *priv, unsigned int offset, void *val,
+				size_t bytes)
+{
+	struct tb_nvm *nvm = priv;
+	struct tb_retimer *rt = tb_to_retimer(nvm->dev);
+	int ret = 0;
+
+	if (!mutex_trylock(&rt->tb->lock))
+		return restart_syscall();
+
+	ret = tb_nvm_write_buf(nvm, offset, val, bytes);
+	mutex_unlock(&rt->tb->lock);
+
+	return ret;
+}
+
+static int tb_retimer_nvm_add(struct tb_retimer *rt)
+{
+	struct tb_nvm *nvm;
+	u32 val, nvm_size;
+	int ret;
+
+	nvm = tb_nvm_alloc(&rt->dev);
+	if (IS_ERR(nvm))
+		return PTR_ERR(nvm);
+
+	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, NVM_VERSION, &val,
+					 sizeof(val));
+	if (ret)
+		goto err_nvm;
+
+	nvm->major = val >> 16;
+	nvm->minor = val >> 8;
+
+	ret = usb4_port_retimer_nvm_read(rt->port, rt->index, NVM_FLASH_SIZE,
+					 &val, sizeof(val));
+	if (ret)
+		goto err_nvm;
+
+	nvm_size = (SZ_1M << (val & 7)) / 8;
+	nvm_size = (nvm_size - SZ_16K) / 2;
+
+	ret = tb_nvm_add_active(nvm, nvm_size, tb_retimer_nvm_read);
+	if (ret)
+		goto err_nvm;
+
+	ret = tb_nvm_add_non_active(nvm, NVM_MAX_SIZE, tb_retimer_nvm_write);
+	if (ret)
+		goto err_nvm;
+
+	rt->nvm = nvm;
+	return 0;
+
+err_nvm:
+	tb_nvm_free(nvm);
+	return ret;
+}
+
+static int tb_retimer_nvm_validate_and_write(struct tb_retimer *rt)
+{
+	unsigned int image_size, hdr_size;
+	const u8 *buf = rt->nvm->buf;
+	u16 ds_size, device;
+
+	image_size = rt->nvm->buf_data_size;
+	if (image_size < NVM_MIN_SIZE || image_size > NVM_MAX_SIZE)
+		return -EINVAL;
+
+	/*
+	 * FARB pointer must point inside the image and must at least
+	 * contain parts of the digital section we will be reading here.
+	 */
+	hdr_size = (*(u32 *)buf) & 0xffffff;
+	if (hdr_size + NVM_DEVID + 2 >= image_size)
+		return -EINVAL;
+
+	/* Digital section start should be aligned to 4k page */
+	if (!IS_ALIGNED(hdr_size, SZ_4K))
+		return -EINVAL;
+
+	/*
+	 * Read digital section size and check that it also fits inside
+	 * the image.
+	 */
+	ds_size = *(u16 *)(buf + hdr_size);
+	if (ds_size >= image_size)
+		return -EINVAL;
+
+	/*
+	 * Make sure the device ID in the image matches the retimer
+	 * hardware.
+	 */
+	device = *(u16 *)(buf + hdr_size + NVM_DEVID);
+	if (device != rt->device)
+		return -EINVAL;
+
+	/* Skip headers in the image */
+	buf += hdr_size;
+	image_size -= hdr_size;
+
+	return usb4_port_retimer_nvm_write(rt->port, rt->index, 0, buf,
+					   image_size);
+}
+
+static ssize_t device_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+
+	return sprintf(buf, "%#x\n", rt->device);
+}
+static DEVICE_ATTR_RO(device);
+
+static ssize_t nvm_authenticate_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+	int ret;
+
+	if (!mutex_trylock(&rt->tb->lock))
+		return restart_syscall();
+
+	if (!rt->nvm)
+		ret = -EAGAIN;
+	else
+		ret = sprintf(buf, "%#x\n", rt->auth_status);
+
+	mutex_unlock(&rt->tb->lock);
+
+	return ret;
+}
+
+static ssize_t nvm_authenticate_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+	bool val;
+	int ret;
+
+	pm_runtime_get_sync(&rt->dev);
+
+	if (!mutex_trylock(&rt->tb->lock)) {
+		ret = restart_syscall();
+		goto exit_rpm;
+	}
+
+	if (!rt->nvm) {
+		ret = -EAGAIN;
+		goto exit_unlock;
+	}
+
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		goto exit_unlock;
+
+	/* Always clear status */
+	rt->auth_status = 0;
+
+	if (val) {
+		if (!rt->nvm->buf) {
+			ret = -EINVAL;
+			goto exit_unlock;
+		}
+
+		ret = tb_retimer_nvm_validate_and_write(rt);
+		if (ret)
+			goto exit_unlock;
+
+		ret = usb4_port_retimer_nvm_authenticate(rt->port, rt->index);
+	}
+
+exit_unlock:
+	mutex_unlock(&rt->tb->lock);
+exit_rpm:
+	pm_runtime_mark_last_busy(&rt->dev);
+	pm_runtime_put_autosuspend(&rt->dev);
+
+	if (ret)
+		return ret;
+	return count;
+}
+static DEVICE_ATTR_RW(nvm_authenticate);
+
+static ssize_t nvm_version_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+	int ret;
+
+	if (!mutex_trylock(&rt->tb->lock))
+		return restart_syscall();
+
+	if (!rt->nvm)
+		ret = -EAGAIN;
+	else
+		ret = sprintf(buf, "%x.%x\n", rt->nvm->major, rt->nvm->minor);
+
+	mutex_unlock(&rt->tb->lock);
+	return ret;
+}
+static DEVICE_ATTR_RO(nvm_version);
+
+static ssize_t vendor_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+
+	return sprintf(buf, "%#x\n", rt->vendor);
+}
+static DEVICE_ATTR_RO(vendor);
+
+static struct attribute *retimer_attrs[] = {
+	&dev_attr_device.attr,
+	&dev_attr_nvm_authenticate.attr,
+	&dev_attr_nvm_version.attr,
+	&dev_attr_vendor.attr,
+	NULL
+};
+
+static const struct attribute_group retimer_group = {
+	.attrs = retimer_attrs,
+};
+
+static const struct attribute_group *retimer_groups[] = {
+	&retimer_group,
+	NULL
+};
+
+static void tb_retimer_release(struct device *dev)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+
+	kfree(rt);
+}
+
+struct device_type tb_retimer_type = {
+	.name = "thunderbolt_retimer",
+	.groups = retimer_groups,
+	.release = tb_retimer_release,
+};
+
+static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
+{
+	struct tb_retimer *rt;
+	u32 vendor, device;
+	int ret;
+
+	if (!port->cap_usb4)
+		return -EINVAL;
+
+	ret = usb4_port_retimer_read(port, index, USB4_SB_VENDOR_ID, &vendor,
+				     sizeof(vendor));
+	if (ret) {
+		if (ret != -ENODEV)
+			tb_port_warn(port, "failed read retimer VendorId: %d\n", ret);
+		return ret;
+	}
+
+	ret = usb4_port_retimer_read(port, index, USB4_SB_PRODUCT_ID, &device,
+				     sizeof(device));
+	if (ret) {
+		if (ret != -ENODEV)
+			tb_port_warn(port, "failed read retimer ProductId: %d\n", ret);
+		return ret;
+	}
+
+	if (vendor != PCI_VENDOR_ID_INTEL && vendor != 0x8087) {
+		tb_port_info(port, "retimer NVM format of vendor %#x is not supported\n",
+			     vendor);
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * Check that it supports NVM operations. If not then don't add
+	 * the device at all.
+	 */
+	ret = usb4_port_retimer_nvm_sector_size(port, index);
+	if (ret < 0)
+		return ret;
+
+	rt = kzalloc(sizeof(*rt), GFP_KERNEL);
+	if (!rt)
+		return -ENOMEM;
+
+	rt->index = index;
+	rt->vendor = vendor;
+	rt->device = device;
+	rt->auth_status = auth_status;
+	rt->port = port;
+	rt->tb = port->sw->tb;
+
+	rt->dev.parent = &port->sw->dev;
+	rt->dev.bus = &tb_bus_type;
+	rt->dev.type = &tb_retimer_type;
+	dev_set_name(&rt->dev, "%s:%u.%u", dev_name(&port->sw->dev),
+		     port->port, index);
+
+	ret = device_register(&rt->dev);
+	if (ret) {
+		dev_err(&rt->dev, "failed to register retimer: %d\n", ret);
+		put_device(&rt->dev);
+		return ret;
+	}
+
+	ret = tb_retimer_nvm_add(rt);
+	if (ret) {
+		dev_err(&rt->dev, "failed to add NVM devices: %d\n", ret);
+		device_del(&rt->dev);
+		return ret;
+	}
+
+	dev_info(&rt->dev, "new retimer found, vendor=%#x device=%#x\n",
+		 rt->vendor, rt->device);
+
+	pm_runtime_no_callbacks(&rt->dev);
+	pm_runtime_set_active(&rt->dev);
+	pm_runtime_enable(&rt->dev);
+	pm_runtime_set_autosuspend_delay(&rt->dev, TB_AUTOSUSPEND_DELAY);
+	pm_runtime_mark_last_busy(&rt->dev);
+	pm_runtime_use_autosuspend(&rt->dev);
+
+	return 0;
+}
+
+static void tb_retimer_remove(struct tb_retimer *rt)
+{
+	dev_info(&rt->dev, "retimer disconnected\n");
+	tb_nvm_free(rt->nvm);
+	device_unregister(&rt->dev);
+}
+
+struct tb_retimer_lookup {
+	const struct tb_port *port;
+	u8 index;
+};
+
+static int retimer_match(struct device *dev, void *data)
+{
+	const struct tb_retimer_lookup *lookup = data;
+	struct tb_retimer *rt = tb_to_retimer(dev);
+
+	return rt && rt->port == lookup->port && rt->index == lookup->index;
+}
+
+static struct tb_retimer *tb_port_find_retimer(struct tb_port *port, u8 index)
+{
+	struct tb_retimer_lookup lookup = { .port = port, .index = index };
+	struct device *dev;
+
+	dev = device_find_child(&port->sw->dev, &lookup, retimer_match);
+	if (dev)
+		return tb_to_retimer(dev);
+
+	return NULL;
+}
+
+/**
+ * tb_retimer_scan() - Scan for on-board retimers under port
+ * @port: USB4 port to scan
+ *
+ * Tries to enumerate on-board retimers connected to @port. Found
+ * retimers are registered as children of @port. Does not scan for cable
+ * retimers for now.
+ */
+int tb_retimer_scan(struct tb_port *port)
+{
+	u32 status[TB_MAX_RETIMER_INDEX] = {};
+	int ret, i, last_idx = 0;
+
+	if (!port->cap_usb4)
+		return 0;
+
+	/*
+	 * Send broadcast RT to make sure retimer indices facing this
+	 * port are set.
+	 */
+	ret = usb4_port_enumerate_retimers(port);
+	if (ret)
+		return ret;
+
+	/*
+	 * Before doing anything else, read the authentication status.
+	 * If the retimer has it set, store it for the new retimer
+	 * device instance.
+	 */
+	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++)
+		usb4_port_retimer_nvm_authenticate_status(port, i, &status[i]);
+
+	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++) {
+		/*
+		 * Last retimer is true only for the last on-board
+		 * retimer (the one connected directly to the Type-C
+		 * port).
+		 */
+		ret = usb4_port_retimer_is_last(port, i);
+		if (ret > 0)
+			last_idx = i;
+		else if (ret < 0)
+			break;
+	}
+
+	if (!last_idx)
+		return 0;
+
+	/* Add on-board retimers if they do not exist already */
+	for (i = 1; i <= last_idx; i++) {
+		struct tb_retimer *rt;
+
+		rt = tb_port_find_retimer(port, i);
+		if (rt) {
+			put_device(&rt->dev);
+		} else {
+			ret = tb_retimer_add(port, i, status[i]);
+			if (ret && ret != -EOPNOTSUPP)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int remove_retimer(struct device *dev, void *data)
+{
+	struct tb_retimer *rt = tb_to_retimer(dev);
+	struct tb_port *port = data;
+
+	if (rt && rt->port == port)
+		tb_retimer_remove(rt);
+	return 0;
+}
+
+/**
+ * tb_retimer_remove_all() - Remove all retimers under port
+ * @port: USB4 port whose retimers to remove
+ *
+ * This removes all previously added retimers under @port.
+ */
+void tb_retimer_remove_all(struct tb_port *port)
+{
+	if (port->cap_usb4)
+		device_for_each_child_reverse(&port->sw->dev, port,
+					      remove_retimer);
+}
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 0e587b7b9200..9dafd696612f 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -10,6 +10,8 @@
 #ifndef _SB_REGS
 #define _SB_REGS
 
+#define USB4_SB_VENDOR_ID			0x00
+#define USB4_SB_PRODUCT_ID			0x01
 #define USB4_SB_OPCODE				0x08
 
 enum usb4_sb_opcode {
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index c8ed614f14e6..817c66c7adcf 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2392,6 +2392,9 @@ void tb_switch_remove(struct tb_switch *sw)
 			tb_xdomain_remove(port->xdomain);
 			port->xdomain = NULL;
 		}
+
+		/* Remove any downstream retimers */
+		tb_retimer_remove_all(port);
 	}
 
 	if (!sw->is_unplugged)
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index bbcf0f25617c..f507815040eb 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -539,6 +539,9 @@ static void tb_scan_port(struct tb_port *port)
 		tb_port_dbg(port, "port already has a remote\n");
 		return;
 	}
+
+	tb_retimer_scan(port);
+
 	sw = tb_switch_alloc(port->sw->tb, &port->sw->dev,
 			     tb_downstream_route(port));
 	if (IS_ERR(sw)) {
@@ -595,6 +598,9 @@ static void tb_scan_port(struct tb_port *port)
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
 
+	/* Scan upstream retimers */
+	tb_retimer_scan(upstream_port);
+
 	/*
 	 * Create USB 3.x tunnels only when the switch is plugged to the
 	 * domain. This is because we scan the domain also during discovery
@@ -674,6 +680,7 @@ static void tb_free_unplugged_children(struct tb_switch *sw)
 			continue;
 
 		if (port->remote->sw->is_unplugged) {
+			tb_retimer_remove_all(port);
 			tb_remove_dp_resources(port->remote->sw);
 			tb_switch_lane_bonding_disable(port->remote->sw);
 			tb_switch_remove(port->remote->sw);
@@ -1039,6 +1046,8 @@ static void tb_handle_hotplug(struct work_struct *work)
 		goto put_sw;
 	}
 	if (ev->unplug) {
+		tb_retimer_remove_all(port);
+
 		if (tb_port_has_remote(port)) {
 			tb_port_dbg(port, "switch unplugged\n");
 			tb_sw_set_unplugged(port->remote->sw);
@@ -1283,6 +1292,7 @@ static int tb_free_unplugged_xdomains(struct tb_switch *sw)
 		if (tb_is_upstream_port(port))
 			continue;
 		if (port->xdomain && port->xdomain->is_unplugged) {
+			tb_retimer_remove_all(port);
 			tb_xdomain_remove(port->xdomain);
 			port->xdomain = NULL;
 			ret++;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8f840148378a..736d1589c31e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -210,6 +210,28 @@ struct tb_port {
 	struct list_head list;
 };
 
+/**
+ * tb_retimer: Thunderbolt retimer
+ * @dev: Device for the retimer
+ * @tb: Pointer to the domain the retimer belongs to
+ * @index: Retimer index facing the router USB4 port
+ * @vendor: Vendor ID of the retimer
+ * @device: Device ID of the retimer
+ * @port: Pointer to the lane 0 adapter
+ * @nvm: Pointer to the NVM if the retimer has one (%NULL otherwise)
+ * @auth_status: Status of last NVM authentication
+ */
+struct tb_retimer {
+	struct device dev;
+	struct tb *tb;
+	u8 index;
+	u32 vendor;
+	u32 device;
+	struct tb_port *port;
+	struct tb_nvm *nvm;
+	u32 auth_status;
+};
+
 /**
  * struct tb_path_hop - routing information for a tb_path
  * @in_port: Ingress port of a switch
@@ -553,6 +575,7 @@ struct tb *icm_probe(struct tb_nhi *nhi);
 struct tb *tb_probe(struct tb_nhi *nhi);
 
 extern struct device_type tb_domain_type;
+extern struct device_type tb_retimer_type;
 extern struct device_type tb_switch_type;
 
 int tb_domain_init(void);
@@ -853,6 +876,21 @@ void tb_xdomain_remove(struct tb_xdomain *xd);
 struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
 						 u8 depth);
 
+int tb_retimer_scan(struct tb_port *port);
+void tb_retimer_remove_all(struct tb_port *port);
+
+static inline bool tb_is_retimer(const struct device *dev)
+{
+	return dev->type == &tb_retimer_type;
+}
+
+static inline struct tb_retimer *tb_to_retimer(struct device *dev)
+{
+	if (tb_is_retimer(dev))
+		return container_of(dev, struct tb_retimer, dev);
+	return NULL;
+}
+
 int usb4_switch_setup(struct tb_switch *sw);
 int usb4_switch_read_uid(struct tb_switch *sw, u64 *uid);
 int usb4_switch_drom_read(struct tb_switch *sw, unsigned int address, void *buf,
-- 
2.27.0.rc2

