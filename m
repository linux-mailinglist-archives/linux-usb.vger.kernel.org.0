Return-Path: <linux-usb+bounces-24783-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01FADB224
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E1013B63B1
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84572DF3F2;
	Mon, 16 Jun 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mq+BB86u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB02DBF76
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080801; cv=none; b=Y2MfPGyru24qb5ZVOqd0lbFlz4d56Y9k3GU2AFHJ0Kerb5kTDu1HcpDsdaS1goj7BVmjZWPaCgrvovtLGTCVDcW3SkNmlBHjHH3PLuGaHpEWt7HnG5DvusUvpHP8u/JmT8rySoOsdxV3QGuLrCtLfA841CA+aQ/TQYAMhyPci9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080801; c=relaxed/simple;
	bh=CTkb+Zlmdex8XBt0jVOO6st2izRqSZRpU7vG9r6yMUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eGLmNx3p+vqzIPD5nSawsGJbwghEc6wOCFH1TqBLZzqyMPYSnHFV9zN8dqkx4MTS1JfAd0bsFXA3jSINn3ULJ3ikncpVchPZicS0mrTjfAtmlEUAU71mRFGi0H7h5dmuH6NY4IYsS3VE3ATEvMCmh4Rco5DE++EpbDB4axAaxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mq+BB86u; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso8356376a12.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080796; x=1750685596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDh9sojrOp84Y06qtG9e+QA6xkN553TiG7S+NM2mdjE=;
        b=mq+BB86uhOunM7FEk3Nd2SS8zUDhs8NK+WvgWTP4sdKnr6gr9wZ268lOtFRzKxbLTo
         Hojv+6qZ8RXz6KDo7q+Ze6tc9IpAtLEFS9lU4pGJwp4pFGJjyexg0igEAmG14vzNmkho
         Cipdz6cP2JkugCZUTO2E665g6Wbx0yUox+jLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080796; x=1750685596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDh9sojrOp84Y06qtG9e+QA6xkN553TiG7S+NM2mdjE=;
        b=sgDbJ/vAw0v3Hp96ewUXk1FyuLQkwuTGKZCCAauuhg8E/F0SxPEDiKGGp+yhoOdlRB
         esmPuMA5FYvD9qnLrH2TM6ZTXXrOh/lUJyBZthNe4oySD66mcRDX+YdD9iFyImG5+fRL
         eCIaSaxpK7RSP14HjMxDRJGQHjh8jaIujGgnSv4E7z/AXHoaji6GevX9dYDXArQAFPXq
         Pz1BDNMqagSE5k6aSFe8DWpzgSmeVQuehpUXMUZW7yji3q+AjezzCxc0EpESDFXwoHZA
         xhi7kJWKr8XqF5vyPTIUB7PA1DnKpmWlFY+mDIeBavjuG49fRcXdsC0lc8iA56z7tGRA
         ssyg==
X-Forwarded-Encrypted: i=1; AJvYcCXprme9liTB/ec1hF8j/+1w61I2VQ7wHT7V3OAzypXaG3zKB9tj3bUTCDPCT33tIogQlRr6uQfCROA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziRHSMPERdx0xmfqEIBh28u3pP+POJIPnploYFUCkUEoIpO/SL
	9f0KXSXOh/wwGOq4jfilhVkJk4yhOXwWo+8bmdqikgnysxGWH6J1txYifIvb0bskuQ==
X-Gm-Gg: ASbGnctWK279FVCfC8qJlzy5XP+D/JL8JzbCQvq7CRpdNouEKNmDWkJrIh34NWz5O+B
	SyfeGG7kJ4+gY0djklkGPoXTM//BlmLwR60smh38UZqK2lST6NqVHlUsnPDk1cEyAW8c/UF9Ogc
	HASO4HmTNXf0bbqJDE3d1S8mVpT4a3Ve2AyFW5WBPLIl4NqI6Npjl01HoU9LxTR9C34E1ibhETR
	Aai/1PxZi7hEs408zr7wt/Hp6kS2LgXDwrR5L9PsTIM8XnrmvFYYvpRv8I/Td4evg54WlfsoYwc
	rr1VYBlU6xIOGXesw5PTTovSlCob1yQJAyiu1iyQlqmNB4fGE5BvSdNBpkY9CXMyD3xB2OlPnyU
	G6o8vIpYSA5MBkeJ2GwAD510N5bVR2lpgilRy/T3gvwgGYDbDX4h78Z1pEg==
