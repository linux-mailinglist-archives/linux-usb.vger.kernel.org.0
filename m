Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2364125FC07
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgIGO1b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 10:27:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:19484 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729837AbgIGOYc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:24:32 -0400
IronPort-SDR: 9Mf1Caw2p8X8O/0MnwYXxb0+sDKzybQ8ptaFKV5HVa6Kkl5xkJLm3eAc/1Ouj2ebCn6Jx9hJJX
 T0bTuijMS5DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="138058727"
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="138058727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 07:24:32 -0700
IronPort-SDR: 5HXpggEj6qUJA0pp7AEQ8kLoim1hdSiu0w4zRruUxcUSJGzjolmnd4pMmwrUJRrBJArmEOW0VF
 Itm+Gc5M7q9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="406851361"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2020 07:24:30 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 1/2] usb: typec: intel_pmc_mux: Check the port status before connect
Date:   Mon,  7 Sep 2020 17:24:27 +0300
Message-Id: <20200907142428.35838-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
References: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The PMC microcontroller that we use for configuration, does
not supply any status information back. For port status we
need to talk to another controller on the board called IOM
(I/O manager).

By checking the port status before configuring the muxes, we
can make sure that we do not reconfigure the port after
bootup when the system firmware (for example BIOS) has
already configured it.

