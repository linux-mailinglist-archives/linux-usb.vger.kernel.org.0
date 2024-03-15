Return-Path: <linux-usb+bounces-7999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7487D292
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FEA81F23151
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 17:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5DD4AECB;
	Fri, 15 Mar 2024 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yOPoLDVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D294AEC6
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710523146; cv=none; b=FT2IJxUeflHr6PcBfka3zsYN3PGE4QB/w4qtL3BwFuk3qb2j7zkZmxvDhc6nUZ8imXOW59pECMgjlCliPY4dcjrlGvUiB9jU0PGqZD+y1qXFASQFsuZFu39v3NhAiC59Q74fe0WXggZhdkSDXCHAmg1VP1UAle2mLSS7IJmKNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710523146; c=relaxed/simple;
	bh=CQjYe/ZPokMSlqC+5Af+0gVvW0zoB0I3N8CI8slxcDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Djd6Qu4gmnrXmt1buQ1J80CAUzpYbaxg4VUbwA3UfSFDcVxf9HUCBjayjD1fwcInSlbWiYfZsDax5ADu6tn4wMrUz6Qpnx7bVsyUQ6RSlH5C+o/BCL4zBB4dRAVIGnVqnnED/zTwJyK/hi5485CbpBg6FoHMDBPSyDFQ09kkdZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yOPoLDVp; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a61b31993so39926907b3.1
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710523143; x=1711127943; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IoATwwFNq3kOKDIH3GVVvAafcWLxf3u2O07M0vRyfjc=;
        b=yOPoLDVpXEFKnpCYoZ3fBKZ24w7V0nNZ3YbjuRKiUZ4/r2Jevj8gR91r5PMyFmpAga
         KKy7m3G+Sy/1uZSd/IR3G3k1iQxIbLy/5e/AmcCF0tOnLWLcvgalOVFEJf9GbYpjCY2t
         QckZUfOtW6lEzERwRt+YLcxiMdDpBM6Cwf5SKf+rG+kc4s2LVtnOnGD3he5NwmwteZSP
         I8R6MfuASD/coukZ4lPX56DG+jNkdPfRy5wOz5X1vd9PZ9CIlFnUQCeJ9RW86PLpv9X+
         zzruBpo+Y3CUhLRfSqiDSbppjTveaI0rQ5Y1I70YRAMsPhTkfcSC6hjOlA3l53xD7Z9i
         1ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523143; x=1711127943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IoATwwFNq3kOKDIH3GVVvAafcWLxf3u2O07M0vRyfjc=;
        b=wfT7EALtATiI8xz5nRMuzlxkW0E05x+Qvet5EnJ/1k/xMBaPg6XQySNQYSVQkhGv3f
         NlriNWN4Q5vnfsuh1zBzHQZoXw0bNd2haz5swDcykTBj6+0r3ZlIjoQyu1joROxOZuks
         7iGonFoXqv5Qq1Pa3nO/zT5h/dhTkY/vdmlUANTZeTuX69FX9IeII8Vah/Kvkc2YmIDK
         CtBI1pkCFKaaH9yu0HHhb8PBVJReSq6d9VGNKADXJZgHdI/UJSLRzyItCDGdWj23/Ucx
         ua+uCuxMnWykkh97RR0/sX2KBX+FOSKj151FS3vCuRh1U6iuSJkTvtkkuHRQLaKEYcuP
         e3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWCGGw5RhO2bHYXT55Tx2Xpv6J8ih5/RfntQHGqI78KnIp27uYnemJOyxJMJYUUDNDAO8exQMzxdzAEAwEx7SAcLJm+ZgAGc60P
X-Gm-Message-State: AOJu0Yxj8quGASAkn1QZhKB2TrYR4N8/Fk2OSt2gXjQlWtW2Wq+pLcuV
	6UVZdC59LB//DBQ43HRjV2gXSbYyNrfeYLhm5xZAnFovR5iirCcjq1OLy1cWKSMqLqJHm3BTHHg
	tUQ==
