Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D992D17079B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 19:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgBZSZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 13:25:22 -0500
Received: from mail-pl1-f202.google.com ([209.85.214.202]:48214 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgBZSZW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 13:25:22 -0500
Received: by mail-pl1-f202.google.com with SMTP id d20so138562pls.15
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2020 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Dtrtcbd0ejslwf0LtU/qo17SJwpVcOcZfkxeu4K1Nao=;
        b=sCpHYtLs0CJiIDfFY2EivUvDyEBwDVS4IdyueP9aMxN2OdJElMwgFW12llWW/o6ZZD
         wCe/ArAU/FXTzlQY9UlwoBlqo91oLK1BFv0zYgjrjqQBbYd2RfJQHLftFcNUZAgnMj9G
         PEd1dyDqYQwYLF0UTmlypkd92osz4D3V20OXyZz+o8vZHrV1Ax7MpfTBSJ9KzUNcvw5f
         cwZ+2W6YKOW2M4KyLbGX+CuiAOOdr3KoOgdQWRdgnBsxb/Fh0yGaMUPKeQ5YuPYW+UTb
         KDBQ7msaFEVcLUSFfJZ9jiS4CTNffnxX9yJF7eXUQZfF6QuWHeaNDVf5FSJFR0MI67Cr
         gQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Dtrtcbd0ejslwf0LtU/qo17SJwpVcOcZfkxeu4K1Nao=;
        b=M+5jOTInQLxPHPFB2KIBDImnAiDKwpvUlJLz8ntnckoSSREqWW4eR3M46nb9nMsLP7
         bZJKMu+KnpC8vU2ci1MsyiMQvOF8V15SyYTHkCb2GkuJW9+pvYLpYRFVr/kU2nDfZbwn
         KlQ1Jib2dFV87e6YhIEW6kvbKKvQUYiRLvPWokc4+9nqJsYALW9mJbAmbLlNlNa+1+7o
         WR3SPFGmj1Y8ksfWC08a0QxnA4extJiiVGFjO0Ups23bgH6MaMVYtmChNBm/c+DfMJ3O
         nPlYdrV3uh7KyFyym0paw1VUsSO7h5P1j7Y2QuNTmZkkIrYrcPQLqferdWGY6tx0DJIU
         QhZg==
X-Gm-Message-State: APjAAAW9uSWrRyITw7OdGX41aiWQj71PT35Ess6RGPFfSuVtgDsXlog6
        hIkfCpxey9UxSXbBbd6ojD/lkJpldvU=
X-Google-Smtp-Source: APXvYqw+u9wtVgDicMKwUG8VALUmQI2Blv5D+mhPNo2OIBLp22vRIIzoyXmsOy1zUJI7CTyurwXK7GuLPJ4=
X-Received: by 2002:a63:544:: with SMTP id 65mr172246pgf.72.1582741521124;
 Wed, 26 Feb 2020 10:25:21 -0800 (PST)
Date:   Wed, 26 Feb 2020 10:25:17 -0800
Message-Id: <20200226182517.49214-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v3] usb: typec: Add sysfs node to show cc orientation
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        pumahsu@google.com, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Export Type-C orientation information when available.
- "normal": CC1 orientation
- "reverse": CC2 orientation
- "unknown": Orientation cannot be determined.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Version history:
V3:
- Heikki's suggestion to us .is_visible callback.
  unsigned int orientation_aware:1 has been introduced to
  make support of this attribute optional for drivers such
  as UCSI
- Guenter's suggestion to rename to "orientation".
- Heikki's suggestion to stick with string values instead
  of exposing it as integer values.
---
 Documentation/ABI/testing/sysfs-class-typec |  9 +++++++
 drivers/usb/typec/class.c                   | 27 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c               |  1 +
 include/linux/usb/typec.h                   |  1 +
 4 files changed, 38 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 0c2eb26fdc06b..b834671522d6f 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -108,6 +108,15 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		Revision number of the supported USB Type-C specification.
 
+What:		/sys/class/typec/<port>/orientation
+Date:		February 2020
+Contact:	Badhri Jagan Sridharan <badhri@google.com>
+Description:
+		Indicates the active orientation of the Type-C connector.
+		Valid values:
+		- "normal": CC1 orientation
+		- "reverse": CC2 orientation
+		- "unknown": Orientation cannot be determined.
 
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 12be5bb6d32ca..2524f1571e425 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1244,6 +1244,26 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(usb_power_delivery_revision);
 
+static ssize_t orientation_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct typec_port *p = to_typec_port(dev);
+	enum typec_orientation orientation = typec_get_orientation(p);
+
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NONE:
+		return sprintf(buf, "%s\n", "unknown");
+	case TYPEC_ORIENTATION_NORMAL:
+		return sprintf(buf, "%s\n", "normal");
+	case TYPEC_ORIENTATION_REVERSE:
+		return sprintf(buf, "%s\n", "reverse");
+	default:
+		return sprintf(buf, "%s\n", "unknown");
+	}
+}
+static DEVICE_ATTR_RO(orientation);
+
 static struct attribute *typec_attrs[] = {
 	&dev_attr_data_role.attr,
 	&dev_attr_power_operation_mode.attr,
@@ -1254,6 +1274,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_usb_typec_revision.attr,
 	&dev_attr_vconn_source.attr,
 	&dev_attr_port_type.attr,
+	&dev_attr_orientation.attr,
 	NULL,
 };
 
@@ -1283,6 +1304,10 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 			return 0;
 		if (port->cap->type != TYPEC_PORT_DRP)
 			return 0444;
+	} else if (attr == &dev_attr_orientation.attr) {
+		if (port->cap->orientation_aware)
+			return 0444;
+		return 0;
 	}
 
 	return attr->mode;
@@ -1493,6 +1518,8 @@ int typec_set_orientation(struct typec_port *port,
 	}
 
 	port->orientation = orientation;
+	sysfs_notify(&port->dev.kobj, NULL, "orientation");
+	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
 
 	return 0;
 }
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 78077c234ef27..bc0032a6b9a14 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4742,6 +4742,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->typec_caps.pd_revision = 0x0300;	/* USB-PD spec release 3.0 */
 	port->typec_caps.driver_data = port;
 	port->typec_caps.ops = &tcpm_ops;
+	port->typec_caps.orientation_aware = 1;
 
 	port->partner_desc.identity = &port->partner_ident;
 	port->port_type = port->typec_caps.type;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 44d28387ced48..b00a2642a9cd6 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -211,6 +211,7 @@ struct typec_capability {
 	u16			pd_revision; /* 0300H = "3.0" */
 	int			prefer_role;
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
+	unsigned int		orientation_aware:1;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.25.0.265.gbab2e86ba0-goog

