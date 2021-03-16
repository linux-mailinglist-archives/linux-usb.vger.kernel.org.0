Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC1E33CEF4
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 08:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhCPH41 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 03:56:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37566 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbhCPHz5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 03:55:57 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lM4YV-0006Qm-Qg
        for linux-usb@vger.kernel.org; Tue, 16 Mar 2021 07:55:55 +0000
Received: by mail-ed1-f71.google.com with SMTP id bm8so4081766edb.4
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 00:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3zCpcnTqD9R3iuzYicbz3BgU7Gti7/fMZiuJzomxfc=;
        b=JVtMW3kWDMGwUy8yB1qwFgpDIg4FQyGjqyUILqYrsXpLlTkNZgwgRx9xJXNVcabL6i
         pkWEZv98AHSq3BSsTxHT7R5+8Kk4CNX42uHmT2G20plW7Wjp2vMxFWDA/vTCK+YS6BVd
         VevPlAyzafESoUkauc5YznAQmZgopWiHjosEVdr2L39zIVD99Pr3a6IsrF1rTJ76QCzM
         I/HduutoKYT402mqb+KUYLrbrdZDqJ8LDzLB2quhu9PA2K8q64sZFIQ+5GjXtvh4rb0D
         UULScbMpw56vgG52qeNY6M6VtWjeRiuDTkAg6cUsCGyDZDStnnNlBfmOWn8/5OAEMkcv
         Y2JA==
X-Gm-Message-State: AOAM5307t8gFRCO7AbDOLpNWlqJa118cKRg8BuoN2E3Lhd0jcQmE+BJn
        iEnlycpjJpvqvVNdr5O9Guu9kJ0blXbD2kQAK/IjQrbKljHUwerB6fSdMeUGnIohWaT3NP2+cfX
        eYrbH+YsCDwxiJVs2RrkTOIeexupY0ZdfoLf2EA==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr28672226ejr.516.1615881355579;
        Tue, 16 Mar 2021 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy4DMknl54WTpt12UYudRp+llCrhUI3pa8l/ZF2galgznYCyWIDeErXWmVeS6SdiN0DMpEXA==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr28672210ejr.516.1615881355445;
        Tue, 16 Mar 2021 00:55:55 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id gj13sm9023904ejb.118.2021.03.16.00.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 00:55:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
Date:   Tue, 16 Mar 2021 08:55:51 +0100
Message-Id: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
    phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Depend on COMMON_CLK always, not only for compile test.
---
 drivers/usb/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 52eebcb88c1f..7500e77a7d01 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -163,6 +163,7 @@ config USB_MXS_PHY
 config USB_TEGRA_PHY
 	tristate "NVIDIA Tegra USB PHY Driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on COMMON_CLK
 	select USB_COMMON
 	select USB_PHY
 	select USB_ULPI
-- 
2.25.1

