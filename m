Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3F95F79A2
	for <lists+linux-usb@lfdr.de>; Fri,  7 Oct 2022 16:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJGOVE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Oct 2022 10:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiJGOVB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Oct 2022 10:21:01 -0400
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2171.outbound.protection.outlook.com [40.92.62.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99771120EE1
        for <linux-usb@vger.kernel.org>; Fri,  7 Oct 2022 07:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRxnVVe5lLtW5xZ6fTzjlEQQeZZqaiEsX7fpGy7EN1o18zJ68JgKGto9etIStdEJck4bDGatnQKfT4MD+T9vYI28q04NYtGaakeB5Bmd00ZhjTAJGq3deXMMEFsCD6tJTZGgrls6GlnJAWKs2i5xF++0EX/0iNsOmIXqZLTIxpLx2X8/gU2Z/Vfa5eBgymbi5QD1hHdBJnFbJxwALE+m6zjXQ5IBbIhb0oC02+XZKORhFBxNaepFZcqrwcRlNG7XqmySOW3yu+q4/8ADnRHSdhMBjX0hZXdq8pZnuNLBFtAFv1yBYVKfVLssRSxFM0xMjvOZPK/TjMv0oBSjkxTcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omn5NIDMedQ0BB3et8V13wjnLYUbDdDCUMCMQjAYpKk=;
 b=HYBY86m9rR8rI6LBJXnEke44dUuEsOh3+gr0y/nf5ol5XYaeR7plJbS2NYh30OnGSV3elcWN/r9UjuiZB0UX+XwfSlYRO9m+8EvCT1iYHuuHfVNFguMG9EiTsqgxb79FXALN3EaKQIMCN0jItRudOaVNCcaXLD73jw0LL/KdjmvT751mzHHxSVhJm5f8WUbEJ12yXp1Cl6FN3nmpq16o7ef5QkiJBRc8By1k+3kw8cZ3LU3vPvVK3BAg6Jf2PPzMXbIrxgtT8X9sdbemrZnKap4Gf/NCy6aEoXYWql6kccb9p8u5K2vrSfeqIe4R3wjF22yYo8mIv1MbkApXGM1Bmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omn5NIDMedQ0BB3et8V13wjnLYUbDdDCUMCMQjAYpKk=;
 b=lM6wBDk9YpHDu7pbaRZDEODzLG0D/yTZb8HYVtRNtwr9yo9kIb3zV4gWEENrYAZHDRV4/DVxsHdILpdSiXNc60bUu1CBhPRKa3+BKMiYjOco85DsN2zKGA13TxWY2ycDyxLAHccfsAmmCEvHXAjEBai36H8IJVAY/dmk7INLk9Hl3cPLqzvibd4AvVkD0ijXRqQPiscCItQGv9/352zezBfBkBvjnX81o6iVk2ZpF8gJMQV2zyxotFL8apDb6l7rp3uEKQFrkCxi3sxk8SgI+jma2rNy1i3bkxzFXO4tVHT1YshxiOpCQIzTMkPVpS2jDuykdMKt5GbvLmDajmEJiw==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by MEYP282MB3181.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 14:20:51 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 14:20:51 +0000
From:   Chun-Chao Yen <nothingstopsme@hotmail.com>
To:     davem@davemloft.net
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/3] net: usb: ax88179_178a: Enable AX_RX_CTL_IPE only when NET_IP_ALIGN != 0
Date:   Fri,  7 Oct 2022 22:20:37 +0800
Message-ID: <ME3P282MB28277442045ADF8086275001D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
References: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [qUjbcflUsJhz7YKwDXNhAFFNU0XTnnHs]
X-ClientProxiedBy: PUZP153CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:301:c2::18) To ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:13c::13)
X-Microsoft-Original-Message-ID: <20221007142038.2814378-2-nothingstopsme@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2827:EE_|MEYP282MB3181:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f92ec6a-d132-4fef-d1e4-08daa86f236a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WkMZwqPe2OBkxKbhxxaZ+PQQXdsErsdh6FwR4ecczC9I4In3dMCY4j4DhGk2rykdmypts4xSxaMvjGFO/Q5v2eSPDtFo55f0OvmOYpWEDGZ1Q+uLLEqPbsVSvE5ShtozZO2IV7AI6mrLEcz3Xv7/HG3z7hWtABdWSA2iCvE0rbp2dzv4oZU0+ZcSpW/VKu8RgBKwae7SjepVDzFOax3CNzSaZ3aT0895sLL6/dkrdDkYvVRwtxAzZAj5+mrZLX+e0z6iKMJHhoFL+1MefGBVnz+Dr3l/a/M2cy230sT7s1MmAHVe7qmZMW5yy9s0PNgIRBFP6TmfatMX4icxBktfjl7NkOGM0ICEZv314+Qp5n6J9l/JRh0O2c0GMml2UY3r85EBpAwiozCD4L1Dho5ts9q3g4hc2kiuKYGvOOifcsSGibACk0UY49c5oE8Sby8xk8xjbDwVd/kKpZcRQb845k90uAZ/APdUCKU4KdGLjIJxmb4aXuCKkWJSH8aJkC5F5CRmA/fX5kJB3FW9PW+IqRuFPvbIdGgD3Uz03PLxnax2Vpz9xys7LK+p0JOsXMzIP7kEg4t9i+IMH+J7mwBQ2mHIHnyMe7/zT/An9La3uNzquS6rm9yn0MFS9e+tiqHj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+wXDmZFiGxvTobrDEzofHbKHwCmcpohEiPE5o9NaG0vUKRLPa4DUEwC/223u?=
 =?us-ascii?Q?zIsheEalOotHsxTViIOwk5QSHhulO1eTQT3Mp562rWBAjQ9XaLaOcf1mKVFP?=
 =?us-ascii?Q?47XwGFQfnQ5qQnIig2ea9bxp1F965SBmIi5J9+l4a7kwyQgxO1N+Zq+RTDzg?=
 =?us-ascii?Q?vblai3uIZyRAssAO/7JMm8vxO60HSMaMjPu82K3vdX+tYESjB2IwpL6wLcEK?=
 =?us-ascii?Q?2mbqimyeDPgKeAzRS+bnxtorYl2NodcMnqnXKoHw1RYOxUIDbB6ouBmgIImx?=
 =?us-ascii?Q?V1KuTTyXuo+jICH23JguDvQh2h0N1qqEnkPkQ3+Ep5MoPpgmLajozcFdH1q+?=
 =?us-ascii?Q?iRzlIZ7OrID4pDZuAV2NCNdZ7BIss4pElNYZxlE/cUqBz5U0e8Y+WM8rZLZS?=
 =?us-ascii?Q?gh7+srCrF0SO01JrfDeAniPeSinawwcFz3dpQYUbLSwMsGt16hTY2Mi3sYe6?=
 =?us-ascii?Q?zfKuj4wXUceI8x0l1ZvDCMNBiJhv6XJrQ8nzDFC0aK/aAHemWicITvOoT4BB?=
 =?us-ascii?Q?9iFKJmCpbqKuT7LeWjTOoCD96IEqO25VVg51L2ZxciS9jAxCG5gHmfvincO5?=
 =?us-ascii?Q?51CguBuoWmNAyr7OkIw3qYNbIz+p5dpujyyVYM1TZ4Uk59tnMUc/dkSuHznX?=
 =?us-ascii?Q?MEeNBD07CTnK4OieIxELF7wrtycRg7qkzCRgXV97zCUbYp4dvG3gYzCc6Jda?=
 =?us-ascii?Q?IAypX6tLu9YnJIN0CtXRweZoCDZXrqJGl5YtMXsatWw4VB7cc6ri0B8AAp0h?=
 =?us-ascii?Q?iuhnoZ4ZgRdY7TGxruhwFkMQYn6tOSYTTxmZDgSDGGO17z2m9OHMKmTeaeS/?=
 =?us-ascii?Q?PbkHNSTVvEjFd6/EW0ezV807BXHN5d3QKYTvYWdTTMHNR1QgmTzELO9Dfzc5?=
 =?us-ascii?Q?kwywUfvFWsFyVtVYrHQjge63kHszdvPl7MZUH9edIBAQVZxW6LJponyWiAyP?=
 =?us-ascii?Q?7q6pbr+cqif31qZDdsNHnl/kjU/ItxuPjtAB57B148rjrgH48YuuVuRSrKEd?=
 =?us-ascii?Q?4C+G1wK/1/TWRodt9ATiL9u0b2b7bV16VuuLmw9NAsPIBUK4lL17wUvAXB/4?=
 =?us-ascii?Q?nv6HDS7Dd3hQ0AaxYuJdWl9+eVmiWx1r+iqyvuU3QvUSSODOdpHIjIZO9EHy?=
 =?us-ascii?Q?kQERykH85d/wSKeqcAWJZXnPDMf6hzQR3yzk4dELAZPhBwNoNa3ImuOMLHJz?=
 =?us-ascii?Q?cvoYtAyDiAZaX7EXm/ns5w0CqhqWyjlor3ONx/poE13ajA8evyqd5XkrMk+C?=
 =?us-ascii?Q?Z4EmivZE2pFSL9w05CFOX5DMJ911NnrhkSTCpE1z8zdzB8+dKudBHr44HFGu?=
 =?us-ascii?Q?hAs=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f92ec6a-d132-4fef-d1e4-08daa86f236a
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 14:20:51.7572
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
According to the comments in the hardware vendor's outdated source code
[1], AX_RX_CTL_IPE signals the hardware to do 32-bit(4-byte) IP header
alignment; such alignment is equivalent to the concept of NET_IP_ALIGN = 2
(an extra 2-byte "pesudo header" at the beginning of each etherner frame),
as described in skbuff.h.

