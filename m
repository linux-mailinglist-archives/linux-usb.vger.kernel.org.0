Return-Path: <linux-usb+bounces-32265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7330D1902D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46E4D300216D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD61F38FF19;
	Tue, 13 Jan 2026 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FS7YHlSR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205DD3904D8
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309568; cv=none; b=MCdVvJ8y2YRrxGtAWbD+DcJD4hwEVUdq3QjmO4SGy+7lrhAxaGApMrmhuZCW8PlL06zVJakLBGS9/4AXSn7OlCODHqJ69RuGhAjdXKz/Yt0Mh600ScDe7Z0XJwC8S4V6TEo739RtzYOzcmCUr5VxsUGaU1y0KCJiFq6Jdv4Jk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309568; c=relaxed/simple;
	bh=6hB4iSeTY2hzXYn/hNKQEX6mOmgcsDLZ9qXbHlBnfpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnCwJ1rvClFGJ1rVK95wk6u2X76/3nhvrpcV3MuTwcoUJgsyxt3QYjD1M4R4SEihymXDfOYbdZcBW0j/RjvvN4x9ycLjRR/KTkH/sCF7w0NPM51Jfms7H1fZSJZ3TtPDh0fcqoLw9hicLlo13IN7ZWWBh8HDvRVa/ytmDqPSNJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FS7YHlSR; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso11085770a12.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309558; x=1768914358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS7Tohll2AatkB2QR0zQdrnu+HLuQcgbP0c4r4Qs4pE=;
        b=FS7YHlSRHAyhRgjZXAF6hl8ctVeleFFidIDy0fMFA2cr0mc8wHWziSsJ9faVsyBQQW
         EDmEmMUodrTdtFX67/Guxk/24bLLPmUFscwlMEstuq/r0BwnvmZ7QKR6QZ6lawgDISUM
         ZFwW3Xh7ZP2VCFCxIIzZZDT7FAaAL3opzX8I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309558; x=1768914358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eS7Tohll2AatkB2QR0zQdrnu+HLuQcgbP0c4r4Qs4pE=;
        b=RAKrXQ6733sjO3haQYkGpnOn3P50TWnSAIxvtlZV6PiPZUfBYN4sgRnNysr+NMCkx7
         hXWwzEOjM+BJoTQp4fgZEyuWxyqym8xmJ8/Frw2BLXSbNLXi30+dVINwjfDnpZZSq7PS
         TGzVXJ0dIiwreW2k5AwDwMLVfzEthgmh5V0YGY0RunQR85W+7poxN/lzOBtXlmPuNTuw
         /2jrwyGpC9HPiBjsTG7MwjHG+ASNsRxWRe3rvrpqMJ4B4IBt9J4EKRSy/6WN1/FYyHKa
         48wxyQAeJGU0un8cXDhjJqFSpHKqkuIhA7/sgLOWnHta/F7S2ikJlDTdv9aCAcWP9GGn
         1OwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzWcgTQoyTClQFsXAFLoQqGeGPi9P1bSxNOTNcFs0iLFZiYB4ChLve43n8PY3Zu8Up3AjsSDn8Q+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzz7gUxyzbCXk2rolBKyc2TLY3vcxke3srdDEt80mAmomOB83
	kVHWAgimrtiiZqAgTV6djDDax9Vv7H7GLH3cEm8wlxQBGjy/WhDN61BeLLaox0+nsA==
X-Gm-Gg: AY/fxX4L0sevfH1fCCGDv7FOf7zxfu5rhGauNF8cTe9Ov2xsFgWs699B7LwuNR/z9gP
	IytVvXKuAEX/mk7iMP5fQAQyjIkt7YBBg7aqHuxQ4jmioHa7BrMmms2qGSL4iZLmGV4T3N7R/7J
	pc01Q0PGL93nda6CDqP4iE5xwnJ9T2Q9av+1MmwuOGRzpxZUPH4BLRLHsmAjnp9ciHJ0e2pNcYk
	xxV8nKjMH4V3hePJfH61iZWW6xH4dssTKPF3j621P1u80F8OG4GQ+0J/5XGVN4wS74SWM7SbYcq
	AhzIytTisUEa0qI+SdHqIwdFYWa/ypPB4lr8x17Nau7wiIXc/Tw5wQW+zVkNRAf5nnAbZihdSkO
	W4sz473yCbplDEaRcoL/Ig45xvpGaiLvGpxx1y5EAxYfIWTP36sC4xk5TB7eUS4eho1q9GHTb1P
	B1VcEYMIi9L6Y5brGL5uBLcjNShbPdJNiPw7rtSLQ/9lm73vHM2DdcEtSPxjEy9+SzWY1NUWiPo
	QMMGAM7
X-Google-Smtp-Source: AGHT+IEWEpGJiEQBgSnQWIA4jUcOfUJbtgXrpOmBZHg9hM//JfV9vU4aw1fOZirNoGXoiYkOTCOCwg==
X-Received: by 2002:a17:907:e110:b0:b87:5433:9067 with SMTP id a640c23a62f3a-b8754339594mr23487366b.29.1768309558272;
        Tue, 13 Jan 2026 05:05:58 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:57 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 7/8] usb: typec: ucsi: Support mode selection to activate altmodes
Date: Tue, 13 Jan 2026 13:05:35 +0000
Message-ID: <20260113130536.3068311-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
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
 drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index deb210c066cb5..4a6e23b55b10c 100644
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
+					con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE;
 
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


