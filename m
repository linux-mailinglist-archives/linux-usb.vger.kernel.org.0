Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5A097AF4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfHUNfX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:35:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40110 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfHUNfX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 09:35:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id c5so1967462wmb.5
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0t4aa0Nv5R8QXQNa/4oL6xU4iyivDyRHdq6FaUcWExA=;
        b=MugviQXwXIBfUUUyWP6IHkNeW27sYjjEDQvAu4Kqob99Oy6JHdWu/IdUGUPeGCGfzg
         WFe8n/8fdU5BNw46pZoFnqoh17GFEAWHNYYMB5ey8cmfJyChzzPTerVgUwihnNtzfhsy
         7oabi4p6oa09XswN7VE1sWLIwcfHKwBY3kxU36yVKXTtwqrYIsrKSf3YNHAAECz3jrKp
         HCVNvRt/TRFJX6uK9kuKspP8m1jpIkq5AuZO4qt/oyLDdcgtuYSMq3DbN3nQGmCJxEZC
         E1IwJhAeHhQ7mJ2e3Wx94g3emNxDJKAZ7M2SxHXeXgLDWGP3z7NPXU/m+tUvtVPkA/CB
         EU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0t4aa0Nv5R8QXQNa/4oL6xU4iyivDyRHdq6FaUcWExA=;
        b=VqDR2lUANpuqmmz/n06FH6mF2HUMlYTHule5RTNjH+UmFbPpf4V2yWbozTjlgoBlxD
         c7GQBubpDYF8YhVfonuhwkgk2Wa/PS9jJVqALKQVdV1ftL+V4lO/NnedBfUGIkdyu0wp
         aJR4InATk1VohkDScMP5p/0byqF6FbVcqd4DljN6W2rbn8C2+zeJ08CBZ+KWtZcC3XCm
         QMZgrkp0QdJXJOCoTmgtI76YaYJJyiuwLXrKIRC9HFIM2m2/om08dddVa1Kf/2/Uh8nw
         XPF2IQNmV1kIDUQtcH8N86infdDyHrbo48Q4Vkb8SDgtZPqQRRKMwNm1oI4aMfJ8oEtO
         njhw==
X-Gm-Message-State: APjAAAVfI5m903Dzcj2GYOXyx4ON7MG85FjR0beU+mD+nRHCnzer8KJw
        1araFLqIGcHKR/XCLnYAQ7EYsg==
X-Google-Smtp-Source: APXvYqxyYX1ZXPcqBjaYYNfe+ZtSEDIc5N6dN5EPLYh8OWSHD3tWa0RpsBLVponQYB8w7c0bqO089Q==
X-Received: by 2002:a1c:20c3:: with SMTP id g186mr33178wmg.15.1566394521017;
        Wed, 21 Aug 2019 06:35:21 -0700 (PDT)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id g2sm38941908wru.27.2019.08.21.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 06:35:20 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] usb: dwc3: meson-g12a: fix suspend resume regulator unbalanced disables
Date:   Wed, 21 Aug 2019 15:35:18 +0200
Message-Id: <20190821133518.9671-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When going in suspend, in Device mode, then resuming back leads
to the following:

unbalanced disables for USB_PWR_EN
WARNING: CPU: 0 PID: 163 at ../drivers/regulator/core.c:2590 _regulator_disable+0x104/0x180
Hardware name: Amlogic Meson G12A U200 Development Board (DT)
[...]
pc : _regulator_disable+0x104/0x180
lr : _regulator_disable+0x104/0x180
[...]
Call trace:
 _regulator_disable+0x104/0x180
 regulator_disable+0x40/0x78
 dwc3_meson_g12a_otg_mode_set+0x84/0xb0
 dwc3_meson_g12a_irq_thread+0x58/0xb8
 irq_thread_fn+0x28/0x80
 irq_thread+0x118/0x1b8
 kthread+0xf4/0x120
 ret_from_fork+0x10/0x18

This disables the regulator if enabled on suspend, and the reverse on
resume.

Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Reported-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index bca7e92a10e9..12dda04b004d 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -564,7 +564,13 @@ static int __maybe_unused dwc3_meson_g12a_runtime_resume(struct device *dev)
 static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
 {
 	struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
-	int i;
+	int i, ret;
+
+	if (priv->vbus && priv->otg_phy_mode == PHY_MODE_USB_HOST) {
+		ret = regulator_disable(priv->vbus);
+		if (ret)
+			return ret;
+	}
 
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		phy_power_off(priv->phys[i]);
@@ -599,6 +605,12 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 			return ret;
 	}
 
+       if (priv->vbus && priv->otg_phy_mode == PHY_MODE_USB_HOST) {
+               ret = regulator_enable(priv->vbus);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.22.0

