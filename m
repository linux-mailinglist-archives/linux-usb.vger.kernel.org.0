Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678196781A2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 17:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbjAWQij (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 11:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbjAWQii (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 11:38:38 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF892BEC5
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 08:38:36 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id rl14so28723999ejb.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 08:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImwX9kdkxyCrfSxchCRVxcHp/q4vXtkqJGNHQ8DEkjc=;
        b=4far6+BsQeuVq4zWunDyumaobqqRyJHEgIeK3YLhZuroLjse6yoHs8JvXbmF/KqStg
         rxnQhqZG9GFcdehTbyghgkiwxJ93Pb9M3tDf2TlghV/DYVS/COt7tR0621b3nBn6hwDN
         fCokuOrFJ4eYLI0wThexPivBWg+hZXx/qnar0kNH+XWPhojhV+WdFwD+OgTEh/OCIlmc
         srWpBYsWvgPJJM6MT1YWIhh2lNAYoAQMwz2lMr4PErN8gzHx7GKJwI7UGILIKg2kqUPw
         Zs1f6CL1SMdLVl56CIIbUh/TVyG+bBRlhGabUBhfIhiFQ7DkrM7e+aeNcZkoAYNomyQ5
         VaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImwX9kdkxyCrfSxchCRVxcHp/q4vXtkqJGNHQ8DEkjc=;
        b=urnLUgDPnxcp69qNHHfGm9K6i3hNnEZihTW096pX8Pe605MnZnuJQtIj/b9JqvasMx
         T/4FWOpohrxZKyqGitIw/HulWlHDeSfrtpF3J3DKpdmNRzIsHGRq9aivnddRHDi7/9wT
         iEZma0zsgGIxMsyESyw5i7M7gnfMGxXTl8j92AaKldvnAgDSr4piMBDtYjEA0HzmrR3I
         qfv9Qts+V2J8m68y5ZLQczJSG2v7T751NzOEPPX652RQiD9RzNkz8IKqQDG29UclwGl1
         mJS4WWM1ccB2Hq4/D8El3bFIrw6087gYBYo4xim+NH6jqG2ChaL6/6/WZ6oUIstzGtl8
         Hu/g==
X-Gm-Message-State: AFqh2kq2dbsHPoR1IrlynZ+i4zOPqkqn86mqAsIBS3TGhOOq9RR7Dqy1
        N11brvz9w/aOwDwO5BGf3Fhn0w==
X-Google-Smtp-Source: AMrXdXul5MwiqQPpuhaRDMh0z5iXKOLd18UX/Lh/JbvN2UZqcd23wEqRedFecww6DX+nHF1piP4TeQ==
X-Received: by 2002:a17:906:4ed9:b0:7c1:7145:5b3c with SMTP id i25-20020a1709064ed900b007c171455b3cmr26822145ejv.46.1674491915346;
        Mon, 23 Jan 2023 08:38:35 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:34 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
        daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        andrew@lunn.ch, gtk3@inbox.ru, sean.wang@mediatek.com,
        zhiyong.tao@mediatek.com
Subject: [PATCH v8 0/9] Add minimal MT8365 and MT8365-EVK support
Date:   Mon, 23 Jan 2023 17:38:24 +0100
Message-Id: <20230123163833.1007181-1-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v8:
  - Add binding descriptions for mediatek,mt8365-systimer and
    mediatek,mt8365-uart
  - Specify ranges with parameters for u3phy

v7:
  - Update GIC information in mt8365.dtsi (thanks to Marc Zyngier for
    pointing out the problem)
  - Adjust the timer to match the updated GIC information

v6:
  - Add systimer in mt8365.dtsi
  - Add I/D caches and L2 cache details in mt8365.dtsi
  - Move bl31_secmon_reserved from mt8365.dtsi to mt8365-evk.dts
  - Fix inconsistent indentation in mt8365-pinctrl example
  - Further mt8365.dtsi cleanups
  - Submit to additional maintainers spotted by get_maintainer.pl

v5:
  - Reorder top-level entries in mediatek,mt8365-pinctrl.yaml to match
    example-schema
  - Use consistent quotes

v4:
  - Remove pins-are-numbered references that have been holding things up
    now that the patches removing it from dt-bindings have landed in linux-next

v3:
  - Remove a number of components that are not yet supported (they will
    come back alongside the corresponding drivers)
  - Address issues found by dt_binding_check (mostly fixing pinctrl
    bindings)
  - Address issues pointed out in comments
  - Reorder patches

v2:
  - Add missing dt-bindings documentation
  - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski


Bernhard Rosenkränzer (6):
  dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
  dt-bindings: irq: mtk, sysirq: add support for mt8365
  dt-bindings: mfd: syscon: Add mt8365-syscfg
  dt-bindings: pinctrl: add bindings for Mediatek MT8365 SoC
  dt-bindings: timer: mediatek,mtk-timer: add MT8365 SoC bindings
  dt-bindings: serial: mediatek,uart: add MT8365 SoC bindings

Fabien Parent (3):
  dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
  dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
  arm64: dts: mediatek: Initial mt8365-evk support

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../interrupt-controller/mediatek,sysirq.txt  |   1 +
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 +++++++++
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 .../bindings/timer/mediatek,mtk-timer.txt     |   1 +
 .../bindings/usb/mediatek,mtk-xhci.yaml       |   1 +
 .../bindings/usb/mediatek,mtu3.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 169 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 378 ++++++++++++++++++
 11 files changed, 755 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.39.1

