Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77737C308E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 11:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfJAJtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 05:49:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:29589 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbfJAJtE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 05:49:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 02:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="205033808"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2019 02:49:02 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/7] usb: typec: Introduce typec_get_drvdata()
Date:   Tue,  1 Oct 2019 12:48:53 +0300
Message-Id: <20191001094858.68643-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
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
index 3835e2d9fba6..9fab0be8f08c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1492,6 +1492,16 @@ EXPORT_SYMBOL_GPL(typec_set_mode);
 
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
@@ -1604,6 +1614,7 @@ struct typec_port *typec_register_port(struct device *parent,
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

