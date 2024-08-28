Return-Path: <linux-usb+bounces-14243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE6962D74
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 18:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC331B25CF4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 16:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8C61A4F3A;
	Wed, 28 Aug 2024 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vvz6KnoL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7BC1A4B9F
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861711; cv=none; b=F9eQgGEFjvqP4ZPGp5QchSbv+gBlJHQcXSN3VUEcN1sbmopcsZ2/utdpi+0T8dJev1q26Clgifs01gaRYKDFDZYFrqluB2p/0o/bgwgmU36+wHIr3pYdbYt9nzxeoeCsqChufyLe/rLEVGIjqjAPOt0OuuMsIqNJc4MqsAyvD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861711; c=relaxed/simple;
	bh=XvgIi+mB7HkMq9UBXpBw1c0SJl1Pe3Iliiy/YUXTtck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CV0hucJl3aYDYY2PIa/+vhYV65yj2xj48w2R6xBI0V2Mx5tEItUUecuWMqhFBfozEa3UuYQ9fKYvxFSi2ekfvaLck2Pzr58frsBVQyQ5njVO7tPCNwIWKTaS8NXFGikuKP+G8RcCXavbQ5DQcBCs6rFrFNSrmMfWUdehK+gFJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vvz6KnoL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724861709; x=1756397709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XvgIi+mB7HkMq9UBXpBw1c0SJl1Pe3Iliiy/YUXTtck=;
  b=Vvz6KnoLVObGMKVTj/QqnHJEUDQA7UP/L0182VoP62GqvZXV/iZn76ZB
   tcDsZgDW9ThDwNr7oCwmoIAklMwdacgI1+qPog0EvhPA8pI4WCnxE63Mu
   NA8/qtkV2aKykG4y0XxDxTDQWPkRbOjRLJXtKGuILtlvnltLCNPjF4DGk
   1RqqWilmF0ZvyGFgy1vjw1F2o8UrcEMg9SdjCy9jf5ex+rOxoRVVAP0nB
   1TDceM5Dztbp6XXtAJDNNac2RloIiG6yhXd5SPkM3RIY/4KtBklKZu8ko
   iJFs5v4KqH+X37ekVLJXapk/lm7St8E3Qx7fGnGRM2eVSxrcFeFcJySBD
   w==;
X-CSE-ConnectionGUID: jAV4ji8mTpuq9q3k5Hab3A==
X-CSE-MsgGUID: dfA0kur2RAe9T7vxoJhXNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23566081"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23566081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 09:15:09 -0700
X-CSE-ConnectionGUID: YBj4FDxzSlCcEDuYFgI1Og==
X-CSE-MsgGUID: qC3Vofp1T9uUySv2vYCutA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63605512"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 09:15:08 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/3] usb: typec: ucsi: Remove struct ucsi_connector_status
Date: Wed, 28 Aug 2024 19:15:00 +0300
Message-ID: <20240828161502.2774996-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GET_CONNECTOR_STATUS fields don't align naturally, which
makes handling it with a data structure a bit awkward. The
members of struct ucsi_connector_status don't match the
actual GET_CONNECTOR_STATUS fields.

Instead of using the custom data structure, simply accessing
the fields directly. This introduces a helper UCSI_FIELD()
for that purpose.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/psy.c       | 28 +++++------
 drivers/usb/typec/ucsi/trace.h     | 22 ++++----
 drivers/usb/typec/ucsi/ucsi.c      | 81 ++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi.h      | 62 +++++++++++++----------
 drivers/usb/typec/ucsi/ucsi_acpi.c |  7 +--
 5 files changed, 98 insertions(+), 102 deletions(-)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index e623d80e177c..76a646d154c1 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -55,8 +55,8 @@ static int ucsi_psy_get_online(struct ucsi_connector *con,
 			       union power_supply_propval *val)
 {
 	val->intval = UCSI_PSY_OFFLINE;
-	if (con->status.flags & UCSI_CONSTAT_CONNECTED &&
-	    (con->status.flags & UCSI_CONSTAT_PWR_DIR) == TYPEC_SINK)
+	if (UCSI_CONSTAT_CONNECTED(con->status) &&
+	    (UCSI_CONSTAT_PWR_DIR(con->status) == TYPEC_SINK))
 		val->intval = UCSI_PSY_FIXED_ONLINE;
 	return 0;
 }
