Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531E5646997
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 08:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiLHHSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 02:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLHHR7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 02:17:59 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3CB958F
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 23:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTzifOygoXWHUmJRHhMMEkoiHFfstvHDsfXV83vtt9yu7/+q7+pxni/0dlV/HYatHzIliLyYziVef0hoBTP0BATo52rCqAUIYVmrHyv0V18qs3MoEJ/4AxlAkymcjq/w1hDb3RrAO+rh8t1Kd9nKTep1wrlkI4pPWIhnjBw+P6hPwX+SeYoLl6OYZW6wQK53dLoU7Ty3MsZ/M6JyoWmmzc9XEwjuv21GBn7+fedDgXIRXgI/YO5G3UfENXZQz5eAj/KI1fkz1XeAOqzYWefQQqp/4cvz62oz3E7pvaqyloYu3j4JBYaA63qBTbVugiUyuhIRgZSDEGuArMKnbkCT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwi3ne7bgyVEAQF05jIdHnMRBAz8m5wqe3TE+iMAiII=;
 b=MNAXcwwMKkKCKY4Qp0GEJp4F9lLuD81E8tumYSk6OxYMJrYX9AItL46MRUX0aEjDNIidNzT3vZ77vWkxBBmMHmDbpxi/1RywGMqPeAYNA7tqdZR8KYiygGXZAzs26aZELzBNAiII2k62hnKo99YmSlKSkFzOD/nJnWDJZPInxQOaVfh+W5DqB67axBDcP26FwsMTumIvZUKQWQSYUxFET/jnP8OJwX1WxsKNYX6MnAUuGXAuUSqm2JpFddhYi1d4rjD+joM+q/6gwouBnxMiaW6JYfDZN6HHxAmnQLi3dcpLF4mCnfHPk80pGoXK6GF2xE0MtIIsBMy4b+rFjma57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwi3ne7bgyVEAQF05jIdHnMRBAz8m5wqe3TE+iMAiII=;
 b=ESH3RWiw9VerypJNCay2PWtm2qfL4tOzGS2napto8HyTa45UwSUeZjj0H8X26CDwddKPGePzanr0d/Exb7uD8Ziy4/VLvtupdLBPpDoTMvQJpZTCiIQ8M9TE4Zln4hkinYzFuYFKLl8MlifqpYmmWdMWqHhNzrLcTzXZ9bFhyTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by AM8PR04MB7763.eurprd04.prod.outlook.com (2603:10a6:20b:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Thu, 8 Dec
 2022 07:17:55 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 07:17:55 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: typec: tcpci: Request IRQ with IRQF_SHARED
Date:   Thu,  8 Dec 2022 15:16:48 +0800
Message-Id: <20221208071648.2379254-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|AM8PR04MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b4436b-b496-4d2c-1b54-08dad8ec537a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCrhu8PCbH22LJ//p2N72g5shpDO70dZ0oDG82zp5xcUaXkzd4oK2UNlsSvX15wIEV7TIFJS4d6fBLWn14J/WW4o0Ucx5oUxSwbDX/qQoCJNVUFkx74uTQ6P4FLe4hZnaE/AHgQscNTpjkHsaw/Kla44m5pt1SgO7JFPuoRa+YVnDXXfxBH6bUc3tpmdjNym4XP+W8+GnFmQ7qiiY9yiMC2oMkoMOnxZhw1OThoEoMEzROKz+63AA+qYkLHkGqiHJFsHG2EGqI3TJfLjWXeYa66vGhzbWLR6vpnkluR+8+vcka2hT3oaWQnWB8h04Krw9MBa5vzCog0ZN/ZizMSa3+5cLdB1udu3R7pWKMZ582s5ABJUwMOb/kFBhdtcY51M6FWiP1iJ1jIUiD2W31dP5pZEt89A8UOLqWe3gzHifUAkSb0i/kiEeKyIpizW5BHKi43qqQ0Th017e7/3AxQG84RxIdqVjIT4O298SvK40qMgxO5gDu++lups2M2eCk0bt6jz8DurahqGfzZb5W2GuPTxOb8axXwpSzinlN2W/hpcwb03DXMGGRu3y4jF+hn6cL1V/qpvJfjHYd8ShYxO/ZLUi1ArFFTltYSsKRkB5+oFL7LciK3zfgyx+/K8jS7hGWzVd57A5a253ZHSjlsPcFef8BBFCkj/KPIsGZWzA/JgVzp2XZB4H5wxM95Yjl9/3vxKal0W6ScOg0crgOHZZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(86362001)(66476007)(36756003)(186003)(41300700001)(66946007)(1076003)(66556008)(5660300002)(52116002)(8936002)(6506007)(2616005)(478600001)(6486002)(316002)(6666004)(6512007)(38100700002)(38350700002)(4326008)(4744005)(26005)(8676002)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJFAAHpVq9thiqc+jAWi2IGIOPmUULrhBj9VRhi3k3e9wAQoVmXlSaCdgO2c?=
 =?us-ascii?Q?n42nuL9L1atvOK53MWYigeLoeyGS1qyRQXyUBy6DW890YKpsNGabriX1xZIU?=
 =?us-ascii?Q?lgIeJoCy+FS5ZAo8oWRGUI0vVgDSLaa9YDwmeLsMJRBFb+tNWsCDp4hR7Xzg?=
 =?us-ascii?Q?haJRdyH+wBU8cc2kKq7TBvrXzoGwv1Eti0JzxA4DDnHvbsbdN6xya0gR/py2?=
 =?us-ascii?Q?qRoAVkWsFAy6sClJ/g4QoJHxAtMwpOsksnKZ98tDjq46JYoO6mqDYTxNnA7W?=
 =?us-ascii?Q?MsMp9KIYsBerfs9dmkI8PyNW35FmrQcTZb0DGE99gQ9FlpobnbSLc6BX3h/M?=
 =?us-ascii?Q?RgWR8gOd8DE7GoKXexnaNXPouzAPAmdA4hyESLOmvCszUIiobhosrK5YSaWY?=
 =?us-ascii?Q?WpAVS1FiHLC639gD9AktG0aljQVSjuHCGXlJXYBPjzxYYXxltg7eBFanrDwc?=
 =?us-ascii?Q?6RV9ec7BM45vfqaN07aqveTlWA4Dhwg6XUFjvulgKgGf2IbyVLXqGqnYLTfe?=
 =?us-ascii?Q?qZiTDDwVNW122oZRhmPV3xSWcuo/KJS/amyYksn2BfJfrXhVqn/zn5PrL5ML?=
 =?us-ascii?Q?DVmBHCbjwKgLqQt2EC133rwhSt2vsKyINbmEm0eeMB1XnfwFYh+LEY9ThRJw?=
 =?us-ascii?Q?NRzrjFKwWkMRS4/naUwMMe3tId+HzZ1zilD7s7sqra1G2gMF55dTlvN2U1fP?=
 =?us-ascii?Q?fHNsWVvk7+IwyDtTmADqAHKukRHxZ/SKAn/iZfWyDh13yN7qwEwgus5q5wfZ?=
 =?us-ascii?Q?8TCSvxiG3yFbMsA2wFcjRYdLcAKmpPAT1yffxP66XRQF0EzNvvT7kw4kFNr5?=
 =?us-ascii?Q?xXe2zJ5OuOtsMLKjDOyAD7AFZpwEemGk9wLUQ2g1Uc6xnrKcYt3ibRSFffGS?=
 =?us-ascii?Q?swcBjmfSreUZj5BOENT/nNqojl3Ma/Z+OGXCNNgE3VFvgBnCKN0K+OHiyy2m?=
 =?us-ascii?Q?2xcQ75QN+ObfnDoHTGC6coxXFJwuLq7YP81+5aETXav2aGR92Rq2GWErtV2t?=
 =?us-ascii?Q?V089uJ0t+Wl6a27hzpeeA0Q9jXo23sidswvfFt1+5ftc05UJz2h1URcL18Lp?=
 =?us-ascii?Q?rrlp2s+o/9NZgn7ducimProrbrKmyNfieFe7iTLH2sJT7FODwh8mcKX7kbSL?=
 =?us-ascii?Q?JVbYYUkl6uyoLUEsENGOZHvicWHxST5J1HyUw2VmcKKxvFJE5hcSWXtI0wu+?=
 =?us-ascii?Q?y4rVdFei5/ZkDFbJzuFXGohWziWsTnmZZil3LGfHpuSVJI1P5DKQrvS8arCI?=
 =?us-ascii?Q?nlkHW68u8ScjV2SVemH2goBq+dKDylwXdQruzMN3zsBm8KeSFwtubQQa7Yoe?=
 =?us-ascii?Q?jOtN/ZHfR2b9n3RkJocLjdvJpk3ARbfSeIGRH8cufG+I0LcWEyaq5VY1cPjB?=
 =?us-ascii?Q?CFEIXSPjt4NV9/hrkFDS4aARH4Bj79gbUM5sdFp1jE9ydgjq+zBDxl6/oWCs?=
 =?us-ascii?Q?NEhGLAU9W4dIVDEW3WESs8im++XvuNzNwNGiWH6nJyf+sbVf+UnBk8BRlt/V?=
 =?us-ascii?Q?2TcODzjn6E+2whSYvkP7za+tw+/xbkMGBDGISmp12x4iT0F4d5gAu64N0u7O?=
 =?us-ascii?Q?3b4t/2pjOhAmWK07llfbjJGnwd6+8XoqDbnlExiU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4436b-b496-4d2c-1b54-08dad8ec537a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 07:17:55.4801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gecQQpKtMXnZ/f+wn8O7pJb3scdTcrOkqVxw9NRcTlpeUtqFZjNN/UfPOB539+mYWIhpO7LBdH59+Xjk2njGYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7763
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Under resource constraints, this interrupt may use other interrupt line
or this interrupt line may be shared with other devices as long as they
meet the sharing requirements. Besides, This irq flag will not cause other
side effect if tcpci driver is the only user. So a kindly wish to add this
flag.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index fe781a38dc82..223a1de4fb1d 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -838,7 +838,7 @@ static int tcpci_probe(struct i2c_client *client)
 
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
-					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					dev_name(&client->dev), chip);
 	if (err < 0) {
 		tcpci_unregister_port(chip->tcpci);
-- 
2.34.1

