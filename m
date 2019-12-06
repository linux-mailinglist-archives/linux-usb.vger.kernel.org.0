Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE021151E6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfLFOG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:06:58 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43899 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFOG5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:06:57 -0500
Received: by mail-wr1-f65.google.com with SMTP id d16so7852846wre.10;
        Fri, 06 Dec 2019 06:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wX7YZhl6Ff/TTsQn22noU9DFT307Fj94r/I2C42B5M=;
        b=s5BlYqtux58eV5lRL4Uq2IgtCuQDGFX6K4yYEX0RLhOvM3Ev+yyjmjvhEzSc4m6u5W
         jb4uvcXUSxel+xjdiYswRfRC8BGStqpcpfwwzDk4yDSocO+kMqxosulqaHzNql5g5Igw
         iebSpEnPO6xxnv1I0k7+3fhwhuTwTax9VTxhIZ0mZ8nFdpYfve4AYmnuyO+1hALiCK4N
         MVSQ+zILy5pB8h7E7FmQuPcUbEaWj5Ljo+3174S4ewX24BofvINu/1hAyt7Ff8ZwgQOx
         YnEh+9aQXMLhA2Fj8DYQiQrzfJueHslv/mnmqWO/V8W0UnTLQMuV1n5EEmXTZeGKIqQf
         DB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wX7YZhl6Ff/TTsQn22noU9DFT307Fj94r/I2C42B5M=;
        b=sgkvquldmbZpDGwv3AhqlKOwqGZ0zpf92q6UKb4n4whMRCe3nKXSlv9TsvkHGaWymN
         E/O1gPNjMb82vaPj7JS+WE28dzdqR9pYXxZwBUVyYhyTcc575yQqc8x2z2/PrsYtrh92
         ct6AQIKapG4yMc6NlLR+z/ZILKMCbCxtcMC8LCEfZcPKrwfHpJxs+LYZf+DUNpCU+Dzd
         rzghl92N0EXtbu6dvWBV5O9E0yqHMf48tTBnkMNBOP4R9Vrnc5bJ3us8UxhCgxOSBdeA
         JOAwMl88IyQtpjW7WC+zu5CW6NWAUQDQuU+KQaLENMqOCWx96B1hgFzvgdBzni07j1BF
         Sqyw==
X-Gm-Message-State: APjAAAXLEfoSWnR2sSh4lrwdMyW3m+QGC4WgvcrwGfRWeF4Tifod+MKg
        POJChT0tgnFbU4/qegOlWNQ=
X-Google-Smtp-Source: APXvYqwnTTJ2tyrORPrY6W2zm5gkzKjRRH1E///pg1euVt9Ly9T6rXuscLFZOBZEjE9nXQ866fBg6w==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr15443671wrr.158.1575641215691;
        Fri, 06 Dec 2019 06:06:55 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id s10sm16299299wrw.12.2019.12.06.06.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:06:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/10] usb: host: xhci-tegra: Implement basic ELPG support
Date:   Fri,  6 Dec 2019 15:06:43 +0100
Message-Id: <20191206140653.2085561-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches is an attempt to split up JC's large patch adding
ELPG support into more manageable chunks. The original patch can be
found here:

        http://patchwork.ozlabs.org/patch/1115804/

That patch was part of a larger series that also added a couple more
features to more aggressively save power. This series is more limited in
scope and at the same time tries to address most of the comments that
were voiced during review of JC's original posting.

Note that this series is primarily targetted at getting system suspend
and resume to work properly on Jetson TX2 and later, now that we can
actually resume from system sleep on these systems. The code should also
work on Tegra210 and earlier, though Tegra210 is still missing a bit of
the very low-level plumbing to make the system resume properly from
sleep.

I've verified that after this I can successfully use the XHCI on Jetson
TX2 after a system suspend/resume cycle.

Note that I've claimed ownership of these patches because they differ
from JC's patches significantly in many areas and are also a bit
crippled compared to JC's original in terms of features. I've credited
JC in the commit message, but didn't want him to get any blame from me
potentially messing this up.

JC, if you think this is still in line with what you had in mind, let me
know and I'll restore your authorship.

Changes in v2:
- add Reviewed-by from JC on the one patch that is not originally his
- remove some useless gotos as pointed out by Mathias

Thierry

Thierry Reding (10):
  usb: host: xhci-tegra: Fix "tega" -> "tegra" typo
  usb: host: xhci-tegra: Separate firmware request and load
  usb: host: xhci-tegra: Avoid a fixed duration sleep
  usb: host: xhci-tegra: Use CNR as firmware ready indicator
  usb: host: xhci-tegra: Extract firmware enable helper
  usb: host: xhci-tegra: Reuse stored register base address
  usb: host: xhci-tegra: Enable runtime PM as late as possible
  usb: host: xhci-tegra: Add support for XUSB context save/restore
  usb: host: xhci-tegra: Add XUSB controller context
  usb: host: xhci-tegra: Implement basic ELPG support

 drivers/usb/host/xhci-tegra.c | 439 +++++++++++++++++++++++++++++-----
 1 file changed, 380 insertions(+), 59 deletions(-)

-- 
2.23.0

