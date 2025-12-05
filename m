Return-Path: <linux-usb+bounces-31200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA56CA65DD
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 08:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA98D319FCAC
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 07:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D892EB860;
	Fri,  5 Dec 2025 07:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oDn9CHCb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04252F6173
	for <linux-usb@vger.kernel.org>; Fri,  5 Dec 2025 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764918478; cv=none; b=orphO+r9MF6aUP0jftnLtyfbHJ6tMTikJ0Aye9rZlVlx2kyhy1FDkdJrwti4GmiOL7W7GUSlYfblGRyEjZGDmzTW5oLhVyq7bEuF+dsp3ktNC04yM709CLDIJVlm4zLkGFpWN4ae7Xy+PYu/eDLm9DndJBEzEW1CZu7n2yOrVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764918478; c=relaxed/simple;
	bh=sdKnm2OkALQygwLRJTEqcD/dBsuHmlcpo8J9y667oQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UNtit7DBKXrzYBJ1fogtCyGH83ZMcdmfra8NQOLmXwOATZTkp0wod6aQ5QhGkLJW+IFhQag1YjsP2EL+LYHbZN03B0PGHN4Njg6j9Q3UV3GSOPkm4fncnQjDLgGEd67uDZWNz7+VzC/VctJdts/GCNDd0HaZ2J1MeGNx2COKIkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oDn9CHCb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-341988c720aso1407307a91.3
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 23:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764918470; x=1765523270; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NiL8q2/o/Fz5xCoSWc8aZjZWPIN03XsSDmO6PNCHKhE=;
        b=oDn9CHCbva7+QQczE1BWXuk0cgrULd/GzCLjQ9BTJavvG4HspyA+HBEUbIVbavm3h7
         aIY67fTEWONq0Dh7cdVu5wAHiaAUwA7V/RHZEc8wONbiSMKjXoruObPoRWJdopNo8YIc
         V3sYvkZBBZBDfURnndr6iFpcqxRAbBCnoziYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764918470; x=1765523270;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiL8q2/o/Fz5xCoSWc8aZjZWPIN03XsSDmO6PNCHKhE=;
        b=gJRC60CyrHc5qvSzMM0BHcuyjBxPoz9Nbre7L8RVGth9OxE9dFDDoixzo9QUUa1Od0
         3OCREqvbog5GdsTR2/mU1cFBLGLLtDdzbmKTbUCMU4g/GS6sgt90/ZQGG5pAqpgQBpYA
         7iCX4yrnufiWLO9SVvq1Yit/H2a0P2Zr6yUPcyWo74pQwe1+5TquGlni4VV/QyP1rPDo
         +UXrTJuvm+VkA/FzW1JM7H5QCIfRQdCo+dBDHQ4nrVhq5fdUqTFOmpVHbdb8i3eHLlcL
         tztXF7bqxACtJF9hJejiGE2ngQBNkaPCH6y95TBUNPjWvyG89F9XKUeNOZVzEJJFOXse
         2hVA==
X-Gm-Message-State: AOJu0YxUqaPMN2DmNg71q5ZYx1eTwHoxMbAZhVD4LznNeuIlt1NDjCj1
	mXlVPdh8Le2rF7PjwnD7nxpHz8zmgcCV4qrSmqTMFQ1iAW7Y7T3CuGxIYR/IeEGTpQ==
X-Gm-Gg: ASbGncvPM6CIaqjdzJ8fxbZEVm5+qOfUpwB7US/0TjsJdF56STpfuu8RVTG/FBzm4kw
	/9xCUG8jKVeajz5eLr5SD2YsdJpScW9MdT0HAzvRXvf9GCPXNEtZdAziJGEcrr+nGv5eChzLUMS
	NMMapReObcICmPAMMP7+xhmXEAorFlBLBWzmihDvFD72HdY9yQ8eKGRNuT6NlTTLWUBtjKYCZBA
	1D2RscH0TES4K7wx/r9F81ljtJieHK8UxioCV22E6bif7FIf4vUDZHwmXYVfhIS4tjp/4RUXabF
	CkbNUqWaKL0W8zN/KTWpxSlYDWSzm80WDhRDuGJ5Q0yKJfnmkMrHM1dp2sLbO+zinSDFECIr3s0
	xdaMRG+Fl6ppsEyG5ZoKFJfQgv7uGGejfrD025+vR8/wEaqKXjXQRn4cZ2i9q8ecCBg7cUxq5zU
	XYA4/wHP8/w9jtQY9EXzA3sy+MMqewmMehRXfYSS6x9v9vu37TEMOMubKDchGzEQ1HcmgkJq4px
	ERIAdNrrmU1wQ==
