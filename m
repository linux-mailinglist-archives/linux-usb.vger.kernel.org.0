Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9CA5FFEF7
	for <lists+linux-usb@lfdr.de>; Sun, 16 Oct 2022 13:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiJPLgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 07:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJPLgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 07:36:46 -0400
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2157.outbound.protection.outlook.com [40.92.63.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01DB39B99
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 04:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5tr0aH/iDact8PW2YF+T9vmi57046OWpYOfyv4tpQBN9O65j8M5XhAP8Dx3s+U92x/4CotZPE1IVJOfyLPnYgm26gWSv9wFLQH1KXzWNCCPsCplvH2cg8wXbe0zyxdk7LHTdTYPbdrsF/XVRct5SUAfB8j9hUZUOEATfsASdwUPfeZOIudKnO2IYnBI1G0oPR+ndDUdVwiRFk0sasXrIh/qxauv0xHl7rw3Q99BBxnI1oh485+GnsVT/qBXoaNnXKakiI41HvI/yosKd/tnf0uZD+N7aKk3LDWxhQ/oo4SHVIsvbpvRc3EHk3K8dxRcpEPLPA/64b75Na3eYrQ9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK9tbQsMylI7AlQMq3ATfw11RQ5+bFVq5Sfu1PDnLPY=;
 b=YOtY7JCjIvsjcWqws+AHcQc+tTZ2sLFGWpTXgtr2UpcXI1ufT1RBeWi7+acaM/ynkcgr8o0E9VmjsdcuX9l3/Pczk+WH/ZdL12lVCX53NFqGKHwr4SAjNStWScz42m4UJrG+Ue6oKDxLBGFE/xVRYKoZjTCDLEzRqaNWJfJwP2YVIFYkJliQDGdnf6z+lzOgyu5U7V2HNXrJqn/2mV21pqh1zP1QpMzY1GsnCFr2z2R0S3L5N7nvU8iuR2ajiwZ2m0MpPc7ZXocA4463A/NQBZNH4i3oGKNYGsK8foYllMLQo4I5Uzv9Z8uLXiLoUAcv6FLmamsgF1o4OQ+05LBIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK9tbQsMylI7AlQMq3ATfw11RQ5+bFVq5Sfu1PDnLPY=;
 b=cspkCXDrE0JNn6smF75mATxEeti8ML15X/NqPVocWDuDohbD+vHv+/ZbFuqrIdjOqxUfO+r8U8PFM8ohJ2HslPntUEqDywP2m73DOWuBgsGZnYxw3Dv6Xdr7/zj+r/ZwyrvoiWquDWM5RgUZ8GXNFu3RDq849BLPLBh0yp8Wv+MZn89KpMeEU9vNOhSwEYXSfjWyuPT3AAu6VMygJs9dsT79ksPQYdutIJLXhCddU1miUMQilpsGd2lJAz5LYxXgmaEoA/wV06WFhhNw+wI3BTlAJ6GMtxsKzn/JjH4adN7ptaYiQz5z7059ANIPuATrahsRGzdtJiHrRnZdkI7cTw==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by SY4P282MB2790.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sun, 16 Oct
 2022 11:36:39 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5723.032; Sun, 16 Oct 2022
 11:36:39 +0000
From:   Chun-Chao Yen <nothingstopsme@hotmail.com>
To:     pabeni@redhat.com
Cc:     davem@davemloft.net, linux-usb@vger.kernel.org
Subject: [PATCH 1/3 (RESENT)] net: usb: ax88179_178a: Enable FLAG_MULTI_PACKET to improve tx stability
Date:   Sun, 16 Oct 2022 19:36:25 +0800
Message-ID: <ME3P282MB28276594FEE8942909123B30D1269@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [i/E7ULRakQLLCCKulMHstcFR+zEnv+1w]
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:13c::13)
X-Microsoft-Original-Message-ID: <20221016113628.4176189-1-nothingstopsme@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2827:EE_|SY4P282MB2790:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2498a1-4fff-4d61-608c-08daaf6ab056
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAn/gOySyP2aTvqMuL2tpJ/IQ0AqqUvXKLG6NWMAWH/QNELEph31Wrh3eNzVrAH5PZJT0DwnzO/OO9XLyOuRp0DdqGhtirjLodfGcrEnewCkZe+js6LCWvOvXFxt5xAkSILsB4qkdzFKyV2QiD2hXQKndyqNpdJU6eTagM9rz1Qdh7bj5QHvYS+la5+wBcORGdngdRPAYlmY4ZSI7DvhcHmU1PpKqh/ekRVXtxTOhKJ5ZEbiYb7xThucxdZ21ZvEvW/PU2U0h8fGXKvsycwfZnDlfhrbI6Wi2oQ5Jl46hIWQvrjXv+zVIp5xF+Y3u2lMIBuA2mA5YmvskJkE0WWJwUh6PcvI2OHLT4G93mHUelVdjkXMAtdtZ7e3K9IM82p6L3DwwX8jt7Ts0npT454p9iuvGeXQ6K3AnZ8b0e6K8jUArsrn1l8pDuHV3PyW2kbh2yObBKkHoaaRw+6E7MprEXPflKDTVL0pYknItX/jSxgV1U/mBmADhhGpw3nK6oCWlppHXVEsxZM0i7kyx76C/oM27aVJY8J75JZSledwgXeDsCC8Li0umGQAvkYV8sZmN4Tqsm29+wE8m8V4eFlez+RW4Q+tMx/GbHAVlIZKw/mBcmcTWoR7fGcYphWT5kVx
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b/2ADQkmBeFigeFUmtsySEXqDMddm6gZYdDY9/WCuQeMpUdkkPy+x53sqUjA?=
 =?us-ascii?Q?vi8YEhqvfccAkVSeV0bXWKhLP6VSRTuDOhFWi+Drn5Um0/7GTwJfUGXUbHgZ?=
 =?us-ascii?Q?l78/JLbEmcp+OAcsAlK+ukvuM7s25tP3w76ZJBAfPV/Vw4OYSmOWvrOEw9Mt?=
 =?us-ascii?Q?MPQ5x0KGaH+pg/pmJQQmNtHgmMAKucdMUS/USKlbPkDEyWcr+FDmjGht3TCS?=
 =?us-ascii?Q?l+4DMcUXkQ7BzT7dYPtLauSALjklel8dBYztoGqNmP2aYTEbod1RjzsUIQtJ?=
 =?us-ascii?Q?+X9bVPPaKl+Y6NVwUtOsbYs3YMGzS5fbW+6/DKoqc0xs6NA1ai/DhZdfMpmJ?=
 =?us-ascii?Q?2YKPlFZEw3EXj8XJ5PmUB93cBSzMAxrOnsO6U0aSwQ6MbP+/VHJNOwYGao+8?=
 =?us-ascii?Q?Xv/0j8K2NvgsN2Om2P28U9n6nTww9aWUpKI82kScS+nK/Eku9YcnvOcdzsEa?=
 =?us-ascii?Q?8tWnI/HnKvLBJ6CNU5TsQN8B3JI4aj6HpOTLPKwXhuSuWdZ3rcNlyWOMlxQf?=
 =?us-ascii?Q?Aq3xUnvPVdqw6wdNEeXcGDFtd454TqKcuQM+f+phGVyT/UN0VSZFgBOJYbKt?=
 =?us-ascii?Q?gbWIEiEjPlLkT6xQ6SQvIgmAxKA3dplK3TPzd84CTirMs1SeGIV6fMaF+KlN?=
 =?us-ascii?Q?9Ver7FSCZVGof/f9/Mh74Ff4HXAdgmGPRruChcm+qL7NUs2QwvGchNXl7FRR?=
 =?us-ascii?Q?gaH4en0ip+5RbaZeAlho+apIQLfma77Ft2ThzWKktNMy+L3ncJM6DDfBR1CK?=
 =?us-ascii?Q?kEHHP8oapsoFFCrg8KH4kU0/gB0or1tKSi4jaU1rMWvMLPi1kreA1FR63Lb1?=
 =?us-ascii?Q?cGpvY07/liLtpvGXoBmC3vqtm0/2aUVuQURgYeeFHeXJEDxlXhzI42Z1NsWJ?=
 =?us-ascii?Q?QRn1AuK2sT3rDJs+360uG+IWD6zIAjCbumPf8XSLl+meNBQ4kC0q0+U5/uJX?=
 =?us-ascii?Q?gJ/3CTKJlL8zeOkKPVmtiNipVq5fLnXwUC36+Bf9wqTthgUqGuVRT7H4Dobh?=
 =?us-ascii?Q?i9BplUj3eiUEBG7yo97UeBHcg6kQ8MpuWGNdaAvitraXPO/zPOO4hFbIa5H/?=
 =?us-ascii?Q?GqpKpKRt7uD+9PH5NDROdf0U+r3vIMQgAOcM3tnpdY6jzTwbQBY3G3banhHE?=
 =?us-ascii?Q?LavDp8GfCm1G0fGDr2T0AlUEs+mP3IMEViOSWuK/gZQDoOL2VP7yTA5FUist?=
 =?us-ascii?Q?BqY1UXbFa//S30lFaFpG8WXWKKdW2a3Hz5Otp+dwwxfZ7Z+TIZ9RqIRD6NRE?=
 =?us-ascii?Q?5+7JPvLC8f9iXhDusHmS4fx75Ez0dHUX6x+CbQ1oFg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2498a1-4fff-4d61-608c-08daaf6ab056
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2022 11:36:39.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB2790
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Problem Description:
The current way of handling the boundary case in tx, i.e. adding one-byte
padding when the size of an outbound packet is a multiple of the maximum
frame size used for USB bulk transfer, does not work with the hardware.
This can be shown by running a loading test via iperf with this hardware as
the sender; one can then tune the iperf parameters on the sender side (e.g.
"-M 510" in my testing environment) so that sent packets frequently hit the
boundary condition, and observe a significant drop in the transmission
rate. In the worst case (often after a long run), the hardware can stop
functioning (can not send or receive packets anymore, albeit the
corresponding network interface is still reported present by ifconfig).