Using the status information also to check if DisplayPort
HPD is still asserted when the cable plug is disconnected,
and clearing it if it is.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Rajmohan Mani <rajmohan.mani@intel.com>
Reviewed-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
Tested-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 152 ++++++++++++++++++++++++--
 1 file changed, 141 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 3bc08847fb7f0..4ee14423a2e3d 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -80,10 +80,48 @@ enum {
 #define PMC_USB_DP_HPD_LVL		BIT(4)
 #define PMC_USB_DP_HPD_IRQ		BIT(5)
 
+/*
+ * Input Output Manager (IOM) PORT STATUS
+ */
+#define IOM_PORT_STATUS_OFFSET				0x560
+
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_MASK		GENMASK(9, 6)
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_SHIFT		6
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_USB		0x03
+/* activity type: Safe Mode */
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_SAFE_MODE		0x04
+/* activity type: Display Port */
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_DP		0x05
+/* activity type: Display Port Multi Function Device */
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_DP_MFD		0x06
+/* activity type: Thunderbolt */
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_TBT		0x07
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_ALT_MODE_USB	0x0c
+#define IOM_PORT_STATUS_ACTIVITY_TYPE_ALT_MODE_TBT_USB	0x0d
+/* Upstream Facing Port Information */
+#define IOM_PORT_STATUS_UFP				BIT(10)
+/* Display Port Hot Plug Detect status */
+#define IOM_PORT_STATUS_DHPD_HPD_STATUS_MASK		GENMASK(13, 12)
+#define IOM_PORT_STATUS_DHPD_HPD_STATUS_SHIFT		12
+#define IOM_PORT_STATUS_DHPD_HPD_STATUS_ASSERT		0x01
+#define IOM_PORT_STATUS_DHPD_HPD_SOURCE_TBT		BIT(14)
+#define IOM_PORT_STATUS_CONNECTED			BIT(31)
+
+#define IOM_PORT_ACTIVITY_IS(_status_, _type_)				\
+	((((_status_) & IOM_PORT_STATUS_ACTIVITY_TYPE_MASK) >>		\
+	  IOM_PORT_STATUS_ACTIVITY_TYPE_SHIFT) ==			\
+	 (IOM_PORT_STATUS_ACTIVITY_TYPE_##_type_))
+
+#define IOM_PORT_HPD_ASSERTED(_status_)					\
+	((((_status_) & IOM_PORT_STATUS_DHPD_HPD_STATUS_MASK) >>	\
+	  IOM_PORT_STATUS_DHPD_HPD_STATUS_SHIFT) &			\
+	 IOM_PORT_STATUS_DHPD_HPD_STATUS_ASSERT)
+
 struct pmc_usb;
 
 struct pmc_usb_port {
 	int num;
+	u32 iom_status;
 	struct pmc_usb *pmc;
 	struct typec_mux *typec_mux;
 	struct typec_switch *typec_sw;
@@ -104,8 +142,16 @@ struct pmc_usb {
 	struct device *dev;
 	struct intel_scu_ipc_dev *ipc;
 	struct pmc_usb_port *port;
+	struct acpi_device *iom_adev;
+	void __iomem *iom_base;
 };
 
+static void update_port_status(struct pmc_usb_port *port)
+{
+	port->iom_status = readl(port->pmc->iom_base + IOM_PORT_STATUS_OFFSET +
+				 port->usb3_port * sizeof(u32));
+}
+
 static int sbu_orientation(struct pmc_usb_port *port)
 {
 	if (port->sbu_orientation)
@@ -142,18 +188,17 @@ static int pmc_usb_command(struct pmc_usb_port *port, u8 *msg, u32 len)
 }
 
 static int
-pmc_usb_mux_dp_hpd(struct pmc_usb_port *port, struct typec_mux_state *state)
+pmc_usb_mux_dp_hpd(struct pmc_usb_port *port, struct typec_displayport_data *dp)
 {
-	struct typec_displayport_data *data = state->data;
 	u8 msg[2] = { };
 
 	msg[0] = PMC_USB_DP_HPD;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
-	if (data->status & DP_STATUS_IRQ_HPD)
+	if (dp->status & DP_STATUS_IRQ_HPD)
 		msg[1] = PMC_USB_DP_HPD_IRQ;
 
-	if (data->status & DP_STATUS_HPD_STATE)
+	if (dp->status & DP_STATUS_HPD_STATE)
 		msg[1] |= PMC_USB_DP_HPD_LVL;
 
 	return pmc_usb_command(port, msg, sizeof(msg));
@@ -166,8 +211,18 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 	struct altmode_req req = { };
 	int ret;
 
+	if (IOM_PORT_ACTIVITY_IS(port->iom_status, DP) ||
+	    IOM_PORT_ACTIVITY_IS(port->iom_status, DP_MFD)) {
+		if (IOM_PORT_HPD_ASSERTED(port->iom_status) &&
+		    (!(data->status & DP_STATUS_IRQ_HPD) &&
+		     data->status & DP_STATUS_HPD_STATE))
+			return 0;
+
+		return pmc_usb_mux_dp_hpd(port, state->data);
+	}
+
 	if (data->status & DP_STATUS_IRQ_HPD)
-		return pmc_usb_mux_dp_hpd(port, state);
+		return pmc_usb_mux_dp_hpd(port, state->data);
 
 	req.usage = PMC_USB_ALT_MODE;
 	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
@@ -183,8 +238,8 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 	if (ret)
 		return ret;
 
-	if (data->status & DP_STATUS_HPD_STATE)
-		return pmc_usb_mux_dp_hpd(port, state);
+	if (data->status & (DP_STATUS_IRQ_HPD | DP_STATUS_HPD_STATE))
+		return pmc_usb_mux_dp_hpd(port, state->data);
 
 	return 0;
 }
@@ -196,6 +251,10 @@ pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
 	u8 cable_speed = TBT_CABLE_SPEED(data->cable_mode);
 	struct altmode_req req = { };
 
+	if (IOM_PORT_ACTIVITY_IS(port->iom_status, TBT) ||
+	    IOM_PORT_ACTIVITY_IS(port->iom_status, ALT_MODE_TBT_USB))
+		return 0;
+
 	req.usage = PMC_USB_ALT_MODE;
 	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 	req.mode_type = PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIFT;
@@ -227,6 +286,10 @@ pmc_usb_mux_usb4(struct pmc_usb_port *port, struct typec_mux_state *state)
 	struct altmode_req req = { };
 	u8 cable_speed;
 
+	if (IOM_PORT_ACTIVITY_IS(port->iom_status, TBT) ||
+	    IOM_PORT_ACTIVITY_IS(port->iom_status, ALT_MODE_TBT_USB))
+		return 0;
+
 	req.usage = PMC_USB_ALT_MODE;
 	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 	req.mode_type = PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIFT;
@@ -261,6 +324,9 @@ static int pmc_usb_mux_safe_state(struct pmc_usb_port *port)
 {
 	u8 msg;
 
+	if (IOM_PORT_ACTIVITY_IS(port->iom_status, SAFE_MODE))
+		return 0;
+
 	msg = PMC_USB_SAFE_MODE;
 	msg |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
@@ -271,6 +337,9 @@ static int pmc_usb_connect(struct pmc_usb_port *port)
 {
 	u8 msg[2];
 
+	if (port->iom_status & IOM_PORT_STATUS_CONNECTED)
+		return 0;
+
 	msg[0] = PMC_USB_CONNECT;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
@@ -283,8 +352,16 @@ static int pmc_usb_connect(struct pmc_usb_port *port)
 
 static int pmc_usb_disconnect(struct pmc_usb_port *port)
 {
+	struct typec_displayport_data data = { };
 	u8 msg[2];
 
+	if (!(port->iom_status & IOM_PORT_STATUS_CONNECTED))
+		return 0;
+
+	/* Clear DisplayPort HPD if it's still asserted. */
+	if (IOM_PORT_HPD_ASSERTED(port->iom_status))
+		pmc_usb_mux_dp_hpd(port, &data);
+
 	msg[0] = PMC_USB_DISCONNECT;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
@@ -298,6 +375,8 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 {
 	struct pmc_usb_port *port = typec_mux_get_drvdata(mux);
 
+	update_port_status(port);
+
 	if (port->orientation == TYPEC_ORIENTATION_NONE || port->role == USB_ROLE_NONE)
 		return 0;
 
@@ -333,8 +412,7 @@ static int pmc_usb_set_orientation(struct typec_switch *sw,
 {
 	struct pmc_usb_port *port = typec_switch_get_drvdata(sw);
 
-	if (port->orientation == orientation)
-		return 0;
+	update_port_status(port);
 
 	port->orientation = orientation;
 
@@ -352,8 +430,7 @@ static int pmc_usb_set_role(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct pmc_usb_port *port = usb_role_switch_get_drvdata(sw);
 
-	if (port->role == role)
-		return 0;
+	update_port_status(port);
 
 	port->role = role;
 
@@ -438,6 +515,45 @@ static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
 	return ret;
 }
 
+static int is_memory(struct acpi_resource *res, void *data)
+{
+	struct resource r;
+
+	return !acpi_dev_resource_memory(res, &r);
+}
+
+static int pmc_usb_probe_iom(struct pmc_usb *pmc)
+{
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct acpi_device *adev;
+	int ret;
+
+	adev = acpi_dev_get_first_match_dev("INTC1072", NULL, -1);
+	if (!adev)
+		return -ENODEV;
+
+	INIT_LIST_HEAD(&resource_list);
+	ret = acpi_dev_get_resources(adev, &resource_list, is_memory, NULL);
+	if (ret < 0)
+		return ret;
+
+	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
+	if (rentry)
+		pmc->iom_base = devm_ioremap_resource(pmc->dev, rentry->res);
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	if (!pmc->iom_base) {
+		put_device(&adev->dev);
+		return -ENOMEM;
+	}
+
+	pmc->iom_adev = adev;
+
+	return 0;
+}
+
 static int pmc_usb_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *fwnode = NULL;
@@ -452,6 +568,12 @@ static int pmc_usb_probe(struct platform_device *pdev)
 	device_for_each_child_node(&pdev->dev, fwnode)
 		pmc->num_ports++;
 
+	/* The IOM microcontroller has a limitation of max 4 ports. */
+	if (pmc->num_ports > 4) {
+		dev_err(&pdev->dev, "driver limited to 4 ports\n");
+		return -ERANGE;
+	}
+
 	pmc->port = devm_kcalloc(&pdev->dev, pmc->num_ports,
 				 sizeof(struct pmc_usb_port), GFP_KERNEL);
 	if (!pmc->port)
@@ -463,6 +585,10 @@ static int pmc_usb_probe(struct platform_device *pdev)
 
 	pmc->dev = &pdev->dev;
 
+	ret = pmc_usb_probe_iom(pmc);
+	if (ret)
+		return ret;
+
 	/*
 	 * For every physical USB connector (USB2 and USB3 combo) there is a
 	 * child ACPI device node under the PMC mux ACPI device object.
@@ -487,6 +613,8 @@ static int pmc_usb_probe(struct platform_device *pdev)
 		typec_mux_unregister(pmc->port[i].typec_mux);
 	}
 
+	put_device(&pmc->iom_adev->dev);
+
 	return ret;
 }
 
@@ -500,6 +628,8 @@ static int pmc_usb_remove(struct platform_device *pdev)
 		typec_mux_unregister(pmc->port[i].typec_mux);
 	}
 
+	put_device(&pmc->iom_adev->dev);
+
 	return 0;
 }
 
-- 
2.28.0