X-Google-Smtp-Source: AGHT+IFpqi/iSMlgQvabJbXmMYjdnfKr+Pb9KtvCHoPQ+Ze8nZa8cMYKLLfbcLFvhdvvsiksuXaa3g==
X-Received: by 2002:a17:90a:c883:b0:33b:d74b:179 with SMTP id 98e67ed59e1d1-349126e0e1cmr10402463a91.27.1764918469904;
        Thu, 04 Dec 2025 23:07:49 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2a00:79e0:201d:8:84c9:5640:4342:99a4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a30f363bsm3872830a12.33.2025.12.04.23.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 23:07:49 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 05 Dec 2025 15:07:46 +0800
Subject: [PATCH v6] usb: typec: ucsi: Get connector status after enable
 notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-ucsi-v6-1-e2ad16550242@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMGEMmkC/23NwU7DMAwG4FeZcqYodpI25cR7IA6J4605bJ0SV
 m2a+u54UxEVVD79lr/fd1W5ZK7qbXdXhadc83iS0L7sFA3hdOAmJ8kKNToA6JoL1dwQpj170rp
 NnZLTc+F9vj5rPj4lD7l+jeX2bJ3gsf1TMEEjkyiS49BajO80lPGYL8fXsRzUo2PCtfOLQ3HJg
 E1OG2MYN5xZOYTFGXERtO0omA6i33B27dzirDhPvXWtTykEt+Hcr0P945w46z1H30fq//2b5/k
 baKBRz3sBAAA=
X-Change-ID: 20251117-ucsi-c2dfe8c006d7
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.14.2

Originally, the notification for connector change will be enabled after
the first read of the connector status. Therefore, if the event happens
during this window, it will be missing and make the status unsynced.

Get the connector status only after enabling the notification for
connector change to ensure the status is synced.

Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
Cc: stable@vger.kernel.org # v4.13+
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v6:
- Free the locks in error path.
- Link to v5: https://lore.kernel.org/r/20251205-ucsi-v5-1-488eb89bc9b8@chromium.org

Changes in v5:
- Hold the lock of each connector during the initialization to avoid
  race condition between initialization and other event handler
- Add Fixes tag
- Link to v4: https://lore.kernel.org/r/20251125-ucsi-v4-1-8c94568ddaa5@chromium.org

Changes in v4:
- Handle a single connector in ucsi_init_port() and call it in a loop
- Link to v3: https://lore.kernel.org/r/20251121-ucsi-v3-1-b1047ca371b8@chromium.org

Changes in v3:
- Seperate the status checking part into a new function called
  ucsi_init_port() and call it after enabling the notifications
- Link to v2: https://lore.kernel.org/r/20251118-ucsi-v2-1-d314d50333e2@chromium.org

Changes in v2:
- Remove unnecessary braces.
- Link to v1: https://lore.kernel.org/r/20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org
---
 drivers/usb/typec/ucsi/ucsi.c | 131 +++++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39b0271667e80816270274b8dd3008..3a0471fa4cc980c0512bc71776e3984e6cd2cdb7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1560,11 +1560,70 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 	return NULL;
 }
 
