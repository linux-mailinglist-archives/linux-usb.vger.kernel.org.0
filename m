Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C65F361B25
	for <lists+linux-usb@lfdr.de>; Fri, 16 Apr 2021 10:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240077AbhDPIGs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Apr 2021 04:06:48 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:60542 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238757AbhDPIGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Apr 2021 04:06:42 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13G866VH0023596, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13G866VH0023596
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 16 Apr 2021 16:06:07 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 16 Apr 2021 16:06:06 +0800
Received: from fc32.localdomain (172.21.177.102) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 16 Apr
 2021 16:06:04 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <kuba@kernel.org>, <davem@davemloft.net>
CC:     <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH net-next 4/6] r8152: support new chips
Date:   Fri, 16 Apr 2021 16:04:35 +0800
Message-ID: <1394712342-15778-354-Taiwan-albertk@realtek.com>
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <1394712342-15778-350-Taiwan-albertk@realtek.com>
References: <1394712342-15778-350-Taiwan-albertk@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.102]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMTYgpFekyCAwNjowMDowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/16/2021 07:42:45
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163158 [Apr 16 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hayeswang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/16/2021 07:45:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMTYgpFekyCAwNjozODowMA==?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/16/2021 07:46:47
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163158 [Apr 16 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hayeswang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/16/2021 07:50:00
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Support RTL8153C, RTL8153D, RTL8156A, and RTL8156B. The RTL8156A
and RTL8156B are the 2.5G ethernet.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 2634 +++++++++++++++++++++++++++++++++++----
 1 file changed, 2359 insertions(+), 275 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 3f465242a4f0..72b8ef0ad5a1 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -43,10 +43,14 @@
 
 #define PLA_IDR			0xc000
 #define PLA_RCR			0xc010
+#define PLA_RCR1		0xc012
 #define PLA_RMS			0xc016
 #define PLA_RXFIFO_CTRL0	0xc0a0
+#define PLA_RXFIFO_FULL		0xc0a2
 #define PLA_RXFIFO_CTRL1	0xc0a4
+#define PLA_RX_FIFO_FULL	0xc0a6
 #define PLA_RXFIFO_CTRL2	0xc0a8
+#define PLA_RX_FIFO_EMPTY	0xc0aa
 #define PLA_DMY_REG0		0xc0b0
 #define PLA_FMC			0xc0b4
 #define PLA_CFG_WOL		0xc0b6
@@ -63,6 +67,8 @@
 #define PLA_MACDBG_PRE		0xd38c	/* RTL_VER_04 only */
 #define PLA_MACDBG_POST		0xd38e	/* RTL_VER_04 only */
 #define PLA_EXTRA_STATUS	0xd398
+#define PLA_GPHY_CTRL		0xd3ae
+#define PLA_POL_GPIO_CTRL	0xdc6a
 #define PLA_EFUSE_DATA		0xdd00
 #define PLA_EFUSE_CMD		0xdd02
 #define PLA_LEDSEL		0xdd90
@@ -72,6 +78,8 @@
 #define PLA_LWAKE_CTRL_REG	0xe007
 #define PLA_GPHY_INTR_IMR	0xe022
 #define PLA_EEE_CR		0xe040
+#define PLA_EEE_TXTWSYS		0xe04c
+#define PLA_EEE_TXTWSYS_2P5G	0xe058
 #define PLA_EEEP_CR		0xe080
 #define PLA_MAC_PWR_CTRL	0xe0c0
 #define PLA_MAC_PWR_CTRL2	0xe0ca
@@ -82,6 +90,7 @@
 #define PLA_TCR1		0xe612
 #define PLA_MTPS		0xe615
 #define PLA_TXFIFO_CTRL		0xe618
+#define PLA_TXFIFO_FULL		0xe61a
 #define PLA_RSTTALLY		0xe800
 #define PLA_CR			0xe813
 #define PLA_CRWECR		0xe81c
@@ -98,6 +107,7 @@
 #define PLA_SFF_STS_7		0xe8de
 #define PLA_PHYSTATUS		0xe908
 #define PLA_CONFIG6		0xe90a /* CONFIG6 */
+#define PLA_USB_CFG		0xe952
 #define PLA_BP_BA		0xfc26
 #define PLA_BP_0		0xfc28
 #define PLA_BP_1		0xfc2a
@@ -112,6 +122,7 @@
 #define USB_USB2PHY		0xb41e
 #define USB_SSPHYLINK1		0xb426
 #define USB_SSPHYLINK2		0xb428
+#define USB_L1_CTRL		0xb45e
 #define USB_U2P3_CTRL		0xb460
 #define USB_CSR_DUMMY1		0xb464
 #define USB_CSR_DUMMY2		0xb466
@@ -122,7 +133,12 @@
 #define USB_FW_FIX_EN0		0xcfca
 #define USB_FW_FIX_EN1		0xcfcc
 #define USB_LPM_CONFIG		0xcfd8
+#define USB_ECM_OPTION		0xcfee
 #define USB_CSTMR		0xcfef	/* RTL8153A */
+#define USB_MISC_2		0xcfff
+#define USB_ECM_OP		0xd26b
+#define USB_GPHY_CTRL		0xd284
+#define USB_SPEED_OPTION	0xd32a
 #define USB_FW_CTRL		0xd334	/* RTL8153B */
 #define USB_FC_TIMER		0xd340
 #define USB_USB_CTRL		0xd406
@@ -136,16 +152,20 @@
 #define USB_RX_EXTRA_AGGR_TMR	0xd432	/* RTL8153B */
 #define USB_TX_DMA		0xd434
 #define USB_UPT_RXDMA_OWN	0xd437
+#define USB_UPHY3_MDCMDIO	0xd480
 #define USB_TOLERANCE		0xd490
 #define USB_LPM_CTRL		0xd41a
 #define USB_BMU_RESET		0xd4b0
+#define USB_BMU_CONFIG		0xd4b4
 #define USB_U1U2_TIMER		0xd4da
 #define USB_FW_TASK		0xd4e8	/* RTL8153B */
+#define USB_RX_AGGR_NUM		0xd4ee
 #define USB_UPS_CTRL		0xd800
 #define USB_POWER_CUT		0xd80a
 #define USB_MISC_0		0xd81a
 #define USB_MISC_1		0xd81f
 #define USB_AFE_CTRL2		0xd824
+#define USB_UPHY_XTAL		0xd826
 #define USB_UPS_CFG		0xd842
 #define USB_UPS_FLAGS		0xd848
 #define USB_WDT1_CTRL		0xe404
@@ -188,6 +208,9 @@
 #define OCP_EEE_ABLE		0xa5c4
 #define OCP_EEE_ADV		0xa5d0
 #define OCP_EEE_LPABLE		0xa5d2
+#define OCP_10GBT_CTRL		0xa5d4
+#define OCP_10GBT_STAT		0xa5d6
+#define OCP_EEE_ADV2		0xa6d4
 #define OCP_PHY_STATE		0xa708		/* nway state for 8153 */
 #define OCP_PHY_PATCH_STAT	0xb800
 #define OCP_PHY_PATCH_CMD	0xb820
@@ -199,6 +222,7 @@
 /* SRAM Register */
 #define SRAM_GREEN_CFG		0x8011
 #define SRAM_LPF_CFG		0x8012
+#define SRAM_GPHY_FW_VER	0x801e
 #define SRAM_10M_AMP1		0x8080
 #define SRAM_10M_AMP2		0x8082
 #define SRAM_IMPEDANCE		0x8084
@@ -210,11 +234,19 @@
 #define RCR_AM			0x00000004
 #define RCR_AB			0x00000008
 #define RCR_ACPT_ALL		(RCR_AAP | RCR_APM | RCR_AM | RCR_AB)
+#define SLOT_EN			BIT(11)
+
+/* PLA_RCR1 */
+#define OUTER_VLAN		BIT(7)
+#define INNER_VLAN		BIT(6)
 
 /* PLA_RXFIFO_CTRL0 */
 #define RXFIFO_THR1_NORMAL	0x00080002
 #define RXFIFO_THR1_OOB		0x01800003
 
+/* PLA_RXFIFO_FULL */
+#define RXFIFO_FULL_MASK	0xfff
+
 /* PLA_RXFIFO_CTRL1 */
 #define RXFIFO_THR2_FULL	0x00000060
 #define RXFIFO_THR2_HIGH	0x00000038
@@ -285,6 +317,7 @@
 #define MCU_BORW_EN		0x4000
 
 /* PLA_CPCR */
+#define FLOW_CTRL_EN		BIT(0)
 #define CPCR_RX_VLAN		0x0040
 
 /* PLA_CFG_WOL */
@@ -310,6 +343,10 @@
 /* PLA_CONFIG6 */
 #define LANWAKE_CLR_EN		BIT(0)
 
+/* PLA_USB_CFG */
+#define EN_XG_LIP		BIT(1)
+#define EN_G_LIP		BIT(2)
+
 /* PLA_CONFIG5 */
 #define BWF_EN			0x0040
 #define MWF_EN			0x0020
@@ -333,6 +370,7 @@
 /* PLA_MAC_PWR_CTRL2 */
 #define EEE_SPDWN_RATIO		0x8007
 #define MAC_CLK_SPDWN_EN	BIT(15)
+#define EEE_SPDWN_RATIO_MASK	0xff
 
 /* PLA_MAC_PWR_CTRL3 */
 #define PLA_MCU_SPDWN_EN	BIT(14)
@@ -345,6 +383,7 @@
 #define PWRSAVE_SPDWN_EN	0x1000
 #define RXDV_SPDWN_EN		0x0800
 #define TX10MIDLE_EN		0x0100
+#define IDLE_SPDWN_EN		BIT(6)
 #define TP100_SPDWN_EN		0x0020
 #define TP500_SPDWN_EN		0x0010
 #define TP1000_SPDWN_EN		0x0008
@@ -385,6 +424,13 @@
 #define LINK_CHANGE_FLAG	BIT(8)
 #define POLL_LINK_CHG		BIT(0)
 
+/* PLA_GPHY_CTRL */
+#define GPHY_FLASH		BIT(1)
+
+/* PLA_POL_GPIO_CTRL */
+#define DACK_DET_EN		BIT(15)
+#define POL_GPHY_PATCH		BIT(4)
+
 /* USB_USB2PHY */
 #define USB2PHY_SUSPEND		0x0001
 #define USB2PHY_L1		0x0002
@@ -433,6 +479,9 @@
 #define BMU_RESET_EP_IN		0x01
 #define BMU_RESET_EP_OUT	0x02
 
+/* USB_BMU_CONFIG */
+#define ACT_ODMA		BIT(1)
+
 /* USB_UPT_RXDMA_OWN */
 #define OWN_UPDATE		BIT(0)
 #define OWN_CLEAR		BIT(1)
@@ -440,27 +489,52 @@
 /* USB_FW_TASK */
 #define FC_PATCH_TASK		BIT(1)
 
+/* USB_RX_AGGR_NUM */
+#define RX_AGGR_NUM_MASK	0x1ff
+
 /* USB_UPS_CTRL */
 #define POWER_CUT		0x0100
 
 /* USB_PM_CTRL_STATUS */
 #define RESUME_INDICATE		0x0001
 
+/* USB_ECM_OPTION */
+#define BYPASS_MAC_RESET	BIT(5)
+
 /* USB_CSTMR */
 #define FORCE_SUPER		BIT(0)
 
+/* USB_MISC_2 */
+#define UPS_FORCE_PWR_DOWN	BIT(0)
+
+/* USB_ECM_OP */
+#define	EN_ALL_SPEED		BIT(0)
+
+/* USB_GPHY_CTRL */
+#define GPHY_PATCH_DONE		BIT(2)
+#define BYPASS_FLASH		BIT(5)
+#define BACKUP_RESTRORE		BIT(6)
+
+/* USB_SPEED_OPTION */
+#define RG_PWRDN_EN		BIT(8)
+#define ALL_SPEED_OFF		BIT(9)
+
 /* USB_FW_CTRL */
 #define FLOW_CTRL_PATCH_OPT	BIT(1)
+#define AUTO_SPEEDUP		BIT(3)
+#define FLOW_CTRL_PATCH_2	BIT(8)
 
 /* USB_FC_TIMER */
 #define CTRL_TIMER_EN		BIT(15)
 
 /* USB_USB_CTRL */
+#define CDC_ECM_EN		BIT(3)
 #define RX_AGG_DISABLE		0x0010
 #define RX_ZERO_EN		0x0080
 
 /* USB_U2P3_CTRL */
 #define U2P3_ENABLE		0x0001
+#define RX_DETECT8		BIT(3)
 
 /* USB_POWER_CUT */
 #define PWR_EN			0x0001
@@ -496,8 +570,12 @@
 #define SEN_VAL_NORMAL		0xa000
 #define SEL_RXIDLE		0x0100
 
+/* USB_UPHY_XTAL */
+#define OOBS_POLLING		BIT(8)
+
 /* USB_UPS_CFG */
 #define SAW_CNT_1MS_MASK	0x0fff
+#define MID_REVERSE		BIT(5)	/* RTL8156A */
 
 /* USB_UPS_FLAGS */
 #define UPS_FLAGS_R_TUNE		BIT(0)
@@ -505,6 +583,7 @@
 #define UPS_FLAGS_250M_CKDIV		BIT(2)
 #define UPS_FLAGS_EN_ALDPS		BIT(3)
 #define UPS_FLAGS_CTAP_SHORT_DIS	BIT(4)
+#define UPS_FLAGS_SPEED_MASK		(0xf << 16)
 #define ups_flags_speed(x)		((x) << 16)
 #define UPS_FLAGS_EN_EEE		BIT(20)
 #define UPS_FLAGS_EN_500M_EEE		BIT(21)
@@ -525,6 +604,8 @@ enum spd_duplex {
 	FORCE_10M_FULL,
 	FORCE_100M_HALF,
 	FORCE_100M_FULL,
+	FORCE_1000M_FULL,
+	NWAY_2500M_FULL,
 };
 
 /* OCP_ALDPS_CONFIG */
@@ -589,6 +670,9 @@ enum spd_duplex {
 #define EN_10M_CLKDIV		BIT(11)
 #define EN_10M_BGOFF		0x0080
 
+/* OCP_10GBT_CTRL */
+#define RTL_ADV2_5G_F_R		BIT(5)	/* Advertise 2.5GBASE-T fast-retrain */
+
 /* OCP_PHY_STATE */
 #define TXDIS_STATE		0x01
 #define ABD_STATE		0x02
@@ -608,7 +692,8 @@ enum spd_duplex {
 #define EN_EMI_L		0x0040
 
 /* OCP_SYSCLK_CFG */
-#define clk_div_expo(x)		(min(x, 5) << 8)
+#define sysclk_div_expo(x)	(min(x, 5) << 8)
+#define clk_div_expo(x)		(min(x, 5) << 4)
 
 /* SRAM_GREEN_CFG */
 #define GREEN_ETH_EN		BIT(15)
@@ -639,6 +724,11 @@ enum spd_duplex {
 #define BP4_SUPER_ONLY		0x1578	/* RTL_VER_04 only */
 
 enum rtl_register_content {
+	_2500bps	= BIT(10),
+	_1250bps	= BIT(9),
+	_500bps		= BIT(8),
+	_tx_flow	= BIT(6),
+	_rx_flow	= BIT(5),
 	_1000bps	= 0x10,
 	_100bps		= 0x08,
 	_10bps		= 0x04,
@@ -646,6 +736,9 @@ enum rtl_register_content {
 	FULL_DUP	= 0x01,
 };
 
+#define is_speed_2500(_speed)	(((_speed) & (_2500bps | LINK_STATUS)) == (_2500bps | LINK_STATUS))
+#define is_flow_control(_speed)	(((_speed) & (_tx_flow | _rx_flow)) == (_tx_flow | _rx_flow))
+
 #define RTL8152_MAX_TX		4
 #define RTL8152_MAX_RX		10
 #define INTBUFSIZE		2
@@ -660,7 +753,6 @@ enum rtl_register_content {
 #define RTL8152_RMS		(VLAN_ETH_FRAME_LEN + ETH_FCS_LEN)
 #define RTL8153_RMS		RTL8153_MAX_PACKET
 #define RTL8152_TX_TIMEOUT	(5 * HZ)
-#define RTL8152_NAPI_WEIGHT	64
 #define mtu_to_size(m)		((m) + VLAN_ETH_HLEN + ETH_FCS_LEN)
 #define size_to_mtu(s)		((s) - VLAN_ETH_HLEN - ETH_FCS_LEN)
 #define rx_reserved_size(x)	(mtu_to_size(x) + sizeof(struct rx_desc) + RX_ALIGN)
@@ -797,6 +889,7 @@ struct r8152 {
 	} rtl_ops;
 
 	struct ups_info {
+		u32 r_tune:1;
 		u32 _10m_ckdiv:1;
 		u32 _250m_ckdiv:1;
 		u32 aldps:1;
@@ -838,7 +931,9 @@ struct r8152 {
 	u32 rx_buf_sz;
 	u32 rx_copybreak;
 	u32 rx_pending;
+	u32 fc_pause_on, fc_pause_off;
 
+	u32 support_2500full:1;
 	u16 ocp_base;
 	u16 speed;
 	u16 eee_adv;
@@ -998,6 +1093,15 @@ enum rtl_version {
 	RTL_VER_07,
 	RTL_VER_08,
 	RTL_VER_09,
+
+	RTL_TEST_01,
+	RTL_VER_10,
+	RTL_VER_11,
+	RTL_VER_12,
+	RTL_VER_13,
+	RTL_VER_14,
+	RTL_VER_15,
+
 	RTL_VER_MAX
 };
 
@@ -1013,6 +1117,7 @@ enum tx_csum_stat {
 #define RTL_ADVERTISED_100_FULL			BIT(3)
 #define RTL_ADVERTISED_1000_HALF		BIT(4)
 #define RTL_ADVERTISED_1000_FULL		BIT(5)
+#define RTL_ADVERTISED_2500_FULL		BIT(6)
 
 /* Maximum number of multicast addresses to filter (vs. Rx-all-multicast).
  * The RTL chips use a 64 element hash table based on the Ethernet CRC.
@@ -2606,7 +2711,7 @@ static netdev_tx_t rtl8152_start_xmit(struct sk_buff *skb,
 
 static void r8152b_reset_packet_filter(struct r8152 *tp)
 {
-	u32	ocp_data;
+	u32 ocp_data;
 
 	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_FMC);
 	ocp_data &= ~FMC_FCR_MCU_EN;
@@ -2617,14 +2722,47 @@ static void r8152b_reset_packet_filter(struct r8152 *tp)
 
 static void rtl8152_nic_reset(struct r8152 *tp)
 {
-	int	i;
+	u32 ocp_data;
+	int i;
 
-	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, CR_RST);
+	switch (tp->version) {
+	case RTL_TEST_01:
+	case RTL_VER_10:
+	case RTL_VER_11:
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR);
+		ocp_data &= ~CR_TE;
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, ocp_data);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_BMU_RESET);
+		ocp_data &= ~BMU_RESET_EP_IN;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_BMU_RESET, ocp_data);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_USB_CTRL);
+		ocp_data |= CDC_ECM_EN;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR);
+		ocp_data &= ~CR_RE;
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, ocp_data);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_BMU_RESET);
+		ocp_data |= BMU_RESET_EP_IN;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_BMU_RESET, ocp_data);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_USB_CTRL);
+		ocp_data &= ~CDC_ECM_EN;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
+		break;
 
-	for (i = 0; i < 1000; i++) {
-		if (!(ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR) & CR_RST))
-			break;
-		usleep_range(100, 400);
+	default:
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, CR_RST);
+
+		for (i = 0; i < 1000; i++) {
+			if (!(ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR) & CR_RST))
+				break;
+			usleep_range(100, 400);
+		}
+		break;
 	}
 }
 
@@ -2633,9 +2771,9 @@ static void set_tx_qlen(struct r8152 *tp)
 	tp->tx_qlen = agg_buf_sz / (mtu_to_size(tp->netdev->mtu) + sizeof(struct tx_desc));
 }
 
-static inline u8 rtl8152_get_speed(struct r8152 *tp)
+static inline u16 rtl8152_get_speed(struct r8152 *tp)
 {
-	return ocp_read_byte(tp, MCU_TYPE_PLA, PLA_PHYSTATUS);
+	return ocp_read_word(tp, MCU_TYPE_PLA, PLA_PHYSTATUS);
 }
 
 static void rtl_eee_plus_en(struct r8152 *tp, bool enable)
@@ -2795,6 +2933,7 @@ static int rtl_enable(struct r8152 *tp)
 	switch (tp->version) {
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_VER_14:
 		r8153b_rx_agg_chg_indicate(tp);
 		break;
 	default:
@@ -2832,6 +2971,7 @@ static void r8153_set_rx_early_timeout(struct r8152 *tp)
 
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_VER_14:
 		/* The RTL8153B uses USB_RX_EXTRA_AGGR_TMR for rx timeout
 		 * primarily. For USB_RX_EARLY_TIMEOUT, we fix it to 128ns.
 		 */
@@ -2841,6 +2981,18 @@ static void r8153_set_rx_early_timeout(struct r8152 *tp)
 			       ocp_data);
 		break;
 
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EARLY_TIMEOUT,
+			       640 / 8);
+		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EXTRA_AGGR_TMR,
+			       ocp_data);
+		r8153b_rx_agg_chg_indicate(tp);
+		break;
+
 	default:
 		break;
 	}
@@ -2860,8 +3012,19 @@ static void r8153_set_rx_early_size(struct r8152 *tp)
 		break;
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_VER_14:
+		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EARLY_SIZE,
+			       ocp_data / 8);
+		break;
+	case RTL_TEST_01:
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
 		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EARLY_SIZE,
 			       ocp_data / 8);
+		r8153b_rx_agg_chg_indicate(tp);
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -2871,6 +3034,8 @@ static void r8153_set_rx_early_size(struct r8152 *tp)
 
 static int rtl8153_enable(struct r8152 *tp)
 {
+	u32 ocp_data;
+
 	if (test_bit(RTL8152_UNPLUG, &tp->flags))
 		return -ENODEV;
 
@@ -2881,15 +3046,18 @@ static int rtl8153_enable(struct r8152 *tp)
 
 	rtl_set_ifg(tp, rtl8152_get_speed(tp));
 
-	if (tp->version == RTL_VER_09) {
-		u32 ocp_data;
-
+	switch (tp->version) {
+	case RTL_VER_09:
+	case RTL_VER_14:
 		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_TASK);
 		ocp_data &= ~FC_PATCH_TASK;
 		ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
 		usleep_range(1000, 2000);
 		ocp_data |= FC_PATCH_TASK;
 		ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
+		break;
+	default:
+		break;
 	}
 
 	return rtl_enable(tp);
@@ -2954,12 +3122,40 @@ static void rtl_rx_vlan_en(struct r8152 *tp, bool enable)
 {
 	u32 ocp_data;
 
-	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_CPCR);
-	if (enable)
-		ocp_data |= CPCR_RX_VLAN;
-	else
-		ocp_data &= ~CPCR_RX_VLAN;
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_CPCR, ocp_data);
+	switch (tp->version) {
+	case RTL_VER_01:
+	case RTL_VER_02:
+	case RTL_VER_03:
+	case RTL_VER_04:
+	case RTL_VER_05:
+	case RTL_VER_06:
+	case RTL_VER_07:
+	case RTL_VER_08:
+	case RTL_VER_09:
+	case RTL_VER_14:
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_CPCR);
+		if (enable)
+			ocp_data |= CPCR_RX_VLAN;
+		else
+			ocp_data &= ~CPCR_RX_VLAN;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_CPCR, ocp_data);
+		break;
+
+	case RTL_TEST_01:
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+	default:
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_RCR1);
+		if (enable)
+			ocp_data |= OUTER_VLAN | INNER_VLAN;
+		else
+			ocp_data &= ~(OUTER_VLAN | INNER_VLAN);
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_RCR1, ocp_data);
+		break;
+	}
 }
 
 static int rtl8152_set_features(struct net_device *dev,
@@ -3052,6 +3248,40 @@ static void __rtl_set_wol(struct r8152 *tp, u32 wolopts)
 		device_set_wakeup_enable(&tp->udev->dev, false);
 }
 
