Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BC05F8A13
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiJIIGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiJIIGY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:24 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81462FFEB
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXuxaHMFzUt9NoWe937D7a7xd14YxVVoDQZ0SBEmdFWD66Tdz/lz+lpFZLMAU+EX5gJ95ig/xN21FZA/btEGi7sjeb9nh3mlG/437yKdHM03gnA2KIJylyIGDxIHzXEwJZwYCsjYdsbQHsc8CUI7pr3qkbW1Ee74FyuZpJkNeRgzEEaRboNllghcVymaEPl5OhyNGgWbj/aB2MhGyX0uiCauj0KsCPdk44Fiz2QhLj4Eh+lRDSwNAJxhanXvhcQvrpyrunxubrl5/7yLjwGd4TsU9ZGsjeHGM6G9YpqBg3Y/fQWq1n0YyttuJ7rUg/sUp7KS2JeWw1gG7PALbvpQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvXeKr2ceXCzuvEixjECUy8mpp9kLD9jjrYqFaVY9PE=;
 b=M4/riFjuCBD91CeThYUszy1YPPevXcBfKMIt7I9UMhjWQPHZ1ZLfEs6jPZqAkEqPoiiwOw737vasAPvo9fuwSe1Ift5szVA3IL107joPDKs0sBzS/lWisLSHZCDko0c8rRM8Ygbucoa9Y2v3Cabv4jXzUKj8PMVLeextGtJyGWv0IWZ3AGQ5lCjEu5kRLq1B5xYyopXY41LjWaU+P0I0uSohaN2tBD3y/Blm7rD7wCbomGtpgw/SyhxfdTeUEVfD32FVj3gufwRb0sxIeVkOG/hzffAVKuGkQyaj/IfxnztjhOIS1vFiYyZFhE0ByymgZ59Kbsdgl2bWWgrTuZ9fGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvXeKr2ceXCzuvEixjECUy8mpp9kLD9jjrYqFaVY9PE=;
 b=MpPxoqMs27izXfZZp7ButHON9aYVuS46sY1UYAOw/VXUPFaw587iu3sUZuHVIBVo72EYCM/pBuL2/y86syGk480OoIpKf5w5y66Ak1G1H+4FMWGGldR0v3RsBNEc50EKxH3/TAYjfHAJE+zetx6MQLZkrwYxWDTnXfhCiH1edP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:21 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:21 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 7/8] usb: chipidea: usbmisc: add power lost check for imx7d