X-Google-Smtp-Source: AGHT+IGv/AOmT6GEhQ7oUlSng8rP/zfkQJfNKBJnimzO204DsmsQDo7srREO5LYOs54/Dw1yISBEwQ==
X-Received: by 2002:a05:6402:909:b0:607:19a6:9f1d with SMTP id 4fb4d7f45d1cf-608d08aa3d4mr7890265a12.14.1750080795674;
        Mon, 16 Jun 2025 06:33:15 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:15 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 04/10] usb: typec: Expose alternate mode priorities via sysfs
Date: Mon, 16 Jun 2025 13:31:41 +0000
Message-ID: <20250616133147.1835939-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This sysfs attribute specifies the preferred order for enabling
DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 17 ++++
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 26 ++++++
 drivers/usb/typec/class.h                   |  2 +
 drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  5 ++
 include/linux/usb/typec_altmode.h           |  7 ++
 7 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..46eee82042ab 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,23 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+What:		/sys/class/typec/<port>/altmode_priorities
+Date:		June 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:	Lists the alternate modes supported by the port and their
+		priorities. The priority setting determines the order in which
+		Displayport alt-mode, Thunderbolt alt-mode and USB4 mode will be
+		activated, indicating the preferred selection sequence. A value of -1
+		disables automatic entry into a specific mode, while lower numbers
+		indicate higher priority. The default priorities can be modified by
+		assigning new values. Modes without explicitly set values default to -1,
+		effectively disabling them.
+
+		Example values:
+		- "USB4=0 TBT=1 DP=2"
+		- "USB4=-1 TBT=0"
+		- "DP=-1 USB4=-1 TBT=-1"
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..8a6a1c663eb6 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index a72325ff099a..726fc0411c44 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -19,6 +19,7 @@
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
+#include "mode_selection.h"
 
 static DEFINE_IDA(typec_index_ida);
 
@@ -1942,6 +1943,25 @@ static ssize_t orientation_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(orientation);
 
+static ssize_t altmode_priorities_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	struct typec_port *port = to_typec_port(dev);
+	int ret = typec_mode_priorities_set(port, buf);
+
+	return ret ? : size;
+}
+
+static ssize_t altmode_priorities_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct typec_port *port = to_typec_port(dev);
+
+	return typec_mode_priorities_get(port, buf);
+}
+static DEVICE_ATTR_RW(altmode_priorities);
+
 static struct attribute *typec_attrs[] = {
 	&dev_attr_data_role.attr,
 	&dev_attr_power_operation_mode.attr,
@@ -1954,6 +1974,7 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_port_type.attr,
 	&dev_attr_orientation.attr,
 	&dev_attr_usb_capability.attr,
+	&dev_attr_altmode_priorities.attr,
 	NULL,
 };
 
@@ -1992,6 +2013,9 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 			return 0;
 		if (!port->ops || !port->ops->default_usb_mode_set)
 			return 0444;
+	} else if (attr == &dev_attr_altmode_priorities.attr) {
+		if (!port->alt_mode_override)
+			return 0;
 	}
 
 	return attr->mode;
