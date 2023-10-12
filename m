Return-Path: <linux-usb+bounces-1531-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECBF7C7695
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 21:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 632D81C2112F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 19:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C1138FA5;
	Thu, 12 Oct 2023 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=triops.cz header.i=@triops.cz header.b="Yi/11JiK";
	dkim=pass (2048-bit key) header.d=triops.cz header.i=@triops.cz header.b="Yi/11JiK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8F826296
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 19:19:59 +0000 (UTC)
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 Oct 2023 12:19:56 PDT
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4FAB7
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 12:19:56 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
	by cmgsmtp with ESMTPSA
	id r1Ctqq4BISqGRr1Cvqj2Ll; Thu, 12 Oct 2023 21:18:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1697138334; bh=EkhSnxUlbwTbGUl+43trl5xby2UZ1UC/eFAd9sMIHIY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Yi/11JiK6mGGPyI1F2K3wXQn0sFW8ag+YGPRzsbMrN7fmWr9WuH3q4Pi3lTeu5pQw
	 XB0NucT/DEReYtLFK0NOmclBefnYLSORbaAj0dE+pFDrUW//8zZAcYWL+tOEicFqoU
	 63OIThLl42vdD0fjVkWmQLR3CM5UkJrzKSCDuCmkqwv+xsJ9GZAQbnE69tgl/Y62JN
	 iJB3gHJWv8ykV7u/oyv8xygbRFQ4xH8un+hXZvWIkjgiVWDmGxxgU4MyQ9T3eBGTCq
	 /+ZrO0QG9jJbo1drEzoNJhkwbK/+d3xdm5DB+Z/j9DzeLog4HJu4EMCd783vaoYlZN
	 Wu9g3bCUnPDFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1697138334; bh=EkhSnxUlbwTbGUl+43trl5xby2UZ1UC/eFAd9sMIHIY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Yi/11JiK6mGGPyI1F2K3wXQn0sFW8ag+YGPRzsbMrN7fmWr9WuH3q4Pi3lTeu5pQw
	 XB0NucT/DEReYtLFK0NOmclBefnYLSORbaAj0dE+pFDrUW//8zZAcYWL+tOEicFqoU
	 63OIThLl42vdD0fjVkWmQLR3CM5UkJrzKSCDuCmkqwv+xsJ9GZAQbnE69tgl/Y62JN
	 iJB3gHJWv8ykV7u/oyv8xygbRFQ4xH8un+hXZvWIkjgiVWDmGxxgU4MyQ9T3eBGTCq
	 /+ZrO0QG9jJbo1drEzoNJhkwbK/+d3xdm5DB+Z/j9DzeLog4HJu4EMCd783vaoYlZN
	 Wu9g3bCUnPDFw==
Date: Thu, 12 Oct 2023 21:18:48 +0200
From: Ladislav Michl <oss-lists@triops.cz>
To: linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Message-ID: <ZShGmL4mph91Ncib@lenoch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfCxBvFhPfpU3ckdap6k++7mQtasoJncYFdNdbyFRettnbwcBkiS6+kSGoPBwrIBlzjCLbfe7Ck1TMkyPHxwXYmC+nqVY2+PTJ8Ep5rj7Yyr/5G0OqE5z
 jsU1qBQbqvlfMWwdC1rNkqwBRQ1g36is/SjM65mnVOcH1YG8iQRIbKw2TwHwtZBdCP+eOwJogcRfT9lSgbC1s/Y/rmt7nx4cZLI=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Ladislav Michl <ladis@linux-mips.org>

Implement workaround for Octeon Known Issue Id 29206:
| The USB high speed logic contains a PLL that must lock during
| initialization for correct operation. In very rare circumstances,
| it is possible for the PLL to fail to start correctly.
| Workaround
| After initialization, check the USB PLL lock register via the
| UPHY CR interface. If the PLL is not running, power it down and
| back up and restart the initialization.

