Return-Path: <linux-usb+bounces-27120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C00B2FF1A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 17:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08D5CAE3085
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 15:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8C033CEAA;
	Thu, 21 Aug 2025 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1ZKElmp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ABD2FB61C;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755790805; cv=none; b=M5WLVP1FwpRzYlINzPEu4Cr3iMBokyNch7CfqeQHjHNrSWrNt4bOwnN9shV4ZKDczDg9Uw0lL3NMgvAVOSu1Ox113LTudBgQ20MmGjHnYo1yU4CF1ErZmp/LqOg1dzXhgG60nqEt5r87AJuZKEqMTT9h7iM3/lGyem6K74AXmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755790805; c=relaxed/simple;
	bh=CRvRMMsvQMmwr7Q6LcV1f0nv/ORI6UNsyCo1rk+WUY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouDo3tBHLBGymvH7+pAuFDBEjkyi15Vf/PtH7o880jga/N25qmI3+IWJBvAQbyNK2WEflPjGjTzQw+ISaWcdO9gxicZ3Pg5nUGgsnhZUMoAqC6TqXhvDOrsFFJ9o8OCe4BiaktXqtQWvM+Btga5ZXOpUKOgzbgtaFcFMlmdl1yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1ZKElmp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F34AC4DE01;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=CRvRMMsvQMmwr7Q6LcV1f0nv/ORI6UNsyCo1rk+WUY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q1ZKElmpkPMJGEKvpqJHT0W+sF+Bve7f9lyRRU9MnIh8/Pwq+jUKJeUKXI4ySq0VM
	 HSCV6PMMCkCgXDcNpMchxtqq9/8MATkKLyJhIl0krHkTMQgCferFG3TZhfPihB6U0R
	 4OZj1aferTqyW/GaN45j2RqXhCVWkxOxWBXeC2+YmUo/rAd17RxaJKsfP5giaCVDIa
	 7uS9/GgV8RTd7xOe60T9nAW4qEaZozkHuJc0ncazvLEjFPs3vA0MCrTyFM36bF6yEu
	 xFy9ZlO7o4NmNfhpaswe/jouCYIYcpmjI4H12HvfrY5Xe/x9g9gmVSxqQo6HVRDN+a
	 TVdK/ZE+OyKrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A183CA0FE4;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:13 +0000
Subject: [PATCH RFC 21/22] phy: apple: Add Apple Type-C PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-21-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=88292; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=CRvRMMsvQMmwr7Q6LcV1f0nv/ORI6UNsyCo1rk+WUY0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy27Nzjq0L+PXQ/tGP3bwRUtlG4ovWLL7dVnvt3SNP4
 Q1Pz8ZYdpSyMIhxMMiKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmIruDkWF51JydUb8S3lrP
 TH3z5/TCKatW/lz7cKXKRZN1UbuEq/8eZWSYf43jXtRmd7uZawvKAs4JTLuR23E+0LgjR4F1v/6
 J+w94AQ==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Apple Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon SoCs.
The PHY handles muxing between these different protocols and also provides
the reset controller for the attached dwc3 USB controller.

There is no documentation available for this PHY and the entire sequence
of MMIO pokes has been figured out by tracing all MMIO access of Apple's
driver under a thin hypervisor and correlating the register reads/writes
to their kernel's debug output to find their names. Deviations from this
sequence generally results in the port not working or, especially when
the mode is switched to USB4 or Thunderbolt, to some watchdog resetting
the entire SoC.

This initial commit already introduces support for Display Port and
USB4/Thunderbolt but the drivers for these are not ready. We cannot
control the alternate mode negotiation and are stuck with whatever Apple's
firmware decides such that any DisplayPort or USB4/Thunderbolt device will
result in a correctly setup PHY but not be usable until the other drivers
are upstreamed as well.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 MAINTAINERS                |    1 +
 drivers/phy/Kconfig        |    1 +
 drivers/phy/Makefile       |    1 +
 drivers/phy/apple/Kconfig  |   14 +
 drivers/phy/apple/Makefile |    4 +
 drivers/phy/apple/atc.c    | 2537 ++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 2558 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 11a9b084a2e51d7b9b2e4c1777a2439df4a6858b..f17dc2140ef3aab88a51b710eaf5d8251df972d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2419,6 +2419,7 @@ F:	drivers/mfd/macsmc.c
 F:	drivers/nvme/host/apple.c
 F:	drivers/nvmem/apple-efuses.c
 F:	drivers/nvmem/apple-spmi-nvmem.c
