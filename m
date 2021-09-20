Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD564116D0
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 16:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbhITOZz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 10:25:55 -0400
Received: from mga07.intel.com ([134.134.136.100]:20391 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236270AbhITOZy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 10:25:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286817132"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="286817132"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="612525876"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 07:24:25 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Ulrich Huber <ulrich@huberulrich.de>, linux-usb@vger.kernel.org
Subject: [PATCH 6/7] usb: typec: ucsi: Read the PDOs in separate work
Date:   Mon, 20 Sep 2021 17:24:18 +0300
Message-Id: <20210920142419.54493-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Polling also the PDOs, just like the alt modes.

After this ucsi_handle_connector_change() doesn't execute
any commands.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 188181737acf0..e7267e47c3e4d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -571,7 +571,7 @@ static int ucsi_get_pdos(struct ucsi_connector *con, int is_partner,
 	command |= UCSI_GET_PDOS_SRC_PDOS;
 	ret = ucsi_send_command(ucsi, command, pdos + offset,
 				num_pdos * sizeof(u32));
-	if (ret < 0)
+	if (ret < 0 && ret != -ETIMEDOUT)
 		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
 	if (ret == 0 && offset == 0)
 		dev_warn(ucsi->dev, "UCSI_GET_PDOS returned 0 bytes\n");
@@ -579,26 +579,30 @@ static int ucsi_get_pdos(struct ucsi_connector *con, int is_partner,
 	return ret;
 }
 
-static void ucsi_get_src_pdos(struct ucsi_connector *con, int is_partner)
+static int ucsi_get_src_pdos(struct ucsi_connector *con)
 {
 	int ret;
 
 	/* UCSI max payload means only getting at most 4 PDOs at a time */
 	ret = ucsi_get_pdos(con, 1, con->src_pdos, 0, UCSI_MAX_PDOS);
 	if (ret < 0)
-		return;
+		return ret;
 
 	con->num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
 	if (con->num_pdos < UCSI_MAX_PDOS)
-		return;
+		return 0;
 
 	/* get the remaining PDOs, if any */
 	ret = ucsi_get_pdos(con, 1, con->src_pdos, UCSI_MAX_PDOS,
 			    PDO_MAX_OBJECTS - UCSI_MAX_PDOS);
 	if (ret < 0)
-		return;
+		return ret;
 
 	con->num_pdos += ret / sizeof(u32);
+
+	ucsi_port_psy_changed(con);
+
+	return 0;
 }
 
 static int ucsi_check_altmodes(struct ucsi_connector *con)
@@ -626,7 +630,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		con->rdo = con->status.request_data_obj;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
-		ucsi_get_src_pdos(con, 1);
+		ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
 		ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
@@ -844,12 +848,6 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
-	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
-	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE) {
-		ucsi_pwr_opmode_change(con);
-		ucsi_port_psy_changed(con);
-	}
-
 	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
 		typec_set_pwr_role(con->port, role);
 
@@ -900,6 +898,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 				con->num, u_role);
 	}
 
+	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
+	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
+		ucsi_pwr_opmode_change(con);
+
 	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
 		ucsi_partner_change(con);
 
@@ -1248,8 +1250,10 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ret = 0;
 	}
 
-	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
+	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) == UCSI_CONSTAT_PWR_OPMODE_PD) {
+		ucsi_get_src_pdos(con);
 		ucsi_check_altmodes(con);
+	}
 
 	trace_ucsi_register_port(con->num, &con->status);
 
-- 
2.33.0