+static void r8153_mac_clk_speed_down(struct r8152 *tp, bool enable)
+{
+	u32 ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2);
+
+	/* MAC clock speed down */
+	if (enable)
+		ocp_data |= MAC_CLK_SPDWN_EN;
+	else
+		ocp_data &= ~MAC_CLK_SPDWN_EN;
+
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2, ocp_data);
+}
+
+static void r8156_mac_clk_spd(struct r8152 *tp, bool enable)
+{
+	u32 ocp_data;
+
+	/* MAC clock speed down */
+	if (enable) {
+		/* aldps_spdwn_ratio, tp10_spdwn_ratio */
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL,
+			       0x0403);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2);
+		ocp_data &= ~EEE_SPDWN_RATIO_MASK;
+		ocp_data |= MAC_CLK_SPDWN_EN | 0x03; /* eee_spdwn_ratio */
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2, ocp_data);
+	} else {
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2);
+		ocp_data &= ~MAC_CLK_SPDWN_EN;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2, ocp_data);
+	}
+}
+
 static void r8153_u1u2en(struct r8152 *tp, bool enable)
 {
 	u8 u1u2[8];
@@ -3111,6 +3341,9 @@ static void r8153b_ups_flags(struct r8152 *tp)
 	if (tp->ups_info.eee_cmod_lv)
 		ups_flags |= UPS_FLAGS_EEE_CMOD_LV_EN;
 
+	if (tp->ups_info.r_tune)
+		ups_flags |= UPS_FLAGS_R_TUNE;
+
 	if (tp->ups_info._10m_ckdiv)
 		ups_flags |= UPS_FLAGS_EN_10M_CKDIV;
 
@@ -3161,6 +3394,88 @@ static void r8153b_ups_flags(struct r8152 *tp)
 	ocp_write_dword(tp, MCU_TYPE_USB, USB_UPS_FLAGS, ups_flags);
 }
 
+static void r8156_ups_flags(struct r8152 *tp)
+{
+	u32 ups_flags = 0;
+
+	if (tp->ups_info.green)
+		ups_flags |= UPS_FLAGS_EN_GREEN;
+
+	if (tp->ups_info.aldps)
+		ups_flags |= UPS_FLAGS_EN_ALDPS;
+
+	if (tp->ups_info.eee)
+		ups_flags |= UPS_FLAGS_EN_EEE;
+
+	if (tp->ups_info.flow_control)
+		ups_flags |= UPS_FLAGS_EN_FLOW_CTR;
+
+	if (tp->ups_info.eee_ckdiv)
+		ups_flags |= UPS_FLAGS_EN_EEE_CKDIV;
+
+	if (tp->ups_info._10m_ckdiv)
+		ups_flags |= UPS_FLAGS_EN_10M_CKDIV;
+
+	if (tp->ups_info.eee_plloff_100)
+		ups_flags |= UPS_FLAGS_EEE_PLLOFF_100;
+
+	if (tp->ups_info.eee_plloff_giga)
+		ups_flags |= UPS_FLAGS_EEE_PLLOFF_GIGA;
+
+	if (tp->ups_info._250m_ckdiv)
+		ups_flags |= UPS_FLAGS_250M_CKDIV;
+
+	switch (tp->ups_info.speed_duplex) {
+	case FORCE_10M_HALF:
+		ups_flags |= ups_flags_speed(0);
+		break;
+	case FORCE_10M_FULL:
+		ups_flags |= ups_flags_speed(1);
+		break;
+	case FORCE_100M_HALF:
+		ups_flags |= ups_flags_speed(2);
+		break;
+	case FORCE_100M_FULL:
+		ups_flags |= ups_flags_speed(3);
+		break;
+	case NWAY_10M_HALF:
+		ups_flags |= ups_flags_speed(4);
+		break;
+	case NWAY_10M_FULL:
+		ups_flags |= ups_flags_speed(5);
+		break;
+	case NWAY_100M_HALF:
+		ups_flags |= ups_flags_speed(6);
+		break;
+	case NWAY_100M_FULL:
+		ups_flags |= ups_flags_speed(7);
+		break;
+	case NWAY_1000M_FULL:
+		ups_flags |= ups_flags_speed(8);
+		break;
+	case NWAY_2500M_FULL:
+		ups_flags |= ups_flags_speed(9);
+		break;
+	default:
+		break;
+	}
+
+	switch (tp->ups_info.lite_mode) {
+	case 1:
+		ups_flags |= 0 << 5;
+		break;
+	case 2:
+		ups_flags |= 2 << 5;
+		break;
+	case 0:
+	default:
+		ups_flags |= 1 << 5;
+		break;
+	}
+
+	ocp_write_dword(tp, MCU_TYPE_USB, USB_UPS_FLAGS, ups_flags);
+}
+
 static void rtl_green_en(struct r8152 *tp, bool enable)
 {
 	u16 data;
@@ -3224,16 +3539,56 @@ static void r8153b_ups_en(struct r8152 *tp, bool enable)
 		ocp_data |= UPS_EN | USP_PREWAKE | PHASE2_EN;
 		ocp_write_byte(tp, MCU_TYPE_USB, USB_POWER_CUT, ocp_data);
 
-		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, 0xcfff);
-		ocp_data |= BIT(0);
-		ocp_write_byte(tp, MCU_TYPE_USB, 0xcfff, ocp_data);
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+		ocp_data |= UPS_FORCE_PWR_DOWN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
+	} else {
+		ocp_data &= ~(UPS_EN | USP_PREWAKE);
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_POWER_CUT, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+		ocp_data &= ~UPS_FORCE_PWR_DOWN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
+
+		if (ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0) & PCUT_STATUS) {
+			int i;
+
+			for (i = 0; i < 500; i++) {
+				if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
+				    AUTOLOAD_DONE)
+					break;
+				msleep(20);
+			}
+
+			tp->rtl_ops.hw_phy_cfg(tp);
+
+			rtl8152_set_speed(tp, tp->autoneg, tp->speed,
+					  tp->duplex, tp->advertising);
+		}
+	}
+}
+
+static void r8153c_ups_en(struct r8152 *tp, bool enable)
+{
+	u32 ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_POWER_CUT);
+
+	if (enable) {
+		r8153b_ups_flags(tp);
+
+		ocp_data |= UPS_EN | USP_PREWAKE | PHASE2_EN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_POWER_CUT, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+		ocp_data |= UPS_FORCE_PWR_DOWN;
+		ocp_data &= ~BIT(7);
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
 	} else {
 		ocp_data &= ~(UPS_EN | USP_PREWAKE);
 		ocp_write_byte(tp, MCU_TYPE_USB, USB_POWER_CUT, ocp_data);
 
-		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, 0xcfff);
-		ocp_data &= ~BIT(0);
-		ocp_write_byte(tp, MCU_TYPE_USB, 0xcfff, ocp_data);
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+		ocp_data &= ~UPS_FORCE_PWR_DOWN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
 
 		if (ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0) & PCUT_STATUS) {
 			int i;
@@ -3250,6 +3605,55 @@ static void r8153b_ups_en(struct r8152 *tp, bool enable)
 			rtl8152_set_speed(tp, tp->autoneg, tp->speed,
 					  tp->duplex, tp->advertising);
 		}
+
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CRWECR, CRWECR_CONFIG);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_CONFIG34);
+		ocp_data |= BIT(8);
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_CONFIG34, ocp_data);
+
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CRWECR, CRWECR_NORAML);
+	}
+}
+
+static void r8156_ups_en(struct r8152 *tp, bool enable)
+{
+	u32 ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_POWER_CUT);
+
+	if (enable) {
+		r8156_ups_flags(tp);
+
+		ocp_data |= UPS_EN | USP_PREWAKE | PHASE2_EN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_POWER_CUT, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+		ocp_data |= UPS_FORCE_PWR_DOWN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
+
+		switch (tp->version) {
+		case RTL_VER_13:
+		case RTL_VER_15:
+			ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_UPHY_XTAL);
+			ocp_data &= ~OOBS_POLLING;
+			ocp_write_byte(tp, MCU_TYPE_USB, USB_UPHY_XTAL, ocp_data);
+			break;
+		default:
+			break;
+		}
+	} else {
+		ocp_data &= ~(UPS_EN | USP_PREWAKE);
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_POWER_CUT, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+		ocp_data &= ~UPS_FORCE_PWR_DOWN;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
+
+		if (ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0) & PCUT_STATUS) {
+			tp->rtl_ops.hw_phy_cfg(tp);
+
+			rtl8152_set_speed(tp, tp->autoneg, tp->speed,
+					  tp->duplex, tp->advertising);
+		}
 	}
 }
 
@@ -3382,34 +3786,71 @@ static void rtl8153b_runtime_enable(struct r8152 *tp, bool enable)
 	}
 }
 
