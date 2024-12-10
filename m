Return-Path: <linux-usb+bounces-18292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC09EB3C9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 15:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74670163FA5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 14:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E101A9B4C;
	Tue, 10 Dec 2024 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZS1MgNV/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEAC20326
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841942; cv=none; b=RbvTdVIoWlo0f+70d41GVolJvAuCsgXMoFnWAbD6Ak3cLKVSoTIkObqQMwf9UraoPc4evVbmqusIDFhyB86fFiHqxWHpUJGunJquA55sDtgyuRXMP9DjKJzzFXgQUuxnyVhSQ+Zs5X70yMKK4sDxyJRn3zvDCfc1RimTwaGT5Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841942; c=relaxed/simple;
	bh=FsVPWUYW3r8+vYPca7TkDYiQezN0cxbYZZeUC077jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8tsMSEoZDzARxcdQvO5k5dPOFpSfekj5URI8gr5h4QTc+DnGOyi5Qma2/b7+ji+vRTpw39WO8DFAIlNNV8V73M7HMSbH2LoBPHL1T5ZHVNuhvpVLqI4eGlAg4yDVL+CST2AubE/Dd/BY+KYimQDba2BBjKqa1B52e9ZxYzlHic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZS1MgNV/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so4776486a12.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733841939; x=1734446739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=ZS1MgNV/lwdxyJvF1JfXjRLl5p7PcmdBcN2AMJb1HMo87KQeh6bAEZTFLkrWiVJlwC
         CCo2Eu2Yc5O+jx6uSVsGDE3bGOxS+LGJIw21/7B2cdTHYGjFWaFZ9qKgoi3cX97sR45c
         Rt9s7UasK33l7Nz/qA9GRIBs4rEPpnqNqk9U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841939; x=1734446739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=OC91I1i5IRTj/S23xQNhE70bdsaA401S/N/pDgHeJxQNme+N5JWBgetUEuQbv9noqR
         nbBssbzpHyFXM0VzGSoc27AMFIuD3vJjewohcnCDvF2GAoEznsYPeIuUCpDy7IKWMqD+
         CBBOAOIo+dz+8pFfcKKPE4sdjDPzb5iD6Gp3998wMfhh3Yqyg7a2B3OcBy2XWHZEnb2N
         tMCY/6XMgSfe5FuuqbzQZ3XCcBdzDOiT+55RtFNKHkYw4GDtV8oA5GNSI6GVW4N/YSQ7
         ttrHcldpaUtXkZ5PXLev+yHkD8IzFbYW2s9h0CyYa9yML9D4AfQOMFWmO7Li5xQo4kRQ
         g+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCX8bugwiSXAD2kUEjvLC8jzneyY8UxXMKZX5ldfL32Na12PR7GrYrHYKd4mvI0epuChw4TTom5W3vI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz85MmoYrT75bMlccuse2VG5KXgr1Zr56z5oF/jNeQVKQetZShN
	aWhBKELMMjhvgM+Bc++3rOsJtSzN2pQysYIqKWpOc/7wv8bp+5mqCHYCKuSN
X-Gm-Gg: ASbGnctl3eXcmdrsfnFuu+baPhAYyHGAb2FsYYq9QgR9PRcsoCJprF4euW4QT42qJHn
	aU2wIa0UjLTU05c9JzFqYIT5ph14VQ33rziZ9s5yWVuIt9MU2T0AopjqFSuNu17PPaVytksMc1a
	Z1+Mw5KpbSupCZ3AB+/bb0sTd3dA/HxaJRwUzAuKAlEMnTsSdIkI5cRMStqqbA7fNCvyqEmH0Mx
	sKEewtvkOwfuR0t03B4A+XQW6CDm70EFOdHuzAnEyasErVkp/4d5IdHCURrtDNACGL7UhWh54d/
	UmgyxZrkaqTAX1V+6eSLDsiJZ06Vs9dK0/1dK7A=
X-Google-Smtp-Source: AGHT+IGq2WVqY9FHE4Kw8mZJ334PewE8m0Sr0rxYDq1ur49OrklFDakgDoOr7S8rT9zpBAXeMwU8Vw==
X-Received: by 2002:a05:6402:5241:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d4184dd140mr11278224a12.1.1733841939141;
        Tue, 10 Dec 2024 06:45:39 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69dd81272sm168996966b.161.2024.12.10.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:45:38 -0800 (PST)
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
Subject: [PATCH v11 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue, 10 Dec 2024 14:45:26 +0000
Message-ID: <20241210144527.1657888-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210144527.1657888-1-ukaszb@chromium.org>
References: <20241210144527.1657888-1-ukaszb@chromium.org>
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
2.47.0.338.g60cca15819-goog


