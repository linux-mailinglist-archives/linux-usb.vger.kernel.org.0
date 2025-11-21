Return-Path: <linux-usb+bounces-30793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E18C7907B
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 13:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6744035D24D
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 12:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C656313270;
	Fri, 21 Nov 2025 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mur8wDdT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019E5661
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763728433; cv=none; b=OZUX7Sn8muuNa9iBN6E7YmpATP5ELtp8/5gKH9W5KYc6prjA1zBZ5Y7MxzHW0ZS44r/g53fiWmQkKlTkJN4t0+EZuzVmfa8Q88LgTt8sj57qNkYEghsMgGc0pORXgRZKxNjJ9ozpgFd+g4znsbiHaFX6KqezfTJSwirm+iUwJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763728433; c=relaxed/simple;
	bh=D30w+lFkSuEsWEZWd5TmRaDaakz9t8FAnSsNiECeRDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M8PUneHLwsFj6wFOT5W2TU/5uG/VdB0XkU02e/Mns6Ty0csvPH04P5zBVEK1JMUWVzMTOS+SfAm0JQNnt2cPChzuLTUw0OPO1dCP4oQRYVq512mbUhDIzZwQUce9fSMpno5m7r31gOG4qpivdXZ08Jqu4LWDQPldFW+xiHVgoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mur8wDdT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-298145fe27eso30030125ad.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 04:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763728431; x=1764333231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1O/LUZs/EwmOPh3OAPG6JZTIgwsjUzvu5nYGtCSaFI=;
        b=mur8wDdTJFK70dcSFhDuSpu9yPHCT8vGj8akbF+zJR+xCtzK2PC8SdsXyMaFkFku4m
         LXf06I1zZy9aJSMLchCTcF7SwezSkIFQmshgIzkZ3LcuD1nbeU1TMWvkIowrg5i+CFqO
         /4iV+/wFS+7XyqXp0WO5dBfSiYWEpJnvIP6sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763728431; x=1764333231;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1O/LUZs/EwmOPh3OAPG6JZTIgwsjUzvu5nYGtCSaFI=;
        b=JGh6tYzuPFVL+tbvBd6yN7Ssj6LOMNivE5AB097lqOG+uGbuB+FTl0+kia4FpDThgr
         FsDZX5j6UdrYgoko6k3wbY0Nx9aHuA5HTmtGYmh2VkHtF8/MD0Pk/V3M72ZatVTCptb0
         NR4y9A6c6fXoznWGPLvmNmEKkHMUPlPUxFmkmxPqmDg60nbDlwcM+dPBTh9qsdj08c+w
         A184xg1Fs4PXMO1UGhT0Nvgu2EmILS0jtabqzUPSJxRUNlhhopkgf2d3MjwIm2aKnMOj
         IFOHRBKaNTzccFGXzSqPls415EI4pACPDxZQY3IveZTI4thcg4K3HRmIaxtzu64oElag
         V+jA==
X-Gm-Message-State: AOJu0YxJXibOd5+Wf3/MGbI4lQJ4drC/1oRSt/+THaWSS9M0PXvaqfra
	n7siEEZTZTvBRTreBA3XdQQ6b5awzwURToTpHES1e20AGy2rvml7u1pv1uhqJAR+fV3EezNSztp
	eobk=
X-Gm-Gg: ASbGnctEy54wmPrdX+4cKVWzuZiHGw27RmbQIFaSHPYC7liMAPC1HdE6SVY0jipuJKh
	2wf/0LLH8F03ncgMTS9R3/bUqSZjjJLy0D7Jhu1eG1OlFC8noh14c6Pm7nyeVCXqN6N780Ca2Ax
	VEa0Mar3sPsVqD0RCMlHLwCirgAV1z4L0LBynEH7ygxZcNhhRw0zrS9jYnZliFJiNhp0T75cWVK
	G7Q0lRfdXjPS0WpPIpMyc5RM0CmwnIkAMMTU0WyS7sfUI9sV54pbX8YX53XRzQx7NZhEVEjjdOn
	f/BMhz0iH8VZfAJwQSDbIcAdI2am4P9LiCjnX7NIZI7zRgqo6pV2KzwCfdJD/sAFiZ3h7W+7sTW
	6cfXgEiIDN4sWIgEPnnaiuC2uGGNIQa4HjXtrE92SGXaxGD6SnnGsVNrq/IiZQBeKwp8FKqRSwX
	z5A72r+EX/j/NccjW84PwMHcOeb5W9Ca7JMFEYecVhCYuBq10gddVa770WKK1T6CZzsq8xcKu4H
	Yhb+u9W5XzMRg==
