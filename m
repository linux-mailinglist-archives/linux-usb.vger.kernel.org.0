Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503E9BEF47
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 12:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfIZKHj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 06:07:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:2189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfIZKHi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 06:07:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 03:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="203825699"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 03:07:37 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 07/14] usb: typec: Remove the callback members from struct typec_capability
Date:   Thu, 26 Sep 2019 13:07:25 +0300
Message-Id: <20190926100727.71117-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are no more users for them.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 65 +++++++++++++--------------------------
 include/linux/usb/typec.h | 17 ----------
 2 files changed, 22 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 542be63795db..58e83fc54aa6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -58,7 +58,6 @@ struct typec_port {
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
 
-	const struct typec_capability	*cap;
 	const struct typec_operations	*ops;
 };
 
@@ -970,19 +969,15 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	if (port->ops && port->ops->try_role) {
-		ret = port->ops->try_role(port, role);
-		if (ret)
-			return ret;
-	} else if (port->cap && port->cap->try_role) {
-		ret = port->cap->try_role(port->cap, role);
-		if (ret)
-			return ret;
-	} else {
+	if (!port->ops || !port->ops->try_role) {
 		dev_dbg(dev, "Setting preferred role not supported\n");
 		return -EOPNOTSUPP;
 	}
 
+	ret = port->ops->try_role(port, role);
+	if (ret)
+		return ret;
+
 	port->prefer_role = role;
 	return size;
 }
@@ -1020,20 +1015,16 @@ static ssize_t data_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	if (port->ops && port->ops->dr_set) {
-		ret = port->ops->dr_set(port, ret);
-		if (ret)
-			goto unlock_and_ret;
-	} else if (port->cap && port->cap->dr_set) {
-		ret = port->cap->dr_set(port->cap, ret);
-		if (ret)
-			goto unlock_and_ret;
-	} else {
+	if (!port->ops || !port->ops->dr_set) {
 		dev_dbg(dev, "data role swapping not supported\n");
 		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
 	}
 
+	ret = port->ops->dr_set(port, ret);
+	if (ret)
+		goto unlock_and_ret;
+
 	ret = size;
 unlock_and_ret:
 	mutex_unlock(&port->port_type_lock);
@@ -1082,21 +1073,17 @@ static ssize_t power_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	if (port->ops && port->ops->pr_set) {
-		ret = port->ops->pr_set(port, ret);
-		if (ret)
-			goto unlock_and_ret;
-	} else if (port->cap && port->cap->pr_set) {
-		ret = port->cap->pr_set(port->cap, ret);
-		if (ret)
-			goto unlock_and_ret;
-	} else {
+	if (!port->ops || !port->ops->pr_set) {
 		dev_dbg(dev, "power role swapping not supported\n");
 		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
 	}
 	ret = size;
 
+	ret = port->ops->pr_set(port, ret);
+	if (ret)
+		goto unlock_and_ret;
+
 unlock_and_ret:
 	mutex_unlock(&port->port_type_lock);
 	return ret;
@@ -1124,7 +1111,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	enum typec_port_type type;
 
 	if ((!port->ops || !port->ops->port_type_set) ||
-	    !port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
+	    port->fixed_role != TYPEC_PORT_DRP) {
 		dev_dbg(dev, "changing port type not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1141,10 +1128,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_and_ret;
 	}
 
-	if (port->ops && port->ops->port_type_set)
-		ret = port->ops->port_type_set(port, type);
-	else
-		ret = port->cap->port_type_set(port->cap, type);
+	ret = port->ops->port_type_set(port, type);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1204,19 +1188,15 @@ static ssize_t vconn_source_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (port->ops && port->ops->vconn_set) {
-		ret = port->ops->vconn_set(port, source);
-		if (ret)
-			return ret;
-	} else if (port->cap && port->cap->vconn_set) {
-		ret = port->cap->vconn_set(port->cap, (enum typec_role)source);
-		if (ret)
-			return ret;
-	} else {
+	if (!port->ops || !port->ops->vconn_set) {
 		dev_dbg(dev, "VCONN swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
 
+	ret = port->ops->vconn_set(port, source);
+	if (ret)
+		return ret;
+
 	return size;
 }
 
@@ -1619,7 +1599,6 @@ struct typec_port *typec_register_port(struct device *parent,
 	mutex_init(&port->port_type_lock);
 
 	port->id = id;
-	port->cap = cap;
 	port->ops = cap->ops;
 	port->port_type = cap->type;
 	port->fixed_role = cap->type;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 6c95a9ff43c6..e759668f8af9 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -197,11 +197,6 @@ struct typec_operations {
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @ops: Port operations vector
- * @try_role: Set data role preference for DRP port
- * @dr_set: Set Data Role
- * @pr_set: Set Power Role
- * @vconn_set: Set VCONN Role
- * @port_type_set: Set port type
  *
  * Static capabilities of a single USB Type-C port.
  */
@@ -219,18 +214,6 @@ struct typec_capability {
 	void			*driver_data;
 
 	const struct typec_operations	*ops;
-
-	int		(*try_role)(const struct typec_capability *,
-				    int role);
-
-	int		(*dr_set)(const struct typec_capability *,
-				  enum typec_data_role);
-	int		(*pr_set)(const struct typec_capability *,
-				  enum typec_role);
-	int		(*vconn_set)(const struct typec_capability *,
-				     enum typec_role);
-	int		(*port_type_set)(const struct typec_capability *,
-					 enum typec_port_type);
 };
 
 /* Specific to try_role(). Indicates the user want's to clear the preference. */
-- 
2.23.0