-static void r8153_teredo_off(struct r8152 *tp)
+static void rtl8153c_runtime_enable(struct r8152 *tp, bool enable)
 {
-	u32 ocp_data;
+	if (enable) {
+		r8153_queue_wake(tp, true);
+		r8153b_u1u2en(tp, false);
+		r8153_u2p3en(tp, false);
+		rtl_runtime_suspend_enable(tp, true);
+		r8153c_ups_en(tp, true);
+	} else {
+		r8153c_ups_en(tp, false);
+		r8153_queue_wake(tp, false);
+		rtl_runtime_suspend_enable(tp, false);
+		r8153b_u1u2en(tp, true);
+	}
+}
 
-	switch (tp->version) {
-	case RTL_VER_01:
-	case RTL_VER_02:
-	case RTL_VER_03:
-	case RTL_VER_04:
-	case RTL_VER_05:
-	case RTL_VER_06:
-	case RTL_VER_07:
-		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_TEREDO_CFG);
-		ocp_data &= ~(TEREDO_SEL | TEREDO_RS_EVENT_MASK |
-			      OOB_TEREDO_EN);
-		ocp_write_word(tp, MCU_TYPE_PLA, PLA_TEREDO_CFG, ocp_data);
-		break;
+static void rtl8156_runtime_enable(struct r8152 *tp, bool enable)
+{
+	if (enable) {
+		r8153_queue_wake(tp, true);
+		r8153b_u1u2en(tp, false);
+		r8153_u2p3en(tp, false);
+		rtl_runtime_suspend_enable(tp, true);
+	} else {
+		r8153_queue_wake(tp, false);
+		rtl_runtime_suspend_enable(tp, false);
+		r8153_u2p3en(tp, true);
+		if (tp->udev->speed >= USB_SPEED_SUPER)
+			r8153b_u1u2en(tp, true);
+	}
+}
+
+static void r8153_teredo_off(struct r8152 *tp)
+{
+	u32 ocp_data;
+
+	switch (tp->version) {
+	case RTL_VER_01:
+	case RTL_VER_02:
+	case RTL_VER_03:
+	case RTL_VER_04:
+	case RTL_VER_05:
+	case RTL_VER_06:
+	case RTL_VER_07:
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_TEREDO_CFG);
+		ocp_data &= ~(TEREDO_SEL | TEREDO_RS_EVENT_MASK |
+			      OOB_TEREDO_EN);
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_TEREDO_CFG, ocp_data);
+		break;
 
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_TEST_01:
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_14:
+	case RTL_VER_15:
+	default:
 		/* The bit 0 ~ 7 are relative with teredo settings. They are
 		 * W1C (write 1 to clear), so set all 1 to disable it.
 		 */
 		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_TEREDO_CFG, 0xff);
 		break;
-
-	default:
-		break;
 	}
 
 	ocp_write_word(tp, MCU_TYPE_PLA, PLA_WDT6_CTRL, WDT6_SET_MODE);
@@ -3444,6 +3885,12 @@ static void rtl_clear_bp(struct r8152 *tp, u16 type)
 		break;
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_14:
+	case RTL_VER_15:
 	default:
 		if (type == MCU_TYPE_USB) {
 			ocp_write_byte(tp, MCU_TYPE_USB, USB_BP2_EN, 0);
@@ -3653,6 +4100,11 @@ static bool rtl8152_is_fw_mac_ok(struct r8152 *tp, struct fw_mac *mac)
 		case RTL_VER_06:
 		case RTL_VER_08:
 		case RTL_VER_09:
+		case RTL_VER_11:
+		case RTL_VER_12:
+		case RTL_VER_13:
+		case RTL_VER_14:
+		case RTL_VER_15:
 			fw_reg = 0xf800;
 			bp_ba_addr = PLA_BP_BA;
 			bp_en_addr = PLA_BP_EN;
@@ -3676,6 +4128,11 @@ static bool rtl8152_is_fw_mac_ok(struct r8152 *tp, struct fw_mac *mac)
 			break;
 		case RTL_VER_08:
 		case RTL_VER_09:
+		case RTL_VER_11:
+		case RTL_VER_12:
+		case RTL_VER_13:
+		case RTL_VER_14:
+		case RTL_VER_15:
 			fw_reg = 0xe600;
 			bp_ba_addr = USB_BP_BA;
 			bp_en_addr = USB_BP2_EN;
@@ -4215,6 +4672,22 @@ static void r8153_eee_en(struct r8152 *tp, bool enable)
 	tp->ups_info.eee = enable;
 }
 
+static void r8156_eee_en(struct r8152 *tp, bool enable)
+{
+	u16 config;
+
+	r8153_eee_en(tp, enable);
+
+	config = ocp_reg_read(tp, OCP_EEE_ADV2);
+
+	if (enable)
+		config |= MDIO_EEE_2_5GT;
+	else
+		config &= ~MDIO_EEE_2_5GT;
+
+	ocp_reg_write(tp, OCP_EEE_ADV2, config);
+}
+
 static void rtl_eee_enable(struct r8152 *tp, bool enable)
 {
 	switch (tp->version) {
@@ -4236,6 +4709,7 @@ static void rtl_eee_enable(struct r8152 *tp, bool enable)
 	case RTL_VER_06:
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_VER_14:
 		if (enable) {
 			r8153_eee_en(tp, true);
 			ocp_reg_write(tp, OCP_EEE_ADV, tp->eee_adv);
@@ -4244,6 +4718,19 @@ static void rtl_eee_enable(struct r8152 *tp, bool enable)
 			ocp_reg_write(tp, OCP_EEE_ADV, 0);
 		}
 		break;
+	case RTL_VER_10:
+	case RTL_VER_11:
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		if (enable) {
+			r8156_eee_en(tp, true);
+			ocp_reg_write(tp, OCP_EEE_ADV, tp->eee_adv);
+		} else {
+			r8156_eee_en(tp, false);
+			ocp_reg_write(tp, OCP_EEE_ADV, 0);
+		}
+		break;
 	default:
 		break;
 	}
@@ -4290,6 +4777,20 @@ static void wait_oob_link_list_ready(struct r8152 *tp)
 	}
 }
 
+static void r8156b_wait_loading_flash(struct r8152 *tp)
+{
+	if ((ocp_read_word(tp, MCU_TYPE_PLA, PLA_GPHY_CTRL) & GPHY_FLASH) &&
+	    !(ocp_read_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL) & BYPASS_FLASH)) {
+		int i;
+
+		for (i = 0; i < 100; i++) {
+			if (ocp_read_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL) & GPHY_PATCH_DONE)
+				break;
+			usleep_range(1000, 2000);
+		}
+	}
+}
+
 static void r8152b_exit_oob(struct r8152 *tp)
 {
 	u32 ocp_data;
@@ -4340,7 +4841,7 @@ static void r8152b_exit_oob(struct r8152 *tp)
 	}
 
 	/* TX share fifo free credit full threshold */
-	ocp_write_dword(tp, MCU_TYPE_PLA, PLA_TXFIFO_CTRL, TXFIFO_THR_NORMAL);
+	ocp_write_dword(tp, MCU_TYPE_PLA, PLA_TXFIFO_CTRL, TXFIFO_THR_NORMAL2);
 
 	ocp_write_byte(tp, MCU_TYPE_USB, USB_TX_AGG, TX_AGG_MAX_THRESHOLD);
 	ocp_write_dword(tp, MCU_TYPE_USB, USB_RX_BUF_TH, RX_THR_HIGH);
@@ -4517,6 +5018,21 @@ static int r8153b_post_firmware_1(struct r8152 *tp)
 	return 0;
 }
 
+static int r8153c_post_firmware_1(struct r8152 *tp)
+{
+	u32 ocp_data;
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_CTRL);
+	ocp_data |= FLOW_CTRL_PATCH_2;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_CTRL, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_TASK);
+	ocp_data |= FC_PATCH_TASK;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
+
+	return 0;
+}
+
 static void r8153_aldps_en(struct r8152 *tp, bool enable)
 {
 	u16 data;
@@ -4719,6 +5235,13 @@ static void r8153b_hw_phy_cfg(struct r8152 *tp)
 	set_bit(PHY_RESET, &tp->flags);
 }
 
+static void r8153c_hw_phy_cfg(struct r8152 *tp)
+{
+	r8153b_hw_phy_cfg(tp);
+
+	tp->ups_info.r_tune = true;
+}
+
 static void rtl8153_change_mtu(struct r8152 *tp)
 {
 	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, mtu_to_size(tp->netdev->mtu));
@@ -4806,6 +5329,7 @@ static void r8153_enter_oob(struct r8152 *tp)
 
 	case RTL_VER_08:
 	case RTL_VER_09:
+	case RTL_VER_14:
 		/* Clear teredo wake event. bit[15:8] is the teredo wakeup
 		 * type. Set it to zero. bits[7:0] are the W1C bits about
 		 * the events. Set them to all 1 to clear them.
@@ -4842,6 +5366,96 @@ static void rtl8153_disable(struct r8152 *tp)
 	r8153_aldps_en(tp, true);
 }
 
+static int rtl8156_enable(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 speed;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return -ENODEV;
+
+	set_tx_qlen(tp);
+	rtl_set_eee_plus(tp);
+	r8153_set_rx_early_timeout(tp);
+	r8153_set_rx_early_size(tp);
+
+	speed = rtl8152_get_speed(tp);
+	rtl_set_ifg(tp, speed);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4);
+	if (speed & _2500bps)
+		ocp_data &= ~IDLE_SPDWN_EN;
+	else
+		ocp_data |= IDLE_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4, ocp_data);
+
+	if (speed & _1000bps)
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS, 0x11);
+	else if (speed & _500bps)
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS, 0x3d);
+
+	if (tp->udev->speed == USB_SPEED_HIGH) {
+		/* USB 0xb45e[3:0] l1_nyet_hird */
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_L1_CTRL);
+		ocp_data &= ~0xf;
+		if (is_flow_control(speed))
+			ocp_data |= 0xf;
+		else
+			ocp_data |= 0x1;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_L1_CTRL, ocp_data);
+	}
+
+	return rtl_enable(tp);
+}
+
+static int rtl8156b_enable(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 speed;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return -ENODEV;
+
+	set_tx_qlen(tp);
+	rtl_set_eee_plus(tp);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_RX_AGGR_NUM);
+	ocp_data &= ~RX_AGGR_NUM_MASK;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_RX_AGGR_NUM, ocp_data);
+
+	r8153_set_rx_early_timeout(tp);
+	r8153_set_rx_early_size(tp);
+
+	speed = rtl8152_get_speed(tp);
+	rtl_set_ifg(tp, speed);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4);
+	if (speed & _2500bps)
+		ocp_data &= ~IDLE_SPDWN_EN;
+	else
+		ocp_data |= IDLE_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4, ocp_data);
+
+	if (tp->udev->speed == USB_SPEED_HIGH) {
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_L1_CTRL);
+		ocp_data &= ~0xf;
+		if (is_flow_control(speed))
+			ocp_data |= 0xf;
+		else
+			ocp_data |= 0x1;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_L1_CTRL, ocp_data);
+	}
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_TASK);
+	ocp_data &= ~FC_PATCH_TASK;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
+	usleep_range(1000, 2000);
+	ocp_data |= FC_PATCH_TASK;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
+
+	return rtl_enable(tp);
+}
+
 static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 			     u32 advertising)
 {
@@ -4890,58 +5504,73 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 
 		tp->mii.force_media = 1;
 	} else {
-		u16 anar, tmp1;
+		u16 orig, new1;
 		u32 support;
 
 		support = RTL_ADVERTISED_10_HALF | RTL_ADVERTISED_10_FULL |
 			  RTL_ADVERTISED_100_HALF | RTL_ADVERTISED_100_FULL;
 
-		if (tp->mii.supports_gmii)
+		if (tp->mii.supports_gmii) {
 			support |= RTL_ADVERTISED_1000_FULL;
 
+			if (tp->support_2500full)
+				support |= RTL_ADVERTISED_2500_FULL;
+		}
+
 		if (!(advertising & support))
 			return -EINVAL;
 
-		anar = r8152_mdio_read(tp, MII_ADVERTISE);
-		tmp1 = anar & ~(ADVERTISE_10HALF | ADVERTISE_10FULL |
+		orig = r8152_mdio_read(tp, MII_ADVERTISE);
+		new1 = orig & ~(ADVERTISE_10HALF | ADVERTISE_10FULL |
 				ADVERTISE_100HALF | ADVERTISE_100FULL);
 		if (advertising & RTL_ADVERTISED_10_HALF) {
-			tmp1 |= ADVERTISE_10HALF;
+			new1 |= ADVERTISE_10HALF;
 			tp->ups_info.speed_duplex = NWAY_10M_HALF;
 		}
 		if (advertising & RTL_ADVERTISED_10_FULL) {
-			tmp1 |= ADVERTISE_10FULL;
+			new1 |= ADVERTISE_10FULL;
 			tp->ups_info.speed_duplex = NWAY_10M_FULL;
 		}
 
 		if (advertising & RTL_ADVERTISED_100_HALF) {
-			tmp1 |= ADVERTISE_100HALF;
+			new1 |= ADVERTISE_100HALF;
 			tp->ups_info.speed_duplex = NWAY_100M_HALF;
 		}
 		if (advertising & RTL_ADVERTISED_100_FULL) {
-			tmp1 |= ADVERTISE_100FULL;
+			new1 |= ADVERTISE_100FULL;
 			tp->ups_info.speed_duplex = NWAY_100M_FULL;
 		}
 
-		if (anar != tmp1) {
-			r8152_mdio_write(tp, MII_ADVERTISE, tmp1);
-			tp->mii.advertising = tmp1;
+		if (orig != new1) {
+			r8152_mdio_write(tp, MII_ADVERTISE, new1);
+			tp->mii.advertising = new1;
 		}
 
 		if (tp->mii.supports_gmii) {
-			u16 gbcr;
-
-			gbcr = r8152_mdio_read(tp, MII_CTRL1000);
-			tmp1 = gbcr & ~(ADVERTISE_1000FULL |
+			orig = r8152_mdio_read(tp, MII_CTRL1000);
+			new1 = orig & ~(ADVERTISE_1000FULL |
 					ADVERTISE_1000HALF);
 
 			if (advertising & RTL_ADVERTISED_1000_FULL) {
-				tmp1 |= ADVERTISE_1000FULL;
+				new1 |= ADVERTISE_1000FULL;
 				tp->ups_info.speed_duplex = NWAY_1000M_FULL;
 			}
 
-			if (gbcr != tmp1)
-				r8152_mdio_write(tp, MII_CTRL1000, tmp1);
+			if (orig != new1)
+				r8152_mdio_write(tp, MII_CTRL1000, new1);
+		}
+
+		if (tp->support_2500full) {
+			orig = ocp_reg_read(tp, OCP_10GBT_CTRL);
+			new1 = orig & ~MDIO_AN_10GBT_CTRL_ADV2_5G;
+
+			if (advertising & RTL_ADVERTISED_2500_FULL) {
+				new1 |= MDIO_AN_10GBT_CTRL_ADV2_5G;
+				tp->ups_info.speed_duplex = NWAY_2500M_FULL;
+			}
+
+			if (orig != new1)
+				ocp_reg_write(tp, OCP_10GBT_CTRL, new1);
 		}
 
 		bmcr = BMCR_ANENABLE | BMCR_ANRESTART;
@@ -5097,116 +5726,363 @@ static void rtl8153b_down(struct r8152 *tp)
 	r8153_aldps_en(tp, true);
 }
 
-static bool rtl8152_in_nway(struct r8152 *tp)
+static void rtl8153c_change_mtu(struct r8152 *tp)
 {
-	u16 nway_state;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, mtu_to_size(tp->netdev->mtu));
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_MTPS, 10 * 1024 / 64);
 
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_OCP_GPHY_BASE, 0x2000);
-	tp->ocp_base = 0x2000;
-	ocp_write_byte(tp, MCU_TYPE_PLA, 0xb014, 0x4c);		/* phy state */
-	nway_state = ocp_read_word(tp, MCU_TYPE_PLA, 0xb01a);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_CTRL, 512 / 64);
 
-	/* bit 15: TXDIS_STATE, bit 14: ABD_STATE */
-	if (nway_state & 0xc000)
-		return false;
+	/* Adjust the tx fifo free credit full threshold, otherwise
+	 * the fifo would be too small to send a jumbo frame packet.
+	 */
+	if (tp->netdev->mtu < 8000)
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_FULL, 2048 / 8);
 	else
-		return true;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_FULL, 900 / 8);
 }
 
-static bool rtl8153_in_nway(struct r8152 *tp)
+static void rtl8153c_up(struct r8152 *tp)
 {
-	u16 phy_state = ocp_reg_read(tp, OCP_PHY_STATE) & 0xff;
-
-	if (phy_state == TXDIS_STATE || phy_state == ABD_STATE)
-		return false;
-	else
-		return true;
-}
+	u32 ocp_data;
 