X-Google-Smtp-Source: AGHT+IHThFTOdK037ehJoYrNFdjm9e8BasA3ZCW6CMwPcYSKEv+vFO8S2pmztks1dh/SEJkSUFiJTA==
X-Received: by 2002:a17:903:3a8b:b0:272:dee1:c133 with SMTP id d9443c01a7336-29b6bead617mr29646895ad.22.1763728430931;
        Fri, 21 Nov 2025 04:33:50 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2a00:79e0:201d:8:9b9a:95f9:c689:d44e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25deefsm56795315ad.56.2025.11.21.04.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:33:50 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 21 Nov 2025 20:33:48 +0800
Subject: [PATCH v3] usb: typec: ucsi: Get connector status after enable
 notifications
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-ucsi-v3-1-b1047ca371b8@chromium.org>
X-B4-Tracking: v=1; b=H4sIACtcIGkC/12MvQ6DMAwGXwV5bqrE4U+deI+qAyQGPECqpEStE
 O/egDpUyNNZ390KgTxTgFu2gqfIgd2cQF8yMGM7DyTYJgaUWCilKrGYwMKg7ak2Upa2gjR9eur
 5fWTuj8Qjh5fzn6Ma1f49BaIS6azpTEFtmWPXmNG7iZfp6vwAeyPiv1f/PEye1Sq3hdRaE568b
 du+xOTV+9MAAAA=
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
conenctor change to ensure the status is synced.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Seperate the status checking part into a new function called
  ucsi_init_port() and call it after enabling the notifications
- Link to v2: https://lore.kernel.org/r/20251118-ucsi-v2-1-d314d50333e2@chromium.org

Changes in v2:
- Remove unnecessary braces.
- Link to v1: https://lore.kernel.org/r/20251117-ucsi-v1-1-1dcbc5ea642b@chromium.org
---
 drivers/usb/typec/ucsi/ucsi.c | 124 +++++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 57 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39b0271667e80816270274b8dd3008..fbda94bfd5ed12ad8cfaedceb47ad15fee271378 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1560,11 +1560,75 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 	return NULL;
 }
 
+static void ucsi_init_port(struct ucsi *ucsi)
+{
+	enum usb_role u_role;
+	int ret, i;
+	struct ucsi_connector *con;
+
+	for (i = 0; i < ucsi->cap.num_connectors; i++) {
+		u_role = USB_ROLE_NONE;
+		con = &ucsi->connector[i];
+		/* Get the status */
+		ret = ucsi_get_connector_status(con, false);
+		if (ret) {
+			dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
+			continue;
+		}
+
+		if (ucsi->ops->connector_status)
+			ucsi->ops->connector_status(con);
+
+		switch (UCSI_CONSTAT(con, PARTNER_TYPE)) {
+		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
+			u_role = USB_ROLE_HOST;
+			fallthrough;
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+			typec_set_data_role(con->port, TYPEC_HOST);
+			break;
+		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
+			u_role = USB_ROLE_DEVICE;
+			typec_set_data_role(con->port, TYPEC_DEVICE);
+			break;
+		default:
+			break;
+		}
+
+		/* Check if there is already something connected */
+		if (UCSI_CONSTAT(con, CONNECTED)) {
+			typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
+			ucsi_register_partner(con);
+			ucsi_pwr_opmode_change(con);
+			ucsi_port_psy_changed(con);
+			if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+				ucsi_get_partner_identity(con);
+			if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
+				ucsi_check_cable(con);
+		}
+
+		/* Only notify USB controller if partner supports USB data */
+		if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
+			u_role = USB_ROLE_NONE;
+
+		ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
+		if (ret)
+			dev_err(ucsi->dev, "con:%d: failed to set usb role:%d\n",
+				con->num, u_role);
+
+		if (con->partner && UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD) {
+			ucsi_register_device_pdos(con);
+			ucsi_get_src_pdos(con);
+			ucsi_check_altmodes(con);
+			ucsi_check_connector_capability(con);
+		}
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
@@ -1659,62 +1723,6 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
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
@@ -1833,6 +1841,8 @@ static int ucsi_init(struct ucsi *ucsi)
 	ucsi->connector = connector;
 	ucsi->ntfy = ntfy;
 
+	ucsi_init_port(ucsi);
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


