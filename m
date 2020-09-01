Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645A3258A9E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 10:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgIAIps (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 04:45:48 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:53473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726536AbgIAIpr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 04:45:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmmEBXJYXgJCZxqDw7+jzXn9bCkcTHhZpc6vt2vBukIeroPwi8l3fhOieKhhRzRc9OCFJqs6H55q4+HObVx91ECs3fe6mEcxis8gqL+LbXQsyVW++CTwMpEs4+3MLa0+lw4lprBLvR9Yayb3wdZASeIBZABlweZynyd6evEbIf6JZkNtOO2ERM/aEDx0NZxJwCzZV532s/a/giIQKlFQAOQNjg2ak0AGv29fN/tUUbATblQ0fHa8ZxMCroB/jMlRBt3/+SriC6d5MPFkjBjPg9Mb6AwE8zTmfBqwDStXHxXUIqpUcenKwCm8mLEDXbYNUrG7vSnKeMYEMSEvN5v4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku0G2l5P+XYR7LbTB6WKHJ+yXWxpsBQGyoi2DXXCCt0=;
 b=UUNSE+3B22DxupJ+P1Gu6o5iuJgd50Zo8sR5NuCdiDnqWENh9pU4hGGnecX0oDuXOL5m0czUcMMD1+iXLiBNn+rWFd6Y81dRXtffsawYTcGy/jaY/HL9bbn/jbLKoC3Z5Xtfb3Tn0v49ceYK1lUi517t0EvAI1oV64ToU0gkPZC17vgIjrloxJ0NKxc3LgNnVs91FbFTEz9t9VRFwU2hOhCdvSnpnj63vFHrPBtY54RuJ1wEHh7XssoZ+WKY10PD4gLe37MDQvRHOIb116lFh+JZtjmvaG3lpVk21Xo/yGB5cMy1MXgrAawRRP01RwpcwUFPF2t8nrbweiPGtZNICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku0G2l5P+XYR7LbTB6WKHJ+yXWxpsBQGyoi2DXXCCt0=;
 b=lzccMVEG542+XPfVq1O/LC+KfSCJ10ecapxihIR77paHgyCNAh2w080OjypRpsqjsa7vcG4lDiFiiuOkUMowq1gEl0tI+BhPBxRKzuNmzTzlSIyC4GP38G/I+TgaJl/8HhIUc2pFa6FVNRey7gjZ73Yt+h54v+KoYrN3hYrgYgI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4360.eurprd04.prod.outlook.com (2603:10a6:209:50::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 08:45:40 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 08:45:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 6/8] usb: cdns3: gadget: need to handle sg case for WA2 case
Date:   Tue,  1 Sep 2020 16:44:52 +0800
Message-Id: <20200901084454.28649-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901084454.28649-1-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0226.apcprd06.prod.outlook.com (2603:1096:4:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 08:45:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be0b1cf8-6a1e-4efa-3142-08d84e5367b1
X-MS-TrafficTypeDiagnostic: AM6PR04MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB436022C612C50B1247C6C2818B2E0@AM6PR04MB4360.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7te8+4g/H/mBl4EPbyMYDLqCpWvfISsR7PoYy+HXswmPwqTI0uoKtRGR9mU3kM9QuCv3ipIZZlSTjag7BVyjqXmcUfUojfA1XFEJy563VotzicLHkcnKAseD/1JHjaddD/BmLci3+NZfK83RS4gpzxnw5nCHKkCW7/eTkNu+SsfjGuhv6lhQkbXjX+YntUXTrwSqmVh2Zhh5iv6Auq9lMgdftKrspeRZJrtNhbuGSyZtY0MRwFhLMeJnpwRun5EJQipvMtfc+dPtxABH/H53X/jJkD+jZRA0rO73XDZVB1OqIkTvD13BX6LHbDW1JwDfmhZ1gu3kzYxuIeowC/7nLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(956004)(86362001)(26005)(8676002)(8936002)(66946007)(2906002)(36756003)(1076003)(6506007)(6512007)(6916009)(2616005)(316002)(5660300002)(478600001)(4326008)(66556008)(66476007)(83380400001)(186003)(6486002)(44832011)(16526019)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: eSFUOb715XjiCjvymefHXRCAxJBsLPn+QGGU4OZccixuhyuW6hRDET5FbQUbQjMH2hE7Y3vChsRduAquEyKEdznSIJIz37FMArOqLXmdlOl3XWOwTQrDcgNRMes7gQ6mDHucVEAmdF0FHUBL5p6nA4V3iFpMk40L5ywEMUsAvVi54gBABeJm/EaMatCd/LqMJRB6ZUVAkfzM+a6AaUv2Rq71mFsPt6ArrEUJyCiKKfQgettgz2ksC2WfeEb8WoJQhFrAiheb8sNdJ5vXxc2KgzTyrlYEs6Kk5U6602r6as1Yp3hld6RgSB6ENdFeEwdoEJY3YNZHN+PRvyCC7l0WPKklkJN9v/bKdsbvdPC0Nzn54NyH3qp/dN2VkbZbnK9mHIItQoqAy5es3Ecr33d/H/nzNIospOE15PMk1gfQ6hFnpPAst6lTv3fhtrlnvfBes24rb57kMB4nxn9FiLO23vzzgDa3lli4qVsi+LNUbRyiov7Vt8RmP+xMtH0y9xJXZcsDKV5925zAlJZniG2D2sUGSc4sJa/9qyfNJOSRotI74VfQXB3fnDs2tHPPAiUiXKtNNwiu+5mCAcTYOdir++kAn8hruVLta9iMXARlDCf9BlqiIX0gENwTRJdhO3uxIJfYMcWZJ4HJxteKg4a+0A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0b1cf8-6a1e-4efa-3142-08d84e5367b1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 08:45:40.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQ+KRF62uBI+AryiJp9vHDWquhjwYXF9DAKmxSGyd4Dd1vu6VWMicYfi0z9SmCsiVILgqtzNqIFAdW2WIv+9Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4360
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add sg support for WA2 case.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 44 +++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 6cb44c354f40..1fd36bc5c6db 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -462,6 +462,36 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
 		(reg) |= EP_STS_EN_DESCMISEN; \
 	} } while (0)
 
