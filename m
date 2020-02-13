Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D0215BF3E
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 14:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbgBMNYv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 08:24:51 -0500
Received: from mga06.intel.com ([134.134.136.31]:44559 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730092AbgBMNYu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 08:24:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 05:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="scan'208";a="347728515"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2020 05:24:47 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 9/9] usb: typec: driver for Intel PMC mux control
Date:   Thu, 13 Feb 2020 16:24:28 +0300
Message-Id: <20200213132428.53374-10-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213132428.53374-1-heikki.krogerus@linux.intel.com>
References: <20200213132428.53374-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Intel PMC microcontroller on the latest Intel platforms
has a new function that allows configuration of the USB
Multiplexer/DeMultiplexer switches that are under the
control of the PMC.

The Intel PMC mux control (aka. mux-agent) can be used for
swapping the USB data role and for entering alternate modes,
DisplayPort or Thunderbolt3.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/Kconfig         |   9 +
 drivers/usb/typec/mux/Makefile        |   1 +
 drivers/usb/typec/mux/intel_pmc_mux.c | 434 ++++++++++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 drivers/usb/typec/mux/intel_pmc_mux.c

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 01ed0d5e10e8..77eb97b2aa86 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -9,4 +9,13 @@ config TYPEC_MUX_PI3USB30532
 	  Say Y or M if your system has a Pericom PI3USB30532 Type-C cross
 	  switch / mux chip found on some devices with a Type-C port.
 
