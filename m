Return-Path: <linux-usb+bounces-14896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77970973254
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1151C20D7C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9829518EFC6;
	Tue, 10 Sep 2024 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ecnFquS4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046C18C00C
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963349; cv=none; b=uPtG4yqEYOokziLcwnm0Icba98E1MM+w3N6hTkombErGLNY1hCOqx/6CBxhG448fOgBA1FJQkDdTmHlOpIE46O025uM9eq3ccmEDTqqQw3V9i4Poux0NzJjDCfqTK+xoF6lRWYJEeeIP7DwphziyzC2VzFWF2zgvt3WQzfq9aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963349; c=relaxed/simple;
	bh=tSQJHbj2LLXTeUHGgMMfJ5BWAL/nLVLLEk1C+o3nHws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmDVnHvjO43bC8g+W02UlK43lf2gHiQHm9t+ZvGqp1E/1mWrEH0J+Cw4Rov7Khv8+uISxeE96NV/OEJxg04UND5H4Ih+wB41LBykRMglxdqBFD/I/z1enkqzzr9x1AQNrYjTXyq0jf5wmsRFZ3XFTrLqoXVK7RtRmluKAfX5DPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ecnFquS4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f753375394so35363531fa.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963346; x=1726568146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6E5yTq083nuSzrDbz7WTLj5zuoz2JOMDpjBBNEDmzQ=;
        b=ecnFquS40VhD8kc0IVHwo6o53BggtyuLUul619VLfNYwtZ4uD+8L2HCzibrCePknyP
         GNR6IaglX7tnfUy/OHXyKnd9OnSS0Mn6qaRnNvujUTyfanHunHvy5GcUlgp/L2yp/yAI
         I3/9lR3OmzJW9nfXvwgtr/Z32qWfkrQjLqlfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963346; x=1726568146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6E5yTq083nuSzrDbz7WTLj5zuoz2JOMDpjBBNEDmzQ=;
        b=SagM2UghsRraaU1UqLGSVwUsEqRUYbR1cSdPF/ykqEZXoiq0LhiRyf05IBFIfAn1zb
         EisA74OniJjvyVIwl1540UuWglIPoe+4VeaDyTloAyicvbIgnZfgPsObHEagxdGRwbhU
         a1vZfrRkHNmDagM0Dlmkc/RjHQnIx4DSdzSkkEWAIAIY3k2xiyJsSGdkWqGffxzBIeTp
         dJNVP/bocmnTtvUKH0QNhJZ8Lvzv/bkONq1sKQSCYtHnjrvIzdsu/p37ErJu+3bxgVl1
         Fi0vS60iqzHWdNpNVKIkoR8ZSO6qjkipgtE7Qnrr9YwzXazksAn2zOUPWHnf3As7j3mX
         jRyw==
X-Forwarded-Encrypted: i=1; AJvYcCUtrkLhEFg3QKrt4TKdP05iA7HtSaAceg5As3Ty8KQjaObiCjbdKLPQRxG/aIXArnmYnSu9uK4mzZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Cx2Cf3CUIi8VuSXI3oBVO67Dso7Or4c+XKcfgmJJUdqrcy3b
	Tk8PuQUHdsLhxJEpnleMPvW8/o3ppEOd6ToFqZ9iOlhi7tJ9UCLWlVdLbdBH
X-Google-Smtp-Source: AGHT+IHaKe6rWjU3xH9ycsM7F8BdbXD7rsT077HrnyCJDew/oIYr2SQOxzYhjp9tGDoTKY9rIz0ULg==
X-Received: by 2002:a2e:5109:0:b0:2f5:806:5cee with SMTP id 38308e7fff4ca-2f751ec7daamr64177571fa.11.1725963345513;
        Tue, 10 Sep 2024 03:15:45 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:43 -0700 (PDT)
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
Subject: [PATCH v6 8/8] mfd: cros_ec: Don't load charger with UCSI
Date: Tue, 10 Sep 2024 10:15:27 +0000
Message-ID: <20240910101527.603452-9-ukaszb@chromium.org>
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

When UCSI is enabled, don't load cros_usbpd_charger and cros_usbpd_logger
drivers. Charger functionality is provided by the UCSI driver already and
logging will need to be added.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index d5d63df7fcbd..bc083c7b21de 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -133,11 +133,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_ucsi_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
 	},
-	{
-		.id		= EC_FEATURE_USB_PD,
-		.mfd_cells	= cros_usbpd_charger_cells,
-		.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
-	},
 	{
 		.id		= EC_FEATURE_HANG_DETECT,
 		.mfd_cells	= cros_ec_wdt_cells,
@@ -261,6 +256,21 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * UCSI provides power supply information so we don't need to separately
+	 * load the cros_usbpd_charger driver.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    !cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
+		retval = mfd_add_hotplug_devices(ec->dev,
+						 cros_usbpd_charger_cells,
+						 ARRAY_SIZE(cros_usbpd_charger_cells));
+
+		if (retval)
+			dev_warn(ec->dev, "failed to add usbpd-charger: %d\n",
+				 retval);
+	}
+
 	/*
 	 * Lightbar is a special case. Newer devices support autodetection,
 	 * but older ones do not.
-- 
2.46.0.598.g6f2099f65c-goog


