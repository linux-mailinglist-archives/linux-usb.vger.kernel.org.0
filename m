Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43BB5FFEF8
	for <lists+linux-usb@lfdr.de>; Sun, 16 Oct 2022 13:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiJPLgx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 07:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiJPLgv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 07:36:51 -0400
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2157.outbound.protection.outlook.com [40.92.63.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F74E39B99
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 04:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvwj3mxtZf9K+u2jfuCtw76MHvsf8lZxFKx+dHW5EZ/nJjRaH5Tt4laevKFwEdtz+Pv4dDRg2wZSzZh8S/p5QewubKEOzTiYy3cu+UfVOW1pYU41AKlwFKtsa6e/5P6iqjaNDg41IibcWl1icBWF6uw9USPCxe/lH3hqGCPl10c9Da0LTg5TUogzTQIyxvRKgiOpTSlgZwTqbxbpI55Iz2TlkVff//76Q3VOU28Qk+RHv43roXRqZIjvtj+EKQg/NSZ/gKT6x+tXA5R/IX3cJjEQIopF8M9hIpNXhC2cqueE34Ury/3IGK9PW5oQRpwBQtinUUDgR2wonbldxWPwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIdBAdu5ytZ67B9JZB/nneJXLg81xKaa0qhv+CktaRQ=;
 b=AuZThStgOm7LkZ55NH/yfZuwWxBRKIWbUqfMHlaVkGIQddF55vGAvAKmrzYzRv16GUk71G00qVSYcsIPgbW6nPGRb6KwwIVodf+sgyeP1qYoett+j5yYNmhm2P5AIAOPLBw7Co1ulSz9XOrvzU7JR4omgwQqPGG6G3EVcLZD94UEPl0setYY5CAeG3RfufOtJVtwrvqEx5LiMrVhgG96oAvQStzOjCjwo1yqdN08guXgqPykuQNsHefMeMGD3SAqYO2SrFa+289Jnt1YCYKwPeJIMiY1bS4t/6nRJaZOJnxlgwp5A4OeNOe7JxLBHvHMNpltGEIuP+1+yiEW57RlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIdBAdu5ytZ67B9JZB/nneJXLg81xKaa0qhv+CktaRQ=;
 b=BEU8hO/RqpKFAHBB0yrz62irpKRHw9zlAMNrzRpn7w8zAo2ONUEyNhT5oAWCRK86yca4T7LQ8/WJzSn4yuhnlFUNhEC35laH45SRgjjGPWeghbjC6csW58n3hZThrliDvXf4ykZhpi0CybYOHgGKmdFsFc+nyfF2zuuUS2+ryYxxl9/gXHQdhSAYoPbAXdASCNsPutpyevteigaVU2Q5Zgbch+2QswXH3bxbel9WolN/X2BzahDVju6cKDm6RuLo3AzvqAJdJKXe1b3ahxR7NB1ECXohlvMnLVB4q570BZYoQdAqT7cMQqAgSIIcP3Lo5JlVhQY3OskooW8VWCLU9Q==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by SY4P282MB2790.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Sun, 16 Oct
 2022 11:36:41 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::d403:bdaa:515:ae06%8]) with mapi id 15.20.5723.032; Sun, 16 Oct 2022
 11:36:41 +0000
