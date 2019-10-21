Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89567DEAD8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 13:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbfJULZq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 07:25:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:14014 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728455AbfJULZq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Oct 2019 07:25:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 04:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209425785"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2019 04:25:43 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 08/18] usb: typec: Remove the callback members from struct typec_capability
Date:   Mon, 21 Oct 2019 14:25:14 +0300
Message-Id: <20191021112524.79550-9-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are no more users for them.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/class.c | 40 +++++++++++----------------------------
 include/linux/usb/typec.h | 17 -----------------
 2 files changed, 11 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index b934a006535a..7ece6ca6e690 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -52,7 +52,6 @@ struct typec_port {
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
 
-	const struct typec_capability	*orig_cap; /* to be removed */
 	const struct typec_capability	*cap;
 	const struct typec_operations   *ops;
 };
@@ -957,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->try_role && (!port->ops || !port->ops->try_role)) {
+	if (!port->ops || !port->ops->try_role) {
 		dev_dbg(dev, "Setting preferred role not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -970,10 +969,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 	}
 
-	if (port->ops && port->ops->try_role)
-		ret = port->ops->try_role(port, role);
-	else
-		ret = port->cap->try_role(port->orig_cap, role);
+	ret = port->ops->try_role(port, role);
 	if (ret)
 		return ret;
 
@@ -1004,7 +1000,7 @@ static ssize_t data_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->cap->dr_set && (!port->ops || !port->ops->dr_set)) {
+	if (!port->ops || !port->ops->dr_set) {
 		dev_dbg(dev, "data role swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1019,10 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	if (port->ops && port->ops->dr_set)
-		ret = port->ops->dr_set(port, ret);
-	else
-		ret = port->cap->dr_set(port->orig_cap, ret);
+	ret = port->ops->dr_set(port, ret);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1057,7 +1050,7 @@ static ssize_t power_role_store(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->pr_set && (!port->ops || !port->ops->pr_set)) {
+	if (!port->ops || !port->ops->pr_set) {
 		dev_dbg(dev, "power role swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1079,10 +1072,7 @@ static ssize_t power_role_store(struct device *dev,
 		goto unlock_and_ret;
 	}
 
-	if (port->ops && port->ops->dr_set)
-		ret = port->ops->pr_set(port, ret);
-	else
-		ret = port->cap->pr_set(port->orig_cap, ret);
+	ret = port->ops->pr_set(port, ret);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1113,8 +1103,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	int ret;
 	enum typec_port_type type;
 
-	if (port->cap->type != TYPEC_PORT_DRP || (!port->cap->port_type_set &&
-	    (!port->ops || !port->ops->port_type_set))) {
+	if (port->cap->type != TYPEC_PORT_DRP ||
+	    !port->ops || !port->ops->port_type_set) {
 		dev_dbg(dev, "changing port type not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1131,10 +1121,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 		goto unlock_and_ret;
 	}
 
-	if (port->ops && port->ops->port_type_set)
-		ret = port->ops->port_type_set(port, type);
-	else
-		ret = port->cap->port_type_set(port->orig_cap, type);
+	ret = port->ops->port_type_set(port, type);
 	if (ret)
 		goto unlock_and_ret;
 
@@ -1190,7 +1177,7 @@ static ssize_t vconn_source_store(struct device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	if (!port->cap->vconn_set && (!port->ops || !port->ops->vconn_set)) {
+	if (!port->ops || !port->ops->vconn_set) {
 		dev_dbg(dev, "VCONN swapping not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1199,11 +1186,7 @@ static ssize_t vconn_source_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (port->ops && port->ops->vconn_set)
-		ret = port->ops->vconn_set(port, (enum typec_role)source);
-	else
-		ret = port->cap->vconn_set(port->orig_cap,
-					   (enum typec_role)source);
+	ret = port->ops->vconn_set(port, (enum typec_role)source);
 	if (ret)
 		return ret;
 
@@ -1610,7 +1593,6 @@ struct typec_port *typec_register_port(struct device *parent,
 
 	port->id = id;
 	port->ops = cap->ops;
-	port->orig_cap = cap;
 	port->port_type = cap->type;
 	port->prefer_role = cap->prefer_role;
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index c9bef128453b..894798084319 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -198,11 +198,6 @@ struct typec_operations {
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
@@ -220,18 +215,6 @@ struct typec_capability {
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