-static void set_carrier(struct r8152 *tp)
-{
-	struct net_device *netdev = tp->netdev;
-	struct napi_struct *napi = &tp->napi;
-	u8 speed;
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return;
 
-	speed = rtl8152_get_speed(tp);
+	r8153b_u1u2en(tp, false);
+	r8153_u2p3en(tp, false);
+	r8153_aldps_en(tp, false);
 
-	if (speed & LINK_STATUS) {
-		if (!netif_carrier_ok(netdev)) {
-			tp->rtl_ops.enable(tp);
-			netif_stop_queue(netdev);
-			napi_disable(napi);
-			netif_carrier_on(netdev);
-			rtl_start_rx(tp);
-			clear_bit(RTL8152_SET_RX_MODE, &tp->flags);
-			_rtl8152_set_rx_mode(netdev);
-			napi_enable(&tp->napi);
-			netif_wake_queue(netdev);
-			netif_info(tp, link, netdev, "carrier on\n");
-		} else if (netif_queue_stopped(netdev) &&
-			   skb_queue_len(&tp->tx_queue) < tp->tx_qlen) {
-			netif_wake_queue(netdev);
-		}
-	} else {
-		if (netif_carrier_ok(netdev)) {
-			netif_carrier_off(netdev);
-			tasklet_disable(&tp->tx_tl);
-			napi_disable(napi);
-			tp->rtl_ops.disable(tp);
-			napi_enable(napi);
-			tasklet_enable(&tp->tx_tl);
-			netif_info(tp, link, netdev, "carrier off\n");
-		}
-	}
-}
+	rxdy_gated_en(tp, true);
+	r8153_teredo_off(tp);
 
-static void rtl_work_func_t(struct work_struct *work)
-{
-	struct r8152 *tp = container_of(work, struct r8152, schedule.work);
+	ocp_data = ocp_read_dword(tp, MCU_TYPE_PLA, PLA_RCR);
+	ocp_data &= ~RCR_ACPT_ALL;
+	ocp_write_dword(tp, MCU_TYPE_PLA, PLA_RCR, ocp_data);
 
-	/* If the device is unplugged or !netif_running(), the workqueue
-	 * doesn't need to wake the device, and could return directly.
-	 */
-	if (test_bit(RTL8152_UNPLUG, &tp->flags) || !netif_running(tp->netdev))
-		return;
+	rtl8152_nic_reset(tp);
+	rtl_reset_bmu(tp);
 
-	if (usb_autopm_get_interface(tp->intf) < 0)
-		return;
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
+	ocp_data &= ~NOW_IS_OOB;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, ocp_data);
 
-	if (!test_bit(WORK_ENABLE, &tp->flags))
-		goto out1;
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_SFF_STS_7);
+	ocp_data &= ~MCU_BORW_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_SFF_STS_7, ocp_data);
 
-	if (!mutex_trylock(&tp->control)) {
-		schedule_delayed_work(&tp->schedule, 0);
-		goto out1;
-	}
+	wait_oob_link_list_ready(tp);
 
-	if (test_and_clear_bit(RTL8152_LINK_CHG, &tp->flags))
-		set_carrier(tp);
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_SFF_STS_7);
+	ocp_data |= RE_INIT_LL;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_SFF_STS_7, ocp_data);
 
-	if (test_and_clear_bit(RTL8152_SET_RX_MODE, &tp->flags))
-		_rtl8152_set_rx_mode(tp->netdev);
+	wait_oob_link_list_ready(tp);
 
-	/* don't schedule tasket before linking */
-	if (test_and_clear_bit(SCHEDULE_TASKLET, &tp->flags) &&
-	    netif_carrier_ok(tp->netdev))
-		tasklet_schedule(&tp->tx_tl);
+	rtl_rx_vlan_en(tp, tp->netdev->features & NETIF_F_HW_VLAN_CTAG_RX);
 
-	mutex_unlock(&tp->control);
+	rtl8153c_change_mtu(tp);
 
-out1:
-	usb_autopm_put_interface(tp->intf);
-}
+	rtl8152_nic_reset(tp);
 
-static void rtl_hw_phy_work_func_t(struct work_struct *work)
-{
-	struct r8152 *tp = container_of(work, struct r8152, hw_phy_work.work);
+	/* rx share fifo credit full threshold */
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_RXFIFO_CTRL0, 0x02);
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_RXFIFO_FULL, 0x08);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RXFIFO_CTRL1, RXFIFO_THR2_NORMAL);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RXFIFO_CTRL2, RXFIFO_THR3_NORMAL);
 
-	if (test_bit(RTL8152_UNPLUG, &tp->flags))
-		return;
+	ocp_write_dword(tp, MCU_TYPE_USB, USB_RX_BUF_TH, RX_THR_B);
 
-	if (usb_autopm_get_interface(tp->intf) < 0)
-		return;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CRWECR, CRWECR_CONFIG);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_CONFIG34);
+	ocp_data |= BIT(8);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_CONFIG34, ocp_data);
+
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CRWECR, CRWECR_NORAML);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data &= ~PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
+	r8153_aldps_en(tp, true);
+	r8153b_u1u2en(tp, true);
+}
+
+static inline u32 fc_pause_on_auto(struct r8152 *tp)
+{
+	return (ALIGN(mtu_to_size(tp->netdev->mtu), 1024) + 6 * 1024);
+}
+
+static inline u32 fc_pause_off_auto(struct r8152 *tp)
+{
+	return (ALIGN(mtu_to_size(tp->netdev->mtu), 1024) + 14 * 1024);
+}
+
+static void r8156_fc_parameter(struct r8152 *tp)
+{
+	u32 pause_on = tp->fc_pause_on ? tp->fc_pause_on : fc_pause_on_auto(tp);
+	u32 pause_off = tp->fc_pause_off ? tp->fc_pause_off : fc_pause_off_auto(tp);
+
+	switch (tp->version) {
+	case RTL_VER_10:
+	case RTL_VER_11:
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_RX_FIFO_FULL, pause_on / 8);
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_RX_FIFO_EMPTY, pause_off / 8);
+		break;
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_RX_FIFO_FULL, pause_on / 16);
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_RX_FIFO_EMPTY, pause_off / 16);
+		break;
+	default:
+		break;
+	}
+}
+
+static void rtl8156_change_mtu(struct r8152 *tp)
+{
+	u32 rx_max_size = mtu_to_size(tp->netdev->mtu);
+
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, rx_max_size);
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_MTPS, MTPS_JUMBO);
+	r8156_fc_parameter(tp);
+
+	/* TX share fifo free credit full threshold */
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_CTRL, 512 / 64);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_FULL,
+		       ALIGN(rx_max_size + sizeof(struct tx_desc), 1024) / 16);
+}
+
+static void rtl8156_up(struct r8152 *tp)
+{
+	u32 ocp_data;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return;
+
+	r8153b_u1u2en(tp, false);
+	r8153_u2p3en(tp, false);
+	r8153_aldps_en(tp, false);
+
+	rxdy_gated_en(tp, true);
+	r8153_teredo_off(tp);
+
+	ocp_data = ocp_read_dword(tp, MCU_TYPE_PLA, PLA_RCR);
+	ocp_data &= ~RCR_ACPT_ALL;
+	ocp_write_dword(tp, MCU_TYPE_PLA, PLA_RCR, ocp_data);
+
+	rtl8152_nic_reset(tp);
+	rtl_reset_bmu(tp);
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
+	ocp_data &= ~NOW_IS_OOB;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_SFF_STS_7);
+	ocp_data &= ~MCU_BORW_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_SFF_STS_7, ocp_data);
+
+	rtl_rx_vlan_en(tp, tp->netdev->features & NETIF_F_HW_VLAN_CTAG_RX);
+
+	rtl8156_change_mtu(tp);
+
+	switch (tp->version) {
+	case RTL_TEST_01:
+	case RTL_VER_10:
+	case RTL_VER_11:
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_BMU_CONFIG);
+		ocp_data |= ACT_ODMA;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_BMU_CONFIG, ocp_data);
+		break;
+	default:
+		break;
+	}
+
+	/* share FIFO settings */
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_RXFIFO_FULL);
+	ocp_data &= ~RXFIFO_FULL_MASK;
+	ocp_data |= 0x08;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RXFIFO_FULL, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data &= ~PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_SPEED_OPTION);
+	ocp_data &= ~(RG_PWRDN_EN | ALL_SPEED_OFF);
+	ocp_write_word(tp, MCU_TYPE_USB, USB_SPEED_OPTION, ocp_data);
+
+	ocp_write_dword(tp, MCU_TYPE_USB, USB_RX_BUF_TH, 0x00600400);
+
+	if (tp->saved_wolopts != __rtl_get_wol(tp)) {
+		netif_warn(tp, ifup, tp->netdev, "wol setting is changed\n");
+		__rtl_set_wol(tp, tp->saved_wolopts);
+	}
+
+	r8153_aldps_en(tp, true);
+	r8153_u2p3en(tp, true);
+
+	if (tp->udev->speed >= USB_SPEED_SUPER)
+		r8153b_u1u2en(tp, true);
+}
+
+static void rtl8156_down(struct r8152 *tp)
+{
+	u32 ocp_data;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags)) {
+		rtl_drop_queued_tx(tp);
+		return;
+	}
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data |= PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
+	r8153b_u1u2en(tp, false);
+	r8153_u2p3en(tp, false);
+	r8153b_power_cut_en(tp, false);
+	r8153_aldps_en(tp, false);
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
+	ocp_data &= ~NOW_IS_OOB;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, ocp_data);
+
+	rtl_disable(tp);
+	rtl_reset_bmu(tp);
+
+	/* Clear teredo wake event. bit[15:8] is the teredo wakeup
+	 * type. Set it to zero. bits[7:0] are the W1C bits about
+	 * the events. Set them to all 1 to clear them.
+	 */
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TEREDO_WAKE_BASE, 0x00ff);
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
+	ocp_data |= NOW_IS_OOB;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, ocp_data);
+
+	rtl_rx_vlan_en(tp, true);
+	rxdy_gated_en(tp, false);
+
+	ocp_data = ocp_read_dword(tp, MCU_TYPE_PLA, PLA_RCR);
+	ocp_data |= RCR_APM | RCR_AM | RCR_AB;
+	ocp_write_dword(tp, MCU_TYPE_PLA, PLA_RCR, ocp_data);
+
+	r8153_aldps_en(tp, true);
+}
+
+static bool rtl8152_in_nway(struct r8152 *tp)
+{
+	u16 nway_state;
+
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_OCP_GPHY_BASE, 0x2000);
+	tp->ocp_base = 0x2000;
+	ocp_write_byte(tp, MCU_TYPE_PLA, 0xb014, 0x4c);		/* phy state */
+	nway_state = ocp_read_word(tp, MCU_TYPE_PLA, 0xb01a);
+
+	/* bit 15: TXDIS_STATE, bit 14: ABD_STATE */
+	if (nway_state & 0xc000)
+		return false;
+	else
+		return true;
+}
+
+static bool rtl8153_in_nway(struct r8152 *tp)
+{
+	u16 phy_state = ocp_reg_read(tp, OCP_PHY_STATE) & 0xff;
+
+	if (phy_state == TXDIS_STATE || phy_state == ABD_STATE)
+		return false;
+	else
+		return true;
+}
+
+static void set_carrier(struct r8152 *tp)
+{
+	struct net_device *netdev = tp->netdev;
+	struct napi_struct *napi = &tp->napi;
+	u16 speed;
+
+	speed = rtl8152_get_speed(tp);
+
+	if (speed & LINK_STATUS) {
+		if (!netif_carrier_ok(netdev)) {
+			tp->rtl_ops.enable(tp);
+			netif_stop_queue(netdev);
+			napi_disable(napi);
+			netif_carrier_on(netdev);
+			rtl_start_rx(tp);
+			clear_bit(RTL8152_SET_RX_MODE, &tp->flags);
+			_rtl8152_set_rx_mode(netdev);
+			napi_enable(napi);
+			netif_wake_queue(netdev);
+			netif_info(tp, link, netdev, "carrier on\n");
+		} else if (netif_queue_stopped(netdev) &&
+			   skb_queue_len(&tp->tx_queue) < tp->tx_qlen) {
+			netif_wake_queue(netdev);
+		}
+	} else {
+		if (netif_carrier_ok(netdev)) {
+			netif_carrier_off(netdev);
+			tasklet_disable(&tp->tx_tl);
+			napi_disable(napi);
+			tp->rtl_ops.disable(tp);
+			napi_enable(napi);
+			tasklet_enable(&tp->tx_tl);
+			netif_info(tp, link, netdev, "carrier off\n");
+		}
+	}
+}
+
+static void rtl_work_func_t(struct work_struct *work)
+{
+	struct r8152 *tp = container_of(work, struct r8152, schedule.work);
+
+	/* If the device is unplugged or !netif_running(), the workqueue
+	 * doesn't need to wake the device, and could return directly.
+	 */
+	if (test_bit(RTL8152_UNPLUG, &tp->flags) || !netif_running(tp->netdev))
+		return;
+
+	if (usb_autopm_get_interface(tp->intf) < 0)
+		return;
+
+	if (!test_bit(WORK_ENABLE, &tp->flags))
+		goto out1;
+
+	if (!mutex_trylock(&tp->control)) {
+		schedule_delayed_work(&tp->schedule, 0);
+		goto out1;
+	}
+
+	if (test_and_clear_bit(RTL8152_LINK_CHG, &tp->flags))
+		set_carrier(tp);
+
+	if (test_and_clear_bit(RTL8152_SET_RX_MODE, &tp->flags))
+		_rtl8152_set_rx_mode(tp->netdev);
+
+	/* don't schedule tasket before linking */
+	if (test_and_clear_bit(SCHEDULE_TASKLET, &tp->flags) &&
+	    netif_carrier_ok(tp->netdev))
+		tasklet_schedule(&tp->tx_tl);
+
+	mutex_unlock(&tp->control);
+
+out1:
+	usb_autopm_put_interface(tp->intf);
+}
+
+static void rtl_hw_phy_work_func_t(struct work_struct *work)
+{
+	struct r8152 *tp = container_of(work, struct r8152, hw_phy_work.work);
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return;
+
+	if (usb_autopm_get_interface(tp->intf) < 0)
+		return;
 
 	mutex_lock(&tp->control);
 
@@ -5399,7 +6275,1068 @@ static void r8152b_init(struct r8152 *tp)
 	ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
 }
 
