Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB99CF7E8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 13:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbfJHLNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 07:13:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:26010 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729790AbfJHLNz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 07:13:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 04:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; 
   d="scan'208";a="206618905"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2019 04:13:54 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 2/9] usb: typec: Introduce typec_get_drvdata()
Date:   Tue,  8 Oct 2019 14:13:43 +0300
Message-Id: <20191008111350.68581-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
References: <20191008111350.68581-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Leaving the private driver_data pointer of the port device
to the port drivers.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 11 +++++++++++
 include/linux/usb/typec.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0bbf10c8ad58..89ffe370e426 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1488,6 +1488,16 @@ EXPORT_SYMBOL_GPL(typec_set_mode);
 
 /* --------------------------------------- */
 
+/**
+ * typec_get_drvdata - Return private driver data pointer
+ * @port: USB Type-C port
+ */
+void *typec_get_drvdata(struct typec_port *port)
+{
+	return dev_get_drvdata(&port->dev);
+}
+EXPORT_SYMBOL_GPL(typec_get_drvdata);
+
 /**
  * typec_port_register_altmode - Register USB Type-C Port Alternate Mode
  * @port: USB Type-C Port that supports the alternate mode
@@ -1592,6 +1602,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->dev.fwnode = cap->fwnode;
 	port->dev.type = &typec_port_dev_type;
 	dev_set_name(&port->dev, "port%d", id);
+	dev_set_drvdata(&port->dev, cap->driver_data);
 
 	port->sw = typec_switch_get(&port->dev);
 	if (IS_ERR(port->sw)) {
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 7df4ecabc78a..8b90cd77331c 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -179,6 +179,7 @@ struct typec_partner_desc {
  * @sw: Cable plug orientation switch
  * @mux: Multiplexer switch for Alternate/Accessory Modes
  * @fwnode: Optional fwnode of the port
+ * @driver_data: Private pointer for driver specific info
  * @try_role: Set data role preference for DRP port
  * @dr_set: Set Data Role
  * @pr_set: Set Power Role
@@ -198,6 +199,7 @@ struct typec_capability {
 	struct typec_switch	*sw;
 	struct typec_mux	*mux;
 	struct fwnode_handle	*fwnode;
+	void			*driver_data;
 
 	int		(*try_role)(const struct typec_capability *,
 				    int role);
@@ -241,6 +243,8 @@ int typec_set_orientation(struct typec_port *port,
 enum typec_orientation typec_get_orientation(struct typec_port *port);
 int typec_set_mode(struct typec_port *port, int mode);
 
+void *typec_get_drvdata(struct typec_port *port);
+
 int typec_find_port_power_role(const char *name);
 int typec_find_power_role(const char *name);
 int typec_find_port_data_role(const char *name);
-- 
2.23.0

