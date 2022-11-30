Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512F063CF8C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 08:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiK3HGQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 02:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbiK3HGO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 02:06:14 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883C657B60
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 23:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6Vu9H1vFtWfEt7sNDJ8uMxvkZdh3I1kpKZCG2e6fiYs9/KLgKOEnaSVoeAA7F+xDtLj3y0G+x9+nHPq9WKxadG99oRpkhc7/YhNsgpMF4s4BPxZEWRMW5FPTmsFOmBDOpN/UiISLBwqPPCEWepTD1qnPlV8z2PxM4YBThza9cNrHXpO3Q9kaR2hfUC+bvBczOh50SYjsFvSRxTXjp97Q+l9XG1FqSlWodj7er6hyLveMfrrxJFulWNoMHSeSY4VSezOeHExpjjgjZ673wIj3XKQpqLQ7iO4qdxdp+w/yuJIpIztcUtfcqHHt28qerCN7wDoQPP1207dD1D64OGCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIfnEz0Zqxy1QKN3BzRuCU1uA+1WIduBpXV4Jq/HwZM=;
 b=YQAqo36buoE3dhCn/oKgnU1Vnb+U70kzER5XBz5QMsQf6+VnNqF3mWjVlFASbFE7kAdQzhweHPac0+xnoHpAfZAPhvdxgmTImUjknZIbLulLdRFieDCOUWuLp6TqvQfG3vIoWLZe2z4j6qYVhtfonyZInIdm9FIHMj8I9lXSOTHAiZIR626iDC4uFTICmW1ZUhc7qCPpoN9gFLbwt9eajo1JQbwuvzNm2oco63krzMjeHNpQqNsc7trkCcDdufwPC/dN7PGpVaucR9tHaSpW01CmstILClB79fihVodGxevC37tdVIgKMdwRw9Z2/VpKp3cJn0hO+uUTcQhpZmOb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIfnEz0Zqxy1QKN3BzRuCU1uA+1WIduBpXV4Jq/HwZM=;
 b=r5u/xy+mbbl3wJm2euzDexGb35bMAGqms8l2MBWQomvwbSFp1qrHS3UX4JM+OeL7Y3ikztdRanZdBVbljabnFaV+Km1J4WVEt0vRSx/IV39RUfHPG0eSBRAMWg1dg9LChgXvYbzoV2u4jHwzsKXVQibQDBMd7tI3pu6jzieoT2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 07:06:11 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 07:06:11 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 2/3] usb: chipidea: core: fix possible concurrent when switch role
