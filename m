Return-Path: <linux-usb+bounces-7368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59D86D7C4
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 00:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 118F01F23F90
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 23:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4480913E7C7;
	Thu, 29 Feb 2024 23:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DfZ/IV27"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402AA13E7C3
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709249278; cv=none; b=tF/7mes3MY0PlhoJfqQgkxvAb5Co/NSQdEfQ0J4HFA786qPdikreX6i5GgBn+A8QawHCDlVzY+uKobPlE3NJpiCmll90MgSiI8lzOQirC46HlqFH7XR5xht4yR2yrMY7yszyjt4IkZvGgdlKxMwu7oQqMXzhvnO2sMIlB35vsSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709249278; c=relaxed/simple;
	bh=zVkV9Lv4z6NJ5nKGNK4w+Ge1IZKAPYn8766k2zyh1V0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UWadbvYeYEZf4y46P7N/m1fo5DOai9gs01LvqOk/PwtUd9Ats85SpFDjhZm+0GcNKhZePjJiMl3rjihRDa9EPMz2njaF7ysJYxevaH8mxIlahgeXpW/fCAuhOT8rtJXc2+HpOw0wAwTdCs0AoymK6gdpGp+aC2JG+cm7PN8BAU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DfZ/IV27; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-608852fc324so22662457b3.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 15:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709249276; x=1709854076; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9kAHr6PseqJ6J9peq4yN8LHGuh8P9E7ag/V2tVJ+14=;
        b=DfZ/IV27YKMGSlTp1HIDAuODg/zAtUYhzVxP2LWBzCw8SMmRBDQVCL9oVMbigkxZPT
         VA1fJxOgRgyonEday2QKbAaJ2TCyoeqrmXedGUg7pZ8Q11NV2AiWrxzZpFmXB34N0HN/
         Sn6mlpscZbfbHFP97DWmV7dpn6FuvCOrolAk2OFz/9V6J3jcHm3+C/kowibxJhjvH73s
         mrK+3+Ycl/ggd/dnIfktenkuXG01Pxu3KSs/JuKQFo4ZXdDxa9ABOeVsjTQ07MnV/W6N
         +JbvXvhj83c2V/B8fp4GlMd3LzENBYpbHlnksxVAU9DaeunexQzg2ybY2jthWGUuRXwa
         vWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709249276; x=1709854076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9kAHr6PseqJ6J9peq4yN8LHGuh8P9E7ag/V2tVJ+14=;
        b=L2khiL3KedbqguDvSK8IXQn1ic4cFsVt3+UGg7R8i/vykbYxXjZOOIMqJ0lkrAOKTV
         iMZU724oQ6uRxa8M+QzAnSfQCr6X1N6J3DHKs59hdODRuKwPRJcxBfqZ32H4ejzIlnLr
         RV1uvEfl6BpOUWP2MmhZqNxKDe6eMcNsHqiSsdsoAyOov5ee1jalihIevcBS0hD3kaho
         P5UpFPZh7/XjTybeTQ6CzFbL+Cs26Ru/RqgYbHN5dz47y0UX93VNaByvlWc1a5lo/pjh
         +K4YZWgmxLSnYTx/ZCJ7e7+MWlcrGHqyeBCIEzNQo12lm3+Bmqx+LlaeiNZ/9NouqJBm
         bPnA==
X-Forwarded-Encrypted: i=1; AJvYcCWFz/RseX9gajkjOmaTrYMkdQVMONUz/xc2R3lhqaaa8aJfKkgDZbTL/E77vT5uW5iKfuD9odSKDm9+bWsfUCEsdyFRJ2nliMmx
X-Gm-Message-State: AOJu0YwV8/Wb27r0juNptdlPTVKMXMk3LK8QAHeJJBP4e/3+OX7zikqu
	qFMThRiUdsFzAnwS1ufvL6u5DBPS1S3a2O81woCaUoBtHb3VoDs69ETfe5rFTY0VLWnMrwTTAFM
	LlQ==
X-Google-Smtp-Source: AGHT+IEyPaBPyUk4B1LwqqJGD/dGBn71yAtbHF2GaEzzXAimWpS585c7j/xu8ZbvSsrnqic/d9XFYGOT+3o=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:c17:b0:608:8773:85da with SMTP id
 cl23-20020a05690c0c1700b00608877385damr8741ywb.0.1709249276217; Thu, 29 Feb
 2024 15:27:56 -0800 (PST)
