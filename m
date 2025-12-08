Return-Path: <linux-usb+bounces-31252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC9ACABBF5
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 02:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63C5B30022D7
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 01:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595BD231836;
	Mon,  8 Dec 2025 01:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="GP23+h5V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D904221FBB;
	Mon,  8 Dec 2025 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765158943; cv=none; b=fLarRv3HIn4wbVFVgIjSaPm6e0wS8rSOY7OSIH0xoNGkeStDU7l9crjb0Ntzli6nUalD1rkVVHMMmGEy0rTS16+932tNkyTNPrRA3z0zVi3T7rxzk9dZ1b2gBlQnb5b8hZZXCvhVix7PqG/GgpThQnwc9jFqPVe7b9iB7sJ1Sjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765158943; c=relaxed/simple;
	bh=24ZV9PMvWgnyzhnzV3dKRBUKT7t77bARzRvCWHiAGZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JLITTEOSKlHIY3n9Cz+6pjQkRQJrU4e3P5IwgTaqWGtqMWPxkJnhagsmVGSRs3LPOSGzVauTwDYHkWntF+8lEJs8xNrkGyInF8/QmY8g4FAZBFx0orp7Ui9JHRwZs5LUk6TtsXMD/6qrNkt3R+K/Isl/zD/EXoHiFLyBWjE1CBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=GP23+h5V; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158921;
	bh=yduhPWdEryQOAmGdcqOwD6+bqzN4khXB1pWrS++U2Ac=;
	h=From:To:Subject:Date:Message-Id;
	b=GP23+h5VhW6nMw7WaTFTf5xRS8EguoHzWr4TvKjJWR3ebfJYFAahm5viG80w8S0dW
	 Y3/eUKYl5sTkzliThkePVVBsGyhfFNR2mf8j8bffhNB3DqSjotq6os+BRqi/DS0ohD
	 5NZZH6o1BTX/WpJLyzfvRZp85Gfn4ediJtOJf2g4=
X-QQ-mid: esmtpsz19t1765158919t97d72f03
X-QQ-Originating-IP: Gj8s0/eHq01JGQQD6y5farK7KZ/tS0eZm6qo7o7KPhc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7821749842743038252
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
Subject: [PATCH v13 02/11] usb: typec: Export typec bus and typec altmode device type
Date: Mon,  8 Dec 2025 09:54:51 +0800
Message-Id: <20251208015500.94-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Oe8iwmjPdG65a1XEBofZbDbNJ3qoT4PU+XnfufOCK185lJNdbSlSC9XH
	EGsf3J+FVyrrHcB2imCOD5s6dlRNW57kCaRH973OuXWBTKdlzHDpYYASerStgZDG+yAXc0I
	20r6fUPmtI6W8zwgUElzk93Sth0V15ttVSrIOEqv0UCMS73uRvfJ2DOvoWJUheUEkpOE3LG
	VN0Y4VM8HBUgDYStmxRtcM6CQExGz0j6LGPigSTQSojfQDnhvItjhTwuJNbT+bdqfsFMgUZ
	JXLh0J5Jjazv4meHb8k5kLejJ1XfSxfMSFnPIurpR71plSAox/Hhi7pzMyUC3/K1UQ6tZ9H
	fmIou6UCARJ0gSEDcnOyOgQD6n/7fF9sYS+qLPuHc01cpQQ8Pl3BDWIZod/U55Xv7hKzlEW
	UDISGZOznsTFiQ1xW/gfpPdsIOmNWE2Pn8NJMI2eNJ3x1yA5M8zJrGdxGYWEcgL7wizUrJZ
	igDBZFsGKUqsD+QuuWWBVjYlbirJXxswLuQdnqgvmyEgjgM2gYKWXyPF8Is9ZoYAxmnTIBF
	mIyUMDOc7wPqLBjCXb1tH2u6YGC/XBl4BJ3UdyJS7d3G3mVyVhNWCQvQtns9mue6DzmUOsc
	F0E+4p5uhn0GcEQYT6POT+dmAd0mij1NeqwZ49dKT8Af3DZ6Dl1BhTMrVkzUy3i4XyOnHcY
	NpgmezsL3/W0BWQPPPgZ7flcWbRnUk/tDBrFFZA+tcl07vYoxj3hpjiuwJTQgrHH0y/Wvz8
	e/NjnK+I4PG7+nPulWFxClHMhtS1Ydv+S5KzHxSU3HBdzbJkXumiyajn9I+2unCGBOc1F1d
	RnEh9dUthWYq3c3Q05wPPMMxRq7lAmkksQscfRxYyUCmo5NeGic2A1aMPArWvIbzMVu9W5z
	9kx8tWSLnhYpO8RuZ3P75UqOhu+ZkJ6+FUdLrPACqdp4eykaMNxo9T4aimmo6B0sWXkbxYR
	4uCh1H4VW4+ps+KSfNJf+piju1NBglJHb5XUOPni/yGMQvTV07r6Lkhw6WO3q54d+XxNWj4
	6/ykm4zg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The DRM may want to register a notifier on the typec bus to know when
