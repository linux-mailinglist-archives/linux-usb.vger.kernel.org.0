Return-Path: <linux-usb+bounces-14584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE896A456
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDEE9286F0D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F52518BC2E;
	Tue,  3 Sep 2024 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WyeQftBq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BD918BC1D
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381044; cv=none; b=ebI9nTETTMh2g5gLG3LxzRakk5fpMeTYM4LdosD0w0XMdIId0SsX+6teVgj+eiLRLe/KnRpTEh+RNMAfl2xZzQOmOL13Y9tQgPuhc2bWVAtmLvoDgikG+rhR1C0E6GTeXYglJT/lZ4RrXwaRF1K/Q5S/V5CWmh8H1o8u8o0OVME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381044; c=relaxed/simple;
	bh=NcRnI43j/32UrWwYS5V8VP4i4dLvb1AxJbQbRzMkl6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHtvHTGRX5bVXWR7vx5J+XZPm22Az7aaO+QN+XS6fD8VcEpZPGEW4FQsx3LpPPcOv/+u0hyBsMj7b4N8xTq5CNmdHTGd8y8prgY02M1K9xjnvRF1Z8ex2IoBn+uYW8n+xeu0Jz/90WB9/oXFSbKa+wQY0DXzlGsgEwlhcIa/Zrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WyeQftBq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so5195234a12.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381042; x=1725985842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch/nQk7xshZBBT85KVmRAI7T7THUEBQ92ebPsEv0TVI=;
        b=WyeQftBqWryvhch54aBzoZZygIYZn1xa+ueEP4ZjlbSAUGVs5pxJeEBxJDWlK6mllM
         vfR261xXsp1okmQKauaemKpLt87D55N5YqO5LEq1Y80w6SQ2OBKDdiDhamZxvvNO/OD+
         84tY6i5cO21HXFu19dmu1gDmF3By5OmuVs8XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381042; x=1725985842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch/nQk7xshZBBT85KVmRAI7T7THUEBQ92ebPsEv0TVI=;
        b=k7OZPumWc6FXRxzr4BbBbhQcAOZH+bzYDv11fba5HmeppLkiqQ+uiQMGej6Y3Kh3Wz
         8rp1lXQPDs8Ctq/QyIlaMsyn8A089dZIu+cNFRHMif74vKrnhCBQ/UNeRRah5COdR2yc
         LX5hj6tLQSeL3YfsipJQTqrF8TgxqfXnfQ7+6O4lxwo074iWhylBwIl4dZ0bPwDmw7qa
         dRu10QQbl+Z1I4ctajLI0KX+Dj+2T0qTjDdTlcngvXjru/mpFu49/FLbusc0rQm5vhdL
         JgYNlNCf+VCltbXMvh3wPB75qO6fG0EBIAHVFz+9C9vIZhSfRPnUyvVm+CGy3UuSTpGQ
         +ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCVxR4QfYbZOBP604FU4YUK+ipKU0EzqoBBzua7GopXNglUBcZHwfccKyPWz9phNW1KTedzswOap+dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgygBvgmEDU6CvcaIHgkso9IhT9fLZovGEfFCDz6DzdDjwMuy
	hwMiMgifEFiKg9Iec58Pa20QFpGRNyfJJf2vmSi6IeV24KMsvL1hmDRfDHVj
X-Google-Smtp-Source: AGHT+IHPa9Qvf/PS48YGwqnSZBUWQ/hXpFMaONG1d+Jtps88oT2k5Dw5JhWbGgaxI5p+BF5VuNzo6g==
X-Received: by 2002:a17:907:9813:b0:a6f:593f:d336 with SMTP id a640c23a62f3a-a897f77ea6amr1213890066b.11.1725381041378;
        Tue, 03 Sep 2024 09:30:41 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:40 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 4/8] usb: typec: cros_ec_ucsi: Use complete instead of resume
Date: Tue,  3 Sep 2024 16:30:29 +0000
Message-ID: <20240903163033.3170815-5-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On platforms using cros_ec_lpc, resume is split into .resume_early and
.complete. To avoid missing EC events, use .complete to schedule work
when resuming.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 6b9dc05a4960..4a3369c649bf 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -246,15 +246,18 @@ static int __maybe_unused cros_ucsi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cros_ucsi_resume(struct device *dev)
+static void __maybe_unused cros_ucsi_complete(struct device *dev)
 {
 	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
-
-	return ucsi_resume(udata->ucsi);
+	ucsi_resume(udata->ucsi);
 }
 
-static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
-			 cros_ucsi_resume);
+static const struct dev_pm_ops cros_ucsi_pm_ops = {
+#ifdef CONFIG_PM_SLEEP
+	.suspend = cros_ucsi_suspend,
+	.complete = cros_ucsi_complete,
+#endif
+};
 
 static const struct platform_device_id cros_ucsi_id[] = {
 	{ KBUILD_MODNAME, 0 },
-- 
2.46.0.469.g59c65b2a67-goog


