Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9961A49712D
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbiAWLRO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:17:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56024
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236243AbiAWLQ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:16:57 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D313E3F1D8
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936615;
        bh=QYyBjWAtA9OxXQVLH0xTxaZYjqCQLqUUnu7YMm/h3UM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=mz9a/NY9CVID5y9aJrsGA511VpWjcdNvXy1PEw9IRup6SXMuQpKSlv4qdyAl4SkiL
         T0Ucqooz8hK+x7h8OyLwBy7J1Bg6HM8cNAZH8COlaREgn9RykB4oOwjsQ31NPEqAbp
         JyikkxL/BKIdor/wPpz5WBJ5Tdk8o2RQDP1n73vQsKJTyPWoiw25OzCPfd0q/U8GJP
         Zm4fM6Pec4PdnTThrYHRbAsmWNwWisfHEEGn1accj6T7R2f1yLAxdJx0QdnZUq29nN
         ksty8q4KU85vCNhSJQ5RaIl3eUwO8RgjZ4sWxD4QDC09B0FMR7gPXsakETzEzdqtnE
         4Vmr0pCvaSxZw==
Received: by mail-wm1-f71.google.com with SMTP id z2-20020a05600c220200b0034d2eb95f27so9002129wml.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QYyBjWAtA9OxXQVLH0xTxaZYjqCQLqUUnu7YMm/h3UM=;
        b=gnqxWffKGMAxvZ5xlzDqwBZqDK4FaJHQ0Y/C9OKj0qAx/kyKNbWgYfaGrnd98qpU0V
         iA3vjzElvjZz3I8JULZUrkjUl54onSSHQSWP0c6Ljl1ykWuVrpJgWBC//iFAWqWE+7V3
         7cwu9jlVD7HMwfsDU84+XlcoLqIGoEXgDwP7hVEFkX4z1O1F58/aKXa6fRDyq+yAvjhs
         VvqJymEYYoQ7plmC/wjTg313llJprurJkUoDmpMUbYusqe9oaX7YXlY+L3TtKw1Mvgzm
         DAgQlpStb8BPOcjeonGYPaCzu9SaQpbXD2IW7gcc772y+sTt7Pgq0ODpTegoHYCZU6pm
         wcQg==
X-Gm-Message-State: AOAM532BQjE6Omm7CywTK3cZqKlno0m+XTEXdiOKQMvWQYNTR46tSHuP
        lEWUj47TJe/DTnpr2vhM/Y8jI1/6F5x3acv8n9S5uOQ+Xl8OpMG4Avg7dFo+NAtkOqyAnm852To
        xNQd2oPpytdQICOFfIi4fHvrwxiE1F42LeJtgQA==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr7650483wmj.68.1642936611893;
        Sun, 23 Jan 2022 03:16:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBpH9pPJ+LM0El76Z0koYfHiM9syIgi7ocm+JAQM3ZbsaChUMb8L30RzWfa7hIIqOsAqEd9w==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr7650468wmj.68.1642936611756;
        Sun, 23 Jan 2022 03:16:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] ARM: dts: exynos: add USB DWC3 supplies to SMDK5250
Date:   Sun, 23 Jan 2022 12:16:35 +0100
Message-Id: <20220123111644.25540-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5250
SMDK5250 board.  Due to lack of board schematics, use same regulators as
on Arndale board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 39bbe18145cf..53670383d607 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -417,3 +417,8 @@ max77686_irq: max77686-irq {
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	vdd10-supply = <&ldo15_reg>;
+	vdd33-supply = <&ldo12_reg>;
+};
-- 
2.32.0