Date:   Mon, 10 Oct 2022 00:08:12 +0800
Message-Id: <20221009160813.776829-8-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6b552d-12a0-48e7-2193-08daa9cd26e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrWy9EQ15tuCG23ZQkmYusmoNAsRf8B5QdAS2/tHECt6UWEiiyXY3Nqt/FZtbiTn9za+uEsaWWjne17p+iPVx7Sad4RgFLUzcep00/FcuZpcTF7p+t2dUu6swMbcy++x9qltRvxxNdB1RcPgLIM6EbC4w8qft/85nsCnDOpNMBuW1FfJD19BS+o/xvdI6vyH+IXfmfnuw3Cn7WyLmb9N6xTrZ60cvhLbSmTJKmSVuAlTKxaKymcZ8z/xECzYYmLDIqJZadV1W6nUjNOJW8RsrRu1d4Aj9XpuFnosmK3BhzRhT2pX4pcdy8QOcammBght4pjxy06mToEKVWX6GlQYMxab4iEPoXCeOHFgk8EbZgFzEpa5dflVopy1+doLN5PnUMRiN4eXw5lM9zbkYwK21ZOYhBqkxc7m1c1ZmOBoT8u26m8xP7/RnwcHiJ35dEfzjZmKxA2yXZMqlCc7Bh8fU9i1+uxqFEH6mjydy/HqC788wIWz/No8/nqtuGgWktmXAbgmsL0edV5ZV6zRBdKd4KjK8OwN0rEUd3yNTgHSlR5uL0+/zfR7ff4eNEkSMS0n5p3Gn86IadW4lqb7EggzeMxUdGNzA0LP5E5FPEOMsngG/FElj5oSCBm8+x++VN1a0TxPtsPL7QWGZJuw0nuCDgLgBhGLiTGo2bivc4I12eu1U/oFE8DKtB/KBIFWUhYXddaxKT23glyMlcEBGpRPPuJBn1XKZ5ZtvljwsHMjjKK8EtzftgwFqOz4F/hE2gAjvxAl7m5D/r6L9F+6doDS+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fkYL4q+1BW30B4BBU1v4ik5QKQ8R8LpDk/NHJU5Lzk/1mnwVBgb6DXgcbuYF?=
 =?us-ascii?Q?hpMEdLFpgH2onu2GTlygsE/gNzh9aWed/OhEYiSoddwnoWu/BCvWfOVKMzTL?=
 =?us-ascii?Q?0SJ98qfJ7sUL71vLI6arAg4AzAtyKuWm69o5aPyK4uVLdb5t6TnwY/SB0kGI?=
 =?us-ascii?Q?I/RrVcRrO7EU8GL+EuPTHStpZz/fUrMnIiIlxhHiE53Xj21OOWfd9dxuChVd?=
 =?us-ascii?Q?tvWBalXodHQV91B7vn3SRMoSBxOrugs6nEe/7kpgpHttJbV10bdPvGIXc4Zz?=
 =?us-ascii?Q?o/voOhKCH3vRGiyLOtRlfRbP7/2O/MVFxW9pJIT3u2LsINn0dWa6erMjUur8?=
 =?us-ascii?Q?NneLA+qNJ5WjKxaKzSf3xJflnti6+e5Pmw/5ZC0ykSgBDcSXc6fFLEgArJOh?=
 =?us-ascii?Q?aHwCZAdKloJldVDyzUge+X+B0+IfGs8zpbXGC167UVQwhJzKO/AlnK431RNR?=
 =?us-ascii?Q?R+EvQryigotOoTepPDm+Ivb+5z5oEFHtqTv+/MIk59M4G+xYmXk1srw5ogAy?=
 =?us-ascii?Q?lWkuU7qjHgLEs+jMYOfa5WhwTHBsI3bWTNFcdNekKV9ZG2Do8FIotT8cfBeC?=
 =?us-ascii?Q?4iAMJfDFvd+RvONYTc28nSSnzIMLcuGRxZFLLYJX+5pVU8OOGE6GSnqEjpP8?=
 =?us-ascii?Q?9Yp2Xx6xg6aFuF082JyVzGKZ0g9Ih76y2jPzcI4b6hJWMsNGL0Rkx5LNIlyG?=
 =?us-ascii?Q?qRu+ZB3cXdHumocQISa1V8CRGtI9qy60JdVylWzBW/vT/aGI06RQY9xB0n7f?=
 =?us-ascii?Q?hoFCyh/fuVh3tSJZDXSd3baDxGxbRi/4idLJZlSWXieB3kAdSW390cOy8HLi?=
 =?us-ascii?Q?l+MjUQFTpCXDwHAyVEYWJj9VQy0SND/XmWBhyet+6CAdobN7Ce47/j7ZAU1V?=
 =?us-ascii?Q?q9qCfebOHRq4GydgwKzDAbkzWm6+ubrvbbuffFHF57ScqMpP5wIXikx7Zlub?=
 =?us-ascii?Q?p9WxSkA9iTi2eLSH2a7T5Am/1RtwG9tluHl0sOdvT43TXKKrINKVhQTFXkrb?=
 =?us-ascii?Q?LAvCR+39f9tN4QkUt6ctwKbrPkTWbpIrKn4iqNOMtuIPMAyGKGqtUYZYE4jK?=
 =?us-ascii?Q?N7IkYzsZ0rtCur6TVHYyReKaGRN11xbvHh4GW1SCDRWbaP1eJ25JKB+jYn+s?=
 =?us-ascii?Q?LbwuUwgkDD+b/UGzlGrJmPA0A+VOCzRsj/f/DBdHfAfe1CR247JYTrQQhNvY?=
 =?us-ascii?Q?Yr4ClG+pWZ0b77zUaLHqC4bM8s/x01xmd6TVHFKOcsd/6TIgLiQcyIvXBDbp?=
 =?us-ascii?Q?zgDCIjgGAQBaH0KgYNRZKSQokYovbKcG8ILfdYaXBDy05IdMqdspW9M4pWIj?=
 =?us-ascii?Q?RJ3mbcTgDaFAVcxQefC8f3gawGpsk3nPVdQF/Rb1F04IGECD39wK9AkeyY37?=
 =?us-ascii?Q?3XPTb3HTIosid1QvXCu6PYWm2CJk/3m8LQJYjH5MvKZvYr2w1yud6YXTwgXy?=
 =?us-ascii?Q?7ErNfCw8DV96MtyaT+qRJ7fSgcp0u2YW9JW34WVteZ5wfSjBZhUY8h5mt8b9?=
 =?us-ascii?Q?nlcCGbi0Et0mZsZ/AWTU3YFVsfh6dbzQriku/Ms0kOM3o6Y5sZI+BYBtx95R?=
 =?us-ascii?Q?hro+ktAVTIYjS5ktsd7HA/cMwUeuv0cbdHK+dij5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6b552d-12a0-48e7-2193-08daa9cd26e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:21.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wk6cplrPLmydI7hekfAdyl3LiDk/qmdM2MmhCdv5T4FEBgfYoryFJE8Vr5z2EOqUz0ITSQoMD0zMmIVsuPmjCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

imx7d can shutdown domain power supply if none of peripheral in this
domain is registered as wakeup source, this patch add related codes to
check if power is lost.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 7bfbfc83cfe3..cc17dcd97856 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -939,6 +939,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_imx7d_power_lost_check(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	/*
+	 * Here use a power on reset value to judge
+	 * if the controller experienced a power lost
+	 */
+	if (val == 0x30001000)
+		return 1;
+	else
+		return 0;
+}
+
 static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -998,6 +1017,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.init = usbmisc_imx7d_init,
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
 static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
-- 
2.34.1