PLL initialization code taken from Cavium's vendor bootloader:
u-boot/drivers/usb/host/xhci-octeon.c:octeon3_usb_clocks_start

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 NOTE:
 This patch fixes initialization issue found on some CN7020 based boards.
 Without this patch, controller sometimes fails to detect devices connected.
 Original code comes from Cavium released u-boot monster patch, which seems
 to suffer from mistakes made while resolving merge conflicts when upgrading
 to newer u-boot.
 Testing revealed that only single reinit is needed to properly lock PLL,
 this agrees with comment in Cavium's u-boot code, which is claiming the
 same. However, same as in u-boot code, reinit is attempted three times.
 (in could be done using while loop instead of goto, just let me know
 which way do you prefer)
 SoCs suffering from this problem would fail to initialize PHY about
 several tens times of thousand boots. This patch always restored
 functional state.

 drivers/usb/dwc3/dwc3-octeon.c | 285 ++++++++++++++++++++++++++++++++-
 1 file changed, 284 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index d45d62c72b2d..497c18e19c73 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -122,8 +122,32 @@
 #define USBDRD_UCTL_INTSTAT			0x30
 #define USBDRD_UCTL_PORT_CFG_HS(port)		(0x40 + (0x20 * port))
 #define USBDRD_UCTL_PORT_CFG_SS(port)		(0x48 + (0x20 * port))
+
+/*
+ * UCTL Port Debug Configuration Registers
+ */
 #define USBDRD_UCTL_PORT_CR_DBG_CFG(port)	(0x50 + (0x20 * port))
+/* Rising edge triggers a register write operation of the captured
+ * address with the captured data
+ */
+# define USBDRD_UCTL_PORT_CR_DBG_CFG_WRITE	BIT_ULL(0)
+/* Rising edge triggers a register read operation of the capture address */
+# define USBDRD_UCTL_PORT_CR_DBG_CFG_READ	BIT_ULL(1)
+/* Rising edge triggers the [DATA_IN] field to be captured as the write data */
+# define USBDRD_UCTL_PORT_CR_DBG_CFG_CAP_DATA	BIT_ULL(2)
+/* Rising edge triggers the [DATA_IN] field to be captured as the address */
+# define USBDRD_UCTL_PORT_CR_DBG_CFG_CAP_ADDR	BIT_ULL(3)
+/* Address or data to be written to the CR interface */
+# define USBDRD_UCTL_PORT_CR_DBG_CFG_DATA_IN	GENMASK_ULL(47, 32)
+
+/*
+ * UCTL Port Debug Status Registers
+ */
 #define USBDRD_UCTL_PORT_CR_DBG_STATUS(port)	(0x58 + (0x20 * port))
