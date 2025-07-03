Return-Path: <linux-usb+bounces-25457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 182BEAF816F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 21:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7320C1C84179
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 19:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854B192580;
	Thu,  3 Jul 2025 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGkREQcQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4D298CC5
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571191; cv=none; b=hUeYrNeoiS+/xWp5oDno4kh6bE7EOEWDZ1e6MBnJgyJqouWpx6vupvf1cYs1BJrWo+GNakY28HPlsXRowBGq1v4n59WdYrKoy9CarjbaNrjp30oLOwfcZt/1K6h/zNi/1JrXU2wW+y5BeVFEZVagHNOrhGFJA8eYMebRlWktxWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571191; c=relaxed/simple;
	bh=HIpYUK0qdP2OgdxUAK6eoys4fd1UzTmDO5wZuuYPaG8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QrbQiXUh6HhXRRsm+pH4svt9aT//HAPUe0PmutUEOCywL881+x6LQqlBy13ovK/PLFt/WJeg0h1LHAYd2Np18NaaUNdUXY6Mkln882BHYQBI0OO46plTIB3Am38m447kLSdBbMPewJg0+Dzcz7ovF6pte0WaWoA+utFzrwC+0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGkREQcQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751571190; x=1783107190;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HIpYUK0qdP2OgdxUAK6eoys4fd1UzTmDO5wZuuYPaG8=;
  b=nGkREQcQhhNrv1IKHhRPxKkchXVvqW/UZvJ/ko6PYhsvQEJkdSYjEi+6
   neoWXfyUZLa9C0/8wOJpysqa0rTpX2+GgcWevXNwpL5roe5jFmfAS56SP
   dDQclNkxkGdc40zpF7FhnymKn8suwnMKUMCDgeRSoLd0pL+RKYZCqmkq9
   +rHbEAH2tUupYzOO3t7I+hVZw+yLqOk4/qijsFQlbCewGOzkrRQhehSu6
   vTVYukQ1tq1vJj7uieTXsry0ZzsaYy44CeGj2Awe6IJSEoI1y4SUeYN+e
   EqzulBck6lV4Uye5cet7+tcP9+RqXd1mQYYLBZQ30xvquwI6gjC2oo3WH
   g==;
X-CSE-ConnectionGUID: kZWW6ih7Q/OProvXBxeyJA==
X-CSE-MsgGUID: 7zQ/ZH+DTBiAmDXHND5eWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65257374"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="65257374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:33:09 -0700
X-CSE-ConnectionGUID: +WUmPlwTTYW6mUcWmrCQKQ==
X-CSE-MsgGUID: Wo9Sc2yQR2m40jKVlMSTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154825287"
Received: from venkat-lin-vm.fm.intel.com ([10.80.128.171])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2025 12:33:09 -0700
From: Venkat Jayaraman <venkat.jayaraman@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	venkat.jayaraman@intel.com,
	pse.type-c.linux@intel.com
Subject: [PATCH v2] usb: typec: ucsi: Add support for READ_POWER_LEVEL command
Date: Thu,  3 Jul 2025 12:32:59 -0700
Message-Id: <20250703193259.760717-1-venkat.jayaraman@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for UCSI READ_POWER_LEVEL command as per
UCSI specification v2.1 and above to debugfs.

Following power related fields will be exposed as files in debugfs:-
peak_current (Peak current),
avg_current (Average current) and
vbus_voltage (VBUS voltage)

These files will be updated either when a READ_POWER_LEVEL
command is sent from OS or when a device is connected.

Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
---
Changelog v2:
- Removed extra space in declaration
- Made the call to debugfs_create_file single line for clarity

 drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 92ebf1a2defd..f73f2b54554e 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -35,6 +35,7 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_SINK_PATH:
 	case UCSI_SET_NEW_CAM:
 	case UCSI_SET_USB:
+	case UCSI_READ_POWER_LEVEL:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
 	case UCSI_GET_CAPABILITY:
@@ -80,6 +81,33 @@ static int ucsi_resp_show(struct seq_file *s, void *not_used)
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_resp);
 
