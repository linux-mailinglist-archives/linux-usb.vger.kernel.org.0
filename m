Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EF3158D83
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 12:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgBKLZf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 06:25:35 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728124AbgBKLZf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261817"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:33 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCHv2 1/6] usb: typec: Make the attributes read-only when writing is not possible
Date:   Tue, 11 Feb 2020 14:25:26 +0300
Message-Id: <20200211112531.86510-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This affects the read-writable attribute files. Before this
there was no way for the user to know is changing the value
supported or not.

From now on those attribute files will be made read-only
unless the underlying driver supports changing of the value.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes since v1:

- Left the checks in that make sure we don't crash the kernel even if
  somebody changes the permissions on the sysfs files.

---
 drivers/usb/typec/class.c | 65 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 7c44e930602f..a451ae181fe9 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -432,7 +432,28 @@ static struct attribute *typec_altmode_attrs[] = {
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
+	.attrs = typec_altmode_attrs,
+};
+
+static const struct attribute_group *typec_altmode_groups[] = {
+	&typec_altmode_group,
+	NULL
+};
 
 static int altmode_id_get(struct device *dev)
 {
@@ -1305,7 +1326,47 @@ static struct attribute *typec_attrs[] = {
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
+	.attrs = typec_attrs,
+};
+
+static const struct attribute_group *typec_groups[] = {
+	&typec_group,
+	NULL
+};
 
 static int typec_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.25.0

