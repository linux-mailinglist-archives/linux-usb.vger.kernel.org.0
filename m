Return-Path: <linux-usb+bounces-32266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E0D1905C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53A84302A47E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5803904CB;
	Tue, 13 Jan 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DAPXqVLP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0D38FEF9
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309568; cv=none; b=T1lYOBKFetkNLvS+W9yj4GlvJp+hLFJ6NEbwCyGa9Jho/asTo0ECz+kN++Zd9rCKe3x9T4rN6Kn+8SNbgd69pXH/MA/jbpfwlqNh8YMYNollQZiTM8/UKmCa9rXIMHaLpLPB3onkgOP+34CxLYeWt+fSVPY2vzG+5d5VrIRjH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309568; c=relaxed/simple;
	bh=xDKAaqJEsHbZnL+cmpHT9aD/t1xQZpYd2AXwHmw7ASc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0SHwV+23FvDFzyj4Jjt3bBRS8tDkT0TDA0wIetOFkz75W/fz8Lo1+CyUFsN/cLLQTrh9ZwAVViGbRyBGn8NXfxWVB7vbeA+wpSWBlHzAMpiUgdzNKeCzbHy/kRTEvTYGndTfgow1t61t7kefGiMMQEbdJUjaVnw8juQ6KtEiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DAPXqVLP; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b872f1c31f1so213990166b.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309560; x=1768914360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozHGUyiY6A9TybEdpmpfYkpaTQz6PtmOWnadeDhNFJQ=;
        b=DAPXqVLPu8jR3x+rx06HshbcAW+Ev1JU3FrRRNCMib6vvz94JCDzkFfS6MRRm3HV8I
         XL3m+aEybIOsi8XATyQS9BlhRuBQ2gm4nOGgdJ3z6d+koD1MPta0n136Nt9Z26TOL0+Z
         Zl/cRW7z7ljRcxdXV4/DY75PM7UoXaS0PwFFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309560; x=1768914360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozHGUyiY6A9TybEdpmpfYkpaTQz6PtmOWnadeDhNFJQ=;
        b=WOh8g5HAwxIf/dpfHu93klEu0O/nbq2+kGlYxh00RSY8jCWCPe1YDrX1MkZBDjx+8/
         5uC+dPglNG2tfkR+8eCQ/W+GGxayoG+fBVlvMmN8OWiSUk/E3y2lbUSxNJ3/S25X9FfB
         IjioYaHtBSyNTAeNQ03gfJ2QUy9Cs5MhQMGiqYC8szN2KTdujL/IqAkfOq1BXQgtGhEB
         gTudx56wi6cWaXmhegs19CNx9pCfdFBbFIzXMzL/1s98pwORY6v6rP68nJqWEnT6PEXH
         W7kY8lj4IKLwgDLt6rk0XJ/JNdBCxJnqw+EVKNGrcQJF43TA0lQvyXVlUkfcV/mL4TFr
         h8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKg7Ri5ltlB881hmmCA/UpgxIp0+lP3Ea8NodOCtMlZmANxBK6iR+Q1sFNrPoP+bx7111hAftWwdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkdTWX/vkC6rUzacVKrNiIOK8oADtn/6G92FI2c9lIwe39SS/
	bLlSe09wOHSFhm/8YhjKd3j7lFk8imExRonkml80meUThJAs0pu0dY2z4BI+sI9ReA==
X-Gm-Gg: AY/fxX5pM1Q6PUja8VG8mdOtBXXp4gpIjGXIFWTdAaL2xDGfAXCPAjHERWMq18QIIYr
	eOvSVeQAacHLx0UEjCprPgpqXt9y7KXKh3VaVPjfQ/xyf9rgQlnZ0gI2fHbPMUVUF6yDQtjS/81
	NVP5CDMB/gkYuc3L/pGMJ22Xwtt2XV29gFt0ZjGqgndUwL/altOtXIN9/q6m6TeTlrYc+WOk943
	3lmBrwdqQk/0Yrx+YHi/FJ4IVEa/MsxxxbG7+GIC4ArCzq1zCLPZwD+AwkH1tNPGaPwV7M/jO87
	Vf2A5TmgPQoC9RIA6FkXf275S4JiMnuBqCl6XWSHFS0MHSFc+n1IyeZ4BV/0Gy1133yVFXIHIs9
	gTXm1TZoWpGjwq9mEsKIggn6wHTZmgff3R5O06k7p/aO/FZjCQ7NKJf/rCLuu9oxj5AWuFEd68v
	X3WI05QvGSvlbBlmPDbMsSpOKw/xx1xezW1BoP2wwTHl78OqanWK+nvnYEfLglJbs41ZNbAr2cA
	+Ztzdg6
X-Google-Smtp-Source: AGHT+IERLF4PHZwh7YhwuDFtdlx0ez3BDip2EOvxGlTqLDh5wkJQ8ZMkQJAb5HRrvhsdbkq8VQofMw==
X-Received: by 2002:a17:907:780b:b0:b87:1fe8:9534 with SMTP id a640c23a62f3a-b871fe8af72mr384125466b.48.1768309560490;
        Tue, 13 Jan 2026 05:06:00 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:59 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 8/8] usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
Date: Tue, 13 Jan 2026 13:05:36 +0000
Message-ID: <20260113130536.3068311-9-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode selection sequence is initiated by the driver after all partner
alternate modes have been successfully registered.
When a partner is disconnected, the driver also stops the mode selection
process and releases resources via `typec_mode_selection_delete`.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc63..437a2982a9d51 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
+#include <linux/usb/typec_altmode.h>
 
 #include "ucsi.h"
 
@@ -33,6 +34,11 @@
 /* Number of times to attempt recovery from a write timeout before giving up. */
 #define WRITE_TMO_CTR_MAX	5
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 struct cros_ucsi_data {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -134,6 +140,19 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
 	return ret;
 }
 
+static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		typec_mode_selection_start(con->partner,
+				mode_selection_delay, mode_selection_timeout);
+}
+
+static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		typec_mode_selection_delete(con->partner);
+}
+
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
@@ -141,6 +160,8 @@ static const struct ucsi_operations cros_ucsi_ops = {
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,
+	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
+	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
-- 
2.52.0.457.g6b5491de43-goog


