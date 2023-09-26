Return-Path: <linux-usb+bounces-587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A87147AEB4C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 13:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8D897281E3A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CF026E35;
	Tue, 26 Sep 2023 11:18:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E537266C1;
	Tue, 26 Sep 2023 11:18:34 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB6211F;
	Tue, 26 Sep 2023 04:18:31 -0700 (PDT)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38QBHkQpA857841, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38QBHkQpA857841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Sep 2023 19:17:46 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 26 Sep 2023 19:17:44 +0800
Received: from fc38.localdomain (172.22.228.98) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 26 Sep
 2023 19:17:43 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: <kuba@kernel.org>, <davem@davemloft.net>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
        Hayes Wang
	<hayeswang@realtek.com>
Subject: [PATCH net-next v3 2/2] r8152: use napi_gro_frags
Date: Tue, 26 Sep 2023 19:17:14 +0800
Message-ID: <20230926111714.9448-434-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926111714.9448-432-nic_swsd@realtek.com>
References: <20230926111714.9448-432-nic_swsd@realtek.com>
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
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Use napi_gro_frags() for the skb of fragments when the work_done is less
than budget.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 67 ++++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index c4038def193f..1231bf365796 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2490,8 +2490,9 @@ static int rx_bottom(struct r8152 *tp, int budget)
 		while (urb->actual_length > len_used) {
 			struct net_device *netdev = tp->netdev;
 			struct net_device_stats *stats = &netdev->stats;
-			unsigned int pkt_len, rx_frag_head_sz;
+			unsigned int pkt_len, rx_frag_head_sz, len;
 			struct sk_buff *skb;
+			bool use_frags;
 
 			WARN_ON_ONCE(skb_queue_len(&tp->rx_queue) >= 1000);
 
@@ -2504,45 +2505,77 @@ static int rx_bottom(struct r8152 *tp, int budget)
 				break;
 
 			pkt_len -= ETH_FCS_LEN;
+			len = pkt_len;
 			rx_data += sizeof(struct rx_desc);
 
-			if (!agg_free || tp->rx_copybreak > pkt_len)
-				rx_frag_head_sz = pkt_len;
+			if (!agg_free || tp->rx_copybreak > len)
+				use_frags = false;
 			else
-				rx_frag_head_sz = tp->rx_copybreak;
+				use_frags = true;
+
+			if (use_frags) {
+				/* If the budget is exhausted, the packet
+				 * would be queued in the driver. That is,
+				 * napi_gro_frags() wouldn't be called, so
+				 * we couldn't use napi_get_frags().
+				 */
+				if (work_done >= budget) {
+					rx_frag_head_sz = tp->rx_copybreak;
+					skb = napi_alloc_skb(napi,
+							     rx_frag_head_sz);
+				} else {
+					rx_frag_head_sz = 0;
+					skb = napi_get_frags(napi);
+				}
+			} else {
+				rx_frag_head_sz = 0;
+				skb = napi_alloc_skb(napi, len);
+			}
 
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
+				if (rx_frag_head_sz) {
+					memcpy(skb->data, rx_data,
+					       rx_frag_head_sz);
+					skb_put(skb, rx_frag_head_sz);
+					len -= rx_frag_head_sz;
+					rx_data += rx_frag_head_sz;
+					skb->protocol = eth_type_trans(skb,
+								       netdev);
+				}
+
 				skb_add_rx_frag(skb, 0, agg->page,
 						agg_offset(agg, rx_data),
-						pkt_len,
-						SKB_DATA_ALIGN(pkt_len));
+						len, SKB_DATA_ALIGN(len));
 				get_page(agg->page);
+			} else {
+				memcpy(skb->data, rx_data, len);
+				skb_put(skb, len);
+				skb->protocol = eth_type_trans(skb, netdev);
 			}
 
-			skb->protocol = eth_type_trans(skb, netdev);
-			rtl_rx_vlan_tag(rx_desc, skb);
 			if (work_done < budget) {
+				if (use_frags)
+					napi_gro_frags(napi);
+				else
+					napi_gro_receive(napi, skb);
+
 				work_done++;
 				stats->rx_packets++;
-				stats->rx_bytes += skb->len;
-				napi_gro_receive(napi, skb);
+				stats->rx_bytes += pkt_len;
 			} else {
 				__skb_queue_tail(&tp->rx_queue, skb);
 			}
 
 find_next_rx:
-			rx_data = rx_agg_align(rx_data + pkt_len + ETH_FCS_LEN);
+			rx_data = rx_agg_align(rx_data + len + ETH_FCS_LEN);
 			rx_desc = (struct rx_desc *)rx_data;
 			len_used = agg_offset(agg, rx_data);
 			len_used += sizeof(struct rx_desc);
-- 
2.41.0


