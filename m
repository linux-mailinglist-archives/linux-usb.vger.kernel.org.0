Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE245FFEF9
	for <lists+linux-usb@lfdr.de>; Sun, 16 Oct 2022 13:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiJPLgv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 07:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJPLgu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 07:36:50 -0400
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2157.outbound.protection.outlook.com [40.92.63.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE36939BA1
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 04:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxza6E6fVICpJ/JyINI6BLCxrbw5gDC2m7LCBjshKgLWiZ6H5uOXO4M/UGQy8urvm2Rc9rZq0E1GWB781XDVYIKZZkg+CYhwL6T6o0EMIBnHG4wwMq9OMEh0K8uF+7N4plDUd7LQHdn154BMt/jZWrenrGP1plnfvMCPIUARotJ9NoCfKyoxf3RDbHUmAeX+MXfmZzgH56FKQO0nEUmtEaK0s8tMG49GG/XTmIg+giL1jxW0rC2qKBLrNWzv0pd1cCPvGijrQA/ta0O/R27FksGdN2EivvWEkj7sVI/VPDjBjYiWEHLtgGJrsWY6CZ4MVME9/Kio3boEVkwIaYXWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omn5NIDMedQ0BB3et8V13wjnLYUbDdDCUMCMQjAYpKk=;
 b=FSOPLUckVCEVidKJuMCAKNyftT8WQ7GTLODUHKH/yxqBKy+LKv0HVPqin/YvYtekp4SdsX8cYjWrw5c6XGIU9AYgKH/HMbPC01E/rI4W0n9ktBF8ZHYdlcGegswJ4Ye4/r3EqL0hLoMAlSYeNK2rMmotpd/064tHUpN0BgOQqYmsAzqxDKW6dOqW+jEjvNLrbGiR6J6hU1MJPXLzhbL5DuMFxGifyqoBCLdTG0kMT0jcMec894CHwjWarWmh5xkNiZtb3nvTlY7jiPWBJvry/miWjKIlJ8Ar/dhVJ5cTKPP/gMo/T7EcaVl3MywNkEwmJd1IKuZQV+IgU5QFp2aMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omn5NIDMedQ0BB3et8V13wjnLYUbDdDCUMCMQjAYpKk=;
 b=AHbfMjTNM5Ov6E3XSD5n/2DFiKA2nxZ+1u26Bay2RZ7dslD9X/2xLsDLAq/1ld6jrm02dSS6lBwhdMGC5DCNra6WxyhNiIbAkhy/W0uBlcXAQhcx/W2WOCIXuvAQjmrU5dubni8womK9rLW5n8uRbku+mKZv3NllfQpcYPV3xNHgwwbFm4Xu4wpHpl1sOR63cV5vFU0cq5jcDDku7OHfPjzfJVOake6V/lSR4jhAb7JP14igtkqRCJnuUaGtrp6fKZXMeKDbFZe7+9ET8VXlC/49CFM2NG1D4uZrKX3G+jfEgcvc5qSGoGru8+3phF7psML9jdMShK5eBvH+1+j8zA==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by SY4P282MB2790.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sun, 16 Oct
 2022 11:36:40 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5723.032; Sun, 16 Oct 2022
 11:36:40 +0000
From:   Chun-Chao Yen <nothingstopsme@hotmail.com>
To:     pabeni@redhat.com
Cc:     davem@davemloft.net, linux-usb@vger.kernel.org
Subject: [PATCH 2/3 (RESENT)] net: usb: ax88179_178a: Enable AX_RX_CTL_IPE only when NET_IP_ALIGN != 0
Date:   Sun, 16 Oct 2022 19:36:26 +0800
Message-ID: <ME3P282MB28271406007AB7DF67A406F9D1269@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221016113628.4176189-1-nothingstopsme@hotmail.com>
References: <20221016113628.4176189-1-nothingstopsme@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [okkWM+/gY+KAe8EqFBR5usze8SbaXojo]
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:13c::13)
X-Microsoft-Original-Message-ID: <20221016113628.4176189-2-nothingstopsme@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2827:EE_|SY4P282MB2790:EE_
X-MS-Office365-Filtering-Correlation-Id: 12602520-2533-42d8-f104-08daaf6ab144
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8X8TT00YMo4QnuWfSOpm3+yQjItVjMlEgxvDq+1WSXQPnCTHsq3n/yOW4jIdPWmkYTiHV+60O3R9GuPnuiFOWrHkPRG3So7v+b/ygVCB0GMrLc+628V4AKSqnsZfoa9La2J0qqdFWNbCYMXDKkZRjZDEg0raY3cS5FWH7Sb1a1RAl0mHwPorNy//viX7fu2TexNf9El0u/qByfHj46enbVWEf9RnPZl9vEGCYma6UA57bp+akoDx4TCThq1dw/IM7PkZf5et6vHZ0kU19bxyNlSTKfnkFFCDs+Vljp6oGSTBcN+bMhZMdtpe8f0xCy10f0iVKigiz7sAML/JFN1xRIt4M6/ixhTUb06r98Sg+svylaYQ4O+fmoa6H1xc5/BmOjbjMyO0PUYSafWzwB4xOxpnZKvw8S8XDqX29n8JpTymIvXrUI3lbA2LTgqSYDgV/oVYpLrBmf4UXYEHGWPtZrrjx3IX80jUIZrSDrP9bqMIc5UPeqdwUIk7Qy86kakmKWNDL5a3vodaL013FiKNUfdYzB5zZV7zCw8EKOhb6YUcuvRNewJYHJcgGCk/ADVeB/43zozJqGcRbET1pDjCN4HUlUdZRxcIRzZEV/PdEbIntgjaawGlkHa3jeS+utl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NbsbHfQNGgYUhO5RvFMMT7vKHDS15/tMsRHltjYKklk1UdYmzi8UATl1aGM9?=
 =?us-ascii?Q?LxGWF+Kio62ilMNw6LsPskkS+sVvnc6uN7Cam2tYpUjrmMpjRnLrX3dyNoLy?=
 =?us-ascii?Q?UDpX8Bp1FjBcpSmoJcg6WedWF6/KNbi1q390vLGAqLe3L9j5VxjHa4iC11dc?=
 =?us-ascii?Q?60+rZX11unSNP/osHu8Im7AOIcQ5WQCk/HFypVjKXnPuLQC3w9aQMGnlslW5?=
 =?us-ascii?Q?Lbi8HynKUa5PJcNl4Zp3uIaFjaBuOJys9mePEGQnPCop2CvSCT9ZGhASnwR+?=
 =?us-ascii?Q?F0/G6U6DAdPa+jG0uRrGxq19dGg9iw0ZezTHW3KBFb1lHpKkvFcMCxtYvCLr?=
 =?us-ascii?Q?xofe9F3QFaeKM+8phXbU+DGLzhkk55u4ic0ia9jfIluVoTiMHmMnfHDDc/vm?=
 =?us-ascii?Q?U5H1M70mvVu3/FXYoeKWXsXUiXTtkYiJaWo/ab63hOQPran+cXekK/2N0Fel?=
 =?us-ascii?Q?U+za2PCJP7QmPuyv6dghgcWaYxWPM3B+65QiSl33jYd+A5GG4Qi5hqzGoXCJ?=
 =?us-ascii?Q?tDaNdFBl4nSDUSolmvIvE/C/sGfxnu6ZAKYvWWjA39E0lzx4jDiiJKBb/hYk?=
 =?us-ascii?Q?i7bUWv8Dt2I9Gg6eTjXf4bxEeUP7/R3JRr8Bk+6dbiQeSPMVMPSuYBDHNI08?=
 =?us-ascii?Q?pN5pxnp/GQfVUWWh1O4F6F34+Z6hVyvYsCOUxtxyXv3bhVbZek8DwWz+umrR?=
 =?us-ascii?Q?lqOOi0thMUaUag0kSPg0wfoCWJF5WMTO3v+UXmlhgZifNAua2hcMcHSRKnqi?=
 =?us-ascii?Q?H+EfCr1uawEaDEfAVa/PZRCDdmxfkzHXUiD51mqGvTXocavF84s0js+Q5pap?=
 =?us-ascii?Q?zE5a/ci96Z+rWemZKO4trky7k1ACDtIqYexTKYLlbwn59eNNHPEMDmKQ6vG+?=
 =?us-ascii?Q?9DZk4JImjr7PvbOXyYjGagxSfyGOQl8/nrrGW2acJp9uX68AJlRNyYK6a67I?=
 =?us-ascii?Q?VflolJSD2gezjeB56775Z/piBT5mfoUh8yGLuikhdqzEyQk5+SIsbgaKULN9?=
 =?us-ascii?Q?lUOktJPW9oG3joxfFN5YVKU4voDxrx8v4nTAf1jahc7fxaGRmW3Fwd+qi1Jf?=
 =?us-ascii?Q?VGwtVnxscWSTG4lNveh+GnbuUb/wilhVnuNl1NKqhzW4dRPtfw6wdZpUbL7D?=
 =?us-ascii?Q?NneAc98F2WcbZci6BSID353Lh2p4HqGRad0yqCofwY/LZuRnL+uShLagA5+D?=
 =?us-ascii?Q?2P2Sy4BK/BjMsNICYCHiU6QAOLoA1sD8NixQtCU4YJndCedhGqArtOQNwMD6?=
 =?us-ascii?Q?A+J3Y7UfncJyiLgxx+pQKtS6Z2Kb6XbNlNC8Tw1qew=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 12602520-2533-42d8-f104-08daaf6ab144
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2022 11:36:40.4495
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

