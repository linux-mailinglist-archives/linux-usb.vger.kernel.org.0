Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9E117091E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 20:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgBZT6E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 14:58:04 -0500
Received: from mail-pl1-f202.google.com ([209.85.214.202]:45669 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbgBZT6E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 14:58:04 -0500
Received: by mail-pl1-f202.google.com with SMTP id 36so302116plc.12
        for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2020 11:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=uBP/KRP6rlyKjQn7L8H9HcQSgolfyiucEDippWsO4eE=;
        b=rkPO2X4QhTS952uAkPex2S5r5tAJpmHcz81YiXrId7HP0hA2NHPL7zSXNUGT5gjEEs
         Q0nbydl955FLy/ASnAbu3X2Ek4plX+3nJA2sFnPcefjvCTWokstwpsQguQLpVXeIAoJi
         mM4xvV9BO0GuFpkKAs7OwbRYvsKLzRcC9UPibt2A8oqI5zoOdD3bK402TsXm32eypCsJ
         5PN20zWpj2OCvuPQqAhjxsLpzaQvlapXZAnMB2Y52As8BQm2GvWl6DpeNu2SUTjrjYHL
         YG/Bm/AeUFPXTPKSi0eCnk8qD8nKwURwEHa/o3xVEP0kDlqVFWS8uVPzwTu/cclIlKGc
         C+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=uBP/KRP6rlyKjQn7L8H9HcQSgolfyiucEDippWsO4eE=;
        b=qrFUdo34JOHMuQ8hiIMf8RLQ20MX9zhFdPHyqoHGj0YTQbzvmJhbh0bnoQoo/+1U11
         6bfhIfpfp19XcrQgfdu87TeC5XrGUeuafLKuUA04FeFmV293ye7beNkq4asVcaGdXxfX
         Oqc8Qs3tflGN3vj+2MAXplmqdsh7JVfl9U5Mg8FtS4xu+Jr3brhs6Lw8TzUiIPCbVEQa
         PIrvicdsGFf5u1x71r4CqbYKUXn9TeilHNXJ4aghcfy0stpvohS+EaDM4MNIdXnCeac5
         I6YeHp+Tr4DFznECO4HfIk48Xh0LbAYORtqIdcGk3gP1wfHc2GsIgT7Qw95U84XRYbXK
         7hPA==
X-Gm-Message-State: APjAAAWXZbnU8j+zV7W0Kx8JvWj+fiG1V7A1FOY7AY5TB+W8I4b5QMgN
        liLHpgiyI4raIzDEX2YXfe+lZgQDziI=
X-Google-Smtp-Source: APXvYqzmwLl1Gf2CB7qsyZ63xtEO90YPTu10TaPQnWfDzRwglA6WUktBoYllksK6tfk+xIgPC7PlcRDsan8=
X-Received: by 2002:a63:f50e:: with SMTP id w14mr444621pgh.363.1582747082882;
 Wed, 26 Feb 2020 11:58:02 -0800 (PST)
Date:   Wed, 26 Feb 2020 11:57:58 -0800
Message-Id: <20200226195758.150477-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v4] usb: typec: Add sysfs node to show cc orientation
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
V4:
- Greg's suggestion of Minor refractor to handle
  TYPEC_ORIENTATION_NONE and default in the same case.
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
 drivers/usb/typec/class.c                   | 26 +++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c               |  1 +
 include/linux/usb/typec.h                   |  1 +
 4 files changed, 37 insertions(+)

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
index 12be5bb6d32ca..bf97c31d0bba1 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1244,6 +1244,25 @@ static ssize_t usb_power_delivery_revision_show(struct device *dev,
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
+	case TYPEC_ORIENTATION_NORMAL:
+		return sprintf(buf, "%s\n", "normal");
+	case TYPEC_ORIENTATION_REVERSE:
+		return sprintf(buf, "%s\n", "reverse");
+	case TYPEC_ORIENTATION_NONE:
+	default:
+		return sprintf(buf, "%s\n", "unknown");
+	}
+}
+static DEVICE_ATTR_RO(orientation);
+
 static struct attribute *typec_attrs[] = {
 	&dev_attr_data_role.attr,
 	&dev_attr_power_operation_mode.attr,
@@ -1254,6 +1273,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_usb_typec_revision.attr,
 	&dev_attr_vconn_source.attr,
 	&dev_attr_port_type.attr,
+	&dev_attr_orientation.attr,
 	NULL,
 };
 
@@ -1283,6 +1303,10 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 			return 0;
 		if (port->cap->type != TYPEC_PORT_DRP)
 			return 0444;
+	} else if (attr == &dev_attr_orientation.attr) {
+		if (port->cap->orientation_aware)
+			return 0444;
+		return 0;
 	}
 
 	return attr->mode;
@@ -1493,6 +1517,8 @@ int typec_set_orientation(struct typec_port *port,
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

