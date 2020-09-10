Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E0E264103
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgIJJMl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:12:41 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:35972
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727830AbgIJJMX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:12:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh/RCexH003wLdyNDyFBuKy9SNvk0M3KRv3cR6MHZeNL6khvFpfw+6bcvx+33I1yTEebSZb7357bXbuUx51DST/+Q5niPW9VrlRmMVOZR0oFP/Xiqj7PgeJ4j2YPlegIqDdkNu+592BeXbVpL1ZpRaMYtAm6bAuE1pgAyB51cLACWSHMH3Wtr0Awh+cmtiaAGRiBpq5qoN+Tk6Swo+tZEzYTrlKxwFyp8zDX4NvepOmVLBAHMLLDo1t7agomMkCnIyCAMvpdfw2X/hbVeihZfNHn+Mdu8ZRObSeZfJUOHJlc2jokosYNJg7ubWV9Pp16OxYqtbUeTqRrwGpZcaaftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=266tlUmODVkdkh6EJmvdr3/HwYf9TNVafTHakNqFGFw=;
 b=GOBOr1YIRP0+7A3nmgSx+pMJNzBbAekpLjagWx6EUlwekfy2GjNSi7gijRN407ur0xPudSWmhzxTuKQ9rcrUnIshKb9+X0SXkZAM4LH1csr2fa/1gaZkFgQuaUdBytIYD26Q8/Jzp6AgoQlkysI7ElPdLcCyHrngCTFR3PFnHUKHKX7/mvXSpnOtMuIdtgyrdTR8ScXxkjnfAO4KOre+m8MhLjf568ZMy39oGP+Z1+/U9D1ENvvTiMcCCgVZZIl9ryVf6PhCnMjkwJhJbIjCJfOmPBmN3h8acwYiWGOIMvaDl0wD5F1ulsQeOYqAVf5BI7uHyVBhP2rLh8/0iQrZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=266tlUmODVkdkh6EJmvdr3/HwYf9TNVafTHakNqFGFw=;
 b=FuP6cLoZuTCXrPEWeiM1pKzIKSWIJQ1Z5zQAEy+QqPS8pN4oOOR0DKpR/PuWBsxE5AUtWfSvxryf3sWM92goBcXGXF3SUF0/64L7SMrlv8t3LLMumCVgwgL7AWJIvEMOIMPzdO0vndGXzZxc94CTqqlwoTI4My0+LqT3U0pLcok=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5368.eurprd04.prod.outlook.com (2603:10a6:20b:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 09:12:19 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/8] usb: cdns3: gadget: improve the dump TRB operation at cdns3_ep_run_transfer
Date:   Thu, 10 Sep 2020 17:11:24 +0800
Message-Id: <20200910091130.20937-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fda2ea5f-cae0-48e5-b54b-08d855699e6b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5368:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5368EA5580F1C316E7FCA2EF8B270@AM6PR04MB5368.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XlNJANJCZYKl3dPvGZi7IyZFCxIS8PBeoUpxBosxOiekWFdoRs99upTC+H4Q6fqEIRabakSDn6BRmQV0AXDqlcBlI2F4GL0M73K02Pm62C4y2sNpod/AeeV7DiOpH9P14rGGh0ETVZyotzBt5F/gwJmr6JF/ImHpiegmzzqWTUXtes2od+CV52uwfMD5HSQ/tXjfmqPD1kBKc/rePMSbMEkeEqmTG9BSoSNyZAqrh79a0FudHoxchNJMgLPeWMfZpv/XpvwH/IKvng0/IEgDh5GwpTFmocbi9Nf321y6dFf+b4smADQwdfpKyIQLyPz2p/rnZVRXcPNhWbOpLozu4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(36756003)(2616005)(5660300002)(66946007)(66476007)(8936002)(956004)(83380400001)(66556008)(44832011)(316002)(52116002)(26005)(6666004)(6916009)(2906002)(186003)(16526019)(6512007)(8676002)(6486002)(86362001)(4326008)(1076003)(478600001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hxu0pTOGi0V4OUDIG9TRnHgIpLid9gfh2MVz+U9CeBMfIV+iS8ZLg7h6icwWQqRiNVg9WVebEwpH0Ukd4B3BCobcS1ub4DBbFLO+bTdcbfSBcXDBJT36FCQkU+i3Z20psDhr7xdLN7GMdU2B6nqRhhoHFzzmx9E7zID6q4IYFj/NPOWQAYSlBk79KQcuL9eAX+aeZ8BvXqQksVjGJ3e4bYf4X3LBdZ5WFefCqhmlO8nV2+UbfA8YbJXh0ns7EUGLtySwbQ/X0yJvaax4m10GxWrpDrGeT55fq0l0I5crCDwf2B389ueos6DLfSFpi3A+NF20gD+9ACoRnVpFxDiqmO1hsNDb/qxW0aDNY9OWr6ihmI9ZbvibfcKvpOdL2rQZNgE/Xv6Bh3BTXQ7M1MEf/pgxjLcuaqt3pOrkEws3oFxT/I/Nl3sB33xGYAPZRdZ5z5ETGGWyttebDwQH9/0JiieGwdti4foPc+PsYGEz8exCBOrUu0YEn3zkunafEAk2S2OXYW2NhA4AOxYoKdSYfV/FyWSpa3YSczHOgv0dYkiWUxHJR3xbWeQGMoSIW+0bAo6EFdevU8FXBLxb1ekXGkgUfDV4w3jP1VxkbCeL2+vQC4BzsRvGJhmMQrqehe4gcJgxf2NelfVi0lnz1kyuRg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda2ea5f-cae0-48e5-b54b-08d855699e6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:19.2363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/tav9tsPAq65TuRcsnmLQtUOqqp1blrutLADDR6WlQsvy3/B6jHmsnpRTblMQCwSj3+2o5KvpEXaCKiFBn6ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5368
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It only dumps the first TRB per request, it is not useful if only dump
the first TRB when there are several TRBs per request. We improve it by
dumpping all TRBs per request in this commit.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 2d6dd6896937..d8eb5b1717f8 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1090,6 +1090,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	struct cdns3_request *priv_req;
 	struct cdns3_trb *trb;
+	struct cdns3_trb *link_trb;
 	dma_addr_t trb_dma;
 	u32 togle_pcs = 1;
 	int sg_iter = 0;
@@ -1130,7 +1131,6 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 
 	/* prepare ring */
 	if ((priv_ep->enqueue + num_trb)  >= (priv_ep->num_trbs - 1)) {
-		struct cdns3_trb *link_trb;
 		int doorbell, dma_index;
 		u32 ch_bit = 0;
 
@@ -1266,7 +1266,22 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 	if (priv_dev->dev_ver <= DEV_VER_V2)
 		cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
 
-	trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
+	if (num_trb > 1) {
+		int i = 0;
+
+		while (i < num_trb) {
+			trace_cdns3_prepare_trb(priv_ep, trb + i);
+			if (trb + i == link_trb) {
+				trb = priv_ep->trb_pool;
+				num_trb = num_trb - i;
+				i = 0;
+			} else {
+				i++;
+			}
+		}
+	} else {
+		trace_cdns3_prepare_trb(priv_ep, priv_req->trb);
+	}
 
 	/*
 	 * Memory barrier - Cycle Bit must be set before trb->length  and
-- 
2.17.1