-static void r8153_init(struct r8152 *tp)
+static void r8153_init(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 data;
+	int i;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return;
+
+	r8153_u1u2en(tp, false);
+
+	for (i = 0; i < 500; i++) {
+		if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
+		    AUTOLOAD_DONE)
+			break;
+
+		msleep(20);
+		if (test_bit(RTL8152_UNPLUG, &tp->flags))
+			break;
+	}
+
+	data = r8153_phy_status(tp, 0);
+
+	if (tp->version == RTL_VER_03 || tp->version == RTL_VER_04 ||
+	    tp->version == RTL_VER_05)
+		ocp_reg_write(tp, OCP_ADC_CFG, CKADSEL_L | ADC_EN | EN_EMI_L);
+
+	data = r8152_mdio_read(tp, MII_BMCR);
+	if (data & BMCR_PDOWN) {
+		data &= ~BMCR_PDOWN;
+		r8152_mdio_write(tp, MII_BMCR, data);
+	}
+
+	data = r8153_phy_status(tp, PHY_STAT_LAN_ON);
+
+	r8153_u2p3en(tp, false);
+
+	if (tp->version == RTL_VER_04) {
+		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_SSPHYLINK2);
+		ocp_data &= ~pwd_dn_scale_mask;
+		ocp_data |= pwd_dn_scale(96);
+		ocp_write_word(tp, MCU_TYPE_USB, USB_SSPHYLINK2, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_USB2PHY);
+		ocp_data |= USB2PHY_L1 | USB2PHY_SUSPEND;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_USB2PHY, ocp_data);
+	} else if (tp->version == RTL_VER_05) {
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_DMY_REG0);
+		ocp_data &= ~ECM_ALDPS;
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_DMY_REG0, ocp_data);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1);
+		if (ocp_read_word(tp, MCU_TYPE_USB, USB_BURST_SIZE) == 0)
+			ocp_data &= ~DYNAMIC_BURST;
+		else
+			ocp_data |= DYNAMIC_BURST;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1, ocp_data);
+	} else if (tp->version == RTL_VER_06) {
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1);
+		if (ocp_read_word(tp, MCU_TYPE_USB, USB_BURST_SIZE) == 0)
+			ocp_data &= ~DYNAMIC_BURST;
+		else
+			ocp_data |= DYNAMIC_BURST;
+		ocp_write_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1, ocp_data);
+
+		r8153_queue_wake(tp, false);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
+		if (rtl8152_get_speed(tp) & LINK_STATUS)
+			ocp_data |= CUR_LINK_OK;
+		else
+			ocp_data &= ~CUR_LINK_OK;
+		ocp_data |= POLL_LINK_CHG;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
+	}
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY2);
+	ocp_data |= EP4_FULL_FC;
+	ocp_write_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY2, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_WDT11_CTRL);
+	ocp_data &= ~TIMER11_EN;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_WDT11_CTRL, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_LED_FEATURE);
+	ocp_data &= ~LED_MODE_MASK;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_LED_FEATURE, ocp_data);
+
+	ocp_data = FIFO_EMPTY_1FB | ROK_EXIT_LPM;
+	if (tp->version == RTL_VER_04 && tp->udev->speed < USB_SPEED_SUPER)
+		ocp_data |= LPM_TIMER_500MS;
+	else
+		ocp_data |= LPM_TIMER_500US;
+	ocp_write_byte(tp, MCU_TYPE_USB, USB_LPM_CTRL, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_AFE_CTRL2);
+	ocp_data &= ~SEN_VAL_MASK;
+	ocp_data |= SEN_VAL_NORMAL | SEL_RXIDLE;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_AFE_CTRL2, ocp_data);
+
+	ocp_write_word(tp, MCU_TYPE_USB, USB_CONNECT_TIMER, 0x0001);
+
+	r8153_power_cut_en(tp, false);
+	rtl_runtime_suspend_enable(tp, false);
+	r8153_mac_clk_speed_down(tp, false);
+	r8153_u1u2en(tp, true);
+	usb_enable_lpm(tp->udev);
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CONFIG6);
+	ocp_data |= LANWAKE_CLR_EN;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CONFIG6, ocp_data);
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_LWAKE_CTRL_REG);
+	ocp_data &= ~LANWAKE_PIN;
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_LWAKE_CTRL_REG, ocp_data);
+
+	/* rx aggregation */
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_USB_CTRL);
+	ocp_data &= ~(RX_AGG_DISABLE | RX_ZERO_EN);
+	if (test_bit(DELL_TB_RX_AGG_BUG, &tp->flags))
+		ocp_data |= RX_AGG_DISABLE;
+
+	ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
+
+	rtl_tally_reset(tp);
+
+	switch (tp->udev->speed) {
+	case USB_SPEED_SUPER:
+	case USB_SPEED_SUPER_PLUS:
+		tp->coalesce = COALESCE_SUPER;
+		break;
+	case USB_SPEED_HIGH:
+		tp->coalesce = COALESCE_HIGH;
+		break;
+	default:
+		tp->coalesce = COALESCE_SLOW;
+		break;
+	}
+}
+
+static void r8153b_init(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 data;
+	int i;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return;
+
+	r8153b_u1u2en(tp, false);
+
+	for (i = 0; i < 500; i++) {
+		if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
+		    AUTOLOAD_DONE)
+			break;
+
+		msleep(20);
+		if (test_bit(RTL8152_UNPLUG, &tp->flags))
+			break;
+	}
+
+	data = r8153_phy_status(tp, 0);
+
+	data = r8152_mdio_read(tp, MII_BMCR);
+	if (data & BMCR_PDOWN) {
+		data &= ~BMCR_PDOWN;
+		r8152_mdio_write(tp, MII_BMCR, data);
+	}
+
+	data = r8153_phy_status(tp, PHY_STAT_LAN_ON);
+
+	r8153_u2p3en(tp, false);
+
+	/* MSC timer = 0xfff * 8ms = 32760 ms */
+	ocp_write_word(tp, MCU_TYPE_USB, USB_MSC_TIMER, 0x0fff);
+
+	r8153b_power_cut_en(tp, false);
+	r8153b_ups_en(tp, false);
+	r8153_queue_wake(tp, false);
+	rtl_runtime_suspend_enable(tp, false);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
+	if (rtl8152_get_speed(tp) & LINK_STATUS)
+		ocp_data |= CUR_LINK_OK;
+	else
+		ocp_data &= ~CUR_LINK_OK;
+	ocp_data |= POLL_LINK_CHG;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
+
+	if (tp->udev->speed >= USB_SPEED_SUPER)
+		r8153b_u1u2en(tp, true);
+
+	usb_enable_lpm(tp->udev);
+
+	/* MAC clock speed down */
+	r8153_mac_clk_speed_down(tp, true);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data &= ~PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
+	if (tp->version == RTL_VER_09) {
+		/* Disable Test IO for 32QFN */
+		if (ocp_read_byte(tp, MCU_TYPE_PLA, 0xdc00) & BIT(5)) {
+			ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR);
+			ocp_data |= TEST_IO_OFF;
+			ocp_write_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR, ocp_data);
+		}
+	}
+
+	set_bit(GREEN_ETHERNET, &tp->flags);
+
+	/* rx aggregation */
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_USB_CTRL);
+	ocp_data &= ~(RX_AGG_DISABLE | RX_ZERO_EN);
+	ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
+
+	rtl_tally_reset(tp);
+
+	tp->coalesce = 15000;	/* 15 us */
+}
+
+static void r8153c_init(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 data;
+	int i;
+
+	if (test_bit(RTL8152_UNPLUG, &tp->flags))
+		return;
+
+	r8153b_u1u2en(tp, false);
+
+	/* Disable spi_en */
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CRWECR, CRWECR_CONFIG);
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_CONFIG5);
+	ocp_data &= ~BIT(3);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_CONFIG5, ocp_data);
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, 0xcbf0);
+	ocp_data |= BIT(1);
+	ocp_write_word(tp, MCU_TYPE_USB, 0xcbf0, ocp_data);
+
+	for (i = 0; i < 500; i++) {
+		if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
+		    AUTOLOAD_DONE)
+			break;
+
+		msleep(20);
+		if (test_bit(RTL8152_UNPLUG, &tp->flags))
+			return;
+	}
+
+	data = r8153_phy_status(tp, 0);
+
+	data = r8152_mdio_read(tp, MII_BMCR);
+	if (data & BMCR_PDOWN) {
+		data &= ~BMCR_PDOWN;
+		r8152_mdio_write(tp, MII_BMCR, data);
+	}
+
+	data = r8153_phy_status(tp, PHY_STAT_LAN_ON);
+
+	r8153_u2p3en(tp, false);
+
+	/* MSC timer = 0xfff * 8ms = 32760 ms */
+	ocp_write_word(tp, MCU_TYPE_USB, USB_MSC_TIMER, 0x0fff);
+
+	r8153b_power_cut_en(tp, false);
+	r8153c_ups_en(tp, false);
+	r8153_queue_wake(tp, false);
+	rtl_runtime_suspend_enable(tp, false);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
+	if (rtl8152_get_speed(tp) & LINK_STATUS)
+		ocp_data |= CUR_LINK_OK;
+	else
+		ocp_data &= ~CUR_LINK_OK;
+
+	ocp_data |= POLL_LINK_CHG;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
+
+	r8153b_u1u2en(tp, true);
+
+	usb_enable_lpm(tp->udev);
+
+	/* MAC clock speed down */
+	r8153_mac_clk_speed_down(tp, true);
+
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_MISC_2);
+	ocp_data &= ~BIT(7);
+	ocp_write_byte(tp, MCU_TYPE_USB, USB_MISC_2, ocp_data);
+
+	set_bit(GREEN_ETHERNET, &tp->flags);
+
+	/* rx aggregation */
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_USB_CTRL);
+	ocp_data &= ~(RX_AGG_DISABLE | RX_ZERO_EN);
+	ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
+
+	rtl_tally_reset(tp);
+
+	tp->coalesce = 15000;	/* 15 us */
+}
+
+static void r8156_hw_phy_cfg(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 data;
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
+	if (ocp_data & PCUT_STATUS) {
+		ocp_data &= ~PCUT_STATUS;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_MISC_0, ocp_data);
+	}
+
+	data = r8153_phy_status(tp, 0);
+	switch (data) {
+	case PHY_STAT_EXT_INIT:
+		rtl8152_apply_firmware(tp, true);
+
+		data = ocp_reg_read(tp, 0xa468);
+		data &= ~(BIT(3) | BIT(1));
+		ocp_reg_write(tp, 0xa468, data);
+		break;
+	case PHY_STAT_LAN_ON:
+	case PHY_STAT_PWRDN:
+	default:
+		rtl8152_apply_firmware(tp, false);
+		break;
+	}
+
+	/* disable ALDPS before updating the PHY parameters */
+	r8153_aldps_en(tp, false);
+
+	/* disable EEE before updating the PHY parameters */
+	rtl_eee_enable(tp, false);
+
+	data = r8153_phy_status(tp, PHY_STAT_LAN_ON);
+	WARN_ON_ONCE(data != PHY_STAT_LAN_ON);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR);
+	ocp_data |= PFM_PWM_SWITCH;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR, ocp_data);
+
+	switch (tp->version) {
+	case RTL_VER_10:
+		data = ocp_reg_read(tp, 0xad40);
+		data &= ~0x3ff;
+		data |= BIT(7) | BIT(2);
+		ocp_reg_write(tp, 0xad40, data);
+
+		data = ocp_reg_read(tp, 0xad4e);
+		data |= BIT(4);
+		ocp_reg_write(tp, 0xad4e, data);
+		data = ocp_reg_read(tp, 0xad16);
+		data &= ~0x3ff;
+		data |= 0x6;
+		ocp_reg_write(tp, 0xad16, data);
+		data = ocp_reg_read(tp, 0xad32);
+		data &= ~0x3f;
+		data |= 6;
+		ocp_reg_write(tp, 0xad32, data);
+		data = ocp_reg_read(tp, 0xac08);
+		data &= ~(BIT(12) | BIT(8));
+		ocp_reg_write(tp, 0xac08, data);
+		data = ocp_reg_read(tp, 0xac8a);
+		data |= BIT(12) | BIT(13) | BIT(14);
+		data &= ~BIT(15);
+		ocp_reg_write(tp, 0xac8a, data);
+		data = ocp_reg_read(tp, 0xad18);
+		data |= BIT(10);
+		ocp_reg_write(tp, 0xad18, data);
+		data = ocp_reg_read(tp, 0xad1a);
+		data |= 0x3ff;
+		ocp_reg_write(tp, 0xad1a, data);
+		data = ocp_reg_read(tp, 0xad1c);
+		data |= 0x3ff;
+		ocp_reg_write(tp, 0xad1c, data);
+
+		data = sram_read(tp, 0x80ea);
+		data &= ~0xff00;
+		data |= 0xc400;
+		sram_write(tp, 0x80ea, data);
+		data = sram_read(tp, 0x80eb);
+		data &= ~0x0700;
+		data |= 0x0300;
+		sram_write(tp, 0x80eb, data);
+		data = sram_read(tp, 0x80f8);
+		data &= ~0xff00;
+		data |= 0x1c00;
+		sram_write(tp, 0x80f8, data);
+		data = sram_read(tp, 0x80f1);
+		data &= ~0xff00;
+		data |= 0x3000;
+		sram_write(tp, 0x80f1, data);
+
+		data = sram_read(tp, 0x80fe);
+		data &= ~0xff00;
+		data |= 0xa500;
+		sram_write(tp, 0x80fe, data);
+		data = sram_read(tp, 0x8102);
+		data &= ~0xff00;
+		data |= 0x5000;
+		sram_write(tp, 0x8102, data);
+		data = sram_read(tp, 0x8015);
+		data &= ~0xff00;
+		data |= 0x3300;
+		sram_write(tp, 0x8015, data);
+		data = sram_read(tp, 0x8100);
+		data &= ~0xff00;
+		data |= 0x7000;
+		sram_write(tp, 0x8100, data);
+		data = sram_read(tp, 0x8014);
+		data &= ~0xff00;
+		data |= 0xf000;
+		sram_write(tp, 0x8014, data);
+		data = sram_read(tp, 0x8016);
+		data &= ~0xff00;
+		data |= 0x6500;
+		sram_write(tp, 0x8016, data);
+		data = sram_read(tp, 0x80dc);
+		data &= ~0xff00;
+		data |= 0xed00;
+		sram_write(tp, 0x80dc, data);
+		data = sram_read(tp, 0x80df);
+		data |= BIT(8);
+		sram_write(tp, 0x80df, data);
+		data = sram_read(tp, 0x80e1);
+		data &= ~BIT(8);
+		sram_write(tp, 0x80e1, data);
+
+		data = ocp_reg_read(tp, 0xbf06);
+		data &= ~0x003f;
+		data |= 0x0038;
+		ocp_reg_write(tp, 0xbf06, data);
+
+		sram_write(tp, 0x819f, 0xddb6);
+
+		ocp_reg_write(tp, 0xbc34, 0x5555);
+		data = ocp_reg_read(tp, 0xbf0a);
+		data &= ~0x0e00;
+		data |= 0x0a00;
+		ocp_reg_write(tp, 0xbf0a, data);
+
+		data = ocp_reg_read(tp, 0xbd2c);
+		data &= ~BIT(13);
+		ocp_reg_write(tp, 0xbd2c, data);
+		break;
+	case RTL_VER_11:
+		data = ocp_reg_read(tp, 0xad16);
+		data |= 0x3ff;
+		ocp_reg_write(tp, 0xad16, data);
+		data = ocp_reg_read(tp, 0xad32);
+		data &= ~0x3f;
+		data |= 6;
+		ocp_reg_write(tp, 0xad32, data);
+		data = ocp_reg_read(tp, 0xac08);
+		data &= ~(BIT(12) | BIT(8));
+		ocp_reg_write(tp, 0xac08, data);
+		data = ocp_reg_read(tp, 0xacc0);
+		data &= ~0x3;
+		data |= BIT(1);
+		ocp_reg_write(tp, 0xacc0, data);
+		data = ocp_reg_read(tp, 0xad40);
+		data &= ~0xe7;
+		data |= BIT(6) | BIT(2);
+		ocp_reg_write(tp, 0xad40, data);
+		data = ocp_reg_read(tp, 0xac14);
+		data &= ~BIT(7);
+		ocp_reg_write(tp, 0xac14, data);
+		data = ocp_reg_read(tp, 0xac80);
+		data &= ~(BIT(8) | BIT(9));
+		ocp_reg_write(tp, 0xac80, data);
+		data = ocp_reg_read(tp, 0xac5e);
+		data &= ~0x7;
+		data |= BIT(1);
+		ocp_reg_write(tp, 0xac5e, data);
+		ocp_reg_write(tp, 0xad4c, 0x00a8);
+		ocp_reg_write(tp, 0xac5c, 0x01ff);
+		data = ocp_reg_read(tp, 0xac8a);
+		data &= ~0xf0;
+		data |= BIT(4) | BIT(5);
+		ocp_reg_write(tp, 0xac8a, data);
+		ocp_reg_write(tp, 0xb87c, 0x8157);
+		data = ocp_reg_read(tp, 0xb87e);
+		data &= ~0xff00;
+		data |= 0x0500;
+		ocp_reg_write(tp, 0xb87e, data);
+		ocp_reg_write(tp, 0xb87c, 0x8159);
+		data = ocp_reg_read(tp, 0xb87e);
+		data &= ~0xff00;
+		data |= 0x0700;
+		ocp_reg_write(tp, 0xb87e, data);
+
+		/* AAGC */
+		ocp_reg_write(tp, 0xb87c, 0x80a2);
+		ocp_reg_write(tp, 0xb87e, 0x0153);
+		ocp_reg_write(tp, 0xb87c, 0x809c);
+		ocp_reg_write(tp, 0xb87e, 0x0153);
+
+		/* EEE parameter */
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS_2P5G, 0x0056);
+
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_USB_CFG);
+		ocp_data |= EN_XG_LIP | EN_G_LIP;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_USB_CFG, ocp_data);
+
+		sram_write(tp, 0x8257, 0x020f); /*  XG PLL */
+		sram_write(tp, 0x80ea, 0x7843); /* GIGA Master */
+
+		if (rtl_phy_patch_request(tp, true, true))
+			return;
+
+		/* Advance EEE */
+		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4);
+		ocp_data |= EEE_SPDWN_EN;
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4, ocp_data);
+
+		data = ocp_reg_read(tp, OCP_DOWN_SPEED);
+		data &= ~(EN_EEE_100 | EN_EEE_1000);
+		data |= EN_10M_CLKDIV;
+		ocp_reg_write(tp, OCP_DOWN_SPEED, data);
+		tp->ups_info._10m_ckdiv = true;
+		tp->ups_info.eee_plloff_100 = false;
+		tp->ups_info.eee_plloff_giga = false;
+
+		data = ocp_reg_read(tp, OCP_POWER_CFG);
+		data &= ~EEE_CLKDIV_EN;
+		ocp_reg_write(tp, OCP_POWER_CFG, data);
+		tp->ups_info.eee_ckdiv = false;
+
+		ocp_reg_write(tp, OCP_SYSCLK_CFG, 0);
+		ocp_reg_write(tp, OCP_SYSCLK_CFG, sysclk_div_expo(5));
+		tp->ups_info._250m_ckdiv = false;
+
+		rtl_phy_patch_request(tp, false, true);
+
+		/* enable ADC Ibias Cal */
+		data = ocp_reg_read(tp, 0xd068);
+		data |= BIT(13);
+		ocp_reg_write(tp, 0xd068, data);
+
+		/* enable Thermal Sensor */
+		data = sram_read(tp, 0x81a2);
+		data &= ~BIT(8);
+		sram_write(tp, 0x81a2, data);
+		data = ocp_reg_read(tp, 0xb54c);
+		data &= ~0xff00;
+		data |= 0xdb00;
+		ocp_reg_write(tp, 0xb54c, data);
+
+		/* Nway 2.5G Lite */
+		data = ocp_reg_read(tp, 0xa454);
+		data &= ~BIT(0);
+		ocp_reg_write(tp, 0xa454, data);
+
+		/* CS DSP solution */
+		data = ocp_reg_read(tp, OCP_10GBT_CTRL);
+		data |= RTL_ADV2_5G_F_R;
+		ocp_reg_write(tp, OCP_10GBT_CTRL, data);
+		data = ocp_reg_read(tp, 0xad4e);
+		data &= ~BIT(4);
+		ocp_reg_write(tp, 0xad4e, data);
+		data = ocp_reg_read(tp, 0xa86a);
+		data &= ~BIT(0);
+		ocp_reg_write(tp, 0xa86a, data);
+
+		/* MDI SWAP */
+		if ((ocp_read_word(tp, MCU_TYPE_USB, USB_UPS_CFG) & MID_REVERSE) &&
+		    (ocp_reg_read(tp, 0xd068) & BIT(1))) {
+			u16 swap_a, swap_b;
+
+			data = ocp_reg_read(tp, 0xd068);
+			data &= ~0x1f;
+			data |= 0x1; /* p0 */
+			ocp_reg_write(tp, 0xd068, data);
+			swap_a = ocp_reg_read(tp, 0xd06a);
+			data &= ~0x18;
+			data |= 0x18; /* p3 */
+			ocp_reg_write(tp, 0xd068, data);
+			swap_b = ocp_reg_read(tp, 0xd06a);
+			data &= ~0x18; /* p0 */
+			ocp_reg_write(tp, 0xd068, data);
+			ocp_reg_write(tp, 0xd06a,
+				      (swap_a & ~0x7ff) | (swap_b & 0x7ff));
+			data |= 0x18; /* p3 */
+			ocp_reg_write(tp, 0xd068, data);
+			ocp_reg_write(tp, 0xd06a,
+				      (swap_b & ~0x7ff) | (swap_a & 0x7ff));
+			data &= ~0x18;
+			data |= 0x08; /* p1 */
+			ocp_reg_write(tp, 0xd068, data);
+			swap_a = ocp_reg_read(tp, 0xd06a);
+			data &= ~0x18;
+			data |= 0x10; /* p2 */
+			ocp_reg_write(tp, 0xd068, data);
+			swap_b = ocp_reg_read(tp, 0xd06a);
+			data &= ~0x18;
+			data |= 0x08; /* p1 */
+			ocp_reg_write(tp, 0xd068, data);
+			ocp_reg_write(tp, 0xd06a,
+				      (swap_a & ~0x7ff) | (swap_b & 0x7ff));
+			data &= ~0x18;
+			data |= 0x10; /* p2 */
+			ocp_reg_write(tp, 0xd068, data);
+			ocp_reg_write(tp, 0xd06a,
+				      (swap_b & ~0x7ff) | (swap_a & 0x7ff));
+			swap_a = ocp_reg_read(tp, 0xbd5a);
+			swap_b = ocp_reg_read(tp, 0xbd5c);
+			ocp_reg_write(tp, 0xbd5a, (swap_a & ~0x1f1f) |
+				      ((swap_b & 0x1f) << 8) |
+				      ((swap_b >> 8) & 0x1f));
+			ocp_reg_write(tp, 0xbd5c, (swap_b & ~0x1f1f) |
+				      ((swap_a & 0x1f) << 8) |
+				      ((swap_a >> 8) & 0x1f));
+			swap_a = ocp_reg_read(tp, 0xbc18);
+			swap_b = ocp_reg_read(tp, 0xbc1a);
+			ocp_reg_write(tp, 0xbc18, (swap_a & ~0x1f1f) |
+				      ((swap_b & 0x1f) << 8) |
+				      ((swap_b >> 8) & 0x1f));
+			ocp_reg_write(tp, 0xbc1a, (swap_b & ~0x1f1f) |
+				      ((swap_a & 0x1f) << 8) |
+				      ((swap_a >> 8) & 0x1f));
+		}
+		break;
+	default:
+		break;
+	}
+
+	rtl_green_en(tp, test_bit(GREEN_ETHERNET, &tp->flags));
+
+	data = ocp_reg_read(tp, 0xa428);
+	data &= ~BIT(9);
+	ocp_reg_write(tp, 0xa428, data);
+	data = ocp_reg_read(tp, 0xa5ea);
+	data &= ~BIT(0);
+	ocp_reg_write(tp, 0xa5ea, data);
+	tp->ups_info.lite_mode = 0;
+
+	if (tp->eee_en)
+		rtl_eee_enable(tp, true);
+
+	r8153_aldps_en(tp, true);
+	r8152b_enable_fc(tp);
+	r8153_u2p3en(tp, true);
+
+	set_bit(PHY_RESET, &tp->flags);
+}
+
+static void r8156b_hw_phy_cfg(struct r8152 *tp)
+{
+	u32 ocp_data;
+	u16 data;
+
+	switch (tp->version) {
+	case RTL_VER_12:
+		ocp_reg_write(tp, 0xbf86, 0x9000);
+		data = ocp_reg_read(tp, 0xc402);
+		data |= BIT(10);
+		ocp_reg_write(tp, 0xc402, data);
+		data &= ~BIT(10);
+		ocp_reg_write(tp, 0xc402, data);
+		ocp_reg_write(tp, 0xbd86, 0x1010);
+		ocp_reg_write(tp, 0xbd88, 0x1010);
+		data = ocp_reg_read(tp, 0xbd4e);
+		data &= ~(BIT(10) | BIT(11));
+		data |= BIT(11);
+		ocp_reg_write(tp, 0xbd4e, data);
+		data = ocp_reg_read(tp, 0xbf46);
+		data &= ~0xf00;
+		data |= 0x700;
+		ocp_reg_write(tp, 0xbf46, data);
+		break;
+	case RTL_VER_13:
+	case RTL_VER_15:
+		r8156b_wait_loading_flash(tp);
+		break;
+	default:
+		break;
+	}
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
+	if (ocp_data & PCUT_STATUS) {
+		ocp_data &= ~PCUT_STATUS;
+		ocp_write_word(tp, MCU_TYPE_USB, USB_MISC_0, ocp_data);
+	}
+
+	data = r8153_phy_status(tp, 0);
+	switch (data) {
+	case PHY_STAT_EXT_INIT:
+		rtl8152_apply_firmware(tp, true);
+
+		data = ocp_reg_read(tp, 0xa466);
+		data &= ~BIT(0);
+		ocp_reg_write(tp, 0xa466, data);
+
+		data = ocp_reg_read(tp, 0xa468);
+		data &= ~(BIT(3) | BIT(1));
+		ocp_reg_write(tp, 0xa468, data);
+		break;
+	case PHY_STAT_LAN_ON:
+	case PHY_STAT_PWRDN:
+	default:
+		rtl8152_apply_firmware(tp, false);
+		break;
+	}
+
+	data = r8152_mdio_read(tp, MII_BMCR);
+	if (data & BMCR_PDOWN) {
+		data &= ~BMCR_PDOWN;
+		r8152_mdio_write(tp, MII_BMCR, data);
+	}
+
+	/* disable ALDPS before updating the PHY parameters */
+	r8153_aldps_en(tp, false);
+
+	/* disable EEE before updating the PHY parameters */
+	rtl_eee_enable(tp, false);
+
+	data = r8153_phy_status(tp, PHY_STAT_LAN_ON);
+	WARN_ON_ONCE(data != PHY_STAT_LAN_ON);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR);
+	ocp_data |= PFM_PWM_SWITCH;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR, ocp_data);
+
+	switch (tp->version) {
+	case RTL_VER_12:
+		data = ocp_reg_read(tp, 0xbc08);
+		data |= BIT(3) | BIT(2);
+		ocp_reg_write(tp, 0xbc08, data);
+
+		data = sram_read(tp, 0x8fff);
+		data &= ~0xff00;
+		data |= 0x0400;
+		sram_write(tp, 0x8fff, data);
+
+		data = ocp_reg_read(tp, 0xacda);
+		data |= 0xff00;
+		ocp_reg_write(tp, 0xacda, data);
+		data = ocp_reg_read(tp, 0xacde);
+		data |= 0xf000;
+		ocp_reg_write(tp, 0xacde, data);
+		ocp_reg_write(tp, 0xac8c, 0x0ffc);
+		ocp_reg_write(tp, 0xac46, 0xb7b4);
+		ocp_reg_write(tp, 0xac50, 0x0fbc);
+		ocp_reg_write(tp, 0xac3c, 0x9240);
+		ocp_reg_write(tp, 0xac4e, 0x0db4);
+		ocp_reg_write(tp, 0xacc6, 0x0707);
+		ocp_reg_write(tp, 0xacc8, 0xa0d3);
+		ocp_reg_write(tp, 0xad08, 0x0007);
+
+		ocp_reg_write(tp, 0xb87c, 0x8560);
+		ocp_reg_write(tp, 0xb87e, 0x19cc);
+		ocp_reg_write(tp, 0xb87c, 0x8562);
+		ocp_reg_write(tp, 0xb87e, 0x19cc);
+		ocp_reg_write(tp, 0xb87c, 0x8564);
+		ocp_reg_write(tp, 0xb87e, 0x19cc);
+		ocp_reg_write(tp, 0xb87c, 0x8566);
+		ocp_reg_write(tp, 0xb87e, 0x147d);
+		ocp_reg_write(tp, 0xb87c, 0x8568);
+		ocp_reg_write(tp, 0xb87e, 0x147d);
+		ocp_reg_write(tp, 0xb87c, 0x856a);
+		ocp_reg_write(tp, 0xb87e, 0x147d);
+		ocp_reg_write(tp, 0xb87c, 0x8ffe);
+		ocp_reg_write(tp, 0xb87e, 0x0907);
+		ocp_reg_write(tp, 0xb87c, 0x80d6);
+		ocp_reg_write(tp, 0xb87e, 0x2801);
+		ocp_reg_write(tp, 0xb87c, 0x80f2);
+		ocp_reg_write(tp, 0xb87e, 0x2801);
+		ocp_reg_write(tp, 0xb87c, 0x80f4);
+		ocp_reg_write(tp, 0xb87e, 0x6077);
+		ocp_reg_write(tp, 0xb506, 0x01e7);
+
+		ocp_reg_write(tp, 0xb87c, 0x8013);
+		ocp_reg_write(tp, 0xb87e, 0x0700);
+		ocp_reg_write(tp, 0xb87c, 0x8fb9);
+		ocp_reg_write(tp, 0xb87e, 0x2801);
+		ocp_reg_write(tp, 0xb87c, 0x8fba);
+		ocp_reg_write(tp, 0xb87e, 0x0100);
+		ocp_reg_write(tp, 0xb87c, 0x8fbc);
+		ocp_reg_write(tp, 0xb87e, 0x1900);
+		ocp_reg_write(tp, 0xb87c, 0x8fbe);
+		ocp_reg_write(tp, 0xb87e, 0xe100);
+		ocp_reg_write(tp, 0xb87c, 0x8fc0);
+		ocp_reg_write(tp, 0xb87e, 0x0800);
+		ocp_reg_write(tp, 0xb87c, 0x8fc2);
+		ocp_reg_write(tp, 0xb87e, 0xe500);
+		ocp_reg_write(tp, 0xb87c, 0x8fc4);
+		ocp_reg_write(tp, 0xb87e, 0x0f00);
+		ocp_reg_write(tp, 0xb87c, 0x8fc6);
+		ocp_reg_write(tp, 0xb87e, 0xf100);
+		ocp_reg_write(tp, 0xb87c, 0x8fc8);
+		ocp_reg_write(tp, 0xb87e, 0x0400);
+		ocp_reg_write(tp, 0xb87c, 0x8fca);
+		ocp_reg_write(tp, 0xb87e, 0xf300);
+		ocp_reg_write(tp, 0xb87c, 0x8fcc);
+		ocp_reg_write(tp, 0xb87e, 0xfd00);
+		ocp_reg_write(tp, 0xb87c, 0x8fce);
+		ocp_reg_write(tp, 0xb87e, 0xff00);
+		ocp_reg_write(tp, 0xb87c, 0x8fd0);
+		ocp_reg_write(tp, 0xb87e, 0xfb00);
+		ocp_reg_write(tp, 0xb87c, 0x8fd2);
+		ocp_reg_write(tp, 0xb87e, 0x0100);
+		ocp_reg_write(tp, 0xb87c, 0x8fd4);
+		ocp_reg_write(tp, 0xb87e, 0xf400);
+		ocp_reg_write(tp, 0xb87c, 0x8fd6);
+		ocp_reg_write(tp, 0xb87e, 0xff00);
+		ocp_reg_write(tp, 0xb87c, 0x8fd8);
+		ocp_reg_write(tp, 0xb87e, 0xf600);
+
+		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_USB_CFG);
+		ocp_data |= EN_XG_LIP | EN_G_LIP;
+		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_USB_CFG, ocp_data);
+		ocp_reg_write(tp, 0xb87c, 0x813d);
+		ocp_reg_write(tp, 0xb87e, 0x390e);
+		ocp_reg_write(tp, 0xb87c, 0x814f);
+		ocp_reg_write(tp, 0xb87e, 0x790e);
+		ocp_reg_write(tp, 0xb87c, 0x80b0);
+		ocp_reg_write(tp, 0xb87e, 0x0f31);
+		data = ocp_reg_read(tp, 0xbf4c);
+		data |= BIT(1);
+		ocp_reg_write(tp, 0xbf4c, data);
+		data = ocp_reg_read(tp, 0xbcca);
+		data |= BIT(9) | BIT(8);
+		ocp_reg_write(tp, 0xbcca, data);
+		ocp_reg_write(tp, 0xb87c, 0x8141);
+		ocp_reg_write(tp, 0xb87e, 0x320e);
+		ocp_reg_write(tp, 0xb87c, 0x8153);
+		ocp_reg_write(tp, 0xb87e, 0x720e);
+		ocp_reg_write(tp, 0xb87c, 0x8529);
+		ocp_reg_write(tp, 0xb87e, 0x050e);
+		data = ocp_reg_read(tp, OCP_EEE_CFG);
+		data &= ~CTAP_SHORT_EN;
+		ocp_reg_write(tp, OCP_EEE_CFG, data);
+
+		sram_write(tp, 0x816c, 0xc4a0);
+		sram_write(tp, 0x8170, 0xc4a0);
+		sram_write(tp, 0x8174, 0x04a0);
+		sram_write(tp, 0x8178, 0x04a0);
+		sram_write(tp, 0x817c, 0x0719);
+		sram_write(tp, 0x8ff4, 0x0400);
+		sram_write(tp, 0x8ff1, 0x0404);
+
+		ocp_reg_write(tp, 0xbf4a, 0x001b);
+		ocp_reg_write(tp, 0xb87c, 0x8033);
+		ocp_reg_write(tp, 0xb87e, 0x7c13);
+		ocp_reg_write(tp, 0xb87c, 0x8037);
+		ocp_reg_write(tp, 0xb87e, 0x7c13);
+		ocp_reg_write(tp, 0xb87c, 0x803b);
+		ocp_reg_write(tp, 0xb87e, 0xfc32);
+		ocp_reg_write(tp, 0xb87c, 0x803f);
+		ocp_reg_write(tp, 0xb87e, 0x7c13);
+		ocp_reg_write(tp, 0xb87c, 0x8043);
+		ocp_reg_write(tp, 0xb87e, 0x7c13);
+		ocp_reg_write(tp, 0xb87c, 0x8047);
+		ocp_reg_write(tp, 0xb87e, 0x7c13);
+
+		ocp_reg_write(tp, 0xb87c, 0x8145);
+		ocp_reg_write(tp, 0xb87e, 0x370e);
+		ocp_reg_write(tp, 0xb87c, 0x8157);
+		ocp_reg_write(tp, 0xb87e, 0x770e);
+		ocp_reg_write(tp, 0xb87c, 0x8169);
+		ocp_reg_write(tp, 0xb87e, 0x0d0a);
+		ocp_reg_write(tp, 0xb87c, 0x817b);
+		ocp_reg_write(tp, 0xb87e, 0x1d0a);
+
+		data = sram_read(tp, 0x8217);
+		data &= ~0xff00;
+		data |= 0x5000;
+		sram_write(tp, 0x8217, data);
+		data = sram_read(tp, 0x821a);
+		data &= ~0xff00;
+		data |= 0x5000;
+		sram_write(tp, 0x821a, data);
+		sram_write(tp, 0x80da, 0x0403);
+		data = sram_read(tp, 0x80dc);
+		data &= ~0xff00;
+		data |= 0x1000;
+		sram_write(tp, 0x80dc, data);
+		sram_write(tp, 0x80b3, 0x0384);
+		sram_write(tp, 0x80b7, 0x2007);
+		data = sram_read(tp, 0x80ba);
+		data &= ~0xff00;
+		data |= 0x6c00;
+		sram_write(tp, 0x80ba, data);
+		sram_write(tp, 0x80b5, 0xf009);
+		data = sram_read(tp, 0x80bd);
+		data &= ~0xff00;
+		data |= 0x9f00;
+		sram_write(tp, 0x80bd, data);
+		sram_write(tp, 0x80c7, 0xf083);
+		sram_write(tp, 0x80dd, 0x03f0);
+		data = sram_read(tp, 0x80df);
+		data &= ~0xff00;
+		data |= 0x1000;
+		sram_write(tp, 0x80df, data);
+		sram_write(tp, 0x80cb, 0x2007);
+		data = sram_read(tp, 0x80ce);
+		data &= ~0xff00;
+		data |= 0x6c00;
+		sram_write(tp, 0x80ce, data);
+		sram_write(tp, 0x80c9, 0x8009);
+		data = sram_read(tp, 0x80d1);
+		data &= ~0xff00;
+		data |= 0x8000;
+		sram_write(tp, 0x80d1, data);
+		sram_write(tp, 0x80a3, 0x200a);
+		sram_write(tp, 0x80a5, 0xf0ad);
+		sram_write(tp, 0x809f, 0x6073);
+		sram_write(tp, 0x80a1, 0x000b);
+		data = sram_read(tp, 0x80a9);
+		data &= ~0xff00;
+		data |= 0xc000;
+		sram_write(tp, 0x80a9, data);
+
+		if (rtl_phy_patch_request(tp, true, true))
+			return;
+
+		data = ocp_reg_read(tp, 0xb896);
+		data &= ~BIT(0);
+		ocp_reg_write(tp, 0xb896, data);
+		data = ocp_reg_read(tp, 0xb892);
+		data &= ~0xff00;
+		ocp_reg_write(tp, 0xb892, data);
+		ocp_reg_write(tp, 0xb88e, 0xc23e);
+		ocp_reg_write(tp, 0xb890, 0x0000);
+		ocp_reg_write(tp, 0xb88e, 0xc240);
+		ocp_reg_write(tp, 0xb890, 0x0103);
+		ocp_reg_write(tp, 0xb88e, 0xc242);
+		ocp_reg_write(tp, 0xb890, 0x0507);
+		ocp_reg_write(tp, 0xb88e, 0xc244);
+		ocp_reg_write(tp, 0xb890, 0x090b);
+		ocp_reg_write(tp, 0xb88e, 0xc246);
+		ocp_reg_write(tp, 0xb890, 0x0c0e);
+		ocp_reg_write(tp, 0xb88e, 0xc248);
+		ocp_reg_write(tp, 0xb890, 0x1012);
+		ocp_reg_write(tp, 0xb88e, 0xc24a);
+		ocp_reg_write(tp, 0xb890, 0x1416);
+		data = ocp_reg_read(tp, 0xb896);
+		data |= BIT(0);
+		ocp_reg_write(tp, 0xb896, data);
+
+		rtl_phy_patch_request(tp, false, true);
+
+		data = ocp_reg_read(tp, 0xa86a);
+		data |= BIT(0);
+		ocp_reg_write(tp, 0xa86a, data);
+		data = ocp_reg_read(tp, 0xa6f0);
+		data |= BIT(0);
+		ocp_reg_write(tp, 0xa6f0, data);
+
+		ocp_reg_write(tp, 0xbfa0, 0xd70d);
+		ocp_reg_write(tp, 0xbfa2, 0x4100);
+		ocp_reg_write(tp, 0xbfa4, 0xe868);
+		ocp_reg_write(tp, 0xbfa6, 0xdc59);
+		ocp_reg_write(tp, 0xb54c, 0x3c18);
+		data = ocp_reg_read(tp, 0xbfa4);
+		data &= ~BIT(5);
+		ocp_reg_write(tp, 0xbfa4, data);
+		data = sram_read(tp, 0x817d);
+		data |= BIT(12);
+		sram_write(tp, 0x817d, data);
+		break;
+	case RTL_VER_13:
+		/* 2.5G INRX */
+		data = ocp_reg_read(tp, 0xac46);
+		data &= ~0x00f0;
+		data |= 0x0090;
+		ocp_reg_write(tp, 0xac46, data);
+		data = ocp_reg_read(tp, 0xad30);
+		data &= ~0x0003;
+		data |= 0x0001;
+		ocp_reg_write(tp, 0xad30, data);
+		fallthrough;
+	case RTL_VER_15:
+		/* EEE parameter */
+		ocp_reg_write(tp, 0xb87c, 0x80f5);
+		ocp_reg_write(tp, 0xb87e, 0x760e);
+		ocp_reg_write(tp, 0xb87c, 0x8107);
+		ocp_reg_write(tp, 0xb87e, 0x360e);
+		ocp_reg_write(tp, 0xb87c, 0x8551);
+		data = ocp_reg_read(tp, 0xb87e);
+		data &= ~0xff00;
+		data |= 0x0800;
+		ocp_reg_write(tp, 0xb87e, data);
+
+		/* ADC_PGA parameter */
+		data = ocp_reg_read(tp, 0xbf00);
+		data &= ~0xe000;
+		data |= 0xa000;
+		ocp_reg_write(tp, 0xbf00, data);
+		data = ocp_reg_read(tp, 0xbf46);
+		data &= ~0x0f00;
+		data |= 0x0300;
+		ocp_reg_write(tp, 0xbf46, data);
+
+		/* Green Table-PGA, 1G full viterbi */
+		sram_write(tp, 0x8044, 0x2417);
+		sram_write(tp, 0x804a, 0x2417);
+		sram_write(tp, 0x8050, 0x2417);
+		sram_write(tp, 0x8056, 0x2417);
+		sram_write(tp, 0x805c, 0x2417);
+		sram_write(tp, 0x8062, 0x2417);
+		sram_write(tp, 0x8068, 0x2417);
+		sram_write(tp, 0x806e, 0x2417);
+		sram_write(tp, 0x8074, 0x2417);
+		sram_write(tp, 0x807a, 0x2417);
+
+		/* XG PLL */
+		data = ocp_reg_read(tp, 0xbf84);
+		data &= ~0xe000;
+		data |= 0xa000;
+		ocp_reg_write(tp, 0xbf84, data);
+		break;
+	default:
+		break;
+	}
+
+	if (rtl_phy_patch_request(tp, true, true))
+		return;
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4);
+	ocp_data |= EEE_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4, ocp_data);
+
+	data = ocp_reg_read(tp, OCP_DOWN_SPEED);
+	data &= ~(EN_EEE_100 | EN_EEE_1000);
+	data |= EN_10M_CLKDIV;
+	ocp_reg_write(tp, OCP_DOWN_SPEED, data);
+	tp->ups_info._10m_ckdiv = true;
+	tp->ups_info.eee_plloff_100 = false;
+	tp->ups_info.eee_plloff_giga = false;
+
+	data = ocp_reg_read(tp, OCP_POWER_CFG);
+	data &= ~EEE_CLKDIV_EN;
+	ocp_reg_write(tp, OCP_POWER_CFG, data);
+	tp->ups_info.eee_ckdiv = false;
+
+	rtl_phy_patch_request(tp, false, true);
+
+	rtl_green_en(tp, test_bit(GREEN_ETHERNET, &tp->flags));
+
+	data = ocp_reg_read(tp, 0xa428);
+	data &= ~BIT(9);
+	ocp_reg_write(tp, 0xa428, data);
+	data = ocp_reg_read(tp, 0xa5ea);
+	data &= ~BIT(0);
+	ocp_reg_write(tp, 0xa5ea, data);
+	tp->ups_info.lite_mode = 0;
+
+	if (tp->eee_en)
+		rtl_eee_enable(tp, true);
+
+	r8153_aldps_en(tp, true);
+	r8152b_enable_fc(tp);
+	r8153_u2p3en(tp, true);
+
+	set_bit(PHY_RESET, &tp->flags);
+}
+
+static void r8156_init(struct r8152 *tp)
 {
 	u32 ocp_data;
 	u16 data;
@@ -5408,7 +7345,17 @@ static void r8153_init(struct r8152 *tp)
 	if (test_bit(RTL8152_UNPLUG, &tp->flags))
 		return;
 
-	r8153_u1u2en(tp, false);
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_ECM_OP);
+	ocp_data &= ~EN_ALL_SPEED;
+	ocp_write_byte(tp, MCU_TYPE_USB, USB_ECM_OP, ocp_data);
+
+	ocp_write_word(tp, MCU_TYPE_USB, USB_SPEED_OPTION, 0);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_ECM_OPTION);
+	ocp_data |= BYPASS_MAC_RESET;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_ECM_OPTION, ocp_data);
+
+	r8153b_u1u2en(tp, false);
 
 	for (i = 0; i < 500; i++) {
 		if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
@@ -5417,14 +7364,15 @@ static void r8153_init(struct r8152 *tp)
 
 		msleep(20);
 		if (test_bit(RTL8152_UNPLUG, &tp->flags))
-			break;
+			return;
 	}
 
 	data = r8153_phy_status(tp, 0);
