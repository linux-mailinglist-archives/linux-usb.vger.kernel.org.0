Return-Path: <linux-usb+bounces-2655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B77E4CF1
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 00:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92E6AB2103A
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 23:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0611B34554;
	Tue,  7 Nov 2023 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEXW3sC0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEAE34540
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 23:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D28CC433CB;
	Tue,  7 Nov 2023 23:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399468;
	bh=nKzYsNBNGXiRXX5b76v3Mnm7bHPU3h67hzP9Wf4FAtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZEXW3sC0LXi5SzEnz2zcRiPgRNYQZNoK3g0JuE90wwfZmdtGDjA5gdUYVrbnUJqnJ
	 AgDCCY8ZU+oEWoLbL2wvBBVf47zx+TGoOX3Ex6bOXrFlOAZfwF7oPKcsIZjP5w1f8T
	 xa8im2XafJoYmPEPrq+oa8A1Twm5e4j15sU8MgklIKsR/ODHc5sTRc+/Z7h/6f6EVM
	 H7jh7oQzf73zsLfYj3xgEF9gulXU5DFVEaS5ANE076AvAFe7aoz6LgK6hRsjqpHhWA
	 5Q2tCKjpqOTOH9JQIhJ9ItKPsiQm85QlbsY9sWtHFZ5bwfckor4HxqfPuDmI+DdJ3Z
	 c9rhiMapR7XYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stanley Chang <stanley_chang@realtek.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 04/11] usb: dwc3: core: configure TX/RX threshold for DWC3_IP
Date: Tue,  7 Nov 2023 18:24:05 -0500
Message-ID: <20231107232420.3776419-4-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232420.3776419-1-sashal@kernel.org>
References: <20231107232420.3776419-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
Content-Transfer-Encoding: 8bit

From: Stanley Chang <stanley_chang@realtek.com>

[ Upstream commit e72fc8d6a12af7ae8dd1b52cf68ed68569d29f80 ]

In Synopsys's dwc3 data book:
To avoid underrun and overrun during the burst, in a high-latency bus
system (like USB), threshold and burst size control is provided through
GTXTHRCFG and GRXTHRCFG registers.

In Realtek DHC SoC, DWC3 USB 3.0 uses AHB system bus. When dwc3 is
connected with USB 2.5G Ethernet, there will be overrun problem.
Therefore, setting TX/RX thresholds can avoid this issue.

Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Link: https://lore.kernel.org/r/20230912041904.30721-1-stanley_chang@realtek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc3/core.c | 160 +++++++++++++++++++++++++++++++---------
 drivers/usb/dwc3/core.h |  13 ++++
 2 files changed, 137 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 57e2f4cc744f7..a811db88eedae 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1111,6 +1111,111 @@ static void dwc3_set_power_down_clk_scale(struct dwc3 *dwc)
 	}
 }
 
