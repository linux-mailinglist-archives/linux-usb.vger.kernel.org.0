Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5888F2167C5
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgGGHuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:50:09 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:44708
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728125AbgGGHuJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:50:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5hATuDMP1qgNfPBAsQIbpCtNC74UurM9UIl8AsKbQpqcQleufa3m01Wu/d1b+Qu5J12S8fEh0+bAaXs8bN0vY/CPs3D/lFAskwbRtsamb6CZI+vnRQhTl87UX8oKLymSVOitDMPbmbxc1tWl4Lxqo9DQnCqGS1aXy7f0Lh/orlzH2FEmtAi8UdnFPiPdvWQGhnIxS5z+c8cOq3pbOQES06ZvkIahkxl84m0bErIciga11GhOthhM+J7CWsGBS+iWjaRvlmZHbbzfF7OzrhLwqydph+8UWH+Ws06kr8m/2Whfyc7hJb8kFLEV2H6K4EMgaS/3NnYvDHMbB7s/YKDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lELQYUlix2zOqpaJNgCC/fvRggI5eFM8GAUeI85aeuQ=;
 b=UrK3f4bk0AKJhC/PPgys4mHHnAI81BGHsFL0H1xeDwMLvjjGfxjCnhByYGJp7lNTrBAJOvEbS0utVAk9niA0wrzLFLy8gWWELvEoN544R4L72vP1eFTVXt94IDe4FS3WOst7zbWLJWy5mDZugjo1Z0CVlcvAzpQ8dggGiSS0uJJQa2oDmjTdEROCrY2uWtx9aVwPMzcm9DF2zwJ66PRnctr0+oCrFrANFM7MwPl7tXYrStzmSn+46C617mxekIaHbay/Cc8/Od3A46D18FHmRTg/ao2F+OfftQDHyL4rbdVFRaQsFwZEHLOBgcMIegSMAC1CPYsDM57HNwxrP630Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lELQYUlix2zOqpaJNgCC/fvRggI5eFM8GAUeI85aeuQ=;
 b=K4EyLozbvT89e9zgToc9tJ/YQSfBFTiGhqHY3Vxu8V0nrgqe+bdv+t4WQ6dMQsBQpAOp2UnTm9BiKcPb0zJL/Bk0vsIxrqWYqilHIxIMsM6giMhr3vW4y62QirOWIRmGsJ3DepQijSv4jm3XYs8oA2S6w53DA5uXERkVvKahcyY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3138.eurprd04.prod.outlook.com (2603:10a6:206:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Tue, 7 Jul
 2020 07:50:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:50:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 6/9] usb: host: xhci-plat: delete the unnecessary code
Date:   Tue,  7 Jul 2020 15:49:38 +0800
Message-Id: <20200707074941.28078-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:50:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0aa31a53-78b4-47a8-faca-08d8224a5bb6
X-MS-TrafficTypeDiagnostic: AM5PR04MB3138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB3138B484B4241CCE443FBB7D8B660@AM5PR04MB3138.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WPA1Etp3a71zlSr6hs11ryXlgZrP54/ZQ38YaapNIDMfvSn5pMbnqMoix4t1/mcei5wmwOqVoN6A4ZIq4kscUI5EiwkcukLviagL2e4X/+/EFEBdhFpRLuKItHOU3TfYbHIct7fopyAlbvYFhPBXxscg0j0SkXcb8EsYvkzbcxfplL3+GhybkWmNNsrEEqjQ8RRW9CMq78h0MPHHyive8fWfW4RLEietzX63YJj20CR0XEfDcI6ERJEE8elbjqKjIpotnpMXKP+TyYQMww9P46Pcj2/4tUu5qwCr9+j0bU0I+ao1ppuOkxNQbHk0VmcgyLvqbigSt82RVFm4y8+ZsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(316002)(6512007)(2616005)(956004)(44832011)(1076003)(4744005)(6486002)(6666004)(2906002)(5660300002)(8676002)(26005)(16526019)(478600001)(52116002)(4326008)(83380400001)(66476007)(66556008)(66946007)(36756003)(186003)(86362001)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Sjic56Nv6kPnNmH/y9+A0Aft0bepRupV01skYHEbGydDCOW0vKME+UV17BkZl/NvA1sfVAYIFy93+eHkuj82wz8/yxJml4dSMbxzwQ5eP/c90HXF70J6E1C7PayrbVq83OCrxixjNT3bLI+dhVuRsFBucnMywfLDXSb3YX78Q6dD+I4z4sU39iHFeHhkDCWHTpVgsVZctQFudL1ygYhjIbx4RE4kEdtPdaZY+Ff1EVQe7WEjjijSdcqRWF7BYMjlkL8xrUoPEObx/DyiTdAcnwU+opv0ecNkfhrQg2DT7jTgNr/8vgezj2Vtm6r/SgnsZqB6c8jKWNJfF+NxQoVTRH0DXSagylCjQP/nQSM/oMGaJYEGkW9uIeHRu9OP7/tOM/4tJiOns8ieb38qvGrmrmyWazxYX+4j0AMOaQHAUueq4U9IZfjnWRCdl07IrO+DRqTcoYga6QwzwO1wrCb143WCteZwtHcVbF/dZeSzth54wdWk9tD5/w1ZhyUOy1Zy
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa31a53-78b4-47a8-faca-08d8224a5bb6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:50:03.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwPaBY5X92NxN6Lz1EqV/yu8ibLv3o01ax2aOrKR+zb0NFniFazG0KflXOe6Qtva7osYQOMB4l4mfnlI5JzU7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3138
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

