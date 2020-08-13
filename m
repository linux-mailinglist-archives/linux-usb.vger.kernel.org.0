Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78C72432E1
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHMDiw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:38:52 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726567AbgHMDiw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:38:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbwXhUJdz19wJUAalew5vXEHI0g98W3L1KwOJ9/Erx1GkpR+93/R7wQd205aRsrl0S2nS6LZ1reneC6HqBEAtwPQ5m36bi6ixFTjSqLk13fNxROqeaBJnfW5lIxYOlpXnIFIbSpJK5KL086fG23Soh9JI2JnVvTZDz7bT9dl6ZLmfcNmGEnnsEnFJPBsjz4QB2hrWnY53sPxL/EAUkUPLn1hqNxkto2/pLaNlUXZwsaRNNLua+ummJ1Pf370EGinDwdpbj/y4QAsNvjWp+twLNB+V7XkCijO+ASrp9q7udgpjtgZqG4x0PARlcDLg9ktXQEbWuEVzp8td60JDnNr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfrFUDPb69L8vfOARLboHH2xUrGOUv0v6vlI3f5Ffdk=;
 b=Tj7PgFszcySISYYuBkuMpP6gZHFyhlziMjdMpjHbV+aPQ6B3Reau0MR+pqD6LJL57V3oompBNAX2qu6IkK5GKZrPJCoLVQoDHNVC5l+cV/UDn7B0odcaMX4Xn0TVUTem4KE2mDA3PYNC+Ql4NgYEytH9VdRvG60TNs3PaW+uKNjGAa0LmzsnLA4IESNFB9Bxwh1hbM1dQJVlVOOFmcci6w8OligDmkxejmr2yloOMoR+5UukkSjkr6CGE6CModQggkvwwnEnXWYpVZf81JbJrJM8bAPQFjQPHln2GjCNRF3rcCiFVK4vbt0lS1vSEJ2n4nUF4x2mnU282oycm4yK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfrFUDPb69L8vfOARLboHH2xUrGOUv0v6vlI3f5Ffdk=;
 b=eBnX2HbzN1Ua0PYbOJJbW3l+I+JbG92h4QIoIC0mY/Csxn4l3dvX8cezT5YvNhx9Mix1qZo9EmizKoot7bJPfCv8bA8j5BjGZHBvb4FhcQBqCKfqy7Kt2oMOcin1ntQNKHLgADYWXX7b9aLaZzHaThQ03X8gwPXUNQKHLxngUEU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:49 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:49 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 3/7] usb: host: xhci-plat: delete the unnecessary code
Date:   Thu, 13 Aug 2020 11:37:37 +0800
Message-Id: <20200813033741.13982-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813033741.13982-1-peter.chen@nxp.com>
References: <20200813033741.13982-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 863f36a2-6bf4-4c73-6c9f-08d83f3a6415
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB36543346D7D81A2EC76C4E778B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(4744005)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863f36a2-6bf4-4c73-6c9f-08d83f3a6415
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:49.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/SwrHlR+qCK0VLF+NClFriNii9MyQKPpandu51zLwcqn36G7jnzpqaeP413s5PBuztvNt2diUvStmldB2M+rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
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