-
-	if (tp->version == RTL_VER_03 || tp->version == RTL_VER_04 ||
-	    tp->version == RTL_VER_05)
-		ocp_reg_write(tp, OCP_ADC_CFG, CKADSEL_L | ADC_EN | EN_EMI_L);
+	if (data == PHY_STAT_EXT_INIT) {
+		data = ocp_reg_read(tp, 0xa468);
+		data &= ~(BIT(3) | BIT(1));
+		ocp_reg_write(tp, 0xa468, data);
+	}
 
 	data = r8152_mdio_read(tp, MII_BMCR);
 	if (data & BMCR_PDOWN) {
@@ -5433,118 +7381,57 @@ static void r8153_init(struct r8152 *tp)
 	}
 
 	data = r8153_phy_status(tp, PHY_STAT_LAN_ON);
+	WARN_ON_ONCE(data != PHY_STAT_LAN_ON);
 
 	r8153_u2p3en(tp, false);
 
-	if (tp->version == RTL_VER_04) {
-		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_SSPHYLINK2);
-		ocp_data &= ~pwd_dn_scale_mask;
-		ocp_data |= pwd_dn_scale(96);
-		ocp_write_word(tp, MCU_TYPE_USB, USB_SSPHYLINK2, ocp_data);
-
-		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_USB2PHY);
-		ocp_data |= USB2PHY_L1 | USB2PHY_SUSPEND;
-		ocp_write_byte(tp, MCU_TYPE_USB, USB_USB2PHY, ocp_data);
-	} else if (tp->version == RTL_VER_05) {
-		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_DMY_REG0);
-		ocp_data &= ~ECM_ALDPS;
-		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_DMY_REG0, ocp_data);
+	/* MSC timer = 0xfff * 8ms = 32760 ms */
+	ocp_write_word(tp, MCU_TYPE_USB, USB_MSC_TIMER, 0x0fff);
 
