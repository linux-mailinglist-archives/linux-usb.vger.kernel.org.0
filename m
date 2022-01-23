Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E95C49712F
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbiAWLRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56150
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236305AbiAWLRD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:17:03 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 493313FFE9
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936620;
        bh=66G1PF8Q0lr5LRIbEYZW0Tv4PnJMOlbJQ4z7W8Ayj8M=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KXT4tz7eF8PKj+bhl/hXQJUTGu00Iqkag+J2XnbqvjV1PyHAXL/IScVjuFCrOTIzj
         3ach7cVA+yhMIpcVZ+ZeukEe9iFeJE+MPsnVkm/NAA6qtk4Vvf5NkrBuTHwrWoZPzx
         aX0UxESzIdM/qiMsr9gLP8/9d7WiF/RSqOovsHXjh5KTKR5OW+pKyuxRup8aPBQAjI
         FFqrUrtwVqJAeXmfi9obc2RNlYoMIpZ0lQonOHL39jGj4jGSvRmYylplNAYQx350f/
         U/LailLxmGhKttsmzDzxcOykvs+ukaQoaoLqefJZm0e4YfnPx5zoUEMqBe7Mpvayfg
         PWG9ag8erZpsg==
Received: by mail-wm1-f72.google.com with SMTP id d140-20020a1c1d92000000b0034edefd55caso2639589wmd.4
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66G1PF8Q0lr5LRIbEYZW0Tv4PnJMOlbJQ4z7W8Ayj8M=;
        b=tqwO1m9ilkm8HizzXHOjoPLi+GW66yhxk+LZOg8ITzlX87Q6mEYJA/MqMgY9xKjq5X
         yZbo8SDW+Ln+MWsUBUi3HQQhHoMP7ho9tKP3JFsLGGR885w8DbCQsKnWUfspXwsUHS1T
         53r6jdq5HVnJdKSXx0fwzLi9ONwQGf1+cHPkIHUFdfU+DjIUcHhEraxY/vHAa2wtNUrK
         5Gb4PQKntE/rzTPq4M57euXyqLc+tIqZSdhE8dzJJPiqJHEVS392v3zDT6zzgoCqeC3w
         sw6OKn5hGYuVHsC5SPGSIHGUM8plKSXpVZhhBBsoOd9S2VUemMXbgOOQnQNjcGvuFBs7
         xAgg==
X-Gm-Message-State: AOAM530Da7pjqkb9418fMbPOsXGKW+1BXTvBNWE9zBlCVYjbBOgpRSKv
        D/VTTxoV8ZNu2UYoNBeYpbtxOpchfLmMunjx5ldiKlIhWoHyXnVry2wtPdF08haR9ckKcQmYPn1
        2jPvxYvRdM1K/HP4uURVO9FCj2A9PmCtZtOO3bA==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr7689625wmk.191.1642936619325;
        Sun, 23 Jan 2022 03:16:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEem2eKrggZGWq3zOh3tVCEin/9AMSkAxLad8GyWyumd6SS0jXIESrFaTiCvb+wPkBmGYPsw==
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr7689615wmk.191.1642936619200;
        Sun, 23 Jan 2022 03:16:59 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] ARM: dts: exynos: add USB DWC3 supplies to SMDK5420
Date:   Sun, 23 Jan 2022 12:16:41 +0100
Message-Id: <20220123111644.25540-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5420
SMDK5420 board.  Due to lack of board schematics, use same
regulators as on ArndaleOcta board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index a4f0e3ffedbd..69ce3e430863 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -407,6 +407,16 @@ &rtc {
 	clock-names = "rtc", "rtc_src";
 };
 
+&usbdrd3_0 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
+
+&usbdrd3_1 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
+
 &usbdrd_phy0 {
 	vbus-supply = <&usb300_vbus_reg>;
 };
-- 
2.32.0

