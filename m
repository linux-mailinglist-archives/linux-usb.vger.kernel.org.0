Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F8F6BE0C5
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 06:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjCQFuS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 01:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCQFuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 01:50:16 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F5B2CFD1
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 22:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhdLkcXQaOpbiChoqOv3nE6ryr/zwBYXczY+d9FNgDijGOc5cwNkuX2Cj7CBrk9shSq2ZyFAMPwkE/vCJoodE8BRvAasSvaoq4ypLU/ZePDizcfJviQDpCHUkVP65ucLwow9MGeniojlPKl43n3XRT8+xryWUti0uf2Wm5uKFJgkx1De9aMeeYHx7S0s4QgUZHc+SuH6d8PgbDGhmZ15989Gp26IDJQCq7GIC0+G20MKiuqPlwcViv1kUO+kOBlJw0q9EIcGo5DI+BpnPDxadYGde3K9Q71LzonLrHZFxkjt2Mxk2p79ppaq911o5rspUIkfwG2MjG+4t5ZJM/4VGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miOILX71lbWlWhBkYPTSuOGLWuulp/7a3EHAggB4vuw=;
 b=Mnbm4H33JKHrDpMdXGMhkx/VWf6hMty2yWIV0T5RaBNsepPFey2q0ZvSsdzV1uV/bd/VvBZLFci+Nr7i8CSp0q6/son6p5+4qHDAx7SRn1V3u7OKSKjYiw6olEHWbG+c49I0abfiyQiwkSOpAuec/yvY1NXeJTpLKkfiCJscr1zyKfE7EXObMXETZmnXjx+PPdzB2Lj8HdDOKkBaWyYTZf3rrblNJUzur8DEbpIwahQ1fKAGLjbZphdut10HwdqLidd7u23oAIDMfqZROPMDLmvbz/KACTGW3NFb+ik8qSpoLu1oJZvlZpxYtDAcVOSzBN0KXpQ7+EK0677F0mI1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miOILX71lbWlWhBkYPTSuOGLWuulp/7a3EHAggB4vuw=;
 b=ByfPIxNN6Yw9DcCbWzRk0PZNnn23N4ZwUVbr9xf8SzRf2a4XRHedXk4cjWoSaxe8GrNNOmnzh3TrPACIIy5slvuQJtW/TcQlljzwM5FYb9UtwkupWVGJn0Wojv+PRDil1vKDT/9zUhi4c+G0iH3kG9SsKAhG5HWUkKEMX8SA9u8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 05:50:03 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 05:50:04 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH RESEND v2 2/2] usb: chipidea: core: fix possible concurrent when switch role
