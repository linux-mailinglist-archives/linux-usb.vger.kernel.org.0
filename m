Return-Path: <linux-usb+bounces-14888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC5973249
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719DD288977
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239161917DD;
	Tue, 10 Sep 2024 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HCRtq62D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0021318FC9C
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963339; cv=none; b=CPJUb+baVSppW3DTgl5K4rNvJgg+5T4L/GbSBz1oV+zKwtluju1uSlBX9au68USTGvAksSEqHUE2DSzRQZpj8/7+uEhH9Ubl6XskpyLDrQPikvtO3z0umcP+PQpvwYTiGgo44ehhhoFd2jeY6GKnbwHMif7TyIzQyGPjxdhhYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963339; c=relaxed/simple;
	bh=P845PChozNDR5SGQbooLDKSy6BNU+jWzs4r3D6gy+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FnjvF7G+Art7x71e0Z4KkJVedxQF0F8zqpEP/LXpgLM+U+TK04VXRQPsMOKxlK2l9oONqp4HsvtdnCbeaNiu4iHSvrXn3mW5VPxcGZOdKBEcZTJE2L53N0Xg2HXsO0sN6TBr5IKsrSuvGo5djIEixGbvMVL+PjTzIDYJnZbZgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HCRtq62D; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c3c34e3c39so7618969a12.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963336; x=1726568136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14fOqglI4gqlZHINscrTLoCf9Zlvu7dl6ljaBQHSUuQ=;
        b=HCRtq62D3+x4ANREAolesytWo87UyA+a3Z5He5Ou9Ge0nfOPYhpf7ppepmgACyDQXp
         2JpimxegEX8kWqBo+5x1joIyckfU4SBVxPnAbpAIk9ElL0uMZtnm9pwZZLnWz1MAFfF3
         xzb2DMfuacitOsi+O/uo9geoXRujVaGQfK58w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963336; x=1726568136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14fOqglI4gqlZHINscrTLoCf9Zlvu7dl6ljaBQHSUuQ=;
        b=dbIm0Dh0sS1JfdzwkbRl4/LwynIFk9WG+mqFbX1j3oFgjpxPGrr2qQ5JpxWsj5PEl8
         Zl9SmJQFkzBggMPO7lYpI7qSPC/K6lFfK0Bx/Egm8A+drrKOkkDTjRL9REWEasFGv4xM
         D4yK99afJ1ZhTFg/slSWfAySB7M4YIFPlEGlLbD/D/5+VpqxuofR7lBXShXDQAutCtjy
         HTHc7UWMAwfLYtlPTsUERV3xGBUofI0m4CSi0Nq0UofMW8eWRjlawH2r6hzjdi8Ono2c
         KDUEGVtzH9gkzN17Q2/ju/5eYWpm/O5bW4kp7V3dY4VYuxygV2unQMUauJwnMZbQV4lO
         43bA==
X-Forwarded-Encrypted: i=1; AJvYcCXzkLzs0u6ynCtyogd4elWGPH6cJsEtb5nAZoBrADmswVLpcrrm04ksuoBOh0rxAkKperPxMjK/TVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQzJeUBTeqzS85vEpx41zjwDj6f4Wn2zhEyvxlOL48jZxb/Ys8
	vJj0sp29eBq0931w3p9tDOb3cPd+vmD+XQ4s5tw4EQY2lV+Y3CFyD4Uzn7pi
X-Google-Smtp-Source: AGHT+IHf3x52xmPmWW27g7tPZAnY8Wi/THOklHIPEmyuKAyafMoyrrGYgmExnYJC5b9NF8LHKNzaSg==
X-Received: by 2002:a05:6402:34c8:b0:5be:fadc:e13c with SMTP id 4fb4d7f45d1cf-5c3dc77ff52mr9531818a12.4.1725963336069;
        Tue, 10 Sep 2024 03:15:36 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:35 -0700 (PDT)
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
Subject: [PATCH v6 1/8] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue, 10 Sep 2024 10:15:20 +0000
Message-ID: <20240910101527.603452-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
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

Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index e574b790be6f..8dbb6a769e4f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5012,8 +5012,11 @@ struct ec_response_pd_status {
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
@@ -6073,6 +6076,29 @@ struct ec_response_typec_vdm_response {
 
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
2.46.0.598.g6f2099f65c-goog


