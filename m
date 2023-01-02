Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F5E65AD66
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jan 2023 07:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjABGPf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Jan 2023 01:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjABGPe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Jan 2023 01:15:34 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F0025C6
        for <linux-usb@vger.kernel.org>; Sun,  1 Jan 2023 22:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672640132; x=1704176132;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YOTzHULBqFb3mHrl9MHt54dspJImzJXBEDv8u/5XsM8=;
  b=G06N040YsM+OTcH0t/QUvcj+sSl8BJlinSXg2wztTWs8jFsPrcPxoCpo
   cLOi1sFKPAkWcz5nzNNwsTEBSUGw3p3TWCJDkFKSlPaFLRHAZ85jgfYks
   nIhoM8mMttrl+YX1x2+zGOUX++JDFMwWpKvkAhi0TbB/F9mwkrRg8TE+7
   7vi8/WGjEavMWhjEG6v7aMKqSLGnFx3TpjhtJ/ij7fPiY6moNxsRdVBcG
   Zixd5Qag9/UJXx4Jd4FGIHFrqODNLcTfdWUGKkXhZjfPwAt6vfeeqy/ZK
   xmmdzaJdbPvJzw+mnk+VmbhIaFZ6vuxmkKRWv6BZKYL/5cwlFony7C/o/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="309209070"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="309209070"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2023 22:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="656394091"
X-IronPort-AV: E=Sophos;i="5.96,293,1665471600"; 
   d="scan'208";a="656394091"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.107.70])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jan 2023 22:15:29 -0800
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        Saranya Gopal <saranya.gopal@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: [PATCH] usb: typec: ucsi: Register USB Power Delivery Capabilities
Date:   Mon,  2 Jan 2023 11:51:08 +0530
Message-Id: <20230102062108.838423-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UCSI allows the USB PD capabilities to be read with the GET_PDO
command. This will register those capabilities and make them
visible to user space.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Co-developed-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 163 +++++++++++++++++++++++++++++++---
 drivers/usb/typec/ucsi/ucsi.h |   8 ++
 2 files changed, 158 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index eabe519013e7..d04809476f71 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -562,8 +562,9 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	}
 }
 
-static int ucsi_get_pdos(struct ucsi_connector *con, int is_partner,
-			 u32 *pdos, int offset, int num_pdos)
+static int ucsi_read_pdos(struct ucsi_connector *con,
+			  enum typec_role role, int is_partner,
+			  u32 *pdos, int offset, int num_pdos)
 {
 	struct ucsi *ucsi = con->ucsi;
 	u64 command;
@@ -573,7 +574,7 @@ static int ucsi_get_pdos(struct ucsi_connector *con, int is_partner,
 	command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
 	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
-	command |= UCSI_GET_PDOS_SRC_PDOS;
+	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
 	ret = ucsi_send_command(ucsi, command, pdos + offset,
 				num_pdos * sizeof(u32));
 	if (ret < 0 && ret != -ETIMEDOUT)
@@ -582,30 +583,43 @@ static int ucsi_get_pdos(struct ucsi_connector *con, int is_partner,
 	return ret;
 }
 
-static int ucsi_get_src_pdos(struct ucsi_connector *con)
+static int ucsi_get_pdos(struct ucsi_connector *con, enum typec_role role,
+			 int is_partner, u32 *pdos)
 {
+	u8 num_pdos;
 	int ret;
 
 	/* UCSI max payload means only getting at most 4 PDOs at a time */
-	ret = ucsi_get_pdos(con, 1, con->src_pdos, 0, UCSI_MAX_PDOS);
+	ret = ucsi_read_pdos(con, role, is_partner, pdos, 0, UCSI_MAX_PDOS);
 	if (ret < 0)
 		return ret;
 
-	con->num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
-	if (con->num_pdos < UCSI_MAX_PDOS)
-		return 0;
+	num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
+	if (num_pdos < UCSI_MAX_PDOS)
+		return num_pdos;
 
 	/* get the remaining PDOs, if any */
-	ret = ucsi_get_pdos(con, 1, con->src_pdos, UCSI_MAX_PDOS,
-			    PDO_MAX_OBJECTS - UCSI_MAX_PDOS);
+	ret = ucsi_read_pdos(con, role, is_partner, pdos, UCSI_MAX_PDOS,
+			     PDO_MAX_OBJECTS - UCSI_MAX_PDOS);
 	if (ret < 0)
 		return ret;
 
-	con->num_pdos += ret / sizeof(u32);
+	return ret / sizeof(u32) + num_pdos;
+}
+
+static int ucsi_get_src_pdos(struct ucsi_connector *con)
+{
+	int ret;
+
+	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 1, con->src_pdos);
+	if (ret < 0)
+		return ret;
+
+	con->num_pdos = ret;
 
 	ucsi_port_psy_changed(con);
 
-	return 0;
+	return ret;
 }
 
 static int ucsi_check_altmodes(struct ucsi_connector *con)
@@ -630,6 +644,72 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 	return ret;
 }
 
