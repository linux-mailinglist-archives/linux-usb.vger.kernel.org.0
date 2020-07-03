Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7779D213422
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgGCG1S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:18 -0400
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:48441
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726262AbgGCG1Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+6h+evn183dTOOJ52U2CultYOW7WBXEz+XztrXJEwjwd/jO+/X/1gm5P+6vaOpvq6p6NJ+tt9hPOpiq3wNtcRJB9uHZQHmnEqhG7amk5fqlQoaD3DqGhGYyf2wl9h9WLTYY2a0Ukskxxw4HMxBeFb64peDC9LqrL2TDk+TGYYUVQqMyF01nb1dzheDL2nHbmpPLcGywEdtTAQXG5IEqN4Nlg1NDzC6A38vqE/umtDS4LhqLvt0/EDCrhpwGL3cNIWEhM3kUy/cICgkdZhWlFNZkZljLTwivPrYBcOk2Ekojoi02rehJ29zGzM8eyOX35Qa8EmGKfYr48vfCyZiZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lELQYUlix2zOqpaJNgCC/fvRggI5eFM8GAUeI85aeuQ=;
 b=FXeN682kDIL7Z0HHhSZbnyxTvcHdurpkiLBgoZZIdgguZy1B5eZQ3lOxl2tljAX0Fm1HODqD1LaP4LGJdimerBC8J9L4J1GK1d4gnle1ZTaftf+66YdbXCuQCx3QHp362SBUSut/N5PCzln4PV81wPErp5TB8tnMJq6DY/K/3Yc5CV9uI48o7Uo19DbX+YaYxUZGsIPb5SR7Q79qO9eduh9jxaZFH88PDgTfjwddxUOHO5ubftUA1I4FWrS2q2yCUhjhxF7Te39lmV07kltcqNgYpbfLbp1miGCC74c0Q3YB6Ux6EzDr+IclXPny4xtLl4fuUPUhTqYwVGbs6tgLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lELQYUlix2zOqpaJNgCC/fvRggI5eFM8GAUeI85aeuQ=;
 b=aR+PDAJa9YAn3qY0ZMdd7W5t9Jn2eTZjZlgD1p+i7DPcRQbQEHczjoEY5ptqmcjViduk0y2tIWQydZNL0Kk5Q26YxU9fqKFdyDQBQQKE2npK2QJvHaAz50kqCYA21HvQGhurYYOYnTSRHPcXBAbrXCeAloMhl6MZlH266zJrPU4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:14 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 6/9] usb: host: xhci-plat: delete the unnecessary code
Date:   Fri,  3 Jul 2020 14:26:50 +0800
Message-Id: <20200703062653.29159-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8aa8039e-6543-4b64-ae2f-08d81f1a1fe3
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416693FFE361C07604ABC9508B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S46YsD4icO/+aCQTDa224q9z1VulOVjPCJAijxOPAtHM9HCqN9Bu5h4fGWw9kaM6Vjxam9Dmzlc7vAufYyGx/DLekDuLTSrcPbaUj+xftgjsO4xgeqkx+q/9Jr1v0UvKmfj33N95yoe6xf1NOOWFy/TPL7X+XY20rfm7cHADcrlKapkoOh7/NTAXz1wZveKyn1JNp++I0Jxj3lrDJ3wXJA1YfIwPia7fgwj752CkoVv+cMIbdf6Nk2v2T/O3Fmy77aiPsxCDrJ4J+zyJERNPn+4eYumiZVeJ4jKDNQtfUSJLlnT0GzvbGSkDRIfwoca/LFhaA9uFE5IYJWWctagA/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(4744005)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: USnxyEfNC9hoVNMLAthgtnSBSKx8oeZkFkfyjK9ME/WaIbYp/kf9lc6IvSo96+Lr0Nn52cuhsNZ6aSjS+foAXY2zHVi02aRZQuT1pUTcAp2b3yy+FlqYH/xFQlqI+etdxpdgJhPiLtxwnSNPxEhddmTtUXLtOqhJb1Hk2yrVANmP4Sgd5thly3xPSeSiMc/ewVFHuA7mFxHcnPhjTnvzIA7+2g73eL9eaqUR1bksi3rXg2lSbud8PCNZPONlGRIVF/kxRylXnLVZP3cIU0NYtoQuVzhO/bCNw5Zxf1vCCSTdQEFTCSQmmJrQR9HXfbXwcsk6XiFc8hjqi+XTqDV0Ri2Rxtivn40w0Rs+53Wg+jqVKOzGCgdC3g9Jzttb7aLds3rA2aXmmq02DCTH6bxOLz3NxR5DskSalenV/QahMEt/i9luCix6Wv6i27rT0/wOV6/1VkYZlWOuzx0Qy3XhovrOPuHtVz0shd6ErbHYEVd0Gaz/FBjg1hIgue61bmn5
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa8039e-6543-4b64-ae2f-08d81f1a1fe3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:14.0478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qz3JH3bp0cW4aepTIfxp2iUP/Mm/NRwKxia6M8vDe+CutYp9UZWsUY7sdo/Smju3Mc3WBldDu76GgqfOEgYmuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The if {} condition is duplicated with outer if {} condition.

Reviewed-by: Jun Li <jun.li@nxp.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 51e20464fe0a..03d6bbe51919 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -283,8 +283,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
 		/* Just copy data for now */
-		if (priv_match)
-			*priv = *priv_match;
+		*priv = *priv_match;
 	}
 
 	device_wakeup_enable(hcd->self.controller);
-- 
2.17.1

