Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D05BEF41
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfIZKHd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 06:07:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:2189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfIZKHd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 06:07:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 03:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="203825684"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 03:07:31 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 03/14] usb: typec: Separate the operations vector
Date:   Thu, 26 Sep 2019 13:07:21 +0300
Message-Id: <20190926100727.71117-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
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
---
 drivers/usb/typec/class.c | 90 +++++++++++++++++++++++++--------------
 include/linux/usb/typec.h | 19 +++++++++
 2 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9fab0be8f08c..542be63795db 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -59,6 +59,7 @@ struct typec_port {
 	struct typec_mux		*mux;
 
 	const struct typec_capability	*cap;
+	const struct typec_operations	*ops;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
@@ -961,11 +962,6 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->try_role) {
-		dev_dbg(dev, "Setting preferred role not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	role = sysfs_match_string(typec_roles, buf);
 	if (role < 0) {
 		if (sysfs_streq(buf, "none"))
@@ -974,9 +970,18 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	ret = port->cap->try_role(port->cap, role);
-	if (ret)
-		return ret;
+	if (port->ops && port->ops->try_role) {
+		ret = port->ops->try_role(port, role);
+		if (ret)
+			return ret;
+	} else if (port->cap && port->cap->try_role) {
+		ret = port->cap->try_role(port->cap, role);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(dev, "Setting preferred role not supported\n");
+		return -EOPNOTSUPP;
+	}
 
 	port->prefer_role = role;
 	return size;
@@ -1005,11 +1010,6 @@ static ssize_t data_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->cap->dr_set) {
-		dev_dbg(dev, "data role swapping not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = sysfs_match_string(typec_data_roles, buf);
 	if (ret < 0)
 		return ret;
@@ -1020,9 +1020,19 @@ static ssize_t data_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->dr_set(port->cap, ret);
-	if (ret)
+	if (port->ops && port->ops->dr_set) {
+		ret = port->ops->dr_set(port, ret);
+		if (ret)
+			goto unlock_and_ret;
+	} else if (port->cap && port->cap->dr_set) {
+		ret = port->cap->dr_set(port->cap, ret);
+		if (ret)
+			goto unlock_and_ret;
+	} else {
+		dev_dbg(dev, "data role swapping not supported\n");
+		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
+	}
 
 	ret = size;
 unlock_and_ret:
@@ -1055,11 +1065,6 @@ static ssize_t power_role_store(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->pr_set) {
-		dev_dbg(dev, "power role swapping not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (port->pwr_opmode != TYPEC_PWR_MODE_PD) {
 		dev_dbg(dev, "partner unable to swap power role\n");
 		return -EIO;
@@ -1077,11 +1082,21 @@ static ssize_t power_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->pr_set(port->cap, ret);
-	if (ret)
+	if (port->ops && port->ops->pr_set) {
+		ret = port->ops->pr_set(port, ret);
+		if (ret)
+			goto unlock_and_ret;
+	} else if (port->cap && port->cap->pr_set) {
+		ret = port->cap->pr_set(port->cap, ret);
+		if (ret)
+			goto unlock_and_ret;
+	} else {
+		dev_dbg(dev, "power role swapping not supported\n");
+		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
-
+	}
 	ret = size;
+
 unlock_and_ret:
 	mutex_unlock(&port->port_type_lock);
 	return ret;
@@ -1108,7 +1123,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	int ret;
 	enum typec_port_type type;
 
-	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
+	if ((!port->ops || !port->ops->port_type_set) ||
+	    !port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
 		dev_dbg(dev, "changing port type not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1125,7 +1141,10 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_and_ret;
 	}
 
-	ret = port->cap->port_type_set(port->cap, type);
+	if (port->ops && port->ops->port_type_set)
+		ret = port->ops->port_type_set(port, type);
+	else
+		ret = port->cap->port_type_set(port->cap, type);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1181,18 +1200,22 @@ static ssize_t vconn_source_store(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->vconn_set) {
-		dev_dbg(dev, "VCONN swapping not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = kstrtobool(buf, &source);
 	if (ret)
 		return ret;
 
-	ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
-	if (ret)
-		return ret;
+	if (port->ops && port->ops->vconn_set) {
+		ret = port->ops->vconn_set(port, source);
+		if (ret)
+			return ret;
+	} else if (port->cap && port->cap->vconn_set) {
+		ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
+		if (ret)
+			return ret;
+	} else {
+		dev_dbg(dev, "VCONN swapping not supported\n");
+		return -EOPNOTSUPP;
+	}
 
 	return size;
 }
@@ -1597,6 +1620,7 @@ struct typec_port *typec_register_port(struct device *parent,
 
 	port->id = id;
 	port->cap = cap;
+	port->ops = cap->ops;
 	port->port_type = cap->type;
 	port->fixed_role = cap->type;
 	port->port_roles = cap->data;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 8b90cd77331c..6c95a9ff43c6 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -168,6 +168,22 @@ struct typec_partner_desc {
 	struct usb_pd_identity	*identity;
 };
 
+/*
+ * struct typec_operations - USB Type-C Port Operations
+ * @try_role: Set data role preference for DRP port
+ * @dr_set: Set Data Role
+ * @pr_set: Set Power Role
+ * @vconn_set: Source VCONN
+ * @port_type_set: Set port type
+ */
+struct typec_operations {
+	int (*try_role)(struct typec_port *port, int role);
+	int (*dr_set)(struct typec_port *port, enum typec_data_role);
+	int (*pr_set)(struct typec_port *port, enum typec_role);
+	int (*vconn_set)(struct typec_port *port, bool source);
+	int (*port_type_set)(struct typec_port *port, enum typec_port_type);
+};
+
 /*
  * struct typec_capability - USB Type-C Port Capabilities
  * @type: Supported power role of the port
@@ -180,6 +196,7 @@ struct typec_partner_desc {
  * @mux: Multiplexer switch for Alternate/Accessory Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
+ * @ops: Port operations vector
  * @try_role: Set data role preference for DRP port
  * @dr_set: Set Data Role
  * @pr_set: Set Power Role
@@ -201,6 +218,8 @@ struct typec_capability {
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
 
+	const struct typec_operations	*ops;
+
 	int		(*try_role)(const struct typec_capability *,
 				    int role);
 
-- 
2.23.0

