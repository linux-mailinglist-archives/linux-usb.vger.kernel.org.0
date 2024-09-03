Return-Path: <linux-usb+bounces-14588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1896A45A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68D71F22425
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810218BB98;
	Tue,  3 Sep 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nIPr/qqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2818BBB0
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381049; cv=none; b=hWbBTD8Ab2qf0FwVh2OR+xfctDHBK2p1wYZ02mbmlbMcDlYwu73jtpE6xhKrwBsYboa5vcPOuuy0kmi2YEz4YSbcl7VCsMwNVhXOmqCdYwYwzO+10in/4yyXApbfdQ9xQuPJh872RDy0BK6o3L9c2r4DIRBra7Mdx19GLSeYPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381049; c=relaxed/simple;
	bh=+SIfP7UISjPZqy3MROtCCerdpwFBvqDPS8zBDXoCQ6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SI1eetJKL532QFK1Lyg6qCZ20rs0hV1HoeIJ3IjDzwPSpLjH1ZRyzuzzpQ7pn25CnlA3Wsd/sWeQ+OFhx5y3cV6YAvWljmwTSuk2D3DlxwVdVIa9Qj3ZTgZJcxdNjp0nLxt5SpjiVpvA4Xct0rbI9+ft1PxI96996FaG9+leaws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nIPr/qqK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86acbaddb4so661388766b.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381046; x=1725985846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abnaghlK+pw02PpQ8vIksrIw0Rsf4nvWXUu7Ofg0f3k=;
        b=nIPr/qqKDQWv8JYtRlpHJsa24FL1z7figrDB2cy2mm5nDRQ0lpkt8j1U33NNgadMY7
         0xOD44BHcz3QW+LnMNy5I6ETKAPhmZqnVkpWAtf0yxIkwDYEK8xUxGBj6m63x8GxB+TD
         FJndg1fl8/2WCLsVmgi3Ekvug0QNx3Nwrpsns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381046; x=1725985846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abnaghlK+pw02PpQ8vIksrIw0Rsf4nvWXUu7Ofg0f3k=;
        b=QOXxoeaEqDU22SRtCmEB69WMsxUV5zPJdvlBJVKoB8jmY51Xp8wDsAnOGVj5YeE8OL
         vSXELNjveWDTdjgrbicDM6P2YZysfVkFggI7peNHA0i2F8CLmbf+VKOfxGhJtbkLcM02
         nw7urEgGzuHQ2VGHcTnp6wIN5oSRDm8hXU9fPL8PNZr7Jei0ELdDz/E1Y1jhUTVa7eao
         fKE8vpvrZXjgGHLgk3XSlswmCvvs5kugsgqH0y4Yu/AjkGNcgseFlO/BEmozONA49wZY
         FGrQJgE9rhdx9vpydpgdmiR0oGUu5tLQ1gg26gRLka7viS3fX0kgXcV1sVGv1NDvuqqX
         seDA==
X-Forwarded-Encrypted: i=1; AJvYcCXcH2RgR4zChKQQn9fAyJAjZjTC515MYrrAuhGpq8V5OjoE5iEOaQ7Ood7lSONXvsGbjQG6Ojo4W4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYurSWcaB/pRM2isQfwBqv8AfligC6Lxnvt90Gc1IvTuGqO1n
	C13x4LFhC4VLPoUoB+fJmsvSQLlmH6PEWeezm8kOSTm+vUOUmq3uft2bnld2
X-Google-Smtp-Source: AGHT+IGyA2BXvcyBi9Eat2Zpbm/KcDxn+TOMa7RYJ393x/0cWxbrH8YSipKSJQZfPaSIpsa1AvtybA==
X-Received: by 2002:a17:907:1c0a:b0:a7a:ab8a:380 with SMTP id a640c23a62f3a-a897fad872amr1435845166b.69.1725381045331;
        Tue, 03 Sep 2024 09:30:45 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
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
Subject: [PATCH v5 8/8] mfd: cros_ec: Don't load charger with UCSI
Date: Tue,  3 Sep 2024 16:30:33 +0000
Message-ID: <20240903163033.3170815-9-ukaszb@chromium.org>
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

When UCSI is enabled, don't load cros_usbpd_charger and cros_usbpd_logger
drivers. Charger functionality is provided by the UCSI driver already and
logging will need to be added.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
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
2.46.0.469.g59c65b2a67-goog


