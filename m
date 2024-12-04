Return-Path: <linux-usb+bounces-18100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EE89E4746
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 22:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93373B6208E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 19:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A871F03D4;
	Wed,  4 Dec 2024 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dioKb9gX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734D239196
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341753; cv=none; b=Wd20iNpcPszYXXwK5c+sA0fx/UMLkiyjimGz01+0TKc10M/bNKH08llrD4xUN22INgAUgyDYD3RJJPrjmA6yX1cTw2mrxJ+np4OU8bX/OgQeWZswrJdPS4BI+8eV+ascIC3sfIjRHTgC6IiaYcMXkkg1LcKUUwHUlx+lMrKHzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341753; c=relaxed/simple;
	bh=FsVPWUYW3r8+vYPca7TkDYiQezN0cxbYZZeUC077jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTxzXOuah3oZnB/mgOq6QbWIeif2ZROxgQhjxuI77FqJ+WMBN8F2sJ01KEDVMsc9GbVnCPjPN+qCvRTZQhyt01fJydlqLUDJ1o67zduLosydJvaRT0Mue6aWk23fTAJWTP8GuUqkupkeSKoysODhMlPn1S/adJu542utlhNQ+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dioKb9gX; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0cd67766aso83378a12.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2024 11:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733341750; x=1733946550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=dioKb9gX/DzpE95bWTXRBMzDPOSDzVXCFnuYzctWSyviQWK8iRBH21Pcl2Qto0Govq
         aQjTrTFbNSY5IIY5O7px1252ViLH0AoW4MXNN4G9gaUE0SXFwk10I2Z8tTPDYSADMeff
         pvfFusFdruIq40vyUNwl7FhPoeMTuoUqRLXHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733341750; x=1733946550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=UeDP+iNK4gclFC4yrL6MyZD+kbODbbM6kzf69VU7x69QqLd2Heurqo89hMamI2rgOo
         n3vuMX6C3llxwvUKWw1tOCOPVuJik8zPi65AYYwO0ef4EO095SoEch9m5bAp6mRdrIHb
         JoAa2xX/L/UN9WaNxLzurYetdr71McV0Ghr79N9Iqz57MSrZ/GLdvkYnUaQ4FQXskdvp
         JozOkUyqSWuqTooAQLHfowThaN7jP+ddxu2K82nuy50yk+YhFDg5XKDtvqOxuaD7Br2V
         lc3+mEZLJ9BH4hVCa1u751pb1ZJlGWNgzpoPr45CnUeIXxuo2mBrm1oQ7nx2W/d+Ct3l
         BMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Feq2SVSHk54hn7zb5bjDW9OqWWEdIEWg9RdS3Y7U2/qzHjwEN1FWdRw5ZnCa5NmtU48jXLlQcH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmlFkSrUqGMQUZHamCyEkJYNfogyVP7l+k2RHkK+5nsNh60TYK
	4MAh/vekOMJtjcs6IGSazuDsvS5xJ3iwsuAEaQhvHxvieBRwJuEfJ6ri7UM/
X-Gm-Gg: ASbGncu+mrPJCz2BFMjrTYGi9kxIF7/WihaGTEG+e3Tl2MJWr9/VOKviz9/gVEKXJzX
	kK8hS95pFTaqPyt35hpW0IqOWrziouNIedcKNqBoQdFe0Do6f9e2IUietW7EXyqAzgclntRUHuP
	VmQwlBpfAEWCe8ZyZcYA+KlUFGhuKvtbTKj6/XKeEMVqVcKxQR3lsEih3yAgdkwnAOsn9ywtRlM
	jV1cV8JnFKB1n6awfz8MPXAidVSuZDzB5fhwGPoYF0bg+GmvjSUQGz9pF9WDcIk75Z5Hw6XYqK5
	6FIHNX6D9CjOE2Ttm2xW6jm0f3EJudB5wOQ=
X-Google-Smtp-Source: AGHT+IG7z/Fh6NDk1TqKo00mbOQAjB81fHSKqdVADw//P121W6LLzlsrt95W3VRLrdaxmtYCSrLJ8w==
X-Received: by 2002:a05:6402:2743:b0:5d0:ca51:e859 with SMTP id 4fb4d7f45d1cf-5d10cb82696mr6854675a12.27.1733341750559;
        Wed, 04 Dec 2024 11:49:10 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996df797sm775338166b.68.2024.12.04.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:49:09 -0800 (PST)
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
Subject: [PATCH v10 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Wed,  4 Dec 2024 19:48:59 +0000
Message-ID: <20241204194900.371696-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204194900.371696-1-ukaszb@chromium.org>
References: <20241204194900.371696-1-ukaszb@chromium.org>
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


