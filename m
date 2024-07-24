Return-Path: <linux-usb+bounces-12393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1E93B7CF
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 22:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC1CC28666B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 20:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A1516DC04;
	Wed, 24 Jul 2024 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iwkJWOfl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D277F15
	for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721851941; cv=none; b=GHYO22aO83X3+xCwMzkPUJrv6p/r2sxHxh5WLULJX+P/yyavDRGQRjmPW2jysY3EcwuYQRehQbDgxKdS2xhLUbUR+iOizxgTUKjEMHT0LQ+pJF4wGMo/PaUj3Xn2jNRlCYsYDnlR3YpxfClTosa92aNqRcGwlhAzCVCzhEtEtWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721851941; c=relaxed/simple;
	bh=bmf032HXnibfYRvqK8uO991qHPAEkYRP9QaQxWdjE6Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZNUiam+KgqwBUWwJDju7HXIDtqpvZFQsbQGxNbQUAz5wSxS+VbITVj2Ott/vATo5HM+6miaFjoxmodZv2c4XXTs4sb1ShmJpjVWNcKdMn/qFD8gnkSflmXbOpnaIWhJANGuvhoNJj5AHAguOtmInemnxUewVOdMvlNUXqO8Kr44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iwkJWOfl; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-64b70c4a269so4667287b3.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721851939; x=1722456739; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PF43lGYCTnm27A+1Cps4Zd+/98Emil+YcRWp+KY5vlw=;
        b=iwkJWOfl+MpiQUT6KRMl/K37aJWxtqhU+wnotdO1cCeYSteDn+eRfjOz4zYwbhaURW
         ahQ8zwMqKvcTtPno3nv8SchiXclH0qAg+g0J1D0jiZcoe9Ku8as+Zxplcm8g+xDKG3eT
         xBgkB7YhP1NsRDtkJkHxlgOve0KNmyKEWeG+jV3re9ExyxGg81MxyZPNve8RKehtUjMQ
         oOd5uetFbjpjwg6zxQ3RQAs/93GMG3vqtWjpagQQeCf9uad5LmSjCdJxG1CM5FUtijjL
         MUQ5bOvluhvWoGEp/qQZH9BHaB1M4JSWr77rQvfSxzwLJwn0e777U44p9p+EOroDpH+k
         G0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721851939; x=1722456739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PF43lGYCTnm27A+1Cps4Zd+/98Emil+YcRWp+KY5vlw=;
        b=l4YPNluThCUPp9a/EkDmfL1qIbEYeZMvnWUbWd9cTG28xGiHHIwtdMKbPOjY/EXSQk
         2nydA7iDQjwqThORU/9VUZ5GGsZZNr5NdkmCEkQ/7BG2EPWa8z4kaXurKLJOq0qfK3cD
         bymhNAvAJM3NoHNkdruukF3CAsEkV4LWKxHxpfIpkQDuTzdGWp9/6hlsj+MMAL4zZWw6
         L5wUsW1VY5cxwFG+MUJFvR8TqISktE4ctHDpboj0pncVkr/jkzgkNH70/GBW6PuzGuey
         ZW2cNxXnkDddlLwJayzOCVuluta/cA8BdywqHLkplp+RjfRhYAcYgUEzv3Sy99hvIVfu
         cfzw==
X-Forwarded-Encrypted: i=1; AJvYcCXPIyAhnj+9go2vEBZWdErp9ualKqmX6QBvadJsHrZArdqDobV+U0MwJB68TSZcdWK1dODFMWnTVPH38VVmhx/JFbZVZoRnqOmR
X-Gm-Message-State: AOJu0Yys6iDK1tdAOt4dGKHh8rDRq2xl80K23j7iaBnbkXCqxaMHIUdb
	wkwvRH0LAPltjiECWoxclX8xHd1bV/c2Zc0MoHEhkUl5T+sAZRSeGpf7xnKVtlW8bBrzkBwyTUU
	gKA==
X-Google-Smtp-Source: AGHT+IFsAfZQjJbLvYIYnrxSi2i60E8uRxJlJU7Bh6l/GO2NbS00T5qm6h8/oZaj71q/D4vqR77Cxc9u6Yk=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a81:b80e:0:b0:62d:a29:53a0 with SMTP id
 00721157ae682-67515030582mr57267b3.7.1721851938956; Wed, 24 Jul 2024 13:12:18
 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:11:13 +0000
In-Reply-To: <20240724201116.2094059-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724201116.2094059-1-jthies@google.com>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240724201116.2094059-2-jthies@google.com>
Subject: [PATCH v2 1/4] usb: typec: ucsi: Add status to UCSI power supply driver
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add status to UCSI power supply driver properties based on the port's
connection and power direction states.

Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in V2:
- None.

 drivers/usb/typec/ucsi/psy.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index e623d80e177c..d0b52cee41d2 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -29,6 +29,7 @@ static enum power_supply_property ucsi_psy_props[] = {
 	POWER_SUPPLY_PROP_CURRENT_MAX,
 	POWER_SUPPLY_PROP_CURRENT_NOW,
 	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_STATUS,
 };
 
 static int ucsi_psy_get_scope(struct ucsi_connector *con,
@@ -51,6 +52,20 @@ static int ucsi_psy_get_scope(struct ucsi_connector *con,
 	return 0;
 }
 
+static int ucsi_psy_get_status(struct ucsi_connector *con,
+			       union power_supply_propval *val)
+{
+	val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
+		if ((con->status.flags & UCSI_CONSTAT_PWR_DIR) == TYPEC_SINK)
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+	}
+
+	return 0;
+}
+
 static int ucsi_psy_get_online(struct ucsi_connector *con,
 			       union power_supply_propval *val)
 {
@@ -249,6 +264,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
 		return ucsi_psy_get_current_now(con, val);
 	case POWER_SUPPLY_PROP_SCOPE:
 		return ucsi_psy_get_scope(con, val);
+	case POWER_SUPPLY_PROP_STATUS:
+		return ucsi_psy_get_status(con, val);
 	default:
 		return -EINVAL;
 	}
-- 
2.45.2.1089.g2a221341d9-goog


