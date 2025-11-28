Return-Path: <linux-usb+bounces-31019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F75C908D7
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DBD23A9E08
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398F3265606;
	Fri, 28 Nov 2025 02:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="dqFJQ1Nn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825BF35972;
	Fri, 28 Nov 2025 02:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295479; cv=none; b=czCrRgdSfr3mm2pDGyFOR3YddjTidnWpGkOPrYbH2mBrwyykiK49L7xYRfBxGueO3AQt9WBvjRuUQXjoVi55SwQMk9wPUV2B1t8+zhMEfTSf/bP8YA8O9xTOA/rdpq2HPq2HlIkujqE7q2VP1VzLE+QtFyZTxz/UaJP1O6iCibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295479; c=relaxed/simple;
	bh=AZiWM8KDXUNMutN61sYxOOr6kqIkoiTv1cw8QpNyMwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=QK/jC4viY4MAtPRjD1D5L5frVr0+J/Hjx1Xr/B5egfk7wKvT85EqemXR/nPnFA3OOhfhsDjOEGHebG3Qn5lCWfIVVyy8gD3JL15Up2xn4XjXL89KKYHLv9yqYrlkJe4+hH1/3MlPwhIsOe8tpL9REqRA1L2NGReBYENWu9zLwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=dqFJQ1Nn; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295463;
	bh=HACn86zdCcEj7sYdICgJjI01+m/bWEVtdDOphGhu1lA=;
	h=From:To:Subject:Date:Message-Id;
	b=dqFJQ1Nn1CioFKveMvr7yho7FOu7pKGnXzn98QdFT1ayywap6wUQg+1PfFLdZFLZN
	 DZbNKE0WD7hGz0twSkFJTApCatQSqSDABnfm3QWFW6CikDvizD2NjDEZ8YwnYISoqQ
	 8CB3S5TJ+eIWT5VVUCmi5s0/a4b3GcR2d4bdIdzo=
X-QQ-mid: esmtpsz21t1764295461t91f06378
X-QQ-Originating-IP: fhbY41yQeB4lJVNR28w6HWtzkSKTp8yaiorSXifwU2Q=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8558268278780288437
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
Subject: [PATCH v11 01/11] usb: typec: Set the bus also for the port and plug altmodes
Date: Fri, 28 Nov 2025 10:03:55 +0800
Message-Id: <20251128020405.90-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NSJPTvnisrLjsK5sDBWp2HvG1wpQe9wOhqZSbNCmLFxQtcLkIzQsuE2m
	++ty/mEnO+xVxTWu1C4+0TrA1Pq7SoKOmxm02L2aL0ZyvMw/goNGEJDUfy7YM9vaTfU1UhA
	2r82rlk1pQF8nAeP3NOx5yhXRzzvBY71lQMrnloh7SNFs96ULI7lXu1aEDWHYchfH/omW1M
	z+xkKgUxjO2dYM0rQ6hF/uGwjCC//wTxRYlAc4WhTcoLVx6DE9+PI/ULk6vMasIOwq5ejLU
	RnpIezwEJWUCgl1NRWgx/isQHUYKOSUm9fqX8fX4VOF1Wihnr3/tQ7+7QgVdxs4ZyHVDryE
	YmtaHXpI9b2GE3r6OU1+w9k2mf0tMi7WRDw0op6UMND3HbjMWQnpJ1/+A2CO5FzqJ5qq/bI
	4lciKuUTeuW/QSxC3jaNmiuLIN3MOEh0israeK/VnB2VbwhS+wcfjwrBKuI9upLqwEqUBPA
	D/tLg6Oe3kvID7xJu25KGzfXGWP78RvdT8zOP/Rs6skal2HoqnJ0LHIu/ltsgmDoJl46G98
	Mpe5CF0PdPb+rzfGV2daFdrJsVbCpHwZa2zRtBTMa9RDkjeAoBr0DYdoauuDHxtjzN8B1Ay
	TAjkUMBqcWEuRsEQbc/2QJn2k3k4usiOdkn+VmNILtA6RkcJD+Mq3frnoKzTRID5cGd1qI8
	qfnn49m/fomWcO1ZGHrx3VNphnFuuV2NQFE8l7n6pL1J52aUTER0u4iJAXBG+5mUGa5p1bd
	F7/sg3CMXeYJpZc7ou9BZoK9rV4n988NVeNG/EY5h4p8loNGvBYCay0+63oG6e2OtztjPUA
	BTProljUSC5hWmKWSoBVZs3irjEBM2O5j44IaDY1TW/HUyc46Nk6c+Z25UE4AimUAXouflq
	xCooyFHBhJwygKqF83E3BD+lVIBTE4n/s5BXgIcYxX3/ors0h6Z43b4GDZGoQn4aT0NdM+g
	eziUeuCM9uzqZg+tNl5cyTdkutkHTrxSxih9DZtUtcPc8BKUAKgrK6rsq9QxZq/+GHOeXqB
	z9bbmSK5Ose0I+LhqCDrzMFw4eiBQFOZ/RUR3B4sCa8XzlUFuqlM3aVCOoN8U=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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
---
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


