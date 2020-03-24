Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40027190AB5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgCXKV1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:21:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39997 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbgCXKUp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:20:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id u10so318647wro.7
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KI52fHKBvtrGusYvw7Q2/R12M0oemVtKyr237b8MTzI=;
        b=HbnGU3ksWwKYaDYIFzK8ksR/SQ3onXKHrRVcznA3yWXtOExele27744AtZtENYylUE
         XB1eTwxK+uxLIsY4lUWbaiQFNNbL2xjGxqweWiHpMwD6qFrA/XwODfR5ZjsV3Sd70fqE
         zPkCCO2+5RHfajUT4DgFF/NadGCpAjNYpAf23vdcIg8M2eno9t59EcAUZPlN3NDYk8eT
         aTi/rWEhk70sT3a5+s8r5Cex/PZLYUKxH7UGPR2eSmaW1FmVroEJZ19QA4XiPpoWNihM
         /34ymlhMzhxe9mNCIQHrM+DXhoXZDCGXvL1a6zIM+dAwN0ggnsDSBUKCCg+SV7w477h0
         5cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KI52fHKBvtrGusYvw7Q2/R12M0oemVtKyr237b8MTzI=;
        b=IWTDeiXnzYfJG3qXo371HAtTXkYrWF7Q6dSjipzsIpCWx0vyWtO5ELvLl0Sw0CCQ51
         90qWjZ+ZDYZSjJoEkfaSRvIE6nHANehn/3XQlS6K/GuGsJ3C8XiqCIYJ63/53gUhHRCv
         R0lhD8uCetMNxWnxcEk2nWTgc7hNyYwrxOHy8FV63gp/By8E5HDZYnvU0gQUxum60Hy1
         Go/7fQXK5aUPSKsyV0iQYa+K8sw5eEdmi8JQtdhz1Wnm6LwnQa6EDim15mFk7WhpaVE+
         IMzSQ45nkKQAvLp2i6sw41tEuHp/8iQv7M+eRM6fwZBDpd67IUiX/+FEIjUm6QtUltJx
         /ZnQ==
X-Gm-Message-State: ANhLgQ0mOAGd+kCMWwvJqv2dKvV1iSxns6xkZeK17+PyEloSHcAl41kH
        p4nGuLBF78qdokE+qRQQ2D+SOg==
X-Google-Smtp-Source: ADFU+vsBJo4JIByy6QwLcd6LZaesoFRObtwNkln++Z/CZwR3R4weo99RWZsyd59eYBY1tPqW5Q0MZA==
X-Received: by 2002:a05:6000:a:: with SMTP id h10mr8575345wrx.226.1585045243372;
        Tue, 24 Mar 2020 03:20:43 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:42 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] usb: dwc3: meson-g12a: get the reset as shared
Date:   Tue, 24 Mar 2020 11:20:21 +0100
Message-Id: <20200324102030.31000-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In order to support the Amlogic GXL/GXM SoCs, the reset line must
be handled as shared since also used by the PHYs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index f608ffb059b3..24a50dde685c 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -556,7 +556,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	priv->reset = devm_reset_control_get(dev, NULL);
+	priv->reset = devm_reset_control_get_shared(dev, NULL);
 	if (IS_ERR(priv->reset)) {
 		ret = PTR_ERR(priv->reset);
 		dev_err(dev, "failed to get device reset, err=%d\n", ret);
-- 
2.22.0

