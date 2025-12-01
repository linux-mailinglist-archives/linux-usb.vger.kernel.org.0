Return-Path: <linux-usb+bounces-31065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03356C97404
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9DB04E1E5E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7EE30E836;
	Mon,  1 Dec 2025 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PL6kwHBC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09030DEAA
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591985; cv=none; b=LfxWCzFXsH8VGmkgezHfq/KFqlDqSyIK67E4hnYECjLj1Vr18+H9F9j/6xvinSOIhPWiEa3L8lo0oc1uHueG6MBUXb11LWUylO1qi1vrN+RneGKhdoxj93BPqYdNyGebo/tPPw0edGmwu8v9KJEaqcqssV11Ijxi2gtLhO9UOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591985; c=relaxed/simple;
	bh=GLVgDEZR/yW+dPBnqZM2+KBG6I9egBK1BkHdtIV8Re0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofnQ+KFR0DUWKLTvVqDY8mNecwD28iuYHnnFv6Qy2BujaYePSJ2TugAEPL+/5CYsLkzZEgTzjot32kaMEF2wXn9MuquDNjVAnP+a38nlEjQZO1apKVn3qvLuuC8AqQiAtPfK6/LvJ5Djrkuf/oU3CKJaSqQm6Nr1QYkvFEZ12WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PL6kwHBC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79af62d36bso68670566b.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591981; x=1765196781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5OrnZlcNOQDMQX5tOxuMnlnnAQiRlG+9PrDueeCn1s=;
        b=PL6kwHBCXaOG0GpyjSuR7vY3o72TK/qPdu4Vw7BpX/CxClIf2SLsfkMZB8d5sa80Cm
         XgY1fcfkuHn+QCihaVsVqQxKpYB4yTE5m86c/h/4J9Pm/EGtIzLCaPSlbE1iUpvJXn9j
         8vkfiEQpeNWJ9p7bs7cnx91iYKJVX7jide8Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591981; x=1765196781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k5OrnZlcNOQDMQX5tOxuMnlnnAQiRlG+9PrDueeCn1s=;
        b=DzghHMm5CB8zKQx0mGWuXbFLlolu72LpVY3rJN6fDQjLbAVf+ZNOOLbV33V2vjeqTE
         vFENvhNjWULrkzWEGORzkK+ytRXy+n+8PYqpnhjJe18MBDayt6g42cuHLMBCqhn8QctN
         bTys3C7ljBOvTn6r+biKjq1SbNThDOtc9fgDymhPNNyEEE8lsNcOrq3I4qL/jL7GQ1iB
         YMzkpKk8E49s3MV2ChDQjP8r/DxeAYZxLNnwsqcfk352B2uqAL9jrIt2lbzpa0wsP7k9
         RMI8L/sZvGcTDzCU1uEZvTTNq/tzTypLtOAlAL8qaMcY1ygEttOmXSg1nxPk00o2/uYp
         F/aA==
X-Forwarded-Encrypted: i=1; AJvYcCW1gI4DZaKCAm5MjQPnEhXOvixq+P5xsReYX38SnQOmWqxlhY18K3lG5TgXJlIRE+wtXmlKZUXUPNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoMjzJStBo+yElcfpI87bfXS/O2mcjTXl/8e5pKrVRWzd7AAG4
	7yf6dWOAAyy48mJvloGH8z9ZdWVZ9zbFEdAuZYA/7P+u/oBzQDK3yFUCnpNxycOXzw==