From:   Chun-Chao Yen <nothingstopsme@hotmail.com>
To:     pabeni@redhat.com
Cc:     davem@davemloft.net, linux-usb@vger.kernel.org
Subject: [PATCH 3/3 (RESENT)] net: usb: ax88179_178a: Allow live update of devices' mac address
Date:   Sun, 16 Oct 2022 19:36:27 +0800
Message-ID: <ME3P282MB2827C318D21C36513DD66622D1269@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221016113628.4176189-1-nothingstopsme@hotmail.com>
References: <20221016113628.4176189-1-nothingstopsme@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [GgnMbM79s8NNfomjuvcLKeHDzUEZG8dx]
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:13c::13)
X-Microsoft-Original-Message-ID: <20221016113628.4176189-3-nothingstopsme@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2827:EE_|SY4P282MB2790:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b29fa6-5be2-402d-dfa5-08daaf6ab20f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HXlxSmdrGUrlzT7mFPrBWM9PL1CLlymjz9XntQJsgDqV5wE676PjtXVoTcIpD8PJ6cocMtJ5jken5pXjhwwbqqm2rBizJBlFCi0e6g6FtQCSs6ylqlF2C1frPrX1df762mt9MwsiOyFqg8+KYUVk8RuLh9zjoiQrPKi8kPw0D9K1sUdgvG6CsSRGrOFgpItAKvyVJ3qKP6WefvCCBu6sLXqAQDY8L/D1ClSc3/Mt8h3HVTle4zz2hzIDnXk1Den7xhJ1SjvKTV80Dq/NmXhJE8WUBs3E1840J1935z9XwS2Qppf2d/uDSLGgorIOG7wQ+M6AAW98xMzJByTnweCbLOK956tK8P+V4qwddd4qSXuQcLH3EeRNx94iHCAtAPrd1rnyNXhiTpTPPkNGRw6gffX3M912dr/nOpz/NPMlnAPMlDjve9eMLemlzINqC32qFg4kuP0s7H00MQ/g2ko74NUIy4Xh2lGwuitW4Hv15ebOdep5WfOyKHe4+qfTmpdMaEdyusYoLrSPDG3HrtFk0Ep7Uxy1shpw7CfPtFw+xQFsv7KSrNbk/sv4JcxF6Pu5fe6IJ0YLVyUop949W9eVDRn1IvAwo2htRh84PLnUaItCZPqfIimeFP5070Sjha7X
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gPckE/sMjvrMQoWIAsnyPepJ2C+MEQr0vqwcrRJZuX1Cdjg2KDEzE0YfZE4T?=
 =?us-ascii?Q?3+p4drMJlA2dpTObJIezC/bfQQ6BqidHRUOAe4CpFiKcpW5We7mGKLdTSRM/?=
 =?us-ascii?Q?v3IR57VLlQI8AwcDFn1oZwCdC3qcMEEiXvg5AkoMOtM96PTQB/KmXCBloCHd?=
 =?us-ascii?Q?+TZqR/kn9tSNHhyJ0iZgFg+5i7kWNtNL1vKa/GroD9a1iRtVPCleczRW6uhU?=
 =?us-ascii?Q?/KNyUtER7LCASvfxQ5o6yN0qYMJgxStEzqYKS7ooxh5/eL7HY64mGnW5FsCC?=
 =?us-ascii?Q?Dr7Bgabt4rOUBbD2knVy1ZgAE44l5MrNheB0VlZppVC5P4TX8ObLhVcNMXv3?=
 =?us-ascii?Q?g2qoWfCw6IZhJwg9moeQ7nq5THMoD4xhpj8rywRS1XOFk1djyIASe5zVPdAC?=
 =?us-ascii?Q?/M5PXKxLC+1CcdzlVCoSdID2G5lUM2lhW2OmB4uSB7DshOHIwz+ymWaERBDe?=
 =?us-ascii?Q?ZJEXZySYFm0Ar7k3BaJs1p2e2fjFBeWG44A3sYeCNmIYntvMZeuctBwJ49Ju?=
 =?us-ascii?Q?VJoWQx+qFBIamU/njN1cnhCHp7C7TTQuuvImDziUg52b5cTXFWduoLpBlRrr?=
 =?us-ascii?Q?pFTy/TWfUz00PbXz5lNZQlgAdvxPuDsya8sYOprXc3ty6Vr2XJ7SY7SGTfTW?=
 =?us-ascii?Q?sH54VicUYOXBkSXwxHZXtOIE1L31HpiJH7NGJBUMAFUh80qFiB3cCWg89mmX?=
 =?us-ascii?Q?QUG5VEDlOWhBV0TTCaBobasLMrxzaxH/r2zsLnqqciq8KRAXrTpTggVGZzpD?=
 =?us-ascii?Q?uqxeBp5xs9vSZAyktnWuH284FXMTX2a9MBUzd1uNr+GM2og0qmXEv7ZB+iAG?=
 =?us-ascii?Q?cPZf1Fhj5W13XEGe0dU9jriGs019shfK9w0t6GNxRzL4ZK92JTGoKzBCydzL?=
 =?us-ascii?Q?T9Voa8cXURhiA0dtUw9P/aBkeivQrTd1h5geyT79RodS3bE+wcicWXzv3nlR?=
 =?us-ascii?Q?9jf/jE6VGSlG4INGrcOEpTnd7/xTKMqvN7Dm8QdEKCMgvQzJnKbjH9GJvfKv?=
 =?us-ascii?Q?1nrcKmlENtqRYRx9beXTcAJEd9u4eZyXfhyrplb7KQ2ofsRbvEl+vF9EdvXk?=
 =?us-ascii?Q?d+GN5a4Zw0SZInUZmZQOFS7dz6hbsD1uBdE065jajnpj/QwQcE0DZEZvAl2r?=
 =?us-ascii?Q?1DJRrt0Pk8sQpUQYQCoa3aX6LXGDytw9prL+bKinGotLplQ00xhAMm1h5XOU?=
 =?us-ascii?Q?uSOz1ab615WgnvM7KHKc321Vz1OAe1bf/p3cxR5tBlDP5w18Vs8NwGQYWaI7?=
 =?us-ascii?Q?5qLj8/UFZD5NkVwX26OaecFF2rRVv8dRnF33YRnTEA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b29fa6-5be2-402d-dfa5-08daaf6ab20f
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2022 11:36:41.8406
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
Live update of devices' mac address is currently blocked by this driver, as
it requires the evaluation of netif_running() given the corresponding
device being false. While appearing a harmless check, it can be disruptive
in some networking configurations, such as "Link Aggregation" operated in
active-backup mode with fail_over_mac=follow, where the mac address of a
device will be updated dynamically even when it is already up and running.

Solution:
Remove the check of netif_running() in ax88179_set_mac_addr(), so that the
update procedure can proceed irrespective of the boolean status returned by
netif_running().

Verification:
Only tested with this device:
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet

Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>
---
 drivers/net/usb/ax88179_178a.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 96ede3a131d4..84016e0567d4 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -958,8 +958,6 @@ static int ax88179_set_mac_addr(struct net_device *net, void *p)
 	struct sockaddr *addr = p;
 	int ret;
 
-	if (netif_running(net))
-		return -EBUSY;
 	if (!is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
 
-- 
2.32.0

