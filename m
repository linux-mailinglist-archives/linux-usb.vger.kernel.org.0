Return-Path: <linux-usb+bounces-29822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B1C189D5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A91DF3BD333
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F7530DEA0;
	Wed, 29 Oct 2025 07:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="GjU2IXd6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74D30C635;
	Wed, 29 Oct 2025 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722100; cv=none; b=UdlCfooAqk3tOwSPuJZhIhZJ+97CmGxeVbdZQRSHcc5c9Nu5m19WX/K517w/ITEtAOaTXcJOXibAGwEbXci9GLQDiy73CUO6wnGRALW+/r+AMtp4xumIuEOmzab34ses1MmrLfF/T1oNTYIJC5Kd/xrLi8MpvBEwXfJMHm5DaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722100; c=relaxed/simple;
	bh=B2zgCFdycTJPuhk+bmDbmYgStcK4CB41tVtMHlEqCBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=N/LIiRnn2DT39DnbUa08qq8TdQSZ4EaDJBMaX3TEiDY5L00XJCnaKSB/KDTmg2H9pM6hCss2jxEwzqw8N6fTduWIiqxROQ7syuPVUmvBvrKGQ0+RDroIeifTr6t1+C6Umb//chfRDoY7G+9dyRMAPxc8R7vIy2szGpmKnzzG6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=GjU2IXd6; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722095;
	bh=brizxRBu3LFpj2XHv7UBCSeP95PLEUGrh/8On/FsYA4=;
	h=From:To:Subject:Date:Message-Id;
	b=GjU2IXd6PkwymaUvkTE9jFp822SjnwxBtY2tuju2gt0wMsra9EK6aLL47yxgxE+Wl
	 zZfZASSTthemMhNWbB38ddjliV6/wu/3zfc2Xe2LunsI8baWe6N93UQYQay7/sklGe
	 YfNTU2+Nviq41BV+/ewpSJrbmdqPL+yoyaHKM4lU=
X-QQ-mid: zesmtpsz6t1761722094tafaac705
X-QQ-Originating-IP: 6uKBeLRKt9TvmdEuUvqbMA/JOlRqI8QIJ5dkrGmyzOE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:14:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10059686084255947240
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Subject: [PATCH v8 02/10] usb: typec: Export all typec device types
Date: Wed, 29 Oct 2025 15:14:27 +0800
Message-Id: <20251029071435.88-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NW2hw+lG6BfgLJW2/i3bS9YiEnquG7WEEoMRJbJ+ZY1iV9lX4Hc1P2uy
	aqRJpO2xNIjiZ+iLK27shKOvcgslOzTVE/QqcyaE4eSOMu2OWkSv2mWq+RUOzVZT4m1PedN
	KWygas9trIH0FSToNP6sKhRRYCjaytdEbe0OqgBBBYBOVchlEWVnVcJoTilZwzGyp10cvc5
	7uduoRiS16VYf97bfuNhH0Lq/LmOfXpiTsfMzIUqmBWjVrKPLRlhHd7nqbn1qLWWSpEHSp9
	6SfuEejr1wNdD7pDMEnlODdjiK+Fu/dhsu17TPDo3HmdRaCR4rL7da+8a/hgBDQvggja4xX
	q28SHXpEihl8Cgv6rxMgtnLlwNiK+IZIsOGm4LiUHoo7StsgcIGMDHPY3WASALDyvq5y7Kb
	xaT9yvBaxNZIkbgN1yH/EQ6RO94PCCjaAizhUa198RbZUivFxvW+BPaURoA9Z3pG3dtA74v
	jFjD4FOOlqYLxmEUhhKN+/QqUuSOXeOl2TQpwVgYWDwlAKKKA3ME94DM/7+U+rFbS8Lcmzu
	Iw92zxme75HiZNBCscDNlsbtWJDadeM9qDRAz+e6VwwBqojD+1IiVJIPeuy15G7aeyhyxwG
	I3sValq2PfAwfDmSvFAZ0iAWLpFezrBdYqY3N1fBdikcLuZhS0OOXUPpsyzTIxJ96LdFOYY
	jCxqyE/5PP259sRbN8AGRllWHiKWtEITyDRCW2WjY4k95tf8c8z2+MGpZAUceZrL017WXc8
	flnI3TnDBp+ZaQzWfCggxEYjXhCrw6fnbV/ENI03LfL6pshEWRGUNO5XruD7TAxCjUYlZ+/
	qIocPIQurr1jW2ZChmxBmtJDcGwTmlO7yh08HpogXD6wbWSlC8mo0r0+HkRPrHd7Jlbc7C7
	KOHUO24w7S8MBKKKjEBuD4CKx0PxkwEGHOtkuuSckSuDq190IclaTOIe91/3ENQRzr7e3un
	XD7S0l2Ee+hmeQFM+b9a5p3x+sikWB4zxjgtwcuVM4hH62aQn+MJMCPoyMAZ/h4AV09qD9Y
	YAl4IPBRK77mR5kROF
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Export all typec device types for identification.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/class.c |  4 ++++
 drivers/usb/typec/class.h | 10 ----------
 include/linux/usb/typec.h | 10 ++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 51e971bc68d1..04b55f066b06 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -793,6 +793,7 @@ const struct device_type typec_partner_dev_type = {
 	.groups = typec_partner_groups,
 	.release = typec_partner_release,
 };
+EXPORT_SYMBOL_GPL(typec_partner_dev_type);
 
 static void typec_partner_link_device(struct typec_partner *partner, struct device *dev)
 {
@@ -1147,6 +1148,7 @@ const struct device_type typec_plug_dev_type = {
 	.groups = typec_plug_groups,
 	.release = typec_plug_release,
 };
+EXPORT_SYMBOL_GPL(typec_plug_dev_type);
 
 /**
  * typec_plug_set_num_altmodes - Set the number of available plug altmodes
@@ -1295,6 +1297,7 @@ const struct device_type typec_cable_dev_type = {
 	.groups = typec_cable_groups,
 	.release = typec_cable_release,
 };
+EXPORT_SYMBOL_GPL(typec_cable_dev_type);
 
 /**
  * typec_cable_get - Get a reference to the USB Type-C cable
@@ -2034,6 +2037,7 @@ const struct device_type typec_port_dev_type = {
 	.uevent = typec_uevent,
 	.release = typec_release,
 };
+EXPORT_SYMBOL_GPL(typec_port_dev_type);
 
 /* --------------------------------------- */
 /* Driver callbacks to report role updates */
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f04f6987bed8 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -87,16 +87,6 @@ struct typec_port {
 #define to_typec_cable(_dev_) container_of(_dev_, struct typec_cable, dev)
 #define to_typec_partner(_dev_) container_of(_dev_, struct typec_partner, dev)
 
-extern const struct device_type typec_partner_dev_type;
-extern const struct device_type typec_cable_dev_type;
-extern const struct device_type typec_plug_dev_type;
-extern const struct device_type typec_port_dev_type;
-
-#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
-#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
-#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
-#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
-
 extern const struct class typec_mux_class;
 extern const struct class retimer_class;
 extern const struct class typec_class;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..02fed8293415 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -56,6 +56,16 @@ enum typec_role {
 	TYPEC_SOURCE,
 };
 
+extern const struct device_type typec_partner_dev_type;
+extern const struct device_type typec_cable_dev_type;
+extern const struct device_type typec_plug_dev_type;
+extern const struct device_type typec_port_dev_type;
+
+#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
+#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
+#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
+#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
+
 static inline int is_sink(enum typec_role role)
 {
 	return role == TYPEC_SINK;
-- 
2.49.0