Date:   Fri, 17 Mar 2023 13:52:02 +0800
Message-Id: <20230317055203.2366868-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 75a85215-9fbe-48f2-5daf-08db26ab7492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nacoCReWN5c5SivgvXRE7fwf0V3jxn//RiVWQDbhG7UmzuEIOLD2f8WDVLbLemf9DkTc65FBid67cdTavYPuJT7xqiKkB7wevC0PZcGnS1rrgynLEmeSPKKGzSiC80qX90QeY83bDLHrmkJRQRq7MoM8WCh+3A+gkH+UAaXvQblG0FJ6CFYoMbJPIIhPOgcRT7gU2vHyYn/VWsbExQ9NpqzRQ2xqp8jNENgJ3D5NXLEiGHtvkTd5243R6ma9cGiU0uhbyPjhLY+GOqOy7elvF+BhTsfHjT8tqhW6Z9dNXPSyx29TNBbKsWaV2PPP5LTl9nJwd3R2s40jsdhHm7kGxNf/qVArlrfixRfs6IQLXgJwhBJgzOc2mLQhZLHJ7JacHDaDATnaqgE8wb56T3ofxAIAoEihnwJSEPppeL7XXyIJGPHi+gzZu2a+tUrWsE35EDFfAvZqIQUlELKejbbnZ3FC7Dg3B6JpaooDpWnv01j7Ltex+ncyt4YASwLTWFhaTIZlvrSEAT78/lm32BtpumCk347YBUjng3S30eaqEzPaqIo1wfTAejlsPR3N/+RTws/V6blr4QBpm8XubMJ+o4qmPfbQ4AscGUZNR5SRVGEJ1a5WYiAxEfBZ/VBAGezOYrWiTrw4nnJ0gBxwnYYkYmt8Tk5RNKFHo4gqMaZJjGt6BvgWE3yMoGDoupRB7dO0i9so2BQ36fFSrN1lFDRvGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(8936002)(6486002)(52116002)(66946007)(8676002)(66476007)(66556008)(4326008)(6916009)(186003)(41300700001)(1076003)(6506007)(6512007)(2616005)(36756003)(26005)(2906002)(86362001)(478600001)(316002)(38100700002)(38350700002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLK7T4jnVca4JGvyNHlgTomHvn+NMY9OKLQD5nRNREB++c4wCjkQ0rlC/F2g?=
 =?us-ascii?Q?VSct2b3zUy8ilyJXIjfsGRL6wNChh8cbl8704oKvHv5wT4UjRuhELizg1Xb8?=
 =?us-ascii?Q?5gPJ4HZyi+SW3IscFOesfuEtjBZkfl5AE4pPSBTenPWoulxI6vUO/zMPrPHR?=
 =?us-ascii?Q?72K88acuQB3rr87/2+n1bCpHqcxWtrTHQSWIgjWzmMH2LhimM/74r3fA36vk?=
 =?us-ascii?Q?3xbAI69LGFE41Tc7gdUETlF1biHiS6WNYfobp4BNS0TYTgRLNCN5eYgO4sDG?=
 =?us-ascii?Q?7EYZEVBxLoTDRoflb7pALEqqDvGrfKRiEvDENVdfAKVxI0YDjtVw4ikC4+5y?=
 =?us-ascii?Q?+2RQEGbrubSHfaCliULhqz81JwKjJx31Rk/e/lrpCTOzPnZUCf+zcTmFOYOT?=
 =?us-ascii?Q?LYkXD9gb7NZa/Ft/8b1d5iQ1D6UuxKFXKGLEYV/Ad3nBcyArM50G6nZ5WBmz?=
 =?us-ascii?Q?Za6y8fElosxHeojs/2PBBXFhWfiKDnP/qAP+u0lwHoV8nedigMoYwm7KpU76?=
 =?us-ascii?Q?F8WFa+HeHSHuTGmu358M2oT/amKidgFaPBYa+1NlkL62chlhcgMSeRtm3uU6?=
 =?us-ascii?Q?PEDVH1P6ji3xXJlrAqRaM5WpiaitEqGmPhaOAhD+eMVTtoC60zqtlSMOVQ8H?=
 =?us-ascii?Q?VnCTPUE6Zm0vGwLPEy46ryOnyulVtcMGoG3P5JIgqCIMrR1H5bpbE5U3PiUm?=
 =?us-ascii?Q?w5S/KEXQGZyP3T0ROttOTu0uGAKGSDEWwLbMSLT+KE9O6+SfoTyBB5SRnlM8?=
 =?us-ascii?Q?PzPxxG283kaOZHEwhnRreSwVj7kBkqBlBC8g77DzNNfjaK7b/3OTeVGkdbsS?=
 =?us-ascii?Q?bP/Iu5vquKSP1j+X9YO60qVqeaJTBcQwltKX3mXc/BU6S/+i+j/QbQ18pMjN?=
 =?us-ascii?Q?st/NLbwJUVi2lrML6K1NYcW6wY9/bnzHp1uEYTfYGGWRvf3XNIfziju/xZMn?=
 =?us-ascii?Q?mECDNRga1Xf5zWrfffFMNX1DYInmG5qEvNy5nzfe8QGZOzxFs8w4cbeBptTV?=
 =?us-ascii?Q?Xbc8JqXIYWxnw842hBnPQQMl2gktDvjTdwoZGbtVPaBGWD97bJhsACJNzIPU?=
 =?us-ascii?Q?Nuqq1Y25LGViPtGP53ieGCErr5lp0Drjn0bcbESCiMEzzCk/Q+LacjOz0b+B?=
 =?us-ascii?Q?8sVDPljE6q/bOTKKf1nXoHu00A6UUxzsgVwWqp6/5he84aQUh1r5OW7v/4G9?=
 =?us-ascii?Q?bNWOinZYzZcBnSK2d2rPUSMsxHIh2AdM715/Gc9jgacqsqx8X/npueXxF1ok?=
 =?us-ascii?Q?OqKQlatJ5lDCXbC9LRSnFwlEy7MvgG+Sx5SffSgkkQg4JPghPe0RtHP7hehT?=
 =?us-ascii?Q?0Oe3Yj/wN2iQQHhneYiOzYkTC1KQ9IBNngXwxT5ijyYxRBd9zw26hz2FUh0Z?=
 =?us-ascii?Q?ZmFOQdcBbjx671eNfvw2ADrtQwQn/xV7gvpga+mbY5UyOCSN1vOI7sYxXztY?=
 =?us-ascii?Q?xOLdWwcvD6EqcJ7zm75PYtilpVqQL0J7Z5neONhA2y1hg7pbiWuLuwTMoIoW?=
 =?us-ascii?Q?XrvrwD5qXIbCANd4UemvZr6XRB/hAvft0xjf+yi35h/TUkedhy45JhCzLXeb?=
 =?us-ascii?Q?RkPypxTkUl9hM3JI2zp6+vVz3RKu77eSU/O8quCa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a85215-9fbe-48f2-5daf-08db26ab7492
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 05:50:04.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEyfseEz7HCJUTsMGcFLpsRNdPlICbFEYtjrl90lkJRz2IjYjjk+lUrHGstuJ+QXmpNfClQpiX4ojkiKVb/mrg==
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

