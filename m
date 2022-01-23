Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC09497137
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbiAWLRN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:13 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38450
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236240AbiAWLQ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:16:56 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9B2893F1B7
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936615;
        bh=7G+hY+R5nLZKUZJkJX/xGI67gHlSdcGiauOov4lnBec=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GpGZDwiYDuvPk/Yz5SkfpTn2SNGLe+eB3eBz4Duwm1oJ/mrBHrMyNLH5o4aa+CBiq
         9SV5Owyw9hQI/Z1X5ZwPOTz/xaGcEzWG95R6dXNQ7mUjYDOWhF/E4E78eFaelhi9v+
         ug8y9Fb4htf2Zj6R1eBZZWT/8LqhGvGX93lpN4ZKY8TTsdgHXvppZjVxXonEcyoeHM
         F3qrcaZGFVzJk2RGP0lOaqoeM8ePrZCv7mLCBSLynqa4Ip5HPuNNPxgIQO45FvJMez
         AjxANekeLtKAc6FZ9vnePGKTY3QbZ8UXNzXCTcquFqM0mgdt364DRhGO3316L4s0h/
         CJxjvaAKUt1zw==
Received: by mail-wm1-f70.google.com with SMTP id j18-20020a05600c1c1200b0034aeea95dacso12913828wms.8
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7G+hY+R5nLZKUZJkJX/xGI67gHlSdcGiauOov4lnBec=;
        b=aRc0N1L5tfhOrl38vv3trtAb+35jCTNcw3+DbLsZpBeSoIqqHGQWfnNoby1pnzJxii
         kmvqDR2ysxHbTIfN46iBsSaVEYJYszCljv/dTkPhC61rQQr56nAKLQ7eJmncAb58gq4n
         sGenZ46iemm2CXuMfP4bLiZ/Xkdog7Wt8L/kbJ7WATvZdE7/5HYrCMF8z0nXE0w+CDyk
         3SXNg8+EkqHtIlqtji2/lqfvODZXOX9uHkXD0RWJ3XPlfSwq2TdBfExTGnHTSzCICOpI
         YTb/u9LnUv3cTZz16NJTFn+VcfYziIUr9SCD4ZoQhAlEcA2o4qF7nCxg2tvHn8Ql8FyP
         Hbag==
X-Gm-Message-State: AOAM532wJ2AXgxRStWdggtKQ03rlqlIVM0MMUwbDy7POCYluWclwPrae
        iJ+7lKh1d9mwGjFcKXdFVMgJkLPgKxiwm2/tDjZwufsXHFdkFox4e8sSEUDQ2JpPbCqOsTQjCZs
        2dwrRqm/DY+JIUq5g05WiSsq5q+C+Ug7W6PIajw==
X-Received: by 2002:a05:600c:3b8e:: with SMTP id n14mr7635821wms.136.1642936615423;
        Sun, 23 Jan 2022 03:16:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmZiv76Qfw8F68YMkxoE3Zz0Ow5IhFbzrvbpiFnZTw5RuvqW1IyxGcoXhMn0pmZj+he53E6g==
X-Received: by 2002:a05:600c:3b8e:: with SMTP id n14mr7635808wms.136.1642936615301;
        Sun, 23 Jan 2022 03:16:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] ARM: dts: exynos: add USB DWC3 supplies to ArndaleOcta
Date:   Sun, 23 Jan 2022 12:16:38 +0100
Message-Id: <20220123111644.25540-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5420
ArndaleOcta board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index dfc7f14f5772..ffdf0e247c15 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -825,3 +825,13 @@ &rtc {
 &usbdrd_dwc3_1 {
 	dr_mode = "host";
 };
+
+&usbdrd3_0 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
+
+&usbdrd3_1 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
-- 
2.32.0

