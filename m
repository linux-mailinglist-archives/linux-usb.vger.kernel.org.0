Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0721AC10D
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 14:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635436AbgDPMU4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 08:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635271AbgDPMTa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 08:19:30 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C059DC061A0C
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k1so4584600wrx.4
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5xKsDuTS/b8pkudrA3+ZTmFYrQeIvG+CZAqBEzqZ3Dc=;
        b=C/QuP+23ba+HpXCW7TkCLHiADtwgSsIdOR+oPFOZVaE0PbyjEC6LrUNjYKBAdOkoX0
         osqaqVpT6Q1dNd1mxwgcNZpfCZeN/DI8hxpCt8iFlSS9UVWYh4ULKdOPKfxGIulRpIS6
         lyrLkbOTX6dZqJb+FGIEPJrhtZu1Ao1F9WyVqkos65EytdXOpDGsXLZ5opzfLUaA7jXF
         iSj1bmTI4mBhMTTHEpqSSVnegz3DAeS+Z/mwDHPAvZf3xUooAjMGKFbcOaF+XvmYit4X
         +lb8e0nVCLjezjWX372sIlwu8mkYooDgi9zmxHRtr7TFWKbPRA1o77sqraWbzrm1aqxX
         qpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xKsDuTS/b8pkudrA3+ZTmFYrQeIvG+CZAqBEzqZ3Dc=;
        b=WNaulL07Reg3pJKfNd0JcKz6cv8eQUBVfJfgvhzg2x2NgLDaRHOJNiWUa05k4aUs+f
         j0+uLZS6Rma58YjlIyLzFV25xTxTWxjepexJBzY4sc0DctQkpY2cdUUemiv9MqJixLH/
         Q3xwYxmDvE38mfmSY6VW2qvUPxVzRPbw7UsCcBWSYpKrMocO5HkwreLOR2C2sLUvnMA8
         vKr0u8Xr9emyAK4E8aT1DLyybtpXMXNHNe/KXXZVUfM38r7nDAW1H6lXjCihADcmCGdX
         xam5xcYKJ6tx2xrNvwy6TJ/hrpQPufhAHTAJMgM0x54cJLxpFdOJMBP37orDi+pNWop1
         Y65w==
X-Gm-Message-State: AGi0Pubm6N/32BWgCFud6YMUvSAYbPeB1r0lzdVslahogtOrQPOgqMUm
        MpLBgZkouT+/0q+OYtvtidplEQ==
X-Google-Smtp-Source: APiQypIwF3U+8d9Ho+lglkTrjPR+KRKR42tOySGCFmPymXBHdmMt4a7vmvgcXC21weI5cT/rmadK9Q==
X-Received: by 2002:adf:f604:: with SMTP id t4mr26175984wrp.399.1587039566409;
        Thu, 16 Apr 2020 05:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id i13sm22035602wro.50.2020.04.16.05.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:19:25 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 7/8] doc: dt: bindings: usb: dwc3: remove amlogic compatible entries
Date:   Thu, 16 Apr 2020 14:19:09 +0200
Message-Id: <20200416121910.12723-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 9946ff9ba735..d03edf9d3935 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -15,8 +15,6 @@ Required properties:
 Exception for clocks:
   clocks are optional if the parent node (i.e. glue-layer) is compatible to
   one of the following:
-    "amlogic,meson-axg-dwc3"
-    "amlogic,meson-gxl-dwc3"
     "cavium,octeon-7130-usb-uctl"
     "qcom,dwc3"
     "samsung,exynos5250-dwusb3"
-- 
2.22.0

