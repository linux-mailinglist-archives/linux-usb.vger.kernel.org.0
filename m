Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B92497131
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbiAWLRS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:18 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56050
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236276AbiAWLRA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:17:00 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 76AFF3FFDE
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936619;
        bh=y357G77gKMHlTfzCL6+HEz+/UzqdnZT/McDbXpsW3BM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KCEyfW1Y6dhBG3hW8vyZXJjvQbrD3oKyZFy9b8+yB+ZaGJP2IulJs6Kbm/d2a/7mX
         6TvYjaztkoBVaZIeZgSzq/PidKwSQgM6xK8evA5FNuF2WeNB4PJGfZic2aZyavpaTx
         kdTZBWgTVmosWR2b8JbQIMS7W8/S69VT9r0NOiCTb3fzmKKV+rP/zEIv/dLVB7D4iF
         45isw5dEVFJAl+JZExXPXd/9QilYsEN3DRJDctsW3bEDH/1NDqxENauFS8IzMcY8HY
         OAc82syuHmC4AH3GFVpCRKpts/CXBz+Do1wfHBrAmV7k89PxsrocODhUYABuLbkQqg
         14NEpFGZjlAZQ==
Received: by mail-wr1-f71.google.com with SMTP id p17-20020adfa211000000b001da28d1d0f2so68608wra.5
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y357G77gKMHlTfzCL6+HEz+/UzqdnZT/McDbXpsW3BM=;
        b=ZVqJuT6CINc9K4du0Ff3iPLCzHSPrM69A0sFhgQbz2p6VgBiSNhpyTtUvrEJFpD/UF
         Kb+1BBfDyKW2bmOhCY/aF9d39EqyGrYXrfCRJqJ/rdX9ie8VWtI3vuYIo4BXibyJmrg2
         lukrbfmdn7KZJRYdW74aGblFPGKuWtxwY1abXHSnJIK7Zk6aTaPorfsqhyDsfllQSYSk
         DRfCW/Q83nymICxVx7TtNFgleeCechuZ1dFjHoaYZXxJvD2LSCELGssIGB12a9MJLR+G
         mqoLndbN6T1aYQ8XXSJHVV6KLm+6Z07rBdTSlzqNpO3jY1ekC7zhdZj00sv/dz9L0D/8
         BFjQ==
X-Gm-Message-State: AOAM530xwuROTvSp0D26PvcgZ2B8P6C88ba49hKNTm6WUtMpM/MOWPla
        xEOmaqoEc0NMuZN5JDiRHsz62RQjvpL3bl/P+Wbjqhnj8XNjmJHB88hSShkZVMqxMCZIwy5YMA8
        5zVlk6bXik8IOMJuv4A0rzcRIOYcyUZu0q53FMA==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr10245501wrq.552.1642936617999;
        Sun, 23 Jan 2022 03:16:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwb59CpOjfY8CfprDukjo6039z0OQ3gfs8X3bsvt8yvFXtOAvk66eFpeVM1qtu1DqKws8uQug==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr10245485wrq.552.1642936617866;
        Sun, 23 Jan 2022 03:16:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pi
Date:   Sun, 23 Jan 2022 12:16:40 +0100
Message-Id: <20220123111644.25540-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5800
Chromebook Peach Pi board.  Due to lack of board schematics, use same
regulators as on Odroid XU board (using same MAX77802 PMIC).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 77013ee586f8..fd6f80a9c64e 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -1072,6 +1072,16 @@ &tmu_gpu {
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

