Return-Path: <linux-usb+bounces-18910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D899FEF87
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 14:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C933A2E3B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 13:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A7C19D8A4;
	Tue, 31 Dec 2024 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HVPZzfZw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2B19D06E
	for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650669; cv=none; b=DoDZWir3HRR1v7AXhK0kjqCXoXmGtDXW89FdJ69DNO4fqU+4Q3XhH66/TdMJZU8+EzyCbZ0HO6C3JKPXia/teBh7aBNkceZ5YTsQOSe/lfYrnw9IEgFVzAtBSZtE2l/S066cXE2JSfQmdjaYaMLMuZD3qQA8o0Nul978qX2myyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650669; c=relaxed/simple;
	bh=oq4btdFfYoK+KOPZMZyUTR9BBLNLACQ2tL4SprBzQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CL/oqvlmM+mFVtse6+EY+6i2BrgVjgl9coERLEykjxlkiLrQue+DPTTVPulNNoCtxE00gm61qdwNUZMzCsYg5gddXyGcRI/iizxUR1B6RSZYWJ70kDUQXN41yA2Sywmk8N+X8erho40evhlMGqzW8puMBFPjH52OVEsXzLOhWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HVPZzfZw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so16034022a12.0
        for <linux-usb@vger.kernel.org>; Tue, 31 Dec 2024 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735650666; x=1736255466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r93btXMaX8NmCzDiaipg7HKDi9wpM1aYEQUfAEojKzw=;
        b=HVPZzfZwxYVwwZaobLVWvn8rGxitFEjJhYH0RiQxaDz8PKll0/kHr4J4yroHatxMzi
         RvYEYX1e+ICzu2WcVWlAI/biEjzGl2uxpMewk0citjF5tPISuhq/q3RgXjmfuGPXXuuS
         hMKDesOx65KobuUZ0+vtakIbW9vkD1tEEPYPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650666; x=1736255466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r93btXMaX8NmCzDiaipg7HKDi9wpM1aYEQUfAEojKzw=;
        b=ojL59dS+WPK6Uuwz/s60tPmb/2BDVxRZhoJ85DTJSMvKj9PLEbvXjNzorbHsMDtdU2
         Ue5a/LtrxFJ/3V3ryI2ZLprfqsmGjPyhYfGvvfDBwBvGSwro6+PUczfNkrBLVFJcKWFf
         jigbfNyYHaf1xT1rWa318AeJFpTr5yHROPAZZ+nQODFPV6lxremuLN8ziNtJkPD7jyIR
         /2/1LZ6058mJ9WepJMsla5juFfco43X0HodzWIBQd+A7SOiTcE3zi/gc9NFlFGQpAtXt
         0WGq8/cEQWBQEUD5OBpFvLoZJ5k1uvtdjzV3fziDyyEBWzPll5oQUfGKOuDK1ZuG5BFK
         5HWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXAXQ/y5TqNVuBtJMsRftl0faw5aj8dbzkS8rTL5M6QdSE9kZP9M92OivMHOXjtzTC5Eo8T9Y4OmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2mqSxr+VUVoHfwt9KN5N0XQ12h9KXkifojHDkDct+VhGiqF4D
	kqfiAe8O+LNTl0NnBZ/mDtu/1Fi7Cdjh/42QPc5imOQTZkTOqHndQK+Ibpuf
X-Gm-Gg: ASbGncuVoYmD6OMsFQ44lKF33Wm/u9Z2SQSdtTA9jPRX8OzIWRn29o6N6MSySbLyhfs
	L/lEF8mvHr5V5o1j5wa2/ZNSdOi4sQaOfQvfGmnXAZd0wSAkCayxqWgrgx4dhVR7Irzwv8oUtmB
	jOwkv88Xllp1A4MsOAhfehq3M6FLf4H5xFT5OwUkPXaVFHCqJaru+TTL6euOBYzc1WxcdUNlhS+
	Q2KMIuOzsL+vmOv6gCuZQsFB6Y8H3jd9/7YGlexwa+u9wTICQZIlP0rf8iKjh88drnp3AvBorNZ
	Z7ARcJ45mSWbqt6XF6HrKsfqLT4Dvdst9YWP
X-Google-Smtp-Source: AGHT+IF7Fc0a7jHAFV0h7q7TTKwJhn83sqXP1vY17a3omaiWF55P+201IWTK3V3xLQhcuFX+i1p1ng==
X-Received: by 2002:a05:6402:40c8:b0:5d0:e50b:899e with SMTP id 4fb4d7f45d1cf-5d81dd66e0cmr38911487a12.4.1735650666487;
        Tue, 31 Dec 2024 05:11:06 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (60.27.91.34.bc.googleusercontent.com. [34.91.27.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679efc9sm15876651a12.47.2024.12.31.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:11:05 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v12 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue, 31 Dec 2024 13:10:46 +0000
Message-ID: <20241231131047.1757434-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241231131047.1757434-1-ukaszb@chromium.org>
References: <20241231131047.1757434-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index b3c4993e656e..ecf290a0c98f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5044,8 +5044,11 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
+
 struct ec_response_host_event_status {
-	uint32_t status;      /* PD MCU host event status */
+	uint32_t status; /* PD MCU host event status */
 } __ec_align4;
 
 /* Set USB type-C port role and muxes */
@@ -6105,6 +6108,29 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * UCSI OPM-PPM commands
+ *
+ * These commands are used for communication between OPM and PPM.
+ * Only UCSI3.0 is tested.
+ */
+
+#define EC_CMD_UCSI_PPM_SET 0x0140
+
+/* The data size is stored in the host command protocol header. */
+struct ec_params_ucsi_ppm_set {
+	uint16_t offset;
+	uint8_t data[];
+} __ec_align2;
+
+#define EC_CMD_UCSI_PPM_GET 0x0141
+
+/* For 'GET' sub-commands, data will be returned as a raw payload. */
+struct ec_params_ucsi_ppm_get {
+	uint16_t offset;
+	uint8_t size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 
-- 
2.47.1.613.gc27f4b7a9f-goog