a typec altmode device is added, and distinguish between different
types of typec altmode device.

Export these things.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

(no changes since v12)

Changes in v11:
- Also export typec bus.
- Add more detailed comments.

(no changes since v9)

 drivers/usb/typec/bus.c           |  1 +
 drivers/usb/typec/bus.h           | 10 ----------
 drivers/usb/typec/class.c         |  3 +++
 include/linux/usb/typec.h         |  3 +++
 include/linux/usb/typec_altmode.h |  8 ++++++++
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index a33da7f458a5..e84b134a3381 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -569,3 +569,4 @@ const struct bus_type typec_bus = {
 	.probe = typec_probe,
 	.remove = typec_remove,
 };
+EXPORT_SYMBOL_GPL(typec_bus);
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index b58e131450d1..7df5deb1dd3a 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -5,7 +5,6 @@
 
 #include <linux/usb/typec_altmode.h>
 
-struct bus_type;
 struct typec_mux;
 struct typec_retimer;
 
@@ -28,13 +27,4 @@ struct altmode {
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
-extern const struct bus_type typec_bus;
-extern const struct device_type typec_port_altmode_dev_type;
-extern const struct device_type typec_plug_altmode_dev_type;
-extern const struct device_type typec_partner_altmode_dev_type;
-
-#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
-#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
-#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
-
 #endif /* __USB_TYPEC_ALTMODE_H__ */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index d6b88317f8a4..c4ff4310ff58 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -537,18 +537,21 @@ const struct device_type typec_port_altmode_dev_type = {
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
+EXPORT_SYMBOL_GPL(typec_port_altmode_dev_type);
 
 const struct device_type typec_plug_altmode_dev_type = {
 	.name = "typec_plug_alternate_mode",
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
+EXPORT_SYMBOL_GPL(typec_plug_altmode_dev_type);
 
 const struct device_type typec_partner_altmode_dev_type = {
 	.name = "typec_partner_alternate_mode",
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
+EXPORT_SYMBOL_GPL(typec_partner_altmode_dev_type);
 
 static struct typec_altmode *
 typec_register_altmode(struct device *parent,
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..c6fd46902fce 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -20,12 +20,15 @@ struct typec_port;
 struct typec_altmode_ops;
 struct typec_cable_ops;
 
+struct bus_type;
 struct fwnode_handle;
 struct device;
 
 struct usb_power_delivery;
 struct usb_power_delivery_desc;
 
+extern const struct bus_type typec_bus;
+
 enum typec_port_type {
 	TYPEC_PORT_SRC,
 	TYPEC_PORT_SNK,
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index f7db3bd4c90e..9197a4637a93 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -9,6 +9,14 @@
 
 #define MODE_DISCOVERY_MAX	6
 
+extern const struct device_type typec_port_altmode_dev_type;
+extern const struct device_type typec_plug_altmode_dev_type;
+extern const struct device_type typec_partner_altmode_dev_type;
+
+#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
+#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
+#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
+
 struct typec_altmode_ops;
 
 /**
-- 
2.51.1