-		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1);
-		if (ocp_read_word(tp, MCU_TYPE_USB, USB_BURST_SIZE) == 0)
-			ocp_data &= ~DYNAMIC_BURST;
-		else
-			ocp_data |= DYNAMIC_BURST;
-		ocp_write_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1, ocp_data);
-	} else if (tp->version == RTL_VER_06) {
-		ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1);
-		if (ocp_read_word(tp, MCU_TYPE_USB, USB_BURST_SIZE) == 0)
-			ocp_data &= ~DYNAMIC_BURST;
-		else
-			ocp_data |= DYNAMIC_BURST;
-		ocp_write_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY1, ocp_data);
+	/* U1/U2/L1 idle timer. 500 us */
+	ocp_write_word(tp, MCU_TYPE_USB, USB_U1U2_TIMER, 500);
 
-		r8153_queue_wake(tp, false);
+	r8153b_power_cut_en(tp, false);
+	r8156_ups_en(tp, false);
+	r8153_queue_wake(tp, false);
+	rtl_runtime_suspend_enable(tp, false);
 
-		ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
-		if (rtl8152_get_speed(tp) & LINK_STATUS)
-			ocp_data |= CUR_LINK_OK;
-		else
-			ocp_data &= ~CUR_LINK_OK;
-		ocp_data |= POLL_LINK_CHG;
-		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
-	}
+	if (tp->udev->speed >= USB_SPEED_SUPER)
+		r8153b_u1u2en(tp, true);
 
-	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY2);
-	ocp_data |= EP4_FULL_FC;
-	ocp_write_byte(tp, MCU_TYPE_USB, USB_CSR_DUMMY2, ocp_data);
+	usb_enable_lpm(tp->udev);
 
-	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_WDT11_CTRL);
-	ocp_data &= ~TIMER11_EN;
-	ocp_write_word(tp, MCU_TYPE_USB, USB_WDT11_CTRL, ocp_data);
+	r8156_mac_clk_spd(tp, true);
 
-	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_LED_FEATURE);
-	ocp_data &= ~LED_MODE_MASK;
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_LED_FEATURE, ocp_data);
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data &= ~PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
 
-	ocp_data = FIFO_EMPTY_1FB | ROK_EXIT_LPM;
-	if (tp->version == RTL_VER_04 && tp->udev->speed < USB_SPEED_SUPER)
-		ocp_data |= LPM_TIMER_500MS;
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
+	if (rtl8152_get_speed(tp) & LINK_STATUS)
+		ocp_data |= CUR_LINK_OK;
 	else
-		ocp_data |= LPM_TIMER_500US;
-	ocp_write_byte(tp, MCU_TYPE_USB, USB_LPM_CTRL, ocp_data);
-
-	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_AFE_CTRL2);
-	ocp_data &= ~SEN_VAL_MASK;
-	ocp_data |= SEN_VAL_NORMAL | SEL_RXIDLE;
-	ocp_write_word(tp, MCU_TYPE_USB, USB_AFE_CTRL2, ocp_data);
-
-	ocp_write_word(tp, MCU_TYPE_USB, USB_CONNECT_TIMER, 0x0001);
-
-	/* MAC clock speed down */
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL, 0);
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2, 0);
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, 0);
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4, 0);
-
-	r8153_power_cut_en(tp, false);
-	rtl_runtime_suspend_enable(tp, false);
-	r8153_u1u2en(tp, true);
-	usb_enable_lpm(tp->udev);
-
-	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CONFIG6);
-	ocp_data |= LANWAKE_CLR_EN;
-	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CONFIG6, ocp_data);
+		ocp_data &= ~CUR_LINK_OK;
+	ocp_data |= POLL_LINK_CHG;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
 
-	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_LWAKE_CTRL_REG);
-	ocp_data &= ~LANWAKE_PIN;
-	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_LWAKE_CTRL_REG, ocp_data);
+	set_bit(GREEN_ETHERNET, &tp->flags);
 
 	/* rx aggregation */
 	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_USB_CTRL);
 	ocp_data &= ~(RX_AGG_DISABLE | RX_ZERO_EN);
-	if (test_bit(DELL_TB_RX_AGG_BUG, &tp->flags))
-		ocp_data |= RX_AGG_DISABLE;
-
 	ocp_write_word(tp, MCU_TYPE_USB, USB_USB_CTRL, ocp_data);
 
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_BMU_CONFIG);
+	ocp_data |= ACT_ODMA;
+	ocp_write_byte(tp, MCU_TYPE_USB, USB_BMU_CONFIG, ocp_data);
+
 	rtl_tally_reset(tp);
 
