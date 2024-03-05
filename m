Return-Path: <linux-usb+bounces-7505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1149871405
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 03:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E37EA1C21918
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 02:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1D82942D;
	Tue,  5 Mar 2024 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yt3e/lp0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376B376E6
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 02:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709607535; cv=none; b=kdguVFFK2hdCRWqoayB6r91g0+yB6+zR1Ueopm4LEoOum3UDKd4fJKZX2Bq+g6WK7x5ksJEYaYrkfxgdR9iju6KjLOMD2wnZChp3N8cOFwxVslt13pcJZoUSLDZ92nf7l0ewtSN08KtkBHti6rPE1cUPc62H47vfYkev5FJ4bG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709607535; c=relaxed/simple;
	bh=guhJAh/g2XFvEwZmsYrQ52rgsrhkR0OPJnBbF/E6H3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WH93agNTQB0MeGftiUYhWA04ZeX7s+1JjK6+3OuzLe8clA2AUqgUIMfBL0fg84bXcnS787iZEilnbOQ8nqHvZFvtkCAO8x6h82YxAxNZM6nVoQ1ZXdr3+4AjVEWdPjotzP1d8mQdYdlZgw5o4usyEyc4aEvNZkOFNiO2UFr4NLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yt3e/lp0; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60957b52eecso81285477b3.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 18:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709607533; x=1710212333; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXQ4wGCONRrVmtWgcmqK76P+N3TnCyhONDuiY0mqDpk=;
        b=yt3e/lp0SVs8n/vOipsEcpZwsTo4VBSMQIzXllvwhzuGl+U0L+KbkADza5ZL3FmGTm
         8izE0xVVTYuNmUY0KOG1Gh1ATUrgTAgbR1QIQGpiU8k+IH2xLIsawOQ+3Ky+3xiNRh3g
         MCRAcE1jJPg3Nb3uKbcYsel79c+teoDaxV9EDbaQaBVNn+F84MhNI4xP9V4lgTBezL7i
         HhcEr1vkLGFQFzIeqzT37tNQyGQCVSASFczX3Pla4zcF3J1FhgPDYAA4Njz3xEqBKbp6
         rWh+lzlx86tODLjxX7stpJn8vPdTke4V5Sl7BnWa9/DIuEsuPicNuHB0kdSRSmxzlr0k
         cWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607533; x=1710212333;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXQ4wGCONRrVmtWgcmqK76P+N3TnCyhONDuiY0mqDpk=;
        b=iX4Hrqed0pOeQ4dJWoek/dUBQAZZvaXlk8kuEcpr0tJmaY5zmqpa+YBYq3aWjbgtiC
         zflWOUBNWBkvw1DyKs14R9Kf5jGBfOjFdE5DEFCNe3HkINA/PduNPSx4niC9hhQhxbFI
         tMy9TorX8cVYIPKAqs42eJVRmPVIECG3g1mKCZ5K51gcWf5VF6CL9pwYQv7sCI6tZa4E
         /X8tuSBF6T7eZXJGN/0sloW/uDOKcv7biwX3BlV8YQ7E1ZLOuvC98UXuUVGN89ZNCNZy
         QhBVKDamCbwy0V2wHUapTs0I/xoitujQQMVGG+e0mu20Doq6YHbIg+SDtdVbXYgWPJHM
         0GpA==
X-Forwarded-Encrypted: i=1; AJvYcCUqp7AiNPFBx4d76GWFAv5qs2XNdiXW/iQneHxGsRacsH0629t8/8N6wT54ol7dk2wecStuQAhQoRwn1Y/X1aVtMRV7cWOAal39
X-Gm-Message-State: AOJu0YyKn4YQxAvT1eYQEMHn7/Q+/jZvOjQeK1bhcRO7aghg8xYh3oi1
	z1FsTOGKR68RiTUVCIjr2hCjdAkpQrbiBAUPTmxqrNPNzvK7SG3H9aRxBrjy/HNwrrq+nTIXCph
	E6w==
X-Google-Smtp-Source: AGHT+IHfrLpUgtt3CTZ5FMRgkjDohjp03jIVGFGELjuRMv1792ZeK7TRpH0FkkzffYkvT9zza4JfpigzZyY=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:1505:b0:dc6:d890:1a97 with SMTP id
 q5-20020a056902150500b00dc6d8901a97mr394802ybu.9.1709607533143; Mon, 04 Mar
 2024 18:58:53 -0800 (PST)
Date: Tue,  5 Mar 2024 02:58:02 +0000
In-Reply-To: <20240305025804.1290919-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305025804.1290919-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305025804.1290919-3-jthies@google.com>
Subject: [PATCH v4 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
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

Changes in v4:
- None.

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