@@ -2652,6 +2676,8 @@ struct typec_port *typec_register_port(struct device *parent,
 	else if (cap->usb_capability & USB_CAPABILITY_USB2)
 		port->usb_mode = USB_MODE_USB2;
 
+	typec_mode_priorities_set(port, NULL);
+
 	device_initialize(&port->dev);
 	port->dev.class = &typec_class;
 	port->dev.parent = parent;
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index f05d9201c233..dffe5ef03bc6 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -5,6 +5,7 @@
 
 #include <linux/device.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
 
 struct typec_mux;
 struct typec_switch;
@@ -82,6 +83,7 @@ struct typec_port {
 	struct device			*usb3_dev;
 
 	bool				alt_mode_override;
+	int				altmode_priorities[TYPEC_ALTMODE_MAX];
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 000000000000..d984c79eef45
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include <linux/usb/typec_altmode.h>
+#include <linux/vmalloc.h>
+#include "class.h"
+
+#define MODE_PRIORITY_DISABLED -1
+
+static const char * const altmode_names[] = {
+	[TYPEC_ALTMODE_DP] = "DP",
+	[TYPEC_ALTMODE_TBT] = "TBT",
+	[TYPEC_ALTMODE_USB4] = "USB4",
+};
+static const char * const default_priorities = "USB4=0 TBT=1 DP=2";
+
+/* -------------------------------------------------------------------------- */
+/* port 'altmode_priorities' attribute */
+
+int typec_mode_priorities_set(struct typec_port *port,
+		const char *user_priorities)
+{
+	int priorities[TYPEC_ALTMODE_MAX];
+	const char *str_priority = user_priorities ? : default_priorities;
+	char *buf, *buf_free;
+	int ret = -EINVAL;
+	char *str_name;
+	int i;
+
+	buf = vmalloc(strlen(str_priority) + 1);
+	if (!buf)
+		return -ENOMEM;
+	strscpy(buf, str_priority, strlen(str_priority) + 1);
+	buf_free = buf;
+
+	for (i = 0; i < TYPEC_ALTMODE_MAX; i++)
+		priorities[i] = MODE_PRIORITY_DISABLED;
+
+	while ((str_name = strsep(&buf, " "))) {
+		char *str_value = strchr(str_name, '=');
+		int value;
+		int mode;
+
+		ret = -EINVAL;
+		if (!str_value)
+			goto parse_exit;
+		*str_value++ = '\0';
+
+		if (kstrtoint(str_value, 10, &value) ||
+			value < MODE_PRIORITY_DISABLED)
+			goto parse_exit;
+
+		if (value > MODE_PRIORITY_DISABLED) {
+			for (i = 0; i < TYPEC_ALTMODE_MAX; i++)
+				if (value == priorities[i])
+					goto parse_exit;
+		}
+
+		for (mode = 0; mode < TYPEC_ALTMODE_MAX &&
+			strcmp(str_name, altmode_names[mode]);)
+			mode++;
+		if (mode == TYPEC_ALTMODE_MAX ||
+			priorities[mode] != MODE_PRIORITY_DISABLED)
+			goto parse_exit;
+
+		priorities[mode] = value;
+		ret = 0;
+	}
+
+	for (i = 0; i < TYPEC_ALTMODE_MAX; i++)
+		port->altmode_priorities[i] = priorities[i];
+
+parse_exit:
+	vfree(buf_free);
+
+	return ret;
+}
+
+int typec_mode_priorities_get(struct typec_port *port, char *buf)
+{
+	ssize_t count = 0;
+	int i;
+
+	for (i = 0; i < TYPEC_ALTMODE_MAX; i++) {
+		if (i != TYPEC_ALTMODE_USB4 ||
+				port->cap->usb_capability & USB_CAPABILITY_USB4)
+			count += sysfs_emit_at(buf, count, "%s=%d ",
+				altmode_names[i], port->altmode_priorities[i]);
+	}
+	return count + sysfs_emit_at(buf, count, "\n");
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..643f04f48343
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+int typec_mode_priorities_set(struct typec_port *port,
+		const char *user_priorities);
+int typec_mode_priorities_get(struct typec_port *port, char *buf);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..7ca2040ee1e4 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -145,6 +145,13 @@ enum {
 
 #define TYPEC_MODAL_STATE(_state_)	((_state_) + TYPEC_STATE_MODAL)
 
+enum {
+	TYPEC_ALTMODE_DP = 0,
+	TYPEC_ALTMODE_TBT,
+	TYPEC_ALTMODE_USB4,
+	TYPEC_ALTMODE_MAX,
+};
+
 struct typec_altmode *typec_altmode_get_plug(struct typec_altmode *altmode,
 					     enum typec_plug_index index);
 void typec_altmode_put_plug(struct typec_altmode *plug);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