+static void dwc3_config_threshold(struct dwc3 *dwc)
+{
+	u32 reg;
+	u8 rx_thr_num;
+	u8 rx_maxburst;
+	u8 tx_thr_num;
+	u8 tx_maxburst;
+
+	/*
+	 * Must config both number of packets and max burst settings to enable
+	 * RX and/or TX threshold.
+	 */
+	if (!DWC3_IP_IS(DWC3) && dwc->dr_mode == USB_DR_MODE_HOST) {
+		rx_thr_num = dwc->rx_thr_num_pkt_prd;
+		rx_maxburst = dwc->rx_max_burst_prd;
+		tx_thr_num = dwc->tx_thr_num_pkt_prd;
+		tx_maxburst = dwc->tx_max_burst_prd;
+
+		if (rx_thr_num && rx_maxburst) {
+			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+			reg |= DWC31_RXTHRNUMPKTSEL_PRD;
+
+			reg &= ~DWC31_RXTHRNUMPKT_PRD(~0);
+			reg |= DWC31_RXTHRNUMPKT_PRD(rx_thr_num);
+
+			reg &= ~DWC31_MAXRXBURSTSIZE_PRD(~0);
+			reg |= DWC31_MAXRXBURSTSIZE_PRD(rx_maxburst);
+
+			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+		}
+
+		if (tx_thr_num && tx_maxburst) {
+			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
+			reg |= DWC31_TXTHRNUMPKTSEL_PRD;
+
+			reg &= ~DWC31_TXTHRNUMPKT_PRD(~0);
+			reg |= DWC31_TXTHRNUMPKT_PRD(tx_thr_num);
+
+			reg &= ~DWC31_MAXTXBURSTSIZE_PRD(~0);
+			reg |= DWC31_MAXTXBURSTSIZE_PRD(tx_maxburst);
+
+			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
+		}
+	}
+
+	rx_thr_num = dwc->rx_thr_num_pkt;
+	rx_maxburst = dwc->rx_max_burst;
+	tx_thr_num = dwc->tx_thr_num_pkt;
+	tx_maxburst = dwc->tx_max_burst;
+
+	if (DWC3_IP_IS(DWC3)) {
+		if (rx_thr_num && rx_maxburst) {
+			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+			reg |= DWC3_GRXTHRCFG_PKTCNTSEL;
+
+			reg &= ~DWC3_GRXTHRCFG_RXPKTCNT(~0);
+			reg |= DWC3_GRXTHRCFG_RXPKTCNT(rx_thr_num);
+
+			reg &= ~DWC3_GRXTHRCFG_MAXRXBURSTSIZE(~0);
+			reg |= DWC3_GRXTHRCFG_MAXRXBURSTSIZE(rx_maxburst);
+
+			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+		}
+
+		if (tx_thr_num && tx_maxburst) {
+			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
+			reg |= DWC3_GTXTHRCFG_PKTCNTSEL;
+
+			reg &= ~DWC3_GTXTHRCFG_TXPKTCNT(~0);
+			reg |= DWC3_GTXTHRCFG_TXPKTCNT(tx_thr_num);
+
+			reg &= ~DWC3_GTXTHRCFG_MAXTXBURSTSIZE(~0);
+			reg |= DWC3_GTXTHRCFG_MAXTXBURSTSIZE(tx_maxburst);
+
+			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
+		}
+	} else {
+		if (rx_thr_num && rx_maxburst) {
+			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
+			reg |= DWC31_GRXTHRCFG_PKTCNTSEL;
+
+			reg &= ~DWC31_GRXTHRCFG_RXPKTCNT(~0);
+			reg |= DWC31_GRXTHRCFG_RXPKTCNT(rx_thr_num);
+
+			reg &= ~DWC31_GRXTHRCFG_MAXRXBURSTSIZE(~0);
+			reg |= DWC31_GRXTHRCFG_MAXRXBURSTSIZE(rx_maxburst);
+
+			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
+		}
+
+		if (tx_thr_num && tx_maxburst) {
+			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
+			reg |= DWC31_GTXTHRCFG_PKTCNTSEL;
+
+			reg &= ~DWC31_GTXTHRCFG_TXPKTCNT(~0);
+			reg |= DWC31_GTXTHRCFG_TXPKTCNT(tx_thr_num);
+
+			reg &= ~DWC31_GTXTHRCFG_MAXTXBURSTSIZE(~0);
+			reg |= DWC31_GTXTHRCFG_MAXTXBURSTSIZE(tx_maxburst);
+
+			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
+		}
+	}
+}
+
 /**
  * dwc3_core_init - Low-level initialization of DWC3 Core
  * @dwc: Pointer to our controller context structure
@@ -1278,42 +1383,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
 	}
 
-	/*
-	 * Must config both number of packets and max burst settings to enable
-	 * RX and/or TX threshold.
-	 */
-	if (!DWC3_IP_IS(DWC3) && dwc->dr_mode == USB_DR_MODE_HOST) {
-		u8 rx_thr_num = dwc->rx_thr_num_pkt_prd;
-		u8 rx_maxburst = dwc->rx_max_burst_prd;
-		u8 tx_thr_num = dwc->tx_thr_num_pkt_prd;
-		u8 tx_maxburst = dwc->tx_max_burst_prd;
-
-		if (rx_thr_num && rx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
-			reg |= DWC31_RXTHRNUMPKTSEL_PRD;
-
-			reg &= ~DWC31_RXTHRNUMPKT_PRD(~0);
-			reg |= DWC31_RXTHRNUMPKT_PRD(rx_thr_num);
-
-			reg &= ~DWC31_MAXRXBURSTSIZE_PRD(~0);
-			reg |= DWC31_MAXRXBURSTSIZE_PRD(rx_maxburst);
-
-			dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
-		}
-
-		if (tx_thr_num && tx_maxburst) {
-			reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
-			reg |= DWC31_TXTHRNUMPKTSEL_PRD;
-
-			reg &= ~DWC31_TXTHRNUMPKT_PRD(~0);
-			reg |= DWC31_TXTHRNUMPKT_PRD(tx_thr_num);
-
-			reg &= ~DWC31_MAXTXBURSTSIZE_PRD(~0);
-			reg |= DWC31_MAXTXBURSTSIZE_PRD(tx_maxburst);
-
-			dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
-		}
-	}
+	dwc3_config_threshold(dwc);
 
 	return 0;
 
