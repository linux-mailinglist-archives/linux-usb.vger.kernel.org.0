Return-Path: <linux-usb+bounces-31020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D0C908FA
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7A664E0F4D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 02:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5338F275AE4;
	Fri, 28 Nov 2025 02:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="sSah0LII"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9F1EF092;
	Fri, 28 Nov 2025 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764295483; cv=none; b=FIDLW17JTOEVrup0x9PdKLWEHPEVMzzmFs3Oe2cO5lIKljKYhOAKBBTyzHBRFZYReI4INhCdPvLPov1gvwfBIz5T/TairCnLVBwNKsBOx/IukYIMtOh3n2WWPyo2uvBuLIQbrywEY71wI4EI1UeWROzRfyJy4Gm1P4qjaFyfuAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764295483; c=relaxed/simple;
	bh=PexoXmWg23hcyQh6xegMZaQldNlfZLe4vqudyTtbacw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=OdMOyMbrPdVmljdXW1EjaBvLYoh9hF8CyL73UulquHijaTFDO/3BqUGiiVkcdq0DzAyXxdVo9tx1goFXRm8zEmIF56kXomHYFZ9fQCDf8PIBGBx+nyBaVOg/Ab7HsbWk9628WLT2ONPR8MjwrGHpzGo86ubuU3l6o1+b7lhDG70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=sSah0LII; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764295467;
	bh=9oGlaHNtIhbTx7QkJKVpo4Ol7UjzU3rpuzSq9kjRP4w=;
	h=From:To:Subject:Date:Message-Id;
	b=sSah0LIImGi+potOocdILQn9NK86ZbUCJJ1kC505027w9cL0DT6idQKwmWwGHtejo
	 UkLzZIWWDCwplqDgkJIac6rXAsXFXoXy0d0OAHpi05/13yev4JPpvoZGSyvWGAiaWX
	 Rr35bP5zC6pt47d3zOfn8pr4h9apW02imFibUn2Q=
X-QQ-mid: esmtpsz21t1764295465t7596bef1
X-QQ-Originating-IP: s57CgJLpnxFBXEh8PABts4Hm4Tdr1U3366rUMeJac1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 10:04:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4342192847076017711
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
Subject: [PATCH v11 02/11] usb: typec: Export typec bus and typec altmode device type
Date: Fri, 28 Nov 2025 10:03:56 +0800
Message-Id: <20251128020405.90-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NPgAY+7cethfznNSp3gZfZkh5fpQWIo6b8lDwgSM61jMN83t1tck0V6v
	kTtPs9ZzcUzBqxYZsbWpWTDO9VYTWpGQjTyHJQxMhgBf7DksFe2YsMyQ/Azhj6YSqPR/VYd
	U66jYn3wQQ+RoBgSZ+Hj5A40EbzY8EtHSq64lD9I6fB/DvaqaIq1NLj8gd1TweGFZqQ/+AM
	/O0myMA1zZwqb5jQNtc/d/6c39pln4yMfHrt4phtItynmKfHfCZKYfuEP68Xo43hdVEhZCA
	sic/tl5t5SQfvPK0m7s+VZfgxfT4BUhfKBF+A6RC9U/nxNfS7gmoxie4FtAVi030y9msoRg
	VkJLC6q3xzlp7co6oQBQ91HSc3UHNuVUSYGcPH6rRT3ZUzGPde+CrSfTdW9wVZiD+6wEplz
	QPvTkAXgQMz8a435Obay3gHUoev/rAlkHjhxkKv9Rhrmxh+pEYn2TUJGHKWWco/+eUMxj+5
	g4IWqvtGddGzcbEESZym0Emhks/JEfgihduAD5sZTshZa9of1ukI+yJfBd3hNx6RKtKGnJU
	9Z9KnOxQGp7S7ATQJbaHHBdxiMRMdNBXBQTYzrL4pwEwO8TRT6s43s4okjg01g7XHM+x89t
	4jJSSgpxe6qjK/ywejUf4jXuqtNJ3144MArx0/9j652bpA5BEhCpvDPqqsEwa9rdz26oh5B
	hy73c2J4fSEHxjA0itMbW1o3BfZCOM1YXvrLhetWpX57pC5ghw6qfvRKkrBRyEiKXPRhmX1
	Hl7jjPPunxrEOuBo00zVyHtwGNpqDiWDKsleBW9ueFlRHGsv+/ab4ztfqy4g/ygJiGHj01q
	T66NNSLV36ZyG1E3I0wUoh00X/si0Kc1tRtQSijc7kjOI4MSVuVZ7bI43EIpCULduXtDXGF
	5+d4cmVORKjquKHXdQd+pHib0rJhVEBuPvFP3X8LsgjulvlFwDP6nv5NXG2QjQTXpZk/e+Q
	wtob3rpBEKYjtFkaic1e2pzSH/xay3LOrR2PAJ0jPNdjBtPux0hM8RfZ8C2G1FCWYs307Wy
	0r6GVbTQ==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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
---

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


