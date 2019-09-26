Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D41BEF42
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfIZKHa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 06:07:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:2189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfIZKHa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 06:07:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 03:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="203825680"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 03:07:29 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 01/14] usb: typec: Copy everything from struct typec_capability during registration
Date:   Thu, 26 Sep 2019 13:07:19 +0300
Message-Id: <20190926100727.71117-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Copying everything from struct typec_capability to struct
typec_port during port registration.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 94a3eda62add..3835e2d9fba6 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -46,8 +46,14 @@ struct typec_port {
 	enum typec_role			vconn_role;
 	enum typec_pwr_opmode		pwr_opmode;
 	enum typec_port_type		port_type;
+	enum typec_port_type		fixed_role;
+	enum typec_port_data		port_roles;
+	enum typec_accessory		accessory[TYPEC_MAX_ACCESSORY];
 	struct mutex			port_type_lock;
 
+	u16				revision;
+	u16				pd_revision;
+
 	enum typec_orientation		orientation;
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
@@ -950,7 +956,7 @@ preferred_role_store(struct device *dev, struct device_attribute *attr,
 	int role;
 	int ret;
 
-	if (port->cap->type != TYPEC_PORT_DRP) {
+	if (port->fixed_role != TYPEC_PORT_DRP) {
 		dev_dbg(dev, "Preferred role only supported with DRP ports\n");
 		return -EOPNOTSUPP;
 	}
@@ -982,7 +988,7 @@ preferred_role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	if (port->cap->type != TYPEC_PORT_DRP)
+	if (port->fixed_role != TYPEC_PORT_DRP)
 		return 0;
 
 	if (port->prefer_role < 0)
@@ -1009,7 +1015,7 @@ static ssize_t data_role_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&port->port_type_lock);
-	if (port->cap->data != TYPEC_PORT_DRD) {
+	if (port->port_roles != TYPEC_PORT_DRD) {
 		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
 	}
@@ -1029,7 +1035,7 @@ static ssize_t data_role_show(struct device *dev,
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	if (port->cap->data == TYPEC_PORT_DRD)
+	if (port->port_roles == TYPEC_PORT_DRD)
 		return sprintf(buf, "%s\n", port->data_role == TYPEC_HOST ?
 			       "[host] device" : "host [device]");
 
@@ -1044,7 +1050,7 @@ static ssize_t power_role_store(struct device *dev,
 	struct typec_port *port = to_typec_port(dev);
 	int ret;
 
-	if (!port->cap->pd_revision) {
+	if (!port->pd_revision) {
 		dev_dbg(dev, "USB Power Delivery not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1064,9 +1070,9 @@ static ssize_t power_role_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&port->port_type_lock);
-	if (port->port_type != TYPEC_PORT_DRP) {
+	if (port->fixed_role != TYPEC_PORT_DRP) {
 		dev_dbg(dev, "port type fixed at \"%s\"",
-			     typec_port_power_roles[port->port_type]);
+			     typec_port_power_roles[port->fixed_role]);
 		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
 	}
@@ -1086,7 +1092,7 @@ static ssize_t power_role_show(struct device *dev,
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	if (port->cap->type == TYPEC_PORT_DRP)
+	if (port->fixed_role == TYPEC_PORT_DRP)
 		return sprintf(buf, "%s\n", port->pwr_role == TYPEC_SOURCE ?
 			       "[source] sink" : "source [sink]");
 
@@ -1102,7 +1108,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	int ret;
 	enum typec_port_type type;
 
-	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
+	if (!port->cap->port_type_set || port->fixed_role != TYPEC_PORT_DRP) {
 		dev_dbg(dev, "changing port type not supported\n");
 		return -EOPNOTSUPP;
 	}
@@ -1114,7 +1120,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	type = ret;
 	mutex_lock(&port->port_type_lock);
 
-	if (port->port_type == type) {
+	if (port->fixed_role == type) {
 		ret = size;
 		goto unlock_and_ret;
 	}
@@ -1123,7 +1129,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		goto unlock_and_ret;
 
-	port->port_type = type;
+	port->fixed_role = type;
 	ret = size;
 
 unlock_and_ret:
@@ -1137,11 +1143,11 @@ port_type_show(struct device *dev, struct device_attribute *attr,
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	if (port->cap->type == TYPEC_PORT_DRP)
+	if (port->fixed_role == TYPEC_PORT_DRP)
 		return sprintf(buf, "%s\n",
-			       typec_port_types_drp[port->port_type]);
+			       typec_port_types_drp[port->fixed_role]);
 
-	return sprintf(buf, "[%s]\n", typec_port_power_roles[port->cap->type]);
+	return sprintf(buf, "[%s]\n", typec_port_power_roles[port->fixed_role]);
 }
 static DEVICE_ATTR_RW(port_type);
 
@@ -1170,7 +1176,7 @@ static ssize_t vconn_source_store(struct device *dev,
 	bool source;
 	int ret;
 
-	if (!port->cap->pd_revision) {
+	if (!port->pd_revision) {
 		dev_dbg(dev, "VCONN swap depends on USB Power Delivery\n");
 		return -EOPNOTSUPP;
 	}
@@ -1209,10 +1215,10 @@ static ssize_t supported_accessory_modes_show(struct device *dev,
 	ssize_t ret = 0;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(port->cap->accessory); i++) {
-		if (port->cap->accessory[i])
+	for (i = 0; i < ARRAY_SIZE(port->accessory); i++) {
+		if (port->accessory[i])
 			ret += sprintf(buf + ret, "%s ",
-			       typec_accessory_modes[port->cap->accessory[i]]);
+			       typec_accessory_modes[port->accessory[i]]);
 	}
 
 	if (!ret)
@@ -1229,7 +1235,7 @@ static ssize_t usb_typec_revision_show(struct device *dev,
 				       char *buf)
 {
 	struct typec_port *port = to_typec_port(dev);
-	u16 rev = port->cap->revision;
+	u16 rev = port->revision;
 
 	return sprintf(buf, "%d.%d\n", (rev >> 8) & 0xff, (rev >> 4) & 0xf);
 }
@@ -1241,7 +1247,7 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
 {
 	struct typec_port *p = to_typec_port(dev);
 
-	return sprintf(buf, "%d\n", (p->cap->pd_revision >> 8) & 0xff);
+	return sprintf(buf, "%d\n", (p->pd_revision >> 8) & 0xff);
 }
 static DEVICE_ATTR_RO(usb_power_delivery_revision);
 
@@ -1532,6 +1538,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	struct typec_port *port;
 	int ret;
 	int id;
+	int i;
 
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
 	if (!port)
@@ -1581,8 +1588,16 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->id = id;
 	port->cap = cap;
 	port->port_type = cap->type;
+	port->fixed_role = cap->type;
+	port->port_roles = cap->data;
 	port->prefer_role = cap->prefer_role;
 
+	port->revision = cap->revision;
+	port->pd_revision = cap->pd_revision;
+
+	for (i = 0; i < TYPEC_MAX_ACCESSORY; i++)
+		port->accessory[i] = cap->accessory[i];
+
 	device_initialize(&port->dev);
 	port->dev.class = typec_class;
 	port->dev.parent = parent;
-- 
2.23.0

