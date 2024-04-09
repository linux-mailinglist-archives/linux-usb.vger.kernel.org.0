Return-Path: <linux-usb+bounces-9102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DD89D05A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 04:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58F1AB230A0
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 02:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A13E50261;
	Tue,  9 Apr 2024 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N0txTTbk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123984F218
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 02:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712629662; cv=none; b=VDWMUV4BMJ4mDeiEaNHkHK7OwQtea2S6Ndgefb70FenAh+RP/120c85+CGbE+MOPYoX4P64rj7v+bQ9Ov1yWRMHqTVjEEg+Buobb7NAnAzUCzlXb+8hjSPdY6/rE+I6Y0MjC3pamvtZKjSK773tIHDtZGk+DseaSUzcC3XXC9tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712629662; c=relaxed/simple;
	bh=qqGF9xLxJC4LQcm92S4IX/hRHYqAmBrg8Pca6o1qles=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnL+7IX9mSxy8HYbVUbNF6tO3BLYZficPVfu4NU4NMyb0R6NBVG4DBB1jXCb5awFXg9e7aY3kOL+t7O9tVzH7glmILfDKewc7jOk7/hXA1/TiPLj8ZznIT887enH7vted598c0dpsKPjjHXR97OvW13VTETA0OhukXqw0jX/zeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N0txTTbk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso3544905a12.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 19:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712629660; x=1713234460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJlHPBrdTvEXRp/sm58R6lF6ryZ2TinFdRAYOgnph1w=;
        b=N0txTTbkNEh/ZmI+5ZL+HNVUmibMEofv348ejYYJLHsNaZQ/ffj36hpasiaBFe7bhi
         Kz4S4d/g5geyA7Wp5LkoOo38us5x5GGjTI8NqOmnKGSMJwIuu0K+etVg3h38OUTPCp53
         pnCqKnesNWrflMyiZ9eQVEJZfpx0SX1ZYD1hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712629660; x=1713234460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJlHPBrdTvEXRp/sm58R6lF6ryZ2TinFdRAYOgnph1w=;
        b=pfe6ZXwLJXqOcj7PUB6cBK9nLD2D9wlE4V4+yWpSgUPj2YLhpleng3wWUzwrLh7d9L
         F+3UaVbD4uOzpHOyg885oTmfUadYEwprExp8MnsOslR38kQ1VZWSbGxxeesy6/KEDiOj
         vgcDFw3TRR2RyG4wv8K8fHonGS/+OiC2+z4jpVviJVpihNZvV60QeiVbQRHg/XRHfm8A
         y7UjC/t0AytlkI53ZMKsNQpCJUacfGUZ2df6t3fo4dQ9+pTPYPvdBj03nrogy3kodOkA
         7UnseJg1qZ8mLjZgOLmWPUpjq4obSsEU48jJTzlhf+D2JcODkUHxIQ3WfHTBw8CaKNBw
         oIwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvB8VGVcBEQqIlb+yEbaLg2TjD0Bf0UjSRBIFkm3ISKIJqhXkM4REKGFK+NE1N65cJdMA6j3wiDmvYVE+/e+mW4zwyehl8xU5h
X-Gm-Message-State: AOJu0YytuOMxqFjJx7eNsWf6fc113hWmlcdxNzQlwGKXupoSmfKtyL5P
	BUg4xZE7Ogf5yC/tR8W4Qq3H1yVAU78IlmNXf/YjNe3pseTNvZ7YHDJDFwOP+A==
X-Google-Smtp-Source: AGHT+IHf4Sv9h3Ugg+GncrCdIfZ/whdR6D0SZ1rLF9ak4Hj03Z+Q7L/YWNHH9bezFfO6GyHZ1cHvXw==
X-Received: by 2002:a17:902:d4c9:b0:1e3:e257:2c8d with SMTP id o9-20020a170902d4c900b001e3e2572c8dmr9714710plg.11.1712629660427;
        Mon, 08 Apr 2024 19:27:40 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902680700b001e2b4f513e1sm7880850plk.106.2024.04.08.19.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 19:27:40 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 09 Apr 2024 02:27:36 +0000
Subject: [PATCH v4 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-public-ucsi-h-v4-1-e770735222a2@chromium.org>
References: <20240409-public-ucsi-h-v4-0-e770735222a2@chromium.org>
In-Reply-To: <20240409-public-ucsi-h-v4-0-e770735222a2@chromium.org>
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


