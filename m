Return-Path: <linux-usb+bounces-32509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F351D3AA22
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A073F302E300
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6732336827A;
	Mon, 19 Jan 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bIGmewBI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D77358D1B
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828760; cv=none; b=YkCZflVIdG4zXTyKtDXu0EQV9bkSW20x+bI/19OMuxYre07ColZ1s9gFlDlqK5YiXZAwpCy6joL+fcjzdnqYhuj9tUMwMcy2rC+aVIkbq/BRQPCqAwkT8uhWjMa+B/pUal0hXD0qHkqr3dPXDX6EM3TprXyKWNLV9AAYj9tfvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828760; c=relaxed/simple;
	bh=zFB/wu9zF/WPehhEPtbWl8UOJvP9spgPqLlItDsGdnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjMgQlgVhq9xjkuwIjaPqyd2STTbJ9wSM/Hw+QUm2sEZd3d+HH18i6p1Aq/6Aaba0JUMlfu+MtlFGTFCwBW5b7kfeJauaIby3lbpgNWse7Ths2w+rUw71a3mUseobIt5oJLdn9/cehau9mQzNBJR/UaHUD+xGcDhsi2+4sXqpn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bIGmewBI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b86ed375d37so562717866b.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828737; x=1769433537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jj9JdVBqHdqB0HXN619HZiSF0v0HIUhhUTLIyvICbg=;
        b=bIGmewBIoAq+cT0Qhjb/uS492Db3u8Tp0aySa1K31MSvBb2Hh2KY+jm0afvZKLOvZL
         RCzWUzRFhtYiuamP+bLmf9+DpEZS68T31VQQdHgC3OF0+bG2yY2NI/lD5TrP3XPN05ju
         pJL+o+T03+h+9EjDNwqPIobfBvMAazWmaXELM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828737; x=1769433537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Jj9JdVBqHdqB0HXN619HZiSF0v0HIUhhUTLIyvICbg=;
        b=tnYaOS0HBwMTjxmqFoXEQE/ggqLNWB0HNHX+6GvzxdwttxCAQDhg6EUT+JsU7cP//7
         P9zMxTeXGWChgA/jjF3H5cYG3oaX37Xii7QYtyU5WhSj6+TxSc0PXmxFuRdFP5o19Zwh
         If43o/Jmy1O8ULi76Z4UO0RgENpLrY7EJ6LxVtOHd/Gxbs6p58W4zJqHr5wrHSKuQU7d
         oEY6VkmzzZWj9BHyJkZGaJ94feBM8+nES2ohSUcuKV8njQh63aUWCWtOa97AX2b4c9no
         bEyE4hqzf2eTXDGFtXP1gGIlg4CpaWHT4c/9iHKvLmjeyQD8VN0sgBD8ffjM/Lnz4/ww
         /EUw==
X-Forwarded-Encrypted: i=1; AJvYcCWUTSH9m90em/Q4vLfzaCoI0i77HosQfOqOHGdMtt+j/TB5+zZ1Z70D3pNf9jQIdqrnVUMH6IkbXF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxzvhLPUin1f/e83jPDqaD1hqts6pKzjFpUmIkc0c3UhqfGGmG
	2y1V00D9oPInvzBf/sKPwt6335jLWdqOec3wP1EKudPRTgxogR8CbBD42eT0kCyFAw==
X-Gm-Gg: AY/fxX47zuCiw3rkBMhlVYvBnUwi+0IQQ8AP6B2NE97yUyghSbsifMP8xOXNX/1ceJQ
	unbDb+eKeUCxCDaBq3bQ4rsUDUOp3GDPQ67Z/IGGQp7YmK1spbtEvp2jcfMJW/aLy25vc4MKmo9
	UaIH7SSyVvlKot33v+qR4qydV9GvMvn9XVO2vuyYC0H+mGDo4/tbPujL+72e1FMvEe6UEFsbzQK
	eKHsVHu5zafdY/a3okc8YOzLCL912vDIc7/NxYrKL6wQNjWrEkMia/dceNJu8JCEsrt++yPxN9B
	yOhHM2koZzkDY7R/e0qVvuxhMb3Ohegu6n0pj6gTiPzxroCx28s1xSXDDrY4pVvSotWvvh8TRxJ
	JmYqGKOcL0werid4FY3pLlMdY9b+eOeBNP2mnQAM7iYZzRkGT6rMfvQwngEGD6EXH7htjmu2pmY
	r5mUGOdatrvbx9gHDXyDCnPRHDu7uwCsEkTagqtoTQjCa4cuX+YGWXpOOs6+R7euQkgRZ+SP/5T
	KhfR8pn
X-Received: by 2002:a17:907:8692:b0:b87:6ce:1269 with SMTP id a640c23a62f3a-b8792de8e4cmr919137966b.19.1768828737282;
        Mon, 19 Jan 2026 05:18:57 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:56 -0800 (PST)
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 7/7] usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
Date: Mon, 19 Jan 2026 13:18:24 +0000
Message-ID: <20260119131824.2529334-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
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
Changes in V5:
- Use the no_mode_control field instead of
  con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE

 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc63..6bca2dce211cd 100644
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
@@ -134,6 +140,20 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
 	return ret;
 }
 
+static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
+{
+	if (!con->typec_cap.no_mode_control)
+		typec_mode_selection_start(con->partner,
+					   mode_selection_delay,
+					   mode_selection_timeout);
+}
+
+static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
+{
+	if (!con->typec_cap.no_mode_control)
+		typec_mode_selection_delete(con->partner);
+}
+
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
@@ -141,6 +161,8 @@ static const struct ucsi_operations cros_ucsi_ops = {
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,
+	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
+	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
-- 
2.52.0.457.g6b5491de43-goog


