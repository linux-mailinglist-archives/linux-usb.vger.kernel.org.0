Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1F463D027
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 09:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbiK3IMU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 03:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234406AbiK3IMS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 03:12:18 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C3E286CB
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 00:12:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9YuiaXChafKxrOISaP6NtEGaTcqgxxKBD18693VCB1BL2cBtIZ6pjio9tawDub3sxGsaGiqHKwvDb3FdN7CMFICcQFIWYcFNus4wFk4PneUA0a+wK85LVkoiZRzI8OEbZ9jewGrO2VvP1LOUhnwefe/IOAhhDKGqR9E88mYY92k7rVCmCF1IbeVXW2gc2tD+mVox2eQdMBSgEk89WecSYBumGpP3JwKBQthDNbV6zzkfj0LzUQEhONhd1d5V6DRbPWgd6GNl0KKhXA94KhpfMYcfPvW30v1PlalmRlYzU+N/nAgOFvYZ9EU5R+Gh+LgluZwV/7fh2ngEvMgsw5wvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXBPszWCd9nEPdrCi1uLWZsK0c2BbN5D7tkGFOJG+LQ=;
 b=NkP7aljBDajuN/Kr3pYanccC3y1wjSFvsmt7fx4122YyqrLv9wEL7ijU5ZE88C2H0+G2/lq5dkeb89dYBu7Cg9hWaGhGnIZRw82bc2OicpDMWezWNxJnS0fFyPNBxwv7UlnAJA9Hr8vJP5ge79CR7xjkDIVKf8KHQAa0Ku4tna4CPZcp6vGUJTfu7fZoDcx1CsoQc44bJRE2h6QapeJvYRB1f3dyRCnDjCl0yazvanlIRcpwCpcn//ICK5ucyvyDqosJTJiVMC2nwwAhRtBZ8B9vh2XARWraMq+s7640DHofD4MK2458gPeo4dJVQ2U8wUHtoD35NN8mLMqXzjpnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXBPszWCd9nEPdrCi1uLWZsK0c2BbN5D7tkGFOJG+LQ=;
 b=PsidLj+UPtLqVo8nFtue/GINVMpg89K+mvptZU7tLlOHs/ALoxScK6Gdcnv7dcwH5nRyABPxcWP9Q5pzjt1vm0NsnQH/jwAC2jl3MrhdPQjN1me4YaEU6iiOwsrSQ8Tm3bYSDKRCMh09iGGnUKl9b6KoFwuAA/lckq5NGwPLcyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by DB8PR04MB6890.eurprd04.prod.outlook.com (2603:10a6:10:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 08:12:13 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 08:12:13 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 2/3] usb: chipidea: core: fix possible concurrent when switch role