@@ -66,7 +66,7 @@ static int ucsi_psy_get_voltage_min(struct ucsi_connector *con,
 {
 	u32 pdo;
 
-	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		pdo = con->src_pdos[0];
 		val->intval = pdo_fixed_voltage(pdo) * 1000;
@@ -89,7 +89,7 @@ static int ucsi_psy_get_voltage_max(struct ucsi_connector *con,
 {
 	u32 pdo;
 
-	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		if (con->num_pdos > 0) {
 			pdo = con->src_pdos[con->num_pdos - 1];
@@ -117,7 +117,7 @@ static int ucsi_psy_get_voltage_now(struct ucsi_connector *con,
 	int index;
 	u32 pdo;
 
-	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		index = rdo_index(con->rdo);
 		if (index > 0) {
@@ -145,7 +145,7 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 {
 	u32 pdo;
 
-	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		if (con->num_pdos > 0) {
 			pdo = con->src_pdos[con->num_pdos - 1];
@@ -173,9 +173,7 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 static int ucsi_psy_get_current_now(struct ucsi_connector *con,
 				    union power_supply_propval *val)
 {
-	u16 flags = con->status.flags;
-
-	if (UCSI_CONSTAT_PWR_OPMODE(flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
+	if (UCSI_CONSTAT_PWR_OPMODE(con->status) == UCSI_CONSTAT_PWR_OPMODE_PD)
 		val->intval = rdo_op_current(con->rdo) * 1000;
 	else
 		val->intval = 0;
@@ -185,11 +183,9 @@ static int ucsi_psy_get_current_now(struct ucsi_connector *con,
 static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
 				 union power_supply_propval *val)
 {
-	u16 flags = con->status.flags;
-
 	val->intval = POWER_SUPPLY_USB_TYPE_C;
-	if (flags & UCSI_CONSTAT_CONNECTED &&
-	    UCSI_CONSTAT_PWR_OPMODE(flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
+	if (UCSI_CONSTAT_CONNECTED(con->status) &&
+	    UCSI_CONSTAT_PWR_OPMODE(con->status) == UCSI_CONSTAT_PWR_OPMODE_PD)
 		val->intval = POWER_SUPPLY_USB_TYPE_PD;
 
 	return 0;
@@ -197,18 +193,18 @@ static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
 
 static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union power_supply_propval *val)
 {
-	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED)) {
+	if (!(UCSI_CONSTAT_CONNECTED(con->status))) {
 		val->intval = POWER_SUPPLY_CHARGE_TYPE_NONE;
 		return 0;
 	}
 
 	/* The Battery Charging Cabability Status field is only valid in sink role. */
-	if ((con->status.flags & UCSI_CONSTAT_PWR_DIR) != TYPEC_SINK) {
+	if (UCSI_CONSTAT_PWR_DIR(con->status) != TYPEC_SINK) {
 		val->intval = POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
 		return 0;
 	}
 
-	switch (UCSI_CONSTAT_BC_STATUS(con->status.pwr_status)) {
+	switch (UCSI_CONSTAT_BC_STATUS(con->status)) {
 	case UCSI_CONSTAT_BC_NOMINAL_CHARGING:
 		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
 		break;
diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
index a0d3a934d3d9..ad51d684ea20 100644
--- a/drivers/usb/typec/ucsi/trace.h
+++ b/drivers/usb/typec/ucsi/trace.h
@@ -40,7 +40,7 @@ DEFINE_EVENT(ucsi_log_command, ucsi_reset_ppm,
 );
 
 DECLARE_EVENT_CLASS(ucsi_log_connector_status,
-	TP_PROTO(int port, struct ucsi_connector_status *status),
+	TP_PROTO(int port, u8 *status),
 	TP_ARGS(port, status),
 	TP_STRUCT__entry(
 		__field(int, port)
@@ -55,14 +55,14 @@ DECLARE_EVENT_CLASS(ucsi_log_connector_status,
 	),
 	TP_fast_assign(
 		__entry->port = port - 1;
-		__entry->change = status->change;
-		__entry->opmode = UCSI_CONSTAT_PWR_OPMODE(status->flags);
-		__entry->connected = !!(status->flags & UCSI_CONSTAT_CONNECTED);
-		__entry->pwr_dir = !!(status->flags & UCSI_CONSTAT_PWR_DIR);
-		__entry->partner_flags = UCSI_CONSTAT_PARTNER_FLAGS(status->flags);
-		__entry->partner_type = UCSI_CONSTAT_PARTNER_TYPE(status->flags);
-		__entry->request_data_obj = status->request_data_obj;
-		__entry->bc_status = UCSI_CONSTAT_BC_STATUS(status->pwr_status);
+		__entry->change = UCSI_CONSTAT_CHANGE(status);
+		__entry->opmode = UCSI_CONSTAT_PWR_OPMODE(status);
+		__entry->connected = UCSI_CONSTAT_CONNECTED(status);
+		__entry->pwr_dir = UCSI_CONSTAT_PWR_DIR(status);
+		__entry->partner_flags = UCSI_CONSTAT_PARTNER_FLAGS(status);
+		__entry->partner_type = UCSI_CONSTAT_PARTNER_TYPE(status);
+		__entry->request_data_obj = UCSI_CONSTAT_RDO(status);
+		__entry->bc_status = UCSI_CONSTAT_BC_STATUS(status);
 	),
 	TP_printk("port%d status: change=%04x, opmode=%x, connected=%d, "
 		"sourcing=%d, partner_flags=%x, partner_type=%x, "
@@ -73,12 +73,12 @@ DECLARE_EVENT_CLASS(ucsi_log_connector_status,
 );
 
 DEFINE_EVENT(ucsi_log_connector_status, ucsi_connector_change,
-	TP_PROTO(int port, struct ucsi_connector_status *status),
+	TP_PROTO(int port, u8 *status),
 	TP_ARGS(port, status)
 );
 
 DEFINE_EVENT(ucsi_log_connector_status, ucsi_register_port,
-	TP_PROTO(int port, struct ucsi_connector_status *status),
+	TP_PROTO(int port, u8 *status),
 	TP_ARGS(port, status)
 );
 
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2e6773715efe..399ea2700d19 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -652,7 +652,9 @@ static int ucsi_get_connector_status(struct ucsi_connector *con, bool conn_ack)
 	struct ucsi *ucsi = con->ucsi;
 	int ret;
 
-	ret = ucsi_send_command_common(ucsi, command, &con->status, sizeof(con->status), conn_ack);
+	ret = ucsi_send_command_common(ucsi, command, &con->status,
+				       min(sizeof(con->status), UCSI_MAX_DATA_LENGTH(ucsi)),
+				       conn_ack);
 	return ret < 0 ? ret : 0;
 }
 
@@ -666,8 +668,7 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 
 	if (is_partner &&
 	    ucsi->quirks & UCSI_NO_PARTNER_PDOS &&
-	    ((con->status.flags & UCSI_CONSTAT_PWR_DIR) ||
-	     !is_source(role)))
+	    (UCSI_CONSTAT_PWR_DIR(con->status) || !is_source(role)))
 		return 0;
 
 	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
@@ -971,9 +972,9 @@ static void ucsi_unregister_cable(struct ucsi_connector *con)
 
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
-	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PWR_OPMODE(con->status)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
-		con->rdo = con->status.request_data_obj;
+		con->rdo = UCSI_CONSTAT_RDO(con->status);
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
 		ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
 		ucsi_partner_task(con, ucsi_check_altmodes, 30, HZ);
@@ -996,7 +997,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 
 static int ucsi_register_partner(struct ucsi_connector *con)
 {
-	u8 pwr_opmode = UCSI_CONSTAT_PWR_OPMODE(con->status.flags);
+	u8 pwr_opmode = UCSI_CONSTAT_PWR_OPMODE(con->status);
 	struct typec_partner_desc desc;
 	struct typec_partner *partner;
 
@@ -1005,7 +1006,7 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 
 	memset(&desc, 0, sizeof(desc));
 
-	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
 		desc.accessory = TYPEC_ACCESSORY_DEBUG;
 		break;
@@ -1058,7 +1059,7 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 	enum usb_role u_role = USB_ROLE_NONE;
 	int ret;
 
-	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 		u_role = USB_ROLE_HOST;
@@ -1074,8 +1075,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 		break;
 	}
 
-	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
-		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
+	if (UCSI_CONSTAT_CONNECTED(con->status)) {
+		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
 		case UCSI_CONSTAT_PARTNER_TYPE_DEBUG:
 			typec_set_mode(con->port, TYPEC_MODE_DEBUG);
 			break;
@@ -1083,14 +1084,14 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			typec_set_mode(con->port, TYPEC_MODE_AUDIO);
 			break;
 		default:
-			if (UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) ==
-					UCSI_CONSTAT_PARTNER_FLAG_USB)
+			if (UCSI_CONSTAT_PARTNER_FLAGS(con->status) ==
+			    UCSI_CONSTAT_PARTNER_FLAG_USB)
 				typec_set_mode(con->port, TYPEC_STATE_USB);
 		}
 	}
 
 	/* Only notify USB controller if partner supports USB data */
-	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
+	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status) & UCSI_CONSTAT_PARTNER_FLAG_USB))
 		u_role = USB_ROLE_NONE;
 
 	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
@@ -1122,7 +1123,7 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
 
 static int ucsi_check_connection(struct ucsi_connector *con)
 {
-	u8 prev_flags = con->status.flags;
+	u8 prev_state = UCSI_CONSTAT_CONNECTED(con->status);
 	int ret;
 
 	ret = ucsi_get_connector_status(con, false);
@@ -1131,10 +1132,9 @@ static int ucsi_check_connection(struct ucsi_connector *con)
 		return ret;
 	}
 
-	if (con->status.flags == prev_flags)
-		return 0;
-
-	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
+	if (UCSI_CONSTAT_CONNECTED(con->status)) {
+		if (prev_state)
+			return 0;
 		ucsi_register_partner(con);
 		ucsi_pwr_opmode_change(con);
 		ucsi_partner_change(con);
@@ -1212,14 +1212,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		goto out_unlock;
 	}
 
-	trace_ucsi_connector_change(con->num, &con->status);
+	trace_ucsi_connector_change(con->num, con->status);
 
 	if (ucsi->ops->connector_status)
 		ucsi->ops->connector_status(con);
 
-	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
+	role = UCSI_CONSTAT_PWR_DIR(con->status);
 
-	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
+	if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_POWER_DIR_CHANGE) {
 		typec_set_pwr_role(con->port, role);
 
 		/* Complete pending power role swap */
@@ -1227,12 +1227,12 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			complete(&con->complete);
 	}
 
-	if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
+	if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_CONNECT_CHANGE) {
 		typec_set_pwr_role(con->port, role);
 		ucsi_port_psy_changed(con);
 		ucsi_partner_change(con);
 
-		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
+		if (UCSI_CONSTAT_CONNECTED(con->status)) {
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
 			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
@@ -1241,19 +1241,18 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
 				ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
 
-			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
-			    UCSI_CONSTAT_PWR_OPMODE_PD)
+			if (UCSI_CONSTAT_PWR_OPMODE(con->status) == UCSI_CONSTAT_PWR_OPMODE_PD)
 				ucsi_partner_task(con, ucsi_register_partner_pdos, 1, HZ);
 		} else {
 			ucsi_unregister_partner(con);
 		}
 	}
 
-	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
-	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
+	if (UCSI_CONSTAT_CHANGE(con->status) & (UCSI_CONSTAT_POWER_OPMODE_CHANGE |
+						  UCSI_CONSTAT_POWER_LEVEL_CHANGE))
 		ucsi_pwr_opmode_change(con);
 
-	if (con->partner && con->status.change & UCSI_CONSTAT_PARTNER_CHANGE) {
+	if (con->partner && UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_PARTNER_CHANGE) {
 		ucsi_partner_change(con);
 
 		/* Complete pending data role swap */
@@ -1261,10 +1260,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			complete(&con->complete);
 	}
 
-	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
+	if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_CAM_CHANGE)
 		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
 
-	if (con->status.change & UCSI_CONSTAT_BC_CHANGE)
+	if (UCSI_CONSTAT_CHANGE(con->status) & UCSI_CONSTAT_BC_CHANGE)
 		ucsi_port_psy_changed(con);
 
 out_unlock:
@@ -1424,7 +1423,7 @@ static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 		goto out_unlock;
 	}
 
-	partner_type = UCSI_CONSTAT_PARTNER_TYPE(con->status.flags);
+	partner_type = UCSI_CONSTAT_PARTNER_TYPE(con->status);
 	if ((partner_type == UCSI_CONSTAT_PARTNER_TYPE_DFP &&
 	     role == TYPEC_DEVICE) ||
 	    (partner_type == UCSI_CONSTAT_PARTNER_TYPE_UFP &&
@@ -1468,7 +1467,7 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 		goto out_unlock;
 	}
 
-	cur_role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
+	cur_role = UCSI_CONSTAT_PWR_DIR(con->status);
 
 	if (cur_role == role)
 		goto out_unlock;
@@ -1491,8 +1490,7 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 	mutex_lock(&con->lock);
 
 	/* Something has gone wrong while swapping the role */
-	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) !=
-	    UCSI_CONSTAT_PWR_OPMODE_PD) {
+	if (UCSI_CONSTAT_PWR_OPMODE(con->status) != UCSI_CONSTAT_PWR_OPMODE_PD) {
 		ucsi_reset_connector(con, true);
 		ret = -EPROTO;
 	}
@@ -1623,7 +1621,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	if (ucsi->ops->connector_status)
 		ucsi->ops->connector_status(con);
 
-	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
+	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
 	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 		u_role = USB_ROLE_HOST;
@@ -1640,9 +1638,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	}
 
 	/* Check if there is already something connected */
-	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
-		typec_set_pwr_role(con->port,
-				  !!(con->status.flags & UCSI_CONSTAT_PWR_DIR));
+	if (UCSI_CONSTAT_CONNECTED(con->status)) {
+		typec_set_pwr_role(con->port, UCSI_CONSTAT_PWR_DIR(con->status));
 		ucsi_register_partner(con);
 		ucsi_pwr_opmode_change(con);
 		ucsi_port_psy_changed(con);
@@ -1653,7 +1650,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	}
 
 	/* Only notify USB controller if partner supports USB data */
-	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) & UCSI_CONSTAT_PARTNER_FLAG_USB))
+	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status) & UCSI_CONSTAT_PARTNER_FLAG_USB))
 		u_role = USB_ROLE_NONE;
 
 	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
@@ -1663,15 +1660,13 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		ret = 0;
 	}
 
-	if (con->partner &&
-	    UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
-	    UCSI_CONSTAT_PWR_OPMODE_PD) {
+	if (con->partner && UCSI_CONSTAT_PWR_OPMODE(con->status) == UCSI_CONSTAT_PWR_OPMODE_PD) {
 		ucsi_register_device_pdos(con);
 		ucsi_get_src_pdos(con);
 		ucsi_check_altmodes(con);
 	}
 
-	trace_ucsi_register_port(con->num, &con->status);
+	trace_ucsi_register_port(con->num, con->status);
 
 out:
 	fwnode_handle_put(cap->fwnode);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 63cc7f982663..dfbc0f6c1b9b 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -4,6 +4,7 @@
 #define __DRIVER_USB_TYPEC_UCSI_H
 
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/power_supply.h>
@@ -312,48 +313,55 @@ struct ucsi_cable_property {
 } __packed;
 
 /* Data structure filled by PPM in response to GET_CONNECTOR_STATUS command. */
-struct ucsi_connector_status {
-	u16 change;
-#define UCSI_CONSTAT_EXT_SUPPLY_CHANGE		BIT(1)
-#define UCSI_CONSTAT_POWER_OPMODE_CHANGE	BIT(2)
-#define UCSI_CONSTAT_PDOS_CHANGE		BIT(5)
-#define UCSI_CONSTAT_POWER_LEVEL_CHANGE		BIT(6)
-#define UCSI_CONSTAT_PD_RESET_COMPLETE		BIT(7)
-#define UCSI_CONSTAT_CAM_CHANGE			BIT(8)
-#define UCSI_CONSTAT_BC_CHANGE			BIT(9)
-#define UCSI_CONSTAT_PARTNER_CHANGE		BIT(11)
-#define UCSI_CONSTAT_POWER_DIR_CHANGE		BIT(12)
-#define UCSI_CONSTAT_CONNECT_CHANGE		BIT(14)
-#define UCSI_CONSTAT_ERROR			BIT(15)
-	u16 flags;
-#define UCSI_CONSTAT_PWR_OPMODE(_f_)		((_f_) & GENMASK(2, 0))
+#define UCSI_CONSTAT_CHANGE(status)		UCSI_FIELD(status, 0, 16)
+#define   UCSI_CONSTAT_EXT_SUPPLY_CHANGE	BIT(1)
+#define   UCSI_CONSTAT_POWER_OPMODE_CHANGE	BIT(2)
+#define   UCSI_CONSTAT_PDOS_CHANGE		BIT(5)
+#define   UCSI_CONSTAT_POWER_LEVEL_CHANGE	BIT(6)
+#define   UCSI_CONSTAT_PD_RESET_COMPLETE	BIT(7)
+#define   UCSI_CONSTAT_CAM_CHANGE		BIT(8)
+#define   UCSI_CONSTAT_BC_CHANGE		BIT(9)
+#define   UCSI_CONSTAT_PARTNER_CHANGE		BIT(11)
+#define   UCSI_CONSTAT_POWER_DIR_CHANGE		BIT(12)
+#define   UCSI_CONSTAT_CONNECT_CHANGE		BIT(14)
+#define   UCSI_CONSTAT_ERROR			BIT(15)
+#define UCSI_CONSTAT_PWR_OPMODE(status)		UCSI_FIELD(status, 16, 3)
 #define   UCSI_CONSTAT_PWR_OPMODE_NONE		0
 #define   UCSI_CONSTAT_PWR_OPMODE_DEFAULT	1
 #define   UCSI_CONSTAT_PWR_OPMODE_BC		2
 #define   UCSI_CONSTAT_PWR_OPMODE_PD		3
 #define   UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5	4
 #define   UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0	5
-#define UCSI_CONSTAT_CONNECTED			BIT(3)
-#define UCSI_CONSTAT_PWR_DIR			BIT(4)
-#define UCSI_CONSTAT_PARTNER_FLAGS(_f_)		(((_f_) & GENMASK(12, 5)) >> 5)
+#define UCSI_CONSTAT_CONNECTED(status)		UCSI_FIELD(status, 19, 1)
+#define UCSI_CONSTAT_PWR_DIR(status)		UCSI_FIELD(status, 20, 1)
+#define UCSI_CONSTAT_PARTNER_FLAGS(status)	UCSI_FIELD(status, 21, 8)
 #define   UCSI_CONSTAT_PARTNER_FLAG_USB		1
 #define   UCSI_CONSTAT_PARTNER_FLAG_ALT_MODE	2
-#define UCSI_CONSTAT_PARTNER_TYPE(_f_)		(((_f_) & GENMASK(15, 13)) >> 13)
+#define UCSI_CONSTAT_PARTNER_TYPE(status)	UCSI_FIELD(status, 29, 3)
 #define   UCSI_CONSTAT_PARTNER_TYPE_DFP		1
 #define   UCSI_CONSTAT_PARTNER_TYPE_UFP		2
-#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE	3 /* Powered Cable */
-#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP	4 /* Powered Cable */
+#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE	3   /* Powered Cable */
+#define   UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP 4 /* Powered Cable */
 #define   UCSI_CONSTAT_PARTNER_TYPE_DEBUG	5
 #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO	6
-	u32 request_data_obj;
-
-	u8 pwr_status;
-#define UCSI_CONSTAT_BC_STATUS(_p_)		((_p_) & GENMASK(1, 0))
+#define UCSI_CONSTAT_RDO(status)		UCSI_FIELD(status, 32, 32)
+#define UCSI_CONSTAT_BC_STATUS(status)		UCSI_FIELD(status, 64, 2)
 #define   UCSI_CONSTAT_BC_NOT_CHARGING		0
 #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING	1
 #define   UCSI_CONSTAT_BC_SLOW_CHARGING		2
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
-} __packed;
+#define UCSI_CONSTAT_PD_VERSION(status)		UCSI_FIELD(status, 70, 16)
+
+/*
+ * UCSI specific wrapper for FIELD_GET() that allows access to fields beyond
+ * 64-bits.
+ */
+#define UCSI_FIELD(data, offset, size)					\
+	({								\
+		u8 m = ((offset) % 8);					\
+		FIELD_GET((GENMASK((m + ((size) - 1)), m)),		\
+			  (*((u32 *)(&((u8 *)data)[((offset) / 8)]))));	\
+	})
 
 /* -------------------------------------------------------------------------- */
 
@@ -433,7 +441,7 @@ struct ucsi_connector {
 
 	struct typec_capability typec_cap;
 
-	struct ucsi_connector_status status;
+	u8 status[19];
 	struct ucsi_connector_capability cap;
 	struct ucsi_cable_property cable_prop;
 	struct power_supply *psy;
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 7a5dff8d9cc6..41158620f4da 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -143,7 +143,6 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	struct ucsi_connector_status *status;
 	int ret;
 
 	ret = ucsi_acpi_read_message_in(ucsi, val, val_len);
@@ -152,11 +151,9 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 
 	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
 	    ua->check_bogus_event) {
-		status = (struct ucsi_connector_status *)val;
-
 		/* Clear the bogus change */
-		if (status->change == bogus_change)
-			status->change = 0;
+		if (UCSI_CONSTAT_CHANGE(val) == bogus_change)
+			*(u16 *)val = 0;
 
 		ua->check_bogus_event = false;
 	}
-- 
2.45.2


