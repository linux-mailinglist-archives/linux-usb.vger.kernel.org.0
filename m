Return-Path: <linux-usb+bounces-32508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88045D3AA30
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72F843125199
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA870369218;
	Mon, 19 Jan 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MsCwvsFc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75790358D1B
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828742; cv=none; b=TAAx7uyyescG3SOwD4meo+D33b3sr6ZLDO7ZWJq75iyQnDnC4K5S27AUftyig4+L6zCLhX+3Ubj7IHeSXEaU1vQ2q+PPiBeD+sl5/sgxftof9MAzkfntn8UmM/YcKBrcnoAAbHCNrr+7GAj/IpShRLankCs7EY4buK+Tlb8Z9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828742; c=relaxed/simple;
	bh=frUPC546TbZHzSgYQ2uN6oeGYjK8P6K8ZiFxPhwwtAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWFrV53UxyppKtLbn/zQhn++P0ME2hg40qca2vR0nvEDQlLMXFsNaR17JUPI07G91u8dTPO07F4iTZREwjxMu8uUwi5yruAeiG/Zqd7fjcTUmRkcS6juxOFCRpmCB3GnnzddELDICLEEX0/9SD4vFBKzvTQOpVSykDq1t4PVgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MsCwvsFc; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso8913019a12.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828735; x=1769433535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjQjxmFvS2FQRrIuJW4DNjfu1H/SHcaCjJwkwuXOThw=;
        b=MsCwvsFcVSqCpzlTFgrm03I7WfjcEnpjhiqSTGwBfN2ULLFLZ6E9Or9rJh76zikmIC
         WZRJUUC+tDEnB5DL92wEniEnkBTcVkzcUmDoJTQ55bYnXO75tMrYKVGrT2x3V+UdJU87
         XVEUrrcnt7/W12QTDvOkhHjFhVoRcjDewaKfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828735; x=1769433535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjQjxmFvS2FQRrIuJW4DNjfu1H/SHcaCjJwkwuXOThw=;
        b=eVUOeTKcIevBIiKYoP7tGZ8TZ+jPfwrekBzxFZN3NgXLBcbjkQ1r/ViZSd+ABNmOnf
         a5sMvMYbCyCWk84iyqe3/IKCeiTbJ9J2sVcnggPHRBnlgO6nKV09bwmCswTT8USMGq1W
         F79r5Rltlc3HzRpFYNKTMSmtRnN/9y0JO3fhnNMJ6ZLlN3W4Chl300dWWgIaXoRfu5LG
         V+8cyoP/LNUG13XUy68XczOo64i2aztvnVtD/gQy9C5F5a4VjTVIFK4wGRuisZef6SfJ
         FtAzf/xAjtr9pGtAQEitx4YTdL+Sqg5ptUYJAJZHTHCG7Th7jmHDcl/n84eJ+Zu9Grj7
         dD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDDlwB+bQTqBlYZemTPKH33BcAr431wdmnUalBcShcjuTRRdZnm1pNAslcUyLmdDEqj5CmLujBP0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+L7gee556IhK5vT8eQMQnaHt57m1RSJhEakiq9YRzRePjlD1x
	9cFKpRrvYcRGXGYyluB7fD6zotn0PWXL8QevU1/RI/5WeR88XWk4+JUbuOopvxCRHQ==
X-Gm-Gg: AY/fxX4VbwebRmx24qydzZWoZLuWBWZlwsOsy5hqfW7Di9lIohFlpZ78CdMxm6NFhnd
	eoidrOUMHhZchaghImafJmQuLXs6hLzUxsg2g3592QA5AFLuJhXjevFs/xYfCmh0BVghGiXcMcS
	27yLYenTZdSGYihujz5kct/zEnI++RvqnjzXM1ecR3Trg52TAgIZLuUDtqQLcF7pO6SXsOXyPo2
	bVXHK7K1Mv118XpQt5i8KILYktNmfu6AHiKmCHd9uNQbFK30lnA6FC28XDQMd4sZ5tYLEpZiJwT
	cXhgXlx9+EU0jU33a0oA7llty4pLCqqkrZ27t39zhplkIjjcjZyAHzTTfhtENgnIgyIxQmnwJEB
	Imyl8FCmzw17mW0ZkuylJWm+hvAQ3N4kT9bOBa1ITPUGfAEUW2DJr3L6GAsmZv7nAEeXCAQYrQQ
	4XRy0sC5CYT8KEffGvlVG16PqxviMQ3dwcnrvyoXub2auR7atgkiu17WpQ/naPS8g9cBhleB2KU
	oR+ryDE