Date:   Wed, 30 Nov 2022 15:06:31 +0800
Message-Id: <20221130070631.2443398-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d943ef-07c4-4b30-ffd3-08dad2a15c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKQGHGMDFeOW6N3Q7pPjKoW3et194BRXqfaB2rSS79sxJfOSi03E558auBaPTN4XEwok1eJPT0rwAcZT388xA8knp3BgGs/foOQJ5imjy+iYPRSF+J631tiVtmWE549QTeuK0YH+ICfG5dX0IXFcxmtnC7Hky+0vetRT3GCyn4us0gIihShZ3G2wdZol+t9gAuLiyM5VZidfl/smmEK8dm5auDMNF/kfO75k6DqeIIXIVpxbLbbZ3V0Izi7+on44wNuwLob5mvMzdnGHLc6QkahJmev/0l2ndaqIrwp3nyzJnr1R9kXrYJX/t90/1p2KLOuyKWhgEyq7cOpAa1auGlt76gBAcuVp8MrXZVH1KhN6zqrHFX4pabRh8hxLO/c9EHVVDXG8U4pS5LVWvE9CYy8maK3FvmjiVWH1eu6gr89PVmRY3He56sJpvd87FmXYYAOdemZw4VUM233CODMqN1A4bs7g4Hlq5ImVezo1tVCvMMKFUeEjsA3MOTBva4uvlFLM9tln0WvrsWHdV1UNgMaqfcHp71WAsue2ENc58HHCOXCRxx/OiauxSzEqfcbPgip/zElCMbD+NxhtW2M5PJ+ZIZM4QpwCXGh71WrBrtpvhrWX7/PVvmKqBi24rUtQvSHrIS40CLwyAtWozOUiw8xc831brK/5M26NU8Qm91Iu8tVNH5IFM26MotvF5LQ5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(8936002)(5660300002)(36756003)(186003)(66476007)(6916009)(41300700001)(4326008)(66556008)(316002)(8676002)(38100700002)(83380400001)(2616005)(26005)(6512007)(86362001)(478600001)(6486002)(66946007)(52116002)(1076003)(38350700002)(6666004)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6NGiBhtuJE5ccfxsN5BIVn1n0yaaPaP5wbFS4KuhK2Ro0N7mKoOiKhQ95b3e?=
 =?us-ascii?Q?oaxtE7BzPGjaaxtMjsXrw1E1HyVxQ9S+Txd5zKnU5IXEHepNfZIm+3pMDyNG?=
 =?us-ascii?Q?IL8J7e9NsS/WJaE2DqCcf6P7XKBr5RApNoJR6coV/Uaql4xtvfX3CbSDXyN1?=
 =?us-ascii?Q?shDFcBAR0C+oCGroh6EyOeL5HgOio9iDcBkcMHTd0ewCS/1120xcZFd4IiPd?=
 =?us-ascii?Q?IO/CXXC810DAf8KvYXd4tqHH0Fgak95daw5bJMZUexU/HU/74SUkziAA9MzL?=
 =?us-ascii?Q?0SLc4qERgeJyi8MWB1nXNvQa6yS1ZACKEqp2jkF9XcQUyCcriBePTLzFITdm?=
 =?us-ascii?Q?xnpgsmaRNNOZ2qknZVqDbcIwx5Rd5qkHHykdh3ESIIRSnygMMXOAQAXo7J+D?=
 =?us-ascii?Q?WiH3mX1EBoR58ebSZz7jnbnw9NG7oVw34q8x3pxoBFEehkaXsYr416PJBvKa?=
 =?us-ascii?Q?89QeCLTSrNGGIuxjU9kYfUvRQrmThVZKTrrnZe1+hCIRsRpU+yNmPOQSYFTQ?=
 =?us-ascii?Q?C1a7RpyB4ss0vU3usxoBSRcmAUscnvBAM7gTGtdVvGnTvW7m643Qsws8hzwx?=
 =?us-ascii?Q?REIlhtzjsewoOn6/NFXuJBFf0eswjmKpZH69xSHUnuJUflGX9LqrxkI7qrdR?=
 =?us-ascii?Q?oz8INk3al2h731jBKvNzC+2QO4tm/jplfSz2G1b+uIze70/pW3qmyyNz7FU2?=
 =?us-ascii?Q?PZOneVypPX8mB9Qe2Cf5C9SBg185vt4nFBlvdXrEdCAZTvXIgwVg8Nmzf4h7?=
 =?us-ascii?Q?nD+EpnhvEIPvgR3FjBIcbOiVNBEnWLzX2EnFYnRu9gHTMdfJ6uXkJMjbyD48?=
 =?us-ascii?Q?/XsDCMV4VJ3/0gNMwqZSNLhTXe/uvgH30TgkPb4DEBOCoG7O2NtrHjdgO39R?=
 =?us-ascii?Q?r0kIvN40v8yROvat3s44t2BKU0Hvgetqt50v8JCBqdVm0wvS7LLsabJi4T/E?=
 =?us-ascii?Q?ddyPewmzzC6ge5xhdVobq+bYn9M3Z5JI1ezXEO7tIwR9j453GX/Jbac295tS?=
 =?us-ascii?Q?NVk7/NTW6Ny9EZCVB2Zz9WpFeToP9MgpLdYrGLi36jLoXPhoxpAuHMFx4ZwK?=
 =?us-ascii?Q?DyE6KBCCOch9S0J+6pSrcEeHnuylzEQVqARE5gyatMdb70fBkAUnNvWAqbf3?=
 =?us-ascii?Q?0CEmyM47B6IMCfUAJ088x8ysq6waq9b5K2DbOLUdpsdl80et+uugfEVi6zLd?=
 =?us-ascii?Q?3penCLK7t586/8RoeWGt6KM8mLzLWuQ5/ix8ifBe/KtdvivJwGxzXZVSaxCC?=
 =?us-ascii?Q?zCwUv1Zp8LueXdPAK9BIjBK8ffRoqlQTgTo+tVdUTjTUCxS/CnDPAEWN4ou8?=
 =?us-ascii?Q?KxkEjUNp7MQE+yRp5PlzMdB8pDKEI+C6ZTRl4KTIxUdPSf9ddbmqBhnEoVva?=
 =?us-ascii?Q?feeZOxxxr/hpmyQEumNMbibeukhyDEeYRD8lwWnfiERqv52YyFOae6lzSDtm?=
 =?us-ascii?Q?G0I9PwK7/oLFYBLb8KiD1o998BsXggDOVGbJdqqraKFOPnTgpmzOnvCItCd8?=
 =?us-ascii?Q?+UMeoTJhSKqfMzfhdsEDcfLcACXdc27ju40zAEgUOrbXjOHjEUCiW1ftBr9L?=
 =?us-ascii?Q?jE/R3Y6KNRk/Hu8T2hok0xzpj8OK7hMqAM0NqXF4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d943ef-07c4-4b30-ffd3-08dad2a15c93
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 07:06:11.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIVgcOvAtxZwZxl8iL3+1L0da8ng9KJdzcIQVMipShgWdNUownjFjkcopw/EW3glEFJIR7FyJr86KrbOBLVnog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The user may call role_store() when driver is handling
ci_handle_id_switch() which is triggerred by otg event or power lost
event. Unfortunately, the controller may go into chaos in this case.
Fix this by protecting it with mutex lock.

Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci.h   | 2 ++
 drivers/usb/chipidea/core.c | 8 +++++++-
 drivers/usb/chipidea/otg.c  | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 005c67cb3afb..3424ec0d0b20 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -208,6 +208,7 @@ struct hw_bank {
  * @in_lpm: if the core in low power mode
  * @wakeup_int: if wakeup interrupt occur
  * @rev: The revision number for controller
+ * @mutex: protect code from concorrent running
  */
 struct ci_hdrc {
 	struct device			*dev;
@@ -260,6 +261,7 @@ struct ci_hdrc {
 	bool				in_lpm;
 	bool				wakeup_int;
 	enum ci_revision		rev;
+	struct mutex                    mutex;
 };
 
 static inline struct ci_role_driver *ci_role(struct ci_hdrc *ci)
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index fcb175b22188..d7efde30d59f 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -987,8 +987,12 @@ static ssize_t role_store(struct device *dev,
 	if (role == CI_ROLE_END)
 		return -EINVAL;
 
-	if (role == ci->role)
+	mutex_lock(&ci->mutex);
+
+	if (role == ci->role) {
+		mutex_unlock(&ci->mutex);
 		return n;
+	}
 
 	pm_runtime_get_sync(dev);
 	disable_irq(ci->irq);
@@ -998,6 +1002,7 @@ static ssize_t role_store(struct device *dev,
 		ci_handle_vbus_change(ci);
 	enable_irq(ci->irq);
 	pm_runtime_put_sync(dev);
+	mutex_unlock(&ci->mutex);
 
 	return (ret == 0) ? n : ret;
 }
@@ -1033,6 +1038,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&ci->lock);
+	mutex_init(&ci->mutex);
 	ci->dev = dev;
 	ci->platdata = dev_get_platdata(dev);
 	ci->imx28_write_fix = !!(ci->platdata->flags &
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 622c3b68aa1e..60a3648461e2 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -169,6 +169,7 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 {
 	enum ci_role role = ci_otg_role(ci);
 
+	mutex_lock(&ci->mutex);
 	if (role != ci->role) {
 		dev_dbg(ci->dev, "switching from %s to %s\n",
 			ci_role(ci)->name, ci->roles[role]->name);
@@ -198,6 +199,7 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 		if (role == CI_ROLE_GADGET)
 			ci_handle_vbus_change(ci);
 	}
+	mutex_unlock(&ci->mutex);
 }
 /**
  * ci_otg_work - perform otg (vbus/id) event handle
-- 
2.34.1