@@ -1462,6 +1532,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			lpm_nyet_threshold;
 	u8			tx_de_emphasis;
 	u8			hird_threshold;
+	u8			rx_thr_num_pkt = 0;
+	u8			rx_max_burst = 0;
+	u8			tx_thr_num_pkt = 0;
+	u8			tx_max_burst = 0;
 	u8			rx_thr_num_pkt_prd = 0;
 	u8			rx_max_burst_prd = 0;
 	u8			tx_thr_num_pkt_prd = 0;
@@ -1524,6 +1598,14 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb2-lpm-disable");
 	dwc->usb2_gadget_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-gadget-lpm-disable");
+	device_property_read_u8(dev, "snps,rx-thr-num-pkt",
+				&rx_thr_num_pkt);
+	device_property_read_u8(dev, "snps,rx-max-burst",
+				&rx_max_burst);
+	device_property_read_u8(dev, "snps,tx-thr-num-pkt",
+				&tx_thr_num_pkt);
+	device_property_read_u8(dev, "snps,tx-max-burst",
+				&tx_max_burst);
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
@@ -1601,6 +1683,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->hird_threshold = hird_threshold;
 
+	dwc->rx_thr_num_pkt = rx_thr_num_pkt;
+	dwc->rx_max_burst = rx_max_burst;
+
+	dwc->tx_thr_num_pkt = tx_thr_num_pkt;
+	dwc->tx_max_burst = tx_max_burst;
+
 	dwc->rx_thr_num_pkt_prd = rx_thr_num_pkt_prd;
 	dwc->rx_max_burst_prd = rx_max_burst_prd;
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 80cc532ba9d55..889c122dad457 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -209,6 +209,11 @@
 #define DWC3_GRXTHRCFG_RXPKTCNT(n) (((n) & 0xf) << 24)
 #define DWC3_GRXTHRCFG_PKTCNTSEL BIT(29)
 
+/* Global TX Threshold Configuration Register */
+#define DWC3_GTXTHRCFG_MAXTXBURSTSIZE(n) (((n) & 0xff) << 16)
+#define DWC3_GTXTHRCFG_TXPKTCNT(n) (((n) & 0xf) << 24)
+#define DWC3_GTXTHRCFG_PKTCNTSEL BIT(29)
+
 /* Global RX Threshold Configuration Register for DWC_usb31 only */
 #define DWC31_GRXTHRCFG_MAXRXBURSTSIZE(n)	(((n) & 0x1f) << 16)
 #define DWC31_GRXTHRCFG_RXPKTCNT(n)		(((n) & 0x1f) << 21)
@@ -1041,6 +1046,10 @@ struct dwc3_scratchpad_array {
  * @test_mode_nr: test feature selector
  * @lpm_nyet_threshold: LPM NYET response threshold
  * @hird_threshold: HIRD threshold
+ * @rx_thr_num_pkt: USB receive packet count
+ * @rx_max_burst: max USB receive burst size
+ * @tx_thr_num_pkt: USB transmit packet count
+ * @tx_max_burst: max USB transmit burst size
  * @rx_thr_num_pkt_prd: periodic ESS receive packet count
  * @rx_max_burst_prd: max periodic ESS receive burst size
  * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
@@ -1268,6 +1277,10 @@ struct dwc3 {
 	u8			test_mode_nr;
 	u8			lpm_nyet_threshold;
 	u8			hird_threshold;
+	u8			rx_thr_num_pkt;
+	u8			rx_max_burst;
+	u8			tx_thr_num_pkt;
+	u8			tx_max_burst;
 	u8			rx_thr_num_pkt_prd;
 	u8			rx_max_burst_prd;
 	u8			tx_thr_num_pkt_prd;
-- 
2.42.0