+static void ucsi_init_port(struct ucsi *ucsi, struct ucsi_connector *con)
+{
+	enum usb_role u_role = USB_ROLE_NONE;
+	int ret;
+
+	/* Get the status */
+	ret = ucsi_get_connector_status(con, false);
+	if (ret) {
+		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
+		return;
+	}
+
+	if (ucsi->ops->connector_status)
+		ucsi->ops->connector_status(con);
+
+	switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
+	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
+		u_role = USB_ROLE_HOST;
+		fallthrough;
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+		typec_set_data_role(con->port, TYPEC_HOST);
+		break;
+	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
+		u_role = USB_ROLE_DEVICE;
+		typec_set_data_role(con->port, TYPEC_DEVICE);
+		break;
+	default:
+		break;
+	}
+
+	/* Check if there is already something connected */
+	if (UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
+		ucsi_register_partner(con);
+		ucsi_pwr_opmode_change(con);
+		ucsi_port_psy_changed(con);
+		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+			ucsi_get_partner_identity(con);
+		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
+			ucsi_check_cable(con);
+	}
+
+	/* Only notify USB controller if partner supports USB data */
+	if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
+		u_role = USB_ROLE_NONE;
+
+	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
+	if (ret)
+		dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
+			con->num, u_role);
+
+	if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD) {
+		ucsi_register_device_pdos(con);
+		ucsi_get_src_pdos(con);
+		ucsi_check_altmodes(con);
+		ucsi_check_connector_capability(con);
+	}
+}
+
 static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 {
 	struct typec_capability *cap = &con->typec_cap;
 	enum typec_accessory *accessory = cap->accessory;
-	enum usb_role u_role = USB_ROLE_NONE;
 	u64 command;
 	char *name;
 	int ret;
@@ -1659,62 +1718,6 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		goto out;
 	}
 
-	/* Get the status */
-	ret = ucsi_get_connector_status(con, false);
-	if (ret) {
-		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
-		goto out;
-	}
-
-	if (ucsi->ops->connector_status)
-		ucsi->ops->connector_status(con);
-
-	switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
-	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
-	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
-		u_role = USB_ROLE_HOST;
-		fallthrough;
-	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
-		typec_set_data_role(con->port, TYPEC_HOST);
-		break;
-	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
-		u_role = USB_ROLE_DEVICE;
-		typec_set_data_role(con->port, TYPEC_DEVICE);
-		break;
-	default:
-		break;
-	}
-
-	/* Check if there is already something connected */
-	if (UCSI_CONSTAT(con, CONNECTED)) {
-		typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
-		ucsi_register_partner(con);
-		ucsi_pwr_opmode_change(con);
-		ucsi_port_psy_changed(con);
-		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
-			ucsi_get_partner_identity(con);
-		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
-			ucsi_check_cable(con);
-	}
-
-	/* Only notify USB controller if partner supports USB data */
-	if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
-		u_role = USB_ROLE_NONE;
-
-	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
-	if (ret) {
-		dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
-			con->num, u_role);
-		ret = 0;
-	}
-
-	if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD) {
-		ucsi_register_device_pdos(con);
-		ucsi_get_src_pdos(con);
-		ucsi_check_altmodes(con);
-		ucsi_check_connector_capability(con);
-	}
-
 	trace_ucsi_register_port(con->num, con);
 
 out:
@@ -1823,16 +1826,28 @@ static int ucsi_init(struct ucsi *ucsi)
 			goto err_unregister;
 	}
 
+	/* Delay other interactions with each connector until ucsi_init_port is done */
+	for (i = 0; i < ucsi->cap.num_connectors; i++)
+		mutex_lock(&connector[i].lock);
+
 	/* Enable all supported notifications */
 	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
 	ret = ucsi_send_command(ucsi, command, NULL, 0);
-	if (ret < 0)
+	if (ret < 0) {
+		for (i = 0; i < ucsi->cap.num_connectors; i++)
+			mutex_unlock(&connector[i].lock);
 		goto err_unregister;
+	}
 
 	ucsi->connector = connector;
 	ucsi->ntfy = ntfy;
 
+	for (i = 0; i < ucsi->cap.num_connectors; i++) {
+		ucsi_init_port(ucsi, &connector[i]);
+		mutex_unlock(&connector[i].lock);
+	}
+
 	mutex_lock(&ucsi->ppm_lock);
 	ret = ucsi->ops->read_cci(ucsi, &cci);
 	mutex_unlock(&ucsi->ppm_lock);

---
base-commit: 2061f18ad76ecaddf8ed17df81b8611ea88dbddd
change-id: 20251117-ucsi-c2dfe8c006d7

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


