Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B606D445C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 17:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfJKPcf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 11:32:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:33457 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbfJKPcf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 11:32:35 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 08:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="207450441"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2019 08:32:21 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v4 1/9] usb: typec: Copy everything from struct typec_capability during registration
Date:   Fri, 11 Oct 2019 18:32:11 +0300
Message-Id: <20191011153219.35701-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
References: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Copying everything from struct typec_capability to struct
typec_port during port registration. This will make sure
that under no circumstances the driver can change the values
in the struct typec_capability that the port uses.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 94a3eda62add..7749933ffce5 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -52,6 +52,7 @@ struct typec_port {
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
 
+	const struct typec_capability	*orig_cap; /* to be removed */
 	const struct typec_capability	*cap;
 };
 
@@ -968,7 +969,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	ret = port->cap->try_role(port->cap, role);
+	ret = port->cap->try_role(port->orig_cap, role);
 	if (ret)
 		return ret;
 
@@ -1014,7 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->dr_set(port->cap, ret);
+	ret = port->cap->dr_set(port->orig_cap, ret);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1071,7 +1072,7 @@ static ssize_t power_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->pr_set(port->cap, ret);
+	ret = port->cap->pr_set(port->orig_cap, ret);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1119,7 +1120,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->port_type_set(port->cap, type);
+	ret = port->cap->port_type_set(port->orig_cap, type);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1184,7 +1185,7 @@ static ssize_t vconn_source_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
+	ret = port->cap->vconn_set(port->orig_cap, (enum typec_role)source);
 	if (ret)
 		return ret;
 
@@ -1278,6 +1279,7 @@ static void typec_release(struct device *dev)
 	ida_destroy(&port->mode_ids);
 	typec_switch_put(port->sw);
 	typec_mux_put(port->mux);
+	kfree(port->cap);
 	kfree(port);
 }
 
@@ -1579,7 +1581,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	mutex_init(&port->port_type_lock);
 
 	port->id = id;
-	port->cap = cap;
+	port->orig_cap = cap;
 	port->port_type = cap->type;
 	port->prefer_role = cap->prefer_role;
 
@@ -1590,6 +1592,12 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->dev.type = &typec_port_dev_type;
 	dev_set_name(&port->dev, "port%d", id);
 
+	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
+	if (!port->cap) {
+		put_device(&port->dev);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	port->sw = typec_switch_get(&port->dev);
 	if (IS_ERR(port->sw)) {
 		put_device(&port->dev);
-- 
2.23.0

