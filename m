Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC85497110
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jan 2022 12:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236212AbiAWLQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jan 2022 06:16:50 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55958
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236162AbiAWLQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jan 2022 06:16:50 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BE3513F1C1
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936608;
        bh=T1/sJNIrmDZDbqUoHlf4OrUfADwkzHPJVM35idTFftM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=W7CqGgEm47DOE81po+P8i7VxjpaXIeR6ut9Z2Mx3WcsmUtiSDGMDPUSTxKHB9vRZv
         dGdDVCTh/CXFePZnqveTmCdaiHSPx/VULH6NqckZeSTa3grvIX+kPksJu1p7DtFstR
         M18NiV8+3/foDPjsmFSrjUMR8KnaMtyg+uSUGTMREV/zObL1zMrJ6dScD9zj+Gw+2a
         ctEMVFeVJnydmZi6D0c9rGEM7DUgJ1jigH3NTRmfy3ySXnM74GaLwFMsXAFCPyzuN7
         5w5oBEEpmNjt6jyGjxxSrmt4ReFxiA/jJ+l2sIC6lTieImzm9ZTvUGwKDghf7U16pd
         fp+EHldvghEkg==
Received: by mail-wm1-f70.google.com with SMTP id b4-20020a7bc244000000b0034f4c46217cso1510312wmj.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Jan 2022 03:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T1/sJNIrmDZDbqUoHlf4OrUfADwkzHPJVM35idTFftM=;
        b=XaiD9DrX3RdKGahFr6ufzm4RSDC+E54x5YSWD9JN7u51tAPrm0E8irDEk/znOqqY2G
         KjYcgnGAcO3JWCLAFvg9c3YJGdphnyAHADxJTCOqz7lucrxjf+GICLw9fNBIVeiva6aU
         CFbZM4kkJpxU/FEgGlfDj2g2LogHIt8PDqU+nDaDIqXnti+H+zJD6/JQS2O24Nd87lwX
         767hcVjThP4u12YfKHueZTYIvsjIURTbLNZBnBU9O7zlszxRdl95w30/pPEDJwh/GC+l
         ol9fDgolQYoePg+o/XOL6Heca1/arJs8Xi3e9CzcAdKK7g0lt3xkTzrCUJOVwL62sjPg
         CUJQ==
X-Gm-Message-State: AOAM533hwgyMW3KFrLhE/ss28eBmJ817D3BQL/sgWFyJdrIE6tVGhbZr
        x7qAJRIFeM3e9vDl/fFEvSXwqWA5luG7HvVH4slcBNHnuK7sHa08ube8AgEfyAX+fNo79AQXvI4
        vItWuukGbFaX2Gp1v7wxWJqvZGuGfbdx3BDLxcg==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr10177659wrf.451.1642936608302;
        Sun, 23 Jan 2022 03:16:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgVsVZWODhwq/uXh4NOF8eTHsw3cQNa0zg5QWq4nkKUxlc731vjVtIU/jlG95afPKvbbAcMg==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr10177645wrf.451.1642936608063;
        Sun, 23 Jan 2022 03:16:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] usb: dt-bindings: samsung: convert to dtschema
Date:   Sun, 23 Jan 2022 12:16:32 +0100
Message-Id: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Dependencies
============
None.

The DTS patches are independent and I will take them via Samsung SoC tree.
I am including them here just so automatic robot checks won't complain about
DTS differences against newly dtschema.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  arm64: dts: exynos: add USB DWC3 supplies to Espresso board
  ARM: dts: exynos: add USB DWC3 supplies to Arndale
  ARM: dts: exynos: add USB DWC3 supplies to SMDK5250
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Snow
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Spring
  ARM: dts: exynos: add USB DWC3 supplies to ArndaleOcta
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pit
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pi
  ARM: dts: exynos: add USB DWC3 supplies to SMDK5420
  ARM: dts: exynos: add fake USB DWC3 supplies to SMDK5410
  dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema
  dt-bindings: usb: samsung,exynos-usb2: convert to dtschema

 .../devicetree/bindings/usb/exynos-usb.txt    | 115 ----------------
 .../bindings/usb/samsung,exynos-dwc3.yaml     | 129 ++++++++++++++++++
 .../bindings/usb/samsung,exynos-usb2.yaml     | 117 ++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts      |   5 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |   5 +
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |   5 +
 arch/arm/boot/dts/exynos5250-spring.dts       |   5 +
 arch/arm/boot/dts/exynos5250.dtsi             |   2 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts     |  23 ++++
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  10 ++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  10 ++
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |  10 ++
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  10 ++
 .../boot/dts/exynos/exynos7-espresso.dts      |   5 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |   2 +-
 15 files changed, 336 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml

-- 
2.32.0

