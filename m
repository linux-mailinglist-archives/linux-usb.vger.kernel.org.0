Return-Path: <linux-usb+bounces-14892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CF97324E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E421F26F6D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AFD191F70;
	Tue, 10 Sep 2024 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ValYS4BZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C881191F6D
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963343; cv=none; b=Y+06XQkC5inmoPZaUYGH4Dq2t1t0Tr2LhzmGXlWtcaxovXPbDS6SNkuXg0kgtXHbltjB7AVJlvgqv020JtdnypGwA9pJrXEC7DyFPu46j/v+r5xZzENSC6T5IzAOmJVe4IApgR7pw80LKkJ2vEJBYGOcXDQdPhzHLo7Rci9aBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963343; c=relaxed/simple;
	bh=lKcBF8gwOmt/ffGeVilM/VC//BkP07Qg7KfFhbt/ATM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBiRzvwAHH4eXhsepOVD2oUME2XLnR7/skFgM25fUbyaaxJSqw9UUcQONmZLW8mxyTJBAcG1bjUr6usLGamBoeFQRz7Cne0x6YE83PVD3KCTVWHyJZTGHWFTdWcD38rILdXK43vNLySEUocH79ZHB5xXlEVRC9i9MnkkB/C/G2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ValYS4BZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365392cfafso5087438e87.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963340; x=1726568140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8X/ITKpB8AA7PfOztOSGy2OE3K0m/AlkMzm5sCSbuU=;
        b=ValYS4BZQ2MGdLi9rsHxGIeSlkKt+H9B6MbtdjZrgVBbShoU0edz0hQ89hBZGrFGmN
         +rKbT2G9drPGNfi54/vyJT4HHrg0kTV2+TGGuJBdouR/kDWUmvKW8CtC/OBzyle3zpIZ
         A86eh2hPJ7pZsLHLw4IAbvmTDIN6dTQ8jdAxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963340; x=1726568140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8X/ITKpB8AA7PfOztOSGy2OE3K0m/AlkMzm5sCSbuU=;
        b=dEYQWnjPnM9jd1gyOdbyUJK0D06zGTXlRtbzZMOmnaP32VC8Tu/qwv0bxXBmnzqS+r
         KCyKHTQOu/TwE8L8S3dkQGPQO2MwpH9Z4R25y5QW2hov+RMbyt39vxTvoN6AyXkYkllI
         Z3eMa6IrGx2b9kLOu/tvYvP8yKHP1GnNtnfA0PaMwb4/1miIzY25dItLu3XL8f8wbg5F
         1Yduv/07E3mVb6yDq/bdAQdlHNyYrn1TWq4i7mcYc/vHHxr5PTeUXiaJsw+JeLbMCZDV
         6AjfaWP+nutVEeA90VOnsAJVTFHJ0RQ3088RcKiNuHT8JO6QkCOkPQc1a4Un82nrCJuv
         JYIA==
X-Forwarded-Encrypted: i=1; AJvYcCWsBrEQUGWYECODgPGNpXvABOk2k41t4jXTisGmIPz+g9K82ECmceOZ+VvaVtODjqfFyvUV4VgmWvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/ZlsVilE5UEOud4vbCH2xunPOr5do1rywLTN2M4fs9mrYoLN
	t9jHbU6WX3+lDcMcj6xxAxHglyUoTZgAMyaedVQyjen+vxxXOHc0ikLSWAPo
X-Google-Smtp-Source: AGHT+IEmWkkPyz1oxTksKWySx9B5Qd1qQQdKYCW6OpqyNaZ/PupJucqIzyjiUeUuE62f//tDSeOB4w==
X-Received: by 2002:a05:6512:695:b0:52e:97b3:42a1 with SMTP id 2adb3069b0e04-536587b2c9emr7792710e87.24.1725963340124;
        Tue, 10 Sep 2024 03:15:40 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:39 -0700 (PDT)
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
Subject: [PATCH v6 4/8] usb: typec: cros_ec_ucsi: Use complete instead of resume
Date: Tue, 10 Sep 2024 10:15:23 +0000
Message-ID: <20240910101527.603452-5-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On platforms using cros_ec_lpc, resume is split into .resume_early and
.complete. To avoid missing EC events, use .complete to schedule work
when resuming.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 20e608097fc6..422b3b14028c 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -241,15 +241,18 @@ static int __maybe_unused cros_ucsi_suspend(struct device *dev)
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
2.46.0.598.g6f2099f65c-goog


