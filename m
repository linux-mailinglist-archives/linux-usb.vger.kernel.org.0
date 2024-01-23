Return-Path: <linux-usb+bounces-5432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E6839C45
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 23:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 219291C26858
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 22:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B49E5578E;
	Tue, 23 Jan 2024 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TGXJzSl8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAF54BCE
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 22:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706049049; cv=none; b=mE8QOj6tUljWGka+OYotCkICysMQ2bbhHTm7EtcjB4zbIMC7cOofyJpiCBKMz4dCBPdi9OQj6WEat8HN3M416Baw1TdnH6ObwMzidvFEYsj2GR5HK/xSFzQFJN55f26QOWzVvbeBh96ZIs4meI3hefAOSH3YHD6ywmWGC2/PYSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706049049; c=relaxed/simple;
	bh=56wzal+YXRtHQbn7T/LWphhUaXqmgxriKJa43MLSexQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SMkO7NcnrzmYKGNoqAhRL57shqPeFAIAjMPgMovxGus2guYzIfssFXMjNWoqRL8wlzza3w4Tv/og1RF+vpc9w9aGgnIFBkmqSPUVwsm8uvt9A86PQevh+DmYetKG0fo66xC7nzmt97lEdpd7eQMjOukut9j0uCpRQlbUAydrMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TGXJzSl8; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6dd834c5fe7so473646b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 14:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706049048; x=1706653848; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KK7B2Hpvjem/TGRGJEqxUJ5QCI/gm35D+XD8uCyWzO0=;
        b=TGXJzSl8thIqjktun7+24Jdfz3Is/4acLKMif0NBATu7HoQ2f/j3wM6vHvpw79dB6x
         Ndx0ev+nghQxAoRlnwmg5IELEkuVSxdies5SyA0svatxm5gTubq4Onexjg/q1bH6ueJW
         mifsV+oeWKk2BDsjj1JLZVE4Udn2Wd9q+VmzA+J0h3MvanCUZBeG4zCi/fCcrcNeeSWt
         IeJ++qFV+XDmuBI480XN7sLogNoAQ+ep3Jus7cvFEU/rKJYWFMf5S17/kAhmUDyT6U2m
         igjXAB63t4IhuE46sjiXhoMgfC6KAXEs2+2AvUYIPmO+IOVq8OYhDVLCozlrc9v96ReY
         wC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706049048; x=1706653848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KK7B2Hpvjem/TGRGJEqxUJ5QCI/gm35D+XD8uCyWzO0=;
        b=SrCXdxe5w5rW4D6ceC0QiQRqCGJiJBtngzhBiC8hayCgKn7QiHiOb0vCNMkoD2fwqY
         uUqEU7aGQ5bQ3nTCdyzUNKbW9xMb1mQsuiUMnMu8vNJuLQzou8l5Ff/01i6tABkNRM7P
         8k6ISoWnZ3Jnr13jQSXQ0Caukvnh4YMYX4i6ucoKPhP1dr1BOvKEXdg4l2gEtihKepvu
         Vun/cc/QUx5cW3ipZtPTBCJ4wuG5wLMQ4zobzxiVi85EGd5YKBTswsfi+D3AwLB12s7b
         ECQWOJZrWPeR6rNbAT8PbvbjqPY+Pn5Z9AY3kOu1SXsERfwpUvuoQKz5D+83JVJru8fz
         qteg==
X-Gm-Message-State: AOJu0Yzb1lyawVmMwl8BWaH4D5kanit+DvLf1XHzxwHm7iCoJKrWgTe3
	NEuYXWKOJmZSemh0iM7Of0qqJrZLnjFP1A+e4wRtI7WYsHUGPjcJAsOlZX5UfMOpjL24GyWMWjY
	vF81HciZgQX7C0AxGFFfPOPAmIF+kDfyD/g==
X-Google-Smtp-Source: AGHT+IEnuDdXdhLH74mIfU2LZBClUJix1OyeyVi9+KxSoc17xKuUBC9JdyNf43QVD0DklslMm62r6qbMEKDk348MegIQ9w==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a05:6a00:985:b0:6db:d97b:6c98 with
 SMTP id u5-20020a056a00098500b006dbd97b6c98mr617462pfg.2.1706049047859; Tue,
 23 Jan 2024 14:30:47 -0800 (PST)
Date: Tue, 23 Jan 2024 14:30:36 -0800
In-Reply-To: <20240123223039.1471557-1-abhishekpandit@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240123223039.1471557-1-abhishekpandit@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240123143026.v1.3.Idf7d373c3cbb54058403cb951d644f1f09973d15@changeid>
Subject: [PATCH v1 3/3] usb: typec: ucsi: Get PD revision for partner
From: Abhishek Pandit-Subedi <abhishekpandit@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, jthies@google.com, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
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

 drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4edf785d203b..8e0a512853ba 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -782,6 +782,8 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 	}
 
 	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
+	desc.pd_revision =
+		UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
 
 	partner = typec_register_partner(con->port, &desc);
 	if (IS_ERR(partner)) {
@@ -856,6 +858,28 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			con->num, u_role);
 }
 
+static int ucsi_check_connector_capability(struct ucsi_connector *con)
+{
+	u64 command;
+	int ret;
+
+	if (!con->partner && !IS_MIN_VERSION_2_0(con->ucsi))
+		return 0;
+
+	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
+	if (ret < 0) {
+		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
+		return ret;
+	}
+
+	typec_partner_set_pd_revision(
+		con->partner,
+		UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags));
+
+	return ret;
+}
+
 static int ucsi_check_connection(struct ucsi_connector *con)
 {
 	u8 prev_flags = con->status.flags;
@@ -925,6 +949,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
+			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
 
 			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
 			    UCSI_CONSTAT_PWR_OPMODE_PD)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 94b373378f63..5e60328f398e 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -36,6 +36,9 @@ struct dentry;
 #define UCSI_BCD_GET_MINOR(_v_)		(((_v_) >> 4) & 0x0F)
 #define UCSI_BCD_GET_SUBMINOR(_v_)	((_v_) & 0x0F)
 
+#define IS_MIN_VERSION(ucsi, min_ver)	((ucsi)->version >= min_ver)
+#define IS_MIN_VERSION_2_0(ucsi)	IS_MIN_VERSION(ucsi, UCSI_VERSION_2_0)
+
 /* Command Status and Connector Change Indication (CCI) bits */
 #define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
 #define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
-- 
2.43.0.429.g432eaa2c6b-goog


