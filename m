Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205D01B9054
	for <lists+linux-usb@lfdr.de>; Sun, 26 Apr 2020 15:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgDZNHu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Apr 2020 09:07:50 -0400
Received: from mail-eopbgr70079.outbound.protection.outlook.com ([40.107.7.79]:38793
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725876AbgDZNHt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 09:07:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ird3wEMYGmB234QFH83wwQ1uJkRW0TXuo1SCx92mcEg2wv+gDtEGzjq0iU0FTO5xiWoLG/Vw2NtFJ762+ibsj4G+TcOs83SMiGwJY9R5CckUqXWz5znb4c8MA5UAkukR5Oi/vJSYip4OwxPpGnzxr6OhSXobF0BeUEID0gSbdc/qIgMWhUdJifTrHbQZHJZXYUdFF6HLekm1dLC+qtwMLwziWtxINT0aixEARPAlR9oN4Pz1WwQSGhO2R4fCSc7bpRdqWdaw01RKeuoPFXPowbvJTVix0xYyS7TqWg/IblnB/L1EbQjaLOIP4GgZ12FpEZvcdJb7I3ZOixWE98w3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7neTIEE9UXLna1XNYZoS5CRYs41wuxYap+H1JLHotKM=;
 b=B3aTYCfQa+jTE6EcO+EkMSmmZe56J6uPaLr53fSMz4+gcIIJXRkTAnFEQmDUefg87Dga79PC1xqc7xBKxRXiwBqdA7PwhTFfXOIyJ6XrY7/CWh0RQGv8Pf1h9d2mn7vUyDyWlhunIMMyliFwMUR4hkujLXipqCZpQRHvC6HipZpSMG3SmbWr5GnFO/klFSW9Dl0JnVknvr2L71SR2NzTQ0yuerUiRljULhtZV1Uge+CopyVJI1mZb//e022b03F81AMhnqeVXwUnV7nDfNg+lEjKDcChTxnp6hd1v4rIZ2MBvklPmM9zmXtRTguP8s5DU18mlLaFivluuVOLb/aK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7neTIEE9UXLna1XNYZoS5CRYs41wuxYap+H1JLHotKM=;
 b=MV/Ceeua48n1RqIYnaEpHME5qsoP6BWncmmS9FpK5VMB3gG3I4fEu5k77D/51Im69/5LpxDc0Nfl5vWfTeLUU08CblY2fsZPHTdo3TIV/4f+jDP3DXA2TujOeiidk61Thw6cJe2J+iJKJOQZnq+3lIay2OV/GQpVex+OnNZFmTM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7029.eurprd04.prod.outlook.com (2603:10a6:20b:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Sun, 26 Apr
 2020 13:07:45 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%7]) with mapi id 15.20.2937.023; Sun, 26 Apr 2020
 13:07:45 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Date:   Sun, 26 Apr 2020 21:07:51 +0800
