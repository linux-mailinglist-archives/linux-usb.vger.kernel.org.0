Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7F3497123
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236267AbiAWLRK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:10 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56000
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236232AbiAWLQz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:16:55 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 14D0E3F1D0
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936611;
        bh=XFI4x1c9o5rGbL4nhgosKocwg6qcvl4V6Q0rNOHSnCo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=LQWqauY3KDL03QMvpqAus/Aqq7gLXSHqz/AOWp7ERLF9ZVUx/fZSy9gFE7Sdktk6t
         TGs17Ytrl32faJXiLSZjNUgDke8KGwThwGCDTzVbUI0cKz/X0mNRkM7LOXUU8+8pNK
         x1ujPH9nBBUXR6Yd31piUyQajkKhBktIo/YutrXPM2T+ZsuP53IDnnrr0RG0yOVzjT
         Z619yPV3q3kEuUX9w7tAuBTk4+luGqMufeNPixRwM54gOszyYwOTKHwBy6oXaww/ZF
         I33UULuvYxZMOfkxy+G7/Q4kcuHB17ie9SGbLpIh/eEtcHuJnZ618NnExCZ8rxS3vz
         4Pquk1RUzxmNg==
Received: by mail-wm1-f71.google.com with SMTP id c16-20020a1c9a10000000b0034dd409329eso7864886wme.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFI4x1c9o5rGbL4nhgosKocwg6qcvl4V6Q0rNOHSnCo=;
        b=7aX/8mynG428pB2IQ9vSsxXAjpNIWo6sv7+5gXWoiVJHhQMjPL+SCmNjY7uMdIPzB6
         P0ZT2QqMDJoS2R5S6EnAWH9dp8hQlm4H8yTiHcrnkjgUYUz3Zg9++yPS58SelW0MC65X
         +yoKbgj5BWfuRJKNzjqBqvDHim9mhXx94lbfiJYt3oUtUVTvv7uYJ7PLe2IejIIF4mfp
         tMGYXPZY8XGeG99SpCXVxu6QR5R8nRzmWEmQIo/j8lB2AbFJBeD33h64S1/e88ApovET
         TL7lNNF3+kAH8rWGV7OmOSwkJimHM7HA7baO+82mHVKgXhAGITPgWBMX/ZTUHtRGSHqP
         9apA==
X-Gm-Message-State: AOAM531Ry7WX0hSiFe0GSD3pZIXM4wEu8w86Wk3uzXE1eYGwlUQqzOsP
        KKF86jBgLDESZsqTzCkucg3DF/8U7a2H1yOpvsAp4JqLGx0h+4uC6XMY8shL8mtsG7NM5evPbLV
        kz2OiHDSpEUy35HmSDsccVbAR14L/6CRef7ieJA==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr10537110wrm.522.1642936610793;
        Sun, 23 Jan 2022 03:16:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmyLPzIeaK4+b6dxFPm5eFCVZH0SGn36vHYUkppgtWL3y8Qu5THGeh6bGAfFL4+v1aOI+4pQ==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr10537102wrm.522.1642936610662;
        Sun, 23 Jan 2022 03:16:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] ARM: dts: exynos: add USB DWC3 supplies to Arndale
Date:   Sun, 23 Jan 2022 12:16:34 +0100
Message-Id: <20220123111644.25540-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250 Arndale
board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 5 +++++
 arch/arm/boot/dts/exynos5250.dtsi        | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 3583095fbb2a..e639cf6d9b64 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -632,3 +632,8 @@ i2c_ddc: i2c-10 {
 		#size-cells = <0>;
 	};
 };
+
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 139778928b93..a6f48f31f618 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -637,7 +637,7 @@ i2s2: i2s@12d70000 {
 			#sound-dai-cells = <1>;
 		};
 
-		usb_dwc3 {
+		usbdrd: usb3 {
 			compatible = "samsung,exynos5250-dwusb3";
 			clocks = <&clock CLK_USB3>;
 			clock-names = "usbdrd30";
-- 
2.32.0

