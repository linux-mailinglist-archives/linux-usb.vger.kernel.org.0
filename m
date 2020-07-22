Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE592228F2C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 06:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgGVEaV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 00:30:21 -0400
Received: from mail-eopbgr50083.outbound.protection.outlook.com ([40.107.5.83]:60558
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725843AbgGVEaV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 00:30:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnS6TxRCqVBhn7H8lDy3TYpiNvuz7c3MB77Ccx9TmBEeuMzQJC2+U7YJbj9x3WnmbViD4+ouhqWxVpKF95VO5s1k+V83iBj9ByU3CHNgsF3UYSCAYnVUzGivL0WjP9hYRoACU/+Ia77xwl+oTunPEeZiF74xwo2tE5p/xGwWSlr1t8F7tT1WpnQkXmlGgQUhaxLJMUhCp8Bf21+jg5kYivYbPxTMBUC49kuSVQQZNaRYBmrcEw7d602LIeOApIQgLgUlrbDjo4GqIyeq2wkwsHn/3dLeeaGI2YosEoJ2/beeLuwlMkdf+x086dSew6EQv4mBk8gyDDqMK16GisoCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWpzrfmnH/ReVOMRo2PU200RufZzX8AiTAo/8Bb/GJ4=;
 b=gZBq02cLbRbpXeW4QLhD/TvXiRSxPjzAC+wF0wJo4s0wPxYSVwt5Dll4XIbgEu77R3Uu+rzGeEknEc8+g1z8O/gFwfABM61ZM+GLIeCTAMAJOG5B0brMsb9SMip06vmUIcQ1qeUU5vIWu4n7OFMS/47tPCMfJwCaq0cGK3QU1/PY35gYCYI6R1+jMVdy+TfJJ2T0ek3IoCA1rGaElQcXyGj1I6nCQXjfnvbwL6IaXPy4VFAZqNPo4InxWr7ivYyFVlbCvBueyQ7SSfFQkdZA4OJMfwp1yr+D1/GYEOb3hbxnkTtVmchEJ2MZdL6CWFEw8pshg5Z5e5GBG9VaUX4n/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWpzrfmnH/ReVOMRo2PU200RufZzX8AiTAo/8Bb/GJ4=;
 b=ACHf6X1s2beqio4dhrtEir7h6+Td0qFeiJsRz/q+s8PgdPtQnrk+UjWgAecbSrvaieXeHztN6+EsMt/aExsiNXKILxroaB2/Oi7slWDEUg/eArrIuQWNCl+j9qj7EZH1uWgGr1KF7m2vlG1O743Nhc3ZZ1YtJkVvHKfI6eVDchg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 22 Jul
 2020 04:30:15 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3195.027; Wed, 22 Jul 2020
 04:30:15 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: cdns3: ep0: delete the unnecessary operation
Date:   Wed, 22 Jul 2020 12:29:52 +0800
Message-Id: <20200722042952.8680-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0230.apcprd06.prod.outlook.com
 (2603:1096:4:ac::14) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0230.apcprd06.prod.outlook.com (2603:1096:4:ac::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend Transport; Wed, 22 Jul 2020 04:30:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2cd6db1f-185e-4c19-93c6-08d82df7ee06
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416659AB5CC4F904F7A274BC8B790@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WId8I6FYuJ8tsOCPN7zo+fjDxNt45jSymJPSDSMHbB3SG263GgrwK103SEcUH1Oi52ixbzLo7yvdxfzZYH+qKWjVkJRF3gVqKCc4yIdNQxmvvjV1sW5n7W3S//zRqQxjDbyY5aVelsg/pcXcFHm+/VYbqxx34VHaLvlAhY78UBZ20mHITdbjCgt1GAQsMxlS614eEVAGxwzYc3UM8J8dlztNLcKUsbqe61Mafa1AIxGWD4GNGcpL1z1mf0lD5kjChka0pTOu9ACBKBw2PFSo7ndlCSK3RrVGZIomJTbHK67pBxC20m5xpg7IriLmVisRf1qmGPEGV6ZWUWBFDvDyag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(4326008)(478600001)(8676002)(2906002)(1076003)(6506007)(6512007)(5660300002)(44832011)(83380400001)(956004)(316002)(8936002)(2616005)(36756003)(26005)(6486002)(66556008)(66476007)(66946007)(52116002)(16526019)(6666004)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: A2/+OnYuSb9TPGrBbwiHVM4X0Nd9eAZ2cnT9TZnRPtSRfTJkx/QyzTE5BXxZSP+Vw3ahoxquXAzTT0sY2BSkhjQhBRMrZAaYbsw91Cu0IUvsmLgFVR5WVn9EDp7KfNOzXqFO8BITIYGjGOpgnY2IIItQ95DFPkAP18JDgxwtQzW2lLRsklVSoDhil7cAKWpF1rBcmBPgaIqUegngi6Wt4xPHecvneBo83STypTJtz5w1p0xOP6+JCH4rGn9LFNbABt1DVvINr7LOFYmkNiAdAiKEwjY0Uqt5QszP+Hv6zDbpqApcz8pMJkSF/FolnhSp0leGWEEn91hgbnOAUCzakqMH2GPufsBfw/+G1Gs+hFdlN8iqTzJZ2RAzFVSGFVcNWG0v05TivA+DLC8KLO5JZ6OtaBYNLqxRmgg8PycezbtUrN0Z36VPl7l+vm6sqB1OkbzrDEydeAIcQUfzhwWfdz1OpfCSB/bhiOPj5xkfBDM=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd6db1f-185e-4c19-93c6-08d82df7ee06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 04:30:14.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ui/gAQrgywgXWPOesMMv0Wi7ws3tM0AqB9ZU5nt9x1k8JzbjoyxF4NQFJfhr69qgU/7A4i5P3IZnRNnfvoBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It doesn't need to enable/disable L1 on the fly for EP0 transfer,
we only need to enable L1 after SET_CONFIGURATION.

This code may be introduced by careless.

Cc: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/ep0.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index a2b9af5a80cc..5104414ce243 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -122,8 +122,6 @@ static void cdns3_ep0_complete_setup(struct cdns3_device *priv_dev,
 	priv_dev->ep0_stage = CDNS3_SETUP_STAGE;
 	writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
 	       &priv_dev->regs->ep_cmd);
-
-	cdns3_allow_enable_l1(priv_dev, 1);
 }
 
 /**
@@ -639,7 +637,6 @@ void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, int dir)
 
 	if (priv_dev->wait_for_setup && ep_sts_reg & EP_STS_IOC) {
 		priv_dev->wait_for_setup = 0;
-		cdns3_allow_enable_l1(priv_dev, 0);
 		cdns3_ep0_setup_phase(priv_dev);
 	} else if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP)) {
 		priv_dev->ep0_data_dir = dir;
-- 
2.17.1