It is also believed that this problem is highly relevant to this bug [1].

Solution:
Enable FLAG_MULTI_PACKET and modify both ax88179_rx_fixup() and
ax88179_tx_fixup() accordingly.

Rationale:
When FLAG_MULTI_PACKET is enabled (and FLAG_SEND_ZLP is off, which is the
case for this driver), usbnet will skip padding, and trust that each
sk_buff returned from the mini-driver's tx_fixup function has been taken
care of to cater for the requirement of its target hardware. That
mechanism allows this mini-driver to send, even when the boundary condition
is detected, "untampered" packets (no padding, no extra flags, as if in the
normal case) that the hardware accepts, and therefore resolves this
problem.

Note that rather than being viewed as a workaround, enabling
FLAG_MULTI_PACKET is intended to better match the overall behaviour of the
hardware, as it also echos well the rx procedure conducting multiple-packet
extraction from a single sk_buff in ax88179_rx_fixup().

Verification:
Only tested with this device:
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet

References:
[1] https://bugzilla.kernel.org/show_bug.cgi?id=212731

Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>
---
 drivers/net/usb/ax88179_178a.c | 62 ++++++++++++++--------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index aff39bf3161d..b50748b3776c 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1426,58 +1426,48 @@ static int ax88179_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		if ((*pkt_hdr & (AX_RXHDR_CRC_ERR | AX_RXHDR_DROP_ERR)) ||
 		    pkt_len < 2 + ETH_HLEN) {
 			dev->net->stats.rx_errors++;
-			skb_pull(skb, pkt_len_plus_padd);
-			continue;
-		}
-
-		/* last packet */
-		if (pkt_len_plus_padd == skb->len) {
-			skb_trim(skb, pkt_len);
-
-			/* Skip IP alignment pseudo header */
-			skb_pull(skb, 2);
-
-			skb->truesize = SKB_TRUESIZE(pkt_len_plus_padd);
-			ax88179_rx_checksum(skb, pkt_hdr);
-			return 1;
+			goto advance_data_ptr;
 		}
 
 		ax_skb = skb_clone(skb, GFP_ATOMIC);