Date: Thu, 29 Feb 2024 23:26:23 +0000
In-Reply-To: <20240229232625.3944115-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240229232625.3944115-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240229232625.3944115-3-jthies@google.com>
Subject: [PATCH v3 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Register cables with the Type-C Connector Class in the UCSI driver based
on the PPM response to GET_CABLE_PROPERTY. Registered cable properties
include plug type, cable type and major revision.

Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Expected cable properties populate the USB Type-C connector class sysfs
paths:
nospike-rev4 /sys/class/typec # ls port0-cable
device  identity  plug_type  port0-plug0  power  subsystem  type  uevent
usb_power_delivery_revision

Changes in v3:
- None.

Changes in v2:
- Shortened lines to within 80 characters.
- Tested on usb-testing branch merged with chromeOS 6.8-rc2 kernel.

 drivers/usb/typec/ucsi/ucsi.c | 73 +++++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  5 +++
 2 files changed, 78 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ae105383e69e7..7c84687b5d1a3 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -734,6 +734,52 @@ static void ucsi_unregister_partner_pdos(struct ucsi_connector *con)
 	con->partner_pd = NULL;
 }
 
+static int ucsi_register_cable(struct ucsi_connector *con)
+{
+	struct typec_cable *cable;
+	struct typec_cable_desc desc = {};
+
+	switch (UCSI_CABLE_PROP_FLAG_PLUG_TYPE(con->cable_prop.flags)) {
+	case UCSI_CABLE_PROPERTY_PLUG_TYPE_A:
+		desc.type = USB_PLUG_TYPE_A;
+		break;
+	case UCSI_CABLE_PROPERTY_PLUG_TYPE_B:
+		desc.type = USB_PLUG_TYPE_B;
+		break;
+	case UCSI_CABLE_PROPERTY_PLUG_TYPE_C:
+		desc.type = USB_PLUG_TYPE_C;
+		break;
+	default:
+		desc.type = USB_PLUG_NONE;
+		break;
+	}
+
+	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
+			 con->cable_prop.flags);
+	desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
+	    con->cable_prop.flags);
+
+	cable = typec_register_cable(con->port, &desc);
+	if (IS_ERR(cable)) {
+		dev_err(con->ucsi->dev,
+			"con%d: failed to register cable (%ld)\n", con->num,
+			PTR_ERR(cable));
+		return PTR_ERR(cable);
+	}
+
+	con->cable = cable;
+	return 0;
+}
+
+static void ucsi_unregister_cable(struct ucsi_connector *con)
+{
+	if (!con->cable)
+		return;
+
+	typec_unregister_cable(con->cable);
+	con->cable = NULL;
+}
+
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
 	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
@@ -807,6 +853,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 	typec_partner_set_usb_power_delivery(con->partner, NULL);
 	ucsi_unregister_partner_pdos(con);
 	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
+	ucsi_unregister_cable(con);
 	typec_unregister_partner(con->partner);
 	con->partner = NULL;
 }
@@ -907,6 +954,30 @@ static int ucsi_check_connection(struct ucsi_connector *con)
 	return 0;
 }
 
+static int ucsi_check_cable(struct ucsi_connector *con)
+{
+	u64 command;
+	int ret;
+
+	if (con->cable)
+		return 0;
+
+	command = UCSI_GET_CABLE_PROPERTY | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &con->cable_prop,
+				sizeof(con->cable_prop));
+	if (ret < 0) {
+		dev_err(con->ucsi->dev, "GET_CABLE_PROPERTY failed (%d)\n",
+			ret);
+		return ret;
+	}
+
+	ret = ucsi_register_cable(con);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static void ucsi_handle_connector_change(struct work_struct *work)
 {
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
@@ -948,6 +1019,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
 			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
+			ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
 
 			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
 			    UCSI_CONSTAT_PWR_OPMODE_PD)
@@ -1346,6 +1418,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		ucsi_register_partner(con);
 		ucsi_pwr_opmode_change(con);
 		ucsi_port_psy_changed(con);
+		ucsi_check_cable(con);
 	}
 
 	/* Only notify USB controller if partner supports USB data */
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 469a2baf472e4..f0aabef0b7c64 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -265,6 +265,9 @@ struct ucsi_cable_property {
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_C	2
 #define   UCSI_CABLE_PROPERTY_PLUG_OTHER	3
 #define UCSI_CABLE_PROP_FLAG_MODE_SUPPORT	BIT(5)
+#define UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV(_f_)	(((_f_) & GENMASK(7, 6)) >> 6)
+#define UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(_f_) \
+	UCSI_SPEC_REVISION_TO_BCD(UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV(_f_))
 	u8 latency;
 } __packed;
 
@@ -400,6 +403,7 @@ struct ucsi_connector {
 
 	struct typec_port *port;
 	struct typec_partner *partner;
+	struct typec_cable *cable;
 
 	struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
 	struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
@@ -408,6 +412,7 @@ struct ucsi_connector {
 
 	struct ucsi_connector_status status;
 	struct ucsi_connector_capability cap;
+	struct ucsi_cable_property cable_prop;
 	struct power_supply *psy;
 	struct power_supply_desc psy_desc;
 	u32 rdo;
-- 
2.44.0.rc1.240.g4c46232300-goog


