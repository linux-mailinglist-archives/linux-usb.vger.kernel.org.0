Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019716BE0C6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 06:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjCQFuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 01:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCQFuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 01:50:20 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA161ADE1
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 22:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBioN3lsFDOlaW0SVoCR4gK8wGfLEMlL9mxnHAR4spluByJWu7h6D0jS3jCNKRkNJ78Bo6hBTuvqHq/mJHGeIrq8zd1RX21X5Pb54L3zFoVKSdSQpzNgkd32H2tlMLlQAZscgm0xOsOfxog8uZfL+28H4WkVjuIxK1aL/BHMFNKzardi6csXPFDXjiCNeBAvK6ZhJNZeDtSs/mjUW+IAHkGvG6CRiuLjrZNj7k+kYv6v++vK4jL/5GAC0x2NhqoeBpxoQUgiUgfeK+Qi3WCAcQuElUUYxIIEQlXkqfZu+XBG0zt18uKnAG9RwNaDDNLgnSqAGH/JTmJW1OJkCRVQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miOILX71lbWlWhBkYPTSuOGLWuulp/7a3EHAggB4vuw=;
 b=ND8Bh9uFTmqxRDXhhSLlpIy/TaVO6jh0BCfZN4PBPCNzqYivc36p+OnBrGVWKuyoYYfgwsbg3T8OqePPq7deZXEkyt2A45vltwPbglBpZiv4wkuHqvAlQbyKHXQL3Hnxotoyvo+BLU3fakqiC6iPoGYcOFL8rgRRY5cvflkpzkWqQE8hxvBCB3FC49QjaV6R6B++C6czzk8V+BpHjmYpxmGdyCVSlnYCENUvamNUkzLZZ0MfRdmgmeO7usrGYIvXhCS3sRpq7+C8MfVQmmxuGNtEMitjzYjuvJ5Jj9tX1BXjRi1XKMTFMKteDJFhmUI0qiy9bDA0ktUHp8GhU4+zQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miOILX71lbWlWhBkYPTSuOGLWuulp/7a3EHAggB4vuw=;
 b=AV4AzZtXtc2j0uC5NowfiVvQu+oPEtD0RzMoO1X74AzQ79sqcS2UxNH7RAzdH5jx0p7ziU36OmipvMXtG9Ifduq1018FuRO9iCBi14YoE+hg1VZ3sPMizfs5JaouWOuoM79tMrA9xw1f6Bd/ErSDB7XLeDf68RJAJ4/nG+zHez8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 05:50:06 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 05:50:06 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH RESEND v2 2/2] usb: chipidea: core: fix possible concurrent when switch role
