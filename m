Return-Path: <linux-usb+bounces-18051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA69E1EFC
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 15:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC92F163836
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 14:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF871F667F;
	Tue,  3 Dec 2024 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NMwXRelt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F381F6668
	for <linux-usb@vger.kernel.org>; Tue,  3 Dec 2024 14:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235836; cv=none; b=NqCtUSiPDr7na+77JBEQc+V4iVKOe4/tb1CHmYjz87ViJN8D2rYSMeJdnPChaKjLjiUdw5MacQSNEJymJUP2OjFedGms1zS0Nap2z+KaXwzsgvJgpKGwceiuGotQYSXKSLeKrs2jOruwAUhJXlVrI7bor8TM+2c7oBck1cGGky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235836; c=relaxed/simple;
	bh=FsVPWUYW3r8+vYPca7TkDYiQezN0cxbYZZeUC077jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ou3wJurR+AhG4229DTT4e4xuhGZis8cR90GRCDZuVdn2sa+uAU0QmVCz3mvoDNzZ8PRd/FZ+YnXg3gE08FDkNegy7Q1M9dT51D378ra8Vkj71wGmXpe1Pmdom7v5Bnx5xhEbGiK/Pz4GWhQLguQAowwlLBLxgpIliUt9lDUJRcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NMwXRelt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9e44654ae3so725584466b.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2024 06:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733235833; x=1733840633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=NMwXReltxbxGWmR3TzvoL+PdUAHvRXniGnMIqyqsvH4Ol7SxGhGwXNbJp/Ehc5kcRJ
         mI0BxzYdbrSPMZyMBJAIKfR7iYmMgEBelptqsniATi/GRz5d7RwwEjxluIq0yJUT92mZ
         OOPaD8Pz9aZXZWqu7L1boL3b8jXxAEdsaVZjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733235833; x=1733840633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=HtfJd+nh6C5ZCKFFn+yxWrI5S9CKSgarQCcmaciu8r0CctxrekB49Ex6Z3npOBwXd9
         0bEZDvhdECHmdvD0zH2EW/a5q9VUtLOd+jSeanhArziVMC6WiBSkZ9rj4SIXWzSWkpa8
         1OqF1tu06Sl/vrI7wCvWXvWOXIkKgeJEBzjKC0pDQ+D2kPaqtEC9IdbjTt9EjdAjEjA1
         Do87+gXuQMsOQionahognU6FOhj4ar8/agbge4qEuIGS+ur871TFRiE8ikDLjf7iWmFi
         ANjrVKjH3Hh9258pWYlV4LrqaSqsxEQL701WIKJzngZys+d9g8tcB0BTYA8BhdoDazvL
         5H9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGnvFOMZN+V7tA3rtaCFqiAXPaC/IqVYoaO/2ViJHHVtOPB3nLfD6qsiy91hNBYhpqutfDVWjdVq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0xuiByNUSThkJhFHI8q1BoYNdeegNg/AKfWMVXxUAKOyH0Du
	NTwvv0KlgE03pesUDRltFMupFme/xXndyKJtl0DDG2rXakeMLCccdVongZ6u
X-Gm-Gg: ASbGncvZguSuZYKfA+1g3pj7jJwFUnXoUBSab1I3G+qBqJo8L2+uL6VubSZolZjXLJ8
	8rufU9jY+aY42VuEu/21xxFa2gf1uH4qaKjdV+DsmoNKpxPNt9myJRn/PLLVP0aM3dvg2HAUjcy
	cw8dEDNUZHJP5mzoc3563Z9mPAg1TBVvEFpueexp/ng6VcBvad4VYHwiG5bu44prt1DN1tWSyVl
	28Bwaez/9KK9kTCyzhllSNkhfpvxmTG+why1ni5tDuuup6we1iwnGi+o/e5fnd5PEQy1eoZUKSO
	Y+ZbfUppFMqbmGaw+k4nue6yLt5xyf0+7DE=
X-Google-Smtp-Source: AGHT+IEZs3URavmq9Pv+Mk1092umnpPrKs+K6WF+0iktUlUPJg2Ncc6/ZTiR5axE8RkDJuW0va7iEA==
X-Received: by 2002:a17:906:328d:b0:aa5:30c0:384b with SMTP id a640c23a62f3a-aa5f7d4d1f6mr193222066b.24.1733235832723;
        Tue, 03 Dec 2024 06:23:52 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a64sm618272466b.96.2024.12.03.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:23:52 -0800 (PST)
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
Subject: [PATCH v9 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue,  3 Dec 2024 14:23:13 +0000
Message-ID: <20241203142314.3892422-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241203142314.3892422-1-ukaszb@chromium.org>
References: <20241203142314.3892422-1-ukaszb@chromium.org>
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


