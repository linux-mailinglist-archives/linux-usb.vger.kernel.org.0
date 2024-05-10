Return-Path: <linux-usb+bounces-10219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7CD8C2AF7
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 22:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71633B248FC
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3771D4F1F2;
	Fri, 10 May 2024 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3hc1OM+7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBCE47F73
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715371999; cv=none; b=JD4t8fYByyAqMbjx8d2BO3+D6Bdzy5xLQ2gR7hHlr9MHrifwGvlDXezWbcWgxf0xFxQZp6D8NnQ8jTQfI7ju4k8Kmtu2naVbhcRdxQyuM33cD7J5DZP0Na71PT2sPo/LSetZUjkQK9x5G1m5OCATm/zmnePDUoMtRUhwM530rL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715371999; c=relaxed/simple;
	bh=xQ2rEgQNzAAGgb7mqu13QJRWKCJLNrN/kv/VNptS1jg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aBI8OqM01T1GYhxWz7JpFJe01OSKHkI92QK0jr0VDWUOGy30JYVyZqqv2vDbsfw4n03A0RQutLJR0TnOxK9lDUoo4TJSfHW1UYmhWeWMhh+d+MgJ+nCzQJslGDPKamWRTvHA7FT4lTwgMLhS1LX3tYkK6nxAEluHeu+XxjGOWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3hc1OM+7; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de60cd96bf3so5192048276.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 13:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715371997; x=1715976797; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSLd4C6RWuRDc53VYjutUDg53I6/Zy/8sBQNs3K9WZo=;
        b=3hc1OM+7SaX/wGre2uA9snQ9GWdp08+vioF0MXI96Ee1wzU0E7FNqDiEcXvMC1+cbY
         5v7ddYzaxF3ep6fnzWmYGpvOrcPJuYPaV7++86nQ6V7DXonYBTuQDQgt7aPsnYCLaWIz
         80QDoSMiGFOLkDtZgRUrscyfzPNBQgfnMncpNps6YXj2wnDLxj5rfBGlwNnVypkF72jl
         fxvkVvNUCfB+DVv3mHOU59HbPkl5+EIv8RuclWw5KyTV7QRsSpRFDZ9qLGLTGGgcKq0m
         GAwj6FuSBCt0fDui56SmFUTILwr/sRzvzq0fOMY6gDaG6YtJ4csORezGZQSwjSsQ+iaz
         NNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715371997; x=1715976797;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSLd4C6RWuRDc53VYjutUDg53I6/Zy/8sBQNs3K9WZo=;
        b=nEw+KntoSg6HUq9l78dTk5L0KaNAGGBMbDGcgI3spz+vMQNaqwxiSCfoqVkbT1zaKp
         KttI6HrYpsjikaFPx7a6tYSL45nMbm8Nhndxlid0gQ1/zr0QEBbHHqLmpoOgkutt7nda
         WAndP1Uiu6Ew2qei7oeuinaGX9k7QBV3gzeyXD/YCcp4bYYj+EAbTKJ0glRH7ENLr/5Q
         gVEig9iOB7PgPng+E7pEuUObxF/1/gv81n8fQJAD6Prk26OnKpdFFtv1drwlwR64lJqp
         /S0Sw3Iq78sNlra8jbXfrBQQVBcMyAD47eNv4IBp5yo8Vpc1zCnrxyvRscVjbAhFh++l
         lcdQ==
X-Forwarded-Encrypted: i=1; AJvYcCViCNFn/6r5NafqRwYYamxL/plW3782JmbuXVpH1treJKsR6QcNHKqFi9jfjNATbooz98OD3uPkCCJmk5QXogi5W0MjvQ5/u2R+
X-Gm-Message-State: AOJu0YxoZcfx1FUfPqdrhgqjen9MEsr1T6jeaiRdWYUhs16CMG/zMYJE
	mlRXQkQGVSNw6rkaPaVgTEO7s7gLkGKE/MKBFv96iZRvzyUV/SNItN78QJrYodCADYdIaczfx/x
	LIA==
X-Google-Smtp-Source: AGHT+IFD1gnGHMQrq99VY43M6Y0/j9fkY40gUznD1x217Vy48vxegLfCwAslXjkIGfB/QJUUshSewOKBjGY=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:c0e:b0:dda:c4ec:7db5 with SMTP id
 3f1490d57ef6-dee4e57a059mr1072074276.4.1715371997051; Fri, 10 May 2024
 13:13:17 -0700 (PDT)
Date: Fri, 10 May 2024 20:12:42 +0000
In-Reply-To: <20240510201244.2968152-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510201244.2968152-3-jthies@google.com>
Subject: [PATCH v5 2/4] usb: typec: Update sysfs when setting ops
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

When adding altmode ops, update the sysfs group so that visibility is
also recalculated.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in V5:
- Fixed signed off by line order.

Changes in V4:
- None.

Changes in V3:
- None.

Changes in V2:
- None.

 drivers/usb/typec/altmodes/displayport.c |  2 +-
 drivers/usb/typec/class.c                | 18 +++++++++++++++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 include/linux/usb/typec.h                |  3 +++
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 596cd4806018b..92cc1b1361208 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -746,7 +746,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	dp->alt = alt;
 
 	alt->desc = "DisplayPort";
-	alt->ops = &dp_altmode_ops;
+	typec_altmode_set_ops(alt, &dp_altmode_ops);
 
 	if (plug) {
 		plug->desc = "Displayport";
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9610e647a8d48..9262fcd4144f8 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -467,6 +467,22 @@ static const struct attribute_group *typec_altmode_groups[] = {
 	NULL
 };
 
+/**
+ * typec_altmode_set_ops - Set ops for altmode
+ * @adev: Handle to the alternate mode
+ * @ops: Ops for the alternate mode
+ *
+ * After setting ops, attribute visiblity needs to be refreshed if the alternate
+ * mode can be activated.
+ */
+void typec_altmode_set_ops(struct typec_altmode *adev,
+			   const struct typec_altmode_ops *ops)
+{
+	adev->ops = ops;
+	sysfs_update_group(&adev->dev.kobj, &typec_altmode_group);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_set_ops);
+
 static int altmode_id_get(struct device *dev)
 {
 	struct ida *ids;
@@ -2317,7 +2333,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 			continue;
 		}
 
-		alt->ops = ops;
+		typec_altmode_set_ops(alt, ops);
 		typec_altmode_set_drvdata(alt, drvdata);
 		altmodes[index] = alt;
 		index++;
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index d9d3c91125ca8..eb7b8d6e47d00 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -337,7 +337,7 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	dp->con = con;
 	dp->alt = alt;
 
-	alt->ops = &ucsi_displayport_ops;
+	typec_altmode_set_ops(alt, &ucsi_displayport_ops);
 	typec_altmode_set_drvdata(alt, dp);
 
 	return alt;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index b35b427561ab5..549275f8ac1b3 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -167,6 +167,9 @@ struct typec_port *typec_altmode2port(struct typec_altmode *alt);
 
 void typec_altmode_update_active(struct typec_altmode *alt, bool active);
 
+void typec_altmode_set_ops(struct typec_altmode *alt,
+			   const struct typec_altmode_ops *ops);
+
 enum typec_plug_index {
 	TYPEC_PLUG_SOP_P,
 	TYPEC_PLUG_SOP_PP,
-- 
2.45.0.118.g7fe29c98d7-goog