Date:   Fri, 17 Mar 2023 13:52:03 +0800
Message-Id: <20230317055203.2366868-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317055203.2366868-1-xu.yang_2@nxp.com>
References: <20230317055203.2366868-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0109.apcprd02.prod.outlook.com
 (2603:1096:4:92::25) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6cd1a6-a549-4fa8-f5cb-08db26ab75f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W5CA26P7bM+EZ7rtC+jPX38y7Vas9Y/xtB0EJo1cLc2sEi98VYByNv6km7QsocqpYs6cqSPsz23wN9U4IXOKb+YJ10lwtdRj88V3YLrwM8BNLdvmgH6bFtKMPTigb/J2l70f12oMBg3Z8KFD0DQknyupSsGJpHLON6XvU5XNB1fJ7kJjLHzq1uoxhEoXMsflFQVOIQrIFFUTU8UyEJGRM47oFXocDeYGPJlmV2CU2QQBqJmTrdwPgbta7THU9wwe4bPO+qlj3Cm3R/lQDkfnXbM9ivYmEc0J9vcUg/p3FZcf5LDISRITyFm73TxTxePVFOlIwtJoB6FYJEkyLY4rwVBFjB2cgm0Mlws3uwgyY4say3s3xpA0DMOoA1U7smnjRs7aU7eiv8TUzylQ7/ggxU6bOxBAaELDK4rkOoXLx9IVxKV1gKIxqsRNsHGumyPPYZABMCTWnFlKSEgrVnFMQbkmujXS26L0xAPrfrM3SR9HpdDc+9uJS1Hld4rxTxJhkEiNmQ2ReD4Jpkr/Y4jc72G6nZ/SMhcr3a3rATXc2nhDHuG4Uca59ahNmEdV2r19mj6EMYFmhsTfILMTlZIPZY1UHXBI+hSZ0EKo61r22VoSNcKAScN1CX0ZPgzCF1Ncz+vwLWyDRGct9VseHQJW8txQXYIkpsq86blnUgve4KIhyzObTDPGzcZ89X8ZvW/Oa825L09UfZahNzhvNz2dog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(8936002)(6486002)(52116002)(66946007)(8676002)(66476007)(6666004)(66556008)(4326008)(6916009)(186003)(41300700001)(1076003)(6506007)(6512007)(2616005)(36756003)(26005)(2906002)(86362001)(478600001)(316002)(38100700002)(38350700002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nUvsofgVJ1KAIC+I3EtuMwb8I2n6HlyCkWrVSgSdkVxyc2ALLotXmoiv/NUU?=
 =?us-ascii?Q?0Q6ITS9MAz848uRtW3rh+Uku/1PIFMmt7Fo+ecg/ClaKcu+hCz3ohlReW75W?=
 =?us-ascii?Q?IZ/1grb6xnpkgqY3SwG7xhxWph5quYwQf89Y8XGiD5CrsCKBFDGONX0ygIA8?=
 =?us-ascii?Q?p2woXPklyK75TqrChI9PRKvYoqbNi+kn5HthiXiM/nFYFCeUFGZIbxmtU2Fa?=
 =?us-ascii?Q?spCsugT+iqJbR0woqNuay2Q6aYzVJ4Pb8rKyjoQUb3S3vocc5fjKrYUs3E3p?=
 =?us-ascii?Q?QX22Sa5chbqO/Rp62ZRqT6LUdf/QOGLe7xyUgvY9t23TTR9u0wwM1mByZUNM?=
 =?us-ascii?Q?oLF1fW2AG4JyUU+wzap0e0f8HQb3BjnEpiZFBKRZpi4dPyx0NdkUuDqxjkeB?=
 =?us-ascii?Q?imnXIrAwKEiAFei4sGSWRXkdj0yISRQk24CyzyP4NmEQxVhx/ze6ot7Lnoco?=
 =?us-ascii?Q?1x9eEvz3vFd7sfkb6cdutJR5ycdMmxvbLS4P+mQzk9jsOQDDykEnhoRpouoJ?=
 =?us-ascii?Q?NPHg0mGFxTf5ogcjeoYr20wGtrJ/0gH1t4ryn4Pt5aqApu4fDvKgfX5FlFve?=
 =?us-ascii?Q?QF4kNd1hV+VTHrR7P4iTbgfl3QNiqHftmTQLQK2mGkZbr3CfCGo0t/N2WvNY?=
 =?us-ascii?Q?Y2SwpstygBhOY/3MH9smBfHw1T4LpnHZU4HvniKwFnGtnGoCC2/LHEKeneiT?=
 =?us-ascii?Q?rBUivC3DYX6xJ4+isc/f68S6i9I1PfMBAzlNNNc3oEsqDMYbSvl4zCQ6eqYz?=
 =?us-ascii?Q?SVol1/kAjEPJ179oR4Sr3YGGK/ZT6ad2HkKwGnGsQnPIRN3DEPAcr8ZLDW/f?=
 =?us-ascii?Q?23Uc99JFuOu/C3UpaUvmsNrtbM7NC5l76HX0ECQTYfaSYSCPEFPQgjyqrYVa?=
 =?us-ascii?Q?00WOyHc9C2oYjuX8c+n1nYomunkRNWZo9J67zEdwCbB74AqwI1KbGG5zUWIF?=
 =?us-ascii?Q?3psbb7m2VzHUH0fFCShoRGLhmsXSCUhrBBAru5OgVedgwxJIpf1UrA+Ag0eI?=
 =?us-ascii?Q?tFMGyC9WyAficGvUdxvj8Ax+0dmroyx5s2TTUbTKtBs1Vy/cqHvyCp8AKxaS?=
 =?us-ascii?Q?d7OTFIjimYbnmhAT79+wCUg68eSqca5gKaJJzKbq1awMyxw/rzyavYDEpang?=
 =?us-ascii?Q?UM7/1lB4DHZD6WMMIsSiK8GaZQNYZnxFa+/ZyY/cS/uBNfUDHKnZdYzXSmz5?=
 =?us-ascii?Q?5Wg08JDpuejmr1ZvTxEElnUdtmkTvaV1H+qJih9zPzM6GD0Hn33EDFs18RyF?=
 =?us-ascii?Q?DpSam1ZnsfbKxOtrJvCDLYQh5yWuzCVb5u0fOYDSdfAlFJS2VmCye8F5VkTa?=
 =?us-ascii?Q?r7+mDvj4xHnZjRw9nSJsz3sx4LUE22QX93Nb9Mry3pvhK+YOkjzGal3TXfHB?=
 =?us-ascii?Q?i1WzHyUhGFWT0wWTBllddLJmdYYliBFROzYOJQbmEeVUol47xcmuxUwAYQiF?=
 =?us-ascii?Q?CrrNceO5iyImCwo4yKdwIo1Q5AmAIa1EuRzWiPR/zAh4qCbyfGlvFnuPdGXa?=
 =?us-ascii?Q?E8Jiq1FCDH2dm32iSeQEC5r7eIqSxKkkbkOaHGBaz4TzxUSP5X2yt4rlyJn6?=
 =?us-ascii?Q?AwRur4oUz7JbUJe5tmeVwzYQJSgAu3hNaI2IIRUS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6cd1a6-a549-4fa8-f5cb-08db26ab75f7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 05:50:06.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4EbdJl6uYCMcFJ4y+ELGdX92bep2e8e5GPM3bOyd5yCmrr8aO1IDZu1i8vc53kFAECpyPBZmBZ5bSBtFgUvOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
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
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
changes since v1:
- modify description for mutex member
- wrap role variable in ci_handle_id_switch() too
---
 drivers/usb/chipidea/ci.h   | 2 ++
 drivers/usb/chipidea/core.c | 8 +++++++-
 drivers/usb/chipidea/otg.c  | 5 ++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 005c67cb3afb..f210b7489fd5 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -208,6 +208,7 @@ struct hw_bank {
  * @in_lpm: if the core in low power mode
  * @wakeup_int: if wakeup interrupt occur
  * @rev: The revision number for controller
+ * @mutex: protect code from concorrent running when doing role switch
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
index eae4bf865a8e..d1d252c87e4f 100644
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
index 622c3b68aa1e..f5490f2a5b6b 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -167,8 +167,10 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *ci)
 
 void ci_handle_id_switch(struct ci_hdrc *ci)
 {
-	enum ci_role role = ci_otg_role(ci);
+	enum ci_role role;
 
+	mutex_lock(&ci->mutex);
+	role = ci_otg_role(ci);
 	if (role != ci->role) {
 		dev_dbg(ci->dev, "switching from %s to %s\n",
 			ci_role(ci)->name, ci->roles[role]->name);
@@ -198,6 +200,7 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 		if (role == CI_ROLE_GADGET)
 			ci_handle_vbus_change(ci);
 	}
+	mutex_unlock(&ci->mutex);
 }
 /**
  * ci_otg_work - perform otg (vbus/id) event handle
-- 
2.34.1

