Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8D3497130
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236406AbiAWLRQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56074
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236269AbiAWLRA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:17:00 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 00F573FE02
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936619;
        bh=oFyg+gwb7XtvC7QbtaeH/MyDAvhazxDlD6i95VQK5XA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=WQNiU+DAyreiTzcHMrni6F+2Q6ISn5DOVbiNunCP1JgabOktHCYyZO3naNsPjbHA/
         w7hssdEFNXIgLteduREO6Sx8XPihtXJLi4kSIoq48tFK+54SR8eVynNDzARKSV9apG
         VKFhbTHapc6CLF0fq/026/AaqZA0nH1p5xxnQBcODBekc2vo6ExWUuDUr3jmbM21Iw
         N3PvZeVnnxTzfhkpudIje8AnL/bEbah7p7vRY0BRTcsYXuV890QVaQW2LFnF9ynMja
         0dBUIM/A1jIlPooxngHi+f+LVdCS5ymcj6ilJrBBc+Oau+ZhKIxRHpkfPHWRjCyLBs
         8voAvTJqrdvhg==
Received: by mail-wm1-f70.google.com with SMTP id a3-20020a05600c348300b0034a0dfc86aaso12951917wmq.6
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oFyg+gwb7XtvC7QbtaeH/MyDAvhazxDlD6i95VQK5XA=;
        b=kW4dmLDRHT4dtuYDCmChbqf7hjaUOqjbTD4/RgXVuNDRlwnupcEhIo0mvaoqrLKUpT
         2vlSLKU5s3XnlhBDpwg2Ds/ubbodjIzDSvmDpAPg7CjyUOflixtpJv0oJM05n1gX4z8u
         0oj2hq2Ks99o6B1eviwI5FupJB34Fjzt8s80nuLUVYKYPaW+iDv+yUFyO8PmwKxlQXgb
         korvvaLs8T4jcqQpi4R49nLApOONy6IWiPT4o281MP6Iq2gc/Bf2ajLMwABU0X/yIPyF
         J/TZqV3rHCS/sGxyK7Dfp0usfpS+PeeZF8t936XYem5eBXyF+teBjBY+qPKoV0YnFZdP
         5WaQ==
X-Gm-Message-State: AOAM532XPF95oI0f1XkKzrQfn45zppPQW4+GOMpWtOtxgcYOTufWHHa7
        9kisePR990+x+huhPTO5VO7k7AR0nflO9IXtrlM2WikYcBPLVxshskqIfyyb9H1fe4QqQDq+8+o
        A/ccsG4JB/FPLCu5S+OScTX5i44P8OvYXNeSaPw==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr7582897wmj.59.1642936616522;
        Sun, 23 Jan 2022 03:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl/THDIXXxYVsa2sg8+CimTWrhi2Zjb2hJxs9yZ1xXuWrxrnlJt2icnBT+iFNOebYeJ8eo7g==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr7582884wmj.59.1642936616338;
        Sun, 23 Jan 2022 03:16:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pit
Date:   Sun, 23 Jan 2022 12:16:39 +0100
Message-Id: <20220123111644.25540-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5420
Chromebook Peach Pit board.  Due to lack of board schematics, use same
regulators as on Odroid XU board (using same MAX77802 PMIC).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index e76fb104db19..6252089e4350 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -1090,6 +1090,16 @@ &tmu_gpu {
 	vtmu-supply = <&ldo10_reg>;
 };
 
+&usbdrd3_0 {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
+&usbdrd3_1 {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
+
 &usbdrd_dwc3_0 {
 	dr_mode = "host";
 };
-- 
2.32.0

