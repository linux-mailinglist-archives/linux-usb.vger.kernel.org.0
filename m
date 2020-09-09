Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6A02632E9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 18:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbgIIQxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 12:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730901AbgIIQET (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 12:04:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B80C061757
        for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2020 09:04:17 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l9so2928576wme.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2020 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqHDfmvrn1k16mVJQ5+b/SIXRz53SpIEt2htZWi6LBw=;
        b=MWcvAepihDTzFeQEhYY4dmVrfX1hYZrzB4rWEGRs4dmjdbtUj+2Qif01qedSuWuIzF
         pTWkOigok9A72v58KpF1HrnrSkw/q3gV/pNBzM6lsDcPtpzwJCjXF0KuVhlOMqmAibM4
         BNvWlMPLHGrYmjmq9cFMO84V6elPjUgSJ8rXi+n8phF5NJ/1ifTr68u4FfK+28F7B30F
         KG+s1lHKyfT1hW3fITFNV+T1cPG6rE7Dz2jvtP+F4NxMMDki7qWh6xf8J/yJzRRk5j0J
         5siS673YwqOMAvBMZZELYYn9H1wEUUvN4WMzsE2eYMOtKM74f29o/BQN8TPAj51/dUHU
         ikTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fqHDfmvrn1k16mVJQ5+b/SIXRz53SpIEt2htZWi6LBw=;
        b=BPgQM9X9eofKq+fCAFnZEXd2dgc9s8yDm1ucYiMUWB5peBBzdqCDSIpO8drmNmbSIu
         JEvtyWqcy5zuos7rzaDxY9UIhihY/eXLngVx3IVMWJK9cv9h9o1SeZp9dhLUT8hnXaK6
         BwGWbMgUtOm43XwAVPDMbqw240eeGBKDLosBcPTEe25oMSdOumUnsQRlmGpmS1mVd5Xg
         9JPbSL8YqXaP6MqsEf4K6pqhiKFjUf/wB6HzYRYfkkO+aTXXQIjXuyYlPTYzbnWeK1Tq
         I48ILBDpO+PT/hXjNELQxyaiOGklXni/tCnlrPzMZNRpD6hFVsx7SW2eyINpSuKknDMt
         MAew==
X-Gm-Message-State: AOAM533dTI9/jU2LzaPSNvU/xEnY6frEQX80O2fcFRqsWa/t1mXA4o2r
        5KsDgDjcEzRx6xP96rUSueGWEw==
X-Google-Smtp-Source: ABdhPJwPM+/b2ZDI+b2lSlT6ZtTWsjPKk0PA8OlwP8p9CqXazyikXgs/36KZ9HFCJYOviAo2mF99NQ==
X-Received: by 2002:a1c:81c6:: with SMTP id c189mr4178443wmd.124.1599667455779;
        Wed, 09 Sep 2020 09:04:15 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
        by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 09:04:15 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, kishon@ti.com, balbi@kernel.org,
        martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/5] usb: dwc-meson-g12a: Add support for USB on S400 board
Date:   Wed,  9 Sep 2020 18:04:04 +0200
Message-Id: <20200909160409.8678-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

It needs the same init sequence as GXL & GXM, but it seems it doesn't need
the host disconnect bit.

The Glue driver reuses the already implemented GXL & GXM work.

The USB2 PHY driver needs a slight tweak to keep the OTG detection working.

Neil Armstrong (5):
  phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
  dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG
    Families USB Glue Bindings
  usb: dwc-meson-g12a: Add support for USB on AXG SoCs
  arm64: dts: meson-axg: add USB nodes
  arm64: dts: meson-axg-s400: enable USB OTG

 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 +++++++-
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 51 +++++++++++++++++++
 drivers/phy/amlogic/phy-meson-gxl-usb2.c      |  3 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 17 +++++++
 5 files changed, 101 insertions(+), 2 deletions(-)

-- 
2.22.0

