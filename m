Return-Path: <linux-usb+bounces-5498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5483B632
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 01:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F4D51C223A0
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 00:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A4079EC;
	Thu, 25 Jan 2024 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mk3yUOT+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58D747D
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 00:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706143508; cv=none; b=r6ePytRfpoJ2lopLAIZ+yRKwSfiBRuwNrxSQ4FV2gUNA9OUH+o6lAh5Axil227xG6E6u1na6ZR9WG9ddDTIVlpJCRfA+Mum6I34NVwQMneTuKi0J2n/AbLtd0WFBwYA1zoUQPBf4zkq+Z8vT/n3YwV/ku2tvon2qjhzZ/LUkhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706143508; c=relaxed/simple;
	bh=LUt4uhKuLzhEnRnMjdtUyO4l1frrpeODKi23vzrA7s8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FLgh5qRw1O/9VUNq2SQS3dMcqudL5v4mpzwtoBSdZ+Eu2/b7IGIDQu7jPOaxZTIwAK1mTsyjx/K5lKZZcHf9WxxGuqGUplmTHGwwrehidXitLkZmfl70MolzVJbq45tQPszZcOUcfHUDJxPYsglP7uGkytlDHji2YXsbpGcjlN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mk3yUOT+; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6029c85922dso22730957b3.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 16:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706143506; x=1706748306; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FTG13zB4Cw+QMij5k9sqfIjmokZzi07qqv8LYcYcXhI=;
        b=mk3yUOT+B5tSEy60QAtLTr5546Ng7KvLeZP/FfPFLzV6h/ks6S5jPuabgjx3NVCkyB
         YI3Y1ZaTJDsu7b1oPGetx4Gkvrv0pJc+W6l3ISryy5MPNh+2yo9MqbOMtxjhhf/UgmKV
         /oXmWSKSYsGynRiYNnBddvw1gqDVg9UFX+lD0MKucw6RzTCEEi30IKgQscYPayK4Ko/b
         nZSnHhhXQfJNjyx5B7uMRsOXEkDhkxkjeS/w6puD/RQBUOiIxX4R48P3bYEnokRFSTz3
         S82REcj5IK6iM7gfpwKj/dhVYAbLAJmBZesajxgxa/JAxYIHlKNWgJGJy4fhzQrJF0Ss
         /cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706143506; x=1706748306;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTG13zB4Cw+QMij5k9sqfIjmokZzi07qqv8LYcYcXhI=;
        b=WKdvX97G7otAMCpLrljpbZZ3rT3bN5EVmNC+np0wzwmMx7HP3u0iGqcS+d2tE50PXq
         2c6heyA31iqgfwpEfk3aVVEJjij8Za8w6DkNg6KspSHUUpP4dSTaKRQRDkyc0/9yAoH5
         KXIQ3bvJSzysVZ4Cjpo0LSUSC92RTPKqt5R6r3GMzHdMxknf9AaDMMpUAl5A3ldN34ZP
         KQJ8q4Kgo+oxgJFsZR4+QcY65m0vvbAbbzT5cl5PT7g5JKOFgCeoTvp/GmjabhB0//Yh
         v6NWkLk/8Mvd6k+A1p17A/O5g6L4ZWv5YpNG3IIS8tdhgRl7eOd8mbOxmDI+HWGdiqYa
         m8Eg==
X-Gm-Message-State: AOJu0Yz3/k0L3zf9A/jkUj1P3s1GcoPFoLstymgy4DEtobru4P/r2+RW
	uqoR8+irOisoXWvCknLsXbSoE4G+E49H3lrv21Hke6XCClAweleJUNtIUlDGEjuAhVQbXa7A74U
	Bg5kJwvJj554REaTS5QntFgquVlb5wMa2ow==
X-Google-Smtp-Source: AGHT+IGExB7gvGZM7JciBviHyowPn/wR9Sv5XLUASVZ2ni/v0X4Gsm4Wc1QEW3P9KXAf/QE5gZWRzR/8S85JAYClMjJfAw==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a81:7991:0:b0:5fa:4896:7114 with
 SMTP id u139-20020a817991000000b005fa48967114mr252ywc.5.1706143505848; Wed,
 24 Jan 2024 16:45:05 -0800 (PST)
Date: Wed, 24 Jan 2024 16:44:54 -0800
In-Reply-To: <20240125004456.575891-1-abhishekpandit@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240125004456.575891-1-abhishekpandit@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240124164443.v2.3.Idf7d373c3cbb54058403cb951d644f1f09973d15@changeid>
Subject: [PATCH v2 3/3] usb: typec: ucsi: Get PD revision for partner
From: Abhishek Pandit-Subedi <abhishekpandit@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

PD major revision for the port partner is described in
GET_CONNECTOR_CAPABILITY and is only valid on UCSI 2.0 and newer. Update
the pd_revision on the partner if the UCSI version is 2.0 or newer.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
$ cat /sys/class/typec/port2-partner/usb_power_delivery_revision
3.0

Changes in v2:
  - Formatting changes and update macro to use brackets.
  - Fix incorrect guard condition when checking connector capability.

 drivers/usb/typec/ucsi/ucsi.c | 23 +++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a35056ee3e96..2b7983d2fdae 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -782,6 +782,7 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 	}
 
 	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
+	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
 
 	partner = typec_register_partner(con->port, &desc);
 	if (IS_ERR(partner)) {
@@ -856,6 +857,27 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			con->num, u_role);
 }
 
+static int ucsi_check_connector_capability(struct ucsi_connector *con)
+{
+	u64 command;
+	int ret;
+
+	if (!con->partner || !IS_MIN_VERSION_2_0(con->ucsi))
+		return 0;
+
+	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
+	if (ret < 0) {
+		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
+		return ret;
+	}
+
+	typec_partner_set_pd_revision(con->partner,
+		UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags));
+
+	return ret;
+}
+
 static int ucsi_check_connection(struct ucsi_connector *con)
 {
 	u8 prev_flags = con->status.flags;
@@ -925,6 +947,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
+			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
 
 			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
 			    UCSI_CONSTAT_PWR_OPMODE_PD)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 94b373378f63..a0c452d09cf6 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -36,6 +36,9 @@ struct dentry;
 #define UCSI_BCD_GET_MINOR(_v_)		(((_v_) >> 4) & 0x0F)
 #define UCSI_BCD_GET_SUBMINOR(_v_)	((_v_) & 0x0F)
 
+#define IS_MIN_VERSION(ucsi, min_ver)	((ucsi)->version >= (min_ver))
+#define IS_MIN_VERSION_2_0(ucsi)	IS_MIN_VERSION(ucsi, UCSI_VERSION_2_0)
+
 /* Command Status and Connector Change Indication (CCI) bits */
 #define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
 #define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
-- 
2.43.0.429.g432eaa2c6b-goog


