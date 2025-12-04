Return-Path: <linux-usb+bounces-31145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9485CA285B
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 07:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C40F300DCB1
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 06:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39AC2E8B8A;
	Thu,  4 Dec 2025 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="RGfIvD3f"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20F139579;
	Thu,  4 Dec 2025 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829907; cv=none; b=qrvZNTyHSruU5Mmk0vpyuGr0It5gbmV5xPYHz/t4TNEkGYRZUcnmYd/VDLj/qciQ55j3LMSwCGfuMaqRAhPuGUwcaHe7BZWjzgzZr5R5erQwsyBgePpPkWspwVCgpxdB6CrPTAd1BtVTXC1A2yfXVNWLQZoZjaatGN7zx4ZIPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829907; c=relaxed/simple;
	bh=L9aiRKYs3bp/S8WhEeaNT3JDQTO4NL4YvGxZOiAX2oQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HpDoj7qN2GynwZB8THm1NcBsME42x0CPLi1M3LEY65C/g3MswNWnsu4KWsRfpI5z2WCuMIx3GOhG7vT0U+tWytPyeWXkedhCAwDr/coDMXSLAwkj6YsDe8uVtCxP/5m7SE3ORX9hytUDpaWu2/CEOnGgfV+rcNE2hH48gfSFum0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=RGfIvD3f; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764829886;
	bh=PVv1xsqqidIoI2U23NI9Jv3q1ZlBuLOzxwZ/6KTor1M=;
	h=From:To:Subject:Date:Message-Id;
	b=RGfIvD3fE0i+5lBtFpfAND6ukSPn4p0JUDSeTafbI5sWRKpNdd+g9OOKLhzu6ctGD
	 wMyPypvrltNovH4i5IGkXCZqLe4X8ism0YSyQ+NHeKjIRBq0vxSsd63s9Xd1Gcf0nn
	 RTX2eHbtYlQuwCw9B4iRxp3X3o7GNXmUa0vSIseE=
X-QQ-mid: esmtpsz21t1764829884tc17b2163
X-QQ-Originating-IP: odLdDzr386V3ELRgMYH0pV6G0XtymjdZmOpFajWIJ7w=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Dec 2025 14:31:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8827471872452544979
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
Subject: [RESEND PATCH v11 01/11] usb: typec: Set the bus also for the port and plug altmodes
Date: Thu,  4 Dec 2025 14:30:59 +0800
Message-Id: <20251204063109.104-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N8i9SvusUD3b9+mNTDQX3Fce3UjLUxWWaT6Q2l/ab92xfk+BDwO/+Kt3
	PRakfI3KYag2yK+Tm+d8UHQfvyuuZhNNxLyORsoYt2gAuLVU/aJfn2W4ldyh45gjzJzzLxn
	ki9BGtaECFVDn+BeEIVJqWvUZXYJmOrOvJRe6+es76Ud7p+8Qji9xudP5lJTPwyFYZLXh93
	zCSkkFHkik2X354+cVIywZs7c37wNG9T93RQ5/U4kaR8sIsDsvscJUpCq7TMOtjgBZu4T0V
	63nQMFcycvw2GEg4NnrAx7dNvF84J9AbR+csgUi+xJEkaSCp3R2tqg9z9yv6H8jWg1zo8iM
	YAqi4135UlC2BODsxCohm1tgyrt6AuZ5Q3RJn+ei56t1gium14MoWEweicvdti9s7RFN0Lr
	sVJRZmF3Ex2bLW/eiJjPpClXADvRNSV4xx5rPK/Y2E29aLqXSJje1c18JGDaN+AZqGAj42S
	JABoYnso9LeHAcHKE+TemKFf7hsjY+gY36JXm7o+aly79uuUlNGFaUlTPw78iL+6Lu7Mht3
	vHgBpAbtNIqekdRVoHUdv7q8GxEI0eUqTLkL3ic0eIdBhtsNKwgj83vvzldqi+PP9i5OKcF
	H6lzeySarSnCD5QVlZ65mIxrPyOqyKaS/V1UIwizvZBKvgqSRGj2PM+Do/X9o8JzCywuViJ
	SxMu2OPNG5CC0DPyp2+CjKT91AqWXEeyP8vNL8p7cbJpYfSsWhU9GFLxdOV0MVGGxJQCmrM
	DvzhpeZR+Lax3pAuWrAz9MDPGnKggRrDviCl4pLSQwIENELyfC7x1lAAyo9/nYElj+7nSyc
	JWGilJc8jpNLU4yM1buo8KN3a2L1WDvz3lhNUr6lufN5HMiZV3Z8b2v/ZrmMiKjfXFjmbOP
	/GW3svUzdjE1zMTrEFmlL5vux9lq3UkgDapoZ3zYoa/TbEvaO55QCJChbHOFEMQvrb3UGFi
	5CTlmTPcxIiuwtzppd3+fyvRMrNlhOVjsEv/8gyQ0M3XMxpTv5W78BEGjNoetCs+pqdubmF
	1v5rdIy9Gic05gWIIEpSONIchYLEBTYewdCyL7X3zj01duHaQG
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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


