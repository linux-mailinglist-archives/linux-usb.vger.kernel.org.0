Return-Path: <linux-usb+bounces-7964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3787C69F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 00:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C1AF1F21810
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 23:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733E114A9F;
	Thu, 14 Mar 2024 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gqC/UwyK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A614A8D
	for <linux-usb@vger.kernel.org>; Thu, 14 Mar 2024 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710460566; cv=none; b=gZwKozMGp8FqVnkLM2dVAO+0LfVGkqkkDNYf+6OozGwQEQbSYM8rwZ6NVDsa4xTFfv5BjY5OucCJ+Sjj8UzgswVJtmFtBYVRRZxvax041tL1QN71u8tdPgsFi6bebJzNbHmO2xIq5fgGvnEeBPK89589YKYVo6gCeAU2788VURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710460566; c=relaxed/simple;
	bh=lMm8K+AodxiYi8tXqILWI7k7boZWltszeBLr9QNMejs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IdrL/2mc3afx0PkXBa2rqeA4OJFqmbhGZv3NpHFT3lRvotBXhEzeQ8lH6CT65bs2CucehM7dWSWl8gNsjIYOLL/q6d3JSLFFfZkc+52ZxmerdjDEmmW5gZiGTemlRTo0zbiuzQ7iD3/rHRnXjXB9O8wx0ZlCArAQUnhAwmPOKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gqC/UwyK; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dccc49ef73eso2104048276.2
        for <linux-usb@vger.kernel.org>; Thu, 14 Mar 2024 16:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710460563; x=1711065363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=reK60bI2JPV8a+NiqxWRY8/H3bq3/jAN6jeedtb0O0Q=;
        b=gqC/UwyKEfLEZ7Mqm7copjJPgdcYh/m3l6j7KndUctC5yPB6N1P7Gy8ZhPcq51BSvI
         2YayZXQXNzujXZYOfB8328oeltjlfpzV3vW8GDxIC0gLdamzPO/lNmwI1YC6M308pHzG
         9UXGVby30QGA+EeVD61j9+VS8+lK3yVGA/hz8pWYDiZAU98IPNqkNzTVtfQbKbCDOOg1
         sy2nPHulqo5B8p0eY6Y+5fOgI5DjLjoJ9CEoEkpTMIbj2aHCDtZGqUvtw4qKQluWyx2h
         pWzUYqIdTufhixffkKBx6DkAoyDP2+KAE+7xi74nP+4acK3DjieAM9avkIj9o9mRgwkP
         c4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710460563; x=1711065363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=reK60bI2JPV8a+NiqxWRY8/H3bq3/jAN6jeedtb0O0Q=;
        b=CfJjSX0OF6MPuRZLbArNfFxucERIz7DKtE34VeELJmGHcmrTXSwwMUTo7rw49+3QQx
         cBtgMLseTqjUjp2t567FBihTX4LeN2WnEHZfSmKrPm+fxGhHzg2bMatZkDVe6sdFaVZ0
         sMbu//v4a1LWiKoAt+bT+HWq0JErfUpAomCdE6apJkEvU0k9HrrPcUGe0IBbxDiqEbbr
         bHONtyrCb/MPQ8ppFJZ2io5vs6a1WQ4RwvTCjYc7e1Wuo3aZOf6/t2NQfgziWRv9rXOt
         weU47t9qz4yhoIP+eDAwlBQ0uQDhAJBID2lqoFa8mx3Yz8oY9AAMfOZPDYpRUcl7qzhG
         VfTg==
X-Forwarded-Encrypted: i=1; AJvYcCXt1k2eaviPySW4p7RGn7Cd1/kV/CIFnmptIxzxVUjqidOHJi/+vkbl7er5WA0kVyy40KIJDoEm8vO4SYVjOf95G5A7IG3nQlnJ
X-Gm-Message-State: AOJu0YxGkOxwlGBBI3W2I8zIQkW7vs35NCjxmIVHDWQFTcsX76slVnUo
	ge2LC1QV3IS2BUMdq3LoUS2UNcVmJLfxPZ8zkydU5VOibV2l5Yp8QQmLYRrLOYBSwNsI4dqaeKK
	zSA==
X-Google-Smtp-Source: AGHT+IHygQCMs/pFOpoVvJfUXQCZoyWAzMBz5agD9ur45WKQ5IQ49y2RKNByX1rbw8VPqZe/N0llsbH+Qag=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:2848:b0:dc6:d9eb:6422 with SMTP id
 ee8-20020a056902284800b00dc6d9eb6422mr53232ybb.10.1710460563555; Thu, 14 Mar
 2024 16:56:03 -0700 (PDT)
Date: Thu, 14 Mar 2024 23:55:54 +0000
In-Reply-To: <20240314235554.90079-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240314235554.90079-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314235554.90079-2-jthies@google.com>
Subject: [PATCH v1 1/1] usb: typec: ucsi: Check capabilities before cable and
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
UCSI_CAP_ALT_MODE_DETAILS before registering the a cable plug.

Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Confirmed a device which supports GET_PD_MESSAGE, GET_CABLE_PROPERTY and
GET_ALTERNATE_MODES still requested identity and cable information.

This moves 8 bits from "reserved_1" to "features" in the ucsi_capability
struct. Really, this should be 24 bits to reflect the field size in UCSI.
But, as of UCSI 3.0, this will not overflow becasue the bmOptionalFeatures
description only defines 14 bits.

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


