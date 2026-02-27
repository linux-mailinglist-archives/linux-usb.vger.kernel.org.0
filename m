Return-Path: <linux-usb+bounces-33796-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LVaGLbnoWlRxAQAu9opvQ
	(envelope-from <linux-usb+bounces-33796-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:51:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B51BC31D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51FB930B2CB9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 18:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DAE3A1D05;
	Fri, 27 Feb 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD2wxj4J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D723A1D01
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218243; cv=none; b=CihEkb1CwVp0sONcb2h2CpfXqU5vjN9PzEYzgM9layAmg+1XW55yTKMTKapDhEAZuw6qG1903S7xXR2qwayuKwfI+KVmVtcpVU9Y43LH2nfXVm145lgkdWSIaWxrtWmNPbqujm5zN+65EUXD0yyK9BpP/bpc9I9MGwyrfxY1FXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218243; c=relaxed/simple;
	bh=A6RjsAimFVE2c0vEDaZfMfkwb5jOhElTdG8K5Z3+k/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gb+2wQVeDEk9atTu0sflxbczfqqEQ74JKjpCakM1Zy8WRXVUjIRDp1INLcKw1uO8wxf02nmfyRWru3MfOeBDnZEEIkaNhszzgsf1fonW2eRNgKpyZwcxHYlvBYqhAmm/2XhNXGy6L2oGH7559TnhROg5Z6dhZKIHFVsWUzOuDXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD2wxj4J; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so840552a12.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772218241; x=1772823041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5hgdG67NhsA8/s80Xhr0nDKSwgAo+rNFXpqsrrmAaM=;
        b=LD2wxj4JMRiCgAxylrxEQZ2B7F7ioVZfzln6pfvSZbc1MYJLBqHDI/jP2YHOJlqB0f
         XFxhUi8uwr6p4QsoxxWKrnrl5SjpCaoTh9CTGcjKv78oGuP7iT19V7M21pbu2TUUti2n
         gNUzJLZEad77aNsiIGjuBfE+k7Id5wnAw/hSavqPi8wgP1IPZVWp1Aqm8xh7Okz8bIBg
         MVbuqbsspZvcTnyARbGdabkK7prHskan8kyJUeBEla5q3B1exlE+Me5D2f75C3JEWeT+
         iO+eoz7RCnJq4fLzWcLR2Uejyjh7asVXoZlDsmxT0DnjwbUw3eQNUsLy04bqOhU+8KVh
         Ze5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218241; x=1772823041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5hgdG67NhsA8/s80Xhr0nDKSwgAo+rNFXpqsrrmAaM=;
        b=Dpw6me79fUOaKOkAUObVIZL0X3K6xkg+ZSI95eQ6yF5wxfwO8IHWB6am7w3fd1tQG0
         16SMrBFOMUUo/TjBbuUEDvaKWG3c2MBKaQ9cEzWvpkqOO/rRWWDpeXk66DvbezCLP4tR
         FD9WR2ExIjO9gWzU331gXppoOZd5Pzzsampjv9arPRWT+LAn4WQRpCefjqJN2eGvDhet
         xxuzNiXEygnC+cARPlzeW2rhKIeKCtU+0PlX4zQws1XPPddgFdWSc0q0xWmd979M8eIF
         s87AMq+rctldskTDerxuBBEETd5YXB/qbK1ly4LFyvsklqfXEomKa1hH/g3+FJVvvCfK
         WZgA==
X-Gm-Message-State: AOJu0Yy0FCoCg0clcR1QlaJeSwZyO63OYyoI4D/sN9MKjRr8h0XxJR55
	VwEu4/zxf2kIsfQXE/UwCrJOEB6h3pYShbk1QY8OXrmXO3UW1FbqmyZi
X-Gm-Gg: ATEYQzwypt3/IOgv4j/YmvIIwQPuBUgRpPe4GzACdTsntn7UUrWK7YLpC4o09sHMUZz
	8mfv20aWsNvN7jXvWu36sAfIPZ+lvKtwgz5H9Jskb/hSdc3iDxS10iDPt3U87fkb/pbf0Uga7Zy
	o8VBGQl050Yxc7m++9LwlWzrJ2FOMbVN4ExzfIgj0oOkBdk0XF5qyT6UCtE4+oHP2rFPsJOf0+L
	XVZj9V+MuFc1pn8YOMOd/5L2zKGagmsO5QTho1HaX93iK39mk84IdkE+JF5GqHSG/ryENcZojWv
	UnsQx6vVSABU+kLL9mPjsjbnPZgQ+NnmWBNPBy5gUR+eolbO9yLJvv75BRjaG9y4UjSgaKHhoU+
	AtMj/qIazytIn5V3wLwE+56wKi4XM89N/lOxXVmCheeq1ueavf2LgWBO6ve/xM6i8S9CNe5czUH
	M1SuK11j03dnJ4XPvoknDSZioN+ylXJo7qG+rhaExa6xT1jAojNovpNfvzO0A7rGU3o9do5+8=
X-Received: by 2002:a17:903:2ac3:b0:2a9:4bd9:bba1 with SMTP id d9443c01a7336-2ae2e4e2052mr28017095ad.52.1772218241125;
        Fri, 27 Feb 2026 10:50:41 -0800 (PST)
Received: from HRD-WDG8GDY3.roa.hexagonmetrology.com ([49.43.203.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm5559002a91.1.2026.02.27.10.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:50:40 -0800 (PST)
From: Venkata Swamy Kassa <venkatswamy7@gmail.com>
X-Google-Original-From: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
Subject: [PATCH 2/2] usb-typec-hd3ss3220-Add-sysfs-attribute-for-USB-role
Date: Fri, 27 Feb 2026 18:50:21 +0000
Message-ID: <20260227185021.767948-3-venkata.swamy.kassa@hexagon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
References: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33796-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkatswamy7@gmail.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hexagon.com:mid,hexagon.com:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF4B51BC31D
X-Rspamd-Action: no action

Signed-off-by: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
---
 drivers/usb/typec/hd3ss3220.c | 207 +++++++++++++++++++++-------------
 1 file changed, 128 insertions(+), 79 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3e39b800e6b5..9c8e1e9dadc2 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -5,66 +5,86 @@
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
-#include <linux/module.h>
 #include <linux/i2c.h>
+#include <linux/usb/typec.h>
 #include <linux/usb/role.h>
-#include <linux/irqreturn.h>
-#include <linux/interrupt.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
-#include <linux/usb/typec.h>
-#include <linux/delay.h>
-#include <linux/workqueue.h>
-#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of_graph.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/sysfs.h>
+#include <linux/string.h>
+#include <linux/module.h>
+#include <linux/workqueue.h>
+#include <linux/of.h>
 
-#define HD3SS3220_REG_CN_STAT		0x08
-#define HD3SS3220_REG_CN_STAT_CTRL	0x09
-#define HD3SS3220_REG_GEN_CTRL		0x0A
-#define HD3SS3220_REG_DEV_REV		0xA0
+#define HD3SS3220_REG_CN_STAT 0x08
+#define HD3SS3220_REG_CN_STAT_CTRL 0x09
+#define HD3SS3220_REG_GEN_CTRL 0x0A
+#define HD3SS3220_REG_DEV_REV 0xA0
 
 /* Register HD3SS3220_REG_CN_STAT */
-#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_MASK		(BIT(7) | BIT(6))
-#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_DEFAULT	0x00
-#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_MID		BIT(6)
-#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_HIGH		BIT(7)
+#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_MASK (BIT(7) | BIT(6))
+#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_DEFAULT 0x00
+#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_MID BIT(6)
+#define HD3SS3220_REG_CN_STAT_CURRENT_MODE_HIGH BIT(7)
 
 /* Register HD3SS3220_REG_CN_STAT_CTRL*/
-#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK	(BIT(7) | BIT(6))
-#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP		BIT(6)
-#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP		BIT(7)
-#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY		(BIT(7) | BIT(6))
-#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS		BIT(4)
+#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK (BIT(7) | BIT(6))
+#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP BIT(6)
+#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP BIT(7)
+#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY (BIT(7) | BIT(6))
+#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS BIT(4)
 
 /* Register HD3SS3220_REG_GEN_CTRL*/
-#define HD3SS3220_REG_GEN_CTRL_DISABLE_TERM		BIT(0)
-#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK		(BIT(2) | BIT(1))
-#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT	0x00
-#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK	BIT(1)
-#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC	(BIT(2) | BIT(1))
-#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_MASK		(BIT(5) | BIT(4))
-#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DEFAULT	0x00
-#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DFP		BIT(5)
-#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_UFP		BIT(4)
-#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DRP		(BIT(5) | BIT(4))
+#define HD3SS3220_REG_GEN_CTRL_DISABLE_TERM BIT(0)
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK (BIT(2) | BIT(1))
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT 0x00
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK BIT(1)
+#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC (BIT(2) | BIT(1))
+#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_MASK (BIT(5) | BIT(4))
+#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DEFAULT 0x00
+#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DFP BIT(5)
+#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_UFP BIT(4)
+#define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DRP (BIT(5) | BIT(4))
 
 struct hd3ss3220 {
 	struct device *dev;
 	struct regmap *regmap;
-	struct usb_role_switch	*role_sw;
+	struct usb_role_switch *role_sw;
 	struct typec_port *port;
 	struct delayed_work output_poll_work;
 	enum usb_role role_state;
 	bool poll;
-
 	struct gpio_desc *id_gpiod;
 	int id_irq;
-
 	struct regulator *vbus;
 };
 
-static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opmode)
+/*
+ * Sysfs attribute to show current USB role (device/host/none)
+ */
+static ssize_t usb_role_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct hd3ss3220 *hd3ss3220 = dev_get_drvdata(dev);
+	const char *role_str = usb_role_string(hd3ss3220->role_state);
+
+	return sysfs_emit(buf, "%s\n", role_str);
+}
+static DEVICE_ATTR_RO(usb_role);
+
+static struct attribute *hd3ss3220_attrs[] = {
+	&dev_attr_usb_role.attr,
+	NULL
+};
+
+static const struct attribute_group hd3ss3220_attr_group = {
+	.attrs = hd3ss3220_attrs,
+};
+
+static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220,
+				      int power_opmode)
 {
 	int current_mode;
 
@@ -78,9 +98,11 @@ static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, int power_opm
 	case TYPEC_PWR_MODE_3_0A:
 		current_mode = HD3SS3220_REG_CN_STAT_CURRENT_MODE_HIGH;
 		break;
-	case TYPEC_PWR_MODE_PD: /* Power delivery not supported */
+	case TYPEC_PWR_MODE_PD:
+		/* Power delivery not supported */
 	default:
-		dev_err(hd3ss3220->dev, "bad power operation mode: %d\n", power_opmode);
+		dev_err(hd3ss3220->dev, "bad power operation mode: %d\n",
+			power_opmode);
 		return -EINVAL;
 	}
 
