Return-Path: <linux-usb+bounces-17339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27519C0EF1
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 20:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43706B22C92
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 19:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E4D2178F5;
	Thu,  7 Nov 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z8jztd4I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F9217F46
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007907; cv=none; b=RloFhgJi59+0J89Vdqf18P+VrA/HewdU+X60/EBFs+IjvVQo64b1yr66OM7pj2mujKS/DYIP9BJmYrO0TUsrJJ+QDJyiKTY8O6Ib3Wmpnb9U3D+xg0MnBy7dAAIGGWXY2M79KMnSWK3uqjueWopmzJB6YzIrAmvmOao/UNC4cOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007907; c=relaxed/simple;
	bh=Wg/zBVFa4tGz8VOCaxh6a+i+WqdrvN3SJxMoDY3tJdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DzSDGVNo8EsMkGbIwVxYborc3D//TCSIPuk7Dvoe/t38SA2G8IBN2IF+PGl4ON2xIoFxzZZxhGbQ3DhcswWt5hoAXhOCnYZ66LqMQjx/oo2E94J9O0u/7Y+lRt9v0Daly1zKQdP/W3CtY8212ODWrW4cdl3vEau/TYlBZqItmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z8jztd4I; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e5f86e59f1so853596b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2024 11:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007905; x=1731612705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0CqREGwh6IVDq65gpD5flYOXg4XbjfkPAiJB5bPZJk=;
        b=Z8jztd4IrTCtswb35nOJ3ftwXL90Tshcq6OXaUQUwqzkbSAdaMIunWN2P2XFr7OcaT
         Fs9xU7WsC6Qd7pQ667aRdDdgCNfkdgOK3AxddbP/MVFnqNA1hm7DGweYObktdi8a/IRI
         I3Nqmk8JKyWCxwXoclPQ7kT6AIQAEBRE3dGzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007905; x=1731612705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0CqREGwh6IVDq65gpD5flYOXg4XbjfkPAiJB5bPZJk=;
        b=lFiucXRcv+ysuOXf8rsyubwSXT2Oh5o92bAyxNS3bQtUmlotaDjk4MwOHZnGuJghZ6
         prx63l/kh55Saf6Ezsp+vUL7CAsrTCjBgDqDuTH/Ncjp0+YwujIo45eTmxVM82HuPgdf
         PDhPGph1qEAoqAJsEbb2QcWYGtmnhkPWp2JToctydF5bHevBHckDmOgzcOsgmkh9+MZx
         br2D8qHH8OP88OhVKT1KXXd9naIQfQtcdU1uTXvheyzMtW8xLu/03LOPwXfZV0hJ7Cjr
         2GB9Bi8NMCfF1X9fJlDDjATQxC4bpM+Hvi+Hw9ZYIwV0Yg/JDmfK6T5qgQU/z0ptkPTB
         Bwkg==
X-Forwarded-Encrypted: i=1; AJvYcCXJJZ8C8/NBbsQvmz+W2X5Lfny58AjzC1YuiW4+FFn93RkVuy/0GpNePVLN3fh8VBSEjEkzG/pN0o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkWtRFNHqYpxUNKBS6RcfHuXgLj7X60FsbemJrxDFAqYa3GgC
	ZpsYFnZA+TyH4PI1xQK4UuJorH3U5x913MpeNvpn96HJVQBCLfsIyx+a2C2Fdw==
X-Google-Smtp-Source: AGHT+IFgcTmVRvr38xnLKX/v1C7i4XoxmAx6AzKMJtRI0ZbWE+Lp0wJnd9PeKHKFSh9kgaJYd9NuNA==
X-Received: by 2002:a05:6808:1791:b0:3e6:2471:4d10 with SMTP id 5614622812f47-3e794675446mr451938b6e.11.1731007904802;
        Thu, 07 Nov 2024 11:31:44 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7f41f65bf87sm1827097a12.70.2024.11.07.11.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:44 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] usb: typec: Check port is active before enter mode on probe
Date: Thu,  7 Nov 2024 11:29:56 -0800
Message-ID: <20241107112955.v3.3.I439cffc7bf76d94f5850eb85980f1197c4f9154c@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enforce the same requirement as when we attempt to activate altmode via
sysfs (do not enter partner mode if port mode is not active). In order
to set a default value for this field, also introduce the inactive field
in struct typec_altmode_desc.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3:
- Use port.active instead of introducing auto-enter field
- Introduce inactive field to typec_altmode_desc to set default value
  for active.
- Always make port 'active' field writable

 drivers/usb/typec/altmodes/displayport.c | 7 +++++--
 drivers/usb/typec/altmodes/thunderbolt.c | 6 +++++-
 drivers/usb/typec/class.c                | 5 +++--
 include/linux/usb/typec.h                | 2 ++
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 3245e03d59e6..f4116e96f6a1 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -767,8 +767,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
-	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
-	schedule_work(&dp->work);
+	/* Only attempt to enter altmode if port is active. */
+	if (port->active) {
+		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
+		schedule_work(&dp->work);
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index a945b9d35a1d..45567abc3bb8 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -212,6 +212,7 @@ static const struct typec_altmode_ops tbt_altmode_ops = {
 
 static int tbt_altmode_probe(struct typec_altmode *alt)
 {
+	const struct typec_altmode *port = typec_altmode_get_partner(alt);
 	struct tbt_altmode *tbt;
 
 	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
@@ -226,7 +227,10 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 	typec_altmode_set_drvdata(alt, tbt);
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
-	if (tbt_ready(alt)) {
+	/* Only attempt to enter altmode if port is active and cable/plug
+	 * information is ready.
+	 */
+	if (port->active && tbt_ready(alt)) {
 		if (tbt->plug[TYPEC_PLUG_SOP_PP])
 			tbt->state = TBT_STATE_SOP_PP_ENTER;
 		else if (tbt->plug[TYPEC_PLUG_SOP_P])
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index febe453b96be..b5e67a57762c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!adev->ops || !adev->ops->activate)
+		if (!is_typec_port(adev->dev.parent) &&
+		    (!adev->ops || !adev->ops->activate))
 			return 0444;
 
 	return attr->mode;
@@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
 
 	if (is_port) {
 		alt->attrs[3] = &dev_attr_supported_roles.attr;
-		alt->adev.active = true; /* Enabled by default */
+		alt->adev.active = !desc->inactive; /* Enabled by default */
 	}
 
 	sprintf(alt->group_name, "mode%d", desc->mode);
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index d616b8807000..56c01771c190 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *cable);
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @roles: Only for ports. DRP if the mode is available in both roles
+ * @inactive: Only for ports. Make this port inactive (default is active).
  *
  * Description of an Alternate Mode which a connector, cable plug or partner
  * supports.
@@ -150,6 +151,7 @@ struct typec_altmode_desc {
 	u32			vdo;
 	/* Only used with ports */
 	enum typec_port_data	roles;
+	bool			inactive : 1;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
-- 
2.47.0.277.g8800431eea-goog


