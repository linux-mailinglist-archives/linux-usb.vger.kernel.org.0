Return-Path: <linux-usb+bounces-28945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D6BBFD11
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 02:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ED2F18866E1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 00:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE7A239573;
	Tue,  7 Oct 2025 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HT+zeqD2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4E2397AA
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795239; cv=none; b=R+d+mUs1uko5jSR1mvAN80jLlj/UgeiABYmF4ytZraJMWYcsvbtim7Urvpb4VD/EMMc+ZCk67si/q3vakC1A1+7uUSgd2Dt2n7ztu0hdR4rYfpY5zlx+WfVmsAN4C+5bJXTnI8+OBDx0pXclohDBBxzzlYPYrsWEJGhumbsEyEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795239; c=relaxed/simple;
	bh=GBPMFxcyATcinHz2L3AJDSb/kMMMuAbd+drLtO73/sI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aD+B9oZUB9A4D3pdK/lbZzuv7FbTKPm24VEdQc/h7ouBk9MSqHpAHoXqpTTzRdFteCSGSo52Eq3fPvd/7cfBRfppY1KJS2woOWDLh56Wd+6ViHpYbIlL9n2EZuMk3G23bracvVgpWfvD4APwdoM8XCBahF9PgdfigQooUiVgm/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HT+zeqD2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-26983c4d708so46397995ad.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 17:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759795237; x=1760400037; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qGKXpJpqBqzMfm+XRzJ9DqWA3n0QzysPqL8GwN0dGls=;
        b=HT+zeqD2rdthnBqRYpixPYr8EzjEQNI2/jO8dIvrS58zyEZXPUwivmtC0mDC9Qx2S9
         qEzkKjVmeVxmqFOggjk7hbP+d6zfm8LcOwWpLc6mBLntt81JGJoiAOVbTpuXBVahl34u
         dibtdK1P3Rojike8Es+TxmrtLD6k7jEmhfVIzBcX5x08FFjwny73QZRkerrZn+QNXh4l
         JVIYKm3MK5WuLdSwLc8Qwwj9PwUB0TX7KSH45wriOme+A21t1WSpnvPctHpWZfwHK/MK
         7ugAxhtpmuslUH9Z2puiGENceKTP/3tkDvsjelpmk2wYKM2RLuBKzO9dQUyZ6adZmjzq
         WSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795237; x=1760400037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGKXpJpqBqzMfm+XRzJ9DqWA3n0QzysPqL8GwN0dGls=;
        b=cqWVSVbZYtiRtiRnQy5IM2Xdz6b89ckHi/KJpVfz2Hmju1VPy4GupGxWnJuMnvLWhL
         wg5SCQzQOmwNISEF2UQGxl71B2tdZBVUUJLgNasgb67VyMLJP8YsVHDVYmI4s+A23JA9
         SzYY/+9FFQK9DCLEf+TUnIuNw5XX8ZR4gAxJdWzJAs1rXUewNzdCfBQmDmk0SV23hEwn
         2UNwjz1JSIJo+fyN9ZI2kXBKZAQYG/LaDoujIbp1bloBH24d6cUFe6lQEwJhdszg3EyZ
         ua0l1OcGay3A4RJQ3NLShHKqGjdGOgx9wcQ4dEGwOc+Tci6kjEjy08aPuueOI0nc78lh
         vVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp4srjDuqdoOB9njwS/F3bcN4JoP3KOXWRPTKAezTOrAoBV6yIYfuMzK81+ijPskpDgegaHeQnPg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhN1xelKapOPmLDH4iN8eCzGBiRzIOZ1ftitShGWBwP2B/SWsZ
	YiezlJZCW0jlPCBvnhM6dvApYX9j3aKPpdxwiBTf8zWgXgZUXOK5Pm6M1gakwbWla0hL9AK9Ndb
	SYyHCRQ==
X-Google-Smtp-Source: AGHT+IF8hGVIlChbtIhMjhLw3aZZeNeEt0jbndtu/J7HYN5bXvwyE+kZ9qVypMx6ixiiCHlMmAe0pYoqYCs=
X-Received: from plhi5.prod.google.com ([2002:a17:903:2ec5:b0:24a:b588:eefd])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:ac3:b0:267:f121:6a88
 with SMTP id d9443c01a7336-28e9a6dc287mr175381245ad.42.1759795236620; Mon, 06
 Oct 2025 17:00:36 -0700 (PDT)
Date: Tue,  7 Oct 2025 00:00:07 +0000
In-Reply-To: <20251007000007.3724229-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007000007.3724229-7-jthies@google.com>
Subject: [PATCH 6/6] usb: typec: ucsi: pr_swap should check connector_status
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: jthies@google.com, dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Power role swaps initiated by the host system doesn't generate
connection status change notifications.

From UCSIv3.0 spec, section 6.5.10 Set Power Direction Role:

The execution of this command might require PPM to initiate a power
role swap. If the power role swap fails for any reason, the command
returns, and error and the power direction should remain unchanged.
Note that if the execution of the command resulted in a successful
power role swap, it should not result in a connector status change
notification.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 1a7d850b11ea..6e3797d7a144 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1526,20 +1526,40 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 	if (ret < 0)
 		goto out_unlock;
 
-	mutex_unlock(&con->lock);
+	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &con->status, sizeof(con->status));
+	if (ret < 0)
+		goto out_unlock;
 
-	if (!wait_for_completion_timeout(&con->complete,
-					 msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS)))
-		return -ETIMEDOUT;
+	cur_role = !!UCSI_CONSTAT(con, PWR_DIR);
 
-	mutex_lock(&con->lock);
+	/* Execution of SET_PDR should not result in connector status
+	 * notifications. However, some legacy implementations may still defer
+	 * the actual role swap and return immediately. Thus, check the
+	 * connector status in case it immediately succeeded or wait for a later
+	 * connector status change.
+	 */
+	if (cur_role != role) {
+		mutex_unlock(&con->lock);
+
+		if (!wait_for_completion_timeout(
+			    &con->complete,
+			    msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS)))
+			return -ETIMEDOUT;
+
+		mutex_lock(&con->lock);
+	}
 
 	/* Something has gone wrong while swapping the role */
 	if (UCSI_CONSTAT(con, PWR_OPMODE) != UCSI_CONSTAT_PWR_OPMODE_PD) {
 		ucsi_reset_connector(con, true);
 		ret = -EPROTO;
+		goto out_unlock;
 	}
 
+	/* Indicate successful power role swap */
+	typec_set_pwr_role(con->port, role);
+
 out_unlock:
 	mutex_unlock(&con->lock);
 
-- 
2.51.0.618.g983fd99d29-goog