+/* Acknowledge that the CAP_ADDR, CAP_DATA, READ, WRITE commands have completed */
+# define USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK	BIT_ULL(0)
+/* Last data read from the CR interface */
+# define USBDRD_UCTL_PORT_CR_DBG_STATUS_DATA_OUT GENMASK_ULL(47, 32)
 
 /*
  * UCTL Configuration Register
@@ -410,6 +434,252 @@ static void dwc3_octeon_phy_reset(struct dwc3_octeon *octeon)
 	dwc3_octeon_writeq(uctl_ctl_reg, val);
 }
 
+/* Internal indirect register that reports if the phy PLL has lock.
+ * This will be 1 if lock, 0 if no lock.
+ */
+#define DWC3_INT_IND_PLL_LOCK_REG			0x200b
+
+/* Internal indirect UPHY register that controls the power to the UPHY PLL. */
+#define DWC3_INT_IND_UPHY_PLL_PU			0x2012
+/* Write enable bit for DWC3_INT_IND_PLL_POWER_CTL */
+# define DWC3_INT_IND_UPHY_PLL_PU_WE			BIT(5)
+/* Power enable bit for DWC3_INT_IND_PLL_POWER_CTL */
+# define DWC3_INT_IND_UPHY_PLL_PU_POWER_EN		BIT(2)
+
+/* Internal indirect UPHY PLL register */
+#define DWC3_INT_IND_UPHY_PLL_RESET			0x201C
+/* Write enable bit */
+# define DWC3_INT_IND_UPHY_PLL_RESET_WE			BIT(4)
+/* VCO reset bit */
+# define DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST		BIT(0)
+
+static int dwc3_octeon_indirect_read(struct dwc3_octeon *octeon, u32 addr)
+{
+	int ret;
+	u64 val;
+	unsigned long timeout;
+	struct device *dev = octeon->dev;
+	void __iomem *cfg_reg = octeon->base + USBDRD_UCTL_PORT_CR_DBG_CFG(0);
+	void __iomem *status_reg = octeon->base + USBDRD_UCTL_PORT_CR_DBG_STATUS(0);
+
+	/* 1 */
+	val = FIELD_PREP(USBDRD_UCTL_PORT_CR_DBG_CFG_DATA_IN, addr);
+	dwc3_octeon_writeq(cfg_reg, val);
+	/* 2 */
+	val |= USBDRD_UCTL_PORT_CR_DBG_CFG_CAP_ADDR;
+	dwc3_octeon_writeq(cfg_reg, val);
+	/* 3 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (!(dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK)) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "set read address timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 4 */
+	dwc3_octeon_writeq(cfg_reg, 0);
+	/* 5 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "read ack address clear timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 6 */
+	dwc3_octeon_writeq(cfg_reg, USBDRD_UCTL_PORT_CR_DBG_CFG_READ);
+	/* 7 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (!((val = dwc3_octeon_readq(status_reg)) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK)) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "read data timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 8 */
+	ret = FIELD_GET(USBDRD_UCTL_PORT_CR_DBG_STATUS_DATA_OUT, val);
+	/* 9 */
+	dwc3_octeon_writeq(cfg_reg, 0);
+	/* 10 */
+	while (dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "read ack data clear timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+
+	return ret;
+}
+
+static int dwc3_octeon_indirect_write(struct dwc3_octeon *octeon, u32 addr, u16 value)
+{
+	u64 val;
+	unsigned long timeout;
+	struct device *dev = octeon->dev;
+	void __iomem *cfg_reg = octeon->base + USBDRD_UCTL_PORT_CR_DBG_CFG(0);
+	void __iomem *status_reg = octeon->base + USBDRD_UCTL_PORT_CR_DBG_STATUS(0);
+
+	/* 1 */
+	val = FIELD_PREP(USBDRD_UCTL_PORT_CR_DBG_CFG_DATA_IN, addr);
+	dwc3_octeon_writeq(cfg_reg, val);
+	/* 2 */
+	val |= USBDRD_UCTL_PORT_CR_DBG_CFG_CAP_ADDR;
+	dwc3_octeon_writeq(cfg_reg, val);
+	/* 3 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (!(dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK)) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "set write address timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 4 */
+	dwc3_octeon_writeq(cfg_reg, 0);
+	/* 5 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "write ack address clear timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 6 */
+	val = FIELD_PREP(USBDRD_UCTL_PORT_CR_DBG_CFG_DATA_IN, value);
+	dwc3_octeon_writeq(cfg_reg, FIELD_PREP(USBDRD_UCTL_PORT_CR_DBG_CFG_DATA_IN, value));
+	/* 7 */
+	val |= USBDRD_UCTL_PORT_CR_DBG_CFG_CAP_DATA;
+	dwc3_octeon_writeq(cfg_reg, val);
+	/* 8 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (!(dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK)) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "write set data timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 9 */
+	dwc3_octeon_writeq(cfg_reg, 0);
+	/* 10 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "write ack clear timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 11 */
+	dwc3_octeon_writeq(cfg_reg, USBDRD_UCTL_PORT_CR_DBG_CFG_WRITE);
+	/* 12 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (!(dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK)) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "write data timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+	/* 13 */
+	dwc3_octeon_writeq(cfg_reg, 0);
+	/* 14 */
+	timeout = jiffies + msecs_to_jiffies(1000);
+	while (dwc3_octeon_readq(status_reg) & USBDRD_UCTL_PORT_CR_DBG_STATUS_ACK) {
+                if (time_after(jiffies, timeout)) {
+			dev_warn(dev, "write ack clear timeout (%x)\n", addr);
+                        return -ETIMEDOUT;
+		}
+                cpu_relax();
+        }
+
+	return 0;
+}
+
+static int dwc3_octeon_pll_locked(struct dwc3_octeon *octeon)
+{
+	int ret = dwc3_octeon_indirect_read(octeon, DWC3_INT_IND_PLL_LOCK_REG);
+
+	if (ret < 0)
+		return ret;
+	return ret & 1;
+}
+
+/**
+ * Performs a full reset of the UPHY PLL. Note that this is normally done
+ * internally by a state machine when the UPHY is brought out of reset but this
+ * version gives far more time for things to settle before continuing.
+ */
+static int dwc3_uphy_pll_reset(struct dwc3_octeon *octeon)
+{
+	u16 ctrl, pwr;
+
+	/* 1. Turn on write enable so we can assert reset to the PLL VCO */
+	ctrl = dwc3_octeon_indirect_read(octeon, DWC3_INT_IND_UPHY_PLL_RESET);
+	ctrl |= DWC3_INT_IND_UPHY_PLL_RESET_WE;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
+
+	/* 2. Turn on write enable for PLL power control */
+	pwr = dwc3_octeon_indirect_read(octeon, DWC3_INT_IND_UPHY_PLL_PU);
+	pwr |= DWC3_INT_IND_UPHY_PLL_PU_WE;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
+
+	/* 3. Assert VCO reset */
+	ctrl |= DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
+
+	/* 4. Power off the PLL */
+	pwr &= ~DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
+	usleep_range(1000, 2000);
+
+	/* 5. Power on the PLL while VCO is held in reset */
+	pwr |= DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
+
+	/* Wait for things to stabilize before taking VCO out of reset */
+	usleep_range(1000, 2000);
+
+	/* 6. Take the VCO out of reset */
+	ctrl &= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
+	usleep_range(1000, 2000);
+
+	/* 7. Put the VCO back in reset */
+	ctrl |= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
+
+	/* 8. Power off the PLL */
+	pwr &= ~DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
+	usleep_range(1000, 2000);
+
+	/* 9. Power on the PLL while VCO is held in reset */
+	pwr |= DWC3_INT_IND_UPHY_PLL_PU_POWER_EN;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
+
+	/* 10. Take the VCO out of reset */
+	ctrl &= ~DWC3_INT_IND_UPHY_PLL_RESET_VCO_RST;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
+
+	/* 11. Turn off write enables */
+	pwr &= ~DWC3_INT_IND_UPHY_PLL_PU_WE;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_PU, pwr);
+
+	ctrl &= ~DWC3_INT_IND_UPHY_PLL_RESET_WE;
+	dwc3_octeon_indirect_write(octeon, DWC3_INT_IND_UPHY_PLL_RESET, ctrl);
+
+	usleep_range(1000, 2000);
+
+	/* Return if we have lock or not */
+	return dwc3_octeon_pll_locked(octeon);
+}
+
 static int dwc3_octeon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -418,7 +688,7 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	const char *hs_clock_type, *ss_clock_type;
 	int ref_clk_sel, ref_clk_fsel, mpll_mul;
 	int power_active_low, power_gpio;
