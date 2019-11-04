Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386AEEE225
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbfKDOYn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:24:43 -0500
Received: from mga02.intel.com ([134.134.136.20]:3680 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728502AbfKDOYn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:24:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212324042"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 06:24:41 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 03/18] usb: typec: Separate the operations vector
Date:   Mon,  4 Nov 2019 17:24:20 +0300
Message-Id: <20191104142435.29960-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Introducing struct typec_operations which has the same
callbacks as struct typec_capability. The old callbacks are
kept for now, but after all users have been converted, they
will be removed.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/class.c | 39 +++++++++++++++++++++++++++++----------
 include/linux/usb/typec.h | 20 ++++++++++++++++++++
 2 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 51154634c2c0..b934a006535a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -54,6 +54,7 @@ struct typec_port {
 
 	const struct typec_capability	*orig_cap; /* to be removed */
 	const struct typec_capability	*cap;
+	const struct typec_operations   *ops;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
@@ -956,7 +957,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->try_role) {
+	if (!port->cap->try_role && (!port->ops || !port->ops->try_role)) {
 		dev_dbg(dev, "Setting preferred role not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -969,7 +970,10 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	ret = port->cap->try_role(port->orig_cap, role);
+	if (port->ops && port->ops->try_role)
+		ret = port->ops->try_role(port, role);
+	else
+		ret = port->cap->try_role(port->orig_cap, role);
 	if (ret)
 		return ret;
 
@@ -1000,7 +1004,7 @@ static ssize_t data_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->cap->dr_set) {
+	if (!port->cap->dr_set && (!port->ops || !port->ops->dr_set)) {
 		dev_dbg(dev, "data role swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1015,7 +1019,10 @@ static ssize_t data_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->dr_set(port->orig_cap, ret);
+	if (port->ops && port->ops->dr_set)
+		ret = port->ops->dr_set(port, ret);
+	else
+		ret = port->cap->dr_set(port->orig_cap, ret);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1050,7 +1057,7 @@ static ssize_t power_role_store(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->pr_set) {
+	if (!port->cap->pr_set && (!port->ops || !port->ops->pr_set)) {
 		dev_dbg(dev, "power role swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1072,7 +1079,10 @@ static ssize_t power_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->pr_set(port->orig_cap, ret);
+	if (port->ops && port->ops->dr_set)
+		ret = port->ops->pr_set(port, ret);
+	else
+		ret = port->cap->pr_set(port->orig_cap, ret);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1103,7 +1113,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	int ret;
 	enum typec_port_type type;
 
-	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
+	if (port->cap->type != TYPEC_PORT_DRP || (!port->cap->port_type_set &&
+	    (!port->ops || !port->ops->port_type_set))) {
 		dev_dbg(dev, "changing port type not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1120,7 +1131,10 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->port_type_set(port->orig_cap, type);
+	if (port->ops && port->ops->port_type_set)
+		ret = port->ops->port_type_set(port, type);
+	else
+		ret = port->cap->port_type_set(port->orig_cap, type);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1176,7 +1190,7 @@ static ssize_t vconn_source_store(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->vconn_set) {
+	if (!port->cap->vconn_set && (!port->ops || !port->ops->vconn_set)) {
 		dev_dbg(dev, "VCONN swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1185,7 +1199,11 @@ static ssize_t vconn_source_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = port->cap->vconn_set(port->orig_cap, (enum typec_role)source);
+	if (port->ops && port->ops->vconn_set)
+		ret = port->ops->vconn_set(port, (enum typec_role)source);
+	else
+		ret = port->cap->vconn_set(port->orig_cap,
+					   (enum typec_role)source);
 	if (ret)
 		return ret;
 
@@ -1591,6 +1609,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	mutex_init(&port->port_type_lock);
 
 	port->id = id;
+	port->ops = cap->ops;
 	port->orig_cap = cap;
 	port->port_type = cap->type;
 	port->prefer_role = cap->prefer_role;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 8b90cd77331c..c9bef128453b 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -168,6 +168,23 @@ struct typec_partner_desc {
 	struct usb_pd_identity	*identity;
 };
 
+/**
+ * struct typec_operations - USB Type-C Port Operations
+ * @try_role: Set data role preference for DRP port
+ * @dr_set: Set Data Role
+ * @pr_set: Set Power Role
+ * @vconn_set: Source VCONN
+ * @port_type_set: Set port type
+ */
+struct typec_operations {
+	int (*try_role)(struct typec_port *port, int role);
+	int (*dr_set)(struct typec_port *port, enum typec_data_role role);
+	int (*pr_set)(struct typec_port *port, enum typec_role role);
+	int (*vconn_set)(struct typec_port *port, enum typec_role role);
+	int (*port_type_set)(struct typec_port *port,
+			     enum typec_port_type type);
+};
+
 /*
  * struct typec_capability - USB Type-C Port Capabilities
  * @type: Supported power role of the port
@@ -180,6 +197,7 @@ struct typec_partner_desc {
  * @mux: Multiplexer switch for Alternate/Accessory Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
+ * @ops: Port operations vector
  * @try_role: Set data role preference for DRP port
  * @dr_set: Set Data Role
  * @pr_set: Set Power Role
@@ -201,6 +219,8 @@ struct typec_capability {
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
 
+	const struct typec_operations	*ops;
+
 	int		(*try_role)(const struct typec_capability *,
 				    int role);
 
-- 
2.24.0.rc1

