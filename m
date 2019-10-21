Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044FEDEAE0
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 13:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfJUL0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 07:26:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:14014 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727620AbfJUL0I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 07:26:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 04:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209425864"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2019 04:26:05 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 16/18] usb: typec: ucsi: Remove all bit-fields
Date:   Mon, 21 Oct 2019 14:25:22 +0300
Message-Id: <20191021112524.79550-17-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We can't use bit fields with data that is received or send
to/from the device.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/trace.h | 12 ++---
 drivers/usb/typec/ucsi/ucsi.c  | 52 +++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h  | 93 +++++++++++++++++-----------------
 3 files changed, 85 insertions(+), 72 deletions(-)

diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
index 2262229dae8e..a0d3a934d3d9 100644
--- a/drivers/usb/typec/ucsi/trace.h
+++ b/drivers/usb/typec/ucsi/trace.h
@@ -56,13 +56,13 @@ DECLARE_EVENT_CLASS(ucsi_log_connector_status,
 	TP_fast_assign(
 		__entry->port = port - 1;
 		__entry->change = status->change;
-		__entry->opmode = status->pwr_op_mode;
-		__entry->connected = status->connected;
-		__entry->pwr_dir = status->pwr_dir;
-		__entry->partner_flags = status->partner_flags;
-		__entry->partner_type = status->partner_type;
+		__entry->opmode = UCSI_CONSTAT_PWR_OPMODE(status->flags);
+		__entry->connected = !!(status->flags & UCSI_CONSTAT_CONNECTED);
+		__entry->pwr_dir = !!(status->flags & UCSI_CONSTAT_PWR_DIR);
+		__entry->partner_flags = UCSI_CONSTAT_PARTNER_FLAGS(status->flags);
+		__entry->partner_type = UCSI_CONSTAT_PARTNER_TYPE(status->flags);
 		__entry->request_data_obj = status->request_data_obj;
-		__entry->bc_status = status->bc_status;
+		__entry->bc_status = UCSI_CONSTAT_BC_STATUS(status->pwr_status);
 	),
 	TP_printk("port%d status: change=%04x, opmode=%x, connected=%d, "
 		"sourcing=%d, partner_flags=%x, partner_type=%x, "
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 95d0c2c12f72..38452183cac0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -389,7 +389,7 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
-	switch (con->status.pwr_op_mode) {
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
 		break;
@@ -407,6 +407,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 
 static int ucsi_register_partner(struct ucsi_connector *con)
 {
+	u8 pwr_opmode = UCSI_CONSTAT_PWR_OPMODE(con->status.flags);
 	struct typec_partner_desc desc;
 	struct typec_partner *partner;
 
@@ -415,7 +416,7 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 
 	memset(&desc, 0, sizeof(desc));
 
-	switch (con->status.partner_type) {
+	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
 		desc.accessory = TYPEC_ACCESSORY_DEBUG;
 		break;
@@ -426,7 +427,7 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 		break;
 	}
 
-	desc.usb_pd = con->status.pwr_op_mode == UCSI_CONSTAT_PWR_OPMODE_PD;
+	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
 
 	partner = typec_register_partner(con->port, &desc);
 	if (IS_ERR(partner)) {
@@ -458,7 +459,7 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 	if (!con->partner)
 		return;
 
-	switch (con->status.partner_type) {
+	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
@@ -488,6 +489,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
+	enum typec_role role;
 	u64 command;
 	int ret;
 
@@ -502,11 +504,13 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		goto out_unlock;
 	}
 
+	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
+
 	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE)
 		ucsi_pwr_opmode_change(con);
 
 	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
-		typec_set_pwr_role(con->port, con->status.pwr_dir);
+		typec_set_pwr_role(con->port, role);
 
 		/* Complete pending power role swap */
 		if (!completion_done(&con->complete))
@@ -514,9 +518,9 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	}
 
 	if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
-		typec_set_pwr_role(con->port, con->status.pwr_dir);
+		typec_set_pwr_role(con->port, role);
 
-		switch (con->status.partner_type) {
+		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 			typec_set_data_role(con->port, TYPEC_HOST);
 			break;
@@ -527,7 +531,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			break;
 		}
 
-		if (con->status.connected)
+		if (con->status.flags & UCSI_CONSTAT_CONNECTED)
 			ucsi_register_partner(con);
 		else
 			ucsi_unregister_partner(con);
@@ -646,6 +650,7 @@ static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
 static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 {
 	struct ucsi_connector *con = typec_get_drvdata(port);
+	u8 partner_type;
 	u64 command;
 	int ret = 0;
 
@@ -656,9 +661,10 @@ static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 		goto out_unlock;
 	}
 
-	if ((con->status.partner_type == UCSI_CONSTAT_PARTNER_TYPE_DFP &&
+	partner_type = UCSI_CONSTAT_PARTNER_TYPE(con->status.flags);
+	if ((partner_type == UCSI_CONSTAT_PARTNER_TYPE_DFP &&
 	     role == TYPEC_DEVICE) ||
-	    (con->status.partner_type == UCSI_CONSTAT_PARTNER_TYPE_UFP &&
+	    (partner_type == UCSI_CONSTAT_PARTNER_TYPE_UFP &&
 	     role == TYPEC_HOST))
 		goto out_unlock;
 
@@ -682,6 +688,7 @@ static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 {
 	struct ucsi_connector *con = typec_get_drvdata(port);
+	enum typec_role cur_role;
 	u64 command;
 	int ret = 0;
 
@@ -692,7 +699,9 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 		goto out_unlock;
 	}
 
-	if (con->status.pwr_dir == role)
+	cur_role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
+
+	if (cur_role == role)
 		goto out_unlock;
 
 	command = UCSI_SET_PDR | UCSI_CONNECTOR_NUMBER(con->num);
@@ -709,7 +718,8 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 	}
 
 	/* Something has gone wrong while swapping the role */
-	if (con->status.pwr_op_mode != UCSI_CONSTAT_PWR_OPMODE_PD) {
+	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) !=
+	    UCSI_CONSTAT_PWR_OPMODE_PD) {
 		ucsi_reset_connector(con, true);
 		ret = -EPROTO;
 	}
@@ -764,11 +774,12 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_UFP)
 		cap->data = TYPEC_PORT_UFP;
 
-	if (con->cap.provider && con->cap.consumer)
+	if ((con->cap.flags & UCSI_CONCAP_FLAG_PROVIDER) &&
+	    (con->cap.flags & UCSI_CONCAP_FLAG_CONSUMER))
 		cap->type = TYPEC_PORT_DRP;
-	else if (con->cap.provider)
+	else if (con->cap.flags & UCSI_CONCAP_FLAG_PROVIDER)
 		cap->type = TYPEC_PORT_SRC;
-	else if (con->cap.consumer)
+	else if (con->cap.flags & UCSI_CONCAP_FLAG_CONSUMER)
 		cap->type = TYPEC_PORT_SNK;
 
 	cap->revision = ucsi->cap.typec_version;
@@ -804,10 +815,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		return 0;
 	}
 
-	ucsi_pwr_opmode_change(con);
-	typec_set_pwr_role(con->port, con->status.pwr_dir);
-
-	switch (con->status.partner_type) {
+	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
@@ -819,8 +827,12 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	}
 
 	/* Check if there is already something connected */
-	if (con->status.connected)
+	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
+		typec_set_pwr_role(con->port,
+				  !!(con->status.flags & UCSI_CONSTAT_PWR_DIR));
+		ucsi_pwr_opmode_change(con);
 		ucsi_register_partner(con);
+	}
 
 	if (con->partner) {
 		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 4f1409e06d22..bc2254e7a3a3 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -144,8 +144,8 @@ struct ucsi_capability {
 #define UCSI_CAP_ATTR_POWER_AC_SUPPLY		BIT(8)
 #define UCSI_CAP_ATTR_POWER_OTHER		BIT(10)
 #define UCSI_CAP_ATTR_POWER_VBUS		BIT(14)
-	u32 num_connectors:8;
-	u32 features:24;
+	u8 num_connectors;
+	u8 features;
 #define UCSI_CAP_SET_UOM			BIT(0)
 #define UCSI_CAP_SET_PDM			BIT(1)
 #define UCSI_CAP_ALT_MODE_DETAILS		BIT(2)
@@ -154,8 +154,9 @@ struct ucsi_capability {
 #define UCSI_CAP_CABLE_DETAILS			BIT(5)
 #define UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS	BIT(6)
 #define UCSI_CAP_PD_RESET			BIT(7)
+	u16 reserved_1;
 	u8 num_alt_modes;
-	u8 reserved;
+	u8 reserved_2;
 	u16 bc_version;
 	u16 pd_version;
 	u16 typec_version;
@@ -172,9 +173,9 @@ struct ucsi_connector_capability {
 #define UCSI_CONCAP_OPMODE_USB2			BIT(5)
 #define UCSI_CONCAP_OPMODE_USB3			BIT(6)
 #define UCSI_CONCAP_OPMODE_ALT_MODE		BIT(7)
-	u8 provider:1;
-	u8 consumer:1;
-	u8:6; /* reserved */
+	u8 flags;
+#define UCSI_CONCAP_FLAG_PROVIDER		BIT(0)
+#define UCSI_CONCAP_FLAG_CONSUMER		BIT(1)
 } __packed;
 
 struct ucsi_altmode {
@@ -186,18 +187,17 @@ struct ucsi_altmode {
 struct ucsi_cable_property {
 	u16 speed_supported;
 	u8 current_capability;
-	u8 vbus_in_cable:1;
-	u8 active_cable:1;
-	u8 directionality:1;
-	u8 plug_type:2;
-#define UCSI_CABLE_PROPERTY_PLUG_TYPE_A		0
-#define UCSI_CABLE_PROPERTY_PLUG_TYPE_B		1
-#define UCSI_CABLE_PROPERTY_PLUG_TYPE_C		2
-#define UCSI_CABLE_PROPERTY_PLUG_OTHER		3
-	u8 mode_support:1;
-	u8:2; /* reserved */
-	u8 latency:4;
-	u8:4; /* reserved */
+	u8 flags;
+#define UCSI_CABLE_PROP_FLAG_VBUS_IN_CABLE	BIT(0)
+#define UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE	BIT(1)
+#define UCSI_CABLE_PROP_FLAG_DIRECTIONALITY	BIT(2)
+#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	((_f_) & GENMASK(3, 0))
+#define   UCSI_CABLE_PROPERTY_PLUG_TYPE_A	0
+#define   UCSI_CABLE_PROPERTY_PLUG_TYPE_B	1
+#define   UCSI_CABLE_PROPERTY_PLUG_TYPE_C	2
+#define   UCSI_CABLE_PROPERTY_PLUG_OTHER	3
+#define UCSI_CABLE_PROP_MODE_SUPPORT		BIT(5)
+	u8 latency;
 } __packed;
 
 /* Data structure filled by PPM in response to GET_CONNECTOR_STATUS command. */
@@ -214,35 +214,36 @@ struct ucsi_connector_status {
 #define UCSI_CONSTAT_POWER_DIR_CHANGE		BIT(12)
 #define UCSI_CONSTAT_CONNECT_CHANGE		BIT(14)
 #define UCSI_CONSTAT_ERROR			BIT(15)
-	u16 pwr_op_mode:3;
-#define UCSI_CONSTAT_PWR_OPMODE_NONE		0
-#define UCSI_CONSTAT_PWR_OPMODE_DEFAULT		1
-#define UCSI_CONSTAT_PWR_OPMODE_BC		2
-#define UCSI_CONSTAT_PWR_OPMODE_PD		3
-#define UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5	4
-#define UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0	5
-	u16 connected:1;
-	u16 pwr_dir:1;
-	u16 partner_flags:8;
-#define UCSI_CONSTAT_PARTNER_FLAG_USB		BIT(0)
-#define UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE	BIT(1)
-	u16 partner_type:3;
-#define UCSI_CONSTAT_PARTNER_TYPE_DFP		1
-#define UCSI_CONSTAT_PARTNER_TYPE_UFP		2
-#define UCSI_CONSTAT_PARTNER_TYPE_CABLE		3 /* Powered Cable */
-#define UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP	4 /* Powered Cable */
-#define UCSI_CONSTAT_PARTNER_TYPE_DEBUG		5
-#define UCSI_CONSTAT_PARTNER_TYPE_AUDIO		6
+	u16 flags;
+#define UCSI_CONSTAT_PWR_OPMODE(_f_)		((_f_) & GENMASK(2, 0))
+#define   UCSI_CONSTAT_PWR_OPMODE_NONE		0
+#define   UCSI_CONSTAT_PWR_OPMODE_DEFAULT	1
+#define   UCSI_CONSTAT_PWR_OPMODE_BC		2
+#define   UCSI_CONSTAT_PWR_OPMODE_PD		3
+#define   UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5	4
+#define   UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0	5
+#define UCSI_CONSTAT_CONNECTED			BIT(3)
+#define UCSI_CONSTAT_PWR_DIR			BIT(4)
+#define UCSI_CONSTAT_PARTNER_FLAGS(_f_)		(((_f_) & GENMASK(12, 5)) >> 5)
+#define   UCSI_CONSTAT_PARTNER_FLAG_USB		1
+#define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE	2
+#define UCSI_CONSTAT_PARTNER_TYPE(_f_)		(((_f_) & GENMASK(15, 13)) >> 13)
+#define   UCSI_CONSTAT_PARTNER_TYPE_DFP		1
+#define   UCSI_CONSTAT_PARTNER_TYPE_UFP		2
+#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE	3 /* Powered Cable */
+#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP	4 /* Powered Cable */
+#define   UCSI_CONSTAT_PARTNER_TYPE_DEBUG	5
+#define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO	6
 	u32 request_data_obj;
-	u8 bc_status:2;
-#define UCSI_CONSTAT_BC_NOT_CHARGING		0
-#define UCSI_CONSTAT_BC_NOMINAL_CHARGING	1
-#define UCSI_CONSTAT_BC_SLOW_CHARGING		2
-#define UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
-	u8 provider_cap_limit_reason:4;
-#define UCSI_CONSTAT_CAP_PWR_LOWERED		0
-#define UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT	1
-	u8:2; /* reserved */
+	u8 pwr_status;
+#define UCSI_CONSTAT_BC_STATUS(_p_)		((_p_) & GENMASK(2, 0))
+#define   UCSI_CONSTAT_BC_NOT_CHARGING		0
+#define   UCSI_CONSTAT_BC_NOMINAL_CHARGING	1
+#define   UCSI_CONSTAT_BC_SLOW_CHARGING		2
+#define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
+#define UCSI_CONSTAT_PROVIDER_CAP_LIMIT(_p_)	(((_p_) & GENMASK(6, 3)) >> 3)
+#define   UCSI_CONSTAT_CAP_PWR_LOWERED		0
+#define   UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT	1
 } __packed;
 
 /* -------------------------------------------------------------------------- */
-- 
2.23.0

