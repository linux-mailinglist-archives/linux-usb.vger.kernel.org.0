Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6E01646B0
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 15:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgBSOSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 09:18:22 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43359 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgBSOSW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Feb 2020 09:18:22 -0500
Received: by mail-wr1-f67.google.com with SMTP id r11so706850wrq.10
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n73JnDmg0VzOPRicTQwaM/KnoVwGL/4pXuBOrYc7ef4=;
        b=U4ucAUEAepCuTndLcLzujqnjNO5Vw7hsLHtU27Dk3BiCHkZTHeSfe4LRR7YCwX9+Yt
         Q1GvFaJiQsdwMyFrYNSrKr9u7wYs2uLspG1a5fo31YVDsaaTOdff4HDdkNnZ1Rod84LB
         NWvZOTy15qlcYLWMcU0PlihDccGWQQVYlzMbeVaaiYGYrQuK+64m00E0CdG9ZDtNAip8
         xFBBmfhEE32XXk/uctEVJemKHTXIH+BRQmPVWwttpax63y0HMK6D0H2WUooPXyvk88oq
         UGjAYwi2CbuFuQ2B5PZ8m1kCYNtO9glDPcsdGKbyVKN7dsySr1skOJaMpDZ/ZowcxiGc
         uyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n73JnDmg0VzOPRicTQwaM/KnoVwGL/4pXuBOrYc7ef4=;
        b=akVp1CnuYHSdUzi/VlVglGWaTS1GcZX9k5G7WCZ9/BXSCcy6VaCPwzVfgsRMELCTkH
         P4OGsR1sCMGYJeWSCL60rkNORAnTQSADH6BojXydhzuul0WRj8jYbC0fO9HZEs6nOx5K
         k55b5MwT4Bjxbkb8npOOOHu2n97QT+nbN0RZBp8HhXSmXyB/QjhZR8HnEAT9kpgMrwLf
         2h1RA0M8KR5EXM3qOGNE5RPgiZnfqlA48o2OU+cJYT8jJC3wp8lfm9CPlfJnNLMtvwqM
         b5N7GSvW9yrg+R3lEelKRLefHPh81+8JeLOr6kbevAN87I8hAzo754IpymXx9nvrqkD0
         RaEQ==
X-Gm-Message-State: APjAAAVL7+7Igug2i6ZNm8WNEYZcNoQcEay/PN70fjkQX3NeXABci36f
        o8BDMWFvxtnMvDF267SacajHog==
X-Google-Smtp-Source: APXvYqz4yAg1bD+S0svdzIoD9J0ZoAZj9d9nIR9o555HoYP0tBNnux95dFcBJ/pcGkZq9I0WWoDm0Q==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr35628480wrs.309.1582121900311;
        Wed, 19 Feb 2020 06:18:20 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:510e:e29a:93ab:74c3])
        by smtp.gmail.com with ESMTPSA id b11sm3337772wrx.89.2020.02.19.06.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 06:18:19 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] usb: dwc3: parkmode_disable_ss_quirk on DWC3 controller
Date:   Wed, 19 Feb 2020 15:18:14 +0100
Message-Id: <20200219141817.24521-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In certain circumstances, the XHCI SuperSpeed instance in park mode
can fail to recover, thus on Amlogic G12A/G12B/SM1 SoCs when there is high
load on the single XHCI SuperSpeed instance, the controller can crash like:
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
usb 2-1.1-port1: cannot reset (err = -22)

Setting the PARKMODE_DISABLE_SS bit in the DWC3_USB3_GUCTL1 mitigates
the issue. The bit is described as :
"When this bit is set to '1' all SS bus instances in park mode are disabled"

The bug has been reproduced by Jun Li <lijun.kernel@gmail.com> and confirmed
by Thinh Nguyen <Thinh.Nguyen@synopsys.com> with the explanation:
> The GUCTL1.PARKMODE_DISABLE_SS is only available in dwc_usb3 controller 
> running in host mode. This should not be set for other IPs.
> This can be disabled by default based on IP, but I recommend to have a 
> property to enable this feature for devices that need this.

Changes since v2 at [2]:
- rebased on v5.6-rc2

Changes since v1 at [1]:
- added rob review tag
- added Thinh Nguyen in commit log

[1] https://lore.kernel.org/linux-amlogic/20191014141718.22603-1-narmstrong@baylibre.com
[1] https://lore.kernel.org/linux-amlogic/20200109101535.26812-1-narmstrong@baylibre.com

Neil Armstrong (3):
  doc: dt: bindings: usb: dwc3: Update entries for disabling SS
    instances in park mode
  usb: dwc3: gadget: Add support for disabling SS instances in park mode
  arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3
    controller

 Documentation/devicetree/bindings/usb/dwc3.txt    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 drivers/usb/dwc3/core.c                           | 5 +++++
 drivers/usb/dwc3/core.h                           | 4 ++++
 4 files changed, 12 insertions(+)

-- 
2.22.0

