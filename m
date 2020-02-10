Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E343157308
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 11:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJKvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 05:51:19 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34106 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJKvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 05:51:19 -0500
Received: by mail-pg1-f193.google.com with SMTP id j4so3732303pgi.1;
        Mon, 10 Feb 2020 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OBq9Wxg3rNYXND45mTJejeBW0qaZ9nSsHbegXEcF9x8=;
        b=ftHzx5eOWQlGm3C8QeR2uhQzu038c0/X4JMnx1G1weCDZyndLaC4dlIKZWqnduq5Uc
         LxWeF9fi0gEqhJt2JHg5epLlDP4wXfiVwj6vfLY61P4yOF4ruv9k0pIMn9QtHEQBwF9i
         dcIYqGe4+US5qAXNWHAepmlmdNq5X6V6gB8x+vrJMKC0x31J7eNxOsN1daGCeEwK5byY
         XMUtRxktldY4sZtm0En9e8ebFIv9z2c+AM6nJTCQBuAthHoUQda0szwe6Ev6z7jNPtVQ
         8xo7cjOp1pv3XHLEeeZtfQzo15lR/3a3mzyWlmuRV/Tiq9pvqeIoYWtdhz4tyLYZ7gNG
         Nluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OBq9Wxg3rNYXND45mTJejeBW0qaZ9nSsHbegXEcF9x8=;
        b=RlWV2lpPvUtKFAKC/Gbovw97zoxxe0xK/3QskN21ZPHh0c98uvgKYe2iK/kRFvmqpp
         2uZqwReq1quw4sgjMuQt8KoKn4A1nPuRDEVj7DtBlD4YM0IC0bw2GL7A6lVwDOmw/Rqu
         8+yDwofeBQPjq7hToAJyk/qjUvhbAFOkMYEydtz5iZMxQIJ63Qg237/zAupAyVqQEuX7
         OQe3xQ8CvzbwQJSY1GRPv/TeLd+IQcZ8rkI8lYpEN1vqjHk0DEdUqO7hSj+U9lanbFzq
         JNXhds/5HBQMIGT7KRS27VMPqoy1QJmCBFySxzhf6Xvo53w/bgCoeo7vcrzQUjIb4jtv
         8B1g==
X-Gm-Message-State: APjAAAWK0+ToapaflRWHPqOn6mtF1dDldCJ+6knvl3cAT2UMsuVOA1Jq
        4wlV4WPy3bKEZVv2MzA+zgOnHFQO
X-Google-Smtp-Source: APXvYqxeRF90/zEsikUD4SUJJypsMyD4WZjz/yht4sgsIdjSjQZ284ZxUvHiyWkJHvuqABcIpJscGA==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr608003pfq.66.1581331878197;
        Mon, 10 Feb 2020 02:51:18 -0800 (PST)
Received: from localhost.localdomain ([45.114.62.33])
        by smtp.gmail.com with ESMTPSA id g18sm12104833pfi.80.2020.02.10.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 02:51:17 -0800 (PST)
From:   Anand Moon <linux.amoon@gmail.com>
To:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCHv3 0/3] Add support for suspend clk for Exynos5422 SoC
Date:   Mon, 10 Feb 2020 10:51:05 +0000
Message-Id: <20200210105108.1128-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Long time ago I tried to add suspend clk for dwc3 phy
which was wrong appoch, see below.

[0] https://lore.kernel.org/patchwork/patch/837635/
[1] https://lore.kernel.org/patchwork/patch/837636/

This patch series tries to enable suspend clk using 
exynos dwc3 driver, for this I have added new 
compatible string "samsung,exynos5420-dwusb3"
so that we could add new suspend clk in addition
to the core clk. exynos dwc3 driver will help
enable/disable these clk.

-Anand

Anand Moon (3):
  devicetree: bindings: exynos: Add new compatible for Exynos5420 dwc3
    clocks support
  ARM: dts: exynos: Add missing usbdrd3 suspend clk
  usb: dwc3: exynos: Add support for Exynos5422 suspend clk

 Documentation/devicetree/bindings/usb/exynos-usb.txt | 4 +++-
 arch/arm/boot/dts/exynos5420.dtsi                    | 8 ++++----
 arch/arm/boot/dts/exynos54xx.dtsi                    | 4 ++--
 drivers/usb/dwc3/dwc3-exynos.c                       | 9 +++++++++
 4 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.25.0