X-Received: by 2002:a17:906:f584:b0:b73:278a:a499 with SMTP id a640c23a62f3a-b879690c3ccmr870116566b.15.1768828734746;
        Mon, 19 Jan 2026 05:18:54 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:54 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 6/7] usb: typec: ucsi: Support mode selection to activate altmodes
Date: Mon, 19 Jan 2026 13:18:23 +0000
Message-ID: <20260119131824.2529334-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the ucsi port driver supports modes selection, it should implement
`add_partner_altmodes` and `remove_partner_altmodes` ucsi operations. With
these operations the driver can manage the mode selection process.
Once partner altmodes are registered, `add_partner_altmodes` is called to
start the mode selection. When the partner is unregistered,
`remove_partner_altmodes` is supposed to stop any ongoing processes and
clean up the resources.

`typec_altmode_state_update` informes mode selection about the current mode
of the Type-C connector.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
Changes in V5:
- Use the no_mode_control field instead of
  con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE
- Squash previous V4 patches 3/8 and 7/8 into a single patch

 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0f..251990475faa7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -314,6 +314,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 {
 	const struct typec_altmode *altmode = NULL;
 	u64 command;
+	u16 svid = 0;
 	int ret;
 	u8 cur;
 	int i;
@@ -335,6 +336,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	for (i = 0; con->partner_altmode[i]; i++)
 		typec_altmode_update_active(con->partner_altmode[i],
 					    con->partner_altmode[i] == altmode);
+
+	if (altmode)
+		svid = altmode->svid;
+	typec_altmode_state_update(con->partner, svid, 0);
 }
 
 static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
@@ -609,6 +614,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
 			desc.roles = TYPEC_PORT_DRD;
+			desc.mode_selection = con->ucsi->ops->add_partner_altmodes &&
+					!con->typec_cap.no_mode_control;
 
 			ret = ucsi_register_altmode(con, &desc, recipient);
 			if (ret)
@@ -831,6 +838,8 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 	if (con->partner_altmode[0]) {
 		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
 		typec_partner_set_num_altmodes(con->partner, num_partner_am);
+		if (con->ucsi->ops->add_partner_altmodes)
+			con->ucsi->ops->add_partner_altmodes(con);
 		ucsi_altmode_update_active(con);
 		return 0;
 	} else {
@@ -1119,6 +1128,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 		return;
 
 	typec_set_mode(con->port, TYPEC_STATE_SAFE);
+	if (con->ucsi->ops->remove_partner_altmodes)
+		con->ucsi->ops->remove_partner_altmodes(con);
 
 	typec_partner_set_usb_power_delivery(con->partner, NULL);
 	ucsi_unregister_partner_pdos(con);
@@ -1659,6 +1670,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->version >= UCSI_VERSION_2_0)
 		con->typec_cap.orientation_aware = true;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 410389ef173ab..4797b4aa1e35b 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -70,6 +70,8 @@ struct dentry;
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
+ * @add_partner_altmodes: Start mode selection
+ * @remove_partner_altmodes: Clean mode selection
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -88,6 +90,8 @@ struct ucsi_operations {
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
+	void (*add_partner_altmodes)(struct ucsi_connector *con);
+	void (*remove_partner_altmodes)(struct ucsi_connector *con);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
-- 
2.52.0.457.g6b5491de43-goog


