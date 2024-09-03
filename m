Return-Path: <linux-usb+bounces-14582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529496A453
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4759B1C23F09
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374A618BBAB;
	Tue,  3 Sep 2024 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H92zF59h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF2218A951
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381041; cv=none; b=lawZnHSyWgmz13YQSS9qZH09Q0ttAwaAV1kjBvXey1z3x7dhee7PYkf68mhH/45xHsjSWp5d7/BonI5J0RiSENes5t33LUnJD/Mh1VGwbz5juiYPhrwWQKv4gNuVO4bY9AsRwLv28BrIr4TumaYEcnj+f+Sc7KpHWo55v6oLGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381041; c=relaxed/simple;
	bh=fTy0stzS7yha36slypwt20Uo6AK6glJZ8X0uewkOtAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihseYptzDjO3GmQf7hrj2vaYq9A6+WbggJ2SsH+tFqO+V9M42RfFMXI729mvKuhF6u7YFWla2k67EFJccgVAZL7unEmLyDkYkmncApTUNnZ283exm+11DCPtpujNefMG1WQpTNJkYkcYKkx2lQEp64wP0qd803dZ/u28RUoKgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H92zF59h; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86984e035aso671497566b.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381038; x=1725985838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUgbNEkhKAhMTH2sDvk5W7gqHhDqqd1S8pfms1rAE3M=;
        b=H92zF59hEV7+X0DfDHqolTAmf+AsDM9hVlG8dFhJoymPt9v0+MddhPobSwEsAnHs6r
         hlzu7Zvkp1pjn9nff0Xl/1M8nigcoJFAeh2j4OD3EbQvENRkZkmDburiLC2+i42K2LnP
         qmnjtJbVlBq7JH+NAKP9XLfX3BXtx+OWmQd0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381038; x=1725985838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUgbNEkhKAhMTH2sDvk5W7gqHhDqqd1S8pfms1rAE3M=;
        b=PZV1PdlDLeKr6q1aeKbhLGwXOU+0txtI0H9LAn0nkTPoR4qzmGVNkX7MSO/ULp7str
         oXZ+O3F79HsBttEfW0qYXDyLA6Kx4Modk9x4T5hFDEpXeZ5l8HyHwhOC6iKVB3lhsHcQ
         h5pN4h6/3AnGMaPgWe08VjOv0t5X9RDbWj5J4mRYoHSkOyucG+JGix0yrSXXICm4u317
         kAekApFON6uhm9zNS7NIiTRMx78inFJosurNphzJnUKjf9OqEs/F83c34+924poARxBo
         12hCQubNwwzE6u3eAAup/xs6YiwHa3k+3DNjiZdmN1obnOy9dZLRPa7TqgVVRhY4ae4d
         jxxA==
X-Forwarded-Encrypted: i=1; AJvYcCXpTp3XTP79mVwZSzyJ24xXnI/lHTtde0Ri34OOzCPV+f6Lbw45pmBm8qvs0eGXERow52GnkNy+Jvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3DApNnkUDahx0UGu+EO+282whKDTu8kP9h4tpWNa6gL0AmQX
	YQWczPCVlwOjv5fzg3U2KhPGgJIyW3Bn49EIyfaUoGn9ICRP2Zq8q40TDlzs
X-Google-Smtp-Source: AGHT+IEpqLZizoWT23KCkNz8O9QOEGS3Ya+RF47OFDRd3WiRqN+a/JFqMC37tQh7DBKbDOaj741jFA==
X-Received: by 2002:a17:907:980c:b0:a86:8f57:7de0 with SMTP id a640c23a62f3a-a89a37aa9famr994346366b.49.1725381037969;
        Tue, 03 Sep 2024 09:30:37 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:37 -0700 (PDT)
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
Subject: [PATCH v5 2/8] platform/chrome: Update EC feature flags
Date: Tue,  3 Sep 2024 16:30:27 +0000
Message-ID: <20240903163033.3170815-3-ukaszb@chromium.org>
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

Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
driver. Also, add any feature flags that are implemented by the EC
but are missing in the kernel header.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 08b6c98ed890..2998d956ba14 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1312,6 +1312,38 @@ enum ec_feature_code {
 	 * The EC supports the AP composing VDMs for us to send.
 	 */
 	EC_FEATURE_TYPEC_AP_VDM_SEND = 46,
+	/*
+	 * The EC supports system safe mode panic recovery.
+	 */
+	EC_FEATURE_SYSTEM_SAFE_MODE = 47,
+	/*
+	 * The EC will reboot on runtime assertion failures.
+	 */
+	EC_FEATURE_ASSERT_REBOOTS = 48,
+	/*
+	 * The EC image is built with tokenized logging enabled.
+	 */
+	EC_FEATURE_TOKENIZED_LOGGING = 49,
+	/*
+	 * The EC supports triggering an STB dump.
+	 */
+	EC_FEATURE_AMD_STB_DUMP = 50,
+	/*
+	 * The EC supports memory dump commands.
+	 */
+	EC_FEATURE_MEMORY_DUMP = 51,
+	/*
+	 * The EC supports DP2.1 capability
+	 */
+	EC_FEATURE_TYPEC_DP2_1 = 52,
+	/*
+	 * The MCU is System Companion Processor Core 1
+	 */
+	EC_FEATURE_SCP_C1 = 53,
+	/*
+	 * The EC supports UCSI PPM.
+	 */
+	EC_FEATURE_UCSI_PPM = 54,
 };
 
 #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
-- 
2.46.0.469.g59c65b2a67-goog


