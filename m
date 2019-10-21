Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2199DEACE
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 13:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfJULZc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 07:25:32 -0400
Received: from mga07.intel.com ([134.134.136.100]:14014 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728417AbfJULZc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 07:25:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 04:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209425736"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2019 04:25:29 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 02/18] usb: typec: Introduce typec_get_drvdata()
Date:   Mon, 21 Oct 2019 14:25:08 +0300
Message-Id: <20191021112524.79550-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Leaving the private driver_data pointer of the port device
to the port drivers.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/class.c | 11 +++++++++++
 include/linux/usb/typec.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 7749933ffce5..51154634c2c0 100644
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
@@ -1591,6 +1601,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->dev.fwnode = cap->fwnode;
 	port->dev.type = &typec_port_dev_type;
 	dev_set_name(&port->dev, "port%d", id);
+	dev_set_drvdata(&port->dev, cap->driver_data);
 
 	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
 	if (!port->cap) {
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

