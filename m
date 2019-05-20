Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D02C23F9F
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 19:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfETR4N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 13:56:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37076 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbfETR4M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 13:56:12 -0400
Received: by mail-pg1-f193.google.com with SMTP id n27so4539948pgm.4
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52yco9VK5RzDzN0Ze4QU/l0MYwJs+5CquMz8VBL6VQk=;
        b=V4AXEIv08AJKozp2k60l6WH+FbxePpO4LTwIjjxSxtuTTGQq9J6Z94lUGUst3qQJQ0
         gzqVaxKuD9EsnXxGRIJAA19oBZ5ie2qAalS6DvszK5vEF1nkOTgi0UW+OK0Eg3doRcqb
         waYM/YGAhtSg0UmYZ5Z0OQJoZBrMBmKMhqCY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52yco9VK5RzDzN0Ze4QU/l0MYwJs+5CquMz8VBL6VQk=;
        b=mj4Yggf4TA+g2e5oFMK+goYU/OMQAI75nXDD7OdsZLJpzVwwvXfq7z2ROcbvAGcUQ8
         d23ci6Y1+st0p1dswpProhm4Tvl1pyfgUk46csbj7DVamYTeWr8qvAEjK+JA+v9dbIxi
         cKvo1B8A9Z4Y+Fzan4AeJ0g4l54hORoyuUuknKZZac7ovUVV//Njx0zcC6j/NbrZaW8W
         x8nsPzBsDk+pdYUG/h+ZdkYrJjbrVwD9VPE8v0ljt3uf8LbBRfMnCOUPK6SnhGRksKZt
         7Wt1UsQJcYc7WQN16ID2EFzfczCSn9Z2s5OwLHsCGHZBo8a0nejQuWl0MGxsY/thupsV
         VEvw==
X-Gm-Message-State: APjAAAX7HWbrubbCg/RR+3XhjwjcNYc1sHGHZxk8m4LqeHCk2X3zowVM
        2288OsypQbFEwRyWI7ol52TClg==
X-Google-Smtp-Source: APXvYqzZDvPhaLQndJXX3Bt+sreJ+zs8jKeG3JkAK89Y9xuYz8Uqg1m2gbKwuR3Bid5ZcOye6FcIpw==
X-Received: by 2002:a62:b40a:: with SMTP id h10mr74507778pfn.216.1558374971504;
        Mon, 20 May 2019 10:56:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm16852723pgq.1.2019.05.20.10.56.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 10:56:10 -0700 (PDT)
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
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] USB: dwc2: Allow wakeup from suspend; enable for rk3288-veyron
Date:   Mon, 20 May 2019 10:56:02 -0700
Message-Id: <20190520175605.2405-1-dianders@chromium.org>
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

Patch #2 has a slight difference in v3 here to fix build robot
reported error.

Changes in v3:
- Fixed kbuild test robot error.

Changes in v2:
- Rebased to mainline atop rk3288 remote wake quirk series.
- rk3288-veyron dts patch new for v2.

Douglas Anderson (3):
  Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
  USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
  ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports

 .../devicetree/bindings/usb/dwc2.txt          |  3 +++
 arch/arm/boot/dts/rk3288-veyron.dtsi          |  2 ++
 drivers/usb/dwc2/core.h                       |  8 +++++++
 drivers/usb/dwc2/hcd.c                        | 19 +++++++++++++++
 drivers/usb/dwc2/platform.c                   | 23 ++++++++++++++++---
 5 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