@@ -108,12 +130,15 @@ static int hd3ss3220_set_port_type(struct hd3ss3220 *hd3ss3220, int type)
 		return -EINVAL;
 	}
 
-	/* Disable termination before changing MODE_SELECT as required by datasheet */
+	/* Disable termination before changing MODE_SELECT as required by
+	 * datasheet
+	 */
 	err = regmap_update_bits(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL,
 				 HD3SS3220_REG_GEN_CTRL_DISABLE_TERM,
 				 HD3SS3220_REG_GEN_CTRL_DISABLE_TERM);
 	if (err < 0) {
-		dev_err(hd3ss3220->dev, "Failed to disable port for mode change: %d\n", err);
+		dev_err(hd3ss3220->dev,
+			"Failed to disable port for mode change: %d\n", err);
 		return err;
 	}
 
@@ -130,12 +155,15 @@ static int hd3ss3220_set_port_type(struct hd3ss3220 *hd3ss3220, int type)
 	err = regmap_update_bits(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL,
 				 HD3SS3220_REG_GEN_CTRL_DISABLE_TERM, 0);
 	if (err < 0)
-		dev_err(hd3ss3220->dev, "Failed to re-enable port after mode change: %d\n", err);
+		dev_err(hd3ss3220->dev,
+			"Failed to re-enable port after mode change: %d\n",
+			err);
 
 	return err;
 }
 
