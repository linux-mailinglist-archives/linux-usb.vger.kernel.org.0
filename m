Return-Path: <linux-usb+bounces-28863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FACBB2460
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 03:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55CC3809C3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 01:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F24078F4A;
	Thu,  2 Oct 2025 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUO/MYB2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF5C2D1
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 01:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759368638; cv=none; b=ofZj47VYTX6quSHWXOvXhiHYl4pozBi0gkAFaJyW/IXOzmXsRlA2SGLxAmUbDkIho7ACsg7Pm2LlLP1FoSafiPJn/kqHdsgFDZM/DuO0nTZ1Is+MWUVerDXsLhLHgu+gRSYs/mrgB0bvTnjR4lTmRv8YdxauotOR0u+qkl9k+J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759368638; c=relaxed/simple;
	bh=yHCrEUBUDlDvieJF6g9rdupvxZAXsuiEo4h/EypvVeA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=svJ35WvqXkkgllhFQKWUTJVvc7r+s1Jd8eJ/jBSwmpOEnRqay4iH9ixUmaFIncCOKbZkukYO+2sRCanQUlmY/6rq/NMMhFl3hyZru0i6n3knxjKIZEOdK6Y+Dk7WU+K1tFZWBitrR7DwXaE5qW5CJBTsA9u6h1Ip9DjDAGhdHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUO/MYB2; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b55517e74e3so535118a12.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 18:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759368635; x=1759973435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LD1srCTYbjsb64PrBY5TOEK1LBdxCOb9aClNRrS7XLc=;
        b=AUO/MYB2KuhvtJSNdUimVZF05RSsSpV5gxMWab91Jt/tRD1GIvVeWLtUtlH3yLDAYO
         t/BFAhqD0wt8oOtwoNU2QxTR4uCkiIgMpzXKzGpulIoPFM6bstAmJZZIdMYpGEpZzw8r
         krM40llwwEdQKNxltZcU+TQjvVHfaZ3MZEf81Q93VJo3oalRg/TglckM1YkLo1208Ejo
         A5hEOcffFIUBBYUFmufkhm4Qw9Xf7LQP6NhL4sejvUq/gmDEB4MJmtB+avz0fCISd9gi
         Z4KsEfqFL8RSuyOh7weoGlzu+1MIuunx07X3yf9JIj46jjTECHXoRTjfoxTHSOTr7VZO
         kztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759368635; x=1759973435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD1srCTYbjsb64PrBY5TOEK1LBdxCOb9aClNRrS7XLc=;
        b=aXJx8kvqmRchsORrHCEQmBuA49x3ppR/SBrokRJXjQn8e4j9/P/12YCuAXx+jr9dAb
         DCuVUFBlj0dCVZDK4lM7q6b93o654ierSizaJKfjeoX2qgHGifaZwbc/f7SpXCzOm8MR
         0vQhYfOnX8RVMXkIZFvPhdc6i5JxLqJr87HF2MfaocTnNWiun8iT/bvHUQUsE1W5uzfE
         OO6jeU6gG33vskeCWvBjn6UILaEwqbIUKeU+NmT5IuJZA+UryTEOdv7WvISlDcWrXaUH
         sdT207r9Q/qr2WJA875KIEiWKdUteW/CEc1OXnw5WSnspYlGYMqXtv6eJFFOe6pBwNkz
         yqwg==
X-Forwarded-Encrypted: i=1; AJvYcCW9He7TLMvSMbFAB2t6421Ky9BhaEl7tYaPdl5AkuxU6njuXJWoC3AtrUXl6j+SVh6mLeeuvmuLLFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQVzNoQr+re98oBvKKBgok8LKdBHbIlcaoyb4V6EA9eMThEyz+
	zGZuA2syQqH3oFStxph86sRq5JDVHVCBPqz3YBmGcV+YDeAq8hU5hPrm
X-Gm-Gg: ASbGncuDbksw3kj3SEi+4p6GuAaTP9zaRM2ZNkL9g0cIAPPwv4UeklIRTz8VWB+LTNF
	tJIxwxOLuDlNEhvp1/8daLHEBzsYbumhfbvhDrfgAYIOCVMd9DK7MkpmNAN2Z2dGN1YaYKsRibN
	YRKtY/Vjbsx3tNoNKUpZgOTvM2KKYegl6BdSlI0lsxAx63zC530JGmISdkOm8NdsR3Zwrtz02t+
	/BRIxuF+htcrFhKSR74xpkT20xsJOBKfmTVyRRZlUOmZkq7JiG4+12VQReXAOH5CqDh/v+33eBm
	slHXRbmzCAb6CCVWnjwTppDLSR5D73OQUb0A/EU+Vq7EQT2DGi0H3W6Z5AGIfdjcbS3JsRBYEL2
	zuR5yB7EKCKYZo9Tby/f/P6JUWgk0EA==
