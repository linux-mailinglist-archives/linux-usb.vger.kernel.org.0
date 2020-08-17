Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8292463AD
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 11:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgHQJql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 05:46:41 -0400
Received: from mail-am6eur05on2050.outbound.protection.outlook.com ([40.107.22.50]:21473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726575AbgHQJqe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 05:46:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnNM4OuPwAcSBpjsnXjOlmz1K74rtceugFHbn41DWmqJP9aNW0PoeXZOrDt0o3gPwLIULxSkNPSurCpe0ANSH4MMJzp0YdWeXrYmErJJKUMjryanHnPka3BFEBRKdAL62gRYJs8+/lkxL3cOH2JkYLdm0aU66GLnm/JMlnah+BOAQoVRXZcrWNgIaCdnUNiUyzDJe9c/WgZo8hJn2lLZuo9vXJJwhdJGIxft+2fu0Agdo1QEc9cKdVmajXk3EW5DE4m3o3DfLUlMLEUCeyTdbT/P+uPY3E8xIlQgLCU1+s2vj6XTcei6UatFWmracIs82Je2KrhD1/PFaBZwxcDfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfrFUDPb69L8vfOARLboHH2xUrGOUv0v6vlI3f5Ffdk=;
 b=hn9gkhjx2/8PuY+GQlb7sRDR06bHEE5MWZ4/1Tfx77G9qQfcyIupyMVI3CCyJRTOTwMfuUpgLF99zCFtxatZZk0LedfHYDuEx7mhuXidA4dxRV96yNZecnDuNkY86BFCvkKrewlSME0DFaxO0MZxtSY/iH5K/F+DVHj3qkKjQoOH7NrfeGPFlyHqmDvewjPBj1U7ehWfy4GAsysBz2Zi7FwbI32jyafxV0EMQC2AkyPfdFR63ZMJLYE++3xRbF+9AStEHMHsu3oaskqtWrwEYGhGJs9OhmW2dMy1voo68r7ZD7khS6PPnDMkSzVh0iLnQ9wI4T9cAmHSPESV2fWRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfrFUDPb69L8vfOARLboHH2xUrGOUv0v6vlI3f5Ffdk=;
 b=QcaVdHrq+I89u0KK1jxWtPX2VILcCy4RwSpKcdPRxinMjqWANBq9U/bsm07vZLHOR108dvkQew8++iQJowAe9Ts4jJ3IPv4LM84XE9EcV/95+mnBi0PMwk5alQjOTt0kYmDgGZKGddzwH6o4zAtFq50Bm7hQEOFwmxRdVbhi6x0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.26; Mon, 17 Aug
 2020 09:45:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 09:45:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 3/7] usb: host: xhci-plat: delete the unnecessary code
Date:   Mon, 17 Aug 2020 17:44:36 +0800
Message-Id: <20200817094440.23202-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817094440.23202-1-peter.chen@nxp.com>
References: <20200817094440.23202-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0094.apcprd02.prod.outlook.com (2603:1096:4:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 09:45:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 846b61ac-9792-43ea-decf-08d842925779
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160DE47C1985D46D1D522308B5F0@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2CajCr2frkYRVY3gYLnwN4Bgcun2/1jF1RQ0meN6AZs/GErz1Gye8Wg8ZLu7ln14vgSsMLKuBy3Nul6N9tTAcHMEjwtjvAzLWswG7sX6ImQQLJtndWkZ5TRV1NN+ZpJePSGaWTpxN912VN1F50FKUV3xrnrc6OsolgQP1KV7Gq9V5mmncKOPsMqSWu3Nko5F7NuQeFr2Ai/PsZtXjTD8UUQIs6jOuOMRzFo8+nelKPrNeISXWq7auZONlUSOmP3fp+ctcu5nvaLEP0IOf258Z23WRJ7GUr4l8LUQX6bSZ0lRA30tc2KtVnFxMP3XMBoZeImS1HYIeUtyVAqrw7B6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(6506007)(6666004)(4326008)(66946007)(1076003)(2906002)(16526019)(5660300002)(4744005)(66476007)(52116002)(6512007)(6486002)(66556008)(26005)(186003)(478600001)(83380400001)(8676002)(2616005)(8936002)(956004)(44832011)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5amGFsIgnbvICXBrJyES9KbYZ6YCWCfuwgc4yEmKd16II1jsm0wVRaNeTo4me3i8MHhJTTxzUIUb6ln09Wiq9JXrV7XjryC+QFBj1aI/XwZCPhQ6HtRvyA7k6FM635G0Y5zd8ZcjIUneb+etzUZCQGl2D6wC6DOsGj3+LNgqBI+XGi6Mhq7fPGvQnUXwZzh+WRo+xxdOXegL9NtQggJ7TFvHvipvtyHz9xNhJOjU7Sqrn166rMzQiRc4T8wD34obydcWEqwSS7fvi5wf/zv1mAXkotekj8/AAVYpW96HT35OXpofPrbhq2k7C7PWaanw6Kzf5OmayErGUa09vUw0FCPi4nLsrdMErNlemzaL8cScqX8AiixrgzH7FDa4fKkhheZFlUvNInAczWtYGWTy42fRhi/Ua1J9d75AnqYBup+B8dZdOkC4pkSXr+8TW+w8LmoBSF2vPEiMt6YaL/J7qcKZF0fC+iQF0LSh2w3mTomH6mCQZhoK7+cJcgUf//5lh4mpdkKvsYEDuuPnmTHObiIFhct6Us7OcB2oVirKHtvQuSbln+GSOtw6I3NsNiunEDGzJAcabATWhg5fhdDeO2dCAjC/4iyypX61NQcwaXHaeYQrjgV+2IK4jMrw3rRzUghHqAsvpKwlx+Dc1Jbd/A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846b61ac-9792-43ea-decf-08d842925779
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 09:45:57.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBRpeAnJhBVvn5oX64lCvyF46E/52JsmHK+3GVFwg5OI0EPzt/YstI+NASBSat+X8uzL3NcKdVrZ5C7iBQmQVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
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
index c3ce4d762adf..07ca000a0084 100644
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

