Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD9F6BE11A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 07:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCQGN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 02:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjCQGN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 02:13:57 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A07615C9B
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 23:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xb4wsQLFZnrYMtF8TKbjxlGLyjqY5IGwFNy54VEGg9/fcQVNt9M4VpBKB156GQPztPT1jJVdPjQKzWmMUb9N1sYLRHgEi6NQeU04bwy5woOilyp6mhwN19EzYvn1FBJEVdLncW7LOg0Jr58qv4lgAkaZA/X/ElKRpQ3dHdQWcOAiIGs/+GGCC6tKY8etilPIH6ToFNZj/PFgJPpR41a6kqy0kkixZ0mIGGownFvzuVC50VYxNHGqsEgxDGqxK+l+loGjSw36sN3/JPZGkvpul4cRVOytaebZVMISx32kwGy4iomgiBOPYB0Hy4JTlbur2OsRWUEAUHHWHz6Tuy6FZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXKwHk+doV4seaYidYmL+DfOUvNFJ6zK2SudNbXQk64=;
 b=JFZuJ4DKtjJnt4NkTOPzd4TK360RovQjm64d84Mqwap1cZmZbhEbJy9dh+5jE4RUptE/SdiftUbe2DfF2jcoskzWTi9uClPUVgnu6vPzwcXLfD4sldfortsiKM+aDlpUni73yzx0+jwyld89mtOjaSwvFhs9VlUwXil9MxlGeI6EE0qSXSSWu1PAd4JbSEbWq3kKj8cpfu3HahMP6Z4+0ZDsMxg3HA5rZX3Wv9X0WPbOsTp4YuEN3eLsxu5qloMA1rvCulCEyDvFfCWN0g7hJSBVBdy6KgXY0KjCElNC7ENrDaQeLDEllPdrAlZjW22gedPaSgW/94srYq6eNV4OOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXKwHk+doV4seaYidYmL+DfOUvNFJ6zK2SudNbXQk64=;
 b=nU/rXp6mkxsu8cTHqJlDfNfjXsm9llQvRRPXpK36yn8SEqx2/O4mknEnEpfE8L6BVTh5Kh8p+/Ygk2kIzmFlK0BzsrQ8ACkqkCi9jzwTiVJOkFpmcPfTsZNAy4vwfkWifI2YvKb3R0D0a9/cRn0YOlLHClBvhk2xVnv+vs4IB4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.31; Fri, 17 Mar 2023 06:13:51 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 06:13:52 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v3 2/2] usb: chipidea: core: fix possible concurrent when switch role
