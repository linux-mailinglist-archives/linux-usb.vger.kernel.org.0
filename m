Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54E9517029
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 15:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235587AbiEBNYg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 09:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbiEBNYd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 09:24:33 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB69F1B1;
        Mon,  2 May 2022 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651497663; x=1683033663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=36Wep1oLBFpd7edpDkkthyuyFJl2bnI/rXOCbCF4/gM=;
  b=DHeeNQbeKlqBvPl50QpvGjzGcsND5zPQnEWCYyTOShfGRpC/U8IPvg5f
   B1XpSn4M95l5gaM67dD7qj5Kp53cwiyXRvA9QfEHm3kQ4VEBZ2RrPqVso
   VF1aOIpcjzOwB3siDTVl7hIB77UKSnqpGPcaa0uDiMB464dLMdyvNlo/p
   Q8YLFO0H9ahCkEANcs+0XcObX/AxCuLdaEapIobsYUEAr5xYXoaBHV+K+
   B2og6jsqR4g0whYS4CqS8lBrCvzxOMuO8HbhnkhGuMgRmdDeBF5pVixCC
   yYuOTJU9W3dUr3HRoGd7PhNPUGX6cXig5y03+Sda6pdZNh0/+lYpMU15j
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="267364109"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="267364109"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 06:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="707608352"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 May 2022 06:21:00 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>,
        Jameson Thies <jthies@google.com>,
        "Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] usb: typec: Separate USB Power Delivery from USB Type-C
Date:   Mon,  2 May 2022 16:20:56 +0300
Message-Id: <20220502132058.86236-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502132058.86236-1-heikki.krogerus@linux.intel.com>
References: <20220502132058.86236-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introducing a small device class for USB Power Delivery.
The idea with it is that we do not mix any more USB Power
Delivery information into the USB Type-C connectors only.
This separation will make it possible to register USB Power
Delivery devices also from other places, for example from
USB Type-C Bridges (see USB Type-C Bridge Specification).

