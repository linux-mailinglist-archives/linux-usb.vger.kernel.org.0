Return-Path: <linux-usb+bounces-31069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A7C97437
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 902D9344590
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD983101B6;
	Mon,  1 Dec 2025 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E2VGiZUm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D330FC29
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591995; cv=none; b=kjCLWkjALJ0kvQHbldyYF48C/ZNUuYzvU9C7WUKshHGadsu5a9DUc+rhx2n3cxGvGr39fyYwtrNei6d0pDPo3sBy+OTyBtcjG1tP2IcGR0bbwk++gcQLAHaQvsd2KjyHuMFwCgOVC+AvPhw1e9nPEa01PSQsmspuneOcccXX0zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591995; c=relaxed/simple;
	bh=8/vLyDy3MTFQaWy0TuwBeVxho4lSfebWQQDxH1LU0Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbMFTFwGqqH//s5Hzi9/PxHgfpHyS4v+U6o9uMpgIKg47ldpdajt6M9A811+UUf+PWeRPcvYDH1lXTyB1QeObYCo+0636NDaXabKV+dPBK1k0yWrII08hL0HUsKeUoApRPsNjskmsOTr+GxPhnZpZ7BnjWeE1HOKHBnY0yzRqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E2VGiZUm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso7414902a12.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591989; x=1765196789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1naprGdujl0hDct49jHvoowZM6Cf+zk8w9Ns/4eimc=;
        b=E2VGiZUmmrIaGREcEYJoI4EQo1pgD7y0z6T9LzM8PgL5L/TaSowXlRthWVRWirshUF
         RguA/ApMl1lwaGY8J8mkUYf6ryWnmDHe0E89TRm13qb1zIQ/KGBaeolVTwg8+t4VB8yi
         tR4p4vvK7EUwlbvbKluDAC1QOiZX5pP3mgw0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591989; x=1765196789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1naprGdujl0hDct49jHvoowZM6Cf+zk8w9Ns/4eimc=;
        b=iaMjS6AKbbiBH8uuPDQddm0j99rM+wt1fz1nZWBmjkEms91ZmwjCjOwT4+hkZYXZsT
         YQGOR8oGF4a0djG6WGkuP833vaDqpaYy8176StvsC7tmSZlbamK11GBsn+UFsJspICiR
         6CdcBuwX9rUeBV2KOjLqIEhC/CAEY3mbkfanddeFfJCVjYLegHQvo2lOBr4EkEe9eLEM
         0XMKQemhCJjta71m2zwJKBmIBDF9XDnolFBulH9wwpgr0VuZzTNH1alu63xVK5nB/Id1
         0KVTATRP4FbyCqEmDhx+zOOw5vZBmKnqyVkLL6TbexFFsSR5sRB0bUgkdZqZ2CU0jmh6
         p1bA==
X-Forwarded-Encrypted: i=1; AJvYcCUWZfvtcRp8DHkyR6PAmY265FmnawnZxm9NezA5DjJP+vDakzm6Hvv5AaedlNdI77edzqPXUxtOE+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGaJldkgpgzlSUwqNikYIEJOBCAKi5mBfNJR8aK3RkGmdH8yx
	pDxHmFoWpxuBYRlJX3Cqx+eHzmCoEOs8erwgkxJkYNqnpNMjLj2oxiowd8eERxZeZA==
X-Gm-Gg: ASbGncvXPcxfOol2tkopLoxiFRleHHq6BIVL/96+Q4K6S7z446wtE/yCX6pHqgVEPP1
	4jRZ+lCsbaYEtSFZ1Y7pxCKWfXL6yVVPKh2jDjyv7zKuc8L6yvsdt50jgvswr0oGaxius0Ut7fJ
	b8ygZnXAUgKvUK02Ie5RZhKj0iYuUkz3Tap0NDQGN4aN/YOfNW+xTdzpcHsxB32rx8sexw3u4oq
	4Ow7PDXuF5+/xRgIpoQc4W+IpvIGUlgF+xOyGnsY4Ru2xI1kW6NGEri+liR69ErKnpYp4icIJMY
	Q/P4Wq079fDh1WrZc2cS2ojzo5Jy0arE01/UHPhD2eCpT72j2cKdpglBaCBRLdqVKN9p5MOqd+c
	Ifd5JeWWZ6gAbBRoIb0d91ezrrZPEeGnK6PpTTUGs5JldSRCdTdgHj2WD8bAaYw82Lg0xjnZd4l
	QDMuAZ/BpnU9EfDXtLJj/3WqMgzBZF8C3RJcIM+C4MEZrjg9NU0A8WJI2cTR1XXDZ2tDwQUDpj5
	kMCSnh/2/4=
