Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDBC5F79A1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Oct 2022 16:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiJGOU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Oct 2022 10:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiJGOU4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Oct 2022 10:20:56 -0400
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2171.outbound.protection.outlook.com [40.92.62.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832CB11877D
        for <linux-usb@vger.kernel.org>; Fri,  7 Oct 2022 07:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQO2U7tIY9YVZNDW99L4E2zyTrgF9EuJydt3aaZmeI2SnIy1J06wCnMDo4dRvKz8n3IKGlCGb4aNe6Hr4ifxOE6o16BPiEhJPkayh5IhW6vzG4JHhipP11SDmNhu+3q5LLjdjkFAVXWZ4RWmAA1AgNTkjJOhQOckyiXK3bnazhYUkYLG5WTCqynJabfMwG93RCeRzXnza8Wddd6tb7TTVWVXSSo3j87nL8U32NBzwU9aDYlFcwRHF5lXIJ5xVcxlO9T3iZaD1O9xCQ3zWdrA5QJ+3/WDVnjIPhqKEKsvV4O4P2rMKQnj3/QpGq5UYnvurb30sG0SM1YHsEpyNWyANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK9tbQsMylI7AlQMq3ATfw11RQ5+bFVq5Sfu1PDnLPY=;
 b=IAn5+B5t1aNI2XAtDDw9GH/2ghc+bkRRIkrCa2gH7G8uhF/RKzrJtafQ6WU4ASy4O3NG9SkNIKnObJhQNwdz/3Ha98L4apM+goTcIMBNX33P/N1vXM1o+G5+CQmJ4mkVD5Da/eVOj8Nd6umigs8o6RMnhJ5bvatobEFSDvnW0mJna8HV4SbQGDRzoKHC+GFCyuP/gHQTiPiZWXWsHK3whCGbXcz2s/GeCGl/t3lRlZhCe4xQKJhC7d6T4Kzm9iQUELI+8q3Qzp53wwlMFKlPl6cDR5GNzj4nQ8bBWul9hbG9aeCz2C0hpHIHO7H0DxpZCiFKHpHYkryvFiQ1r61z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK9tbQsMylI7AlQMq3ATfw11RQ5+bFVq5Sfu1PDnLPY=;
 b=sxCDsHA/GVfRHhZruwj6zHjmiV9okdLeJ/q8YAK5aiabqjLnyYCqk+DNnTjPGSPPCd3hEwqBvlU7bjpo0bmcR/3f96O9iZi2XdSgZl95SISC6Xw5j3vtLvz2bl5w7XcCI65YTCqLr0sQqIRe2uagHq7Cu3awxGMBc4xZigIA4GdCZjuFd8SgGSQ1NBy5R0WbqfEztY/+mMfQpAsv/IArjz7NhB0HUkY0ie0W7hLd1bCN4UDtzUxfPsugcn0lCUDnOZN1zedeywB22ut9rczId11LUU0Yy7tY0zOd9l2jSrU/9u8UihHqgHu4jFIYEuWdlSETJ0H9aUjfJiSeGSkjsw==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by MEYP282MB3181.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 14:20:50 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 14:20:50 +0000
From:   Chun-Chao Yen <nothingstopsme@hotmail.com>
To:     davem@davemloft.net
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/3] net: usb: ax88179_178a: Enable FLAG_MULTI_PACKET to improve tx stability
Date:   Fri,  7 Oct 2022 22:20:36 +0800
Message-ID: <ME3P282MB2827A82474F353487FF91CE4D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [nInBIeXckUijPxhIp3A8suA4EhPYSt2N]
X-ClientProxiedBy: PUZP153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:301:c2::18) To ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:13c::13)
X-Microsoft-Original-Message-ID: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2827:EE_|MEYP282MB3181:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b528dc0-b1ea-4fc8-72e5-08daa86f227c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JTkb2CnyWhC5jdnpCj5EyeSxESMArGwjDzLfJYZDh4iHDPSId6xRQo7My9bSC6IGiC/Hs6vo4BWSPorkzhVPGjMm2CstJl0Gwxg1fbL0EiCzZillgkmG7cEKhP/kgFUZFf9Q9TdeOClPdLWKS2ap7MesrK3MeEKawdggQqgqApbOjuPF/M9OcQM7rhpCYGE09xW8wzvIgS4wSH048/o35zTCevZiwkNsHk4bBfaQI63gR48wr7/xcMKnbdL3iqILwjP8DVA37Ui1AcpkjxTtaFpo7hBLq9A6XuMFeVGSIQmWU8nIBjP3P85XwMUd5XP6Sc7t4yXQLkAEonbofukRmpLiza6S4DKEy6blrVn/V//OrfUFhz5Ph14WkJpJA95ckfhjlNl/RTBAo9TPVQtNI0zGQ8v2h9zivQELcG2Y04Mu4gR9MBiwPx4NTD6dWRe2ejKcFZhwdthdFqgMf0Q1DtbxdMtP8eIp7u9r9zG9SFbZ5EACN2GcfNS5FV7Jq/N2Sop9MVeT6/Js8RVM/fLLvcU4LUcs0ZdmgxTbpmoTYeL5oOBq+9OXBgPeOTZC4q++X9d21FOs2QnbD94SFYqpp3VBfqqs5hpxUbBINx7RkF67Vp8ADUVUIKEVT7UFWu27
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NF4DPY21YzJQ8RFRcV08Ow8sIdaElBf9w7B/Ub1Ald5vVO2zqx9SCFoCVGiZ?=
 =?us-ascii?Q?nbWHbbu2uLINFXIeJYVyKaCrMRF00c0TwZUu+zcKsAROsQh19DehF9tRY+xt?=
 =?us-ascii?Q?KvTGLEpnO5v8gUMGUVytIDYuytHPItEahfpZMT99dQJC/lf6PLQQkbSEfNCi?=
 =?us-ascii?Q?YrOq/SOKybDBWCCJJl1wzD/Z7aVeud2KxzaDVPkhD9WH6I7fo2oSD44OBpe+?=
 =?us-ascii?Q?LbRDZdQNTE3mpjnWFpajQLqaoo3LsRsKQcox3rH1webP/vwo+bKAZz9URFUZ?=
 =?us-ascii?Q?EnVwGutOLfaQFQOmH5hH7yMOlZJv3L5ZkIW+0n1qcMViKZSgpqG+UWfsKNAd?=
 =?us-ascii?Q?Q+cpExCcUBh7cWFT8R5YFl638cHmrxpCp7KCHSOoLeJDETmG1rVpVmCsn4BL?=
 =?us-ascii?Q?N56i58Yocyzc9srrMu9W1uOL37aIIjXMUMVsqDucelHK3DLD8b/OdhuZoS6j?=
 =?us-ascii?Q?cW2roXlLkq+WQmjvjypN1Syx542W2qWlXn7LeERTJ5bldKwtSclCWwj7RkoY?=
 =?us-ascii?Q?qzvDaCfsOsWJ6EVhkcew0M56k+k6K2m5C8Ppcb7bN+JI0flTLe/Zwi/Pl2Y7?=
 =?us-ascii?Q?p1m82wk84fXuTUwdwc0tetJx++ztKYaZDN71RsXyv3XMfhW8kZb3hPCDmGQU?=
 =?us-ascii?Q?ISROwwLdIZI6+TX/fhsSGuG4F3v74mDlQ/RO+4EXphavpr8gQbT8I8Ol3whB?=
 =?us-ascii?Q?SVU8Gga7EJi9PKUTjiluiJiAhl85CwkzgKhWwlzlCKA0GBGZWzbfRIr9ApRv?=
 =?us-ascii?Q?GIDmDpYcuHcb5QgPg7jU7B85woLVOPLGQ8glPxaC6yglFrnIn18bc0Bcdoza?=
 =?us-ascii?Q?NnbAxvmBXotD0VaDzKthy8Z1c5Lh2p/Dn3kYLdtehrp+M/qWl0rPGL1VldDg?=
 =?us-ascii?Q?9CH83nx1Y4HXZAmLCOLcNok1Imxs0pGDnUuRm33Alw29ZFikfQpySyAx+LJX?=
 =?us-ascii?Q?dSUkAchlEt+AvE5jgmCwvu9KQIOFIRll3ACQdDZr98FgGvh6VO/Q4tsqHlKs?=
 =?us-ascii?Q?F0+gha9MorN2mukoLWVJYIr8Wi0yMo1reAYD4Qw67mLoi3X15mxHZsdQDMb9?=
 =?us-ascii?Q?5Gqjw+8Y04EAr2/iuhMFKtcQOzb93zW7FkaDIHlgLCcvqIeuvSXkgFl0QDyd?=
 =?us-ascii?Q?b4KjtJnPGSMOzk8Ff3Yd1BIRPS4TGGew3+mAo0yHrEBH8/U3RwYPRvhhxPiM?=
 =?us-ascii?Q?gc3Lm5IeR3TWf6Dq1e/aO80Tmeen2LXOYjn0DF+GmBgQDuic+XPNaFz217Wh?=
 =?us-ascii?Q?Od5geqxqUfhJ8DXrJOqQFo6meVGhfHe38kFetZo4sBdmhS6dyj7SR4Rakmdk?=
 =?us-ascii?Q?rMQ=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b528dc0-b1ea-4fc8-72e5-08daa86f227c
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 14:20:50.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB3181
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

