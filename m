Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADC81DE480
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgEVKdD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:33:03 -0400
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:6057
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728362AbgEVKdC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:33:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuFpbzDvZpWjPf6lCqWEOGocEFnTrBQHOoG/FpoeOYSz9+TV/SeOl0ghleJgFCweWki+/u4twBVoMb506M15dQUav3kymtAEAEee1vlQl9ZhgozRiPJR4SDxMaysDe8/ZeA3fip0Lca2WuK/hYDAXtbF5Gj1+1EZVRH39Lw0g55rlkK83HcbQ7AmJjkBlDgJuYwGz8Qs+GL1ogp0EeIt0sbp8oBkq/CM90h3Yva9W1hgAEALV0FOLBRCYx3duc6ZOzpW4Abm4P7KwamWSLY8jMToS8PD+ohLJO3SXh34008kDXcF70H3BkuKZCldhojwMJVk8lvpzPxJxI1hy90wQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wphtIvDB2kfCDDspx0029WSs0K6S4SQNxMGw4AVjxXQ=;
 b=FtlkmQ9WL8ayo39QKs+8q7gzs4LQhSq39umjMADh9ncxxtldcV9ypGHkro1LOLL+r2hbmKm2RLc1lsvIxh0NYRQoixCAnPwCyYq3fwfu5UJWIJ6RONNwr1a9EpQ2VTnXQ8zZr7CV3Lk2cPSsAdjQ88VSkReREFRMxgbfr+jZdfpWd4AYWCdYR1DtiwjYe1tVTqNB+4ApVm9ixvbhLRaEvG0sm81A4VbrIuU09qc+KGosLdh7HuHYAuDVNtmEzRBYn5r7B+wLxrlO20AqPH5/vuEMetJf/oiQjoUJGNuFiB6oz0uTjF8OOFQhe6cPPswgA3LLg1Tb/T3sOWeQn3bHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wphtIvDB2kfCDDspx0029WSs0K6S4SQNxMGw4AVjxXQ=;
 b=PJBqVeaZH8GtrJREpNyXvciPZW408seDH2EiMrtS6GZxMH0GsD/2FtiZVA/oDtS9Dc5MNcg1eLttaYhEdK3rM/TfkiuSV8fu2POKi50EREFRddZ1kOMEEskoI3i7uSC5R/jnNzplYMjHGJ24m+yoKsV+/xqatnV2BchGZO9FplY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 10:33:00 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:33:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 5/8] usb: host: xhci-plat: delete the unnecessary code
Date:   Fri, 22 May 2020 18:32:53 +0800
Message-Id: <20200522103256.16322-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:32:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a324d983-56ef-4703-4bed-08d7fe3b8037
X-MS-TrafficTypeDiagnostic: AM7PR04MB6984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6984ABBD71BB31829E3792EE8BB40@AM7PR04MB6984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X0cSvvIHfKQxR9or9McQWqidtjgEyZzffmisq4eqaKcRe2DBA0AOSK0XRM9321KpsCFyH1nv+UndWoj+lQMd3g5B/OGofGhC099ygGxoHuQNLJmJK5syZLFQLE5+hay3Hz4lyp2i3tduoUm4reVVNOlh9I8IWv2pfSlWflOBwhpmaKRnMli2TtluSlLtHLVhAmBFi5zZvgGrFSbeu2FWvGv/bPryEwClxfUnLkMObJvKsMf5roe/4j7ybZdc2eoOhQPg4o+OpkOSMJqbGZ3PZV28DIq2yLbD5X7gR4l6Nalo8gkwCO1rp9cqnvdL2032TBijEn+KVWqdBbeVZWri/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2616005)(956004)(316002)(16526019)(186003)(2906002)(6486002)(86362001)(52116002)(44832011)(4744005)(8936002)(5660300002)(6666004)(8676002)(6506007)(6512007)(4326008)(36756003)(26005)(478600001)(66946007)(66556008)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: dZHQrcij4kM3UmG1ZB/Q9yqG5D5JXZdR0RwQwgLfeJwDrbpVXZ57iQIuhmcFvXL1IKrV3p/ofExEEkamRS19LZ2305laVP1vyKgfYXtfSJfZ74WsBcthyqjQtdxpwwQ4k//GoaI6zKJdWkxl/cutV5Hf3AE5mXr3ECrp1sKb+irVsqa88N3fXLMoCBTXaKQ/IhNVeMx0h3hRa4TquH7kIjnXkxOWae0Q2u8Sg6vsa3Ocl84QYrnLBRSMHO3CN8gRXAi/0aAgwQklfwxs+5nO/oCxDkraLEz642Csq2qXU3jQ6li8jN84+l1hKbzkDE4jeT49nzTwdXdL3dPnPqZaip4l/C5QYzU7jMeWeGBHIz7d4STuUjtBuvBKz2oHjFkIGA8wOGVnsYzSxlH6lRdCweB+/fb1RvyfpV3GjfffYnvsWAVE7FjvJoIjpLXCU+hptuUa7NH88LKHePzZFI5nAi4hGyguKt+lct1m6Xu2mFE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a324d983-56ef-4703-4bed-08d7fe3b8037
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:33:00.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unqWjpRnuaqGmVPBEWEzwbXFkHhNRlQWgzU80D8htrSeY1daFvZd1p6ZtgnnuVEHnwimJEV3GYAOZfc5I628RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The if {} condition is duplicated with outer if {} condition.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ca02e7f36238..a45c7ec33ed6 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -274,8 +274,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
 		/* Just copy data for now */
-		if (priv_match)
-			*priv = *priv_match;
+		*priv = *priv_match;
 	}
 
 	device_wakeup_enable(hcd->self.controller);
-- 
2.17.1