X-Google-Smtp-Source: AGHT+IFu9VlvB+GE4wPCZvLjBJQVkYcCGQiYYmtpwkbYyZkwNjLgf5X/ol5wQZA4UhW+seYvD1Sedw==
X-Received: by 2002:a17:907:1ca4:b0:b6d:5dbb:a1e1 with SMTP id a640c23a62f3a-b766ed8362dmr4714235166b.5.1764591989425;
        Mon, 01 Dec 2025 04:26:29 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:29 -0800 (PST)
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
Subject: [PATCH RFC 8/8] platform/chrome: cros_ec_typec: Enforce priority-based mode selection
Date: Mon,  1 Dec 2025 12:26:04 +0000
Message-ID: <20251201122604.1268071-9-akuchynski@chromium.org>
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

The driver sets mode_selection bit for each Alternate mode, thereby
preventing individual altmode drivers from activating their respective
modes. Once the registration of all Alternate Modes is complete, the driver
invokes typec_mode_selection_start to initiate the mode selection process
based on mode priorities.
The driver communicates the current Type-C mode to the mode selection
process via typec_altmode_state_update.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      | 47 +++++++++++++++-----
 drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..cd827b1822e2 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -27,6 +27,11 @@
 						BIT(DP_PIN_ASSIGN_D) | \
 						BIT(DP_PIN_ASSIGN_E)))
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 {
 #ifdef CONFIG_ACPI
@@ -325,6 +330,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	if (!port->partner)
 		return;
 
+	typec_mode_selection_delete(port->partner);
 	cros_typec_unregister_altmodes(typec, port_num, true);
 
 	typec_partner_set_usb_power_delivery(port->partner, NULL);
@@ -400,17 +406,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *amode;
 
-	/* All PD capable CrOS devices are assumed to support DP altmode. */
-	memset(&desc, 0, sizeof(desc));
-	desc.svid = USB_TYPEC_DP_SID;
-	desc.mode = USB_TYPEC_DP_MODE;
-	desc.vdo = DP_PORT_VDO;
-	amode = cros_typec_register_displayport(port, &desc,
-						typec->ap_driven_altmode);
-	if (IS_ERR(amode))
-		return PTR_ERR(amode);
-	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
-
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
 	 * if it doesn't support it and it will not enter automatically by
@@ -428,6 +423,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
 	}
 
+	/* All PD capable CrOS devices are assumed to support DP altmode. */
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_PORT_VDO;
+	amode = cros_typec_register_displayport(port, &desc,
+						typec->ap_driven_altmode);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
 	port->state.data = NULL;
@@ -742,6 +748,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	enum typec_orientation orientation;
 	struct cros_typec_altmode_node *node;
 	int ret;
+	u16 active_svid = 0;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
 			  &req, sizeof(req), &resp, sizeof(resp));
@@ -780,10 +787,13 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_USB4_SID;
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_TBT_SID;
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		active_svid = USB_TYPEC_DP_SID;
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
@@ -799,6 +809,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	if (port->partner)
+		typec_altmode_state_update(port->partner, active_svid, ret);
+
 	/* Iterate all partner alt-modes and set the active alternate mode. */
 	list_for_each_entry(node, &port->partner_mode_list, list) {
 		typec_altmode_update_active(
@@ -899,6 +912,7 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 			memset(&desc, 0, sizeof(desc));
 			desc.svid = sop_disc->svids[i].svid;
 			desc.mode = j + 1;
+			desc.mode_selection = typec->ap_driven_altmode;
 			desc.vdo = sop_disc->svids[i].mode_vdo[j];
 
 			if (is_partner)
@@ -940,6 +954,17 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 		goto err_cleanup;
 	}
 
+	/* Once all partner alt-modes are added, we should also trigger
+	 * mode selection.
+	 */
+	if (is_partner && typec->ap_driven_altmode) {
+		ret = typec_mode_selection_start(port->partner,
+				mode_selection_delay, mode_selection_timeout);
+		if (ret < 0)
+			dev_err(typec->dev,
+				"Unable to run mode selection on port%d partner\n", port_num);
+	}
+
 	return 0;
 
 err_cleanup:
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..ee4f2a9dd68a 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -41,12 +41,16 @@ static void cros_typec_altmode_work(struct work_struct *work)
 {
 	struct cros_typec_altmode_data *data =
 		container_of(work, struct cros_typec_altmode_data, work);
+	int ret;
 
 	mutex_lock(&data->lock);
 
-	if (typec_altmode_vdm(data->alt, data->header, data->vdo_data,
-			      data->vdo_size))
+	ret = typec_altmode_vdm(data->alt, data->header, data->vdo_data,
+			      data->vdo_size);
+	if (ret) {
 		dev_err(&data->alt->dev, "VDM 0x%x failed\n", data->header);
+		typec_altmode_state_update(data->port->partner, data->sid, ret);
+	}
 
 	data->header = 0;
 	data->vdo_data = NULL;
-- 
2.52.0.158.g65b55ccf14-goog