-static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int prefer_role)
+static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220,
+				     int prefer_role)
 {
 	int src_pref;
 
@@ -150,7 +178,8 @@ static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int prefer_rol
 		src_pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC;
 		break;
 	default:
-		dev_err(hd3ss3220->dev, "bad role preference: %d\n", prefer_role);
+		dev_err(hd3ss3220->dev, "bad role preference: %d\n",
+			prefer_role);
 		return -EINVAL;
 	}
 
@@ -192,7 +221,8 @@ static int hd3ss3220_try_role(struct typec_port *port, int role)
 	return hd3ss3220_set_source_pref(hd3ss3220, role);
 }
 
-static int hd3ss3220_port_type_set(struct typec_port *port, enum typec_port_type type)
+static int hd3ss3220_port_type_set(struct typec_port *port,
+				   enum typec_port_type type)
 {
 	struct hd3ss3220 *hd3ss3220 = typec_get_drvdata(port);
 
@@ -217,8 +247,8 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 		ret = regulator_disable(hd3ss3220->vbus);
 
 	if (ret)
-		dev_err(hd3ss3220->dev,
-			"vbus regulator %s failed: %d\n", on ? "disable" : "enable", ret);
+		dev_err(hd3ss3220->dev, "vbus regulator %s failed: %d\n",
+			on ? "disable" : "enable", ret);
 }
 
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
@@ -239,9 +269,14 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 	}
 
 	if (hd3ss3220->vbus && !hd3ss3220->id_gpiod)