Message-Id: <20200426130751.32556-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Sun, 26 Apr 2020 13:07:42 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 077875b8-6d3c-4b53-8368-08d7e9e2cf50
X-MS-TrafficTypeDiagnostic: AM7PR04MB7029:|AM7PR04MB7029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7029FF2A2E6437461EC87DB28BAE0@AM7PR04MB7029.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03853D523D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6486002)(86362001)(316002)(26005)(6512007)(8936002)(81156014)(1076003)(5660300002)(36756003)(6666004)(16526019)(2616005)(956004)(44832011)(2906002)(8676002)(186003)(66946007)(66476007)(66556008)(6916009)(52116002)(6506007)(478600001)(4326008);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtyGZ+XHtPF4dNGbQb2fPJi9wT+OAAVZBDp8YIGiKmhQsJq91fx6dkhcW/yvNdCyxno2jijDDM+H2d18C2xIVl8TLPVJzgaRAmVpluaNzOZuHQjl1I0+uWuBn7qYq7EtCx/HGrUxlYkUF3IA+yHRTEOX6wpY2YyMUrKSlYwZlPCksHgDJZRjCcPy8JKsFpv8F4Prbq1eIVNdUlfZyt/mqlc7WWiocUTRJTbDTmRek4gvL9XREdgW9+pKLAWNsRVo6Q9lT0G+X8Jl3UrZXkWyDbvsQIyYYfiviwutXxwxqlbE98d7IRiwojKJk10CbBUV6CxYpIa3X/YaWlfzaYFoqRiwar+Fv9uaOdF59YQYxvA3wUJfNsznKhpUbmSbODHPSx6/hbIo1egwn60Cck+5RSrbh2z1qQdLYpWFxjMx9hwV4qDUvJtWfgfUQO3JQq0C
X-MS-Exchange-AntiSpam-MessageData: jFDLiqV3G6hE5XprkuhA1EYy32r21yDRPXUGyzy9tkAJpBt1sPbX/sEj8sEnpcfzfU/D3Cb+qF7UFkrAjr1pho2VsPw6KS95MWAQrxpaFVUV9t+Ddyi+GHnoElVTBN78UPiK6Yl2iutUQ8hwNseex0caudzYGM0Biti3FncIP0LXxZAEi5UEJB8aR0vrIXnuw6DVbJwrNfsdMwWmieT1gPMW8xVWquBpTeYQgZO03SKhsNSz5TVbfyr0PnsxY6cOZssXrbsCGG42Q8RyimPYZhRVgZy+MquW0mDmyBzlsovh3VPi5bqbdK1I8OwisYwOkL3JfroMi4iTVGYzGOCXSZQwWlok4dMmBWP4P1I2L+uDph8BEvvAvAMDQk1+57O6VRGubJNdeCiuT745MyoSTwFvOAxwC1BXG6m8Eq43iVI4mFMqz9ZdDh8cWW5IKBU/hWuzUUk3tAuQ4SbJuPIjQnfkB3x/EfPXQ5IvnqZK6932HvHg8Hb3A7qRK8fv4EJ7ZKCh2jwn5sOo8S+WLKGrwftqT4UpEmXxgBpgpf23vSyxLO209pbk4wDU4JyP7jeLADfv7RiXVKFwuNEbgyXk+/Z2JU490mFqOzLXacFM8to9YaQHlvKNzfrvb4moSIfcEQH6UKwk1glu0RiV+hsvhj5SZZzSCs76K6ePiFjiyfKpYC12QDuFBhmAIqBwWtzy4/u9j4p9mflQZfg5pqUjLrAzmWEwJAuQ1cWiyt3l0OldX12gG10ZdAWlpPUnbAzp9EKQw35wVyCX4ernmByFxjR438dbzy0pBv7KdBN6s44=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077875b8-6d3c-4b53-8368-08d7e9e2cf50
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 13:07:44.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/7UnuQgSmZA69cDeHM1ntsrkhGCFXE+Q6sjiRGyywPJepI4osBFUzuCGltOMzXneGJkEyWxgQgbLJ7h0LbN9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7029
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Each setup stage will prepare status stage at cdns3_ep0_setup_phase,
it doesn't need to add extra status stage for test mode handling,
otherwise, the controller can't enter the test mode. Through the Lecroy
bus analyzer log, the controller will always wait status stage
even it is prepared by software later than the test mode is set
by software. If we comment out the status stage at cdns3_ep0_setup_phase,
the controller will not enter test mode even the test mode is set
beforehand.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/ep0.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index e71240b386b4..82645a2a0f52 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -332,13 +332,6 @@ static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev,
 		case TEST_K:
 		case TEST_SE0_NAK:
 		case TEST_PACKET:
-			cdns3_ep0_complete_setup(priv_dev, 0, 1);
-			/**
-			 *  Little delay to give the controller some time
-			 * for sending status stage.
-			 * This time should be less then 3ms.
-			 */
-			mdelay(1);
 			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
 					       USB_CMD_STMODE |
 					       USB_STS_TMODE_SEL(tmode - 1));
-- 
2.17.1

