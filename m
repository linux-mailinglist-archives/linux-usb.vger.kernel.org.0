Return-Path: <linux-usb+bounces-14583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E696A455
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2131F24BBE
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF67918BC12;
	Tue,  3 Sep 2024 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZyLEmtWb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66051885AF
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381042; cv=none; b=NLQ9UVtRoKTY82Y5ms5J6OE4gCKdIbdfM/cWNmeYnQD2s7pwY6/BQgZCY9t2vTV5O60qwFaYsuDix7rffITrzxVcSCmRgl8R6z0novSWOQTNMHqiGEmWcypZExChpBxvJczgVUOri/mACbqe25T57/o56L0IQRdFiBmkCL3Ls9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381042; c=relaxed/simple;
	bh=YoYRUae+dYQ0d52pIU8556BecxqaS32GRkSA+SJ61gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/hrhfwK60h5VTAMZhVwDXk1+chhwF8Avw6wW/bC8a8ME6eU+V8MWUL6ft2dLs91c79YEm+r2Olrzlj0PS13GRY+oEDTdX64NWFhow1/QZhFEIZS60YG+kTwhiPTN0v6Mpzr6+aa+Y7X02xkRoRqznujORl6ojOZ+ym2foTTuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZyLEmtWb; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a86abbd68ffso921347466b.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381038; x=1725985838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TIEYy+uyd2jXHZkwyaKTeT93BGHARFcg0AcutZlTKg=;
        b=ZyLEmtWbOR81W5x0c7oHltmSDlIbKv8U9AF0W987+NBIfZONk7+TbhRatOm4EsYxk6
         pHRICIvCjXB+Osal3NhZBRddXHW3ic6t+ZBWOhJHxJdBpKxUfXSWfWLxFLrQ3SO+QIkb
         2dUneqcIUmdkXhey2yRkxwc3d13aSAwWJ15Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381038; x=1725985838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TIEYy+uyd2jXHZkwyaKTeT93BGHARFcg0AcutZlTKg=;
        b=u14l7SC1MM0rDUXA67cEyI7yNGopGXLP1GhjFuW5CdkVavfIxmJEoo4llLAC80VfAh
         TDWEYWJNAEbC1wKWWxfR3IZXdwNAnR3DnW7mj4jO/MVUTSAiTEz4MpCUgaffmu2e9HLt
         7Wp12eaaG62EvHpAjaUCdHB06sfrPPpOCxq2uD1Mig3rvq6HA1KAMAPhgk44a2vHaubJ
         uUnYb9DfhWaBc503lueimL8MXTvlLfalLUGdtH4ivEijjGdHA+h3T5qmAdCU55rlTn28
         xX3fZ1HRxQ/k2XoYXbuXii5xrksH6p7dMSFyKjp5aQToeqLk3ENHz1fsnRqhzV5k9Hox
         RO1g==
X-Forwarded-Encrypted: i=1; AJvYcCWU/SLgLWDKxlGdc1q4YISlFeUI1kApXB40JixDMh7eGAe88xqBV/9+5Vr6Cb8Qj6OnqYz2Sbar+dM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4GZVmCVGCV0SbH2if+sCJSGiQFEQMHyLeHJCMMZ7GYaTVSA/V
	WZiqNfO7rwy9E9HtxmIlobyGIDTgfWm6vGAyLzFuoW+dpS75eQy+ua31gBDY
X-Google-Smtp-Source: AGHT+IEKzUEnyVSCRCC18/H9KWxWbNBNtHfr6WvIUVO7/ZCeHwJZ9cd+GxR/nFZmj5QvFglMz/D6zw==
X-Received: by 2002:a17:907:e292:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a89a2927ae1mr1377312166b.21.1725381037341;
        Tue, 03 Sep 2024 09:30:37 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:36 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 1/8] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue,  3 Sep 2024 16:30:26 +0000
Message-ID: <20240903163033.3170815-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index e574b790be6f..08b6c98ed890 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5012,8 +5012,10 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
 struct ec_response_host_event_status {
-	uint32_t status;      /* PD MCU host event status */
+	u32 status;      /* PD MCU host event status */
 } __ec_align4;
 
 /* Set USB type-C port role and muxes */
@@ -6073,6 +6075,24 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * Read/write interface for UCSI OPM <-> PPM communication.
+ */
+#define EC_CMD_UCSI_PPM_SET 0x0140
+
+/* The data size is stored in the host command protocol header. */
+struct ec_params_ucsi_ppm_set {
+	u16 offset;
+	u8 data[];
+} __ec_align2;
+
+#define EC_CMD_UCSI_PPM_GET 0x0141
+
+struct ec_params_ucsi_ppm_get {
+	u16 offset;
+	u8 size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 
-- 
2.46.0.469.g59c65b2a67-goog


