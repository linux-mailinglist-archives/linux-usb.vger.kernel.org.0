Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC95EE784A
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 19:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391124AbfJ1SXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 14:23:13 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43261 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730690AbfJ1SXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 14:23:12 -0400
Received: by mail-qt1-f195.google.com with SMTP id l15so9380835qtr.10
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOWlJJy6ChuEnqYHbSHVhhLc41FzhhIbgNvL4gteWmI=;
        b=l8qmOSK8YchiVh2uO5YBeCgBvBOdUPYnJFFf0qevg1oXdh17RzVfSZ872bS9hseUkQ
         IBW+IuI5W93nmKGGhxC7bwVX+yEuxGWMJ30t4uYZBeKlvSs96PIldYUBc1mpi5jlRAnR
         Lc8PrZd3xvcY9SCTpQRLYSuAsww0vkQJGs5Ap6ND9oYyMKcSqqVWNh2vVFaLTE+F0bDC
         vfQ2EUZMIwLzUhAVlC2mV7d5OpWuSNuwUOYF6sV5/edl11sHTEhmjK8i1cOl/rSotYSZ
         bPKSAqikVeGkZNlfengbP0a4vgfGpW5noxhaCS4YnRDOiWnuqb0lK4ZiKlw9dnhr/jzI
         1mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOWlJJy6ChuEnqYHbSHVhhLc41FzhhIbgNvL4gteWmI=;
        b=DmSBHBEgTwYD+FjnljncazVZc0dVajstxnWRxcYS5v7YxMf94EVRvSGoq/vn5x+o5h
         kg6XiMmMzWSUYS1KtqH0NWr5nWnLUKDJw/mR75zyovGMmyEza+NeGTBzz6ZRPP9wzDT6
         2+o99DLH5YbQf1gQmYneUGvPnioqLaFF+4fSTmfIxaSs5MR69FyBw37vtURwL46KEjvd
         zoTSJb+oZ0A9VdXxZIRbFfQx2on2GKZ8kC6nHxGmBnXGeJ14ckL2fniKZErSar9NhSYF
         Ja8Mkv/jiKfc0hvWv5tlPLLrmKTuxM58nHjVkaN9C2wEimvvG5bAvDUE0KpJXcB/U7+F
         qLbQ==
X-Gm-Message-State: APjAAAWOr5uUxPuESiTelKR+n/xbE+eEQ6trBmBpz3JvFYwjoEZYyWlH
        l0vk6daK5NV8NNBH0XZPcsA=
X-Google-Smtp-Source: APXvYqzi7aq5Ujye1dzsDxTmyAsUXCY6WWoNzCH9hvO3gsTVvZOy7RJRh/HUOjF4kGBm9w2TjIykbg==
X-Received: by 2002:a0c:94fb:: with SMTP id k56mr13660455qvk.127.1572286991587;
        Mon, 28 Oct 2019 11:23:11 -0700 (PDT)
Received: from firefly.sparksnet ([2601:153:900:a52:6f12:874c:d2b2:a9d0])
        by smtp.gmail.com with ESMTPSA id x9sm5808631qkl.75.2019.10.28.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 11:23:09 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     heiko@sntech.de
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, robin.murphy@arm.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/5] add rk3328 usb3 phy driver
Date:   Mon, 28 Oct 2019 18:22:49 +0000
Message-Id: <20191028182254.30739-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It took a lot more effort than originally anticipated, but here it is.
This is the driver from [0], updated to work with the current kernel.
I've tested it on the rk3328-roc-cc board, both usb 2.0 and usb 3.0 
devices detect on hotplug.

[0] https://github.com/FireflyTeam/kernel/commits/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c

Peter Geis (5):
  phy: rockchip: add inno-usb3 phy driver
  dt-bindings: clean up rockchip grf binding document
  Documentation: bindings: add dt documentation for rockchip usb3 phy
  arm64: dts: rockchip: add usb3 to rk3328 devicetree
  arm64: dts: rockchip: enable usb3 on rk3328-roc-cc

 .../bindings/phy/phy-rockchip-inno-usb3.yaml  |  157 +++
 .../devicetree/bindings/soc/rockchip/grf.txt  |    8 +-
 .../devicetree/bindings/usb/rockchip,dwc3.txt |    9 +-
 .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts |   21 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   72 ++
 drivers/phy/rockchip/Kconfig                  |    9 +
 drivers/phy/rockchip/Makefile                 |    1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 1107 +++++++++++++++++
 8 files changed, 1378 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb3.yaml
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c

-- 
2.20.1