Date:   Fri, 17 Mar 2023 14:15:16 +0800
Message-Id: <20230317061516.2451728-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317061516.2451728-1-xu.yang_2@nxp.com>
References: <20230317061516.2451728-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: c04aa84d-f7b1-4dbe-4e20-08db26aec7a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhpQFkCIQtAcsHFwyVCKtn6JmHmqAMt5xYrulGg1i3idSPLW+ZGVKYraTLA1NOotszBlhF5Y34Gkbh4RtkBLNu0C2k9UX0VhZv8guoXPpM2SasEAO4w4V7W5em+Bap3b7vGT0+XSjfLQTVYkJh7v0rfVR7v7Q9utPVNUzK0BqJi3PqY4o0PTK8thULf7mus3iR5eqH8/o6dZgD0Yf9jtMJ3s0IUwSu0bp+DBkVtIzZqpjb/4Uof7IoyMKzhdCCMTEfNhNoNNxNoKKCE2G9yjQEO2aoFxgvJbk/w02+crdc1AtyGpBtvh+BeCSdAPdHpGSuQM1Zc/V9vIQLROi8Lbct+GspV/xyUOzdLFHiSAXg0lzRjZJdJkWQkxuOB4HpQKMgSI6jeleqCVc5hogtbF9esJHZTpn+Eb5rsvst3KayWAxHfmhz/QB6M/nK32qTPjQ8JRvjXLUwcWcPKMVjokmNZmxNfL5jXqklv1uu43LI3Kcl+jZJNHBnK+AoKqPCTmADnrSD2Y19po/+OPNHCUFwpITWjFZJvJDKRHRCDveaVgnHcoQ6vWOF0A+x01Q066sQo37b/75f+tAG56hhiG/UO0GZhJwftM2FukJ9dfuQVdWH8fsZ2LIv6jPBMe6PZptOX5HUouYrKC9BWHjkeJLOHmbpnsDHA0/XNy7DHObHFaYzVHdOTiC3VKYlS/q9icJkHbt6tKUUpZM9LCI7SKWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(38350700002)(38100700002)(86362001)(36756003)(2906002)(4326008)(41300700001)(5660300002)(8936002)(6916009)(1076003)(6512007)(186003)(26005)(2616005)(83380400001)(316002)(6506007)(66556008)(6486002)(8676002)(66946007)(6666004)(52116002)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRrFzOv7IVYnEzuAwtjmF/jaEWJgZncBv2zBz59HWibW8XIGZSJCsdR24ZsM?=
 =?us-ascii?Q?HAFNr4LoRiXF0Ld91YjrinwxpJ2qprSrDzvt/VmYjR6ASi2RJxApO8m7rdqZ?=
 =?us-ascii?Q?etYsbLIsFwmQo/R10/f+AUrMI0jMcQrvgF67dqYB58fFswtpuWaMA832FmU6?=
 =?us-ascii?Q?KH4S1A1BJEf9dJGf47Oy/DLl0VzN2KmBzReffRMPbntbv65oIaBPFyWRTFYc?=
 =?us-ascii?Q?klUF9L4sL98YuNgKkd74OaXLm9D8DuY2t6VpbedzDY0KO4MNvnJ6H8rinFyL?=
 =?us-ascii?Q?cI8tC6f+YRhvnPg/pPNdsK5DYW8CyPXoDapTZKlSXq/v6jq3ihBt4s2h2QME?=
 =?us-ascii?Q?wf2nb40rh4RPkbwSyaKLKIa0nestSVDmctj/aNT4xOfJLO96Kg/uiYxqIxpU?=
 =?us-ascii?Q?Fr2ZgbKBiqwRv3RmVYh175EuaQUgfyhNPA26cxA3XWsaHnzvN0hWcXbysEEM?=
 =?us-ascii?Q?o/lE4X/PEgJNc4+7c3lv9ucg5w4P4XtkSwYyHmIY1GMTy94slQ3r+OnthZgX?=
 =?us-ascii?Q?tSY3h330DYrY9ALk+P444VlQxHy5myKERaxiBvJR/A1U7tGCkjj17s/nUxwA?=
 =?us-ascii?Q?K6vLhUMjsXiAgprqCrh5SBgb1sFwFDG+ctcG2arkRdd5OVcurJI6TnqjT8Xn?=
 =?us-ascii?Q?0+cVa5NtyAOmvG1mbC+QCmxOPqBl/OuN6zxzWIOHW1RHT75YCFg7uxavg3kj?=
 =?us-ascii?Q?a/6AxgMS3qNzYk9ir54yiUt+n+h1LE36DpvwZHjOYxEP8nMqfFSpvaBez7XG?=
 =?us-ascii?Q?P4DZUQJdulwunweqGCz9J6olPJSOMNIkZvg4nvd+T9FpkHsTfCZqqxS9Nbii?=
 =?us-ascii?Q?qv4b+ZdCBk8AGQBF8Fz09rWaVuT4fodKvzwKyq4K9fMQqyzRVHgQpaKrGKb8?=
 =?us-ascii?Q?vNyMsaVo7EhXqhHbitQ0kcou+h4TcK171/rE0+VIDUgIcfAX/kBb+fzuBH1O?=
 =?us-ascii?Q?8jjp8ENPthVrvx3GR4sb9bw0cBeyvy6ftOfF61ETVRU0Xc/oTclIgbELZ+q8?=
 =?us-ascii?Q?12W+rHCIxpcXtCXUpxTiizUdiBl2Kf/Fu/dhg88T0n4jzc4I/U335yIYW+tu?=
 =?us-ascii?Q?hEik26N/rl/p6iFAw5agyZC35kvMJqrPTzoGkSYGkeztmbxgU4OFi7uqMPkZ?=
 =?us-ascii?Q?nGNjK/WdAN21bDwcpxVtKl4HWgQR8q0EGbvEwFzHFMCZvscnLWOwOK/Co+p3?=
 =?us-ascii?Q?4tRCRusan7jnnMVILlv2EBiCNL6QVNTMAHlOTyyoaQQ3EOpEyOnWKd/u1NOA?=
 =?us-ascii?Q?AEnmk7Nrx009znAe5EWHpUteMHKSGzUkUEZm1za6tIBQ6HyAKVfqCuYI8s/6?=
 =?us-ascii?Q?NLoPXQyRsf9ntezBi0EQw9iWDd1Os8LG8XGEyoJ9Sh9hNwu43+zDEWbKBGSg?=
 =?us-ascii?Q?AQRspf0GP8y3UkfmAo+49XrHtpTz0Y8U4+XulebGmSFRQkoMPqjs7KVS3BRK?=
 =?us-ascii?Q?XMnfaRqBMVAJSPGsxQ/iYMwOC1ehmvkvPUz5EroADPEh44Bow5Z/bjeYbiiC?=
 =?us-ascii?Q?k5mf/Pk9RxYndgREz6CeQeFtFUmj68+fKkW+gFMAGpRzRvtrldfe0C072xLI?=
 =?us-ascii?Q?1LUXAA6pNf7CcapsrkN2MvW09fmzOo3VBkFtbKIQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04aa84d-f7b1-4dbe-4e20-08db26aec7a4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 06:13:52.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSAWnxNr5NgWZ+Bcqh8gnUQ++NuM5W7qqg+t6S2Dbj3xDacf5AytbXkdedTdEZaZNryY6L8cEFKP1teC3EYZ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366
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
changes since v2:
- add acked-by tag
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

