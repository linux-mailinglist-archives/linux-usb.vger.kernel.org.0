Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3BCE210D1
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2019 01:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfEPXAA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 19:00:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40867 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfEPXAA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 19:00:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id d30so2273267pgm.7
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SPI5RDPWdm7X3U8G9i9l916Umv8GEODUn9UXyetpFQ=;
        b=XqaResjbamVa27eUZH0ReqyOeLnzGjESnU4sd5uP71Q5DjrC6Inen21If1TxNy1eAS
         EUwh3Zd7mrs5/Cu5uCL878Xot+50PiUbvP8uAHxvZaDMO4L6wLl6b5Zn5TbkU/15oyDX
         Ki3YSd8i7BuCoLoxD8NnkrNgGtzAexmc0Ni1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5SPI5RDPWdm7X3U8G9i9l916Umv8GEODUn9UXyetpFQ=;
        b=q5KzXcAHXhrmzcJ4g9hpSALozGz1l0pSehp/WVtPnSqfdcBgIIdKfzJ3UelS7QLFA/
         yYGLwQKrt2LkKFPdEa7rKBEiN/iStyzeLcMJi3wUT2f0DAB4JdlgWaIMI4VINdDAwcIH
         /debcQmOxi4/RlswaiT3nlYjjYA1YR+g5r8352TM+UESXnB+tcuflqxGSLqKI+tBtJkU
         uek2oZQvHshZRp/ficfTFtb9nVxD6XP6OojaNp2gSkbp2tO3cSkHIxRmrgTmtwFxt6Ar
         ENHmNSU9XlSRFLAZeUBDAQmudU0EWf8R31UpdkVqkioaP3C+KP/BAhTr56h+aXsC7xzz
         8AYw==
X-Gm-Message-State: APjAAAWVsGnEHObEeumYXjGz6RrVkhKCI09Gy40sVXTl/E+8lzDd67L0
        T0xVNbcIkcja1/Ccn09dDeWOOw==
X-Google-Smtp-Source: APXvYqyBwuyMUc16C5THCTCHLcAVBc5sfzm5Lo0F2Kp/4BxCcSub39P/7nmc9SsQxcSYnZOu+IhC3g==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr52245653pgc.44.1558047599563;
        Thu, 16 May 2019 15:59:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id j64sm1769506pfb.126.2019.05.16.15.59.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 15:59:59 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, zyw@rock-chips.com,
        mka@chromium.org, ryandcase@chromium.org,
        Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org,
        dinguyen@opensource.altera.com,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [REPOST PATCH v2 0/3] USB: dwc2: Allow wakeup from suspend; enable for rk3288-veyron
Date:   Thu, 16 May 2019 15:59:38 -0700
Message-Id: <20190516225941.170355-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a re-post of the last 3 patches of a series I posted earlier
at:
  https://lkml.kernel.org/r/20190418001356.124334-1-dianders@chromium.org

The first two patches were applied but the last three weren't because
they didn't apply at the time.  They apply fine now so are ready to
land.

Changes in v2:
- Rebased to mainline atop rk3288 remote wake quirk series.
- rk3288-veyron dts patch new for v2.

Douglas Anderson (3):
  Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
  USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
  ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports

 .../devicetree/bindings/usb/dwc2.txt          |  3 ++
 arch/arm/boot/dts/rk3288-veyron.dtsi          |  2 +
 drivers/usb/dwc2/core.h                       |  5 +++
 drivers/usb/dwc2/platform.c                   | 43 ++++++++++++++++++-
 4 files changed, 51 insertions(+), 2 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

