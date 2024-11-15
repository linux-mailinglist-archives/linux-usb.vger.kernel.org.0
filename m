Return-Path: <linux-usb+bounces-17622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DA9CF0EF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 17:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3477B43195
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 15:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB861C07C3;
	Fri, 15 Nov 2024 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DDWppxgM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE71D514C
	for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685964; cv=none; b=TfXjB2g0Kz9T97EAtwpPffn5HVULwZAb4+I/sKpkQQ2sLUNwdYnjfTSWjqSRcTRoL/8PB2OpHCiwgCroZKnROL07ZbLaP4SAEktL5/Oe+TTeu/67OWzAQcWKIJu3jdTitTJHUOTnS4UJ02otgF9NsnhIIrdru0cTJKYr8P9cd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685964; c=relaxed/simple;
	bh=l6xy+IFEiECfEGnprsekfHBbUSUvzcyN3jyJsZdVimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkwEUK4c+/CixP0ybtoj2tyeoNPbfMIOL87n8JMV0qdtdBPF8ebYKw5kLcHZw5cYOSAB1Wcy2C3pBNKJuAkvj7ZAGInFjNyqgC0mCKSS4B4PSJL9RNsM3KeIj+Lf8BSVDqRK5Kz7Eqq5c1E30WkgwcCxMXra63A+4vukAJUu8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DDWppxgM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso119028166b.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 07:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731685961; x=1732290761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=DDWppxgMh1aJ2oBJMdlia5W84v4yUTUQw651dUkfMft2QJZCf1WcU/P6Qk81pfi2Jw
         rHJiHuVpSkN3gJb5zN7Vnifpb1LMf7va5lJ8sHckC5EI+2cDMJt+HD8XKkclYvF7jgOQ
         zGRGiW6mkh1vpexHhtNlbfyzuTLmOdCkW/JVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685961; x=1732290761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=pd7mB25KAkUocvnmMsW1PCXmnqVeBPcySECQ66uxg6FnVI+B7SVacm/ItwXxUDM/et
         1NxSqhLl3OmhJP9bm7Q/p9NNIw7zYif5dohj7RkxFgfHcoil/zaxqg/0opmrzhxXk4eN
         W2yOTY3qcpajEeJEJAeMZdmp0Mu09HGUo63Rgz75IqjDSyDvu306KChdJnx1Tv7OF7fC
         bWBtZDKuuK5VNSdlZMqhrfuTdjLz4k5KZqdE8Ll7ZvHjThSaZ2U79cFBY03+qxxVM+tr
         NtqTUxFoInI9QuN8pg1NHJJ1ZG88i+dN24+AqSXTwkSgSFNKS2sjxwok1cGpl+2QzE84
         9tKA==
X-Forwarded-Encrypted: i=1; AJvYcCVLdGbbpVcTdvMVNK2yiXmjzNiget2RfbU96Qo/oKdeE5s3xltGyRlphaYem514fQtwCMa/sR1AV5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRBPZ09CxpmUGugJRZ0+PyiorClL03teTjh6SAp/TlD7zsLpK
	ckPnlUvphSZ7N8iFfSeIspvkxM11EwZyBBKzZAtPdlPF29SxkOBW0bHULRp6
X-Google-Smtp-Source: AGHT+IGRjbVOsm42oCKFTm1W70lgoQkyBdu2JYgahcAw2aegTSvvju6pnXdwOKn1Rmv35xtTe4B2qg==
X-Received: by 2002:a17:907:25c2:b0:aa1:e695:f84 with SMTP id a640c23a62f3a-aa483479236mr311724666b.36.1731685960657;
        Fri, 15 Nov 2024 07:52:40 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086244sm187758166b.177.2024.11.15.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:52:40 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 1/3] platform/chrome: Update ChromeOS EC header for UCSI
Date: Fri, 15 Nov 2024 15:52:32 +0000
Message-ID: <20241115155234.1587589-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241115155234.1587589-1-ukaszb@chromium.org>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
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
2.47.0.338.g60cca15819-goog