In the current implementation, however, AX_RX_CTL_IPE is always enabled
regardless of the value of NET_IP_ALIGN; this can introduce waste in many
aspects, such as
1. hardware internal resource
2. USB bandwidth
3. host memory
4. cpu cycles (for updating frame start pointers and frame size variables)
when alignment is completely unnecessary, i.e. NET_IP_ALIGN = 0.

Solution:
Enable AX_RX_CTL_IPE and process pesudo headers only when NET_IP_ALIGN !=
0.

Verification:
Only tested on a platform where NET_IP_ALIGN = 0, with this device:
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet

References:
[1] https://www.asix.com.tw/en/support/download/file/120 (AX88179 USB3.0 to
10/100/1000M Gigabit Ethernet Controller, version 1.20.0)

Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>
---
 drivers/net/usb/ax88179_178a.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index b50748b3776c..96ede3a131d4 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -858,7 +858,10 @@ static void ax88179_set_multicast(struct net_device *net)
 	struct ax88179_data *data = dev->driver_priv;
 	u8 *m_filter = ((u8 *)dev->data);
 
-	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
+	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB);
+
+	if (NET_IP_ALIGN)
+		data->rxctl |= AX_RX_CTL_IPE;
 
 	if (net->flags & IFF_PROMISC) {
 		data->rxctl |= AX_RX_CTL_PRO;
@@ -1424,7 +1427,7 @@ static int ax88179_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 
 		/* Check CRC or runt packet */
 		if ((*pkt_hdr & (AX_RXHDR_CRC_ERR | AX_RXHDR_DROP_ERR)) ||
-		    pkt_len < 2 + ETH_HLEN) {
+		    pkt_len < (NET_IP_ALIGN ? 2 : 0) + ETH_HLEN) {
 			dev->net->stats.rx_errors++;
 			goto advance_data_ptr;
 		}
@@ -1438,8 +1441,13 @@ static int ax88179_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		}
 		skb_trim(ax_skb, pkt_len);
 
-		/* Skip IP alignment pseudo header */
-		skb_pull(ax_skb, 2);
+		if (NET_IP_ALIGN) {
+			/* Skip the pseudo header, 2 bytes at the start of each
+			 * ethernet frame, resulting from hardware 4-byte
+			 * IP header alignment (triggered by AX_RX_CTL_IPE)
+			 */
+			skb_pull(ax_skb, 2);
+		}
 
 		ax_skb->truesize = SKB_TRUESIZE(pkt_len);
 		ax88179_rx_checksum(ax_skb, pkt_hdr);
@@ -1609,8 +1617,10 @@ static int ax88179_reset(struct usbnet *dev)
 	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, 1, tmp);
 
 	/* Configure RX control register => start operation */
-	*tmp16 = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_IPE | AX_RX_CTL_START |
+	*tmp16 = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_START |
 		 AX_RX_CTL_AP | AX_RX_CTL_AMALL | AX_RX_CTL_AB;
+	if (NET_IP_ALIGN)
+		*tmp16 |= AX_RX_CTL_IPE;
 	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 2, tmp16);
 
 	*tmp = AX_MONITOR_MODE_PMETYPE | AX_MONITOR_MODE_PMEPOL |
-- 
2.32.0

