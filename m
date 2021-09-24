Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD2F4175C0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 15:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346231AbhIXNcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 09:32:17 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59634
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344365AbhIXNcO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 09:32:14 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3CBD640292
        for <linux-usb@vger.kernel.org>; Fri, 24 Sep 2021 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490240;
        bh=3xD6qAEhtRsJqFfznLwkKRQHrDkBb3UaWxl2/slC6j4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=nSjm3xZyhfahJPG/dd2BJOA02+LCoFxYoguBs6CybtMYbjB18D0DM1KPv5jTLqY6X
         nlIYIqRHgJy0L2EuIYJBhbSmCdrSEPWC8yJ/9FBt4CSurIYr66iqE2ky6vcDn1hlWU
         dN/Ng9JdxDbazvJTXTJcyi+IbVK0gMqN2vOx5C7QIrxadz8Zv6v+ym8xtkmTph3fQ7
         yrGW20s5ZFT/wLoikFsCKO21fuU0JaiqEaVADR1b5D/7kijNpavDfURf4af/uc2EJN
         vFX3G4DsRxx92eYfnzBOSu+LAndjijk0OZbK/ulBe/rJagxD97Cc/FzyXB863N443R
         LzrdsmSDinvSw==
Received: by mail-wr1-f70.google.com with SMTP id v15-20020adff68f000000b0015df51efa18so8053860wrp.16
        for <linux-usb@vger.kernel.org>; Fri, 24 Sep 2021 06:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xD6qAEhtRsJqFfznLwkKRQHrDkBb3UaWxl2/slC6j4=;
        b=YG6koQH+9Q3sTCS6zbUxXavWbMegsCCRxh4dHa2tjVdO1vC8lAuAqNkjOYKpjGebp4
         NlqIOK57LSQxHK9Z9Sj0X3nJCXwY58bdSM3+KBbpnsWfaUxtyKxsDv+0HIFvvZiAwy82
         nAPfTCPhQgIPhxbtTwgvibrm9K2owZYGI/0bugXN63oivJ8KKOYkTL3wbo11BSnRHiaB
         2NilqeukPA8P62mIWzXUoA6EyI0hmfEtrAhIU2VDIDbzy06xqTClcRmxbSTGfI1Ju29n
         USQzCFtQWujb7eP3k36AtGPWinEF9FgznQzA+4iPnYdbVw8pTpUTP1OEzdhFw17SxqLU
         x7zA==
X-Gm-Message-State: AOAM531xIhR/f7YEmi2WxbG7in5ULz2htslCGN9KpR2d5Z2oqh28lfgt
        QaGr22AR+5gA7xqGXycFmtzbJjfpcbMmH/JGulwTEc1Nw6RNhu9R6hDK9l/Zp9lGDE2eHPjmgiP
        ZtKm3NkKVDfYfgrMfSgSniwXkwUm0EQEjiGnKhg==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr2131020wmc.105.1632490239945;
        Fri, 24 Sep 2021 06:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxatSONAGwx8bkyPabvpoXT2g6eOdCu2CFURKgVt6gBRUeQdbu9BS0S8yUmhBIZdqIfSdu7VA==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr2130997wmc.105.1632490239750;
        Fri, 24 Sep 2021 06:30:39 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l19sm8646742wrc.16.2021.09.24.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:30:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: exynos: describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:30:05 +0200
Message-Id: <20210924133005.111564-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/usb/dwc3/Kconfig | 7 ++++---
 drivers/usb/host/Kconfig | 6 ++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 66b1454c4db2..c483f28b695d 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -66,12 +66,13 @@ config USB_DWC3_OMAP
 	  Say 'Y' or 'M' here if you have one such device
 
 config USB_DWC3_EXYNOS
-	tristate "Samsung Exynos Platform"
+	tristate "Samsung Exynos SoC Platform"
 	depends on (ARCH_EXYNOS || COMPILE_TEST) && OF
 	default USB_DWC3
 	help
-	  Recent Exynos5 SoCs ship with one DesignWare Core USB3 IP inside,
-	  say 'Y' or 'M' if you have one such device.
+	  Recent Samsung Exynos SoCs (Exynos5250, Exynos5410, Exynos542x,
+	  Exynos5800, Exynos5433, Exynos7) ship with one DesignWare Core USB3
+	  IP inside, say 'Y' or 'M' if you have one such device.
 
 config USB_DWC3_PCI
 	tristate "PCIe-based Platforms"
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index c4736d1d020c..d1d926f8f9c2 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -290,7 +290,8 @@ config USB_EHCI_EXYNOS
 	tristate "EHCI support for Samsung S5P/Exynos SoC Series"
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	help
-	  Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
+	  Enable support for the Samsung S5Pv210 and Exynos SOC's on-chip EHCI
+	  controller.
 
 config USB_EHCI_MV
 	tristate "EHCI support for Marvell PXA/MMP USB controller"
@@ -563,7 +564,8 @@ config USB_OHCI_EXYNOS
 	tristate "OHCI support for Samsung S5P/Exynos SoC Series"
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	help
-	  Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
+	  Enable support for the Samsung S5Pv210 and Exynos SOC's on-chip OHCI
+	  controller.
 
 config USB_CNS3XXX_OHCI
 	bool "Cavium CNS3XXX OHCI Module (DEPRECATED)"
-- 
2.30.2