-		hd3ss3220_regulator_control(hd3ss3220, role_state == USB_ROLE_HOST);
+		hd3ss3220_regulator_control(hd3ss3220,
+					    role_state == USB_ROLE_HOST);
 
 	hd3ss3220->role_state = role_state;
+
+	/* Notify userspace of usb_role change */
+	sysfs_notify(&hd3ss3220->dev->kobj, NULL, "usb_role");
+	kobject_uevent(&hd3ss3220->dev->kobj, KOBJ_CHANGE);
 }
 
 static void output_poll_execute(struct work_struct *work)
@@ -263,9 +298,10 @@ static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
 	int err;
 
 	hd3ss3220_set_role(hd3ss3220);
+
 	err = regmap_write_bits(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
-				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
-				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
+			HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
+			HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
 	if (err < 0)
 		return IRQ_NONE;
 
@@ -283,17 +319,17 @@ static irqreturn_t hd3ss3220_irq_handler(int irq, void *data)
 static int hd3ss3220_configure_power_opmode(struct hd3ss3220 *hd3ss3220,
 					    struct fwnode_handle *connector)
 {
-	/*
-	 * Supported power operation mode can be configured through device tree
-	 */
+	/* Supported power operation mode can be configured through device tree */
 	const char *cap_str;
 	int ret, power_opmode;
 
-	ret = fwnode_property_read_string(connector, "typec-power-opmode", &cap_str);
+	ret = fwnode_property_read_string(connector, "typec-power-opmode",
+					  &cap_str);
 	if (ret)
 		return 0;
 
 	power_opmode = typec_find_pwr_opmode(cap_str);
+
 	return hd3ss3220_set_power_opmode(hd3ss3220, power_opmode);
 }
 
@@ -301,9 +337,7 @@ static int hd3ss3220_configure_port_type(struct hd3ss3220 *hd3ss3220,
 					 struct fwnode_handle *connector,
 					 struct typec_capability *cap)
 {
-	/*
-	 * Port type can be configured through device tree
-	 */
+	/* Port type can be configured through device tree */
 	const char *cap_str;
 	int ret;
 
@@ -316,6 +350,7 @@ static int hd3ss3220_configure_port_type(struct hd3ss3220 *hd3ss3220,
 		return ret;
 
 	cap->type = ret;
+
 	return hd3ss3220_set_port_type(hd3ss3220, cap->type);
 }
 
@@ -323,13 +358,12 @@ static int hd3ss3220_configure_source_pref(struct hd3ss3220 *hd3ss3220,
 					   struct fwnode_handle *connector,
 					   struct typec_capability *cap)
 {
-	/*
-	 * Preferred role can be configured through device tree
-	 */
+	/* Preferred role can be configured through device tree */
 	const char *cap_str;
 	int ret;
 
-	ret = fwnode_property_read_string(connector, "try-power-role", &cap_str);
+	ret = fwnode_property_read_string(connector, "try-power-role",
+					  &cap_str);
 	if (ret)
 		return 0;
 
@@ -338,6 +372,7 @@ static int hd3ss3220_configure_source_pref(struct hd3ss3220 *hd3ss3220,
 		return ret;
 
 	cap->prefer_role = ret;
+
 	return hd3ss3220_set_source_pref(hd3ss3220, cap->prefer_role);
 }
 
@@ -373,8 +408,8 @@ static int hd3ss3220_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, hd3ss3220);
-
 	hd3ss3220->dev = &client->dev;
+
 	hd3ss3220->regmap = devm_regmap_init_i2c(client, &config);
 	if (IS_ERR(hd3ss3220->regmap))
 		return PTR_ERR(hd3ss3220->regmap);
@@ -384,13 +419,16 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (connector) {
 		hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
 	} else {
-		ep = fwnode_graph_get_next_endpoint(dev_fwnode(hd3ss3220->dev), NULL);
+		ep = fwnode_graph_get_next_endpoint(dev_fwnode(hd3ss3220->dev),
+						   NULL);
 		if (!ep)
 			return -ENODEV;
+
 		connector = fwnode_graph_get_remote_port_parent(ep);
 		fwnode_handle_put(ep);
 		if (!connector)
 			return -ENODEV;
+
 		hd3ss3220->role_sw = usb_role_switch_get(hd3ss3220->dev);
 	}
 
@@ -400,8 +438,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	}
 
 	vbus = devm_of_regulator_get_optional(hd3ss3220->dev,
-					      to_of_node(connector),
-					      "vbus");
+					      to_of_node(connector), "vbus");
 	if (IS_ERR(vbus) && vbus != ERR_PTR(-ENODEV)) {
 		ret = PTR_ERR(vbus);
 		dev_err(hd3ss3220->dev, "failed to get vbus: %d", ret);
@@ -412,8 +449,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 
 	if (hd3ss3220->vbus) {
 		hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev,
-							      "id",
-							      GPIOD_IN);
+							      "id", GPIOD_IN);
 		if (IS_ERR(hd3ss3220->id_gpiod)) {
 			ret = PTR_ERR(hd3ss3220->id_gpiod);
 			goto err_put_fwnode;
@@ -424,8 +460,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 		hd3ss3220->id_irq = gpiod_to_irq(hd3ss3220->id_gpiod);
 		if (hd3ss3220->id_irq < 0) {
 			ret = hd3ss3220->id_irq;
-			dev_err(hd3ss3220->dev,
-				"failed to get ID gpio: %d\n",
+			dev_err(hd3ss3220->dev, "failed to get ID gpio: %d\n",
 				hd3ss3220->id_irq);
 			goto err_put_fwnode;
 		}
@@ -434,10 +469,13 @@ static int hd3ss3220_probe(struct i2c_client *client)
 						hd3ss3220->id_irq, NULL,
 						hd3ss3220_id_isr,
 						IRQF_TRIGGER_RISING |
-						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-						dev_name(hd3ss3220->dev), hd3ss3220);
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						dev_name(hd3ss3220->dev),
+						hd3ss3220);
 		if (ret < 0) {
-			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);
+			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n",
+				ret);
 			goto err_put_fwnode;
 		}
 	}
