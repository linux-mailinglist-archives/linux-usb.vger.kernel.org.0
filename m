Return-Path: <linux-usb+bounces-8875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229B8977C9
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 20:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54CE61C20928
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 18:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6371552E0;
	Wed,  3 Apr 2024 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J+Y7l8XR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9546153572
	for <linux-usb@vger.kernel.org>; Wed,  3 Apr 2024 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712167527; cv=none; b=HFiemhwDRNhmX8Nz5pBW6Y8ht4xt5sbkEH5f0p8Hnf2TCIB2XTkb1veMg0cmS5uU6YFWG53EIYrmo6NCYecNz4oDp+5IHBre/bHyr5S1BnYmZ13c+qHEb1fCeeKIm5R4P6Dh5SgOa+E/Q2IfuNK5VmM9VcoWgBLWnwL9gp2Vu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712167527; c=relaxed/simple;
	bh=qqGF9xLxJC4LQcm92S4IX/hRHYqAmBrg8Pca6o1qles=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ty5gak8hJb/N6s91Ht2h5ruvE3TO1VfyZb4bFzUt5up2litPIUmVK1jOgKZq6RyeHJgEX0MdyNy+0gSuTJiwNaB+DLSDmxfFpKV5wSlSmXhmNQrIk6uHvFbvC/OFWPOUXM5vZsgD94gwCZg092FSQhraObNccl0pH3oVP6VD8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J+Y7l8XR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ea80de0e97so47298b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Apr 2024 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712167525; x=1712772325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJlHPBrdTvEXRp/sm58R6lF6ryZ2TinFdRAYOgnph1w=;
        b=J+Y7l8XR01iEcTEgPlbV4DyD4bhKAEyvrEqV42SBrtzGl6AtuidQdxPr6vPw278ycb
         xMiUFnyeDWb7hBfhiEaZHKGBJsie3n3e7gtcV6F19LDl6FGxL2a3HMA7bfAbuA1Yzou+
         AR/T1uOcMMdPPprYydhfC/Y0R7Lq0XtkRomYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712167525; x=1712772325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJlHPBrdTvEXRp/sm58R6lF6ryZ2TinFdRAYOgnph1w=;
        b=kcnglOCB6z6D6Sc4pvRzoiaolZ4Ks4V3i+GsTaUn+s5I0ADqvB/oJAO2LpeXOpMzPA
         Y4iTsOBMjX7wWtfMzux0pnK9FSdJuJV3nnwucysg33G0F82dYq5BMvnkDdNq4ZJsxqzS
         +rMdV/FkBvzbJP6xkW2g00gyc3NYYaMN3obUZARPcUw4OIGBjBG7LmPpodXfXOvA+X78
         Keat0vC5WpObq0SCcPDnda0uUGeqwM4uRczoEn+/+WWs/W05MzZ/B6qrE4FQHzPBOAWk
         ZIrPPEU8byiOxRVTRJp9ZcLGGUxLnCYi/4ug35IsajpVHEv1k6/PyQiiL5HLYhP5pB6A
         taDg==
X-Forwarded-Encrypted: i=1; AJvYcCUP517MJB16m7RPdM8qDcV9l4Zgz+I7NR38ruvLhW+cA+ZX9pIDJj3xZJ0PpJKvKGM3NlcLyu+xVY3Hz6jAEBGf5oVq6lgc9Qm8
X-Gm-Message-State: AOJu0YyE6cyjozZa44q4VtD+gGNAp0/DFuEKjS3oxsio1JRy/FmNeBO0
	hdwXx65BwkWMNNlxZ5X5WnEoPG0krRfSewavcFnnSCa6sBiouAVaA7wwkIhCvA==
X-Google-Smtp-Source: AGHT+IFofluak2TNyaj7l3kg/C527840RBEHus7enJda2FbDDZHU7/jIXCY5rcY2cES7AC48lbdI3A==
X-Received: by 2002:a05:6a00:3912:b0:6ea:74d4:a01c with SMTP id fh18-20020a056a00391200b006ea74d4a01cmr310246pfb.14.1712167524934;
        Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79850000000b006e64ddfa71asm12359162pfq.170.2024.04.03.11.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:05:24 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 03 Apr 2024 18:05:21 +0000
Subject: [PATCH v3 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-public-ucsi-h-v3-1-f848e18c8ed2@chromium.org>
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
In-Reply-To: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 chrome-platform@lists.linux.dev, Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 include/linux/platform_data/cros_ec_commands.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ecc47d5fe239..c0f6d054a566 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4933,6 +4933,8 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
 struct ec_response_host_event_status {
 	uint32_t status;      /* PD MCU host event status */
 } __ec_align4;
@@ -5994,6 +5996,24 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * Read/write interface for UCSI OPM <-> PPM communication.
+ */
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
+struct ec_params_ucsi_ppm_get {
+	uint16_t offset;
+	uint8_t size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 

-- 
2.44.0.478.gd926399ef9-goog


