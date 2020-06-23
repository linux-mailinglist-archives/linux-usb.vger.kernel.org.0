Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7502047D4
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 05:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731618AbgFWDKA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 23:10:00 -0400
Received: from mail-eopbgr20075.outbound.protection.outlook.com ([40.107.2.75]:36334
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731577AbgFWDJ7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 23:09:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e77lg6w/Yf6fyhU2J8mGMgKJpH7w+4+9yrCYVkx6Lrs+gYEB21l2bt5FQY/vS3WbURItASBMMiJZnXUktoJEprv6EA8KJj0mnvuN5RlbLwuv+tXgcPkC0tJNd2+ei58PKXgGcgVrOCO8kR5xmtsZeaw1uEQnw6j1AVX53s8ip4Cs39An7MBsQmkkdG33mLVYgh9EQza3Z/J/ahYms//rkgl+H2IMwFiyOwaBBGFE57D+V7DNFxgYFXYFf0Ra0vu0SzU+83N+zosBO6K7HrgtJy9ApNyZxl5Ml+9u92hM6VPG7u5cvkJ8rZ7kHn1AVSF2HLPc3lF8wL4w3lQUcM0E+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udy1s30FYxaqOXowPF91LqC4LaoXZiuTA7IlNk8gb9s=;
 b=ICbBgxnjABUgUCc/bP5RXcVu7C2WywZJoZc21SDS0xap3FNPiVM3l7qKCnmOyY+tKRSwlmpQYph8BVUlDAN10NcSeQzvT9O59jxXsCe5X+KalK3azqTaVNG8HnHPKRGIZgWGwQBE158J+K26XxeySlX2hedzTY5S0fJ4LzpzjFEORzTHpnd1eeaHgkC92LcGrS37HKgdt8znqwPhiAFEwjJ0TKDSP7A1iCr/q+P1u/OvLkoixYHr6Qdg7JFL3FdTlYvp/3zFygIvqZvyfWurVNPw5FYMRGpgvz73PdhbgtxNuFQMygqvIUE2+dDw8xSHBEDQ2sUqpAiFra88PiYp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udy1s30FYxaqOXowPF91LqC4LaoXZiuTA7IlNk8gb9s=;
 b=jxHZpXLZnm4SQBO+DIN8O5XryqqDVob/WNc+47GYPxGKtg0KhrZiPIMdzrAtCmxMq2P1SFQyUWGaklZy6HxHhX6ObqHnpb8ins3AozTPH1i564/wAozXIFzUkYERVVtBNAFoThrLtIDr514WBRyBhCicGpx0zHMJ8Xgk4B9wJHI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 03:09:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 03:09:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/3] usb: cdns3: gadget: unsigned int is dereferenced as a wider unsigned long
Date:   Tue, 23 Jun 2020 11:10:00 +0800
Message-Id: <20200623031001.8469-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623031001.8469-1-peter.chen@nxp.com>
References: <20200623031001.8469-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0015.apcprd04.prod.outlook.com
 (2603:1096:3:1::25) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR0401CA0015.apcprd04.prod.outlook.com (2603:1096:3:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 03:09:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ccbfbc9-3d60-4a7b-b2da-08d81722e842
X-MS-TrafficTypeDiagnostic: AM7PR04MB6854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68544D262EF7CDD20FD6C8AA8B940@AM7PR04MB6854.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hy8coqCO44YqKxTzCTdX1ZYXvzuzmu9wGzIXxgCi860DSUzDb0KdEx2/+5ZztWJ8L+nyGDMxk4c7IHmw7eW/KXDD0Oi/fFHOotbiu4b7Nkt/bFb99cMEHMMSpGeNhbLf5ODiMkyvzPqKY6G3134UIWtjDDExh1KibQSZXB3lLd53AkYdOrwAGHFhktHTkRDTP59YtWJL3cHDFj3nd+c+FrOZXyGXr/XcAVcLOffIDygvs3qmQombXUjRExd60s6K9M+vKKgMM+pn/E/iO0D+b7majncejjnNdlFsLZSpWL5iJWdFElVdmynuOu5V9O/3VU8tgLy6313J5w58hX3u7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(6512007)(1076003)(4744005)(316002)(2906002)(66476007)(66556008)(66946007)(6486002)(44832011)(956004)(5660300002)(2616005)(478600001)(6666004)(26005)(16526019)(186003)(6506007)(8936002)(8676002)(52116002)(4326008)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WA8BzRTihi1nHxu7U4qD6i6XMI3S3sI45Lz3WqiE8iwC/6BjWLJGAd72ciUvRFNwc6ocxOIuyMBeWobj5PsHFJXBPkArpIRmw5xHRPUAOGMA5I/ekiRSGAJ8YC/5Kt3qwwtAFc08rthfS/ic6CWNmf1nZCmRc9eCZkakzZIQxsekfEx5l1YwjVitVSZpczT5AdLDa5oQ3e3k4Ff/i1279eO5UcSq4FXHP8roXByFfWaJNsCSOUXusyKkq4Hze+spbd3QiVrnsjA4A75WoM+zyUc0Rx03QEEM5ow+luI968a6mX/Ig4/SGcOmAo6Ob8x2LmlwXv/Es9N6dc/yWlIdGF2KsqszVy/NCiduQkbwd7KzdCJPnANcECp0FJVgON81/99v3t1Ge4FfiDnBGeY4Ar0YYREK/JTycOLTQ1Z0s9S92Vcu5BwoaWncZqWTUL/6VKlm5WVTVOiaOBvGZLjLXTRuIAw8YAQv+dD1m2Hmo0CRuZTRaca/6U2AwrjkmWZp
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccbfbc9-3d60-4a7b-b2da-08d81722e842
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 03:09:56.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZX5F7umyCZ/N0MJGajqv5f+ABaBjalFQ+iUJfMO6vj07uAepsGYdWcrhQCXBVJ1bG6+9vuaQ4mz2zmYDzOt7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is reported by Coverity scan, and fixed it by declare the reg as
unsigned long.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index eac01b1a4958..2362faf7efeb 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1813,7 +1813,7 @@ static irqreturn_t cdns3_device_thread_irq_handler(int irq, void *data)
 	irqreturn_t ret = IRQ_NONE;
 	unsigned long flags;
 	int bit;
-	u32 reg;
+	unsigned long reg;
 
 	spin_lock_irqsave(&priv_dev->lock, flags);
 
@@ -1844,7 +1844,7 @@ static irqreturn_t cdns3_device_thread_irq_handler(int irq, void *data)
 	if (!reg)
 		goto irqend;
 
-	for_each_set_bit(bit, (unsigned long *)&reg,
+	for_each_set_bit(bit, &reg,
 			 sizeof(u32) * BITS_PER_BYTE) {
 		cdns3_check_ep_interrupt_proceed(priv_dev->eps[bit]);
 		ret = IRQ_HANDLED;
-- 
2.17.1