@@ -467,28 +505,37 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto err_unreg_port;
 
+	ret = devm_device_add_group(&client->dev, &hd3ss3220_attr_group);
+	if (ret) {
+		dev_err(&client->dev,
+			"Failed to create sysfs attributes: %d\n", ret);
+		goto err_unreg_port;
+	}
+
 	hd3ss3220_set_role(hd3ss3220);
+
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
 	if (ret < 0)
 		goto err_unreg_port;
 
 	if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
-		ret = regmap_write(hd3ss3220->regmap,
-				HD3SS3220_REG_CN_STAT_CTRL,
-				data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
+		ret = regmap_write(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
+				   data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
 		if (ret < 0)
 			goto err_unreg_port;
 	}
 
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-					hd3ss3220_irq_handler,
-					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					"hd3ss3220", &client->dev);
+						hd3ss3220_irq_handler,
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"hd3ss3220", &client->dev);
 		if (ret)
 			goto err_unreg_port;
 	} else {
-		INIT_DELAYED_WORK(&hd3ss3220->output_poll_work, output_poll_execute);
+		INIT_DELAYED_WORK(&hd3ss3220->output_poll_work,
+				  output_poll_execute);
 		hd3ss3220->poll = true;
 	}
 
@@ -504,6 +551,7 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	dev_info(&client->dev, "probed revision=0x%x\n", ret);
 
 	return 0;
+
 err_unreg_port:
 	typec_unregister_port(hd3ss3220->port);
 err_put_role:
@@ -526,7 +574,7 @@ static void hd3ss3220_remove(struct i2c_client *client)
 }
 
 static const struct of_device_id dev_ids[] = {
-	{ .compatible = "ti,hd3ss3220"},
+	{ .compatible = "ti,hd3ss3220" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
@@ -545,3 +593,4 @@ module_i2c_driver(hd3ss3220_driver);
 MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
 MODULE_DESCRIPTION("TI HD3SS3220 DRP Port Controller Driver");
 MODULE_LICENSE("GPL");
+
-- 
2.43.0


