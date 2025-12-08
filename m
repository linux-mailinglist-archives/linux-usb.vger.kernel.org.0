Return-Path: <linux-usb+bounces-31251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72494CABBF1
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 812093001E28
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB64242D8B;
	Mon,  8 Dec 2025 01:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Va7P5i+v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B81DEFE7;
	Mon,  8 Dec 2025 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158941; cv=none; b=Bs4MvV6nzxluoORHHSNBjq5pWH+Gvcu/13mhFgb/KOCWX/bQR78sFARykO2+27fEiDXVwxaxw7PEzgAr+1Qk0Df+rcdUY6RQ4OFR6MmyplMgDInw55RIQDJ/IpI4ru1zQ3HYPXmrP9z+RFz7yj1F1BEpW31Nhcxgk4cGY2H/P5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158941; c=relaxed/simple;
	bh=iTOIohy0qYK7kDrH+uxGnHTytFnZLZ1YxBwa438QSBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LSQa+cpnqwggMIxLr/8YqyMHku53GeWaJAqmAu+/tPp0k7QhwXLRq54ZXUE97m/vCFu6yG9U1urZmAxl7BceVgD6wU5PZtsdSwgPfS/ZeMtDYctFB49vbf0fvYT4GQdwPSBpo9fBqrR6gOkzuoHAXL3NW2Zhw72qL6gjW5TupBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Va7P5i+v; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158917;
	bh=NjznxNMb9W4+bQ7ntUiXziepx5/AkGT/NQmAlFvr1gE=;
	h=From:To:Subject:Date:Message-Id;
	b=Va7P5i+v//Tut9/jSxkocgCsdyMimck7KOrV0/n7OnJ0hzC/xBnzouILyj5WVMTuS
	 smZtDAqvooenLva3IXtpP7Mp2zZNnjeM26dvE8rWLhIccHCSrhkS9vUpG/8F2wFFty
	 tqtIDZJacTZkFOKpOhGxWHavKSGgAvMlPwVOkfs4=
X-QQ-mid: esmtpsz19t1765158915tc2fa3784
X-QQ-Originating-IP: 28n/h0UQlAPWnyV58UwgT/hhI9KDq+Wze+u53KAkaPw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4550680813706724546
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v13 01/11] usb: typec: Set the bus also for the port and plug altmodes
Date: Mon,  8 Dec 2025 09:54:50 +0800
Message-Id: <20251208015500.94-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mi+38GKm5OhVJjZtHqVKxvYrjOp7q6a4Njdlf9D1Qmqz7FDyRO8M6SNn
	b2P6FJ33gwhIxDA4ckYbAImpE8E2jo6szCkiUnSe7KgFkpflsQ9ldTyeDpYqr2U4eeJit++
	HI963MQn2n48V5+fANDgGXnb1UJEpWkvHK4Q1NZGYPEmQFJ286rtfpP8j+8sGpkCu2jXqC/
	XunQFtRQ66z+GLG5hlH8CRO3XYf/nZCOMr+zBKuSEAfaSD9l9moS2rirHGH/0xi/qtUMDR6
	VUpcZdqjp90NqZeMyEmHRGqpZ9v1R7mEvs5FA7Y8IJ7cjsiQvl8N/+7ayETra9zAFfkEwII
	NTlRsfxy4rdUacBUmEQLawBda1UNI/sITygCOyTUSDD+NWuKrsXFl8lSRcSvpWj9KxI4ven
	uDmhLI/Pp0CTchn4pSYi2oNrlGmzK0fER5tSKMLadRwO0Ptn0ZQFlXfO9Q+A1nqcl4GEHa5
	EiJjoOkKJS655NATkkiVDKXUttcfGg5FLKNZhyUJTFXDF9SfIp3qj3AnuExV/GgRwtiOVMF
	tkYR57eue9TBGNCTMc1HtBNkjYlUszAUc4Npy9D88cyuDQw7iWycKi5JvJ/rN+g5G0nJ5EI
	eR0MqAKzC8JqXWMWkgD93qVQttrPaRNCCDFoGXdrfxX1h1whNamlwZztc4D4WSZEBTuvtqD
	Z+uTUeuRXk+5SImpttbv6GPSH4iDscOla0dq58NNBdNi2K+syrIDV9AJyqzMLreuWGkrUrG
	2w514QkVXqOmv4fVutNSks/zMoStKst7ZKO/Q4Mf+defeEbYz7kfbi+Ybv92IuY2uJJ/Dc+
	NNG9P5deTWbvpxEv6jOR4yxWEArrQulV1cvdDmUM9aA+2WpYLyoVkjwpJ1X6co3jmzvinvH
	4LO+xsM2tsA7KLfUYdR1gyNOhxtATyMIAWmdaqQjaUsshKt5/RHlI3RdrLamS/zm035Kj1J
	01ykw6WMtZaCOj6WR7u/Mq9LpwtoLUvRjLhg4RpnZMki4ZfPbkuKRPOJZibPDPIpowUkGfW
	vNVDfPkTlNze1eF7LF/Mu/DLQaXzqSTZPukUTYoKnPDLPw2PgkzSorqqDaTzY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The port and plug altmodes can't be bound to the altmode
drivers because the altmode drivers are meant for partner
communication using the VDM (vendor defined messages), but
they can still be part of the bus. The bus will make sure
that the normal bus notifications are available also with
the port altmodes.

The previously used common device type for all alternate
modes is replaced with separate dedicated device types for
port, plug, and partner alternate modes.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v13)