+static int ucsi_register_partner_pdos(struct ucsi_connector *con)
+{
+	struct usb_power_delivery_desc desc = { con->ucsi->cap.pd_version };
+	struct usb_power_delivery_capabilities_desc caps;
+	struct usb_power_delivery_capabilities *cap;
+	int ret;
+
+	if (con->partner_pd)
+		return 0;
+
+	con->partner_pd = usb_power_delivery_register(NULL, &desc);
+	if (IS_ERR(con->partner_pd))
+		return PTR_ERR(con->partner_pd);
+
+	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 1, caps.pdo);
+	if (ret > 0) {
+		if (ret < PDO_MAX_OBJECTS)
+			caps.pdo[ret] = 0;
+
+		caps.role = TYPEC_SOURCE;
+		cap = usb_power_delivery_register_capabilities(con->partner_pd, &caps);
+		if (IS_ERR(cap))
+			return PTR_ERR(cap);
+
+		con->partner_source_caps = cap;
+
+		ret = typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
+		if (ret) {
+			usb_power_delivery_unregister_capabilities(con->partner_source_caps);
+			return ret;
+		}
+	}
+
+	ret = ucsi_get_pdos(con, TYPEC_SINK, 1, caps.pdo);
+	if (ret > 0) {
+		if (ret < PDO_MAX_OBJECTS)
+			caps.pdo[ret] = 0;
+
+		caps.role = TYPEC_SINK;
+
+		cap = usb_power_delivery_register_capabilities(con->partner_pd, &caps);
+		if (IS_ERR(cap))
+			return PTR_ERR(cap);
+
+		con->partner_sink_caps = cap;
+
+		ret = typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
+		if (ret) {
+			usb_power_delivery_unregister_capabilities(con->partner_sink_caps);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void ucsi_unregister_partner_pdos(struct ucsi_connector *con)
+{
+	usb_power_delivery_unregister_capabilities(con->partner_sink_caps);
+	con->partner_sink_caps = NULL;
+	usb_power_delivery_unregister_capabilities(con->partner_source_caps);
+	con->partner_source_caps = NULL;
+	usb_power_delivery_unregister(con->partner_pd);
+	con->partner_pd = NULL;
+}
+
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
 	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
@@ -638,6 +718,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
 		ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
 		ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
+		ucsi_partner_task(con, ucsi_register_partner_pdos, 1, HZ);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
 		con->rdo = 0;
@@ -696,6 +777,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 	if (!con->partner)
 		return;
 
+	ucsi_unregister_partner_pdos(con);
 	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
 	typec_unregister_partner(con->partner);
 	con->partner = NULL;
@@ -800,6 +882,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
+
+			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
+			    UCSI_CONSTAT_PWR_OPMODE_PD)
+				ucsi_partner_task(con, ucsi_register_partner_pdos, 1, HZ);
 		} else {
 			ucsi_unregister_partner(con);
 		}