The device class will not always deal with only the messages
and objects that were negotiated with the partner, but
instead messages and objects that can be used in the
negotiation. That allows the USB PD devices to be shared and
reconfigured. The ports can decide which objects are to be
advertised to the partner before the contract is negotiated.
It is also possible to allow the user space to make that
decision if needed.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 .../testing/sysfs-class-usb_power_delivery    | 240 ++++++
 drivers/usb/typec/Makefile                    |   2 +-
 drivers/usb/typec/pd.c                        | 708 ++++++++++++++++++
 drivers/usb/typec/pd.h                        |  30 +
 include/linux/usb/pd.h                        |  38 +
 include/linux/usb/typec.h                     |  10 +
 6 files changed, 1027 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-usb_power_delivery
 create mode 100644 drivers/usb/typec/pd.c
 create mode 100644 drivers/usb/typec/pd.h

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
new file mode 100644
index 0000000000000..ce2b1b563cb34
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
@@ -0,0 +1,240 @@
+What:		/sys/class/usb_power_delivery
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Directory for USB Power Delivery devices.
+
+What:		/sys/class/usb_power_delivery/.../revision
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		File showing the USB Power Delivery Specification Revision used
+		in communication.
+
+What:		/sys/class/usb_power_delivery/.../version
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This is an optional attribute file showing the version of the
+		specific revision of the USB Power Delivery Specification. In
+		most cases the specification version is not known and the file
+		is not available.
+
+What:		/sys/class/usb_power_delivery/.../source-capabilities
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The source capabilities message "Source_Capabilities" contains a
+		set of Power Data Objects (PDO), each representing a type of
+		power supply. The order of the PDO objects is defined in the USB
+		Power Delivery Specification. Each PDO - power supply - will
+		have its own device, and the PDO device name will start with the
+		object position number as the first character followed by the
+		power supply type name (":" as delimiter).
+
+			/sys/class/usb_power_delivery/.../source_capabilities/<position>:<type>
+
+What:		/sys/class/usb_power_delivery/.../sink-capabilities
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The sink capability message "Sink_Capabilities" contains a set
+		of Power Data Objects (PDO) just like with source capabilities,
+		but instead of describing the power capabilities, these objects
+		describe the power requirements.
+
+		The order of the objects in the sink capability message is the
+		same as with the source capabilities message.
+
+Fixed Supplies
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:fixed_supply
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Devices containing the attributes (the bit fields) defined for
+		Fixed Supplies.
+
+		The device "1:fixed_supply" is special. USB Power Delivery
+		Specification dictates that the first PDO (at object position
+		1), and the only mandatory PDO, is always the vSafe5V Fixed
+		Supply Object. vSafe5V Object has additional fields defined for
+		it that the other Fixed Supply Objects do not have and that are
+		related to the USB capabilities rather than power capabilities.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/dual_role_power
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file contains boolean value that tells does the device
+		support both source and sink power roles.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/usb_suspend_supported
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file shows the value of the USB Suspend Supported bit in
+		vSafe5V Fixed Supply Object. If the bit is set then the device
+		will follow the USB 2.0 and USB 3.2 rules for suspend and
+		resume.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unconstrained_power
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file shows the value of the Unconstrained Power bit in
+		vSafe5V Fixed Supply Object. The bit is set when an external
+		source of power, powerful enough to power the entire system on
+		its own, is available for the device.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/usb_communication_capable
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file shows the value of the USB Communication Capable bit in
+		vSafe5V Fixed Supply Object.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/dual_role_data
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file shows the value of the Dual-Role Data bit in vSafe5V
+		Fixed Supply Object. Dual role data means ability act as both
+		USB host and USB device.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unchunked_extended_messages_supported
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file shows the value of the Unchunked Extended Messages
+		Supported bit in vSafe5V Fixed Supply Object.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:fixed_supply/voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The voltage the supply supports in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:fixed_supply/maximum_current
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Maximum current of the fixed source supply in milliamperes.
+
+What:		/sys/class/usb_power_delivery/.../sink-capabilities/<position>:fixed_supply/operational_current
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Operational current of the sink in milliamperes.
+
+What:		/sys/class/usb_power_delivery/.../sink-capabilities/<position>:fixed_supply/fast_role_swap_current
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file contains the value of the "Fast Role Swap USB Type-C
+		Current" field that tells the current level the sink requires
+		after a Fast Role Swap.
+		0 - Fast Swap not supported"
+		1 - Default USB Power"
+		2 - 1.5A@5V"
+		3 - 3.0A@5V"
+
+Variable Supplies
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:variable_supply
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Variable Power Supply PDO.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:variable_supply/maximum_voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Maximum Voltage in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:variable_supply/minimum_voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Minimum Voltage in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:variable_supply/maximum_current
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The maximum current in milliamperes that the source can supply
+		at the given Voltage range.
+
+What:		/sys/class/usb_power_delivery/.../sink-capabilities/<position>:variable_supply/operational_current
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The operational current in milliamperes that the sink requires
+		at the given Voltage range.
+
+Battery Supplies
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:battery
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Battery PDO.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:battery/maximum_voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Maximum Voltage in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:battery/minimum_voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Minimum Voltage in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:battery/maximum_power
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Maximum allowable Power in milliwatts.
+
+What:		/sys/class/usb_power_delivery/.../sink-capabilities/<position>:battery/operational_power
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The operational power that the sink requires at the given
+		voltage range.
+
+Standard Power Range (SPR) Programmable Power Supplies
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:programmable_supply
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Programmable Power Supply (PPS) Augmented PDO (APDO).
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:programmable_supply/maximum_voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Maximum Voltage in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:programmable_supply/minimum_voltage
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Minimum Voltage in millivolts.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:programmable_supply/maximum_current
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		Maximum Current in milliamperes.
+
+What:		/sys/class/usb_power_delivery/.../source-capabilities/<position>:programmable_supply/pps_power_limited
+Date:		May 2022
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		The PPS Power Limited bit indicates whether or not the source
+		supply will exceed the rated output power if requested.
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 43626acc0aafb..2f174cd3e5df1 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o
+typec-y				:= class.o mux.o bus.o pd.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
new file mode 100644
index 0000000000000..dc72005d68db9
--- /dev/null
+++ b/drivers/usb/typec/pd.c
@@ -0,0 +1,708 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB Power Delivery sysfs entries
+ *
+ * Copyright (C) 2022, Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/slab.h>
+#include <linux/usb/pd.h>
+
+#include "pd.h"
+
+static DEFINE_IDA(pd_ida);
+
+static struct class pd_class = {
+	.name = "usb_power_delivery",
+	.owner = THIS_MODULE,
+};
+
+#define to_pdo(o) container_of(o, struct pdo, dev)
+
+struct pdo {
+	struct device dev;
+	int object_position;
+	u32 pdo;
+};
+
+static void pdo_release(struct device *dev)
+{
+	kfree(to_pdo(dev));
+}
+
+/* -------------------------------------------------------------------------- */
+/* Fixed Supply */
+
+static ssize_t
+dual_role_power_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_DUAL_ROLE));
+}
+static DEVICE_ATTR_RO(dual_role_power);
+
+static ssize_t
+usb_suspend_supported_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_SUSPEND));
+}
+static DEVICE_ATTR_RO(usb_suspend_supported);
+
+static ssize_t
+unconstrained_power_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_EXTPOWER));
+}
+static DEVICE_ATTR_RO(unconstrained_power);
+
+static ssize_t
+usb_communication_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_USB_COMM));
+}
+static DEVICE_ATTR_RO(usb_communication_capable);
+
+static ssize_t
+dual_role_data_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_DATA_SWAP));
+}
+static DEVICE_ATTR_RO(dual_role_data);
+
+static ssize_t
+unchunked_extended_messages_supported_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_UNCHUNK_EXT));
+}
+static DEVICE_ATTR_RO(unchunked_extended_messages_supported);
+
+/*
+ * REVISIT: Peak Current requires access also to the RDO.
+static ssize_t
+peak_current_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	...
+}
+*/
+
+static ssize_t
+fast_role_swap_current_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", to_pdo(dev)->pdo >> PDO_FIXED_FRS_CURR_SHIFT) & 3;
+}
+static DEVICE_ATTR_RO(fast_role_swap_current);
+
+static ssize_t voltage_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umV\n", pdo_fixed_voltage(to_pdo(dev)->pdo));
+}
+static DEVICE_ATTR_RO(voltage);
+
+/* Shared with Variable supplies, both source and sink */
+static ssize_t current_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umA\n", pdo_max_current(to_pdo(dev)->pdo));
+}
+
+/* Shared with Variable type supplies */
+static struct device_attribute maximum_current_attr = {
+	.attr = {
+		.name = "maximum_current",
+		.mode = 0444,
+	},
+	.show = current_show,
+};
+
+static struct device_attribute operational_current_attr = {
+	.attr = {
+		.name = "operational_current",
+		.mode = 0444,
+	},
+	.show = current_show,
+};
+
+static struct attribute *source_fixed_supply_attrs[] = {
+	&dev_attr_dual_role_power.attr,
+	&dev_attr_usb_suspend_supported.attr,
+	&dev_attr_unconstrained_power.attr,
+	&dev_attr_usb_communication_capable.attr,
+	&dev_attr_dual_role_data.attr,
+	&dev_attr_unchunked_extended_messages_supported.attr,
+	/*&dev_attr_peak_current.attr,*/
+	&dev_attr_voltage.attr,
+	&maximum_current_attr.attr,
+	NULL
+};
+
+static umode_t fixed_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	if (to_pdo(kobj_to_dev(kobj))->object_position &&
+	    /*attr != &dev_attr_peak_current.attr &&*/
+	    attr != &dev_attr_voltage.attr &&
+	    attr != &maximum_current_attr.attr &&
+	    attr != &operational_current_attr.attr)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group source_fixed_supply_group = {
+	.is_visible = fixed_attr_is_visible,
+	.attrs = source_fixed_supply_attrs,
+};
+__ATTRIBUTE_GROUPS(source_fixed_supply);
+
+static struct device_type source_fixed_supply_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = source_fixed_supply_groups,
+};
+
+static struct attribute *sink_fixed_supply_attrs[] = {
+	&dev_attr_dual_role_power.attr,
+	&dev_attr_usb_suspend_supported.attr,
+	&dev_attr_unconstrained_power.attr,
+	&dev_attr_usb_communication_capable.attr,
+	&dev_attr_dual_role_data.attr,
+	&dev_attr_unchunked_extended_messages_supported.attr,
+	&dev_attr_fast_role_swap_current.attr,
+	&dev_attr_voltage.attr,
+	&operational_current_attr.attr,
+	NULL
+};
+
+static const struct attribute_group sink_fixed_supply_group = {
+	.is_visible = fixed_attr_is_visible,
+	.attrs = sink_fixed_supply_attrs,
+};
+__ATTRIBUTE_GROUPS(sink_fixed_supply);
+
+static struct device_type sink_fixed_supply_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = sink_fixed_supply_groups,
+};
+
+/* -------------------------------------------------------------------------- */
+/* Variable Supply */
+
+static ssize_t
+maximum_voltage_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umV\n", pdo_max_voltage(to_pdo(dev)->pdo));
+}
+static DEVICE_ATTR_RO(maximum_voltage);
+
+static ssize_t
+minimum_voltage_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umV\n", pdo_min_voltage(to_pdo(dev)->pdo));
+}
+static DEVICE_ATTR_RO(minimum_voltage);
+
+static struct attribute *source_variable_supply_attrs[] = {
+	&dev_attr_maximum_voltage.attr,
+	&dev_attr_minimum_voltage.attr,
+	&maximum_current_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(source_variable_supply);
+
+static struct device_type source_variable_supply_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = source_variable_supply_groups,
+};
+
+static struct attribute *sink_variable_supply_attrs[] = {
+	&dev_attr_maximum_voltage.attr,
+	&dev_attr_minimum_voltage.attr,
+	&operational_current_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(sink_variable_supply);
+
+static struct device_type sink_variable_supply_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = sink_variable_supply_groups,
+};
+
+/* -------------------------------------------------------------------------- */
+/* Battery */
+
+static ssize_t
+maximum_power_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umW\n", pdo_max_power(to_pdo(dev)->pdo));
+}
+static DEVICE_ATTR_RO(maximum_power);
+
+static ssize_t
+operational_power_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umW\n", pdo_max_power(to_pdo(dev)->pdo));
+}
+static DEVICE_ATTR_RO(operational_power);
+
+static struct attribute *source_battery_attrs[] = {
+	&dev_attr_maximum_voltage.attr,
+	&dev_attr_minimum_voltage.attr,
+	&dev_attr_maximum_power.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(source_battery);
+
+static struct device_type source_battery_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = source_battery_groups,
+};
+
+static struct attribute *sink_battery_attrs[] = {
+	&dev_attr_maximum_voltage.attr,
+	&dev_attr_minimum_voltage.attr,
+	&dev_attr_operational_power.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(sink_battery);
+
+static struct device_type sink_battery_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = sink_battery_groups,
+};
+
+/* -------------------------------------------------------------------------- */
+/* Standard Power Range (SPR) Programmable Power Supply (PPS) */
+
+static ssize_t
+pps_power_limited_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & BIT(27)));
+}
+static DEVICE_ATTR_RO(pps_power_limited);
+
+static ssize_t
+pps_max_voltage_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umV\n", pdo_pps_apdo_max_voltage(to_pdo(dev)->pdo));
+}
+
+static ssize_t
+pps_min_voltage_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umV\n", pdo_pps_apdo_min_voltage(to_pdo(dev)->pdo));
+}
+
+static ssize_t
+pps_max_current_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umA\n", pdo_pps_apdo_max_current(to_pdo(dev)->pdo));
+}
+
+static struct device_attribute pps_max_voltage_attr = {
+	.attr = {
+		.name = "maximum_voltage",
+		.mode = 0444,
+	},
+	.show = pps_max_voltage_show,
+};
+
+static struct device_attribute pps_min_voltage_attr = {
+	.attr = {
+		.name = "minimum_voltage",
+		.mode = 0444,
+	},
+	.show = pps_min_voltage_show,
+};
+
+static struct device_attribute pps_max_current_attr = {
+	.attr = {
+		.name = "maximum_current",
+		.mode = 0444,
+	},
+	.show = pps_max_current_show,
+};
+
+static struct attribute *source_pps_attrs[] = {
+	&dev_attr_pps_power_limited.attr,
+	&pps_max_voltage_attr.attr,
+	&pps_min_voltage_attr.attr,
+	&pps_max_current_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(source_pps);
+
+static struct device_type source_pps_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = source_pps_groups,
+};
+
+static struct attribute *sink_pps_attrs[] = {
+	&pps_max_voltage_attr.attr,
+	&pps_min_voltage_attr.attr,
+	&pps_max_current_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(sink_pps);
+
+static struct device_type sink_pps_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = sink_pps_groups,
+};
+
+/* -------------------------------------------------------------------------- */
+
+static const char * const supply_name[] = {
+	[PDO_TYPE_FIXED] = "fixed_supply",
+	[PDO_TYPE_BATT]  = "battery",
+	[PDO_TYPE_VAR]	 = "variable_supply",
+};
+
+static const char * const apdo_supply_name[] = {
+	[APDO_TYPE_PPS]  = "programmable_supply",
+};
+
+static struct device_type *source_type[] = {
+	[PDO_TYPE_FIXED] = &source_fixed_supply_type,
+	[PDO_TYPE_BATT]  = &source_battery_type,
+	[PDO_TYPE_VAR]   = &source_variable_supply_type,
+};
+
+static struct device_type *source_apdo_type[] = {
+	[APDO_TYPE_PPS]  = &source_pps_type,
+};
+
+static struct device_type *sink_type[] = {
+	[PDO_TYPE_FIXED] = &sink_fixed_supply_type,
+	[PDO_TYPE_BATT]  = &sink_battery_type,
+	[PDO_TYPE_VAR]   = &sink_variable_supply_type,
+};
+
+static struct device_type *sink_apdo_type[] = {
+	[APDO_TYPE_PPS]  = &sink_pps_type,
+};
+
+/* REVISIT: Export when EPR_*_Capabilities need to be supported. */
+static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int position)
+{
+	struct device_type *type;
+	const char *name;
+	struct pdo *p;
+	int ret;
+
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->pdo = pdo;
+	p->object_position = position;
+
+	if (pdo_type(pdo) == PDO_TYPE_APDO) {
+		/* FIXME: Only PPS supported for now! Skipping others. */
+		if (pdo_apdo_type(pdo) > APDO_TYPE_PPS) {
+			dev_warn(&cap->dev, "Unknown APDO type. PDO 0x%08x\n", pdo);
+			kfree(p);
+			return 0;
+		}
+
+		if (is_source(cap->role))
+			type = source_apdo_type[pdo_apdo_type(pdo)];
+		else
+			type = sink_apdo_type[pdo_apdo_type(pdo)];
+
+		name = apdo_supply_name[pdo_apdo_type(pdo)];
+	} else {
+		if (is_source(cap->role))
+			type = source_type[pdo_type(pdo)];
+		else
+			type = sink_type[pdo_type(pdo)];
+
+		name = supply_name[pdo_type(pdo)];
+	}
+
+	p->dev.parent = &cap->dev;
+	p->dev.type = type;
+	dev_set_name(&p->dev, "%u:%s", position + 1, name);
+
+	ret = device_register(&p->dev);
+	if (ret) {
+		put_device(&p->dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int remove_pdo(struct device *dev, void *data)
+{
+	device_unregister(dev);
+	return 0;
+}
+
+/* -------------------------------------------------------------------------- */
+
+static const char * const cap_name[] = {
+	[TYPEC_SINK]    = "sink-capabilities",
+	[TYPEC_SOURCE]  = "source-capabilities",
+};
+
+static void pd_capabilities_release(struct device *dev)
+{
+	kfree(to_usb_power_delivery_capabilities(dev));
+}
+
+static struct device_type pd_capabilities_type = {
+	.name = "capabilities",
+	.release = pd_capabilities_release,
+};
+
+/**
+ * usb_power_delivery_register_capabilities - Register a set of capabilities.
+ * @pd: The USB PD instance that the capabilities belong to.
+ * @desc: Description of the Capablities Message.
+ *
+ * This function registers a Capabilities Message described in @desc. The
+ * capabilities will have their own sub-directory under @pd in sysfs.
+ *
+ * The function returns pointer to struct usb_power_delivery_capabilities, or
+ * ERR_PRT(errno).
+ */
+struct usb_power_delivery_capabilities *
+usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
+					 struct usb_power_delivery_capabilities_desc *desc)
+{
+	struct usb_power_delivery_capabilities *cap;
+	int ret;
+	int i;
+
+	cap = kzalloc(sizeof(*cap), GFP_KERNEL);
+	if (!cap)
+		return ERR_PTR(-ENOMEM);
+
+	cap->pd = pd;
+	cap->role = desc->role;
+
+	cap->dev.parent = &pd->dev;
+	cap->dev.type = &pd_capabilities_type;
+	dev_set_name(&cap->dev, "%s", cap_name[cap->role]);
+
+	ret = device_register(&cap->dev);
+	if (ret) {
+		put_device(&cap->dev);
+		return ERR_PTR(ret);
+	}
+
+	for (i = 0; i < PDO_MAX_OBJECTS && desc->pdo[i]; i++) {
+		ret = add_pdo(cap, desc->pdo[i], i);
+		if (ret) {
+			usb_power_delivery_unregister_capabilities(cap);
+			return ERR_PTR(ret);
+		}
+	}
+
+	return cap;
+}
+EXPORT_SYMBOL_GPL(usb_power_delivery_register_capabilities);
+
+/**
+ * usb_power_delivery_unregister_capabilities - Unregister a set of capabilities
+ * @cap: The capabilities
+ */
+void usb_power_delivery_unregister_capabilities(struct usb_power_delivery_capabilities *cap)
+{
+	if (!cap)
+		return;
+
+	device_for_each_child(&cap->dev, NULL, remove_pdo);
+	device_unregister(&cap->dev);
+}
+EXPORT_SYMBOL_GPL(usb_power_delivery_unregister_capabilities);
+
+/* -------------------------------------------------------------------------- */
+
+static ssize_t revision_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct usb_power_delivery *pd = to_usb_power_delivery(dev);
+
+	return sysfs_emit(buf, "%u.%u\n", (pd->revision >> 8) & 0xff, (pd->revision >> 4) & 0xf);
+}
+static DEVICE_ATTR_RO(revision);
+
+static ssize_t version_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct usb_power_delivery *pd = to_usb_power_delivery(dev);
+
+	return sysfs_emit(buf, "%u.%u\n", (pd->version >> 8) & 0xff, (pd->version >> 4) & 0xf);
+}
+static DEVICE_ATTR_RO(version);
+
+static struct attribute *pd_attrs[] = {
+	&dev_attr_revision.attr,
+	&dev_attr_version.attr,
+	NULL
+};
+
+static umode_t pd_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct usb_power_delivery *pd = to_usb_power_delivery(kobj_to_dev(kobj));
+
+	if (attr == &dev_attr_version.attr && !pd->version)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group pd_group = {
+	.is_visible = pd_attr_is_visible,
+	.attrs = pd_attrs,
+};
+__ATTRIBUTE_GROUPS(pd);
+
+static void pd_release(struct device *dev)
+{
+	struct usb_power_delivery *pd = to_usb_power_delivery(dev);
+
+	ida_simple_remove(&pd_ida, pd->id);
+	kfree(pd);
+}
+
+static struct device_type pd_type = {
+	.name = "usb_power_delivery",
+	.release = pd_release,
+	.groups = pd_groups,
+};
+
+struct usb_power_delivery *usb_power_delivery_find(const char *name)
+{
+	struct device *dev;
+
+	dev = class_find_device_by_name(&pd_class, name);
+
+	return dev ? to_usb_power_delivery(dev) : NULL;
+}
+
+/**
+ * usb_power_delivery_register - Register USB Power Delivery Support.
+ * @parent: Parent device.
+ * @desc: Description of the USB PD contract.
+ *
+ * This routine can be used to register USB Power Delivery capabilities that a
+ * device or devices can support. These capabilities represent all the
+ * capabilities that can be negotiated with a partner, so not only the Power
+ * Capabilities that are negotiated using the USB PD Capabilities Message.
+ *
+ * The USB Power Delivery Support object that this routine generates can be used
+ * as the parent object for all the actual USB Power Delivery Messages and
+ * objects that can be negotiated with the partner.
+ *
+ * Returns handle to struct usb_power_delivery or ERR_PTR.
+ */
+struct usb_power_delivery *
+usb_power_delivery_register(struct device *parent, struct usb_power_delivery_desc *desc)
+{
+	struct usb_power_delivery *pd;
+	int ret;
+
+	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return ERR_PTR(-ENOMEM);
+
+	ret = ida_simple_get(&pd_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0) {
+		kfree(pd);
+		return ERR_PTR(ret);
+	}
+
+	pd->id = ret;
+	pd->revision = desc->revision;
+	pd->version = desc->version;
+
+	pd->dev.parent = parent;
+	pd->dev.type = &pd_type;
+	pd->dev.class = &pd_class;
+	dev_set_name(&pd->dev, "pd%d", pd->id);
+
+	ret = device_register(&pd->dev);
+	if (ret) {
+		put_device(&pd->dev);
+		return ERR_PTR(ret);
+	}
+
+	return pd;
+}
+EXPORT_SYMBOL_GPL(usb_power_delivery_register);
+
+/**
+ * usb_power_delivery_unregister - Unregister USB Power Delivery Support.
+ * @pd: The USB PD contract.
+ */
+void usb_power_delivery_unregister(struct usb_power_delivery *pd)
+{
+	if (IS_ERR_OR_NULL(pd))
+		return;
+
+	device_unregister(&pd->dev);
+}
+EXPORT_SYMBOL_GPL(usb_power_delivery_unregister);
+
+/**
+ * usb_power_delivery_link_device - Link device to its USB PD object.
+ * @pd: The USB PD instance.
+ * @dev: The device.
+ *
+ * This function can be used to create a symlink named "usb_power_delivery" for
+ * @dev that points to @pd.
+ */
+int usb_power_delivery_link_device(struct usb_power_delivery *pd, struct device *dev)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(pd) || !dev)
+		return 0;
+
+	ret = sysfs_create_link(&dev->kobj, &pd->dev.kobj, "usb_power_delivery");
+	if (ret)
+		return ret;
+
+	get_device(&pd->dev);
+	get_device(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_power_delivery_link_device);
+
+/**
+ * usb_power_delivery_unlink_device - Unlink device from its USB PD object.
+ * @pd: The USB PD instance.
+ * @dev: The device.
+ *
+ * Remove the symlink that was previously created with pd_link_device().
+ */
+void usb_power_delivery_unlink_device(struct usb_power_delivery *pd, struct device *dev)
+{
+	if (IS_ERR_OR_NULL(pd) || !dev)
+		return;
+
+	sysfs_remove_link(&dev->kobj, "usb_power_delivery");
+	put_device(&pd->dev);
+	put_device(dev);
+}
+EXPORT_SYMBOL_GPL(usb_power_delivery_unlink_device);
+
+/* -------------------------------------------------------------------------- */
+
+int __init usb_power_delivery_init(void)
+{
+	return class_register(&pd_class);
+}
+
+void __exit usb_power_delivery_exit(void)
+{
+	ida_destroy(&pd_ida);
+	class_unregister(&pd_class);
+}
diff --git a/drivers/usb/typec/pd.h b/drivers/usb/typec/pd.h
new file mode 100644
index 0000000000000..049a1aad440a3
--- /dev/null
+++ b/drivers/usb/typec/pd.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_POWER_DELIVERY__
+#define __USB_POWER_DELIVERY__
+
+#include <linux/device.h>
+#include <linux/usb/typec.h>
+
+struct usb_power_delivery {
+	struct device dev;
+	int id;
+	u16 revision;
+	u16 version;
+};
+
+struct usb_power_delivery_capabilities {
+	struct device dev;
+	struct usb_power_delivery *pd;
+	enum typec_role role;
+};
+
+#define to_usb_power_delivery_capabilities(o) container_of(o, struct usb_power_delivery_capabilities, dev)
+#define to_usb_power_delivery(o) container_of(o, struct usb_power_delivery, dev)
+
+struct usb_power_delivery *usb_power_delivery_find(const char *name);
+
+int usb_power_delivery_init(void);
+void usb_power_delivery_exit(void);
+
+#endif /* __USB_POWER_DELIVERY__ */
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index 96b7ff66f074b..c59fb79a42e86 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -495,4 +495,42 @@ static inline unsigned int rdo_max_power(u32 rdo)
 
 #define PD_P_SNK_STDBY_MW	2500	/* 2500 mW */
 
