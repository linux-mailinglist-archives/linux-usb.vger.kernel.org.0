Return-Path: <linux-usb+bounces-25261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F1AED1EB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 02:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AD23B0214
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 00:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E2A12E7F;
	Mon, 30 Jun 2025 00:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgoTnzWU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08751522A
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 00:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751242565; cv=none; b=ij9bBE913fXzcBg6K6MCVXGlOLC0T7ir+hTest7lFHBW+k2ytJYWM7Zo78/JeGaRcZ+fu9pE87jyf+t8PK/XnefTRZD5EUQSAN2ZgaODMZAM3HVqF3FWMAyBsOVC/j4hRdx2EldBBl+4Hjq3MBluK49kF5aCLKWhXph8o65TrkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751242565; c=relaxed/simple;
	bh=rcPRyg4dELcqfUyQci4hUuqNJP7NR3NJIrkkJqfbWDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SpvZ0T/UbBB9X9mXqWPCVv1Z7RwNpUun2cn9JflXVrr9KWPkYGiJMyejfrLhacaOd9fUu40txsE6iybdj2S90gCeIfawstFMByqPj/NmMD/v16JsmvzuKfXtxNi2Oa/mCcNqImziDFWk31/76rYLwHy6fRb7ylqGHTMSVvAIB4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgoTnzWU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751242562; x=1782778562;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rcPRyg4dELcqfUyQci4hUuqNJP7NR3NJIrkkJqfbWDM=;
  b=WgoTnzWUWUu4/0mABUEYweJwK9jA3n9omeOPQYKWy8CabsyMRC/3WZfD
   EMV3vshS0GENjvXblo6bEng7kEWuxT3YJekZASZ607M3uECGcS9WmL49P
   2Z4wsjHyNwYIT//O6wCJloC4G19Fdm8rHXIAjiHcKKyA+zefVFUkNHOeD
   zjUPqK0QRrhIIToWGkPmeepkVKKn1MQmr+ntJfot9WuqoK9arMJr+m29H
   MDinuoSwFl3GzXliQOK0OLjWiGOlguNE0B0G13mRyjZilPM5jx6TZ4xA+
   VkmITCvkmmrl8q+4rDHNaGfQSNRKT3mGbgwK+Ika0GehIJRnUxewuV5Bd
   A==;
X-CSE-ConnectionGUID: 8YLT55NSQVuVhtvqzhPSYA==
X-CSE-MsgGUID: lMDFH4/jRnmfh6Tza7THzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64155678"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="64155678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 17:16:01 -0700
X-CSE-ConnectionGUID: BmK2QDaIThWIy7YUa2ZsgQ==
X-CSE-MsgGUID: nHZ+e0XFQwCwUwzGDhLhFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153611714"
Received: from venkat-lin-vm.fm.intel.com ([10.80.128.171])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jun 2025 17:16:01 -0700
From: Venkat Jayaraman <venkat.jayaraman@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	venkat.jayaraman@intel.com,
	pse.type-c.linux@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: ucsi: Add support for READ_POWER_LEVEL command
Date: Sun, 29 Jun 2025 17:15:56 -0700
Message-Id: <20250630001556.651826-1-venkat.jayaraman@intel.com>
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

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 34 ++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c    | 16 +++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h    | 13 ++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 92ebf1a2defd..aa7a0f5c197a 100644
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
@@ -89,6 +117,12 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
 	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
 	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
+	debugfs_create_file("peak_current", 0400,
+			    ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
+	debugfs_create_file("avg_current", 0400,
+			    ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
+	debugfs_create_file("vbus_voltage", 0400,
+			    ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..8e0f0289a11a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1218,9 +1218,11 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
+	u8  curr_scale, volt_scale;
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