Date:   Wed, 30 Nov 2022 16:12:30 +0800
Message-Id: <20221130081231.3127369-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130081231.3127369-1-xu.yang_2@nxp.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|DB8PR04MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: b73469ed-5a25-47a1-185a-08dad2aa962c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETgdDkTOtk/R2VNAtG3xKBZ2pNZiUbIvhyzFotEDE1lXxcTaCXnxQdY05v8fN7jSTJKiVwpNcqfVgPs5vChYUCYNaWoBhie52aSEwIS2ZfFK9KOZxSQ0FWWRWlmHJae5sptxbuzVYN9ySlwdZ8dAGtbz+aRNTbQWfhiHJDzoIoIP8pa+RJ2oiBdPuGBZaTJlndPxvMdDXTVe2U+6mFaSApmxTzCHxPYVNJVk/w9hxq8JtceZ+9BJHR4LpGucQGxcAgB6PLekxztalQ64TM/RznLHabJ1l2nJ58gFz5wJkidPbDNegOt78srm27g7n1AhrNQtuj6iwFgdQOZGpwTIEZRcL9EwV6NnY60/oRE43i2bMoXj/6meMTmNpAc0HpO9IbCHy2zqR8dd9FpM/yim2vTzGx5oZfjhPKRWdejwdlWfQob8CeHdXynD1UqY12hTH7KOiqZglp7dqzI58orutna/23NupStMoIzOxEfHdngnQdiiXWoYdoGT1RSND1Mi6UmhPWdRBm2UZOhcVccbdj5S2eCpUFgK2DXpbG3+wEskKgQBH3gpVKSQaIWE0+2Z1HPEQWL+qNEJiU2oSjH6tKvq+DtS12dSFbzo8A9xJmuTqggSlt3LFoVnNCXLrjzx8yKxWEZd9FzWlq8A3+Ke+QddqXr1UOidNovMRiCA4X3LKssD7GVOtzEgjXHmhIXP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199015)(2616005)(186003)(1076003)(6486002)(316002)(6916009)(86362001)(36756003)(38100700002)(83380400001)(6666004)(38350700002)(52116002)(6512007)(26005)(6506007)(478600001)(41300700001)(2906002)(8676002)(66556008)(8936002)(5660300002)(66476007)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ix4Ofo1kUiHe8tJPULpHYyPc/TqaYasecf5TcNq3m10kIRR+KK0/D/ZGIhW?=
 =?us-ascii?Q?0oAWWV38j9KmQBc3dV+7/B/m4gBdMuj/cgE7cpe2tQtgaM2xzpoCEedPGcGp?=
 =?us-ascii?Q?VzMDByr3WNuwfB6voVyoNGu9k58ZZqpju+2gzTW+f/lTHsFR3yEhTQ2Dfkxd?=
 =?us-ascii?Q?W4xYBY/MAtF4LEe6XvVFp4XtxPb998dKFYSCnYuaedVA5+ggydnRG6Uu966t?=
 =?us-ascii?Q?qLfDjdVPsrSf3jjEWLoetS9+P7gqdB/Ju8qAN/W6iWpqDsUhkawtf0Q5qEnW?=
 =?us-ascii?Q?on+ACj4xGjGwz5hWTXUVqK5TXKZBtoG4eIUnGPT5BsRohE/ZYNLtruZxAYqO?=
 =?us-ascii?Q?BIXoEj9ipB0pmRUlJfqYOqXxbN68HNwLMpopkCTEyrGFLKrTdc3CtagRvn2X?=
 =?us-ascii?Q?4BaS3Q67xlk9FIBxJed9Y4G06Z/StgFkz4lWSxIxu6mt7xN96D3DoQPg6fgk?=
 =?us-ascii?Q?6Bf8+h+oo2SCLJ84tKVBQTQM9YyprPBsz04RO2gMquegOAmuFAucjuFHBdRg?=
 =?us-ascii?Q?2F8lrBHx6/APIvTeZ638v2WuvI3mli/375N3wSJMTzg1EKiFlIs9VvC3oetV?=
 =?us-ascii?Q?s5ifByNDxNOK+9FtKLIwO1O0bPhGa/zDlX1BxYFafFdZH6abavP56Wp3bWRw?=
 =?us-ascii?Q?cjuv4FD/AEChO+MS6LT+WwXhqnDC2Q7YZIxrxHWpTLgN9zCnwBzvpB0lbUG5?=
 =?us-ascii?Q?Fa1m5XB6pV56xHLsauP84wV0ljiRK1NJZTAzKt3Ph6plEO8lkKNFPWCC4LIO?=
 =?us-ascii?Q?zSXxYvqsAMrc437JDIKb+BlBCY1xo0GuGYgfcbGG1xZPaTZtTuNW/ogyphVc?=
 =?us-ascii?Q?Y2yij4/CWG2I7Ife6ZPkR/R8W2ipVcFMhgqP8KnwLYuJr+XD7GFfrF0P9/BS?=
 =?us-ascii?Q?yR5T68u5S1DMcKqv/fGVZOh9jSMVCJkYk+Os/XJ+aB71XYfkhI6y8mqEFmRz?=
 =?us-ascii?Q?pLDsgwnC4vj38A35gGdFIioZccSl9SMUGnXLZMqlrG0RrZgeanZkQviqWnEv?=
 =?us-ascii?Q?Itqv3C2umdK67uOj2QAw2o50WFP7uOakdY8Q+EyqAHBn9mrcOP3zHRZse+em?=
 =?us-ascii?Q?NOqKam4ommOA+tVpIttvex+XCd8WT/AUpr9scDWTvS7qKAlTnzmi4vamOTKZ?=
 =?us-ascii?Q?80OPW/HSJGW1m+U6VrlyUyNO+QmF5TXS7oDM9VQrlNdxzC8btYmgg8PaFQEU?=
 =?us-ascii?Q?rkJP9QAiGIfxNzCwoWlFOfXFKkK01lNUHWPLZ8exXxGIaw4uS/AAD6fdhvbP?=
 =?us-ascii?Q?C1g9Hwn4CWQ5UGFlAd5KAFCSJ0VfEddq2Gz0CxXwKYo4tdnP7rA3ZK07J5u4?=
 =?us-ascii?Q?OspxgvezbzH7GhgfDydHoGGS+6XkjMfRls+cWzBFPuW9WfxiE3RfGojfRtJR?=
 =?us-ascii?Q?ZlzBZ3GFkw23KIvKlL9qSREUxrqd4jd2jH7ewngGAGLZVghsuUzV0GBK/eNC?=
 =?us-ascii?Q?knn7PfWaBD3Ur/s9218Fz5A/CnuggD+bGgho1X+pODrYDG+9b9UI9ThXGpWi?=
 =?us-ascii?Q?Qu5kMwtsdLGCnMiDdgyIcKTlvZHcXHIxo0kOWDpAZcKQnZCQklk96E1tsMeq?=
 =?us-ascii?Q?USHjjqKroRBnZ1CFcXwRj1waGMIcy+i02sNbnvPE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73469ed-5a25-47a1-185a-08dad2aa962c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 08:12:13.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MKC595bYVt2lqt2njZjbxZ2k146gHCo7pMH4CwddkyzZVZfupjopMk33YnubYaqXA3X93yV5idYPGbCQ9TlxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6890
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