+static int ucsi_peak_curr_show(struct seq_file *m, void *v)
+{
+	struct ucsi *ucsi = m->private;
+
+	seq_printf(m, "%u mA\n", ucsi->connector->peak_current);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ucsi_peak_curr);
+
+static int ucsi_avg_curr_show(struct seq_file *m, void *v)
+{
+	struct ucsi *ucsi = m->private;
+
+	seq_printf(m, "%u mA\n", ucsi->connector->avg_current);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ucsi_avg_curr);
+
+static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
+{
+	struct ucsi *ucsi = m->private;
+
+	seq_printf(m, "%u mV\n", ucsi->connector->vbus_voltage);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ucsi_vbus_volt);
+
 void ucsi_debugfs_register(struct ucsi *ucsi)
 {
 	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
@@ -89,6 +117,9 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
 	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
 	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
+	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
+	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
+	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..89b3ddc3d9ea 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1218,9 +1218,11 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
+	u8 curr_scale, volt_scale;
 	enum typec_role role;
 	u16 change;
 	int ret;
+	u32 val;
 
 	mutex_lock(&con->lock);
 
@@ -1291,6 +1293,20 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (change & UCSI_CONSTAT_BC_CHANGE)
 		ucsi_port_psy_changed(con);
 
+	if (UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
+		curr_scale = UCSI_CONSTAT(con, CURRENT_SCALE_V2_1);
+		volt_scale = UCSI_CONSTAT(con, VOLTAGE_SCALE_V2_1);
+
+		val = UCSI_CONSTAT(con, PEAK_CURRENT_V2_1);
+		con->peak_current = UCSI_CONSTAT_CURR_SCALE_MULT * curr_scale * val;
+
+		val = UCSI_CONSTAT(con, AVG_CURRENT_V2_1);
+		con->avg_current = UCSI_CONSTAT_CURR_SCALE_MULT * curr_scale * val;
+
+		val = UCSI_CONSTAT(con, VBUS_VOLTAGE_V2_1);
+		con->vbus_voltage = UCSI_CONSTAT_VOLT_SCALE_MULT * volt_scale * val;
+	}
+
 out_unlock:
 	mutex_unlock(&con->lock);
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5a8f947fcece..791f031ff276 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -129,6 +129,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_READ_POWER_LEVEL			0x1e
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
 
@@ -357,6 +358,14 @@ struct ucsi_cable_property {
 #define   UCSI_CONSTAT_BC_SLOW_CHARGING		2
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
 #define UCSI_CONSTAT_PD_VERSION_V1_2		UCSI_DECLARE_BITFIELD_V1_2(70, 16)
+#define UCSI_CONSTAT_PWR_READING_READY_V2_1	UCSI_DECLARE_BITFIELD_V2_1(89, 1)
+#define UCSI_CONSTAT_CURRENT_SCALE_V2_1		UCSI_DECLARE_BITFIELD_V2_1(90, 3)
+#define UCSI_CONSTAT_PEAK_CURRENT_V2_1		UCSI_DECLARE_BITFIELD_V2_1(93, 16)
+#define UCSI_CONSTAT_AVG_CURRENT_V2_1		UCSI_DECLARE_BITFIELD_V2_1(109, 16)
+#define UCSI_CONSTAT_VOLTAGE_SCALE_V2_1		UCSI_DECLARE_BITFIELD_V2_1(125, 4)
+#define UCSI_CONSTAT_VBUS_VOLTAGE_V2_1		UCSI_DECLARE_BITFIELD_V2_1(129, 16)
+#define UCSI_CONSTAT_CURR_SCALE_MULT		5
+#define UCSI_CONSTAT_VOLT_SCALE_MULT		5
 
 /* Connector Status Change Bits.  */
 #define UCSI_CONSTAT_EXT_SUPPLY_CHANGE		BIT(1)
@@ -516,6 +525,10 @@ struct ucsi_connector {
 	u32 src_pdos[PDO_MAX_OBJECTS];
 	int num_pdos;
 
+	u32 peak_current;
+	u32 avg_current;
+	u32 vbus_voltage;
+
 	/* USB PD objects */
 	struct usb_power_delivery *pd;
 	struct usb_power_delivery_capabilities *port_source_caps;
-- 
2.34.1