@@ -1036,6 +1122,9 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 
 static int ucsi_register_port(struct ucsi *ucsi, int index)
 {
+	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version};
+	struct usb_power_delivery_capabilities_desc pd_caps;
+	struct usb_power_delivery_capabilities *pd_cap;
 	struct ucsi_connector *con = &ucsi->connector[index];
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
@@ -1114,6 +1203,41 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		goto out;
 	}
 
+	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
+
+	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 0, pd_caps.pdo);
+	if (ret > 0) {
+		if (ret < PDO_MAX_OBJECTS)
+			pd_caps.pdo[ret] = 0;
+
+		pd_caps.role = TYPEC_SOURCE;
+		pd_cap = usb_power_delivery_register_capabilities(con->pd, &pd_caps);
+		if (IS_ERR(pd_cap)) {
+			ret = PTR_ERR(pd_cap);
+			goto out;
+		}
+
+		con->port_source_caps = pd_cap;
+		typec_port_set_usb_power_delivery(con->port, con->pd);
+	}
+
+	memset(&pd_caps, 0, sizeof(pd_caps));
+	ret = ucsi_get_pdos(con, TYPEC_SINK, 0, pd_caps.pdo);
+	if (ret > 0) {
+		if (ret < PDO_MAX_OBJECTS)
+			pd_caps.pdo[ret] = 0;
+
+		pd_caps.role = TYPEC_SINK;
+		pd_cap = usb_power_delivery_register_capabilities(con->pd, &pd_caps);
+		if (IS_ERR(pd_cap)) {
+			ret = PTR_ERR(pd_cap);
+			goto out;
+		}
+
+		con->port_sink_caps = pd_cap;
+		typec_port_set_usb_power_delivery(con->port, con->pd);
+	}
+
 	/* Alternate modes */
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
 	if (ret) {
@@ -1152,8 +1276,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 		typec_set_pwr_role(con->port,
 				  !!(con->status.flags & UCSI_CONSTAT_PWR_DIR));
-		ucsi_pwr_opmode_change(con);
 		ucsi_register_partner(con);
+		ucsi_pwr_opmode_change(con);
 		ucsi_port_psy_changed(con);
 	}
 
@@ -1259,6 +1383,13 @@ static int ucsi_init(struct ucsi *ucsi)
 		ucsi_unregister_port_psy(con);
 		if (con->wq)
 			destroy_workqueue(con->wq);
+
+		usb_power_delivery_unregister_capabilities(con->port_sink_caps);
+		con->port_sink_caps = NULL;
+		usb_power_delivery_unregister_capabilities(con->port_source_caps);
+		con->port_source_caps = NULL;
+		usb_power_delivery_unregister(con->pd);
+		con->pd = NULL;
 		typec_unregister_port(con->port);
 		con->port = NULL;
 	}
@@ -1422,6 +1553,12 @@ void ucsi_unregister(struct ucsi *ucsi)
 		ucsi_unregister_port_psy(&ucsi->connector[i]);
 		if (ucsi->connector[i].wq)
 			destroy_workqueue(ucsi->connector[i].wq);
+		usb_power_delivery_unregister_capabilities(ucsi->connector[i].port_sink_caps);
+		ucsi->connector[i].port_sink_caps = NULL;
+		usb_power_delivery_unregister_capabilities(ucsi->connector[i].port_source_caps);
+		ucsi->connector[i].port_source_caps = NULL;
+		usb_power_delivery_unregister(ucsi->connector[i].pd);
+		ucsi->connector[i].pd = NULL;
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c968474ee547..e2191e37be12 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -339,6 +339,14 @@ struct ucsi_connector {
 	u32 src_pdos[PDO_MAX_OBJECTS];
 	int num_pdos;
 
+	/* USB PD objects */
+	struct usb_power_delivery *pd;
+	struct usb_power_delivery_capabilities *port_source_caps;
+	struct usb_power_delivery_capabilities *port_sink_caps;
+	struct usb_power_delivery *partner_pd;
+	struct usb_power_delivery_capabilities *partner_source_caps;
+	struct usb_power_delivery_capabilities *partner_sink_caps;
+
 	struct usb_role_switch *usb_role_sw;
 };
 
-- 
2.25.1