Changes in v12:
- Add missing Signed-off-by line.

 drivers/usb/typec/bus.c   | 24 +++++++++++++++++++++++-
 drivers/usb/typec/bus.h   |  8 ++++++--
 drivers/usb/typec/class.c | 33 ++++++++++++++++++++++-----------
 3 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index a884cec9ab7e..a33da7f458a5 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -445,7 +445,23 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_description.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(typec);
+
+static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	if (is_typec_partner_altmode(kobj_to_dev(kobj)))
+		return attr->mode;
+	return 0;
+}
+
+static const struct attribute_group typec_group = {
+	.is_visible = typec_is_visible,
+	.attrs = typec_attrs,
+};
+
+static const struct attribute_group *typec_groups[] = {
+	&typec_group,
+	NULL
+};
 
 static int typec_match(struct device *dev, const struct device_driver *driver)
 {
@@ -453,6 +469,9 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
 	struct typec_altmode *altmode = to_typec_altmode(dev);
 	const struct typec_device_id *id;
 
+	if (!is_typec_partner_altmode(dev))
+		return 0;
+
 	for (id = drv->id_table; id->svid; id++)
 		if (id->svid == altmode->svid)
 			return 1;
@@ -463,6 +482,9 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
 	const struct typec_altmode *altmode = to_typec_altmode(dev);
 
+	if (!is_typec_partner_altmode(dev))
+		return 0;
+
 	if (add_uevent_var(env, "SVID=%04X", altmode->svid))
 		return -ENOMEM;
 
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 643b8c81786d..b58e131450d1 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -29,8 +29,12 @@ struct altmode {
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
 extern const struct bus_type typec_bus;
-extern const struct device_type typec_altmode_dev_type;
+extern const struct device_type typec_port_altmode_dev_type;
+extern const struct device_type typec_plug_altmode_dev_type;
+extern const struct device_type typec_partner_altmode_dev_type;
 
-#define is_typec_altmode(_dev_) (_dev_->type == &typec_altmode_dev_type)
+#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
+#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
+#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
 
 #endif /* __USB_TYPEC_ALTMODE_H__ */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9b2647cb199b..d6b88317f8a4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -235,7 +235,7 @@ static int altmode_match(struct device *dev, const void *data)
 	struct typec_altmode *adev = to_typec_altmode(dev);
 	const struct typec_device_id *id = data;
 
-	if (!is_typec_altmode(dev))
+	if (!is_typec_port_altmode(dev))
 		return 0;
 
 	return (adev->svid == id->svid);
@@ -532,15 +532,28 @@ static void typec_altmode_release(struct device *dev)
 	kfree(alt);
 }
 
-const struct device_type typec_altmode_dev_type = {
-	.name = "typec_alternate_mode",
+const struct device_type typec_port_altmode_dev_type = {
+	.name = "typec_port_alternate_mode",
+	.groups = typec_altmode_groups,
+	.release = typec_altmode_release,
+};
+
+const struct device_type typec_plug_altmode_dev_type = {
+	.name = "typec_plug_alternate_mode",
+	.groups = typec_altmode_groups,
+	.release = typec_altmode_release,
+};
+
+const struct device_type typec_partner_altmode_dev_type = {
+	.name = "typec_partner_alternate_mode",
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
 
 static struct typec_altmode *
 typec_register_altmode(struct device *parent,
-		       const struct typec_altmode_desc *desc)
+		       const struct typec_altmode_desc *desc,
+		       const struct device_type *type)
 {
 	unsigned int id = altmode_id_get(parent);
 	bool is_port = is_typec_port(parent);
@@ -575,7 +588,7 @@ typec_register_altmode(struct device *parent,
 
 	alt->adev.dev.parent = parent;
 	alt->adev.dev.groups = alt->groups;
-	alt->adev.dev.type = &typec_altmode_dev_type;
+	alt->adev.dev.type = type;
 	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
 
 	get_device(alt->adev.dev.parent);
@@ -584,9 +597,7 @@ typec_register_altmode(struct device *parent,
 	if (!is_port)
 		typec_altmode_set_partner(alt);
 
-	/* The partners are bind to drivers */
-	if (is_typec_partner(parent))
-		alt->adev.dev.bus = &typec_bus;
+	alt->adev.dev.bus = &typec_bus;
 
 	/* Plug alt modes need a class to generate udev events. */
 	if (is_typec_plug(parent))
@@ -963,7 +974,7 @@ struct typec_altmode *
 typec_partner_register_altmode(struct typec_partner *partner,
 			       const struct typec_altmode_desc *desc)
 {
-	return typec_register_altmode(&partner->dev, desc);
+	return typec_register_altmode(&partner->dev, desc, &typec_partner_altmode_dev_type);
 }
 EXPORT_SYMBOL_GPL(typec_partner_register_altmode);
 
@@ -1193,7 +1204,7 @@ struct typec_altmode *
 typec_plug_register_altmode(struct typec_plug *plug,
 			    const struct typec_altmode_desc *desc)
 {
-	return typec_register_altmode(&plug->dev, desc);
+	return typec_register_altmode(&plug->dev, desc, &typec_plug_altmode_dev_type);
 }
 EXPORT_SYMBOL_GPL(typec_plug_register_altmode);
 
@@ -2493,7 +2504,7 @@ typec_port_register_altmode(struct typec_port *port,
 		return ERR_CAST(retimer);
 	}
 
-	adev = typec_register_altmode(&port->dev, desc);
+	adev = typec_register_altmode(&port->dev, desc, &typec_port_altmode_dev_type);
 	if (IS_ERR(adev)) {
 		typec_retimer_put(retimer);
 		typec_mux_put(mux);
-- 
2.51.1