+static void __cdns3_descmiss_copy_data(struct usb_request *request,
+	struct usb_request *descmiss_req)
+{
+	int length = request->actual + descmiss_req->actual;
+	struct scatterlist *s = request->sg;
+
+	if (!s) {
+		if (length <= request->length) {
+			memcpy(&((u8 *)request->buf)[request->actual],
+			       descmiss_req->buf,
+			       descmiss_req->actual);
+			request->actual = length;
+		} else {
+			/* It should never occures */
+			request->status = -ENOMEM;
+		}
+	} else {
+		if (length <= sg_dma_len(s)) {
+			void *p = phys_to_virt(sg_dma_address(s));
+
+			memcpy(&((u8 *)p)[request->actual],
+				descmiss_req->buf,
+				descmiss_req->actual);
+			request->actual = length;
+		} else {
+			request->status = -ENOMEM;
+		}
+	}
+}
+
 /**
  * cdns3_wa2_descmiss_copy_data copy data from internal requests to
  * request queued by class driver.
@@ -488,21 +518,9 @@ static void cdns3_wa2_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
 
 		chunk_end = descmiss_priv_req->flags & REQUEST_INTERNAL_CH;
 		length = request->actual + descmiss_req->actual;
-
 		request->status = descmiss_req->status;
-
-		if (length <= request->length) {
-			memcpy(&((u8 *)request->buf)[request->actual],
-			       descmiss_req->buf,
-			       descmiss_req->actual);
-			request->actual = length;
-		} else {
-			/* It should never occures */
-			request->status = -ENOMEM;
-		}
-
+		__cdns3_descmiss_copy_data(request, descmiss_req);
 		list_del_init(&descmiss_priv_req->list);
-
 		kfree(descmiss_req->buf);
 		cdns3_gadget_ep_free_request(&priv_ep->endpoint, descmiss_req);
 		--priv_ep->wa2_counter;
-- 
2.17.1

