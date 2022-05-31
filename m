Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239F0539206
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 15:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344879AbiEaNuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 09:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbiEaNuk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 09:50:40 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1564EDCA
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:50:38 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x17so9726132wrg.6
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ks9vTtzXL1NzJuLhvcv/lBf9sH/I8oroEcUXJQecJiY=;
        b=xtZHSA3K85YeP1R8TqJTezh1l7AboO67QnJbxmUxYsSKR3b9HMFsTp1QD4TVZvKYD1
         HykwJkz0IW4fwjPH1Z0l9xH3Oif1Qyz4EObPsiwZXnAXo/kCZCKI8eI5xsuJ7HgXtaXN
         igvkGmpchkyuuMO2tdAR159F7tqSL4KCQk76eOzZ0gnvace+L6L/D7RGtYizyiAxNH/H
         U1OOXHiLwvj0PnjQ9PmyWuR1utFiONwi7NGx9h2FLtpNKsKkOyd7zUg6Z7fPPuvzo2+J
         OzV184qkC3Q1grDw1sZEiE1et3kV/ow2A5Uy2HR/6AQuE2OaglwYGrTIwCVgkLMJpI+J
         hYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ks9vTtzXL1NzJuLhvcv/lBf9sH/I8oroEcUXJQecJiY=;
        b=ZcCtuzmLE1/KaJ1uOJCyK7nQWvQKoTYYUhfevml4cAuxTGKelgK9unH14uXOA/KcBm
         jzw2lcgmAiBPTpQmq0IQfhHMM5jSsPAE1zvrPoYadY35ngeGMq5zADUbN4Z2O8mnFEzs
         DgqPCefWml/VszZFSQHRgavPd7EVbf5EpOQaQKoPU092PAxNZ64p8eX+I8aC+fDyvwpM
         flkYIa9VG4XZkPcs9fxYnv5CxKYCI4EQvIivDnis1hOc8/hN3ZhSx+lWaiX6VY5othHP
         8DP2ccv4qhfGzTkXhc5G1gEmRRLwqCJoCjii4EJ8aaoKB8hId9PwinYbT1OoZLx3qen6
         yvkQ==
X-Gm-Message-State: AOAM5303DpMs3BquZz3bbBpp7V6a9hjk46nwpRzonMm+jP71swGTWaTf
        BNe6cXTsj5HFS5Hj16MZ597Vkw==
X-Google-Smtp-Source: ABdhPJzh0ABvRvzeW4VNDfDT+jgXlefhQRDjukiBBkCf5v7KqylLxZRg6Qya21tyLqyBuT1Kzn3OQA==
X-Received: by 2002:a5d:6f1d:0:b0:20f:ff40:263f with SMTP id ay29-20020a5d6f1d000000b0020fff40263fmr25172992wrb.626.1654005037132;
        Tue, 31 May 2022 06:50:37 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:36 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 00/17] Add support for MT8365 EVK board
Date:   Tue, 31 May 2022 15:50:09 +0200
Message-Id: <20220531135026.238475-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds support for the MT8365 EVK board.

This series has dependencies on the following series:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646256
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646091
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646083
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646081
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646076
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646068
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646020
https://patchwork.kernel.org/project/linux-mediatek/list/?series=646052
https://lore.kernel.org/r/20220504091923.2219-2-rex-bc.chen@mediatek.com 
https://lore.kernel.org/r/20220512062622.31484-2-chunfeng.yun@mediatek.com 
https://lore.kernel.org/r/20220512062622.31484-1-chunfeng.yun@mediatek.com
https://lore.kernel.org/r/20220524115019.97246-1-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/all/20220127015857.9868-1-biao.huang@mediatek.com/

Fabien Parent (17):
  dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
  dt-bindings: memory: add mt8365 SoC binding documentation
  dt-bindings: mmc: mtk-sd: add bindings for MT8365 SoC
  dt-bindings: arm: mediatek: Add binding for mt8365-evk board
  dt-bindings: dma: mediatek,uart-dma: add MT8365 bindings
  dt-bindings: iio: adc: mediatek: add MT8365 SoC bindings
  dt-bindings: nvmem: mediatek,efuse: add MT8365 bindings
  dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC bindings
  dt-bindings: spi: mt65xx: add MT8365 SoC bindings
  dt-bindings: serial: mediatek: add MT8365 bindings
  dt-bindings: phy: mediatek,dsi-phy: Add MT8365 SoC bindings
  dt-bindings: phy: mediatek,tphy: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
  arm64: dts: mediatek: add mt6357 device-tree
  arm64: dts: mediatek: add mt8365 device-tree
  arm64: dts: mediatek: add mt8365-evk board device-tree

 .../devicetree/bindings/arm/mediatek.yaml     |    4 +
 .../bindings/dma/mediatek,uart-dma.yaml       |    1 +
 .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |    4 +
 .../iio/adc/mediatek,mt2701-auxadc.yaml       |    1 +
 .../mediatek,smi-common.yaml                  |    6 +
 .../memory-controllers/mediatek,smi-larb.yaml |    6 +
 .../devicetree/bindings/mmc/mtk-sd.yaml       |    3 +
 .../bindings/nvmem/mediatek,efuse.yaml        |    1 +
 .../bindings/phy/mediatek,dsi-phy.yaml        |    4 +
 .../bindings/phy/mediatek,tphy.yaml           |    1 +
 .../bindings/serial/mediatek,uart.yaml        |    1 +
 .../bindings/spi/mediatek,spi-mt65xx.yaml     |    1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |    1 +
 .../bindings/usb/mediatek,mtu3.yaml           |    1 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi      |  272 +++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   |  578 +++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 1047 +++++++++++++++++
 19 files changed, 1934 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6357.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.36.1

