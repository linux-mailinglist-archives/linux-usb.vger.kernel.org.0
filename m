Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D13538079F
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 12:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhENKqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 06:46:19 -0400
Received: from mail.manjaro.org ([176.9.38.148]:38902 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231326AbhENKqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 06:46:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id 74A2122259F;
        Fri, 14 May 2021 12:26:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dn_VdLJ88t-6; Fri, 14 May 2021 12:26:36 +0200 (CEST)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 0/4] Add USB support for RK3308 SoC
Date:   Fri, 14 May 2021 12:27:30 +0200
Message-Id: <20210514102734.2091238-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The RK3308 SoC features integrated USB controllers and PHYs. The USB
controller is compatible with the usual RK3066 USB controller, the phy is
in general compatible with the inno-usb2 phy structure but is not quite
the same as any of the phys supported yet.
This patchset adds USB support for the RK3308 SoC to both the RK3308 dtsi
and Rockchip inno-usb2 phy driver.
I've tested this patchset on a Rock Pi S, works flawlessly with HS, FS and
LS devices.

Cheers,
Tobias

Tobias Schramm (4):
  Documentation: bindings: phy: add compatible for RK3308 USB phy
  phy: phy-rockchip-inno-usb2: add support for RK3308 USB phy
  dt-bindings: usb: dwc2: add compatible for RK3308 USB controller
  arm64: dts: rockchip: add USB support to RK3308 dts

 .../bindings/phy/rockchip-usb-phy.txt         |  1 +
 .../devicetree/bindings/usb/dwc2.yaml         |  1 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      | 75 +++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 44 +++++++++++
 4 files changed, 121 insertions(+)

-- 
2.31.1

