Return-Path: <linux-usb+bounces-14895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAF973251
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 12:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CE82283EF1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 10:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734D3192B7F;
	Tue, 10 Sep 2024 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mht7MD5q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A9F18CBE6
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963347; cv=none; b=j/CJfwzmDdwAJijVlW6ykKAlPua7flNQCHHmRLNQpXxf6uONgZeg1EFhtRs11i9jjAXBQW5R3sR0DfuVArTWZ2ddVbtiQZT1tb/KZPr7IWBCdVsZ77lseoUr5JwyeX1oJpAKWkXUBASqbZcY9QKS+XA4TmTqw8JmjC4qodkiRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963347; c=relaxed/simple;
	bh=YD468ry7hUMKcsYIUjPS512IHcVzElRgJKXYwiiKeKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivL9AkOHhgTYRB+CgT5Ahs4jsPnD9DfuIgU62R0yHsfidffIvhgnQazpqf3aPypBSAUFgcuIxTWpQXgTbjIpoowxbBrljv7iRut19M32T53jjZ5jVRNH45q1jRwC2eMCfR6+YoC60TUFpI4U63goqErRIDTsoFItTpHpjKxOgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mht7MD5q; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c40942358eso302069a12.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963344; x=1726568144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeqFZCtBiSpM67nMSPMG8nnVJnw0zyk4FGk4Kpm9II8=;
        b=mht7MD5qTbfarmaxGqiPWclHho7qe65C0bg23SyU79/D6Bo7UU20XolBlFhEEyPHte
         Vph1uRhVXNlFNN5DI5BItL1jUkCg4IhBFPltk/7y20fbhzwK57ymTzBFYtjDu5AP1sP4
         GBRBCU+/OR1yng5Vi0XLPYNA2fu8OF8sc8Jng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963344; x=1726568144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeqFZCtBiSpM67nMSPMG8nnVJnw0zyk4FGk4Kpm9II8=;
        b=aeGwrnj6XblJosogLkLFU7DB9sNd68SDUYwPwURYbh3P/9R+dyNSDpfAkb6/irrPn9
         s7raS3rH3iYPH9SMT2qK/TICEQuGdzgLipZ1hYr1JXKf5dZNkjoAvJ96ixHEMZF4vky+
         lHuxMYG/IGuW/QkQHw6aIgpkhwJ+dvGOTCKjMVFR/GSBQXda+xzz8GH2OCEYtAfDWlAp
         VZwA6LLzjddVjQcYd/LKuQ+yE3v5bWqn3HpjgilEN0WZCNhMflzEkUabCiulRd4C8xI3
         eha6uAlOH4nLKlaijAgIuOhE30IuUIXFim1Bs4TNqm4yY9bPAK3NWGcNGbFNOMrzk9rd
         Gvsw==
X-Forwarded-Encrypted: i=1; AJvYcCVOXBLQKLX8a3rHf0w5zB1Doq4CSoPS7yQ2d/UXQuB5vEudx5nm8d75z8nio7yTlITwGdSjN3kOR20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhceYj0IjijLF+4yQI5/ySFTNCCjIHMoOPHrZPh5bKhFu24ULC
	rM7s8UX1CihVlBbQHzrUQ/PCPBKWAwnss0jYEGDFOx7ttTjSpsUhM6NSwd70
X-Google-Smtp-Source: AGHT+IFMu22ltsq0YAzHIeMzdsOV+gf/uOgHmWy5zGWIum1KNPXBI5poW2rPcZak4GbDH82Fy3I0TQ==
X-Received: by 2002:a05:6402:51cb:b0:5c2:7009:b223 with SMTP id 4fb4d7f45d1cf-5c4015ce1bemr2907203a12.1.1725963343031;
        Tue, 10 Sep 2024 03:15:43 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:42 -0700 (PDT)
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
Subject: [PATCH v6 7/8] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
Date: Tue, 10 Sep 2024 10:15:26 +0000
Message-ID: <20240910101527.603452-8-ukaszb@chromium.org>
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

From: Pavan Holla <pholla@chromium.org>

Load cros_ec_ucsi driver if the ChromeOS EC implements
UCSI Platform Policy Manager (PPM).

Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e2aae8918679..d5d63df7fcbd 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -108,6 +108,10 @@ static const struct mfd_cell cros_ec_keyboard_leds_cells[] = {
 	{ .name = "cros-keyboard-leds", },
 };
 
+static const struct mfd_cell cros_ec_ucsi_cells[] = {
+	{ .name = "cros_ec_ucsi", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -124,6 +128,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_rtc_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
 	},
+	{
+		.id		= EC_FEATURE_UCSI_PPM,
+		.mfd_cells	= cros_ec_ucsi_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
+	},
 	{
 		.id		= EC_FEATURE_USB_PD,
 		.mfd_cells	= cros_usbpd_charger_cells,
-- 
2.46.0.598.g6f2099f65c-goog


