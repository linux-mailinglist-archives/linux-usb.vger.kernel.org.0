Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28956258A9C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgIAIpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:41 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbgIAIpl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjyczMb4+cvqkR07mOfGq8nspwXZ8iS56RnyACk9IImG8kpljuRULsG8B7/hZYACxegR6t/9UeVMb94C+ppc2/ZlFNdLhfAUKE9QaZqYVte370PAtTwRj6R5Xg9tFjxFeVlyrkHqDT1mYQLXnmlxavsi9IOanSJWteHbjKKCsNLPZ960N0orY997UWTNGPznh3qeSKIFZ6v0uzw8QUiDgA3FdZb3RXD9BxP4l9MOd6tMChKBJ3xweaCXVDEZsChjbZpcMyTGzzDX/gwp9TpNmTICw2yCsTlIrKZ7PlVWcBOlm/iiBn6RjIAmpc1D2fPZ744dflnYc7hchtJt0zZa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL5Tsp9KYd/tyTzgX0U/mm7qTYStRkIPuqOKOOYSfCE=;
 b=m0DUSpkeR559f6G3JuEaIvrpvfJydwmQTG5K4ykFEyZG8N/JJdGdOiaJaRJdv206Wygc5tTofWz6Fg54S5MPTj1OTIVThUIhOx3C6A85yInSoygghcUhUO2sc4sVcWjq3VvhQXEq3Wlk6APybtNnEVPvKqosz8HDCxLfNZoKja99Yr43nUKsD2Ean2xqR4zBSeo5xcBYfB6O1VcE4q3j918taDHxACduRebK4dgs/bvsbVTnnX+fpfRzzgjtth12tyMQExi4QlppjPqM+GZTqE84knN/BW24iT41ZwPiAsUZngt6OV3Aln3254Kyp0uLF6HzclHu5erQEN71FhlPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL5Tsp9KYd/tyTzgX0U/mm7qTYStRkIPuqOKOOYSfCE=;
 b=BIQLC7Mv+zWLPxcfIOu5pFFtx82ZDgV9Xp0C7Ovb3nYktJJB4YKmpEc2HzOtOKQT48WmezwOLyDbXnmKfZcYLhSI9kGlzMXoLgJO1IppL4jHjfOyov960WipCEycFqszMtPeohXmCEkWvXO1/wig/UWSCtU0vLJ9illm52Nh0yc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:34 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:34 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 4/8] usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
Date:   Tue,  1 Sep 2020 16:44:50 +0800
Message-Id: <20200901084454.28649-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d230075a-6412-4bd7-38d9-08d84e53643e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4360302E9F0E745C444CFBD18B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnZ6n+Y8qpgrY06zElgDeMO3FsXFsARWpCM7WJHTMnCtzp7Fjn6lkB+IUy8Nep35c+YQpT2XFuZ6Fo+91AZ+XkyXpU6FFpRPhyBlJKm+Bu6AOHIJB2K8NT2/mJM+NmOTCYxPEriVH8zJM4r4iK0cJt5JA1HrLLO05YDLhsj+CQBQ9bBzRN3X4vZ+Poiw1ccyTY4xTwjtD5sHvHjWSJbiWDCP3FEohJrDijgf2VOS8uWonctOWeNZTrXXCmtFULvEgDy5MTCVDiKV3tEZlNrp8juEzijHRPnC2pRJHjwdmjI96laMR1PbbyhIkf9kQKN8iqes9z7kcuRvMUoDpynKoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(4744005)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 9i+A0QP0a8VzS/9dUMTdqyuB09tk53Y5hZ2cgdlN6+5WmCCNE4E1gq8cnuSJ0sOj+wlJb66kbBaYuB3gpEqSniNTfcdFpv0zCO2LyDbT4NWcVZI3OS7PzbaOfgqlRyi9nZifAaK413sfvCmXlXST0YjrXarbH11dXT5MUm1q2ZH/3YiI5d64vOfffAxn4cQ7edbHYw0UQlINi79NW63d5hINjZ+4CWAaybdabb8EkMeRiKdxu7VGWKtLloEGSS3Kl8nYCwfM76VLRMCLPXUtc5cWIZMQ3SGfMnwCGBVUNJYpjXKgVQCKAlrVPg7EXXx53bFKfKDjAwOg6g1DgmmnVo2PN13s8t6lsBLiw8kuc2g+LL84VppSWLvWVnOSz29AtWK/v7ghfpqKimFEmvzeZQuCyguw5/d4EbBPgFGYqW1s/KX1OxfQn04IZWoSQbrWgLq4GB3kM+qJ+w2GShC7qUaUJBawmeufkrfULDR4qEAR9AIn3Z9PZsYSN2w014tM3cHyIshIMari0ws/3R7jtJGSVq+ROkdSzW9qh0I8LwS6TipOPcpmwAWgsqJ/+GaA4oBKNNTYfscJERWojGKR4SaVGvxZQWbBKErpoW8DgY5qdcrMEIiwycWG83mtbpD8i4SAx8cr/rBuuZELyn12rQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d230075a-6412-4bd7-38d9-08d84e53643e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:34.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IP9O4oV4xa+mZMnwTLacMYwljUCqS2oVZbhYYRMbKo3h08uA0HOKGcI9L3mkeWymuw8vax67qLfoFWWmHlNJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For sg buffer list use case, we need to add ISP for each TRB, and
add CHAIN bit for each TRB except for the last TRB.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 25e3ff1cdf61..a308a694abc5 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1221,8 +1221,14 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		else
 			priv_req->trb->control = cpu_to_le32(control);
 
-		if (sg_supported)
+		if (sg_supported) {
+			trb->control |= TRB_ISP;
+			/* Don't set chain bit for last TRB */
+			if (sg_iter < num_trb - 1)
+				trb->control |= TRB_CHAIN;
+
 			s = sg_next(s);
+		}
 
 		control = 0;
 		++sg_iter;
-- 
2.17.1