-		if (!ax_skb)
-			return 0;
+		if (!ax_skb) {
+			/* Report a packet droped, and continue parsing the rest
+			 */
+			dev->net->stats.rx_dropped++;
+			goto advance_data_ptr;
+		}
 		skb_trim(ax_skb, pkt_len);
 
 		/* Skip IP alignment pseudo header */
 		skb_pull(ax_skb, 2);
 
-		skb->truesize = pkt_len_plus_padd +
-				SKB_DATA_ALIGN(sizeof(struct sk_buff));
+		ax_skb->truesize = SKB_TRUESIZE(pkt_len);
 		ax88179_rx_checksum(ax_skb, pkt_hdr);
 		usbnet_skb_return(dev, ax_skb);
 
+advance_data_ptr:
 		skb_pull(skb, pkt_len_plus_padd);
 	}
 
-	return 0;
+	return 1;
 }
 
 static struct sk_buff *
 ax88179_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)
 {
 	u32 tx_hdr1, tx_hdr2;
-	int frame_size = dev->maxpacket;
 	int headroom;
 	void *ptr;
 
 	tx_hdr1 = skb->len;
 	tx_hdr2 = skb_shinfo(skb)->gso_size; /* Set TSO mss */
-	if (((skb->len + 8) % frame_size) == 0)
-		tx_hdr2 |= 0x80008000;	/* Enable padding */
 
 	headroom = skb_headroom(skb) - 8;
 
-	if ((dev->net->features & NETIF_F_SG) && skb_linearize(skb))
+	if ((dev->net->features & NETIF_F_SG) && skb_linearize(skb)) {
+		dev_kfree_skb_any(skb);
 		return NULL;
+	}
 
 	if ((skb_header_cloned(skb) || headroom < 0) &&
 	    pskb_expand_head(skb, headroom < 0 ? 8 : 0, 0, GFP_ATOMIC)) {
@@ -1680,7 +1670,7 @@ static const struct driver_info ax88179_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1693,7 +1683,7 @@ static const struct driver_info ax88178a_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1706,7 +1696,7 @@ static const struct driver_info cypress_GX3_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1719,7 +1709,7 @@ static const struct driver_info dlink_dub1312_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1732,7 +1722,7 @@ static const struct driver_info sitecom_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1745,7 +1735,7 @@ static const struct driver_info samsung_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1758,7 +1748,7 @@ static const struct driver_info lenovo_info = {
 	.link_reset = ax88179_link_reset,
 	.reset = ax88179_reset,
 	.stop = ax88179_stop,
-	.flags = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1771,7 +1761,7 @@ static const struct driver_info belkin_info = {
 	.link_reset = ax88179_link_reset,
 	.reset	= ax88179_reset,
 	.stop	= ax88179_stop,
-	.flags	= FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags	= FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1784,7 +1774,7 @@ static const struct driver_info toshiba_info = {
 	.link_reset = ax88179_link_reset,
 	.reset	= ax88179_reset,
 	.stop = ax88179_stop,
-	.flags	= FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags	= FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1797,7 +1787,7 @@ static const struct driver_info mct_info = {
 	.link_reset = ax88179_link_reset,
 	.reset	= ax88179_reset,
 	.stop	= ax88179_stop,
-	.flags	= FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags	= FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1810,7 +1800,7 @@ static const struct driver_info at_umc2000_info = {
 	.link_reset = ax88179_link_reset,
 	.reset  = ax88179_reset,
 	.stop   = ax88179_stop,
-	.flags  = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags  = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1823,7 +1813,7 @@ static const struct driver_info at_umc200_info = {
 	.link_reset = ax88179_link_reset,
 	.reset  = ax88179_reset,
 	.stop   = ax88179_stop,
-	.flags  = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags  = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
@@ -1836,7 +1826,7 @@ static const struct driver_info at_umc2000sp_info = {
 	.link_reset = ax88179_link_reset,
 	.reset  = ax88179_reset,
 	.stop   = ax88179_stop,
-	.flags  = FLAG_ETHER | FLAG_FRAMING_AX,
+	.flags  = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET,
 	.rx_fixup = ax88179_rx_fixup,
 	.tx_fixup = ax88179_tx_fixup,
 };
-- 
2.32.0