+#if IS_ENABLED(CONFIG_TYPEC)
+
+struct usb_power_delivery;
+
+/**
+ * usb_power_delivery_desc - USB Power Delivery Descriptor
+ * @revision: USB Power Delivery Specification Revision
+ * @version: USB Power Delivery Specicication Version - optional
+ */
+struct usb_power_delivery_desc {
+	u16 revision;
+	u16 version;
+};
+
+/**
+ * usb_power_delivery_capabilities_desc - Description of USB Power Delivery Capabilities Message
+ * @pdo: The Power Data Objects in the Capability Message
+ * @role: Power role of the capabilities
+ */
+struct usb_power_delivery_capabilities_desc {
+	u32 pdo[PDO_MAX_OBJECTS];
+	enum typec_role role;
+};
+
+struct usb_power_delivery_capabilities *
+usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
+					 struct usb_power_delivery_capabilities_desc *desc);
+void usb_power_delivery_unregister_capabilities(struct usb_power_delivery_capabilities *cap);
+
+struct usb_power_delivery *usb_power_delivery_register(struct device *parent,
+						       struct usb_power_delivery_desc *desc);
+void usb_power_delivery_unregister(struct usb_power_delivery *pd);
+
+int usb_power_delivery_link_device(struct usb_power_delivery *pd, struct device *dev);
+void usb_power_delivery_unlink_device(struct usb_power_delivery *pd, struct device *dev);
+
+#endif /* CONFIG_TYPEC */
+
 #endif /* __LINUX_USB_PD_H */
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index fdf737d48b3bf..45e28d14ae56e 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -52,6 +52,16 @@ enum typec_role {
 	TYPEC_SOURCE,
 };
 
+static inline int is_sink(enum typec_role role)
+{
+	return role == TYPEC_SINK;
+}
+
+static inline int is_source(enum typec_role role)
+{
+	return role == TYPEC_SOURCE;
+}
+
 enum typec_pwr_opmode {
 	TYPEC_PWR_MODE_USB,
 	TYPEC_PWR_MODE_1_5A,
-- 
2.35.1