-	int err, len;
+	int err, len, tries = 0;
 	u32 clock_rate;
 
 	if (of_property_read_u32(node, "refclk-frequency", &clock_rate)) {
@@ -503,6 +773,7 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	if (IS_ERR(octeon->base))
 		return PTR_ERR(octeon->base);
 
+retry:
 	err = dwc3_octeon_setup(octeon, ref_clk_sel, ref_clk_fsel, mpll_mul,
 				power_gpio, power_active_low);
 	if (err)
@@ -511,6 +782,18 @@ static int dwc3_octeon_probe(struct platform_device *pdev)
 	dwc3_octeon_set_endian_mode(octeon);
 	dwc3_octeon_phy_reset(octeon);
 
+	usleep_range(50, 100);
+	if (dwc3_octeon_pll_locked(octeon) == 0) {
+		dev_warn(dev, "PLL unlocked, reseting (%d of 3)\n", ++tries);
+		err = dwc3_uphy_pll_reset(octeon);
+		if (err < 0)
+			return err;
+		if (tries < 3)
+			goto retry;
+		dev_err(dev, "PLL lock failed\n");
+		return -EIO;
+	}
+
 	platform_set_drvdata(pdev, octeon);
 
 	return of_platform_populate(node, NULL, NULL, dev);
-- 
2.39.2


