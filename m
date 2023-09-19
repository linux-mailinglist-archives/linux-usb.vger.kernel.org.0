Return-Path: <linux-usb+bounces-354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D107A57CC
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 05:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A7B281215
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 03:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F875341A9;
	Tue, 19 Sep 2023 03:15:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC9328D7;
	Tue, 19 Sep 2023 03:14:58 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4DD111;
	Mon, 18 Sep 2023 20:14:54 -0700 (PDT)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38J3EMDj82933326, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38J3EMDj82933326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Sep 2023 11:14:22 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 19 Sep 2023 11:14:05 +0800
Received: from fc38.localdomain (172.22.228.98) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 19 Sep
 2023 11:14:04 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: <kuba@kernel.org>, <davem@davemloft.net>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
        Hayes Wang
	<hayeswang@realtek.com>
Subject: [PATCH net-next v2 2/2] r8152: use napi_gro_frags
Date: Tue, 19 Sep 2023 11:13:51 +0800
Message-ID: <20230919031351.7334-431-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919031351.7334-429-nic_swsd@realtek.com>
References: <20230919031351.7334-429-nic_swsd@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.228.98]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Use napi_gro_frags() for the skb of fragments.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 03bb3a58f2a6..00dac52dea44 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2462,8 +2462,9 @@ static int rx_bottom(struct r8152 *tp, int budget)
 		while (urb->actual_length > len_used) {
 			struct net_device *netdev = tp->netdev;
 			struct net_device_stats *stats = &netdev->stats;
-			unsigned int pkt_len, rx_frag_head_sz;
+			unsigned int pkt_len;
 			struct sk_buff *skb;
+			bool use_frags;
 
 			pkt_len = le32_to_cpu(rx_desc->opts1) & RX_LEN_MASK;
 			if (pkt_len < ETH_ZLEN)
@@ -2477,35 +2478,40 @@ static int rx_bottom(struct r8152 *tp, int budget)
 			rx_data += sizeof(struct rx_desc);
 
 			if (!agg_free || tp->rx_copybreak > pkt_len)
-				rx_frag_head_sz = pkt_len;
+				use_frags = false;
 			else
-				rx_frag_head_sz = tp->rx_copybreak;
+				use_frags = true;
+
+			if (use_frags)
+				skb = napi_get_frags(napi);
+			else
+				skb = napi_alloc_skb(napi, pkt_len);
 
-			skb = napi_alloc_skb(napi, rx_frag_head_sz);
 			if (!skb) {
 				stats->rx_dropped++;
 				goto find_next_rx;
 			}
 
 			skb->ip_summed = r8152_rx_csum(tp, rx_desc);
-			memcpy(skb->data, rx_data, rx_frag_head_sz);
-			skb_put(skb, rx_frag_head_sz);
-			pkt_len -= rx_frag_head_sz;
-			rx_data += rx_frag_head_sz;
-			if (pkt_len) {
+			rtl_rx_vlan_tag(rx_desc, skb);
+
+			if (use_frags) {
 				skb_add_rx_frag(skb, 0, agg->page,
 						agg_offset(agg, rx_data),
 						pkt_len,
 						SKB_DATA_ALIGN(pkt_len));
 				get_page(agg->page);
+				napi_gro_frags(napi);
+			} else {
+				memcpy(skb->data, rx_data, pkt_len);
+				skb_put(skb, pkt_len);
+				skb->protocol = eth_type_trans(skb, netdev);
+				napi_gro_receive(napi, skb);
 			}
 
-			skb->protocol = eth_type_trans(skb, netdev);
-			rtl_rx_vlan_tag(rx_desc, skb);
 			work_done++;
 			stats->rx_packets++;
-			stats->rx_bytes += skb->len;
-			napi_gro_receive(napi, skb);
+			stats->rx_bytes += pkt_len;
 
 find_next_rx:
 			rx_data = rx_agg_align(rx_data + pkt_len + ETH_FCS_LEN);
-- 
2.41.0


