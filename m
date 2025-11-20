Return-Path: <linux-usb+bounces-30757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D87C71D18
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE7AB4E3996
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19222D593C;
	Thu, 20 Nov 2025 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="QIGs7h07"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799A2D0C9A;
	Thu, 20 Nov 2025 02:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605455; cv=none; b=dCHLcZICLmr0Gyf9LX8bwmaaIcKkFVLdMU4WGFRlNSxoQXdepHFKCIhC9uwQ5NSgblI4pYYE5yOv7rWTPbNnKcmZT8V2I5YmQBd9flLQnM8KerNsLqskkkLFM5+0Eifako1G4h5MBnTqYgMnXreeIswokohSuxp1nOnnjQ/VZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605455; c=relaxed/simple;
	bh=7wtNhbo+VeVCavgf4XLgabmFOfBXoHpxA5cTFC57EsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cVhg4MuCHb3FBZ09BNraGf6OBVgLmF06oBw7CobgDavEvxsKm9dq0z2nz6WUpQLgS6ZD2c+jbi1qtd7Kd2BXpoB+gqc1oO19DTlLrbxbiC3SQUF5Db41dnnJ68srVp45dMgqCzEpFmATUL4X191iGmF7HZyBEwq8gvBCE1fK8HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=QIGs7h07; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605442;
	bh=sNllLzwzBdbka1nV55jX2kPT1B2apGnU6AJpIMBuw2w=;
	h=From:To:Subject:Date:Message-Id;
	b=QIGs7h07c7TwQWmHT52X4cRsRrfSYK9GKGbCoyHkzWbyzXUrKYGZj0tumTA+P9rlf
	 R/exwNh8CTv0VQwmdu5IB98R7AlGUtYu8RFYcceiHAUbNuopjX1F5MbHGD6bG7kVlq
	 393hL+7hXRFiZnHupznHh0lkUuIgvAlpYlh5JaMk=
X-QQ-mid: zesmtpsz5t1763605440ta4483ad6
X-QQ-Originating-IP: rY8CRKUnY2Dkoe7g+ABEYFCRQNfG+zxyr4d4xbHKp1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:23:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10264243527081182811
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
Subject: [PATCH v10 02/11] usb: typec: Export all typec device types
Date: Thu, 20 Nov 2025 10:23:34 +0800
Message-Id: <20251120022343.250-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OYpbVsTx4C81sRvOX01gMFpA6wlrIwTFEYLDEuzfgpFu0RQ/KUjc7bIT
	JSNZwqE7tgKCMSmxhHX5jeF5phwqrHzQnJkV00Jj8p4P9+i4M2QJaKprBKHth9nd/JAD+F+
	VTIGYll9az/XM54HT3011omXOgHdbK9Hn2mmkbj0BqjVGU0jr0IcVFPKmMwDPlvrlAn1j+D
	b+xJHxr0kTz2VkWGyi+fwquWzASGybQi1iy6YpgwEX3k9SWqgPCDSvWn8wbDjsoGdBLGAAF
	T08QktUistBXlD6GQHyvOQnyPrGmqwpZutX8V8SFjj206GhQabYSmK/4m9C//lNa+xnWR39
	8ce/WupJtPTEnUSMcfliJpxxISveTxvdeHk9IWpmmi9Q0YfSJ1nr+F43Xt8HuQPFXSbUkQp
	dWc4r5wr/vy6mCiAxebm8Mppl4Fe0ltNwD110X8hejz1ZDiloVQoz/PRw/rm8lbpv9rv/QP
	e/1rSdWjtUFQE38zb3ge0QH5BLWKONvpfWq/6cgg/tF+E9L9aelxOoDv5qJescLmgd3r8UF
	m+H4He2nRIA/+lzqPUgtaDzL1ZRYYJvDUfXlQnE3THwBmNQyz/PDip7gAavU3ImvCf5ELn/
	9HzYU/klBnus9OBohTtQcq0Nks7Zl4g9u4oI0qAFt33XoNLwFx8fq2i9BBatvbk1eZXCBju
	GbYbzyPAjODBPF+cOK/YC7fGdb8E5wqETt/9BeUJ7Ij2lSwUqgmUbwasz9aJViaGIw6wOvM
	kOtr6AZAKjA8p202tMQTRI/X5qqKFqEkm98MRMLA6xry5vJr/PBScZv7eDlxYSmUVwzcwg0
	NOPeCG29jx1WviopsoaJg98NOjKp3lwYuEzzhwUSEELBNTZV7AmAtokWXQC044Xwk3UIdtn
	MqlHyKkVH91ME++3r5P0pfJ6FWo2JpMhJTjQdDhlbclWuDW7CtU4AbQo/H+tT7pwNbxlqmu
	rZn+/rCXrsZpZDbjbHEz3biG7wxJml2OGlLFWSk5CWLrVUmO5v7E/TWH+D1qZJ2+Kgqs=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Export all typec device types for identification.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

(no changes since v9)

 drivers/usb/typec/class.c |  4 ++++
 drivers/usb/typec/class.h | 10 ----------
 include/linux/usb/typec.h | 10 ++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 1ccf5385d559..957add6b73e9 100644
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
2.51.1