+F:	drivers/phy/apple/
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/power/reset/macsmc-reboot.c
 F:	drivers/pwm/pwm-apple.c
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d20a0398f02550e938ce62633230d4..602339a1f14e35f1941880c71c4442b5fa73c9f9 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/apple/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac46807863c9ef990beb149082238ad16..e5933f7c38337e0745ec0e32bed0c544e4af383a 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   apple/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/apple/Kconfig b/drivers/phy/apple/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..67f460512592602ae60b2245b1562f5f667488c9
--- /dev/null
+++ b/drivers/phy/apple/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+config PHY_APPLE_ATC
+	tristate "Apple Type-C PHY"
+	depends on (ARM64 && ARCH_APPLE) || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on TYPEC
+	select GENERIC_PHY
+	select APPLE_TUNABLE
+	help
+	  Enable this to add support for the Apple Type-C PHY found in
+	  Apple Silicon M-series SoCs. This PHY supports USB2,
+	  USB3, USB4, Thunderbolt, and DisplayPort.
+
+	  If M is selected the module will be called 'phy-apple-atc'.
+
diff --git a/drivers/phy/apple/Makefile b/drivers/phy/apple/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..e02836a63df3b5324c5ac102b379b12a24494301
--- /dev/null
+++ b/drivers/phy/apple/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+
+obj-$(CONFIG_PHY_APPLE_ATC)		+= phy-apple-atc.o
+phy-apple-atc-y			:= atc.o
diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
new file mode 100644
index 0000000000000000000000000000000000000000..51c5d7880d9bb36089e286c159ccc3505c62ecff
--- /dev/null
+++ b/drivers/phy/apple/atc.c
@@ -0,0 +1,2537 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Apple Type-C PHY driver
+ *
+ * Copyright (C) The Asahi Linux Contributors
+ * Author: Sven Peter <sven@kernel.org>
+ */
+
+#include <dt-bindings/phy/phy.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/reset-controller.h>
+#include <linux/soc/apple/tunable.h>
+#include <linux/types.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_tbt.h>
+#include <linux/workqueue.h>
+
+#define AUSPLL_FSM_CTRL 0x1014
+
+#define AUSPLL_APB_CMD_OVERRIDE 0x2000
+#define AUSPLL_APB_CMD_OVERRIDE_REQ BIT(0)
+#define AUSPLL_APB_CMD_OVERRIDE_ACK BIT(1)
+#define AUSPLL_APB_CMD_OVERRIDE_UNK28 BIT(28)
+#define AUSPLL_APB_CMD_OVERRIDE_CMD GENMASK(27, 3)
+
+#define AUSPLL_FREQ_DESC_A 0x2080
+#define AUSPLL_FD_FREQ_COUNT_TARGET GENMASK(9, 0)
+#define AUSPLL_FD_FBDIVN_HALF BIT(10)
+#define AUSPLL_FD_REV_DIVN GENMASK(13, 11)
+#define AUSPLL_FD_KI_MAN GENMASK(17, 14)
+#define AUSPLL_FD_KI_EXP GENMASK(21, 18)
+#define AUSPLL_FD_KP_MAN GENMASK(25, 22)
+#define AUSPLL_FD_KP_EXP GENMASK(29, 26)
+#define AUSPLL_FD_KPKI_SCALE_HBW GENMASK(31, 30)
+
+#define AUSPLL_FREQ_DESC_B 0x2084
+#define AUSPLL_FD_FBDIVN_FRAC_DEN GENMASK(13, 0)
+#define AUSPLL_FD_FBDIVN_FRAC_NUM GENMASK(27, 14)
+
+#define AUSPLL_FREQ_DESC_C 0x2088
+#define AUSPLL_FD_SDM_SSC_STEP GENMASK(7, 0)
+#define AUSPLL_FD_SDM_SSC_EN BIT(8)
+#define AUSPLL_FD_PCLK_DIV_SEL GENMASK(13, 9)
+#define AUSPLL_FD_LFSDM_DIV GENMASK(15, 14)
+#define AUSPLL_FD_LFCLK_CTRL GENMASK(19, 16)
+#define AUSPLL_FD_VCLK_OP_DIVN GENMASK(21, 20)
+#define AUSPLL_FD_VCLK_PRE_DIVN BIT(22)
+
+#define AUSPLL_DCO_EFUSE_SPARE 0x222c
+#define AUSPLL_RODCO_ENCAP_EFUSE GENMASK(10, 9)
+#define AUSPLL_RODCO_BIAS_ADJUST_EFUSE GENMASK(14, 12)
+
+#define AUSPLL_FRACN_CAN 0x22a4
+#define AUSPLL_DLL_START_CAPCODE GENMASK(18, 17)
+
+#define AUSPLL_CLKOUT_MASTER 0x2200
+#define AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN BIT(2)
+#define AUSPLL_CLKOUT_MASTER_PCLK2_DRVR_EN BIT(4)
+#define AUSPLL_CLKOUT_MASTER_REFBUFCLK_DRVR_EN BIT(6)
+
+#define AUSPLL_CLKOUT_DIV 0x2208
+#define AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI GENMASK(20, 16)
+
+#define AUSPLL_BGR 0x2214
+#define AUSPLL_BGR_CTRL_AVAIL BIT(0)
+
+#define AUSPLL_CLKOUT_DTC_VREG 0x2220
+#define AUSPLL_DTC_VREG_ADJUST GENMASK(16, 14)
+#define AUSPLL_DTC_VREG_BYPASS BIT(7)
+
+#define AUSPLL_FREQ_CFG 0x2224
+#define AUSPLL_FREQ_REFCLK GENMASK(1, 0)
+
+#define AUS_COMMON_SHIM_BLK_VREG 0x0a04
+#define AUS_VREG_TRIM GENMASK(6, 2)
+
+#define AUS_UNK_A20 0x0a20
+#define AUS_UNK_A20_TX_CAL_CODE GENMASK(23, 20)
+
+#define ACIOPHY_CMN_SHM_STS_REG0 0x0a74
+#define ACIOPHY_CMN_SHM_STS_REG0_CMD_READY BIT(0)
+
+#define CIO3PLL_CLK_CTRL 0x2a00
+#define CIO3PLL_CLK_PCLK_EN BIT(1)
+#define CIO3PLL_CLK_REFCLK_EN BIT(5)
+
+#define CIO3PLL_DCO_NCTRL 0x2a38
+#define CIO3PLL_DCO_COARSEBIN_EFUSE0 GENMASK(6, 0)
+#define CIO3PLL_DCO_COARSEBIN_EFUSE1 GENMASK(23, 17)
+
+#define CIO3PLL_FRACN_CAN 0x2aa4
+#define CIO3PLL_DLL_CAL_START_CAPCODE GENMASK(18, 17)
+
+#define CIO3PLL_DTC_VREG 0x2a20
+#define CIO3PLL_DTC_VREG_ADJUST GENMASK(16, 14)
+
+#define ACIOPHY_CFG0 0x08
+#define ACIOPHY_CFG0_COMMON_BIG_OV BIT(1)
+#define ACIOPHY_CFG0_COMMON_SMALL_OV BIT(3)
+#define ACIOPHY_CFG0_COMMON_CLAMP_OV BIT(5)
+#define ACIOPHY_CFG0_RX_SMALL_OV GENMASK(9, 8)
+#define ACIOPHY_CFG0_RX_BIG_OV GENMASK(13, 12)
+#define ACIOPHY_CFG0_RX_CLAMP_OV GENMASK(17, 16)
+
+#define ACIOPHY_CROSSBAR 0x4c
+#define ACIOPHY_CROSSBAR_PROTOCOL GENMASK(4, 0)
+#define ACIOPHY_CROSSBAR_PROTOCOL_USB4 0x0
+#define ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED 0x1
+#define ACIOPHY_CROSSBAR_PROTOCOL_USB3 0xa
+#define ACIOPHY_CROSSBAR_PROTOCOL_USB3_SWAPPED 0xb
+#define ACIOPHY_CROSSBAR_PROTOCOL_USB3_DP 0x10
+#define ACIOPHY_CROSSBAR_PROTOCOL_USB3_DP_SWAPPED 0x11
+#define ACIOPHY_CROSSBAR_PROTOCOL_DP 0x14
+#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA GENMASK(16, 5)
+#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE 0x0000
+#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK100 0x100
+#define ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008 0x008
+#define ACIOPHY_CROSSBAR_DP_BOTH_PMA BIT(17)
+
+#define ACIOPHY_LANE_MODE 0x48
+#define ACIOPHY_LANE_MODE_RX0 GENMASK(2, 0)
+#define ACIOPHY_LANE_MODE_TX0 GENMASK(5, 3)
+#define ACIOPHY_LANE_MODE_RX1 GENMASK(8, 6)
+#define ACIOPHY_LANE_MODE_TX1 GENMASK(11, 9)
+#define ACIOPHY_LANE_MODE_USB4 0
+#define ACIOPHY_LANE_MODE_USB3 1
+#define ACIOPHY_LANE_MODE_DP 2
+#define ACIOPHY_LANE_MODE_OFF 3
+
+#define ACIOPHY_TOP_BIST_CIOPHY_CFG1 0x84
+#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN BIT(27)
+#define ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN BIT(28)
+
+#define ACIOPHY_TOP_BIST_OV_CFG 0x8c
+#define ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV BIT(13)
+#define ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV BIT(25)
+
+#define ACIOPHY_TOP_BIST_READ_CTRL 0x90
+#define ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE BIT(2)
+
+#define ACIOPHY_TOP_PHY_STAT 0x9c
+#define ACIOPHY_TOP_PHY_STAT_LN0_UNK0 BIT(0)
+#define ACIOPHY_TOP_PHY_STAT_LN0_UNK23 BIT(23)
+
+#define ACIOPHY_TOP_BIST_PHY_CFG0 0xa8
+#define ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N BIT(0)
+
+#define ACIOPHY_TOP_BIST_PHY_CFG1 0xac
+#define ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN GENMASK(13, 10)
+
+#define ACIOPHY_SLEEP_CTRL 0x1b0
+#define ACIOPHY_SLEEP_CTRL_TX_BIG_OV GENMASK(3, 2)
+#define ACIOPHY_SLEEP_CTRL_TX_SMALL_OV GENMASK(7, 6)
+#define ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV GENMASK(11, 10)
+
+#define ACIOPHY_PLL_PCTL_FSM_CTRL1 0x1014
+#define ACIOPHY_PLL_APB_REQ_OV_SEL GENMASK(21, 13)
+#define ACIOPHY_PLL_COMMON_CTRL 0x1028
+#define ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT BIT(24)
+
+#define ATCPHY_POWER_CTRL 0x20000
+#define ATCPHY_POWER_STAT 0x20004
+#define ATCPHY_POWER_SLEEP_SMALL BIT(0)
+#define ATCPHY_POWER_SLEEP_BIG BIT(1)
+#define ATCPHY_POWER_CLAMP_EN BIT(2)
+#define ATCPHY_POWER_APB_RESET_N BIT(3)
+#define ATCPHY_POWER_PHY_RESET_N BIT(4)
+
+#define ATCPHY_MISC 0x20008
+#define ATCPHY_MISC_RESET_N BIT(0)
+#define ATCPHY_MISC_LANE_SWAP BIT(2)
+
+#define ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0 0x7000
+#define DP_PMA_BYTECLK_RESET BIT(0)
+#define DP_MAC_DIV20_CLK_SEL BIT(1)
+#define DPTXPHY_PMA_LANE_RESET_N BIT(2)
+#define DPTXPHY_PMA_LANE_RESET_N_OV BIT(3)
+#define DPTX_PCLK1_SELECT GENMASK(6, 4)
+#define DPTX_PCLK2_SELECT GENMASK(9, 7)
+#define DPRX_PCLK_SELECT GENMASK(12, 10)
+#define DPTX_PCLK1_ENABLE BIT(13)
+#define DPTX_PCLK2_ENABLE BIT(14)
+#define DPRX_PCLK_ENABLE BIT(15)
+
+#define ACIOPHY_DP_PCLK_STAT 0x7044
+#define ACIOPHY_AUSPLL_LOCK BIT(3)
+
+#define LN0_AUSPMA_RX_TOP 0x9000
+#define LN0_AUSPMA_RX_EQ 0xA000
+#define LN0_AUSPMA_RX_SHM 0xB000
+#define LN0_AUSPMA_TX_TOP 0xC000
+#define LN0_AUSPMA_TX_SHM 0xD000
+
+#define LN1_AUSPMA_RX_TOP 0x10000
+#define LN1_AUSPMA_RX_EQ 0x11000
+#define LN1_AUSPMA_RX_SHM 0x12000
+#define LN1_AUSPMA_TX_TOP 0x13000
+#define LN1_AUSPMA_TX_SHM 0x14000
+
+#define LN_AUSPMA_RX_TOP_PMAFSM 0x0010
+#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV BIT(0)
+#define LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ BIT(9)
+
+#define LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE 0x00F0
+#define LN_RX_TXMODE BIT(0)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0 0x00
+#define LN_TX_CLK_EN BIT(20)
+#define LN_TX_CLK_EN_OV BIT(21)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1 0x04
+#define LN_RX_DIV20_RESET_N_OV BIT(29)
+#define LN_RX_DIV20_RESET_N BIT(30)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL2 0x08
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL3 0x0C
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL4 0x10
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL5 0x14
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL6 0x18
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL7 0x1C
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL8 0x20
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL9 0x24
+#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10 0x28
+#define LN_DTVREG_ADJUST GENMASK(31, 27)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11 0x2C
+#define LN_DTVREG_BIG_EN BIT(23)
+#define LN_DTVREG_BIG_EN_OV BIT(24)
+#define LN_DTVREG_SML_EN BIT(25)
+#define LN_DTVREG_SML_EN_OV BIT(26)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12 0x30
+#define LN_TX_BYTECLK_RESET_SYNC_CLR BIT(22)
+#define LN_TX_BYTECLK_RESET_SYNC_CLR_OV BIT(23)
+#define LN_TX_BYTECLK_RESET_SYNC_EN BIT(24)
+#define LN_TX_BYTECLK_RESET_SYNC_EN_OV BIT(25)
+#define LN_TX_HRCLK_SEL BIT(28)
+#define LN_TX_HRCLK_SEL_OV BIT(29)
+#define LN_TX_PBIAS_EN BIT(30)
+#define LN_TX_PBIAS_EN_OV BIT(31)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13 0x34
+#define LN_TX_PRE_EN BIT(0)
+#define LN_TX_PRE_EN_OV BIT(1)
+#define LN_TX_PST1_EN BIT(2)
+#define LN_TX_PST1_EN_OV BIT(3)
+#define LN_DTVREG_ADJUST_OV BIT(15)
+
+#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL14A 0x38
+#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL14B 0x3C
+#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL15A 0x40
+#define LN_AUSPMA_RX_SHM_TJ_UNK_CTRL15B 0x44
+#define LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16 0x48
+#define LN_RXTERM_EN BIT(21)
+#define LN_RXTERM_EN_OV BIT(22)
+#define LN_RXTERM_PULLUP_LEAK_EN BIT(23)
+#define LN_RXTERM_PULLUP_LEAK_EN_OV BIT(24)
+#define LN_TX_CAL_CODE GENMASK(29, 25)
+#define LN_TX_CAL_CODE_OV BIT(30)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17 0x4C
+#define LN_TX_MARGIN GENMASK(19, 15)
+#define LN_TX_MARGIN_OV BIT(20)
+#define LN_TX_MARGIN_LSB BIT(21)
+#define LN_TX_MARGIN_LSB_OV BIT(22)
+#define LN_TX_MARGIN_P1 GENMASK(26, 23)
+#define LN_TX_MARGIN_P1_OV BIT(27)
+#define LN_TX_MARGIN_P1_LSB GENMASK(29, 28)
+#define LN_TX_MARGIN_P1_LSB_OV BIT(30)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18 0x50
+#define LN_TX_P1_CODE GENMASK(3, 0)
+#define LN_TX_P1_CODE_OV BIT(4)
+#define LN_TX_P1_LSB_CODE GENMASK(6, 5)
+#define LN_TX_P1_LSB_CODE_OV BIT(7)
+#define LN_TX_MARGIN_PRE GENMASK(10, 8)
+#define LN_TX_MARGIN_PRE_OV BIT(11)
+#define LN_TX_MARGIN_PRE_LSB GENMASK(13, 12)
+#define LN_TX_MARGIN_PRE_LSB_OV BIT(14)
+#define LN_TX_PRE_LSB_CODE GENMASK(16, 15)
+#define LN_TX_PRE_LSB_CODE_OV BIT(17)
+#define LN_TX_PRE_CODE GENMASK(21, 18)
+#define LN_TX_PRE_CODE_OV BIT(22)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19 0x54
+#define LN_TX_TEST_EN BIT(21)
+#define LN_TX_TEST_EN_OV BIT(22)
+#define LN_TX_EN BIT(23)
+#define LN_TX_EN_OV BIT(24)
+#define LN_TX_CLK_DLY_CTRL_TAPGEN GENMASK(27, 25)
+#define LN_TX_CLK_DIV2_EN BIT(28)
+#define LN_TX_CLK_DIV2_EN_OV BIT(29)
+#define LN_TX_CLK_DIV2_RST BIT(30)
+#define LN_TX_CLK_DIV2_RST_OV BIT(31)
+
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL20 0x58
+#define LN_AUSPMA_RX_SHM_TJ_RXA_UNK_CTRL21 0x5C
+#define LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22 0x60
+#define LN_VREF_ADJUST_GRAY GENMASK(11, 7)
+#define LN_VREF_ADJUST_GRAY_OV BIT(12)
+#define LN_VREF_BIAS_SEL GENMASK(14, 13)
+#define LN_VREF_BIAS_SEL_OV BIT(15)
+#define LN_VREF_BOOST_EN BIT(16)
+#define LN_VREF_BOOST_EN_OV BIT(17)
+#define LN_VREF_EN BIT(18)
+#define LN_VREF_EN_OV BIT(19)
+#define LN_VREF_LPBKIN_DATA GENMASK(29, 28)
+#define LN_VREF_TEST_RXLPBKDT_EN BIT(30)
+#define LN_VREF_TEST_RXLPBKDT_EN_OV BIT(31)
+
+#define LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0 0x00
+#define LN_BYTECLK_RESET_SYNC_EN_OV BIT(2)
+#define LN_BYTECLK_RESET_SYNC_EN BIT(3)
+#define LN_BYTECLK_RESET_SYNC_CLR_OV BIT(4)
+#define LN_BYTECLK_RESET_SYNC_CLR BIT(5)
+#define LN_BYTECLK_RESET_SYNC_SEL_OV BIT(6)
+
+#define LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1 0x04
+#define LN_TXA_DIV2_EN_OV BIT(8)
+#define LN_TXA_DIV2_EN BIT(9)
+#define LN_TXA_DIV2_RESET_OV BIT(10)
+#define LN_TXA_DIV2_RESET BIT(11)
+#define LN_TXA_CLK_EN_OV BIT(22)
+#define LN_TXA_CLK_EN BIT(23)
+
+#define LN_AUSPMA_TX_SHM_TXA_IMP_REG0 0x08
+#define LN_TXA_CAL_CTRL_OV BIT(0)
+#define LN_TXA_CAL_CTRL GENMASK(18, 1)
+#define LN_TXA_CAL_CTRL_BASE_OV BIT(19)
+#define LN_TXA_CAL_CTRL_BASE GENMASK(23, 20)
+#define LN_TXA_HIZ_OV BIT(29)
+#define LN_TXA_HIZ BIT(30)
+
+#define LN_AUSPMA_TX_SHM_TXA_IMP_REG1 0x0C
+#define LN_AUSPMA_TX_SHM_TXA_IMP_REG2 0x10
+#define LN_TXA_MARGIN_OV BIT(0)
+#define LN_TXA_MARGIN GENMASK(18, 1)
+#define LN_TXA_MARGIN_2R_OV BIT(19)
+#define LN_TXA_MARGIN_2R BIT(20)
+
+#define LN_AUSPMA_TX_SHM_TXA_IMP_REG3 0x14
+#define LN_TXA_MARGIN_POST_OV BIT(0)
+#define LN_TXA_MARGIN_POST GENMASK(10, 1)
+#define LN_TXA_MARGIN_POST_2R_OV BIT(11)
+#define LN_TXA_MARGIN_POST_2R BIT(12)
+#define LN_TXA_MARGIN_POST_4R_OV BIT(13)
+#define LN_TXA_MARGIN_POST_4R BIT(14)
+#define LN_TXA_MARGIN_PRE_OV BIT(15)
+#define LN_TXA_MARGIN_PRE GENMASK(21, 16)
+#define LN_TXA_MARGIN_PRE_2R_OV BIT(22)
+#define LN_TXA_MARGIN_PRE_2R BIT(23)
+#define LN_TXA_MARGIN_PRE_4R_OV BIT(24)
+#define LN_TXA_MARGIN_PRE_4R BIT(25)
+
+#define LN_AUSPMA_TX_SHM_TXA_UNK_REG0 0x18
+#define LN_AUSPMA_TX_SHM_TXA_UNK_REG1 0x1C
+#define LN_AUSPMA_TX_SHM_TXA_UNK_REG2 0x20
+
+#define LN_AUSPMA_TX_SHM_TXA_LDOCLK 0x24
+#define LN_LDOCLK_BYPASS_SML_OV BIT(8)
+#define LN_LDOCLK_BYPASS_SML BIT(9)
+#define LN_LDOCLK_BYPASS_BIG_OV BIT(10)
+#define LN_LDOCLK_BYPASS_BIG BIT(11)
+#define LN_LDOCLK_EN_SML_OV BIT(12)
+#define LN_LDOCLK_EN_SML BIT(13)
+#define LN_LDOCLK_EN_BIG_OV BIT(14)
+#define LN_LDOCLK_EN_BIG BIT(15)
+
+/* LPDPTX registers */
+#define LPDPTX_AUX_CFG_BLK_AUX_CTRL 0x0000
+#define LPDPTX_BLK_AUX_CTRL_PWRDN BIT(4)
+#define LPDPTX_BLK_AUX_RXOFFSET GENMASK(25, 22)
+
+#define LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL 0x0008
+
+#define LPDPTX_AUX_CFG_BLK_AUX_MARGIN 0x000c
+#define LPDPTX_MARGIN_RCAL_RXOFFSET_EN BIT(5)
+#define LPDPTX_AUX_MARGIN_RCAL_TXSWING GENMASK(10, 6)
+
+#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0 0x0204
+#define LPDPTX_CFG_PMA_AUX_SEL_LF_DATA BIT(15)
+
+#define LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1 0x0208
+#define LPDPTX_CFG_PMA_PHYS_ADJ GENMASK(22, 20)
+#define LPDPTX_CFG_PMA_PHYS_ADJ_OV BIT(19)
+
+#define LPDPTX_AUX_CONTROL 0x4000
+#define LPDPTX_AUX_PWN_DOWN 0x10
+#define LPDPTX_AUX_CLAMP_EN 0x04
+#define LPDPTX_SLEEP_B_BIG_IN 0x02
+#define LPDPTX_SLEEP_B_SML_IN 0x01
+#define LPDPTX_TXTERM_CODEMSB 0x400
+#define LPDPTX_TXTERM_CODE GENMASK(9, 5)
+
+/* pipehandler registers */
+#define PIPEHANDLER_OVERRIDE 0x00
+#define PIPEHANDLER_OVERRIDE_RXVALID BIT(0)
+#define PIPEHANDLER_OVERRIDE_RXDETECT BIT(2)
+
+#define PIPEHANDLER_OVERRIDE_VALUES 0x04
+#define PIPEHANDLER_OVERRIDE_VAL_RXDETECT0 BIT(1)
+#define PIPEHANDLER_OVERRIDE_VAL_RXDETECT1 BIT(2)
+#define PIPEHANDLER_OVERRIDE_VAL_PHY_STATUS BIT(4)
+
+#define PIPEHANDLER_MUX_CTRL 0x0c
+#define PIPEHANDLED_MUX_CTRL_CLK GENMASK(5, 3)
+#define PIPEHANDLED_MUX_CTRL_DATA GENMASK(2, 0)
+#define PIPEHANDLED_MUX_CTRL_CLK_OFF 0
+#define PIPEHANDLED_MUX_CTRL_CLK_USB3 1
+#define PIPEHANDLED_MUX_CTRL_CLK_USB4 2
+#define PIPEHANDLED_MUX_CTRL_CLK_DUMMY 4
+
+#define PIPEHANDLED_MUX_CTRL_DATA_USB3 0
+#define PIPEHANDLED_MUX_CTRL_DATA_USB4 1
+#define PIPEHANDLED_MUX_CTRL_DATA_DUMMY 2
+
+#define PIPEHANDLER_LOCK_REQ 0x10
+#define PIPEHANDLER_LOCK_ACK 0x14
+#define PIPEHANDLER_LOCK_EN BIT(0)
+
+#define PIPEHANDLER_AON_GEN 0x1C
+#define PIPEHANDLER_AON_GEN_DWC3_FORCE_CLAMP_EN BIT(4)
+#define PIPEHANDLER_AON_GEN_DWC3_RESET_N BIT(0)
+
+#define PIPEHANDLER_NONSELECTED_OVERRIDE 0x20
+#define PIPEHANDLER_NATIVE_RESET BIT(12)
+#define PIPEHANDLER_DUMMY_PHY_EN BIT(15)
+#define PIPEHANDLER_NATIVE_POWER_DOWN GENMASK(3, 0)
+
+#define PIPEHANDLER_UNK_2C 0x2c
+
+/* USB2 PHY regs */
+#define USB2PHY_USBCTL 0x00
+#define USB2PHY_USBCTL_RUN 2
+#define USB2PHY_USBCTL_ISOLATION 4
+
+#define USB2PHY_CTL 0x04
+#define USB2PHY_CTL_RESET BIT(0)
+#define USB2PHY_CTL_PORT_RESET BIT(1)
+#define USB2PHY_CTL_APB_RESET_N BIT(2)
+#define USB2PHY_CTL_SIDDQ BIT(3)
+
+#define USB2PHY_SIG 0x08
+#define USB2PHY_SIG_VBUSDET_FORCE_VAL BIT(0)
+#define USB2PHY_SIG_VBUSDET_FORCE_EN BIT(1)
+#define USB2PHY_SIG_VBUSVLDEXT_FORCE_VAL BIT(2)
+#define USB2PHY_SIG_VBUSVLDEXT_FORCE_EN BIT(3)
+#define USB2PHY_SIG_HOST (7 << 12)
+
+#define USB2PHY_MISCTUNE 0x1c
+#define USB2PHY_MISCTUNE_APBCLK_GATE_OFF BIT(29)
+#define USB2PHY_MISCTUNE_REFCLK_GATE_OFF BIT(30)
+
+enum atcphy_dp_link_rate {
+	ATCPHY_DP_LINK_RATE_RBR,
+	ATCPHY_DP_LINK_RATE_HBR,
+	ATCPHY_DP_LINK_RATE_HBR2,
+	ATCPHY_DP_LINK_RATE_HBR3,
+};
+
+enum atcphy_pipehandler_state {
+	ATCPHY_PIPEHANDLER_STATE_INVALID,
+	ATCPHY_PIPEHANDLER_STATE_DUMMY,
+	ATCPHY_PIPEHANDLER_STATE_USB3,
+	ATCPHY_PIPEHANDLER_STATE_USB4,
+};
+
+enum atcphy_mode {
+	APPLE_ATCPHY_MODE_OFF,
+	APPLE_ATCPHY_MODE_USB2,
+	APPLE_ATCPHY_MODE_USB3,
+	APPLE_ATCPHY_MODE_USB3_DP,
+	APPLE_ATCPHY_MODE_TBT,
+	APPLE_ATCPHY_MODE_USB4,
+	APPLE_ATCPHY_MODE_DP,
+};
+
+enum atcphy_lane {
+	APPLE_ATCPHY_LANE_0,
+	APPLE_ATCPHY_LANE_1,
+};
+
+struct atcphy_dp_link_rate_configuration {
+	u16 freqinit_count_target;
+	u16 fbdivn_frac_den;
+	u16 fbdivn_frac_num;
+	u16 pclk_div_sel;
+	u8 lfclk_ctrl;
+	u8 vclk_op_divn;
+	bool plla_clkout_vreg_bypass;
+	bool txa_ldoclk_bypass;
+	bool txa_div2_en;
+};
+
+struct atcphy_mode_configuration {
+	u32 crossbar;
+	u32 crossbar_dp_single_pma;
+	bool crossbar_dp_both_pma;
+	u32 lane_mode[2];
+	bool dp_lane[2];
+	bool set_swap;
+};
+
+struct apple_atcphy_hw {
+	unsigned int dp_only : 1; /* hard-wired to internal DP->HDMI converter */
+};
+
+struct apple_atcphy {
+	struct device_node *np;
+	struct device *dev;
+	const struct apple_atcphy_hw *hw;
+
+	/* tunables provided by firmware through the device tree */
+	struct {
+		struct apple_tunable fuses;
+		struct apple_tunable axi2af;
+		struct apple_tunable common;
+		struct apple_tunable lane_usb3[2];
+		struct apple_tunable lane_displayport[2];
+		struct apple_tunable lane_usb4[2];
+	} tunables;
+
+	enum atcphy_mode mode;
+	enum atcphy_mode target_mode;
+	enum atcphy_pipehandler_state pipehandler_state;
+	bool swap_lanes;
+	int dp_link_rate;
+	bool pipehandler_up;
+	bool is_host_mode;
+	bool dwc3_running;
+
+	struct {
+		void __iomem *core;
+		void __iomem *axi2af;
+		void __iomem *usb2phy;
+		void __iomem *pipehandler;
+		void __iomem *lpdptx;
+	} regs;
+
+	struct device **pd_dev;
+	struct device_link **pd_link;
+	int pd_count;
+
+	struct phy *phy_usb2;
+	struct phy *phy_usb3;
+	struct phy *phy_dp;
+	struct phy_provider *phy_provider;
+	struct reset_controller_dev rcdev;
+	struct typec_switch *sw;
+	struct typec_mux *mux;
+
+	struct mutex lock;
+};
+
+static const struct {
+	const struct atcphy_mode_configuration normal;
+	const struct atcphy_mode_configuration swapped;
+	bool enable_dp_aux;
+	enum atcphy_pipehandler_state pipehandler_state;
+} atcphy_modes[] = {
+	[APPLE_ATCPHY_MODE_OFF] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_OFF, ACIOPHY_LANE_MODE_OFF},
+			.dp_lane = {false, false},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3_SWAPPED,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_OFF, ACIOPHY_LANE_MODE_OFF},
+			.dp_lane = {false, false},
+			.set_swap = false, /* doesn't matter since the SS lanes are off */
+		},
+		.enable_dp_aux = false,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_DUMMY,
+	},
+	[APPLE_ATCPHY_MODE_USB2] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_OFF, ACIOPHY_LANE_MODE_OFF},
+			.dp_lane = {false, false},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3_SWAPPED,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_OFF, ACIOPHY_LANE_MODE_OFF},
+			.dp_lane = {false, false},
+			.set_swap = false, /* doesn't matter since the SS lanes are off */
+		},
+		.enable_dp_aux = false,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_DUMMY,
+	},
+	[APPLE_ATCPHY_MODE_USB3] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_USB3, ACIOPHY_LANE_MODE_OFF},
+			.dp_lane = {false, false},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3_SWAPPED,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_OFF, ACIOPHY_LANE_MODE_USB3},
+			.dp_lane = {false, false},
+			.set_swap = true,
+		},
+		.enable_dp_aux = false,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_USB3,
+	},
+	[APPLE_ATCPHY_MODE_USB3_DP] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3_DP,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_USB3, ACIOPHY_LANE_MODE_DP},
+			.dp_lane = {false, true},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB3_DP_SWAPPED,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_DP, ACIOPHY_LANE_MODE_USB3},
+			.dp_lane = {true, false},
+			.set_swap = true,
+		},
+		.enable_dp_aux = true,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_USB3,
+	},
+	[APPLE_ATCPHY_MODE_TBT] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB4,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_USB4, ACIOPHY_LANE_MODE_USB4},
+			.dp_lane = {false, false},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_USB4, ACIOPHY_LANE_MODE_USB4},
+			.dp_lane = {false, false},
+			.set_swap = false, /* intentionally false */
+		},
+		.enable_dp_aux = false,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_DUMMY,
+	},
+	[APPLE_ATCPHY_MODE_USB4] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB4,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_USB4, ACIOPHY_LANE_MODE_USB4},
+			.dp_lane = {false, false},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_USB4_SWAPPED,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_NONE,
+			.crossbar_dp_both_pma = false,
+			.lane_mode = {ACIOPHY_LANE_MODE_USB4, ACIOPHY_LANE_MODE_USB4},
+			.dp_lane = {false, false},
+			.set_swap = false, /* intentionally false */
+		},
+		.enable_dp_aux = false,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_USB4,
+	},
+	[APPLE_ATCPHY_MODE_DP] = {
+		.normal = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_DP,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK100,
+			.crossbar_dp_both_pma = true,
+			.lane_mode = {ACIOPHY_LANE_MODE_DP, ACIOPHY_LANE_MODE_DP},
+			.dp_lane = {true, true},
+			.set_swap = false,
+		},
+		.swapped = {
+			.crossbar = ACIOPHY_CROSSBAR_PROTOCOL_DP,
+			.crossbar_dp_single_pma = ACIOPHY_CROSSBAR_DP_SINGLE_PMA_UNK008,
+			.crossbar_dp_both_pma = false, /* intentionally false */
+			.lane_mode = {ACIOPHY_LANE_MODE_DP, ACIOPHY_LANE_MODE_DP},
+			.dp_lane = {true, true},
+			.set_swap = false, /* intentionally false */
+		},
+		.enable_dp_aux = true,
+		.pipehandler_state = ATCPHY_PIPEHANDLER_STATE_DUMMY,
+	},
+};
+
+static const struct atcphy_dp_link_rate_configuration dp_lr_config[] = {
+	[ATCPHY_DP_LINK_RATE_RBR] = {
+		.freqinit_count_target = 0x21c,
+		.fbdivn_frac_den = 0x0,
+		.fbdivn_frac_num = 0x0,
+		.pclk_div_sel = 0x13,
+		.lfclk_ctrl = 0x5,
+		.vclk_op_divn = 0x2,
+		.plla_clkout_vreg_bypass = true,
+		.txa_ldoclk_bypass = true,
+		.txa_div2_en = true,
+	},
+	[ATCPHY_DP_LINK_RATE_HBR] = {
+		.freqinit_count_target = 0x1c2,
+		.fbdivn_frac_den = 0x3ffe,
+		.fbdivn_frac_num = 0x1fff,
+		.pclk_div_sel = 0x9,
+		.lfclk_ctrl = 0x5,
+		.vclk_op_divn = 0x2,
+		.plla_clkout_vreg_bypass = true,
+		.txa_ldoclk_bypass = true,
+		.txa_div2_en = false,
+	},
+	[ATCPHY_DP_LINK_RATE_HBR2] = {
+		.freqinit_count_target = 0x1c2,
+		.fbdivn_frac_den = 0x3ffe,
+		.fbdivn_frac_num = 0x1fff,
+		.pclk_div_sel = 0x4,
+		.lfclk_ctrl = 0x5,
+		.vclk_op_divn = 0x0,
+		.plla_clkout_vreg_bypass = true,
+		.txa_ldoclk_bypass = true,
+		.txa_div2_en = false,
+	},
+	[ATCPHY_DP_LINK_RATE_HBR3] = {
+		.freqinit_count_target = 0x2a3,
+		.fbdivn_frac_den = 0x3ffc,
+		.fbdivn_frac_num = 0x2ffd,
+		.pclk_div_sel = 0x4,
+		.lfclk_ctrl = 0x6,
+		.vclk_op_divn = 0x0,
+		.plla_clkout_vreg_bypass = false,
+		.txa_ldoclk_bypass = false,
+		.txa_div2_en = false,
+	},
+};
+
+static void atcphy_configure_pipehandler_dummy(struct apple_atcphy *atcphy);
+static void atcphy_configure_pipehandler(struct apple_atcphy *atcphy);
+static void atcphy_usb2_power_on(struct apple_atcphy *atcphy);
+static void atcphy_usb2_power_off(struct apple_atcphy *atcphy);
+
+static inline void mask32(void __iomem *reg, u32 mask, u32 set)
+{
+	u32 value = readl(reg);
+
+	value &= ~mask;
+	value |= set;
+	writel(value, reg);
+}
+
+static inline void core_mask32(struct apple_atcphy *atcphy, u32 reg, u32 mask,
+			       u32 set)
+{
+	mask32(atcphy->regs.core + reg, mask, set);
+}
+
+static inline void set32(void __iomem *reg, u32 set)
+{
+	mask32(reg, 0, set);
+}
+
+static inline void core_set32(struct apple_atcphy *atcphy, u32 reg, u32 set)
+{
+	core_mask32(atcphy, reg, 0, set);
+}
+
+static inline void clear32(void __iomem *reg, u32 clear)
+{
+	mask32(reg, clear, 0);
+}
+
+static inline void core_clear32(struct apple_atcphy *atcphy, u32 reg, u32 clear)
+{
+	core_mask32(atcphy, reg, clear, 0);
+}
+
+static void atcphy_apply_tunables(struct apple_atcphy *atcphy,
+				  enum atcphy_mode mode)
+{
+	const int lane0 = atcphy->swap_lanes ? 1 : 0;
+	const int lane1 = atcphy->swap_lanes ? 0 : 1;
+
+	apple_apply_tunable(atcphy->regs.core, &atcphy->tunables.fuses);
+	apple_apply_tunable(atcphy->regs.axi2af, &atcphy->tunables.axi2af);
+	apple_apply_tunable(atcphy->regs.core, &atcphy->tunables.common);
+
+	switch (mode) {
+	case APPLE_ATCPHY_MODE_USB3:
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_usb3[lane0]);
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_usb3[lane1]);
+		break;
+
+	case APPLE_ATCPHY_MODE_USB3_DP:
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_usb3[lane0]);
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_displayport[lane1]);
+		break;
+
+	case APPLE_ATCPHY_MODE_DP:
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_displayport[lane0]);
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_displayport[lane1]);
+		break;
+
+	case APPLE_ATCPHY_MODE_TBT:
+	case APPLE_ATCPHY_MODE_USB4:
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_usb4[lane0]);
+		apple_apply_tunable(atcphy->regs.core,
+				    &atcphy->tunables.lane_usb4[lane1]);
+		break;
+
+	case APPLE_ATCPHY_MODE_OFF:
+		break;
+	case APPLE_ATCPHY_MODE_USB2:
+		break;
+	}
+}
+
+static void atcphy_configure_lanes(struct apple_atcphy *atcphy,
+				   enum atcphy_mode mode)
+{
+	const struct atcphy_mode_configuration *mode_cfg;
+
+	if (atcphy->swap_lanes)
+		mode_cfg = &atcphy_modes[mode].swapped;
+	else
+		mode_cfg = &atcphy_modes[mode].normal;
+
+	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_RX0,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_RX0, mode_cfg->lane_mode[0]));
+	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_TX0,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_TX0, mode_cfg->lane_mode[0]));
+	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_RX1,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_RX1, mode_cfg->lane_mode[1]));
+	core_mask32(atcphy, ACIOPHY_LANE_MODE, ACIOPHY_LANE_MODE_TX1,
+		    FIELD_PREP(ACIOPHY_LANE_MODE_TX1, mode_cfg->lane_mode[1]));
+	core_mask32(atcphy, ACIOPHY_CROSSBAR, ACIOPHY_CROSSBAR_PROTOCOL,
+		    FIELD_PREP(ACIOPHY_CROSSBAR_PROTOCOL, mode_cfg->crossbar));
+
+	if (mode_cfg->set_swap)
+		core_set32(atcphy, ATCPHY_MISC, ATCPHY_MISC_LANE_SWAP);
+	else
+		core_clear32(atcphy, ATCPHY_MISC, ATCPHY_MISC_LANE_SWAP);
+
+	core_mask32(atcphy, ACIOPHY_CROSSBAR, ACIOPHY_CROSSBAR_DP_SINGLE_PMA,
+		    FIELD_PREP(ACIOPHY_CROSSBAR_DP_SINGLE_PMA,
+			       mode_cfg->crossbar_dp_single_pma));
+	if (mode_cfg->crossbar_dp_both_pma)
+		core_set32(atcphy, ACIOPHY_CROSSBAR,
+			   ACIOPHY_CROSSBAR_DP_BOTH_PMA);
+	else
+		core_clear32(atcphy, ACIOPHY_CROSSBAR,
+			     ACIOPHY_CROSSBAR_DP_BOTH_PMA);
+
+	if (mode_cfg->dp_lane[0]) {
+		core_set32(atcphy, LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+		core_clear32(atcphy,
+			     LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ);
+	} else {
+		core_clear32(atcphy,
+			     LN0_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+	}
+
+	if (mode_cfg->dp_lane[1]) {
+		core_set32(atcphy, LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			   LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+		core_clear32(atcphy,
+			     LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_REQ);
+	} else {
+		core_clear32(atcphy,
+			     LN1_AUSPMA_RX_TOP + LN_AUSPMA_RX_TOP_PMAFSM,
+			     LN_AUSPMA_RX_TOP_PMAFSM_PCS_OV);
+		udelay(10);
+	}
+}
+
+static void atcphy_enable_dp_aux(struct apple_atcphy *atcphy)
+{
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		   DPTXPHY_PMA_LANE_RESET_N);
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		   DPTXPHY_PMA_LANE_RESET_N_OV);
+
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		    DPRX_PCLK_SELECT, FIELD_PREP(DPRX_PCLK_SELECT, 1));
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		   DPRX_PCLK_ENABLE);
+
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		    DPTX_PCLK1_SELECT, FIELD_PREP(DPTX_PCLK1_SELECT, 1));
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		   DPTX_PCLK1_ENABLE);
+
+	core_mask32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		    DPTX_PCLK2_SELECT, FIELD_PREP(DPTX_PCLK2_SELECT, 1));
+	core_set32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		   DPTX_PCLK2_ENABLE);
+
+	core_set32(atcphy, ACIOPHY_PLL_COMMON_CTRL,
+		   ACIOPHY_PLL_WAIT_FOR_CMN_READY_BEFORE_RESET_EXIT);
+
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_SML_IN);
+	udelay(10);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_SLEEP_B_BIG_IN);
+	udelay(10);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL,
+		LPDPTX_TXTERM_CODEMSB);
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_TXTERM_CODE,
+	       FIELD_PREP(LPDPTX_TXTERM_CODE, 0x16));
+
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_LDO_CTRL, 0x1c00);
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1,
+	       LPDPTX_CFG_PMA_PHYS_ADJ, FIELD_PREP(LPDPTX_CFG_PMA_PHYS_ADJ, 5));
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG1,
+	      LPDPTX_CFG_PMA_PHYS_ADJ_OV);
+
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN,
+		LPDPTX_MARGIN_RCAL_RXOFFSET_EN);
+
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL,
+		LPDPTX_BLK_AUX_CTRL_PWRDN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_SHM_CFG_BLK_AUX_CTRL_REG0,
+	      LPDPTX_CFG_PMA_AUX_SEL_LF_DATA);
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL,
+	       LPDPTX_BLK_AUX_RXOFFSET, FIELD_PREP(LPDPTX_BLK_AUX_RXOFFSET, 3));
+
+	mask32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_MARGIN,
+	       LPDPTX_AUX_MARGIN_RCAL_TXSWING,
+	       FIELD_PREP(LPDPTX_AUX_MARGIN_RCAL_TXSWING, 12));
+
+	atcphy->dp_link_rate = -1;
+}
+
+static void atcphy_disable_dp_aux(struct apple_atcphy *atcphy)
+{
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_PWN_DOWN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CFG_BLK_AUX_CTRL,
+	      LPDPTX_BLK_AUX_CTRL_PWRDN);
+	set32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL, LPDPTX_AUX_CLAMP_EN);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL,
+		LPDPTX_SLEEP_B_SML_IN);
+	udelay(10);
+	clear32(atcphy->regs.lpdptx + LPDPTX_AUX_CONTROL,
+		LPDPTX_SLEEP_B_BIG_IN);
+	udelay(10);
+
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		     DPTXPHY_PMA_LANE_RESET_N);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		     DPRX_PCLK_ENABLE);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		     DPTX_PCLK1_ENABLE);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		     DPTX_PCLK2_ENABLE);
+}
+
+static int
+atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lane lane,
+			 const struct atcphy_dp_link_rate_configuration *cfg)
+{
+	void __iomem *tx_shm, *rx_shm, *rx_top;
+	unsigned int tx_cal_code;
+
+	lockdep_assert_held(&atcphy->lock);
+
+	switch (lane) {
+	case APPLE_ATCPHY_LANE_0:
+		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
+		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
+		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
+		break;
+	case APPLE_ATCPHY_LANE_1:
+		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
+		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
+		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_SML_OV);
+	udelay(10);
+
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_BIG);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK, LN_LDOCLK_EN_BIG_OV);
+	udelay(10);
+
+	if (cfg->txa_ldoclk_bypass) {
+		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+		      LN_LDOCLK_BYPASS_SML);
+		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+		      LN_LDOCLK_BYPASS_SML_OV);
+		udelay(10);
+
+		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+		      LN_LDOCLK_BYPASS_BIG);
+		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+		      LN_LDOCLK_BYPASS_BIG_OV);
+		udelay(10);
+	} else {
+		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+			LN_LDOCLK_BYPASS_SML);
+		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+			LN_LDOCLK_BYPASS_SML_OV);
+		udelay(10);
+
+		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+			LN_LDOCLK_BYPASS_BIG);
+		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK,
+			LN_LDOCLK_BYPASS_BIG_OV);
+		udelay(10);
+	}
+
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
+	      LN_BYTECLK_RESET_SYNC_SEL_OV);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
+	      LN_BYTECLK_RESET_SYNC_EN);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
+	      LN_BYTECLK_RESET_SYNC_EN_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
+		LN_BYTECLK_RESET_SYNC_CLR);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG0,
+	      LN_BYTECLK_RESET_SYNC_CLR_OV);
+
+	if (cfg->txa_div2_en)
+		set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
+		      LN_TXA_DIV2_EN);
+	else
+		clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
+			LN_TXA_DIV2_EN);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_DIV2_EN_OV);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_CLK_EN);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_CLK_EN_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1, LN_TXA_DIV2_RESET);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_CFG_MAIN_REG1,
+	      LN_TXA_DIV2_RESET_OV);
+
+	mask32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_BASE,
+	       FIELD_PREP(LN_TXA_CAL_CTRL_BASE, 0xf));
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_BASE_OV);
+
+	tx_cal_code = FIELD_GET(AUS_UNK_A20_TX_CAL_CODE,
+				readl(atcphy->regs.core + AUS_UNK_A20));
+	mask32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL,
+	       FIELD_PREP(LN_TXA_CAL_CTRL, (1 << tx_cal_code) - 1));
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_CAL_CTRL_OV);
+
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_2R);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG2, LN_TXA_MARGIN_2R_OV);
+
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_2R_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_POST_4R_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_2R_OV);
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG3, LN_TXA_MARGIN_PRE_4R_OV);
+
+	clear32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_HIZ);
+	set32(tx_shm + LN_AUSPMA_TX_SHM_TXA_IMP_REG0, LN_TXA_HIZ_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1,
+		LN_RX_DIV20_RESET_N);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1,
+	      LN_RX_DIV20_RESET_N_OV);
+	udelay(10);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_AFE_CTRL1, LN_RX_DIV20_RESET_N);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
+	      LN_TX_BYTECLK_RESET_SYNC_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
+	      LN_TX_BYTECLK_RESET_SYNC_EN_OV);
+
+	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_TX_CAL_CODE,
+	       FIELD_PREP(LN_TX_CAL_CODE, tx_cal_code));
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_TX_CAL_CODE_OV);
+
+	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
+	       LN_TX_CLK_DLY_CTRL_TAPGEN,
+	       FIELD_PREP(LN_TX_CLK_DLY_CTRL_TAPGEN, 3));
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10, LN_DTVREG_ADJUST);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_DTVREG_ADJUST_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_RXTERM_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16, LN_RXTERM_EN_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_TEST_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_TEST_EN_OV);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	      LN_VREF_TEST_RXLPBKDT_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	      LN_VREF_TEST_RXLPBKDT_EN_OV);
+	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	       LN_VREF_LPBKIN_DATA, FIELD_PREP(LN_VREF_LPBKIN_DATA, 3));
+	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BIAS_SEL,
+	       FIELD_PREP(LN_VREF_BIAS_SEL, 2));
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	      LN_VREF_BIAS_SEL_OV);
+	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	       LN_VREF_ADJUST_GRAY, FIELD_PREP(LN_VREF_ADJUST_GRAY, 0x18));
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	      LN_VREF_ADJUST_GRAY_OV);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_EN_OV);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BOOST_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	      LN_VREF_BOOST_EN_OV);
+	udelay(10);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22, LN_VREF_BOOST_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_VREF_CTRL22,
+	      LN_VREF_BOOST_EN_OV);
+	udelay(10);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PRE_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PRE_EN_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PST1_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_TX_PST1_EN_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_PBIAS_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_PBIAS_EN_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16,
+		LN_RXTERM_PULLUP_LEAK_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_SAVOS_CTRL16,
+	      LN_RXTERM_PULLUP_LEAK_EN_OV);
+
+	set32(rx_top + LN_AUSPMA_RX_TOP_TJ_CFG_RX_TXMODE, LN_RX_TXMODE);
+
+	if (cfg->txa_div2_en)
+		set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
+		      LN_TX_CLK_DIV2_EN);
+	else
+		clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
+			LN_TX_CLK_DIV2_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
+	      LN_TX_CLK_DIV2_EN_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
+		LN_TX_CLK_DIV2_RST);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19,
+	      LN_TX_CLK_DIV2_RST_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_HRCLK_SEL);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12, LN_TX_HRCLK_SEL_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_LSB);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_LSB_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_P1);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17, LN_TX_MARGIN_P1_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17,
+		LN_TX_MARGIN_P1_LSB);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL17,
+	      LN_TX_MARGIN_P1_LSB_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_CODE);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_CODE_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_LSB_CODE);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_P1_LSB_CODE_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_MARGIN_PRE);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_MARGIN_PRE_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
+		LN_TX_MARGIN_PRE_LSB);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
+	      LN_TX_MARGIN_PRE_LSB_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_LSB_CODE);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18,
+	      LN_TX_PRE_LSB_CODE_OV);
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_CODE);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TX_CTRL18, LN_TX_PRE_CODE_OV);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_SML_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_SML_EN_OV);
+	udelay(10);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_BIG_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL11, LN_DTVREG_BIG_EN_OV);
+	udelay(10);
+
+	mask32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL10, LN_DTVREG_ADJUST,
+	       FIELD_PREP(LN_DTVREG_ADJUST, 0xa));
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL13, LN_DTVREG_ADJUST_OV);
+	udelay(10);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_TERM_CTRL19, LN_TX_EN_OV);
+	udelay(10);
+
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0, LN_TX_CLK_EN);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_CTLE_CTRL0, LN_TX_CLK_EN_OV);
+
+	clear32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
+		LN_TX_BYTECLK_RESET_SYNC_CLR);
+	set32(rx_shm + LN_AUSPMA_RX_SHM_TJ_RXA_DFE_CTRL12,
+	      LN_TX_BYTECLK_RESET_SYNC_CLR_OV);
+
+	return 0;
+}
+
+static int atcphy_auspll_apb_command(struct apple_atcphy *atcphy, u32 command)
+{
+	int ret;
+	u32 reg;
+
+	reg = readl(atcphy->regs.core + AUSPLL_APB_CMD_OVERRIDE);
+	reg &= ~AUSPLL_APB_CMD_OVERRIDE_CMD;
+	reg |= FIELD_PREP(AUSPLL_APB_CMD_OVERRIDE_CMD, command);
+	reg |= AUSPLL_APB_CMD_OVERRIDE_REQ;
+	reg |= AUSPLL_APB_CMD_OVERRIDE_UNK28;
+	writel(reg, atcphy->regs.core + AUSPLL_APB_CMD_OVERRIDE);
+
+	ret = readl_poll_timeout(atcphy->regs.core + AUSPLL_APB_CMD_OVERRIDE,
+				 reg, (reg & AUSPLL_APB_CMD_OVERRIDE_ACK), 100,
+				 100000);
+	if (ret)
+		dev_warn(
+			atcphy->dev,
+			"AUSPLL APB command was not acked, continuing and hoping for the best anyway but this Type-C port will probably not work\n");
+
+	core_clear32(atcphy, AUSPLL_APB_CMD_OVERRIDE,
+		     AUSPLL_APB_CMD_OVERRIDE_REQ);
+
+	return 0;
+}
+
+static int atcphy_dp_configure(struct apple_atcphy *atcphy,
+			       enum atcphy_dp_link_rate lr)
+{
+	const struct atcphy_dp_link_rate_configuration *cfg = &dp_lr_config[lr];
+	const struct atcphy_mode_configuration *mode_cfg;
+	int ret;
+	u32 reg;
+
+	if (atcphy->dp_link_rate == lr)
+		return 0;
+
+	if (atcphy->swap_lanes)
+		mode_cfg = &atcphy_modes[atcphy->mode].swapped;
+	else
+		mode_cfg = &atcphy_modes[atcphy->mode].normal;
+
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_CMN_SHM_STS_REG0,
+				 reg,
+				 (reg & ACIOPHY_CMN_SHM_STS_REG0_CMD_READY),
+				 100, 100000);
+	if (ret) {
+		dev_err(atcphy->dev,
+			"ACIOPHY_CMN_SHM_STS_REG0_CMD_READY not set.\n");
+		return ret;
+	}
+
+	core_clear32(atcphy, AUSPLL_FREQ_CFG, AUSPLL_FREQ_REFCLK);
+
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_FREQ_COUNT_TARGET,
+		    FIELD_PREP(AUSPLL_FD_FREQ_COUNT_TARGET,
+			       cfg->freqinit_count_target));
+	core_clear32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_FBDIVN_HALF);
+	core_clear32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_REV_DIVN);
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_KI_MAN,
+		    FIELD_PREP(AUSPLL_FD_KI_MAN, 8));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_KI_EXP,
+		    FIELD_PREP(AUSPLL_FD_KI_EXP, 3));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_KP_MAN,
+		    FIELD_PREP(AUSPLL_FD_KP_MAN, 8));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_KP_EXP,
+		    FIELD_PREP(AUSPLL_FD_KP_EXP, 7));
+	core_clear32(atcphy, AUSPLL_FREQ_DESC_A, AUSPLL_FD_KPKI_SCALE_HBW);
+
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_B, AUSPLL_FD_FBDIVN_FRAC_DEN,
+		    FIELD_PREP(AUSPLL_FD_FBDIVN_FRAC_DEN,
+			       cfg->fbdivn_frac_den));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_B, AUSPLL_FD_FBDIVN_FRAC_NUM,
+		    FIELD_PREP(AUSPLL_FD_FBDIVN_FRAC_NUM,
+			       cfg->fbdivn_frac_num));
+
+	core_clear32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_SDM_SSC_STEP);
+	core_clear32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_SDM_SSC_EN);
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_PCLK_DIV_SEL,
+		    FIELD_PREP(AUSPLL_FD_PCLK_DIV_SEL, cfg->pclk_div_sel));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_LFSDM_DIV,
+		    FIELD_PREP(AUSPLL_FD_LFSDM_DIV, 1));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_LFCLK_CTRL,
+		    FIELD_PREP(AUSPLL_FD_LFCLK_CTRL, cfg->lfclk_ctrl));
+	core_mask32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_VCLK_OP_DIVN,
+		    FIELD_PREP(AUSPLL_FD_VCLK_OP_DIVN, cfg->vclk_op_divn));
+	core_set32(atcphy, AUSPLL_FREQ_DESC_C, AUSPLL_FD_VCLK_PRE_DIVN);
+
+	core_mask32(atcphy, AUSPLL_CLKOUT_DIV, AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI,
+		    FIELD_PREP(AUSPLL_CLKOUT_PLLA_REFBUFCLK_DI, 7));
+
+	if (cfg->plla_clkout_vreg_bypass)
+		core_set32(atcphy, AUSPLL_CLKOUT_DTC_VREG,
+			   AUSPLL_DTC_VREG_BYPASS);
+	else
+		core_clear32(atcphy, AUSPLL_CLKOUT_DTC_VREG,
+			     AUSPLL_DTC_VREG_BYPASS);
+
+	core_set32(atcphy, AUSPLL_BGR, AUSPLL_BGR_CTRL_AVAIL);
+
+	core_set32(atcphy, AUSPLL_CLKOUT_MASTER,
+		   AUSPLL_CLKOUT_MASTER_PCLK_DRVR_EN);
+	core_set32(atcphy, AUSPLL_CLKOUT_MASTER,
+		   AUSPLL_CLKOUT_MASTER_PCLK2_DRVR_EN);
+	core_set32(atcphy, AUSPLL_CLKOUT_MASTER,
+		   AUSPLL_CLKOUT_MASTER_REFBUFCLK_DRVR_EN);
+
+	ret = atcphy_auspll_apb_command(atcphy, 0);
+	if (ret)
+		return ret;
+
+	ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_DP_PCLK_STAT, reg,
+				 (reg & ACIOPHY_AUSPLL_LOCK), 100, 100000);
+	if (ret) {
+		dev_err(atcphy->dev, "ACIOPHY_DP_PCLK did not lock.\n");
+		return ret;
+	}
+
+	ret = atcphy_auspll_apb_command(atcphy, 0x2800);
+	if (ret)
+		return ret;
+
+	if (mode_cfg->dp_lane[0]) {
+		ret = atcphy_dp_configure_lane(atcphy, APPLE_ATCPHY_LANE_0,
+					       cfg);
+		if (ret)
+			return ret;
+	}
+
+	if (mode_cfg->dp_lane[1]) {
+		ret = atcphy_dp_configure_lane(atcphy, APPLE_ATCPHY_LANE_1,
+					       cfg);
+		if (ret)
+			return ret;
+	}
+
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		     DP_PMA_BYTECLK_RESET);
+	core_clear32(atcphy, ACIOPHY_LANE_DP_CFG_BLK_TX_DP_CTRL0,
+		     DP_MAC_DIV20_CLK_SEL);
+
+	atcphy->dp_link_rate = lr;
+	return 0;
+}
+
+static int atcphy_power_off(struct apple_atcphy *atcphy)
+{
+	u32 reg;
+	int ret;
+
+	atcphy_disable_dp_aux(atcphy);
+
+	/* enable all reset lines */
+	core_clear32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_PHY_RESET_N);
+	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_CLAMP_EN);
+	core_clear32(atcphy, ATCPHY_MISC,
+		     ATCPHY_MISC_RESET_N | ATCPHY_MISC_LANE_SWAP);
+	core_clear32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_APB_RESET_N);
+
+	core_clear32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_SLEEP_BIG);
+	ret = readl_poll_timeout(atcphy->regs.core + ATCPHY_POWER_STAT, reg,
+				 !(reg & ATCPHY_POWER_SLEEP_BIG), 100, 100000);
+	if (ret) {
+		dev_err(atcphy->dev, "failed to sleep atcphy \"big\"\n");
+		return ret;
+	}
+
+	core_clear32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_SLEEP_SMALL);
+	ret = readl_poll_timeout(atcphy->regs.core + ATCPHY_POWER_STAT, reg,
+				 !(reg & ATCPHY_POWER_SLEEP_SMALL), 100,
+				 100000);
+	if (ret) {
+		dev_err(atcphy->dev, "failed to sleep atcphy \"small\"\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int atcphy_power_on(struct apple_atcphy *atcphy)
+{
+	u32 reg;
+	int ret;
+
+	core_set32(atcphy, ATCPHY_MISC, ATCPHY_MISC_RESET_N);
+
+	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_SLEEP_SMALL);
+	ret = readl_poll_timeout(atcphy->regs.core + ATCPHY_POWER_STAT, reg,
+				 reg & ATCPHY_POWER_SLEEP_SMALL, 100, 100000);
+	if (ret) {
+		dev_err(atcphy->dev, "failed to wakeup atcphy \"small\"\n");
+		return ret;
+	}
+
+	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_SLEEP_BIG);
+	ret = readl_poll_timeout(atcphy->regs.core + ATCPHY_POWER_STAT, reg,
+				 reg & ATCPHY_POWER_SLEEP_BIG, 100, 100000);
+	if (ret) {
+		dev_err(atcphy->dev, "failed to wakeup atcphy \"big\"\n");
+		return ret;
+	}
+
+	core_clear32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_CLAMP_EN);
+	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_APB_RESET_N);
+
+	return 0;
+}
+
+static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mode mode)
+{
+	int ret = 0;
+
+	lockdep_assert_held(&atcphy->lock);
+
+	if (mode == APPLE_ATCPHY_MODE_OFF) {
+		ret = atcphy_power_off(atcphy);
+		atcphy->mode = mode;
+		return ret;
+	}
+
+	ret = atcphy_power_on(atcphy);
+	if (ret)
+		return ret;
+
+	atcphy_apply_tunables(atcphy, mode);
+
+	core_set32(atcphy, AUSPLL_FSM_CTRL, 0x1fe000);
+	core_set32(atcphy, AUSPLL_APB_CMD_OVERRIDE,
+		   AUSPLL_APB_CMD_OVERRIDE_UNK28);
+
+	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
+	udelay(10);
+	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
+	udelay(10);
+	set32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
+	udelay(10);
+
+	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL,
+	       ACIOPHY_SLEEP_CTRL_TX_SMALL_OV,
+	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_SMALL_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL,
+	       ACIOPHY_SLEEP_CTRL_TX_BIG_OV,
+	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_BIG_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_SLEEP_CTRL,
+	       ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV,
+	       FIELD_PREP(ACIOPHY_SLEEP_CTRL_TX_CLAMP_OV, 3));
+	udelay(10);
+
+	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_BIG_OV,
+	       FIELD_PREP(ACIOPHY_CFG0_RX_BIG_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_SMALL_OV,
+	       FIELD_PREP(ACIOPHY_CFG0_RX_SMALL_OV, 3));
+	udelay(10);
+	mask32(atcphy->regs.core + ACIOPHY_CFG0, ACIOPHY_CFG0_RX_CLAMP_OV,
+	       FIELD_PREP(ACIOPHY_CFG0_RX_CLAMP_OV, 3));
+	udelay(10);
+
+	/* setup AUX channel if DP altmode is requested */
+	if (atcphy_modes[mode].enable_dp_aux)
+		atcphy_enable_dp_aux(atcphy);
+
+	/* enable clocks and configure lanes */
+	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_PCLK_EN);
+	core_set32(atcphy, CIO3PLL_CLK_CTRL, CIO3PLL_CLK_REFCLK_EN);
+	atcphy_configure_lanes(atcphy, mode);
+
+	/* take the USB3 PHY out of reset */
+	core_set32(atcphy, ATCPHY_POWER_CTRL, ATCPHY_POWER_PHY_RESET_N);
+
+	atcphy->mode = mode;
+
+	return 0;
+}
+
+static int atcphy_pipehandler_lock(struct apple_atcphy *atcphy)
+{
+	int ret;
+	u32 reg;
+
+	if (readl(atcphy->regs.pipehandler + PIPEHANDLER_LOCK_REQ) &
+	    PIPEHANDLER_LOCK_EN) {
+		dev_warn(atcphy->dev, "pipehandler already locked\n");
+		return 0;
+	}
+
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_LOCK_REQ,
+	      PIPEHANDLER_LOCK_EN);
+
+	ret = readl_poll_timeout(atcphy->regs.pipehandler +
+					 PIPEHANDLER_LOCK_ACK,
+				 reg, reg & PIPEHANDLER_LOCK_EN, 1000, 1000000);
+	if (ret) {
+		clear32(atcphy->regs.pipehandler + PIPEHANDLER_LOCK_REQ, 1);
+		dev_warn(
+			atcphy->dev,
+			"pipehandler lock not acked and we can't do much about it. this type-c port is probably dead until at least the next plug/unplug or possibly even until the next reboot.\n");
+	}
+
+	return ret;
+}
+
+static int atcphy_pipehandler_unlock(struct apple_atcphy *atcphy)
+{
+	int ret;
+	u32 reg;
+
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_LOCK_REQ,
+		PIPEHANDLER_LOCK_EN);
+	ret = readl_poll_timeout(
+		atcphy->regs.pipehandler + PIPEHANDLER_LOCK_ACK, reg,
+		!(reg & PIPEHANDLER_LOCK_EN), 1000, 1000000);
+	if (ret) {
+		dev_warn(
+			atcphy->dev,
+			"pipehandler lock release not acked and we can't do much about it. this type-c port is probably dead until at least the next plug/unplug or possibly even until the next reboot.\n");
+	}
+
+	return ret;
+}
+
+static void atcphy_usb2_power_on(struct apple_atcphy *atcphy)
+{
+	if (atcphy->is_host_mode)
+		set32(atcphy->regs.usb2phy + USB2PHY_SIG, USB2PHY_SIG_HOST);
+	else
+		clear32(atcphy->regs.usb2phy + USB2PHY_SIG, USB2PHY_SIG_HOST);
+
+	set32(atcphy->regs.usb2phy + USB2PHY_SIG,
+	      USB2PHY_SIG_VBUSDET_FORCE_VAL | USB2PHY_SIG_VBUSDET_FORCE_EN |
+		      USB2PHY_SIG_VBUSVLDEXT_FORCE_VAL |
+		      USB2PHY_SIG_VBUSVLDEXT_FORCE_EN);
+
+	udelay(10);
+
+	/* take the PHY out of its low power state */
+	clear32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_SIDDQ);
+	udelay(10);
+
+	/* release reset */
+	clear32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_RESET);
+	udelay(10);
+	clear32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_PORT_RESET);
+	udelay(10);
+	set32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_APB_RESET_N);
+	udelay(10);
+	clear32(atcphy->regs.usb2phy + USB2PHY_MISCTUNE,
+		USB2PHY_MISCTUNE_APBCLK_GATE_OFF);
+	clear32(atcphy->regs.usb2phy + USB2PHY_MISCTUNE,
+		USB2PHY_MISCTUNE_REFCLK_GATE_OFF);
+
+	writel(USB2PHY_USBCTL_RUN, atcphy->regs.usb2phy + USB2PHY_USBCTL);
+}
+
+static void atcphy_usb2_power_off(struct apple_atcphy *atcphy)
+{
+	writel(USB2PHY_USBCTL_ISOLATION, atcphy->regs.usb2phy + USB2PHY_USBCTL);
+
+	udelay(10);
+	/* switch the PHY to low power mode */
+	set32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_SIDDQ);
+	udelay(10);
+	set32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_PORT_RESET);
+	udelay(10);
+	set32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_RESET);
+	udelay(10);
+	clear32(atcphy->regs.usb2phy + USB2PHY_CTL, USB2PHY_CTL_APB_RESET_N);
+	udelay(10);
+
+	set32(atcphy->regs.usb2phy + USB2PHY_MISCTUNE,
+	      USB2PHY_MISCTUNE_APBCLK_GATE_OFF);
+	set32(atcphy->regs.usb2phy + USB2PHY_MISCTUNE,
+	      USB2PHY_MISCTUNE_REFCLK_GATE_OFF);
+}
+
+static int atcphy_usb3_power_off(struct phy *phy)
+{
+	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
+	guard(mutex)(&atcphy->lock);
+
+	atcphy_configure_pipehandler_dummy(atcphy);
+	atcphy->pipehandler_up = false;
+
+	if (atcphy->target_mode != atcphy->mode)
+		atcphy_configure(atcphy, atcphy->target_mode);
+
+	return 0;
+}
+
+static int atcphy_usb3_power_on(struct phy *phy)
+{
+	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
+	guard(mutex)(&atcphy->lock);
+
+	return 0;
+}
+
+static int atcphy_usb3_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
+	guard(mutex)(&atcphy->lock);
+
+	if (!atcphy->pipehandler_up)
+		atcphy_configure_pipehandler(atcphy);
+
+	return 0;
+}
+
+static const struct phy_ops apple_atc_usb2_phy_ops = {
+	.owner = THIS_MODULE,
+	/* Nothing to do for now, USB2 config handled around DWC3 reset */
+};
+
+static const struct phy_ops apple_atc_usb3_phy_ops = {
+	.owner = THIS_MODULE,
+	.power_on = atcphy_usb3_power_on,
+	.power_off = atcphy_usb3_power_off,
+	.set_mode = atcphy_usb3_set_mode,
+};
+
+static int atcphy_dpphy_set_mode(struct phy *phy, enum phy_mode mode,
+				 int submode)
+{
+	/* nothing to do here since the setup already happened in mux_set */
+	if (mode == PHY_MODE_DP && submode == 0)
+		return 0;
+	return -EINVAL;
+}
+
+static int atcphy_dpphy_set_mode_dp_only(struct phy *phy, enum phy_mode mode,
+					 int submode)
+{
+	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
+	guard(mutex)(&atcphy->lock);
+
+	switch (mode) {
+	case PHY_MODE_DP:
+		atcphy->target_mode = APPLE_ATCPHY_MODE_DP;
+		return atcphy_configure(atcphy, APPLE_ATCPHY_MODE_DP);
+	default:
+		if (atcphy->mode == APPLE_ATCPHY_MODE_OFF)
+			return 0;
+		else
+			return atcphy_power_off(atcphy);
+	}
+}
+
+static int atcphy_dpphy_validate(struct phy *phy, enum phy_mode mode,
+				 int submode, union phy_configure_opts *opts_)
+{
+	struct phy_configure_opts_dp *opts = &opts_->dp;
+	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_DP)
+		return -EINVAL;
+	if (submode != 0)
+		return -EINVAL;
+
+	switch (atcphy->mode) {
+	case APPLE_ATCPHY_MODE_USB3_DP:
+		opts->lanes = 2;
+		break;
+	case APPLE_ATCPHY_MODE_DP:
+		opts->lanes = 4;
+		break;
+	default:
+		opts->lanes = 0;
+	}
+
+	return 0;
+}
+
+static int atcphy_dpphy_configure(struct phy *phy,
+				  union phy_configure_opts *opts_)
+{
+	struct phy_configure_opts_dp *opts = &opts_->dp;
+	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
+	enum atcphy_dp_link_rate link_rate;
+
+	if (opts->set_voltages)
+		return -EINVAL;
+	if (opts->set_lanes)
+		return -EINVAL;
+
+	if (opts->set_rate) {
+		guard(mutex)(&atcphy->lock);
+
+		switch (opts->link_rate) {
+		case 1620:
+			link_rate = ATCPHY_DP_LINK_RATE_RBR;
+			break;
+		case 2700:
+			link_rate = ATCPHY_DP_LINK_RATE_HBR;
+			break;
+		case 5400:
+			link_rate = ATCPHY_DP_LINK_RATE_HBR2;
+			break;
+		case 8100:
+			link_rate = ATCPHY_DP_LINK_RATE_HBR3;
+			break;
+		case 0:
+			return 0;
+		default:
+			dev_err(atcphy->dev, "Unsupported link rate: %d\n",
+				opts->link_rate);
+			return -EINVAL;
+		}
+
+		return atcphy_dp_configure(atcphy, link_rate);
+	}
+
+	return 0;
+}
+
+static const struct phy_ops apple_atc_dp_phy_ops = {
+	.owner = THIS_MODULE,
+	.configure = atcphy_dpphy_configure,
+	.validate = atcphy_dpphy_validate,
+	.set_mode = atcphy_dpphy_set_mode,
+};
+
+static const struct phy_ops apple_atc_dp_only_phy_ops = {
+	.owner = THIS_MODULE,
+	.configure = atcphy_dpphy_configure,
+	.validate = atcphy_dpphy_validate,
+	.set_mode = atcphy_dpphy_set_mode_dp_only,
+};
+
+static struct phy *atcphy_xlate(struct device *dev,
+				const struct of_phandle_args *args)
+{
+	struct apple_atcphy *atcphy = dev_get_drvdata(dev);
+
+	switch (args->args[0]) {
+	case PHY_TYPE_USB2:
+		return atcphy->phy_usb2;
+	case PHY_TYPE_USB3:
+		return atcphy->phy_usb3;
+	case PHY_TYPE_DP:
+		return atcphy->phy_dp;
+	}
+	return ERR_PTR(-ENODEV);
+}
+
+static struct phy *atcphy_xlate_dp_only(struct device *dev,
+					const struct of_phandle_args *args)
+{
+	struct apple_atcphy *atcphy = dev_get_drvdata(dev);
+
+	if (args->args[0] != PHY_TYPE_DP)
+		return ERR_PTR(-ENODEV);
+	return atcphy->phy_dp;
+}
+
+static int atcphy_probe_phy_dp_only(struct apple_atcphy *atcphy)
+{
+	atcphy->phy_dp =
+		devm_phy_create(atcphy->dev, NULL, &apple_atc_dp_only_phy_ops);
+	if (IS_ERR(atcphy->phy_dp))
+		return PTR_ERR(atcphy->phy_dp);
+	phy_set_drvdata(atcphy->phy_dp, atcphy);
+
+	atcphy->phy_provider = devm_of_phy_provider_register(
+		atcphy->dev, atcphy_xlate_dp_only);
+	if (IS_ERR(atcphy->phy_provider))
+		return PTR_ERR(atcphy->phy_provider);
+
+	return 0;
+}
+
+static int atcphy_probe_phy(struct apple_atcphy *atcphy)
+{
+	struct {
+		struct phy **phy;
+		const struct phy_ops *ops;
+	} phys[] = {
+		{ &atcphy->phy_usb2, &apple_atc_usb2_phy_ops },
+		{ &atcphy->phy_usb3, &apple_atc_usb3_phy_ops },
+		{ &atcphy->phy_dp, &apple_atc_dp_phy_ops },
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(phys); i++) {
+		*phys[i].phy = devm_phy_create(atcphy->dev, NULL, phys[i].ops);
+		if (IS_ERR(*phys[i].phy))
+			return PTR_ERR(*phys[i].phy);
+		phy_set_drvdata(*phys[i].phy, atcphy);
+	}
+
+	atcphy->phy_provider =
+		devm_of_phy_provider_register(atcphy->dev, atcphy_xlate);
+	if (IS_ERR(atcphy->phy_provider))
+		return PTR_ERR(atcphy->phy_provider);
+	return 0;
+}
+
+static void _atcphy_dwc3_reset_assert(struct apple_atcphy *atcphy)
+{
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN,
+		PIPEHANDLER_AON_GEN_DWC3_RESET_N);
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN,
+	      PIPEHANDLER_AON_GEN_DWC3_FORCE_CLAMP_EN);
+}
+
+static int atcphy_dwc3_reset_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct apple_atcphy *atcphy =
+		container_of(rcdev, struct apple_atcphy, rcdev);
+
+	guard(mutex)(&atcphy->lock);
+
+	_atcphy_dwc3_reset_assert(atcphy);
+
+	if (atcphy->pipehandler_up) {
+		atcphy_configure_pipehandler_dummy(atcphy);
+		atcphy->pipehandler_up = false;
+	}
+
+	atcphy_usb2_power_off(atcphy);
+
+	atcphy->dwc3_running = false;
+
+	return 0;
+}
+
+static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct apple_atcphy *atcphy =
+		container_of(rcdev, struct apple_atcphy, rcdev);
+
+	guard(mutex)(&atcphy->lock);
+
+	atcphy_usb2_power_on(atcphy);
+
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN,
+		PIPEHANDLER_AON_GEN_DWC3_FORCE_CLAMP_EN);
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN,
+	      PIPEHANDLER_AON_GEN_DWC3_RESET_N);
+
+	atcphy->dwc3_running = true;
+
+	return 0;
+}
+
+const struct reset_control_ops atcphy_dwc3_reset_ops = {
+	.assert = atcphy_dwc3_reset_assert,
+	.deassert = atcphy_dwc3_reset_deassert,
+};
+
+static int atcphy_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	return 0;
+}
+
+static int atcphy_probe_rcdev(struct apple_atcphy *atcphy)
+{
+	atcphy->rcdev.owner = THIS_MODULE;
+	atcphy->rcdev.nr_resets = 1;
+	atcphy->rcdev.ops = &atcphy_dwc3_reset_ops;
+	atcphy->rcdev.of_node = atcphy->dev->of_node;
+	atcphy->rcdev.of_reset_n_cells = 0;
+	atcphy->rcdev.of_xlate = atcphy_reset_xlate;
+
+	return devm_reset_controller_register(atcphy->dev, &atcphy->rcdev);
+}
+
+static int atcphy_sw_set(struct typec_switch_dev *sw,
+			 enum typec_orientation orientation)
+{
+	struct apple_atcphy *atcphy = typec_switch_get_drvdata(sw);
+	guard(mutex)(&atcphy->lock);
+
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NONE:
+		break;
+	case TYPEC_ORIENTATION_NORMAL:
+		atcphy->swap_lanes = false;
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		atcphy->swap_lanes = true;
+		break;
+	}
+
+	return 0;
+}
+
+static int atcphy_probe_switch(struct apple_atcphy *atcphy)
+{
+	struct typec_switch_desc sw_desc = {
+		.drvdata = atcphy,
+		.fwnode = atcphy->dev->fwnode,
+		.set = atcphy_sw_set,
+	};
+
+	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
+}
+
+static int atcphy_pipehandler_check(struct apple_atcphy *atcphy)
+{
+	lockdep_assert_held(&atcphy->lock);
+
+	if (readl(atcphy->regs.pipehandler + PIPEHANDLER_LOCK_ACK) &
+	    PIPEHANDLER_LOCK_EN) {
+		dev_err(atcphy->dev,
+			"pipehandler already locked, trying unlock and hoping for the best\n");
+
+		int ret = atcphy_pipehandler_unlock(atcphy);
+
+		if (ret) {
+			dev_err(atcphy->dev,
+				"Failed to unlock pipehandler, this port is probably dead until replug\n");
+			return -1;
+		}
+	}
+	return 0;
+}
+
+static void atcphy_configure_pipehandler_usb3(struct apple_atcphy *atcphy)
+{
+	int ret;
+	u32 reg;
+
+	if (atcphy_pipehandler_check(atcphy))
+		return;
+
+	if (atcphy->is_host_mode && atcphy->dwc3_running) {
+		/* Force disable link detection */
+		clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE_VALUES,
+			PIPEHANDLER_OVERRIDE_VAL_RXDETECT0 |
+				PIPEHANDLER_OVERRIDE_VAL_RXDETECT1);
+		set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE,
+		      PIPEHANDLER_OVERRIDE_RXVALID);
+		set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE,
+		      PIPEHANDLER_OVERRIDE_RXDETECT);
+
+		ret = atcphy_pipehandler_lock(atcphy);
+		if (ret) {
+			dev_err(atcphy->dev, "Failed to lock pipehandler");
+			return;
+		}
+
+		/* BIST dance */
+
+		core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
+			   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
+		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
+			   ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
+		ret = readl_poll_timeout(
+			atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
+			!(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 100, 100000);
+		if (ret)
+			dev_err(atcphy->dev,
+				"timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
+
+		core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
+			   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
+		core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
+			     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
+
+		core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
+			    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
+			    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
+				       3));
+
+		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
+			   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
+		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
+		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
+		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
+
+		ret = readl_poll_timeout(
+			atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
+			(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 100, 100000);
+		if (ret)
+			dev_warn(
+				atcphy->dev,
+				"timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
+
+		ret = readl_poll_timeout(
+			atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
+			!(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 100, 100000);
+		if (ret)
+			dev_warn(
+				atcphy->dev,
+				"timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
+
+		/* Clear reset for non-selected USB3 PHY (?) */
+
+		mask32(atcphy->regs.pipehandler +
+			       PIPEHANDLER_NONSELECTED_OVERRIDE,
+		       PIPEHANDLER_NATIVE_POWER_DOWN, 0x3); // TOOD: FIELD_PREP
+		clear32(atcphy->regs.pipehandler +
+				PIPEHANDLER_NONSELECTED_OVERRIDE,
+			PIPEHANDLER_NATIVE_RESET);
+
+		/* More BIST stuff (?) */
+		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
+		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
+		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
+			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
+	}
+
+	/* Configure PIPE mux to USB3 PHY */
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_CLK,
+			  PIPEHANDLED_MUX_CTRL_CLK_OFF));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_DATA,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_DATA,
+			  PIPEHANDLED_MUX_CTRL_DATA_USB3));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_CLK,
+			  PIPEHANDLED_MUX_CTRL_CLK_USB3));
+	udelay(10);
+
+	/* Remove link detection override */
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE,
+		PIPEHANDLER_OVERRIDE_RXVALID);
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE,
+		PIPEHANDLER_OVERRIDE_RXDETECT);
+
+	if (atcphy->is_host_mode && atcphy->dwc3_running) {
+		ret = atcphy_pipehandler_unlock(atcphy);
+		if (ret) {
+			dev_err(atcphy->dev, "Failed to unlock pipehandler");
+			return;
+		}
+	}
+}
+
+static void atcphy_configure_pipehandler_dummy(struct apple_atcphy *atcphy)
+{
+	int ret;
+
+	if (atcphy_pipehandler_check(atcphy))
+		return;
+
+	/* Force disable link detection */
+	clear32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE_VALUES,
+		PIPEHANDLER_OVERRIDE_VAL_RXDETECT0 |
+			PIPEHANDLER_OVERRIDE_VAL_RXDETECT1);
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE,
+	      PIPEHANDLER_OVERRIDE_RXVALID);
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_OVERRIDE,
+	      PIPEHANDLER_OVERRIDE_RXDETECT);
+
+	if (atcphy->is_host_mode && atcphy->dwc3_running) {
+		ret = atcphy_pipehandler_lock(atcphy);
+		if (ret) {
+			dev_err(atcphy->dev, "Failed to lock pipehandler");
+			return;
+		}
+	}
+
+	/* Switch to dummy PHY */
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_CLK,
+			  PIPEHANDLED_MUX_CTRL_CLK_OFF));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_DATA,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_DATA,
+			  PIPEHANDLED_MUX_CTRL_DATA_DUMMY));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_CLK,
+			  PIPEHANDLED_MUX_CTRL_CLK_DUMMY));
+	udelay(10);
+
+	if (atcphy->is_host_mode && atcphy->dwc3_running) {
+		ret = atcphy_pipehandler_unlock(atcphy);
+		if (ret) {
+			dev_err(atcphy->dev, "Failed to unlock pipehandler");
+			return;
+		}
+	}
+
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
+	       PIPEHANDLER_NATIVE_POWER_DOWN,
+	       FIELD_PREP(PIPEHANDLER_NATIVE_POWER_DOWN, 2));
+	set32(atcphy->regs.pipehandler + PIPEHANDLER_NONSELECTED_OVERRIDE,
+	      PIPEHANDLER_NATIVE_RESET);
+}
+
+static void atcphy_configure_pipehandler(struct apple_atcphy *atcphy)
+{
+	lockdep_assert_held(&atcphy->lock);
+
+	switch (atcphy_modes[atcphy->target_mode].pipehandler_state) {
+	case ATCPHY_PIPEHANDLER_STATE_INVALID:
+		dev_err(atcphy->dev,
+			"ATCPHY_PIPEHANDLER_STATE_INVALID state requested; falling through to USB2\n");
+		fallthrough;
+	case ATCPHY_PIPEHANDLER_STATE_DUMMY:
+		atcphy_configure_pipehandler_dummy(atcphy);
+		break;
+	case ATCPHY_PIPEHANDLER_STATE_USB3:
+		atcphy_configure_pipehandler_usb3(atcphy);
+		atcphy->pipehandler_up = true;
+		break;
+	case ATCPHY_PIPEHANDLER_STATE_USB4:
+		dev_err(atcphy->dev,
+			"ATCPHY_PIPEHANDLER_STATE_USB4 not implemented; falling back to USB2\n");
+		atcphy_configure_pipehandler_dummy(atcphy);
+		atcphy->pipehandler_up = true;
+		break;
+	}
+}
+
+static void atcphy_setup_pipehandler(struct apple_atcphy *atcphy)
+{
+	lockdep_assert_held(&atcphy->lock);
+	WARN_ON(atcphy->pipehandler_state != ATCPHY_PIPEHANDLER_STATE_INVALID);
+
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_CLK,
+			  PIPEHANDLED_MUX_CTRL_CLK_OFF));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_DATA,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_DATA,
+			  PIPEHANDLED_MUX_CTRL_DATA_DUMMY));
+	udelay(10);
+	mask32(atcphy->regs.pipehandler + PIPEHANDLER_MUX_CTRL,
+	       PIPEHANDLED_MUX_CTRL_CLK,
+	       FIELD_PREP(PIPEHANDLED_MUX_CTRL_CLK,
+			  PIPEHANDLED_MUX_CTRL_CLK_DUMMY));
+	udelay(10);
+
+	atcphy->pipehandler_state = ATCPHY_PIPEHANDLER_STATE_DUMMY;
+}
+
+static int atcphy_mux_set(struct typec_mux_dev *mux,
+			  struct typec_mux_state *state)
+{
+	struct apple_atcphy *atcphy = typec_mux_get_drvdata(mux);
+	guard(mutex)(&atcphy->lock);
+
+	atcphy->is_host_mode = state->data_role == TYPEC_HOST;
+
+	if (state->mode == TYPEC_STATE_SAFE) {
+		atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
+	} else if (state->mode == TYPEC_STATE_USB) {
+		atcphy->target_mode = APPLE_ATCPHY_MODE_USB3;
+	} else if (!state->alt && state->mode == TYPEC_MODE_USB4) {
+		struct enter_usb_data *data = state->data;
+		u32 eudo_usb_mode = FIELD_GET(EUDO_USB_MODE_MASK, data->eudo);
+
+		switch (eudo_usb_mode) {
+		case EUDO_USB_MODE_USB2:
+			atcphy->target_mode = APPLE_ATCPHY_MODE_USB2;
+			break;
+		case EUDO_USB_MODE_USB3:
+			atcphy->target_mode = APPLE_ATCPHY_MODE_USB3;
+			break;
+		case EUDO_USB_MODE_USB4:
+			atcphy->target_mode = APPLE_ATCPHY_MODE_USB4;
+			break;
+		default:
+			dev_warn(atcphy->dev,
+				 "Unsupported EUDO USB mode: 0x%x.\n",
+				 eudo_usb_mode);
+			atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
+		}
+	} else if (state->alt && state->alt->svid == USB_TYPEC_TBT_SID) {
+		atcphy->target_mode = APPLE_ATCPHY_MODE_TBT;
+	} else if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
+		switch (state->mode) {
+		case TYPEC_DP_STATE_C:
+		case TYPEC_DP_STATE_E:
+			atcphy->target_mode = APPLE_ATCPHY_MODE_DP;
+			break;
+		case TYPEC_DP_STATE_D:
+			atcphy->target_mode = APPLE_ATCPHY_MODE_USB3_DP;
+			break;
+		default:
+			dev_warn(
+				atcphy->dev,
+				"Unsupported DP pin assignment: 0x%lx, your connected device will not work.\n",
+				state->mode);
+			atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
+		}
+	} else if (state->alt) {
+		dev_warn(
+			atcphy->dev,
+			"Unknown alternate mode SVID: 0x%x, your connected device will not work.\n",
+			state->alt->svid);
+		atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
+	} else {
+		dev_warn(
+			atcphy->dev,
+			"Unknown mode: 0x%lx, your connected device will not work.\n",
+			state->mode);
+		atcphy->target_mode = APPLE_ATCPHY_MODE_OFF;
+	}
+
+	if (atcphy->mode == atcphy->target_mode)
+		return 0;
+
+	/*
+	 * If the pipehandler is up the PHY has previously been up and we need
+	 * to wait for dwc3 to shut down before we can reconfigure the PHY.
+	 * Thus, defer reconfiguration to atcphy_usb3_power_off.
+	 * The Type-C port controller will ensure this is called through a role
+	 * switch to USB_ROLE_NONE (and then possibly to HOST/DEVICE if the
+	 * target mode isn't off).
+	 */
+	if (!atcphy->pipehandler_up)
+		return atcphy_configure(atcphy, atcphy->target_mode);
+	return 0;
+}
+
+static int atcphy_probe_mux(struct apple_atcphy *atcphy)
+{
+	struct typec_mux_desc mux_desc = {
+		.drvdata = atcphy,
+		.fwnode = atcphy->dev->fwnode,
+		.set = atcphy_mux_set,
+	};
+
+	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
+}
+
+static int atcphy_load_tunables(struct apple_atcphy *atcphy)
+{
+	int ret;
+	struct {
+		const char *dt_name;
+		struct apple_tunable *tunable;
+	} tunables[] = {
+		{ "apple,tunable-fuses", &atcphy->tunables.fuses },
+		{ "apple,tunable-axi2af", &atcphy->tunables.axi2af },
+		{ "apple,tunable-common", &atcphy->tunables.common },
+		{ "apple,tunable-lane0-usb", &atcphy->tunables.lane_usb3[0] },
+		{ "apple,tunable-lane1-usb", &atcphy->tunables.lane_usb3[1] },
+		{ "apple,tunable-lane0-cio", &atcphy->tunables.lane_usb4[0] },
+		{ "apple,tunable-lane1-cio", &atcphy->tunables.lane_usb4[1] },
+		{ "apple,tunable-lane0-dp", &atcphy->tunables.lane_displayport[0] },
+		{ "apple,tunable-lane1-dp", &atcphy->tunables.lane_displayport[1] },
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
+		ret = devm_apple_parse_tunable(atcphy->dev, atcphy->np,
+					       tunables[i].tunable,
+					       tunables[i].dt_name);
+		if (ret) {
+			dev_err(atcphy->dev, "Failed to read tunable %s: %d\n",
+				tunables[i].dt_name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void atcphy_detach_genpd(void *data)
+{
+	struct apple_atcphy *atcphy = data;
+	int i;
+
+	if (atcphy->pd_count <= 1)
+		return;
+
+	for (i = atcphy->pd_count - 1; i >= 0; i--) {
+		if (atcphy->pd_link[i])
+			device_link_del(atcphy->pd_link[i]);
+		if (!IS_ERR_OR_NULL(atcphy->pd_dev[i]))
+			dev_pm_domain_detach(atcphy->pd_dev[i], true);
+	}
+}
+
+static int atcphy_attach_genpd(struct apple_atcphy *atcphy)
+{
+	struct device *dev = atcphy->dev;
+	int i;
+
+	atcphy->pd_count = of_count_phandle_with_args(
+		dev->of_node, "power-domains", "#power-domain-cells");
+	if (atcphy->pd_count <= 1)
+		return 0;
+
+	atcphy->pd_dev = devm_kcalloc(dev, atcphy->pd_count,
+				      sizeof(*atcphy->pd_dev), GFP_KERNEL);
+	if (!atcphy->pd_dev)
+		return -ENOMEM;
+
+	atcphy->pd_link = devm_kcalloc(dev, atcphy->pd_count,
+				       sizeof(*atcphy->pd_link), GFP_KERNEL);
+	if (!atcphy->pd_link)
+		return -ENOMEM;
+
+	for (i = 0; i < atcphy->pd_count; i++) {
+		atcphy->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(atcphy->pd_dev[i])) {
+			atcphy_detach_genpd(atcphy);
+			return PTR_ERR(atcphy->pd_dev[i]);
+		}
+
+		atcphy->pd_link[i] =
+			device_link_add(dev, atcphy->pd_dev[i],
+					DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (!atcphy->pd_link[i]) {
+			atcphy_detach_genpd(atcphy);
+			return -EINVAL;
+		}
+	}
+
+	return devm_add_action_or_reset(dev, atcphy_detach_genpd, atcphy);
+}
+
+static int atcphy_probe_all(struct apple_atcphy *atcphy)
+{
+	int ret;
+
+	ret = atcphy_probe_rcdev(atcphy);
+	if (ret)
+		return dev_err_probe(atcphy->dev, ret, "Probing rcdev failed");
+	ret = atcphy_probe_mux(atcphy);
+	if (ret)
+		return dev_err_probe(atcphy->dev, ret, "Probing mux failed");
+	ret = atcphy_probe_switch(atcphy);
+	if (ret)
+		return dev_err_probe(atcphy->dev, ret, "Probing switch failed");
+	ret = atcphy_probe_phy(atcphy);
+	if (ret)
+		return dev_err_probe(atcphy->dev, ret, "Probing phy failed");
+
+	return 0;
+}
+
+static int atcphy_probe_dp_only(struct apple_atcphy *atcphy)
+{
+	int ret;
+
+	/*
+	 * This PHY is internally hard-wired to a DisplayPort-to-HDMI
+	 * converter with a constant lane orientation. We also don't
+	 * need any of the USB or Thunderbolt features.
+	 */
+	atcphy->swap_lanes = false;
+
+	ret = atcphy_probe_phy_dp_only(atcphy);
+	if (ret)
+		return dev_err_probe(atcphy->dev, ret,
+				     "Probing dp-only phy failed");
+
+	return 0;
+}
+
+static int atcphy_map_resources(struct platform_device *pdev,
+				struct apple_atcphy *atcphy)
+{
+	struct {
+		const char *name;
+		void __iomem **addr;
+	} resources[] = {
+		{ "core", &atcphy->regs.core },
+		{ "lpdptx", &atcphy->regs.lpdptx },
+		{ "axi2af", &atcphy->regs.axi2af },
+		{ "usb2phy", &atcphy->regs.usb2phy },
+		{ "pipehandler", &atcphy->regs.pipehandler },
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(resources); i++) {
+		*resources[i].addr = devm_platform_ioremap_resource_byname(
+			pdev, resources[i].name);
+		if (IS_ERR(resources[i].addr))
+			return dev_err_probe(atcphy->dev,
+					     PTR_ERR(resources[i].addr),
+					     "Unable to map %s regs",
+					     resources[i].name);
+	}
+
+	return 0;
+}
+
+static int atcphy_probe(struct platform_device *pdev)
+{
+	struct apple_atcphy *atcphy;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	atcphy = devm_kzalloc(&pdev->dev, sizeof(*atcphy), GFP_KERNEL);
+	if (!atcphy)
+		return -ENOMEM;
+
+	atcphy->dev = dev;
+	atcphy->np = dev->of_node;
+	atcphy->hw = of_device_get_match_data(dev);
+	mutex_init(&atcphy->lock);
+	platform_set_drvdata(pdev, atcphy);
+
+	ret = atcphy_attach_genpd(atcphy);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains");
+	ret = atcphy_map_resources(pdev, atcphy);
+	if (ret)
+		return ret;
+	ret = atcphy_load_tunables(atcphy);
+	if (ret)
+		return ret;
+
+	atcphy->mode = APPLE_ATCPHY_MODE_OFF;
+	atcphy->pipehandler_state = ATCPHY_PIPEHANDLER_STATE_INVALID;
+
+	mutex_lock(&atcphy->lock);
+	/* Reset dwc3 on probe, let dwc3 (consumer) deassert it */
+	_atcphy_dwc3_reset_assert(atcphy);
+	atcphy_power_off(atcphy);
+	atcphy_setup_pipehandler(atcphy);
+
+	if (atcphy->hw->dp_only)
+		ret = atcphy_probe_dp_only(atcphy);
+	else
+		ret = atcphy_probe_all(atcphy);
+	mutex_unlock(&atcphy->lock);
+
+	return ret;
+}
+
+static const struct apple_atcphy_hw atcphy_t8103 = {};
+
+static const struct apple_atcphy_hw atcphy_t6000_dp_only = {
+	.dp_only = true,
+};
+
+static const struct of_device_id atcphy_match[] = {
+	{
+		.compatible = "apple,t6000-atcphy",
+		.data = &atcphy_t8103,
+	},
+	{
+		.compatible = "apple,t6000-atcphy-dp-only",
+		.data = &atcphy_t6000_dp_only,
+	},
+	{
+		.compatible = "apple,t6020-atcphy",
+		.data = &atcphy_t8103,
+	},
+	{
+		.compatible = "apple,t8103-atcphy",
+		.data = &atcphy_t8103,
+	},
+	{
+		.compatible = "apple,t8112-atcphy",
+		.data = &atcphy_t8103,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, atcphy_match);
+
+static struct platform_driver atcphy_driver = {
+	.driver = {
+		.name = "phy-apple-atc",
+		.of_match_table = atcphy_match,
+	},
+	.probe = atcphy_probe,
+};
+module_platform_driver(atcphy_driver);
+
+MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
+MODULE_DESCRIPTION("Apple Type-C PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1



