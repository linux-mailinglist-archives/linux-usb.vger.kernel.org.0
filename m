Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 027391F7252
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jun 2020 05:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgFLDBV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jun 2020 23:01:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:2926 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbgFLDBV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jun 2020 23:01:21 -0400
IronPort-SDR: tT/nT+aYZ3qRKKwxHqguD0Ixza69Ih+1J/M3Ek+aFowucsmOZPcgZ7RuUL8OgfHCPJvXDj8EQz
 Qcs1OibAC1xg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 20:01:20 -0700
IronPort-SDR: kRONiryIl7k1ZLF2oTkDgiHjjtz0CEGVLhDDccOIdDjcPUecHII6ew0MaeWKxtLkabQ/jBenHw
 BcZyPr3AX71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="scan'208";a="271782429"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga003.jf.intel.com with ESMTP; 11 Jun 2020 20:01:17 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, balbi@kernel.org, robh@kernel.org,
        p.zabel@pengutronix.de
Cc:     gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, yin1.li@intel.com,
        andriy.shevchenko@intel.com,
        "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v3 0/2] usb : phy: Add USB PHY support on Intel LGM SoC
Date:   Fri, 12 Jun 2020 10:59:39 +0800
Message-Id: <20200612025941.5484-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB PHY provides the optimized for low power dissipation while active, idle, or on standby.
Requires minimal external components, a single resistor, for best operation.
Supports 10/5-Gbps high-speed data transmission rates through 3-m USB 3.x cable
---
v3:
  - Andy's review comments update
  - hardcode return value changed to actual return value from the callee
  - add error check is fixed according to the above 
  - correct the assignment in redundant
  - combine the split line into one line
v2:
  - Address Phillip's review comments
  - replace devm_reset_control_get() by devm_reset_control_get_exclusive()
  - re-design the assert and deassert fucntion calls as per review comments
  - address kbuild bot warnings
  - add the comments
v1:
  - initial version

---
dt-bindings: usb: Add USB PHY support for Intel LGM SoC
v3:
  - No Change
v2:
  - No Change
v1:
  - initial version
 


Ramuthevar Vadivel Murugan (2):
  dt-bindings: usb: Add USB PHY support for Intel LGM SoC
  usb: phy: Add USB3 PHY support for Intel LGM SoC

 .../devicetree/bindings/usb/intel,lgm-usb-phy.yaml |  53 ++++
 drivers/usb/phy/Kconfig                            |  11 +
 drivers/usb/phy/Makefile                           |   1 +
 drivers/usb/phy/phy-lgm-usb.c                      | 278 +++++++++++++++++++++
 4 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/intel,lgm-usb-phy.yaml
 create mode 100644 drivers/usb/phy/phy-lgm-usb.c

-- 
2.11.0