-	switch (tp->udev->speed) {
-	case USB_SPEED_SUPER:
-	case USB_SPEED_SUPER_PLUS:
-		tp->coalesce = COALESCE_SUPER;
-		break;
-	case USB_SPEED_HIGH:
-		tp->coalesce = COALESCE_HIGH;
-		break;
-	default:
-		tp->coalesce = COALESCE_SLOW;
-		break;
-	}
+	tp->coalesce = 15000;	/* 15 us */
 }
 
-static void r8153b_init(struct r8152 *tp)
+static void r8156b_init(struct r8152 *tp)
 {
 	u32 ocp_data;
 	u16 data;
@@ -5553,8 +7440,31 @@ static void r8153b_init(struct r8152 *tp)
 	if (test_bit(RTL8152_UNPLUG, &tp->flags))
 		return;
 
+	ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_ECM_OP);
+	ocp_data &= ~EN_ALL_SPEED;
+	ocp_write_byte(tp, MCU_TYPE_USB, USB_ECM_OP, ocp_data);
+
+	ocp_write_word(tp, MCU_TYPE_USB, USB_SPEED_OPTION, 0);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_ECM_OPTION);
+	ocp_data |= BYPASS_MAC_RESET;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_ECM_OPTION, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_U2P3_CTRL);
+	ocp_data |= RX_DETECT8;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_U2P3_CTRL, ocp_data);
+
 	r8153b_u1u2en(tp, false);
 
+	switch (tp->version) {
+	case RTL_VER_13:
+	case RTL_VER_15:
+		r8156b_wait_loading_flash(tp);
+		break;
+	default:
+		break;
+	}
+
 	for (i = 0; i < 500; i++) {
 		if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
 		    AUTOLOAD_DONE)
@@ -5562,10 +7472,19 @@ static void r8153b_init(struct r8152 *tp)
 
 		msleep(20);
 		if (test_bit(RTL8152_UNPLUG, &tp->flags))
-			break;
+			return;
 	}
 
 	data = r8153_phy_status(tp, 0);
+	if (data == PHY_STAT_EXT_INIT) {
+		data = ocp_reg_read(tp, 0xa468);
+		data &= ~(BIT(3) | BIT(1));
+		ocp_reg_write(tp, 0xa468, data);
+
+		data = ocp_reg_read(tp, 0xa466);
+		data &= ~BIT(0);
+		ocp_reg_write(tp, 0xa466, data);
+	}
 
 	data = r8152_mdio_read(tp, MII_BMCR);
 	if (data & BMCR_PDOWN) {
@@ -5580,41 +7499,54 @@ static void r8153b_init(struct r8152 *tp)
 	/* MSC timer = 0xfff * 8ms = 32760 ms */
 	ocp_write_word(tp, MCU_TYPE_USB, USB_MSC_TIMER, 0x0fff);
 
+	/* U1/U2/L1 idle timer. 500 us */
+	ocp_write_word(tp, MCU_TYPE_USB, USB_U1U2_TIMER, 500);
+
 	r8153b_power_cut_en(tp, false);
-	r8153b_ups_en(tp, false);
+	r8156_ups_en(tp, false);
 	r8153_queue_wake(tp, false);
 	rtl_runtime_suspend_enable(tp, false);
 
-	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
-	if (rtl8152_get_speed(tp) & LINK_STATUS)
-		ocp_data |= CUR_LINK_OK;
-	else
-		ocp_data &= ~CUR_LINK_OK;
-	ocp_data |= POLL_LINK_CHG;
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
-
 	if (tp->udev->speed >= USB_SPEED_SUPER)
 		r8153b_u1u2en(tp, true);
 
 	usb_enable_lpm(tp->udev);
 
-	/* MAC clock speed down */
-	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2);
-	ocp_data |= MAC_CLK_SPDWN_EN;
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2, ocp_data);
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_RCR);
+	ocp_data &= ~SLOT_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RCR, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_CPCR);
+	ocp_data |= FLOW_CTRL_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_CPCR, ocp_data);
+
+	/* enable fc timer and set timer to 600 ms. */
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FC_TIMER,
+		       CTRL_TIMER_EN | (600 / 8));
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_CTRL);
+	if (!(ocp_read_word(tp, MCU_TYPE_PLA, PLA_POL_GPIO_CTRL) & DACK_DET_EN))
+		ocp_data |= FLOW_CTRL_PATCH_2;
+	ocp_data &= ~AUTO_SPEEDUP;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_CTRL, ocp_data);
+
+	ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_FW_TASK);
+	ocp_data |= FC_PATCH_TASK;
+	ocp_write_word(tp, MCU_TYPE_USB, USB_FW_TASK, ocp_data);
+
+	r8156_mac_clk_spd(tp, true);
 
 	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
 	ocp_data &= ~PLA_MCU_SPDWN_EN;
 	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
 
-	if (tp->version == RTL_VER_09) {
-		/* Disable Test IO for 32QFN */
-		if (ocp_read_byte(tp, MCU_TYPE_PLA, 0xdc00) & BIT(5)) {
-			ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR);
-			ocp_data |= TEST_IO_OFF;
-			ocp_write_word(tp, MCU_TYPE_PLA, PLA_PHY_PWR, ocp_data);
-		}
-	}
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS);
+	if (rtl8152_get_speed(tp) & LINK_STATUS)
+		ocp_data |= CUR_LINK_OK;
+	else
+		ocp_data &= ~CUR_LINK_OK;
+	ocp_data |= POLL_LINK_CHG;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_EXTRA_STATUS, ocp_data);
 
 	set_bit(GREEN_ETHERNET, &tp->flags);
 
@@ -5991,6 +7923,22 @@ int rtl8152_get_link_ksettings(struct net_device *netdev,
 
 	mii_ethtool_get_link_ksettings(&tp->mii, cmd);
 
+	linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+			 cmd->link_modes.supported, tp->support_2500full);
+
+	if (tp->support_2500full) {
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+				 cmd->link_modes.advertising,
+				 ocp_reg_read(tp, OCP_10GBT_CTRL) & MDIO_AN_10GBT_CTRL_ADV2_5G);
+
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+				 cmd->link_modes.lp_advertising,
+				 ocp_reg_read(tp, OCP_10GBT_STAT) & MDIO_AN_10GBT_STAT_LP2_5G);
+
+		if (is_speed_2500(rtl8152_get_speed(tp)))
+			cmd->base.speed = SPEED_2500;
+	}
+
 	mutex_unlock(&tp->control);
 
 	usb_autopm_put_interface(tp->intf);
@@ -6034,6 +7982,10 @@ static int rtl8152_set_link_ksettings(struct net_device *dev,
 		     cmd->link_modes.advertising))
 		advertising |= RTL_ADVERTISED_1000_FULL;
 
+	if (test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+		     cmd->link_modes.advertising))
+		advertising |= RTL_ADVERTISED_2500_FULL;
+
 	mutex_lock(&tp->control);
 
 	ret = rtl8152_set_speed(tp, cmd->base.autoneg, cmd->base.speed,
@@ -6623,6 +8575,67 @@ static int rtl_ops_init(struct r8152 *tp)
 		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
 		break;
 
+	case RTL_VER_11:
+		tp->eee_en		= true;
+		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
+		fallthrough;
+	case RTL_VER_10:
+		ops->init		= r8156_init;
+		ops->enable		= rtl8156_enable;
+		ops->disable		= rtl8153_disable;
+		ops->up			= rtl8156_up;
+		ops->down		= rtl8156_down;
+		ops->unload		= rtl8153_unload;
+		ops->eee_get		= r8153_get_eee;
+		ops->eee_set		= r8152_set_eee;
+		ops->in_nway		= rtl8153_in_nway;
+		ops->hw_phy_cfg		= r8156_hw_phy_cfg;
+		ops->autosuspend_en	= rtl8156_runtime_enable;
+		ops->change_mtu		= rtl8156_change_mtu;
+		tp->rx_buf_sz		= 48 * 1024;
+		tp->support_2500full	= 1;
+		break;
+
+	case RTL_VER_12:
+	case RTL_VER_13:
+		tp->support_2500full	= 1;
+		fallthrough;
+	case RTL_VER_15:
+		tp->eee_en		= true;
+		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
+		ops->init		= r8156b_init;
+		ops->enable		= rtl8156b_enable;
+		ops->disable		= rtl8153_disable;
+		ops->up			= rtl8156_up;
+		ops->down		= rtl8156_down;
+		ops->unload		= rtl8153_unload;
+		ops->eee_get		= r8153_get_eee;
+		ops->eee_set		= r8152_set_eee;
+		ops->in_nway		= rtl8153_in_nway;
+		ops->hw_phy_cfg		= r8156b_hw_phy_cfg;
+		ops->autosuspend_en	= rtl8156_runtime_enable;
+		ops->change_mtu		= rtl8156_change_mtu;
+		tp->rx_buf_sz		= 48 * 1024;
+		break;
+
+	case RTL_VER_14:
+		ops->init		= r8153c_init;
+		ops->enable		= rtl8153_enable;
+		ops->disable		= rtl8153_disable;
+		ops->up			= rtl8153c_up;
+		ops->down		= rtl8153b_down;
+		ops->unload		= rtl8153_unload;
+		ops->eee_get		= r8153_get_eee;
+		ops->eee_set		= r8152_set_eee;
+		ops->in_nway		= rtl8153_in_nway;
+		ops->hw_phy_cfg		= r8153c_hw_phy_cfg;
+		ops->autosuspend_en	= rtl8153c_runtime_enable;
+		ops->change_mtu		= rtl8153c_change_mtu;
+		tp->rx_buf_sz		= 32 * 1024;
+		tp->eee_en		= true;
+		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
+		break;
+
 	default:
 		ret = -ENODEV;
 		dev_err(&tp->intf->dev, "Unknown Device\n");
@@ -6636,11 +8649,13 @@ static int rtl_ops_init(struct r8152 *tp)
 #define FIRMWARE_8153A_3	"rtl_nic/rtl8153a-3.fw"
 #define FIRMWARE_8153A_4	"rtl_nic/rtl8153a-4.fw"
 #define FIRMWARE_8153B_2	"rtl_nic/rtl8153b-2.fw"
+#define FIRMWARE_8153C_1	"rtl_nic/rtl8153c-1.fw"
 
 MODULE_FIRMWARE(FIRMWARE_8153A_2);
 MODULE_FIRMWARE(FIRMWARE_8153A_3);
 MODULE_FIRMWARE(FIRMWARE_8153A_4);
 MODULE_FIRMWARE(FIRMWARE_8153B_2);
+MODULE_FIRMWARE(FIRMWARE_8153C_1);
 
 static int rtl_fw_init(struct r8152 *tp)
 {
@@ -6666,6 +8681,11 @@ static int rtl_fw_init(struct r8152 *tp)
 		rtl_fw->pre_fw		= r8153b_pre_firmware_1;
 		rtl_fw->post_fw		= r8153b_post_firmware_1;
 		break;
+	case RTL_VER_14:
+		rtl_fw->fw_name		= FIRMWARE_8153C_1;
+		rtl_fw->pre_fw		= r8153b_pre_firmware_1;
+		rtl_fw->post_fw		= r8153c_post_firmware_1;
+		break;
 	default:
 		break;
 	}
@@ -6721,6 +8741,27 @@ u8 rtl8152_get_version(struct usb_interface *intf)
 	case 0x6010:
 		version = RTL_VER_09;
 		break;
+	case 0x7010:
+		version = RTL_TEST_01;
+		break;
+	case 0x7020:
+		version = RTL_VER_10;
+		break;
+	case 0x7030:
+		version = RTL_VER_11;
+		break;
+	case 0x7400:
+		version = RTL_VER_12;
+		break;
+	case 0x7410:
+		version = RTL_VER_13;
+		break;
+	case 0x6400:
+		version = RTL_VER_14;
+		break;
+	case 0x7420:
+		version = RTL_VER_15;
+		break;
 	default:
 		version = RTL_VER_UNKNOWN;
 		dev_info(&intf->dev, "Unknown version 0x%04x\n", ocp_data);
@@ -6833,12 +8874,29 @@ static int rtl8152_probe(struct usb_interface *intf,
 	/* MTU range: 68 - 1500 or 9194 */
 	netdev->min_mtu = ETH_MIN_MTU;
 	switch (tp->version) {
+	case RTL_VER_03:
+	case RTL_VER_04:
+	case RTL_VER_05:
+	case RTL_VER_06:
+	case RTL_VER_08:
+	case RTL_VER_09:
+	case RTL_VER_14:
+		netdev->max_mtu = size_to_mtu(9 * 1024);
+		break;
+	case RTL_VER_10:
+	case RTL_VER_11:
+		netdev->max_mtu = size_to_mtu(15 * 1024);
+		break;
+	case RTL_VER_12:
+	case RTL_VER_13:
+	case RTL_VER_15:
+		netdev->max_mtu = size_to_mtu(16 * 1024);
+		break;
 	case RTL_VER_01:
 	case RTL_VER_02:
-		netdev->max_mtu = ETH_DATA_LEN;
-		break;
+	case RTL_VER_07:
 	default:
-		netdev->max_mtu = size_to_mtu(9 * 1024);
+		netdev->max_mtu = ETH_DATA_LEN;
 		break;
 	}
 
@@ -6854,7 +8912,13 @@ static int rtl8152_probe(struct usb_interface *intf,
 	tp->advertising = RTL_ADVERTISED_10_HALF | RTL_ADVERTISED_10_FULL |
 			  RTL_ADVERTISED_100_HALF | RTL_ADVERTISED_100_FULL;
 	if (tp->mii.supports_gmii) {
-		tp->speed = SPEED_1000;
+		if (tp->support_2500full &&
+		    tp->udev->speed >= USB_SPEED_SUPER) {
+			tp->speed = SPEED_2500;
+			tp->advertising |= RTL_ADVERTISED_2500_FULL;
+		} else {
+			tp->speed = SPEED_1000;
+		}
 		tp->advertising |= RTL_ADVERTISED_1000_FULL;
 	}
 	tp->duplex = DUPLEX_FULL;
@@ -6878,7 +8942,11 @@ static int rtl8152_probe(struct usb_interface *intf,
 	set_ethernet_addr(tp);
 
 	usb_set_intfdata(intf, tp);
-	netif_napi_add(netdev, &tp->napi, r8152_poll, RTL8152_NAPI_WEIGHT);
+
+	if (tp->support_2500full)
+		netif_napi_add(netdev, &tp->napi, r8152_poll, 256);
+	else
+		netif_napi_add(netdev, &tp->napi, r8152_poll, 64);
 
 	ret = register_netdev(netdev);
 	if (ret != 0) {
@@ -6914,7 +8982,8 @@ static void rtl8152_disconnect(struct usb_interface *intf)
 		unregister_netdev(tp->netdev);
 		tasklet_kill(&tp->tx_tl);
 		cancel_delayed_work_sync(&tp->hw_phy_work);
-		tp->rtl_ops.unload(tp);
+		if (tp->rtl_ops.unload)
+			tp->rtl_ops.unload(tp);
 		rtl8152_release_firmware(tp);
 		free_netdev(tp->netdev);
 	}
@@ -6934,13 +9003,28 @@ static void rtl8152_disconnect(struct usb_interface *intf)
 	.idProduct = (prod), \
 	.bInterfaceClass = USB_CLASS_COMM, \
 	.bInterfaceSubClass = USB_CDC_SUBCLASS_ETHERNET, \
+	.bInterfaceProtocol = USB_CDC_PROTO_NONE \
+}, \
+{ \
+	.match_flags = USB_DEVICE_ID_MATCH_INT_INFO | \
+		       USB_DEVICE_ID_MATCH_DEVICE, \
+	.idVendor = (vend), \
+	.idProduct = (prod), \
+	.bInterfaceClass = USB_CLASS_COMM, \
+	.bInterfaceSubClass = USB_CDC_SUBCLASS_NCM, \
 	.bInterfaceProtocol = USB_CDC_PROTO_NONE
 
 /* table of devices that work with this driver */
 static const struct usb_device_id rtl8152_table[] = {
+	/* Realtek */
 	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8050)},
+	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8053)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8152)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8153)},
+	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8155)},
+	{REALTEK_USB_DEVICE(VENDOR_ID_REALTEK, 0x8156)},
+
+	/* Microsoft */
 	{REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x07ab)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x07c6)},
 	{REALTEK_USB_DEVICE(VENDOR_ID_MICROSOFT, 0x0927)},
-- 
2.26.3

