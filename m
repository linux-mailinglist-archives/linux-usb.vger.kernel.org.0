Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F91194011
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgCZNpY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50407 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbgCZNpU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id d198so6556953wmd.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E2Nej3PvIghRUOKzyBo4bIwNfTfqhNtg3/diQuBc7As=;
        b=EBSK+E9NDW6/g5NS8KEfKOXbeCyuAzwOTDTO1vQwh0l3zrv8Q2tyK/LrydSklc4JX+
         pqsTOR4naUDFKVaVpM1TqekGxLf2R03Yg30rMeFkiES78oulP5qC5aCOZ66Ku27ITvYq
         OVevZUCL3r8VcaWFHv9qIPfi5YBlHdnrk2HJiQGdHpq1h4T7m3VLpePVbjr5hM6yCWu6
         +w1U1yZCLQJt16R2im4++WMu1WiU7m2qkpA0eOum52mdnKyyjQqUWYrMxmxu3Yrs5dxt
         lxOFJOZmCbfFlS3sErPEPe/+Lj5XimXNaignHRINQQKQ5JzcTo6a4XJeC85hfOe0nsQ6
         E6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E2Nej3PvIghRUOKzyBo4bIwNfTfqhNtg3/diQuBc7As=;
        b=BvK+T6vDZwC5PmJdoEbPPJKmreOGz2Ha7iMz80leX9gVySjbkU7ZIXRLCy6zrNxj1N
         AwbSmlIiUiyynWy/bfNmpuQr0sKWrhQwGcbUsdZsg1BODrO225iz0Yn4POqPaZiH5U5P
         0QgdBEDuLqtK05sInrKkLRSIMK5NN9IKi8y/u7YXHiUIRMvnkhWZSz5+vTIzX2vu8BKG
         nkbXAFxFxkgNeJs8dghINSdR496Gh1VgNsArXvFdqEuG8+UxMZae4eAelmHh3MaWdETI
         hXnDuuEuBSGvYNyin+uStIjF78mRo/7Tlw1BDfqTeXtsWzLCQBetGdxeykh9lbjgPL6f
         oInA==
X-Gm-Message-State: ANhLgQ23iovUQUx/cXaAZwp2LokWQ3pB2pNcqHaSYUrHYdL0G/sBmlxt
        AJ3Upgkt2bfFfe0hi8vM7a2AKIFTZJBR8w==
X-Google-Smtp-Source: ADFU+vvlZVniCdthaZ5Ps9LD3FGyRxckA9MDLoj9Ko1f8T/NE7VRmePqEkNAlyEGnn9joVshcbaFYQ==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr43647wmj.170.1585230317388;
        Thu, 26 Mar 2020 06:45:17 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:16 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/14] usb: dwc3: meson-g12a: check return of dwc3_meson_g12a_usb_init
Date:   Thu, 26 Mar 2020 14:44:57 +0100
Message-Id: <20200326134507.4808-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dwc3_meson_g12a_usb_init function can return an error, check it.

Fixes: e3e716e6b889 ("usb: dwc3: Add Amlogic A1 DWC3 glue")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 41bcbd31fe4e..69381c42a6d3 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -588,7 +588,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	/* Get dr_mode */
 	priv->otg_mode = usb_get_dr_mode(dev);
 
-	dwc3_meson_g12a_usb_init(priv);
+	ret = dwc3_meson_g12a_usb_init(priv);
+	if (ret)
+		goto err_disable_clks;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
-- 
2.22.0

