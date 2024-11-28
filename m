Return-Path: <linux-usb+bounces-17949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5D9DBDE5
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 00:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1172820CF
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 23:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73C51C57AD;
	Thu, 28 Nov 2024 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jH7ZZhiA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285F31C4A0E
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732836046; cv=none; b=TOh+rk5I7Cy5TMGF8uBoQ/eqR1emZTCl4ptFCbiJnpVD11cXo3BzIEPNj7scMXzzgK+IrLAFSjSftx6erFapGnEvwh7Yrue9w4BRJqHDAjIMIrjc09GrNxezpuP+pELCY09x+tarvSWB33EKbb5684ySKiy+lTfQK0ix9Mgkoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732836046; c=relaxed/simple;
	bh=l6xy+IFEiECfEGnprsekfHBbUSUvzcyN3jyJsZdVimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DtC1GWrTcV04iZ+Lio6ZeDXmCn6P5R6ItoD9VtSBVb87dLEqVJWL17p+UOribFt7SD2OYfDTw+xG35CcAIlMoroVfxtfm7oIMiSph8CLB4INTiJ2MU8HIsGysDAkBBW316dYwukwroCrs/BLmfvi/0ZPBlC/5Qg+f16EphB7C6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jH7ZZhiA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa530a94c0eso178373966b.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 15:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732836042; x=1733440842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=jH7ZZhiA8u1MGTedOjyAljTKVQ69cosSvWZQ3bJH4UCVayKRC1CqZI4AYK3nIwMjEb
         pSBcdh+iVRSJ40T7B/1hCDDG2Xhwdg4pjOTZSb8lnA3zh3Xy1UvINVC8Wjhn1C4mIrdi
         jT36BTr5aSA/CGo1SD8IUU6Gu1v6sIh2HdP6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732836042; x=1733440842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=uXF/puHhIyyhC852i+zZs+ExyMnne9YUKz4ZNj0ejMJXatxwYNijEBbjP0znrmOVjn
         zJzjqb+/SE3GPqJ44ZolFElocLFqWwNf09DO1eWP3/1z/OT7eeUf8gyuHe0mqG071jw+
         +TxpSFTqtgpYoZlyURN/BUsNGcvk5hOJDTypdT4+DoRqDHDcDH/so80wlX/oW5gxDJsI
         yqXdEviAnkPedbFZXzSKiILF7OIcHhT7hnVZFcyWo+T5JjhlVgXSMJ0+HXBkrRm1WNOL
         hr4x3D5UHjeBr2kNU9J9C9oNRBGiLdj0mREgntOqYVFlIKav5o4Z5gVgtiTpxW8jCJ4p
         b42w==
X-Forwarded-Encrypted: i=1; AJvYcCWBxfbBvvCbuvLNyrPw/tmOua6kUT5iAt7IUPQ/fIMH5b7epzEAqQ9nJ3vVbeum//eN3qFUbLcDE7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdzl7ec8nQxjwApcg8b2x2usbuZx+e85r5c3NO961FDSnAiS1S
	hSSoWASx4/SlLNwNqV1JVrqKsVenTTfCz24L6K02BHOpH9YORfbc4ZQLEXP9
X-Gm-Gg: ASbGnct4p/Bg7Txuemf+4zLvQAtpvervv3d4/DA3o+CIdVxCCJaAYVvrWOemHA4/RXF
	logs1YnLVZFRkbWPx+L/pmshX2YjqDIthqf1Jyxi+KM8L3T1yeHjqwpGdMTf24hKboibT5o+Ss6
	DIC8dKCmwofJADoCkAKG7+ES0xHXrbFXrF4XqPW8MeC40V6VZaXzJHmtdKCKN6yyJ5zpw8bVPMY
	74PkXYW6nUK5CNOGsw5l97EoA2VccVK+gbyoM7hYvNxNiJ+5ufEEaA3Btti20reo1jjNxHl5qgL
	Qwp0xC7Q2DYZMde3yR4IG/d+KtlC+U7vXb0=
X-Google-Smtp-Source: AGHT+IEbHS/TqgWel+q60F4olytexp9iKriY/SlJd0qzu2fK4Syg4e8bETrJEGhXpG+0ib3ZgzKhtA==
X-Received: by 2002:a17:906:c10c:b0:aa5:2817:cd34 with SMTP id a640c23a62f3a-aa581090e26mr697371966b.57.1732836042582;
        Thu, 28 Nov 2024 15:20:42 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d5672sm110757566b.77.2024.11.28.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 15:20:41 -0800 (PST)
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
Subject: [PATCH v8 1/3] platform/chrome: Update ChromeOS EC header for UCSI
Date: Thu, 28 Nov 2024 23:20:33 +0000
Message-ID: <20241128232035.1525978-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241128232035.1525978-1-ukaszb@chromium.org>
References: <20241128232035.1525978-1-ukaszb@chromium.org>
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


