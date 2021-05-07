Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F627376106
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 09:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbhEGHPY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 03:15:24 -0400
Received: from mail-eopbgr80084.outbound.protection.outlook.com ([40.107.8.84]:11906
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232796AbhEGHPV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 03:15:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/HT4I4wimY7JzMx6yYA7eemTNpu9qgi4Bv4YPy7pIPuJFHuvNYi8G5G5VuT+eGhLP4NOznI4i+LicpQ8h73bjcBt2txEJr3B9JIZ4RY/LFBZpsLfnfUfQvwb+/5z6P4mLJL8YrOmzlPmBhclCOc/8uiatLr67gQco4JVrFKCAcf0JxwNOYfk59PwnADdYGs6EHUbZHgBc0YFHfJMfjNQzl7RfCQNraLrMDU35HXz7dVw7VZ1+fJIeujDMJHIcRTNRsOW1XFXTV2IX8XNaXGhmTrQgIlxDqViHI9E3SkStqrf6IcRIK1j0uY9Hle7FrqAOT2Z5wvDarACY3lbJ6MXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/c8katVCQUBmobIe7DOEVyFd/toMt/OyoSg0A8OYeo=;
 b=VhXNrXd3mKX51t9sBeQ4qFnVm8PK0aOLdj0Ed+kN4VPcT1Gb0bEVcxn6Z4EdEM1FLLPtYrdGNSLeAabOQb9JOUl7DjoP487CyziEEwTM1ZdxFkBMuv2r7a+QGjkFySG0yB3FjzLqZER+wPnkupWG1QREOP6322G2FAcurlLZ3BLkjiLRss9vctTPJ6cVmzHlZPyrAfvsfvYK/L+re9C3FB6lldAwnIet07KnkjdrNOIvTAmgaNRPjkj81iUFXbscLFpWxYJ6v5dNCdJhUAqzK3ORp/pKRNLuKB3NDdL28IAI2WnPJLHVFIUbqPNhjmzK5Hm0n5IpHo4rsywRxkTxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/c8katVCQUBmobIe7DOEVyFd/toMt/OyoSg0A8OYeo=;
 b=LtqSQDuxQk1bsrabZ/D7Cj0i8THyKlW2TvKmF4jvO6Nb+YJCcHC0/Bn74ftVoC+T3y+dOWDCpMzlBmQ2SjXQU8d83VLBPrHeAWf7rkWIs3IRLfV4qVpa3u46BMW8YkacUom7stH4nsxoX9JSAEiZFrvkLzjOWxJ0nljM/NDvRnY=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2639.eurprd04.prod.outlook.com (2603:10a6:800:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 07:14:19 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 07:14:19 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v3 3/3] usb: core: hcd: use map_urb_for_dma for single step set feature urb
Date:   Fri,  7 May 2021 14:58:02 +0800
Message-Id: <1620370682-10199-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
References: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:3:2::30) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:3:2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.11 via Frontend Transport; Fri, 7 May 2021 07:14:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6e7fed3-0446-4a38-bc10-08d91127bb11
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB263928FA90A512762C0CE4BC89579@VI1PR0401MB2639.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFgyKVsR04J3EWouYbh8Ampl1Jn2Vkylum2wOvByoxvabJRmWBygNU3IUYKDA8mPumh4Ojumlzb2cQbOgtQjI5izF8YcJGn0YKaMrLbwxQTNB9DSV0Q83Y00W8BNJZO9BFy1CoyfoyiUGODx3JrS1DYIdL5ziZACw9XJ4nZaJQa6rPJgTN3iJzhsD7tzRyVUExthM0JZGtE7rNCAQHhyvlFB21iLfuX3TxDaup+RTCNUaIFzqfxlQLQyU1A1xhwoHi/uRYG16ULxtVm0rwM7Q2PtBbZvHDurHAUjUAD0aNPOHFcO9E6LAwLynl28d7tXj8qobVHJTTcY2QBWkElzYG/vdcIa96xl4a14Nj9GsR6nW4J6emERzfRtDk6zE9hVLSfdo8bB2WopDoiPtk+r3/9POOFKIVtpfS/2W8cZIkPlv7FBnHlnH5m1tHhftIh4Y08RXXGxxNpLz8NDKGNCTndmMwj2LRkzGArUzceSI+S/OOZuYlLzK/YDJ3L9CuYXquESn2Uqha86AtCto/TXW4mh6aBGq0Qk6+eHdUA8B1Xt6HqwbH08meV8WKB0pEtYsjRRSmVtu1gL9HGodGtc+ufvLZB2bI4hxSqcyvngRMQtDPvqcpSrTDmKBpxzJvmzucKKxpXJdc4OLpN3Dh0IUfkrOwdQC0b4Vj6ZrsHiik2Xlzo4m2FlMQG3ClLlAhsS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(956004)(2616005)(6512007)(66556008)(26005)(4326008)(66946007)(66476007)(478600001)(36756003)(38350700002)(316002)(86362001)(2906002)(38100700002)(83380400001)(6506007)(186003)(8936002)(5660300002)(8676002)(6666004)(6486002)(52116002)(16526019)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rJTPR1OeS/pyl/ciW3ogZfqQLEgqdt9aBVCw9hWOGKdL1c1ORlteBQ5EAoDr?=
 =?us-ascii?Q?j+GJTgX8hPnox+0NQSfShYZ6T4v15sFiw8fWllvO1QjESp1UAhwi9aAZ4TzK?=
 =?us-ascii?Q?9KETwlv6j61hUJbGptbGGc4IChfvh2EN6/CTlAaxLlW2yakcM7g+85Q1ypga?=
 =?us-ascii?Q?LbWU3dy2QDWHCFHe3h/4h2DHHoBKVN2h7RX1aOLwXHw4ODnTwRa4U9TYrqjS?=
 =?us-ascii?Q?yghhGY5ip8mBAGUbDXGOotRkOt49zJEQEDUyMFM6b7WHmc83RGEEh9/74cn2?=
 =?us-ascii?Q?j8TK+cGWASaVXl2w0CBpzN2Ks7UohqnLxRWEKuojX8Ied1aDSfC6tpWJEUtx?=
 =?us-ascii?Q?NTSYUTLLNUpCxp0U4fzzjv0sOEJe3ma4jMwLMufl/ITGreYsu8HfCj3uaco6?=
 =?us-ascii?Q?ivUD9stjxoqkgFiJLaDw2lFre3nl9pLCtkq4PwUCx0c+4NO9ZO8B32x+CM+4?=
 =?us-ascii?Q?lk3fMRU+fxrrubbIdHxYr4broevs7lo7AbcXQ4nhpFVe7ZZzprWOumQ5h7CN?=
 =?us-ascii?Q?zJHZjB5m437LArgFasw6uQEmMe4XTFfpEH2/qFh6N6cj3D1yJY/RsRn71EAh?=
 =?us-ascii?Q?8GdPFOV66L1W7e/c5x39EMSRu4WTJ6p6Lztv6bQ+ulaDnWiw51xB0rXnU7gs?=
 =?us-ascii?Q?TE+zm+DlFORpr4NeM8gZnJ719eD3XRTRjvc15euBzmd+GFsRDAo9420YgfGE?=
 =?us-ascii?Q?BWiNT0Qm8QZpRtZWttwGwwHV0B1AfT0n55gnYCce/5gk50A8Wh2hoDM7Wf4V?=
 =?us-ascii?Q?nKXmBloJtnaJIHpKgVCnz2NoCKlaxmSCinsZHkAeADJrsjvKYRzt6Hd73bVp?=
 =?us-ascii?Q?2NC7EoG0qxXRoes8tGaUG2lsC4scLmyN60W/IxUWYWJnFENHSHgt8lDcFJGj?=
 =?us-ascii?Q?qf3GYKxGTHzb2n0Pu+Mt1VrRpOrbrRqgvdrAFB2cRPis5FNs/bVsFpoDxvQA?=
 =?us-ascii?Q?ya+gVePE+uDBBdx3o7OlixmwEjklI9oIb2GjD7bZgMUvNo1nZvOgVtiElVF+?=
 =?us-ascii?Q?qvp7QAzWFmATD4B/E7Oz0aMeRaAcWHGRxAR58TN487MqFodrr4/2r3gLCqTm?=
 =?us-ascii?Q?QtAK/8lv7QJSiOE2Oh873prxZRcqJp15NTNIFPpc7Kp58exbnE5z03gqaPXD?=
 =?us-ascii?Q?40x0/T+J3LyjLXDGbqE+X8FQW22Mc0LFGOQ/7kbNMlnFEpytHq5bA5xyE5UY?=
 =?us-ascii?Q?79NLtfvNRiA3/xLIwOIVQqAOGeoEk6NQLdKoxT9a5pND519qhSWqzHJHsvp3?=
 =?us-ascii?Q?wykQCngSc0ZpdkOSOKNIHm86aBgUkammVTddnh5HYjE7bu1cmclkA8lAVq2f?=
 =?us-ascii?Q?6RQwPIy4b9QI2utGrOM6xAlc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e7fed3-0446-4a38-bc10-08d91127bb11
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 07:14:19.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5TQoTt65poGiWaNb3SI4XPVg9itzjC6F9JazP52uu84r0lfeED9sNip3LiAYPLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2639
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use map_urb_for_dma() to improve the dma map code for single step
set feature request urb in test mode.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v3:
- Correct the error handling if map_urb_for_dma() fails.

change for v2:
- Add this new patch to use map_urb_for_dma API to
  replace both of dma_map_single() calls, suggested by
  Jack Pham.

 drivers/usb/core/hcd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index d7eb9f179ca6..fa72697f4829 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2159,16 +2159,11 @@ static struct urb *request_single_step_set_feature_urb(
 	usb_get_urb(urb);
 	atomic_inc(&urb->use_count);
 	atomic_inc(&urb->dev->urbnum);
-	urb->setup_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->setup_packet,
-			sizeof(struct usb_ctrlrequest),
-			DMA_TO_DEVICE);
-	urb->transfer_dma = dma_map_single(
-			hcd->self.sysdev,
-			urb->transfer_buffer,
-			urb->transfer_buffer_length,
-			DMA_FROM_DEVICE);
+	if (map_urb_for_dma(hcd, urb, GFP_KERNEL)) {
+		usb_put_urb(urb);
+		return NULL;
+	}
+
 	urb->context = done;
 	return urb;
 }
-- 
2.25.1