X-Google-Smtp-Source: AGHT+IE1n/LebDzYNTcrNlqhHgQrl+blzuAPKIWp+/2nAJbW2z7OEpAlqvbzu/+juaIQpVocyTPwWxlVhAs=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a0d:d808:0:b0:60b:998c:389f with SMTP id
 a8-20020a0dd808000000b0060b998c389fmr1143271ywe.10.1710523143533; Fri, 15 Mar
 2024 10:19:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 17:18:35 +0000
In-Reply-To: <20240315171836.343830-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240315171836.343830-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240315171836.343830-2-jthies@google.com>
Subject: [PATCH v2 1/1] usb: typec: ucsi: Check capabilities before cable and
 identity discovery
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Check the UCSI_CAP_GET_PD_MESSAGE bit before sending GET_PD_MESSAGE to
discover partner and cable identity, check UCSI_CAP_CABLE_DETAILS before
sending GET_CABLE_PROPERTY to discover the cable and check
UCSI_CAP_ALT_MODE_DETAILS before registering the a cable plug. Additionally,
move 8 bits from reserved_1 to features in the ucsi_capability struct. This
makes the field 16 bits, still 8 short of the 24 bits allocated for it in
UCSI v3.0, but it will not overflow because UCSI only defines 14 bits in
bmOptionalFeatures.

Fixes: 38ca416597b0 ("usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY")
Link: https://lore.kernel.org/linux-usb/44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org
Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Confirmed a device which supports GET_PD_MESSAGE, GET_CABLE_PROPERTY and
GET_ALTERNATE_MODES still requested identity and cable information.

 drivers/usb/typec/ucsi/ucsi.c | 34 +++++++++++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi.h |  5 +++--
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cf52cb34d2859..958dc82989b60 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1133,17 +1133,21 @@ static int ucsi_check_cable(struct ucsi_connector *con)
 	if (ret < 0)
 		return ret;
 
-	ret = ucsi_get_cable_identity(con);
-	if (ret < 0)
-		return ret;
+	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE) {
+		ret = ucsi_get_cable_identity(con);
+		if (ret < 0)
+			return ret;
+	}
 
-	ret = ucsi_register_plug(con);
-	if (ret < 0)
-		return ret;
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS) {
+		ret = ucsi_register_plug(con);
+		if (ret < 0)
+			return ret;
 
-	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
-	if (ret < 0)
-		return ret;
+		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1189,8 +1193,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
 			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
-			ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
-			ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
+			if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+				ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
+			if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
+				ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
 
 			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
 			    UCSI_CONSTAT_PWR_OPMODE_PD)
@@ -1589,8 +1595,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		ucsi_register_partner(con);
 		ucsi_pwr_opmode_change(con);
 		ucsi_port_psy_changed(con);
-		ucsi_get_partner_identity(con);
-		ucsi_check_cable(con);
+		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
+			ucsi_get_partner_identity(con);
+		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
+			ucsi_check_cable(con);
 	}
 
 	/* Only notify USB controller if partner supports USB data */
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 32daf5f586505..0e7c92eb1b227 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -206,7 +206,7 @@ struct ucsi_capability {
 #define UCSI_CAP_ATTR_POWER_OTHER		BIT(10)
 #define UCSI_CAP_ATTR_POWER_VBUS		BIT(14)
 	u8 num_connectors;
-	u8 features;
+	u16 features;
 #define UCSI_CAP_SET_UOM			BIT(0)
 #define UCSI_CAP_SET_PDM			BIT(1)
 #define UCSI_CAP_ALT_MODE_DETAILS		BIT(2)
@@ -215,7 +215,8 @@ struct ucsi_capability {
 #define UCSI_CAP_CABLE_DETAILS			BIT(5)
 #define UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS	BIT(6)
 #define UCSI_CAP_PD_RESET			BIT(7)
-	u16 reserved_1;
+#define UCSI_CAP_GET_PD_MESSAGE		BIT(8)
+	u8 reserved_1;
 	u8 num_alt_modes;
 	u8 reserved_2;
 	u16 bc_version;
-- 
2.44.0.291.gc1ea87d7ee-goog


