Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F33B144CDB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 09:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgAVIDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 03:03:34 -0500
Received: from rtits2.realtek.com ([211.75.126.72]:33433 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729191AbgAVIDb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 03:03:31 -0500
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00M83R1u009745, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00M83R1u009745
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Jan 2020 16:03:28 +0800
Received: from RTEXMB06.realtek.com.tw (172.21.6.99) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 22 Jan 2020 16:03:27 +0800
Received: from RTITCASV01.realtek.com.tw (172.21.6.18) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.1779.2
 via Frontend Transport; Wed, 22 Jan 2020 16:03:27 +0800
Received: from fc30.localdomain (172.21.177.138) by RTITCASV01.realtek.com.tw
 (172.21.6.18) with Microsoft SMTP Server id 14.3.468.0; Wed, 22 Jan 2020
 16:03:26 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <netdev@vger.kernel.org>
CC:     <nic_swsd@realtek.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <pmalani@chromium.org>,
        <grundler@chromium.org>, Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH net v3 5/9] r8152: Disable PLA MCU clock speed down
Date:   Wed, 22 Jan 2020 16:02:09 +0800
Message-ID: <1394712342-15778-363-Taiwan-albertk@realtek.com>
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <1394712342-15778-358-Taiwan-albertk@realtek.com>
References: <1394712342-15778-338-Taiwan-albertk@realtek.com>
 <1394712342-15778-358-Taiwan-albertk@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.138]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PLA MCU clock speed down could only be enabled when tx/rx are disabled.
Otherwise, the packet loss may occur.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index bc6b2f8aaa7e..1fb85c79bd33 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -324,6 +324,7 @@
 #define MAC_CLK_SPDWN_EN	BIT(15)
 
 /* PLA_MAC_PWR_CTRL3 */
+#define PLA_MCU_SPDWN_EN	BIT(14)
 #define PKT_AVAIL_SPDWN_EN	0x0100
 #define SUSPEND_SPDWN_EN	0x0004
 #define U1U2_SPDWN_EN		0x0002
@@ -5005,6 +5006,8 @@ static void rtl8153_down(struct r8152 *tp)
 
 static void rtl8153b_up(struct r8152 *tp)
 {
+	u32 ocp_data;
+
 	if (test_bit(RTL8152_UNPLUG, &tp->flags))
 		return;
 
@@ -5015,17 +5018,27 @@ static void rtl8153b_up(struct r8152 *tp)
 	r8153_first_init(tp);
 	ocp_write_dword(tp, MCU_TYPE_USB, USB_RX_BUF_TH, RX_THR_B);
 
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data &= ~PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
 	r8153_aldps_en(tp, true);
 	r8153b_u1u2en(tp, true);
 }
 
 static void rtl8153b_down(struct r8152 *tp)
 {
+	u32 ocp_data;
+
 	if (test_bit(RTL8152_UNPLUG, &tp->flags)) {
 		rtl_drop_queued_tx(tp);
 		return;
 	}
 
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data |= PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
 	r8153b_u1u2en(tp, false);
 	r8153_u2p3en(tp, false);
 	r8153b_power_cut_en(tp, false);
@@ -5521,6 +5534,10 @@ static void r8153b_init(struct r8152 *tp)
 	ocp_data |= MAC_CLK_SPDWN_EN;
 	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL2, ocp_data);
 
+	ocp_data = ocp_read_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3);
+	ocp_data &= ~PLA_MCU_SPDWN_EN;
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, ocp_data);
+
 	set_bit(GREEN_ETHERNET, &tp->flags);
 
 	/* rx aggregation */
-- 
2.21.0

