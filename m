Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DE91B5C6B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgDWNVO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgDWNVN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:13 -0400
IronPort-SDR: 28Ggxv1PAp2Cfi+o3FHJpHAie+Q28kHFBEiWjZxZwsfdh4AlOBmwr/Ml0xy9OuRCKimDexIipE
 w5hAy91EON1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:12 -0700
IronPort-SDR: R5BOH4lLyTSvidrVMB0qtVpqpd/xpl6pusWzYmHDsdDiwTn76KTlo/d1zPYh5ZQBqFOznf3def
 cvaNhKSd3jmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001040"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:21:11 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "K V, Abhilash" <abhilash.k.v@intel.com>
Subject: [PATCH 6/6] usb: typec: ucsi: register with power_supply class
Date:   Thu, 23 Apr 2020 16:20:58 +0300
Message-Id: <20200423132058.6972-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
References: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "K V, Abhilash" <abhilash.k.v@intel.com>

With this change the UCSI device will show up in
/sys/class/power_supply/. The following values are exported:
- online
- usb_type
- voltage_min
- voltage_max
- voltage_now
- current_max
- current_now

Once a PD-capable type-C power source is connected to the system, GET_PDOS
UCSI command is used to query all source capabilities. Request data object
(RDO) is used to get current values.

Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/Makefile |   4 +
 drivers/usb/typec/ucsi/psy.c    | 241 ++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c   |   6 +
 drivers/usb/typec/ucsi/ucsi.h   |  15 ++
 4 files changed, 266 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/psy.c

diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index b35e15a1f02c..8a8eb5cb8e0f 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -7,6 +7,10 @@ typec_ucsi-y				:= ucsi.o
 
 typec_ucsi-$(CONFIG_TRACING)		+= trace.o
 
+ifneq ($(CONFIG_POWER_SUPPLY),)
+	typec_ucsi-y			+= psy.o
+endif
+
 ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
 	typec_ucsi-y			+= displayport.o
 endif
diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
new file mode 100644
index 000000000000..26ed0b520749
--- /dev/null
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Power Supply for UCSI
+ *
+ * Copyright (C) 2020, Intel Corporation
+ * Author: K V, Abhilash <abhilash.k.v@intel.com>
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/property.h>
+#include <linux/usb/pd.h>
+
+#include "ucsi.h"
+
+/* Power Supply access to expose source power information */
+enum ucsi_psy_online_states {
+	UCSI_PSY_OFFLINE = 0,
+	UCSI_PSY_FIXED_ONLINE,
+	UCSI_PSY_PROG_ONLINE,
+};
+
+static enum power_supply_property ucsi_psy_props[] = {
+	POWER_SUPPLY_PROP_USB_TYPE,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_VOLTAGE_MIN,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_MAX,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+};
+
+static int ucsi_psy_get_online(struct ucsi_connector *con,
+			       union power_supply_propval *val)
+{
+	val->intval = UCSI_PSY_OFFLINE;
+	if (con->status.flags & UCSI_CONSTAT_CONNECTED &&
+	    (con->status.flags & UCSI_CONSTAT_PWR_DIR) == TYPEC_SINK)
+		val->intval = UCSI_PSY_FIXED_ONLINE;
+	return 0;
+}
+
+static int ucsi_psy_get_voltage_min(struct ucsi_connector *con,
+				    union power_supply_propval *val)
+{
+	u32 pdo;
+
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	case UCSI_CONSTAT_PWR_OPMODE_PD:
+		pdo = con->src_pdos[0];
+		val->intval = pdo_fixed_voltage(pdo) * 1000;
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
+	case UCSI_CONSTAT_PWR_OPMODE_BC:
+	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
+		val->intval = UCSI_TYPEC_VSAFE5V * 1000;
+		break;
+	default:
+		val->intval = 0;
+		break;
+	}
+	return 0;
+}
+
+static int ucsi_psy_get_voltage_max(struct ucsi_connector *con,
+				    union power_supply_propval *val)
+{
+	u32 pdo;
+
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	case UCSI_CONSTAT_PWR_OPMODE_PD:
+		if (con->num_pdos > 0) {
+			pdo = con->src_pdos[con->num_pdos - 1];
+			val->intval = pdo_fixed_voltage(pdo) * 1000;
+		} else {
+			val->intval = 0;
+		}
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
+	case UCSI_CONSTAT_PWR_OPMODE_BC:
+	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
+		val->intval = UCSI_TYPEC_VSAFE5V * 1000;
+		break;
+	default:
+		val->intval = 0;
+		break;
+	}
+	return 0;
+}
+
+static int ucsi_psy_get_voltage_now(struct ucsi_connector *con,
+				    union power_supply_propval *val)
+{
+	int index;
+	u32 pdo;
+
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	case UCSI_CONSTAT_PWR_OPMODE_PD:
+		index = rdo_index(con->rdo);
+		if (index > 0) {
+			pdo = con->src_pdos[index - 1];
+			val->intval = pdo_fixed_voltage(pdo) * 1000;
+		} else {
+			val->intval = 0;
+		}
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
+	case UCSI_CONSTAT_PWR_OPMODE_BC:
+	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
+		val->intval = UCSI_TYPEC_VSAFE5V * 1000;
+		break;
+	default:
+		val->intval = 0;
+		break;
+	}
+	return 0;
+}
+
+static int ucsi_psy_get_current_max(struct ucsi_connector *con,
+				    union power_supply_propval *val)
+{
+	u32 pdo;
+
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	case UCSI_CONSTAT_PWR_OPMODE_PD:
+		if (con->num_pdos > 0) {
+			pdo = con->src_pdos[con->num_pdos - 1];
+			val->intval = pdo_max_current(pdo) * 1000;
+		} else {
+			val->intval = 0;
+		}
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
+		val->intval = UCSI_TYPEC_1_5_CURRENT * 1000;
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
+		val->intval = UCSI_TYPEC_3_0_CURRENT * 1000;
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_BC:
+	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
+	/* UCSI can't tell b/w DCP/CDP or USB2/3x1/3x2 SDP chargers */
+	default:
+		val->intval = 0;
+		break;
+	}
+	return 0;
+}
+
+static int ucsi_psy_get_current_now(struct ucsi_connector *con,
+				    union power_supply_propval *val)
+{
+	u16 flags = con->status.flags;
+
+	if (UCSI_CONSTAT_PWR_OPMODE(flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
+		val->intval = rdo_op_current(con->rdo) * 1000;
+	else
+		val->intval = 0;
+	return 0;
+}
+
+static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
+				 union power_supply_propval *val)
+{
+	u16 flags = con->status.flags;
+
+	val->intval = POWER_SUPPLY_USB_TYPE_C;
+	if (flags & UCSI_CONSTAT_CONNECTED &&
+	    UCSI_CONSTAT_PWR_OPMODE(flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
+		val->intval = POWER_SUPPLY_USB_TYPE_PD;
+
+	return 0;
+}
+
+static int ucsi_psy_get_prop(struct power_supply *psy,
+			     enum power_supply_property psp,
+			     union power_supply_propval *val)
+{
+	struct ucsi_connector *con = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		return ucsi_psy_get_usb_type(con, val);
+	case POWER_SUPPLY_PROP_ONLINE:
+		return ucsi_psy_get_online(con, val);
+	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
+		return ucsi_psy_get_voltage_min(con, val);
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+		return ucsi_psy_get_voltage_max(con, val);
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		return ucsi_psy_get_voltage_now(con, val);
+	case POWER_SUPPLY_PROP_CURRENT_MAX:
+		return ucsi_psy_get_current_max(con, val);
+	case POWER_SUPPLY_PROP_CURRENT_NOW:
+		return ucsi_psy_get_current_now(con, val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static enum power_supply_usb_type ucsi_psy_usb_types[] = {
+	POWER_SUPPLY_USB_TYPE_C,
+	POWER_SUPPLY_USB_TYPE_PD,
+	POWER_SUPPLY_USB_TYPE_PD_PPS,
+};
+
+int ucsi_register_port_psy(struct ucsi_connector *con)
+{
+	struct power_supply_config psy_cfg = {};
+	struct device *dev = con->ucsi->dev;
+	char *psy_name;
+
+	psy_cfg.drv_data = con;
+	psy_cfg.fwnode = dev_fwnode(dev);
+
+	psy_name = devm_kasprintf(dev, GFP_KERNEL, "ucsi-source-psy-%s%d",
+				  dev_name(dev), con->num);
+	if (!psy_name)
+		return -ENOMEM;
+
+	con->psy_desc.name = psy_name;
+	con->psy_desc.type = POWER_SUPPLY_TYPE_USB,
+	con->psy_desc.usb_types = ucsi_psy_usb_types;
+	con->psy_desc.num_usb_types = ARRAY_SIZE(ucsi_psy_usb_types);
+	con->psy_desc.properties = ucsi_psy_props,
+	con->psy_desc.num_properties = ARRAY_SIZE(ucsi_psy_props),
+	con->psy_desc.get_property = ucsi_psy_get_prop;
+
+	con->psy = power_supply_register(dev, &con->psy_desc, &psy_cfg);
+
+	return PTR_ERR_OR_ZERO(con->psy);
+}
+
+void ucsi_unregister_port_psy(struct ucsi_connector *con)
+{
+	if (IS_ERR_OR_NULL(con->psy))
+		return;
+
+	power_supply_unregister(con->psy);
+}
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ffea795da815..d0c63afaf345 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -936,6 +936,10 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
 
+	ret = ucsi_register_port_psy(con);
+	if (ret)
+		return ret;
+
 	/* Register the connector */
 	con->port = typec_register_port(ucsi->dev, cap);
 	if (IS_ERR(con->port))
@@ -1062,6 +1066,7 @@ int ucsi_init(struct ucsi *ucsi)
 	for (con = ucsi->connector; con->port; con++) {
 		ucsi_unregister_partner(con);
 		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
+		ucsi_unregister_port_psy(con);
 		typec_unregister_port(con->port);
 		con->port = NULL;
 	}
@@ -1185,6 +1190,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 		ucsi_unregister_partner(&ucsi->connector[i]);
 		ucsi_unregister_altmodes(&ucsi->connector[i],
 					 UCSI_RECIPIENT_CON);
+		ucsi_unregister_port_psy(&ucsi->connector[i]);
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 28e21a1e6b61..e52b5540b254 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -5,6 +5,7 @@
 
 #include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/power_supply.h>
 #include <linux/types.h>
 #include <linux/usb/typec.h>
 
@@ -301,6 +302,10 @@ struct ucsi {
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
 #define UCSI_MAX_PDOS		(4)
 
+#define UCSI_TYPEC_VSAFE5V	5000
+#define UCSI_TYPEC_1_5_CURRENT	1500
+#define UCSI_TYPEC_3_0_CURRENT	3000
+
 struct ucsi_connector {
 	int num;
 
@@ -319,6 +324,8 @@ struct ucsi_connector {
 
 	struct ucsi_connector_status status;
 	struct ucsi_connector_capability cap;
+	struct power_supply *psy;
+	struct power_supply_desc psy_desc;
 	u32 rdo;
 	u32 src_pdos[UCSI_MAX_PDOS];
 	int num_pdos;
@@ -330,6 +337,14 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
+#if IS_ENABLED(CONFIG_POWER_SUPPLY)
+int ucsi_register_port_psy(struct ucsi_connector *con);
+void ucsi_unregister_port_psy(struct ucsi_connector *con);
+#else
+static inline int ucsi_register_port(struct ucsi_connector *con) { return 0; }
+static inline void ucsi_unregister_port_psy(struct ucsi_connector *con) { }
+#endif /* CONFIG_POWER_SUPPLY */
+
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
 struct typec_altmode *
 ucsi_register_displayport(struct ucsi_connector *con,
-- 
2.26.1

