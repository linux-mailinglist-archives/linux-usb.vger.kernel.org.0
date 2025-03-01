Return-Path: <linux-usb+bounces-21229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4123A4A9A3
	for <lists+linux-usb@lfdr.de>; Sat,  1 Mar 2025 09:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78441754AB
	for <lists+linux-usb@lfdr.de>; Sat,  1 Mar 2025 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2140F1C1F13;
	Sat,  1 Mar 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OL5vyS3Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A431D5147
	for <linux-usb@vger.kernel.org>; Sat,  1 Mar 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740816682; cv=none; b=TjUMWXleKWype9ntGi4bhW0HDJGPUXMqi27KZ/7hRNCTvAtEBT2U6D6kFWEJScmbSTB06HHi04W0FQeekzFXmrQn8MVl8K+Gt4PvjLvk1oV2L8catfG89C2imehTjjmbPKUkV+L+Gz7PQmzUbBMTzjJJ0LR2ptw+hNJFZ9dBmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740816682; c=relaxed/simple;
	bh=W3esQ3uB2eK7u8wdWDrtbmEiIIXQW1K0iZZVUbIYJ3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FA6amjOEB+mTuVwpVvehnrSWXSxCpxbTvWBanjjccOg92hC5sRUk0Uk9sBzEj6eiY9xmgarxWVlXP1N+KGy2KuqylHmARnxeXBV9oh61i1+kdUW0/zCtldUImNSrihtzmunPUULhYbb5RZl21EmHggCBvCobTok1yC49mZxyJeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OL5vyS3Y; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso4077204a12.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Mar 2025 00:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740816678; x=1741421478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9AznYEhhOxvf1OTat2or4y7QL3kvaIdXLnyiooUz1o=;
        b=OL5vyS3YzeHes3eO37urGrnGjxDrMISuhYLEDzgNF7ICl9j89K47qCWTGs8HJNn5an
         ZuoaJ+4mnjWzYwoHy4hH5khXFawyh7tiBBOG9uB1kbDUvkdhkkFRBqLWYOxXwPetvDMJ
         HTZcIMeu6D0tqtx9Xi/5rZuje4jDNLgdNKcAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740816678; x=1741421478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9AznYEhhOxvf1OTat2or4y7QL3kvaIdXLnyiooUz1o=;
        b=rHnh129r5HMJ0xJFbwlu+7udW//XYqB4xFcIRAbOPQqvi3Yumpl6ce8o0EWyzjMQZ7
         AkzP+LB1Xtuag20qN0tl9sXpYuCK+jWyU0grIz/ruCZIwBYhOBgdHlCGKl318dnmEACZ
         nknKJCjQ2duT8Dorly7rUN+3yVDSsyoZT1SchbJvdZDYdd28Y3iL3g+8rq1bBYeDW2Co
         2++CNGISxBIl0CZc0rRZPyFh5Yzhp6pi2JlT63pWnQMqAFT+65xPfnjzgnthJjnCsqIM
         ubFvMQkTsTDHilx2HjRN7rxqL7V89PGtIoROMsUNGl/hC6JrQvlU1tPWivDI0zCdKE9+
         0kLA==
X-Forwarded-Encrypted: i=1; AJvYcCVttkAbgla7ikUNNkWgehPn3xrvph9qKr3mPNAFPlGgr2BuTXjHzPINsJrSO3zcZFiEUuJqWbQy4oU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJih6qMZvcIrCRJQNKTSdJtqhmy1PQdzekUCk2b/Yme/quVsAI
	BefJor8bheh8vejpVO1li8z5wxV+19rLNMKqXs6O7UQM+e5NAk1WiJ/+8vc+rw==
X-Gm-Gg: ASbGncsp2J6NfjRBvUFaKp7sKPSHc3iW1LGoaIqyAf4ZSL2NuOUqaOQ5OpxF7ED+6S3
	7CZIWFGwBLCdC55JNOFtNei8y4ROgLsuIfYebGsxJsKibQZO0NqfKKSpaT7u4sz8I861bbJAGz1
	9y5ZxfpCGbbiU+pqzLVbsC8kHkubufIHgzkoXkX2v5if8utNTPpO80UXdQ58JWXakYzw/6gKOkA
	r3LiJ7guA4PfBbBVLALX9ghxoF13ikR5qccfGlVSNGPfpUT9FiYwLKMI8di/W0dq1KQlAU6LRJZ
	8JiZspzJdimsvvS627mEs5Q18L0OzFCFcKOX0OOaAUNNlg6a/t8YJ+9rGdStUOWaWoRv2LmplHa
	XgPLwdQY7FkCaxAjfMg0jHlv9arCGoHjuzvw=
X-Google-Smtp-Source: AGHT+IF2bddT16xrWqHaoLOeMqINJ2RLswpfmiriAxWx8apEVmlQ5vYHvVN5jHk5ZP6gPal6kwpftg==
X-Received: by 2002:a05:6402:5214:b0:5e0:348a:e33b with SMTP id 4fb4d7f45d1cf-5e4d6af10d0mr6525153a12.12.1740816677909;
        Sat, 01 Mar 2025 00:11:17 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa5dsm3693641a12.14.2025.03.01.00.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 00:11:16 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 1/1] usb: typec: ucsi: Fix NULL pointer access
Date: Sat,  1 Mar 2025 08:10:56 +0000
Message-ID: <20250301081057.1952519-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
In-Reply-To: <20250301081057.1952519-1-akuchynski@chromium.org>
References: <20250301081057.1952519-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resources should be released only after all threads that utilize them
have been destroyed.
This commit ensures that resources are not released prematurely by waiting
for the associated workqueue to complete before deallocating them.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fcf499cc9458..43b4f8207bb3 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1825,11 +1825,11 @@ static int ucsi_init(struct ucsi *ucsi)
 
 err_unregister:
 	for (con = connector; con->port; con++) {
+		if (con->wq)
+			destroy_workqueue(con->wq);
 		ucsi_unregister_partner(con);
 		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
 		ucsi_unregister_port_psy(con);
-		if (con->wq)
-			destroy_workqueue(con->wq);
 
 		usb_power_delivery_unregister_capabilities(con->port_sink_caps);
 		con->port_sink_caps = NULL;
@@ -2013,10 +2013,6 @@ void ucsi_unregister(struct ucsi *ucsi)
 
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
-		ucsi_unregister_partner(&ucsi->connector[i]);
-		ucsi_unregister_altmodes(&ucsi->connector[i],
-					 UCSI_RECIPIENT_CON);
-		ucsi_unregister_port_psy(&ucsi->connector[i]);
 
 		if (ucsi->connector[i].wq) {
 			struct ucsi_work *uwork;
@@ -2032,6 +2028,11 @@ void ucsi_unregister(struct ucsi *ucsi)
 			destroy_workqueue(ucsi->connector[i].wq);
 		}
 
+		ucsi_unregister_partner(&ucsi->connector[i]);
+		ucsi_unregister_altmodes(&ucsi->connector[i],
+					 UCSI_RECIPIENT_CON);
+		ucsi_unregister_port_psy(&ucsi->connector[i]);
+
 		usb_power_delivery_unregister_capabilities(ucsi->connector[i].port_sink_caps);
 		ucsi->connector[i].port_sink_caps = NULL;
 		usb_power_delivery_unregister_capabilities(ucsi->connector[i].port_source_caps);
-- 
2.48.1.711.g2feabab25a-goog


