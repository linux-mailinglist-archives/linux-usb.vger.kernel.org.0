Return-Path: <linux-usb+bounces-31066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17AC97407
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD6DB4E1AF8
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825162FFDED;
	Mon,  1 Dec 2025 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L7xOPtmb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8930E0D4
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591986; cv=none; b=kKdXshr4Xx74oNoG3YlJhrbD1tNn/05ZksXKA0Xn0X724fcV+CGWCsCFMQ3+VkzSn9oIi80aQm5n8B4HhhwSrMMIO8f5pI/F0y+d2K3rjYEGQI/VyBZan5sqLMxvVVlJ7rPaKxr+9gGsKUhaeVBaJ5x777FByIPLh8SrMN6fUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591986; c=relaxed/simple;
	bh=EjyjRDZ14jo9PQ2gU5QebdkTOWDTQZAHb1P+d2FyXxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z25xz05Rq1Uapo1X9X+sT+w41t4pKzhWe8VuPKuMuqnVKkpTq+/EfMUbBYeJ/NHQ4MRxqRFUHWMJF7Lqfzm3gtLjQHxUVcXDxeUplNLp0UA6d4FRr360mcVozKtVoBcUcULX61OBuz143GNnkTgI3tgbMzE0CXf8REd+MNnJZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L7xOPtmb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7697e8b01aso806542466b.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591983; x=1765196783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3siUDoeibOS44ZiVJ7r4alLl9iFlDQ+/+PWsVjixhQ=;
        b=L7xOPtmbT670qlMGzeURDqdGIq++hu1bLeI6jSNk/5KGw27xXSwpxIMbKAXV40Gxez
         zPxh2+lpR+XNDd0viiB7dcrTh++KBpxIDE9NtDtGoI6yAKqQZhYMW8jER5r7svFUk4bu
         5zTcxLcvEESP99+dkjixIC8lbtmiGF2M9DEyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591983; x=1765196783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3siUDoeibOS44ZiVJ7r4alLl9iFlDQ+/+PWsVjixhQ=;
        b=aeuVZXLonykFrUXE6VClxTTiUFyF1976X5+QEdqoFfqU5eoivRNLl/7bEi5SmCiV/J
         EePJzLi7pJCBkVqRJNe15pI2aaT27J1hTu5v3lIzmsiNHWWdp4eM2LwIyWCOwpO0oL6Y
         LNcM3oGOyl6PYIAW+2qXdtv+uuOWWpvO70lSrbenwY0N3SWh0EcsU5gTJfRf1xOtPYfL
         l+v5AenwfuUPgn28qGRFB2QD9+W4E7oqjpb1hq1CA5vAWO9v2w3KMu8xXEMG4pztDZ4z
         kIsbw3JxDnrVQcayijtaEcDGGkS+1aegpIG0JhZ7DtJLiJY3zyTHIc2DD1hdEH9c95gT
         MPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftEFiRpZe7JtdGA0R1vUT+zphmaGbEg7bA/uF+k2Eu/T9TJ7whIAh6TAbh/JwChVBBcU/CC/p/Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAPIXq1XEf1MT0lIdt4d3wvHOQ7FN9geMm8vBbNYKtnLhi4sk
	EAzIFpKSmFvCTWj/zsqESZwMuiKx91izJ6BOt1MtSFKNh7HhgrClOUPZrmS8kqI9aQ==
X-Gm-Gg: ASbGnctvyY3azIuNUNMGx4H4horFBz1bDFCZbLHMcJd3ZHcd2rITgC8YPxZbv+zYI8b
	wRxp8ZIEWSdApLc5G8RLa3V11mbMfHHnXOyxLeTvISkSdXl9ys3xKzIZYMLKNSD1Sga3gkYMug7
	YAoVvB/FRfbhI+qeEnT1X9rvg0dZZWSupbfJlgZuyL3PLcVDY6p6ffpLaqQMTnC6rtbCa71ySMn
	rrVe/RmqOmn9DaVneZrTsfSpdEX2SMtz4vp5APMf70zBKbrv6Ee6nHR8OtniKK38+vx1XJSkM70
	SffetmOoHaIyA2sw88+TpL2aIN9g2SQq/RIvT2QsquQQqwotRH2OAkSNwbJfgf7yrYZts2UrZ8Q
	V69+vI/3xu5HS3z4iSIg+R5tmHf2ah3ovIpWcKmcTFAdvuPPi2I3uM5eQbbdyJgpY3rlKpg3u2K
	8Oy/ms7nxhhzYRebIHzXNdA3wxGoaKLpzm99e0z2nteKh9nHfR6iOAXe93tsyjZ5ah+3MCNe50h
	/TtEfGnIrs=
X-Google-Smtp-Source: AGHT+IGdIbQA5fN2pjwFCGt2uQXmBVTAC2xTd2yjO+gh50cAVKF7tAIvotcRnv9TG3dRpl06Kz7Dmw==
X-Received: by 2002:a17:906:fe08:b0:b72:a5bd:c585 with SMTP id a640c23a62f3a-b7671732667mr4428434466b.46.1764591983127;
        Mon, 01 Dec 2025 04:26:23 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:22 -0800 (PST)
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
Subject: [PATCH RFC 5/8] usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
Date: Mon,  1 Dec 2025 12:26:01 +0000
Message-ID: <20251201122604.1268071-6-akuchynski@chromium.org>
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

The mode selection sequence is initiated by the driver after all partner
alternate modes have been successfully registered.
To prevent the Power Delivery Controller (PDC) from activating alternate
modes, the driver disables all alternate modes on the connector:
- During the connector registration
- Upon partner disconnection
When a partner is disconnected, the driver also stops the mode selection
process and releases resources via `typec_mode_selection_delete`.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index d753f2188e25..988a159ed778 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
+#include <linux/usb/typec_altmode.h>
 
 #include "ucsi.h"
 
@@ -33,6 +34,11 @@
 /* Number of times to attempt recovery from a write timeout before giving up. */
 #define WRITE_TMO_CTR_MAX	5
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 struct cros_ucsi_data {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -133,6 +139,41 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci)
 	return ret;
 }
 
+static void cros_ucsi_disable_altmodes(struct ucsi_connector *con)
+{
+	struct cros_ucsi_data *udata = ucsi_get_drvdata(con->ucsi);
+	u64 command = UCSI_SET_NEW_CAM | UCSI_CONNECTOR_NUMBER(con->num) |
+				UCSI_SET_NEW_CAM_SET_AM((u64)0xFF);
+	int ret;
+
+	con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(con->ucsi, command);
+	if (ret < 0)
+		dev_err(udata->dev,
+			"Unable to disable alt-modes on port %d\n", con->num);
+}
+
+static void cros_ucsi_update_connector(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		cros_ucsi_disable_altmodes(con);
+}
+
+static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		typec_mode_selection_start(con->partner,
+				mode_selection_delay, mode_selection_timeout);
+}
+
+static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE) {
+		typec_mode_selection_delete(con->partner);
+		cros_ucsi_disable_altmodes(con);
+	}
+}
+
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
@@ -140,6 +181,9 @@ static const struct ucsi_operations cros_ucsi_ops = {
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,
+	.update_connector = cros_ucsi_update_connector,
+	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
+	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
-- 
2.52.0.158.g65b55ccf14-goog


