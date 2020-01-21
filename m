Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 413AE143D23
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 13:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbgAUMm7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 07:42:59 -0500
Received: from rtits2.realtek.com ([211.75.126.72]:54701 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729855AbgAUMm6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jan 2020 07:42:58 -0500
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00LCgtic011010, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (smtpsrv.realtek.com[172.21.6.18])
        by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00LCgtic011010
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 21 Jan 2020 20:42:55 +0800
Received: from fc30.localdomain (172.21.177.138) by RTITCASV01.realtek.com.tw
 (172.21.6.18) with Microsoft SMTP Server id 14.3.468.0; Tue, 21 Jan 2020
 20:42:53 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <netdev@vger.kernel.org>
CC:     <nic_swsd@realtek.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <pmalani@chromium.org>,
        <grundler@chromium.org>, Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH net 5/9] r8152: Disable PLA MCU clock speed down
Date:   Tue, 21 Jan 2020 20:40:31 +0800
Message-ID: <1394712342-15778-343-Taiwan-albertk@realtek.com>
X-Mailer: Microsoft Office Outlook 11
In-Reply-To: <1394712342-15778-338-Taiwan-albertk@realtek.com>
References: <1394712342-15778-338-Taiwan-albertk@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.138]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PLA MCU clock speed down could only be enabled when tx/rx are disabled.
Otherwise, the packet lost may occur.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 0a118fd83692..eabc7b43d48b 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -324,6 +324,7 @@
 #define MAC_CLK_SPDWN_EN	BIT(15)
 
 /* PLA_MAC_PWR_CTRL3 */
+#define PLA_MCU_SPDWN_EN	BIT(14)
 #define PKT_AVAIL_SPDWN_EN	0x0100
 #define SUSPEND_SPDWN_EN	0x0004
 #define U1U2_SPDWN_EN		0x0002
@@ -5004,6 +5005,8 @@ static void rtl8153_down(struct r8152 *tp)
 
 static void rtl8153b_up(struct r8152 *tp)
 {
+	u32 ocp_data;
+
 	if (test_bit(RTL8152_UNPLUG, &tp->flags))
 		return;
 
@@ -5014,17 +5017,27 @@ static void rtl8153b_up(struct r8152 *tp)
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
@@ -5520,6 +5533,10 @@ static void r8153b_init(struct r8152 *tp)
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