+config TYPEC_MUX_INTEL_PMC
+	tristate "Intel PMC mux control"
+	depends on INTEL_PMC_IPC
+	select USB_ROLE_SWITCH
+	help
+	  Driver for USB muxes controlled by Intel PMC FW. Intel PMC FW can
+	  control the USB role switch and also the multiplexer/demultiplexer
+	  switches used with USB Type-C Alternate Modes.
+
 endmenu
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index 1332e469b8a0..280a6f553115 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
+obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
new file mode 100644
index 000000000000..f5c5e0aef66f
--- /dev/null
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Intel PMC USB mux control
+ *
+ * Copyright (C) 2020 Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/usb/role.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
+
+#include <asm/intel_pmc_ipc.h>
+
+#define PMC_USBC_CMD		0xa7
+
+/* "Usage" OOB Message field values */
+enum {
+	PMC_USB_CONNECT,
+	PMC_USB_DISCONNECT,
+	PMC_USB_SAFE_MODE,
+	PMC_USB_ALT_MODE,
+	PMC_USB_DP_HPD,
+};
+
+#define PMC_USB_MSG_USB2_PORT_SHIFT	0
+#define PMC_USB_MSG_USB3_PORT_SHIFT	4
+#define PMC_USB_MSG_UFP_SHIFT		4
+#define PMC_USB_MSG_ORI_HSL_SHIFT	5
+#define PMC_USB_MSG_ORI_AUX_SHIFT	6
+
+/* Alt Mode Request */
+struct altmode_req {
+	u8 usage;
+	u8 mode_type;
+	u8 mode_id;
+	u8 reserved;
+	u32 mode_data;
+} __packed;
+
+#define PMC_USB_MODE_TYPE_SHIFT		4
+
+enum {
+	PMC_USB_MODE_TYPE_USB,
+	PMC_USB_MODE_TYPE_DP,
+	PMC_USB_MODE_TYPE_TBT,
+};
+
+/* Common Mode Data bits */
+#define PMC_USB_ALTMODE_ACTIVE_CABLE	BIT(2)
+
+#define PMC_USB_ALTMODE_ORI_SHIFT	1
+#define PMC_USB_ALTMODE_UFP_SHIFT	3
+#define PMC_USB_ALTMODE_ORI_AUX_SHIFT	4
+#define PMC_USB_ALTMODE_ORI_HSL_SHIFT	5
+
+/* DP specific Mode Data bits */
+#define PMC_USB_ALTMODE_DP_MODE_SHIFT	8
+
+/* TBT specific Mode Data bits */
+#define PMC_USB_ALTMODE_TBT_TYPE	BIT(17)
+#define PMC_USB_ALTMODE_CABLE_TYPE	BIT(18)
+#define PMC_USB_ALTMODE_ACTIVE_LINK	BIT(20)
+#define PMC_USB_ALTMODE_FORCE_LSR	BIT(23)
+#define PMC_USB_ALTMODE_CABLE_SPD(_s_)	(((_s_) & GENMASK(2, 0)) << 25)
+#define   PMC_USB_ALTMODE_CABLE_USB31	1
+#define   PMC_USB_ALTMODE_CABLE_10GPS	2
+#define   PMC_USB_ALTMODE_CABLE_20GPS	3
+#define PMC_USB_ALTMODE_TBT_GEN(_g_)	(((_g_) & GENMASK(1, 0)) << 28)
+
+/* Display HPD Request bits */
+#define PMC_USB_DP_HPD_IRQ		BIT(5)
+#define PMC_USB_DP_HPD_LVL		BIT(6)
+
+struct pmc_usb;
+
+struct pmc_usb_port {
+	int num;
+	struct pmc_usb *pmc;
+	struct typec_mux *typec_mux;
+	struct typec_switch *typec_sw;
+	struct usb_role_switch *usb_sw;
+
+	enum typec_orientation orientation;
+	enum usb_role role;
+
+	u8 usb2_port;
+	u8 usb3_port;
+};
+
+struct pmc_usb {
+	u8 num_ports;
+	struct device *dev;
+	struct pmc_usb_port *port;
+};
+
+static int pmc_usb_command(struct pmc_usb_port *port, u8 *msg, u32 len)
+{
+	u8 response[4];
+
+	/*
+	 * Error bit will always be 0 with the USBC command.
+	 * Status can be checked from the response message.
+	 */
+	intel_pmc_ipc_command(PMC_USBC_CMD, 0, msg, len,
+			      (void *)response, 1);
+
+	if (response[2]) {
+		if (response[2] & BIT(1))
+			return -EIO;
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int
+pmc_usb_mux_dp_hpd(struct pmc_usb_port *port, struct typec_mux_state *state)
+{
+	struct typec_displayport_data *data = state->data;
+	u8 msg[2] = { };
+
+	msg[0] = PMC_USB_DP_HPD;
+	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+
+	msg[1] = PMC_USB_DP_HPD_IRQ;
+
+	if (data->status & DP_STATUS_HPD_STATE)
+		msg[1] |= PMC_USB_DP_HPD_LVL;
+
+	return pmc_usb_command(port, msg, sizeof(msg));
+}
+
+static int
+pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
+{
+	struct typec_displayport_data *data = state->data;
+	struct altmode_req req = { };
+
+	if (data->status & DP_STATUS_IRQ_HPD)
+		return pmc_usb_mux_dp_hpd(port, state);
+
+	req.usage = PMC_USB_ALT_MODE;
+	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+	req.mode_type = PMC_USB_MODE_TYPE_DP << PMC_USB_MODE_TYPE_SHIFT;
+
+	req.mode_data = (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
+	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
+	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_AUX_SHIFT;
+	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_HSL_SHIFT;
+
+	req.mode_data |= (state->mode - TYPEC_STATE_MODAL) <<
+			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
+
+	return pmc_usb_command(port, (void *)&req, sizeof(req));
+}
+
+static int
+pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
+{
+	struct typec_thunderbolt_data *data = state->data;
+	u8 cable_speed = TBT_CABLE_SPEED(data->cable_mode);
+	struct altmode_req req = { };
+
+	req.usage = PMC_USB_ALT_MODE;
+	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+	req.mode_type = PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIFT;
+
+	req.mode_data = (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
+	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
+	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_AUX_SHIFT;
+	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_HSL_SHIFT;
+
+	if (TBT_ADAPTER(data->device_mode) == TBT_ADAPTER_TBT3)
+		req.mode_data |= PMC_USB_ALTMODE_TBT_TYPE;
+
+	if (data->cable_mode & TBT_CABLE_OPTICAL)
+		req.mode_data |= PMC_USB_ALTMODE_CABLE_TYPE;
+
+	if (data->cable_mode & TBT_CABLE_LINK_TRAINING)
+		req.mode_data |= PMC_USB_ALTMODE_ACTIVE_LINK;
+
+	if (data->enter_vdo & TBT_ENTER_MODE_ACTIVE_CABLE)
+		req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE;
+
+	req.mode_data |= PMC_USB_ALTMODE_CABLE_SPD(cable_speed);
+
+	return pmc_usb_command(port, (void *)&req, sizeof(req));
+}
+
+static int pmc_usb_mux_safe_state(struct pmc_usb_port *port)
+{
+	u8 msg;
+
+	msg = PMC_USB_SAFE_MODE;
+	msg |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+
+	return pmc_usb_command(port, &msg, sizeof(msg));
+}
+
+static int pmc_usb_connect(struct pmc_usb_port *port)
+{
+	u8 msg[2];
+
+	msg[0] = PMC_USB_CONNECT;
+	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+
+	msg[1] = port->usb2_port << PMC_USB_MSG_USB2_PORT_SHIFT;
+	msg[1] |= (port->orientation - 1) << PMC_USB_MSG_ORI_HSL_SHIFT;
+	msg[1] |= (port->orientation - 1) << PMC_USB_MSG_ORI_AUX_SHIFT;
+
+	return pmc_usb_command(port, msg, sizeof(msg));
+}
+
+static int pmc_usb_disconnect(struct pmc_usb_port *port)
+{
+	u8 msg[2];
+
+	msg[0] = PMC_USB_DISCONNECT;
+	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+
+	msg[1] = port->usb2_port << PMC_USB_MSG_USB2_PORT_SHIFT;
+
+	return pmc_usb_command(port, msg, sizeof(msg));
+}
+
+static int
+pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
+{
+	struct pmc_usb_port *port = typec_mux_get_drvdata(mux);
+
+	if (!state->alt)
+		return 0;
+
+	if (state->mode == TYPEC_STATE_SAFE)
+		return pmc_usb_mux_safe_state(port);
+
+	switch (state->alt->svid) {
+	case USB_TYPEC_TBT_SID:
+		return pmc_usb_mux_tbt(port, state);
+	case USB_TYPEC_DP_SID:
+		return pmc_usb_mux_dp(port, state);
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int pmc_usb_set_orientation(struct typec_switch *sw,
+				   enum typec_orientation orientation)
+{
+	struct pmc_usb_port *port = typec_switch_get_drvdata(sw);
+
+	if (port->orientation == orientation)
+		return 0;
+
+	port->orientation = orientation;
+
+	if (port->role) {
+		if (orientation == TYPEC_ORIENTATION_NONE)
+			return pmc_usb_disconnect(port);
+		else
+			return pmc_usb_connect(port);
+	}
+
+	return 0;
+}
+
+static int pmc_usb_set_role(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct pmc_usb_port *port = usb_role_switch_get_drvdata(sw);
+
+	if (port->role == role)
+		return 0;
+
+	port->role = role;
+
+	if (port->orientation) {
+		if (role == USB_ROLE_NONE)
+			return pmc_usb_disconnect(port);
+		else
+			return pmc_usb_connect(port);
+	}
+
+	return 0;
+}
+
+static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
+				 struct fwnode_handle *fwnode)
+{
+	struct pmc_usb_port *port = &pmc->port[index];
+	struct usb_role_switch_desc desc = { };
+	struct typec_switch_desc sw_desc = { };
+	struct typec_mux_desc mux_desc = { };
+	int ret;
+
+	ret = fwnode_property_read_u8(fwnode, "usb2-port", &port->usb2_port);
+	if (ret)
+		return ret;
+
+	ret = fwnode_property_read_u8(fwnode, "usb3-port", &port->usb3_port);
+	if (ret)
+		return ret;
+
+	port->num = index;
+	port->pmc = pmc;
+
+	sw_desc.fwnode = fwnode;
+	sw_desc.drvdata = port;
+	sw_desc.name = fwnode_get_name(fwnode);
+	sw_desc.set = pmc_usb_set_orientation;
+
+	port->typec_sw = typec_switch_register(pmc->dev, &sw_desc);
+	if (IS_ERR(port->typec_sw))
+		return PTR_ERR(port->typec_sw);
+
+	mux_desc.fwnode = fwnode;
+	mux_desc.drvdata = port;
+	mux_desc.name = fwnode_get_name(fwnode);
+	mux_desc.set = pmc_usb_mux_set;
+
+	port->typec_mux = typec_mux_register(pmc->dev, &mux_desc);
+	if (IS_ERR(port->typec_mux)) {
+		ret = PTR_ERR(port->typec_mux);
+		goto err_unregister_switch;
+	}
+
+	desc.fwnode = fwnode;
+	desc.driver_data = port;
+	desc.name = fwnode_get_name(fwnode);
+	desc.set = pmc_usb_set_role;
+
+	port->usb_sw = usb_role_switch_register(pmc->dev, &desc);
+	if (IS_ERR(port->usb_sw)) {
+		ret = PTR_ERR(port->usb_sw);
+		goto err_unregister_mux;
+	}
+
+	return 0;
+
+err_unregister_mux:
+	typec_mux_unregister(port->typec_mux);
+
+err_unregister_switch:
+	typec_switch_unregister(port->typec_sw);
+
+	return ret;
+}
+
+static int pmc_usb_probe(struct platform_device *pdev)
+{
+	struct fwnode_handle *fwnode = NULL;
+	struct pmc_usb *pmc;
+	int i = 0;
+	int ret;
+
+	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
+	if (!pmc)
+		return -ENOMEM;
+
+	device_for_each_child_node(&pdev->dev, fwnode)
+		pmc->num_ports++;
+
+	pmc->port = devm_kcalloc(&pdev->dev, pmc->num_ports,
+				 sizeof(struct pmc_usb_port), GFP_KERNEL);
+	if (!pmc->port)
+		return -ENOMEM;
+
+	pmc->dev = &pdev->dev;
+
+	/*
+	 * For every physical USB connector (USB2 and USB3 combo) there is a
+	 * child ACPI device node under the PMC mux ACPI device object.
+	 */
+	for (i = 0; i < pmc->num_ports; i++) {
+		fwnode = device_get_next_child_node(pmc->dev, fwnode);
+		if (!fwnode)
+			break;
+
+		ret = pmc_usb_register_port(pmc, i, fwnode);
+		if (ret)
+			goto err_remove_ports;
+	}
+
+	platform_set_drvdata(pdev, pmc);
+
+	return 0;
+
+err_remove_ports:
+	for (i = 0; i < pmc->num_ports; i++) {
+		typec_switch_unregister(pmc->port[i].typec_sw);
+		typec_mux_unregister(pmc->port[i].typec_mux);
+	}
+
+	return ret;
+}
+
+static int pmc_usb_remove(struct platform_device *pdev)
+{
+	struct pmc_usb *pmc = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < pmc->num_ports; i++) {
+		typec_switch_unregister(pmc->port[i].typec_sw);
+		typec_mux_unregister(pmc->port[i].typec_mux);
+	}
+
+	return 0;
+}
+
+static const struct acpi_device_id pmc_usb_acpi_ids[] = {
+	{ "INTC105C", },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, pmc_usb_acpi_ids);
+
+static struct platform_driver pmc_usb_driver = {
+	.driver = {
+		.name = "intel_pmc_usb",
+		.acpi_match_table = ACPI_PTR(pmc_usb_acpi_ids),
+	},
+	.probe = pmc_usb_probe,
+	.remove = pmc_usb_remove,
+};
+
+module_platform_driver(pmc_usb_driver);
+
+MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel PMC USB mux control");
-- 
2.25.0

