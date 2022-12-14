Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC67C64C23A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 03:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbiLNCXf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 21:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237105AbiLNCX2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 21:23:28 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2089.outbound.protection.outlook.com [40.107.14.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EC9BF52
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 18:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH9nWJArc6xqYfnTdkIfPYouBVMUKJwoE4yyIEmODaeijhcMXqyEmIT5Te5/1GPRjK3PSr6QJJDzp7lrAdF/hLrMUExhDTqSKZ9ZtDBBg7X5/bbJoDveeVSrTRw+Bl4jSXkaFVR+iyU1XGyDqig9anCYYuQcNNAPZc1z8Ix3EKMFzSa7W6gH6OiC1ZAxZbQEehjcIY4ZTSya+xVGLnkY+QHhgo3DfjTl/UMsY2uISkliXXTttLy8MYvSN2cNxodyGZF+Z9n0I87+nCelKlz45+eoN+H4GJxScc16Oj5GxIF6PTPtY1DjHdBWi47nLp5UWQN8a5FEFFjClkesIJB8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4l6JIQQLiG1lv1XWrOPe59S2wrFATjOIh3MRBae5ZQ=;
 b=QeklXLiuPmW25ibRGPrH7YBkLznXmTHBYpZmwbZ+PY3cd/NHDbo44Wj0cVuiWud/8085hgWjtJA9x924CSpE563V0xPOz+Cp27PVofWXetCt9hO5nYwaSaJrQ6gS3m68c7sbA8uhTAHfQfZQYOUxkKuiYFBbUfRi2F+ND8gSrTtRbQcMmqmn4A+azHDiTuNOmdI4nOvZzCcagVWEf41bxuDiLjiL0CKZKP2PVeEgKVvuV/HYcNyesFtVDab0sJ0AALLql9nnNMSGQB0kS0faD66Kibb7/ohmvBaVpvSqlmkUZTscwzWr0qzJ8e0q/4sr/sn0Fq/yaykCSSxCloAa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4l6JIQQLiG1lv1XWrOPe59S2wrFATjOIh3MRBae5ZQ=;
 b=j5lBJuCWKs3guosOBIg+zwB3gNPHGnhIidL4HUSLL+BAoDYCE9RNKWb48aeplaDwcm4rRv9sOfArArQYaXwqOt1yTPuDVZCQB/TNtEgvIppBQh6bTknLhENdHwlYEc/u6KKj/Rm8XyRBLD9xTH9fTdbiXtGsLbT3J5fqIMvB4Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by PAXPR04MB9447.eurprd04.prod.outlook.com (2603:10a6:102:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 02:23:23 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 02:23:23 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2] usb: typec: tcpci: Request IRQ with IRQF_SHARED
Date:   Wed, 14 Dec 2022 10:23:34 +0800
Message-Id: <20221214022334.2520677-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|PAXPR04MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: df5ce69c-4fec-491d-fd27-08dadd7a2c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRa21ttb6eXOclp6pKvV+Hlc05qItCHMyYxw2O0uoNAP5VodxFdPKNzmxhoX0DT7Ak1rfQUbIECoP55nzZZvbVHF7bu2xedwOTzVX6gkQYQpy2F7kmrzixiT5+mzW+vUnx4VYiz02z3XtTS8Zo3kHKpHfnSrInVdAToM2lGUmJYkpKy2dxRkYcx7SD1cB0MW3HftJ2oIlfISeJvprDh+7JXobQTPPIhwZX8jCoIimjabr1gXZFmucjKu/WBSArB2MKKn9oLiCbBRHcqDI+8XsSvT/GUPDjZ+8ywdLrVxuQ9WKPTUKaJ6nrZ2D+XdoiIsSCbsKtyi769vljKLW4fNWekoZs3M2PtzPIbjfgXayKdCoIExNwaoSJ/LLm0bzuC4qFki3cg+BG7PD/eKxNss2wI5rRkCQyZgCSbz3MFiO1fPYonHvhZOKk/47BWj2lPdJLbaw/vTqqBuT1lx4EWGal1ajD62NLOZejcHw2XrbWxkIWWORZ2U8QrQ86iZ6lxEcl1Xa7NSWQFgdVCQE+MM8rFIvSDAoOt5Cyqay3lWrrnIbSWinPj8aySzFF09I+wmWcOK423oUkhN1orAVCxZOcdN6eKf8lS+wiY2oqk4ZgRM0DWM3f/FklaHsK4nF9Gx4nUfjjhW9ZnyoIpoI/387wYKUfDN0cqoEiI0SOrAbuM2CK2dYKmPIvPlNXmVmj5TJPTOIgemIIX9C0dQPDpYrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(38100700002)(316002)(86362001)(66946007)(38350700002)(8676002)(4326008)(186003)(66556008)(2616005)(478600001)(5660300002)(66476007)(41300700001)(1076003)(8936002)(6506007)(83380400001)(6666004)(26005)(2906002)(52116002)(6512007)(6486002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbYmsk5W9jrFn1tfd22aWVoFYhMEGw2WE9zn5FkuTAfh4D4Ti1KTgd77Wld1?=
 =?us-ascii?Q?2YDAhzi5aqqKzj2dM3aynMEqYXXAqy0K8GhvR89pMrNsTeTZ9+rh3MoIdzZ/?=
 =?us-ascii?Q?BFExOC4q/zBlo1u1QySbpDHty4hCTy4QC/wRQh+cEkE1+LEZqVB9jHHaQVrF?=
 =?us-ascii?Q?sd3vlmOdTGj+zYw2PcBMK0+6HExMMiuLZ8kMVl15dRLnH7I4NuRWlZoEMWqk?=
 =?us-ascii?Q?S3gqv8aDq5FHBdBc0x82giy3quX+qHfLOdwX6oqj4Ne/C0H1Quy2FcPnKnTt?=
 =?us-ascii?Q?h4iiqrNGWvWN6gZ6P1XC7kMbFYAH5rz6aIZ0oj8Y6i7nueCw+u33QPVEP/e1?=
 =?us-ascii?Q?SkgIB9vMIr30ETIT0UnNoMXAWTXijzdB/oA8yozINu0MVuEpxMLV+WheXhep?=
 =?us-ascii?Q?7AmvrBoyJWw0pHAV5ZWtyVpzCMqBbSIZpX6inRG9F5HEQp8XXExesYnjQrhp?=
 =?us-ascii?Q?Do7bQaI0frdQfuBMdadLI2eaVaSBcQLT94JUiXV6LML83F0b5UP5l6wXaef3?=
 =?us-ascii?Q?TmoIJmGzXJT+A+7wtezgKQrWDUpXGOUt+aqexitlF/Zf4JtgdVP15tNFdo0C?=
 =?us-ascii?Q?sPGzwZElwPMWMvcxrlLd0h25v20yCPMgBPM/PgBYrOSUOlGOMs3JdKbtlY1t?=
 =?us-ascii?Q?/9fd751nDjJH79DGurqCTJP8K5ouFM7UgiQAq3n2BooDBwRf7PEvPli9NH+h?=
 =?us-ascii?Q?+s1ty+55mGVVN5jP31fUQ6d1Tt6intESwhJcK+7DIPyORYDN7bnBYRAsPHIJ?=
 =?us-ascii?Q?dqTj5hIbCyVyTkLqZecQ71fn9ZVMfYdJzYFuolOCbn8zBSmwMr0Z1Yps3z4l?=
 =?us-ascii?Q?YtHjP0YB/FmR4aurI9OdjXTMzzbXfvHlx1uv0mlCDeWYd5Ev1lZscWuKlI8T?=
 =?us-ascii?Q?19XR7KwrfMRUfmcmM7mO5Y6K5JZbYhofNqfaEniVH2cSlirY7y/P8+FVqOLx?=
 =?us-ascii?Q?hEayNPYvQnTyoU+1HuoDCq0SYkcWUH8QRi2dB713SuxrSHmoPBcpPgeIDkl3?=
 =?us-ascii?Q?5WbNKf3cEQ9tqIs1zn/MtMRaHRPnqjGJWqcM1zxc73583qwOD1c2geQD20qg?=
 =?us-ascii?Q?lqqnHp2NWgNFBs4KiyHD/tlO1pBWmdu1jtX48AWSAJCWHHtjn0WSYj8N0IgS?=
 =?us-ascii?Q?uLOFs9DzRg9O4xL8qiRus1FN+KpC1I6b9mxNODE056O9tvMwEY/db0Z1bEV1?=
 =?us-ascii?Q?s9luvsHBljTMwkf4Nte7zNLm9RDP/jZsb5NkfY15y09BFC/spRKP9QpT04FN?=
 =?us-ascii?Q?CgfVn/JQJOPJ6H6LYYOSTL5mpbCs9uLbs38X61yefRdrdn7HyEDYNVRRGxSI?=
 =?us-ascii?Q?1H40hbirAHnl6wU5TFG1SqCa07StHdacFsY4yA870llzbUHlrLSKlurD9pkw?=
 =?us-ascii?Q?VxTqve2J8ZdyWXESFhnZinzuz3jFbxQMiCw8DPuSz0WdhglD1/ufXLUsLVTz?=
 =?us-ascii?Q?o4df1ZHIoL7KlfLjJhcXWy6hnvKxkZZ7PC/06zDwQ70WskaxlA6LVaSq/FZE?=
 =?us-ascii?Q?bnnhbD2UNwe4DFFRDKp0dmNCXTRjaOLhfbZiZNFTaTPjuWR/AwgD9KYFQCAJ?=
 =?us-ascii?Q?w03rkeKrnJ3xZFQFem3HnVcsySletsQuMiFvzOwb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5ce69c-4fec-491d-fd27-08dadd7a2c9f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 02:23:23.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G17xxnj1Zk40JSJfyG129hukaX/MSXsKPSAfFUU3zcdgDadnI+y4hXgNZUZbCf9VxevS0aKgVRo53pwk6KFxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9447
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
side effect if tcpci driver is the only user.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- return IRQ_NONE if the interrupt doesn't belong to this device
---
 drivers/usb/typec/tcpm/tcpci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index fe781a38dc82..c7796511695d 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -33,6 +33,7 @@ struct tcpci {
 	struct tcpm_port *port;
 
 	struct regmap *regmap;
+	unsigned int alert_mask;
 
 	bool controls_vbus;
 
@@ -632,6 +633,9 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 		if (ret < 0)
 			return ret;
 	}
+
+	tcpci->alert_mask = reg;
+
 	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
 }
 
@@ -715,7 +719,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	else if (status & TCPC_ALERT_TX_FAILED)
 		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
 
-	return IRQ_HANDLED;
+	return IRQ_RETVAL(status & tcpci->alert_mask);
 }
 EXPORT_SYMBOL_GPL(tcpci_irq);
 
@@ -838,7 +842,7 @@ static int tcpci_probe(struct i2c_client *client)
 
 	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 					_tcpci_irq,
-					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 					dev_name(&client->dev), chip);
 	if (err < 0) {
 		tcpci_unregister_port(chip->tcpci);
-- 
2.34.1

