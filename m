Return-Path: <linux-usb+bounces-30894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F11C843CF
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 10:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3F613AB26A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4D72E03F5;
	Tue, 25 Nov 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JROSixR3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B423920C490
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764063105; cv=none; b=Jt+xmvYbiVZG2cM1evRMk4LHCqGInVVTtTcbhVi6R4i+6kRT/klbH+Dekag+XVlOjvO1E5RV7/Zla0+t1pdEbuchh1fou6eHPqixjcr2fFdga1A+Mavo7W8jVP3Jc4DliDbSiXapQJ9hyUc0qforW2rrTWhg3Z9pVktm+W+/+zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764063105; c=relaxed/simple;
	bh=nWI6+rJx07o3/tgVtbkkuOAPmOzkATKCnKEnAqmRCtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=okjhT1ChqeFq4Gi8Hn0makjCy9FjOrBb1HVHEke6vknA2fbW51aCabyCVv+zOA/hf3jPB/Egzkzmh2RLbG4h/DKLJ69pZzosrPHoRhl1r5Sc8qAgGciocoYl6XDca+U7dPdOcfWGmzXGYM+eTnM/PrzX/sQcZnIVRs3tSTbEvxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JROSixR3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2953ad5517dso64608995ad.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 01:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764063103; x=1764667903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XI88tgP+oQyvh+qfsEo6uduDmhK3Cr8h+TukEiHl6rc=;
        b=JROSixR3N9tRNbmnW51z/XAmzxgHDVTvHe2fHHYpobGD7Vm+YRCGrRr6QR3EvM9Jwn
         pNckWSx7gb7eOaGH1awbvjC+pPt/D8SJKmf2ZujPr9FsCbcehQ2+Dp4aKIdR7HNN7IHx
         FbN4AlyQimhmXQSeDH6F4Pi/jFjh8q+01zh9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063103; x=1764667903;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XI88tgP+oQyvh+qfsEo6uduDmhK3Cr8h+TukEiHl6rc=;
        b=LRFl58oDZKItogES4rRcCkV5lxGSuoNpWLtzvecayOikhhUrZYm1bn6qFH6PHBqXRL
         2to2kxLkfj/FIxnfQ9Nnhc2OL+GOSQZzdb43x4m9w8grgCgvB7UvoAERh6nhJ7g4xebI
         0cEtzu/kWifTOVtAg54EezTxVb3sxMK1xXn2UvEHzC/iX8eaWFrJbSrsioLg0qZ0pVWp
         CIjQKQPgrBfW+ISO1b9Qk/es2e7Yzek2/GyJzHrqGmXS1RVH5YYW1YZGI8IEwOzyYD9M
         bYJvXhxjInounTIkDm6QETBa9NOFv/QPPvcIRSySe0/cZfOnxDz+qx17e3YniN+dChGn
         fH1g==
X-Gm-Message-State: AOJu0YyAUfCrTdHOvIkY9W4PSl/fGEdzibneYcKUBYbk0BRkEd4iDqSN
	L1KjOvOA3l/EesuRfEBs2Tei7FT9ZbiVfI4oqSEALQGCYFNaRDoclVA++WbQNcDuB+9LU5/lFkF
	iqJA=
X-Gm-Gg: ASbGncu88WKhaR2Zh4/TFE7ypMx25t4pzYuEu8V+A/52tymdMtpddRkDCyW09BDOrZU
	qFfWdICQnO28bCQDyjhqTdJGrh6DtkcCHYK0z0qOk5afMzGkO9YrLwrpOz/2h4VMwGWBWrSmCJr
	ysNr5TxaLtxYJraUvuztrOUVp/8+TS/KSBYy8yTRqY4Twa5EuPrZIVJqRuKOE4V1YTziW4daJ0H
	yL0Rbox/b1Z6kNQELYNoZlOczZ93XhDFoRODH1YesW1VCftTFHgbITGoqWESdkqXGnWLMQm+TKj
	N5Ia/8xINeVWHmqqBFT6YyDe6+vBExiTD3i/aZ7BEe0cQg+rLSuLX/VIuur5AlmFV7E5mIevgTF
	rSteBXbzYDTrvzB5zK0Is3FSg+/jn+eKZPNHHESPYv2RumXRqOhXR15yOPTBLSyzCNexBRDekqp
	teViS/fUKrSa3Cxqtvf2PT3iEBITcmQQpWAmM1lRjopqJ5b0Mln1cTeU9pXza5fOAwLEtm8iQaC
	d70PIqeAo8sUw==
X-Google-Smtp-Source: AGHT+IGCudp+t+tITOHU6Vzp3o+3ns0cZK8scyq1opTU4ySBI/yvi7XmFWy/qYMhELHZyQYj6int/g==
X-Received: by 2002:a17:903:2a84:b0:25c:8745:4a58 with SMTP id d9443c01a7336-29baae4ed0cmr23014985ad.3.1764063102892;
        Tue, 25 Nov 2025 01:31:42 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2a00:79e0:201d:8:39ec:6757:bb7a:dfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e558sm163619435ad.55.2025.11.25.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:31:42 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 25 Nov 2025 17:31:24 +0800
Subject: [PATCH v4] usb: typec: ucsi: Get connector status after enable
 notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-ucsi-v4-1-8c94568ddaa5@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGx3JWkC/23MTQ6DIBCG4asY1qVhBhTTVe/RdCE/KgulgUraG
 O9eNC6MaVh9ZJ53JtEGZyO5FTMJNrno/JiHuBRE983YWepM3gQZlgAg6aSjoxpNa2vNWGUkyae
 vYFv32TKPZ969i28fvls1wfp7CiSg+RmtdGmbSqC66z74wU3D1YeOrI2ER1fvDrMzHIQpGefc4
 h/HDw5hdzw7BUxI3XAJqj65ZVl+vWaI4wsBAAA=
X-Change-ID: 20251117-ucsi-c2dfe8c006d7
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.14.2

Originally, the notification for connector change will be enabled after
the first read of the connector status. Therefore, if the event happens
during this window, it will be missing and make the status unsynced.

Get the connector status only after enabling the notification for
connector change to ensure the status is synced.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
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
 drivers/usb/typec/ucsi/ucsi.c | 120 ++++++++++++++++++++++--------------------
 1 file changed, 63 insertions(+), 57 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39b0271667e80816270274b8dd3008..299db3bfc7a1b152f709d6c0d8607eb061987f14 100644
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
@@ -1833,6 +1836,9 @@ static int ucsi_init(struct ucsi *ucsi)
 	ucsi->connector = connector;
 	ucsi->ntfy = ntfy;
 
+	for (i = 0; i < ucsi->cap.num_connectors; i++)
+		ucsi_init_port(ucsi, &connector[i]);
+
 	mutex_lock(&ucsi->ppm_lock);
 	ret = ucsi->ops->read_cci(ucsi, &cci);
 	mutex_unlock(&ucsi->ppm_lock);

---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251117-ucsi-c2dfe8c006d7

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


