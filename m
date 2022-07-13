Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B07572BED
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 05:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbiGMDcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 23:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbiGMDcF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 23:32:05 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6047D8601;
        Tue, 12 Jul 2022 20:32:01 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 26D3VcON2023796, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 26D3VcON2023796
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 13 Jul 2022 11:31:38 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 13 Jul 2022 11:31:40 +0800
Received: from fc34.localdomain (172.21.177.102) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 13 Jul
 2022 11:31:40 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <kuba@kernel.org>, <davem@davemloft.net>
CC:     <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH v2 net] r8152: fix accessing unset transport header
Date:   Wed, 13 Jul 2022 11:31:11 +0800
Message-ID: <20220711070004.28010-390-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220711070004.28010-389-nic_swsd@realtek.com>
References: <20220711070004.28010-389-nic_swsd@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.102]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/13/2022 03:13:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzcvMTIgpFWkyCAxMDo1MzowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A warning is triggered by commit 66e4c8d95008 ("net: warn if transport
header was not set"). The warning is harmless, because the value from
skb_transport_offset() is only used for skb_is_gso() is true or the
skb->ip_summed is equal to CHECKSUM_PARTIAL.

Fixes: 66e4c8d95008 ("net: warn if transport header was not set")
Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
v2:
The warining appears since commit 66e4c8d95008 ("net: warn if transport
header was not set"), so add a Fixed tag for referring to it.

 drivers/net/usb/r8152.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 7389d6ef8569..b082819509e1 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2156,7 +2156,7 @@ static inline void rtl_rx_vlan_tag(struct rx_desc *desc, struct sk_buff *skb)
 }
 
 static int r8152_tx_csum(struct r8152 *tp, struct tx_desc *desc,
-			 struct sk_buff *skb, u32 len, u32 transport_offset)
+			 struct sk_buff *skb, u32 len)
 {
 	u32 mss = skb_shinfo(skb)->gso_size;
 	u32 opts1, opts2 = 0;
@@ -2167,6 +2167,8 @@ static int r8152_tx_csum(struct r8152 *tp, struct tx_desc *desc,
 	opts1 = len | TX_FS | TX_LS;
 
 	if (mss) {
+		u32 transport_offset = (u32)skb_transport_offset(skb);
+
 		if (transport_offset > GTTCPHO_MAX) {
 			netif_warn(tp, tx_err, tp->netdev,
 				   "Invalid transport offset 0x%x for TSO\n",
@@ -2197,6 +2199,7 @@ static int r8152_tx_csum(struct r8152 *tp, struct tx_desc *desc,
 		opts1 |= transport_offset << GTTCPHO_SHIFT;
 		opts2 |= min(mss, MSS_MAX) << MSS_SHIFT;
 	} else if (skb->ip_summed == CHECKSUM_PARTIAL) {
+		u32 transport_offset = (u32)skb_transport_offset(skb);
 		u8 ip_protocol;
 
 		if (transport_offset > TCPHO_MAX) {
@@ -2260,7 +2263,6 @@ static int r8152_tx_agg_fill(struct r8152 *tp, struct tx_agg *agg)
 		struct tx_desc *tx_desc;
 		struct sk_buff *skb;
 		unsigned int len;
-		u32 offset;
 
 		skb = __skb_dequeue(&skb_head);
 		if (!skb)
@@ -2276,9 +2278,7 @@ static int r8152_tx_agg_fill(struct r8152 *tp, struct tx_agg *agg)
 		tx_data = tx_agg_align(tx_data);
 		tx_desc = (struct tx_desc *)tx_data;
 
-		offset = (u32)skb_transport_offset(skb);
-
-		if (r8152_tx_csum(tp, tx_desc, skb, skb->len, offset)) {
+		if (r8152_tx_csum(tp, tx_desc, skb, skb->len)) {
 			r8152_csum_workaround(tp, skb, &skb_head);
 			continue;
 		}
@@ -2759,9 +2759,9 @@ rtl8152_features_check(struct sk_buff *skb, struct net_device *dev,
 {
 	u32 mss = skb_shinfo(skb)->gso_size;
 	int max_offset = mss ? GTTCPHO_MAX : TCPHO_MAX;
-	int offset = skb_transport_offset(skb);
 
-	if ((mss || skb->ip_summed == CHECKSUM_PARTIAL) && offset > max_offset)
+	if ((mss || skb->ip_summed == CHECKSUM_PARTIAL) &&
+	    skb_transport_offset(skb) > max_offset)
 		features &= ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
 	else if ((skb->len + sizeof(struct tx_desc)) > agg_buf_sz)
 		features &= ~NETIF_F_GSO_MASK;
-- 
2.34.3

