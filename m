Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 556341F3913
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgFILK3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:10:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:39536 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgFILK2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:10:28 -0400
IronPort-SDR: HZEpOpW3Sa3I0c5eXYCVsQF2z6S0GhpC9hoQL8lIF+GAgEMlRkjL0WUdLUTJlyt/zqATqFcSUx
 UOKcLIZ+PA4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 04:10:28 -0700
IronPort-SDR: AEwrycebfpER+iAA9i20J217dU73zmxVPR+O4cMVHtQjNBhd9Jq//NPONiPpK4DllGf1CIwuVR
 wBJx9oiFp5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; 
   d="scan'208";a="349485957"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2020 04:10:24 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, robh@kernel.org,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        linux-usb@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, yin1.li@intel.com,
        andriy.shevchenko@intel.com,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v1 0/2] usb : phy: Add USB PHY support on Intel LGM SoC
Date:   Tue,  9 Jun 2020 19:08:48 +0800
Message-Id: <20200609110850.43469-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB PHY provides the optimized for low power dissipation while active, idle, or on standby.
Requires minimal external components, a single resistor, for best operation.
Supports 10/5-Gbps high-speed data transmission rates through 3-m USB 3.x cable

Ramuthevar Vadivel Murugan (2):
  dt-bindings: usb: Add USB PHY support for Intel LGM SoC
  usb: phy: Add USB3 PHY support for Intel LGM SoC

 .../devicetree/bindings/usb/intel,lgm-usb-phy.yaml |  53 ++++
 drivers/usb/phy/Kconfig                            |  11 +
 drivers/usb/phy/Makefile                           |   1 +
 drivers/usb/phy/phy-lgm-usb.c                      | 269 +++++++++++++++++++++
 4 files changed, 334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,lgm-usb-phy.yaml
 create mode 100644 drivers/usb/phy/phy-lgm-usb.c

-- 
2.11.0