X-Google-Smtp-Source: AGHT+IHwCDQ1m3Nx5F0xwvU4w0xrVZO3PGnLJA8hVHzj4F5bdM0dmnnEYlo5YuKngbm3nepOHWXqMA==
X-Received: by 2002:a17:902:ebc2:b0:262:9c4:5470 with SMTP id d9443c01a7336-28e7f2ef23cmr66511495ad.28.1759368635145;
        Wed, 01 Oct 2025 18:30:35 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5e07sm9004755ad.116.2025.10.01.18.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:30:34 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Fix workqueue destruction race during connector cleanup
Date: Thu,  2 Oct 2025 09:30:26 +0800
Message-ID: <20251002013026.4095030-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During UCSI initialization and operation, there is a race condition where
delayed work items can be scheduled but attempt to queue work after the
workqueue has been destroyed. This occurs in multiple code paths.

The race occurs when:
1. ucsi_partner_task() or ucsi_poll_worker() schedule delayed work
2. Connector cleanup paths call destroy_workqueue()
3. Previously scheduled delayed work timers fire after destruction
4. This triggers warnings and crashes in __queue_work()

The issue is timing-sensitive and typically manifests when:
- Port registration fails due to PPM timing issues
- System shutdown/cleanup occurs with pending delayed work
- Module removal races with active delayed work

Fix this by:
1. Creating ucsi_destroy_connector_wq() helper function that safely
   cancels all pending delayed work before destroying workqueues
2. Applying the safe cleanup to all three workqueue destruction paths:
   - ucsi_register_port() error path
   - ucsi_init() error path
   - ucsi_unregister() cleanup path

This prevents both the initial queueing on destroyed workqueues and
retry attempts from running workers, eliminating the timer races.

Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 50 ++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5ba3a6c81964..1f71c9983163 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -283,6 +283,33 @@ static void ucsi_poll_worker(struct work_struct *work)
 	mutex_unlock(&con->lock);
 }
 
+/**
+ * ucsi_destroy_connector_wq - Safely destroy connector workqueue
+ * @con: UCSI connector
+ *
+ * Cancel all pending delayed work and destroy the workqueue to prevent
+ * timer races where delayed work tries to queue on destroyed workqueue.
+ */
+static void ucsi_destroy_connector_wq(struct ucsi_connector *con)
+{
+	struct ucsi_work *uwork, *tmp;
+
+	if (!con->wq)
+		return;
+
+	/* Cancel any pending delayed work before destroying workqueue */
+	mutex_lock(&con->lock);
+	list_for_each_entry_safe(uwork, tmp, &con->partner_tasks, node) {
+		cancel_delayed_work_sync(&uwork->work);
+		list_del(&uwork->node);
+		kfree(uwork);
+	}
+	mutex_unlock(&con->lock);
+
+	destroy_workqueue(con->wq);
+	con->wq = NULL;
+}
+
 static int ucsi_partner_task(struct ucsi_connector *con,
 			     int (*cb)(struct ucsi_connector *),
 			     int retries, unsigned long delay)
@@ -1798,10 +1825,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 out_unlock:
 	mutex_unlock(&con->lock);
 
-	if (ret && con->wq) {
-		destroy_workqueue(con->wq);
-		con->wq = NULL;
-	}
+	if (ret)
+		ucsi_destroy_connector_wq(con);
 
 	return ret;
 }
@@ -1921,8 +1946,7 @@ static int ucsi_init(struct ucsi *ucsi)
 
 err_unregister:
 	for (con = connector; con->port; con++) {
-		if (con->wq)
-			destroy_workqueue(con->wq);
+		ucsi_destroy_connector_wq(con);
 		ucsi_unregister_partner(con);
 		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
 		ucsi_unregister_port_psy(con);
@@ -2144,19 +2168,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
 
-		if (ucsi->connector[i].wq) {
-			struct ucsi_work *uwork;
-
-			mutex_lock(&ucsi->connector[i].lock);
-			/*
-			 * queue delayed items immediately so they can execute
-			 * and free themselves before the wq is destroyed
-			 */
-			list_for_each_entry(uwork, &ucsi->connector[i].partner_tasks, node)
-				mod_delayed_work(ucsi->connector[i].wq, &uwork->work, 0);
-			mutex_unlock(&ucsi->connector[i].lock);
-			destroy_workqueue(ucsi->connector[i].wq);
-		}
+		ucsi_destroy_connector_wq(&ucsi->connector[i]);
 
 		ucsi_unregister_partner(&ucsi->connector[i]);
 		ucsi_unregister_altmodes(&ucsi->connector[i],
-- 
2.43.0