X-Gm-Gg: ASbGncvViOVIVqMh690zLSV75gowikyE81ZC6LsqrkgZXRe/9CHg0u+FVCRKiOrt0UG
	dUk+OSBWUKFPQeSjpKNzHhRNr3I9moGb0qEEFaa1fUwsxiIJ+pAJE1/JFr1Ri/3+wizF44ALeU9
	P+AAjwkmm+N8ieFeBjVzS2g3pI7gHSI3P2Znr31FkLog6eDUVbEARXeWoEuGHWmo/74/5PH35m6
	h+oKpzmFqKFhB9TbtyTIlDsaIFEY+dSa3jTye96iU/P7srUDb+85ns18qmn61W1L7uj428mDZoX
	zm9b+EgxNbtTXnjf7rfuT9Dv6LCtvEa/hIQ05/vJNlCpa4GaAziiS/1FZDjLebokhe3lsVld4TY
	SA8mCMH4RCC9JgaG9l8jbZnNlBfNeLfTbcgN2+13phhW2wLzR6G108TNPfQxlYTfYHUi4CSh057
	c9bdO2KJNy020JKvV2/UNomatWxKaogOFDySnHQshphgBnnm7g/5G6xKHisvsfc+dKDRiLdA731
	/J0csW606zuNo6tlFNYfA==
X-Google-Smtp-Source: AGHT+IHo6BcWEO8aAB6UKpwKa3lU4iaGYTslO6xLm3i1HGiV97D5oGlqLdkkc3mN0VhnSOUSh5Hb2g==
X-Received: by 2002:a17:907:980a:b0:b71:ea7c:e4ff with SMTP id a640c23a62f3a-b76c546d949mr2614872766b.6.1764591981126;
        Mon, 01 Dec 2025 04:26:21 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:20 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 4/8] usb: typec: ucsi: Support mode selection to activate altmodes
Date: Mon,  1 Dec 2025 12:26:00 +0000
Message-ID: <20251201122604.1268071-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
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
 drivers/usb/typec/ucsi/ucsi.c | 17 +++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 82c3efd72639..ee96c42e9e27 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -331,6 +331,7 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 {
 	const struct typec_altmode *altmode = NULL;
 	u64 command;
+	u16 svid = 0;
 	int ret;
 	u8 cur;
 	int i;
@@ -355,6 +356,15 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	for (i = 0; con->partner_altmode[i]; i++)
 		typec_altmode_update_active(con->partner_altmode[i],
 					    con->partner_altmode[i] == altmode);
+
+	if ((con->ucsi->version >= UCSI_VERSION_3_0 &&
+		 UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)) ||
+		(con->ucsi->version >= UCSI_VERSION_2_0 &&
+		 UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3)))
+		svid = USB_TYPEC_USB4_SID;
+	else if (altmode)
+		svid = altmode->svid;
+	typec_altmode_state_update(con->partner, svid, 0);
 }
 
 static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
@@ -635,6 +645,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 			desc.vdo = alt[j].mid;
 			desc.svid = alt[j].svid;
 			desc.roles = TYPEC_PORT_DRD;
+			desc.mode_selection = con->ucsi->ops->add_partner_altmodes &&
+					con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE;
 
 			ret = ucsi_register_altmode(con, &desc, recipient);
 			if (ret)
@@ -858,6 +870,9 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 			"con%d: failed to register partner alt modes (%d)\n",
 			con->num, ret);
 
+	if (con->ucsi->ops->add_partner_altmodes)
+		con->ucsi->ops->add_partner_altmodes(con);
+
 	/* Ignoring the errors in this case. */
 	if (con->partner_altmode[0]) {
 		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
@@ -1154,6 +1169,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 		return;
 
 	typec_set_mode(con->port, TYPEC_STATE_SAFE);
+	if (con->ucsi->ops->remove_partner_altmodes)
+		con->ucsi->ops->remove_partner_altmodes(con);
 
 	typec_partner_set_usb_power_delivery(con->partner, NULL);
 	ucsi_unregister_partner_pdos(con);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index f946b728c373..6e77bdbdaeae 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -75,6 +75,8 @@ struct dentry;
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
+ * @add_partner_altmodes: Start mode selection
+ * @remove_partner_altmodes: Clean mode selection
  *
  * Read and write routines for UCSI interface. @sync_write must wait for the
  * Command Completion Event from the PPM before returning, and @async_write must
@@ -93,6 +95,8 @@ struct ucsi_operations {
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
+	void (*add_partner_altmodes)(struct ucsi_connector *con);
+	void (*remove_partner_altmodes)(struct ucsi_connector *con);
 };
 
 struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops);
-- 
2.52.0.158.g65b55ccf14-goog


