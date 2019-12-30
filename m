Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0E612D097
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfL3O0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3O0T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233461"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:17 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 04/15] usb: typec: Make the attributes read-only when writing is not possible
Date:   Mon, 30 Dec 2019 17:26:00 +0300
Message-Id: <20191230142611.24921-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For now the read-writable attribute files have made a check
in their store callback function to see does the underlying
port interface support changing the value or not, and when
it didn't, the callbacks returned -EOPNOTSUPP. From user
perspective that is not ideal, as there is no way to know is
changing the value possible beforehand.

Instead of returning -EOPNOTSUPP, making the attribute file
read-only when the operation is not supported.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 122 +++++++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 56 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 08923637cd88..3abcfa09ecdf 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -373,12 +373,9 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
 		}
 	}
 
-	/* Note: If there is no driver, the mode will not be entered */
-	if (adev->ops && adev->ops->activate) {
-		ret = adev->ops->activate(adev, enter);
-		if (ret)
-			return ret;
-	}
+	ret = adev->ops->activate(adev, enter);
+	if (ret)
+		return ret;
 
 	return size;
 }
@@ -432,7 +429,28 @@ static struct attribute *typec_altmode_attrs[] = {
 	&dev_attr_vdo.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(typec_altmode);
+
+static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int n)
+{
+	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
+
+	if (attr == &dev_attr_active.attr)
+		if (!adev->ops || !adev->ops->activate)
+			return 0444;
+
+	return attr->mode;
+}
+
+static struct attribute_group typec_altmode_group = {
+	.is_visible = typec_altmode_attr_is_visible,
+	.attrs = typec_altmode_attrs
+};
+
+static const struct attribute_group *typec_altmode_groups[] = {
+	&typec_altmode_group,
+	NULL
+};
 
 static int altmode_id_get(struct device *dev)
 {
@@ -997,16 +1015,6 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 	int role;
 	int ret;
 
-	if (port->cap->type != TYPEC_PORT_DRP) {
-		dev_dbg(dev, "Preferred role only supported with DRP ports\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (!port->ops || !port->ops->try_role) {
-		dev_dbg(dev, "Setting preferred role not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	role = sysfs_match_string(typec_roles, buf);
 	if (role < 0) {
 		if (sysfs_streq(buf, "none"))
@@ -1029,9 +1037,6 @@ preferred_role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	if (port->cap->type != TYPEC_PORT_DRP)
-		return 0;
-
 	if (port->prefer_role < 0)
 		return 0;
 
@@ -1046,20 +1051,11 @@ static ssize_t data_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->ops || !port->ops->dr_set) {
-		dev_dbg(dev, "data role swapping not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = sysfs_match_string(typec_data_roles, buf);
 	if (ret < 0)
 		return ret;
 
 	mutex_lock(&port->port_type_lock);
-	if (port->cap->data != TYPEC_PORT_DRD) {
-		ret = -EOPNOTSUPP;
-		goto unlock_and_ret;
-	}
 
 	ret = port->ops->dr_set(port, ret);
 	if (ret)
@@ -1091,16 +1087,6 @@ static ssize_t power_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->cap->pd_revision) {
-		dev_dbg(dev, "USB Power Delivery not supported\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (!port->ops || !port->ops->pr_set) {
-		dev_dbg(dev, "power role swapping not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	if (port->pwr_opmode != TYPEC_PWR_MODE_PD) {
 		dev_dbg(dev, "partner unable to swap power role\n");
 		return -EIO;
@@ -1149,12 +1135,6 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	int ret;
 	enum typec_port_type type;
 
-	if (port->cap->type != TYPEC_PORT_DRP ||
-	    !port->ops || !port->ops->port_type_set) {
-		dev_dbg(dev, "changing port type not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = sysfs_match_string(typec_port_power_roles, buf);
 	if (ret < 0)
 		return ret;
@@ -1218,16 +1198,6 @@ static ssize_t vconn_source_store(struct device *dev,
 	bool source;
 	int ret;
 
-	if (!port->cap->pd_revision) {
-		dev_dbg(dev, "VCONN swap depends on USB Power Delivery\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (!port->ops || !port->ops->vconn_set) {
-		dev_dbg(dev, "VCONN swapping not supported\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = kstrtobool(buf, &source);
 	if (ret)
 		return ret;
@@ -1305,7 +1275,47 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_port_type.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(typec);
+
+static umode_t typec_attr_is_visible(struct kobject *kobj,
+				     struct attribute *attr, int n)
+{
+	struct typec_port *port = to_typec_port(kobj_to_dev(kobj));
+
+	if (attr == &dev_attr_data_role.attr) {
+		if (port->cap->data != TYPEC_PORT_DRD ||
+		    !port->ops || !port->ops->dr_set)
+			return 0444;
+	} else if (attr == &dev_attr_power_role.attr) {
+		if (port->cap->type != TYPEC_PORT_DRP ||
+		    !port->cap->pd_revision ||
+		    !port->ops || !port->ops->pr_set)
+			return 0444;
+	} else if (attr == &dev_attr_vconn_source.attr) {
+		if (!port->cap->pd_revision ||
+		    !port->ops || !port->ops->vconn_set)
+			return 0444;
+	} else if (attr == &dev_attr_preferred_role.attr) {
+		if (port->cap->type != TYPEC_PORT_DRP ||
+		    !port->ops || !port->ops->try_role)
+			return 0444;
+	} else if (attr == &dev_attr_port_type.attr) {
+		if (port->cap->type != TYPEC_PORT_DRP ||
+		    !port->ops || !port->ops->port_type_set)
+			return 0444;
+	}
+
+	return attr->mode;
+}
+
+static struct attribute_group typec_group = {
+	.is_visible = typec_attr_is_visible,
+	.attrs = typec_attrs
+};
+
+static const struct attribute_group *typec_groups[] = {
+	&typec_group,
+	NULL
+};
 
 static int typec_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.24.1

