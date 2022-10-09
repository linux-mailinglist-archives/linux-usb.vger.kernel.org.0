Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED485F8A0E
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiJIIGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiJIIGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:15 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B98D2FFEB
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqDFo0voNQw5/k7xnAleeZR09lqMykO3ZvRrjduwrLRjM7NCGf0XM3NzwmsQODGEY90slC47d4mHViVj3gFRlS4foWJZ36b4td8vzM7pgjVEqXvoY6duWuE1bHY3rTn/qvcVbTIhryFqTWm9EwB5H8/nrcw1+xrh2e6yKqTLaF1bTAMp1Y7sfhLSp6nvBaSspZk1lp9Q+LXL5z7rhRo9H8dGg1uQumGUhIz+HHPKr2wAMNG8ec8cxcAdkW/g1rGr/eczdWotQADdeqKiEJYjyIMPntw7VdMPp6+CvKcjkLjnX/x07C4aoZJJcvwVnvBv79DUSkvrQgXsMfukQ5DQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCtjZxxKjbCngipJwo8F6OiLiJtC/ljGNOxNCdkU7eo=;
 b=TUaMVDXKejl5QncGYyhPLBAXjtV+es6+5hMjEb2BdmadXGmIdXXZ4J1hjOAmfUGQEuM+gdGzsx0zqIwXA0ke3gud1Ze8AyWnMwFTFPpCdUAvDQkBTgm2SJ+KPrsY66f7U03QzZMiRGgtWwNk6nKukEYVgcg5rsm4m/148TgKM4OYfJk/brXGSbXaJnFRv/MiO4BiV+8A+qBZukCrgWxPK2k4sAZoHCQD4CmDvlc2Up0JUS6D7RSS6EYKnslEcnIkdjxT6KWUA6lm+GEfPEK/NDowv/bbtmkm0G6hBarpoklNrrXV0rjQdkcijbXaYrzMw1w3d6+aQtz+hBSrDDzBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCtjZxxKjbCngipJwo8F6OiLiJtC/ljGNOxNCdkU7eo=;
 b=d3JKSDcTwFThnRL0idyt955G1F63wLxvzm06tiWeEDWU4tho5wJKwgf8b8ElinEta+4aEIP51vI38XHrCtmFqD1xohteIb5NR928bIsloYJW2nQu5vdnu6B6kRichJZlVLrSRVS49JNunmGLganpjUHaGMTbzloVBDDTErqFuKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:11 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:11 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/8] usb: chipidea: core: handle suspend/resume for each role
Date:   Mon, 10 Oct 2022 00:08:07 +0800
Message-Id: <20221009160813.776829-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da4a07e-cfa1-4442-74bc-08daa9cd20d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpxjtfkAHdK0IKuTm8a+Eq2ig2w9d/EbjkxzXsMaF4YqOFVQFZU2r2dhL9EOWvsm9NcoaMHeHH5/XmoZaXFMf2SUkArDhnjO3Lzq7+/m17rNwoQGUBmHlCh/wPm8A9W2SZUKFHwi+Ci5L6g44h8HoPVBrE7Wn4pm9uD6euWYtJ566PTsXegroGvcWc1Ij5HmkKAsirtGQZtCxvCh3UQIAeKw3rz5Jk1nMrdcML/urPnBNp09TaMpZaxujNLw/zewSzxBrEj+VjBP3Wr6oARwkh2sbctv/8is8o77XNRtYM59FsEtKQIF49aB1mAme9KiQsjnNub25d5MOjLNdLfC8hQc83PAogsc4ggSLUSx+p+79JyvHOgu8/XRVlpD/634Dep78avoz3qSGDqyvea+17RxpBKBtYdRwqgPhDNhgKNCzyc+r0RUtnMVXYgTTckhU7nHG7rOYs9jZeFPsnLU1E8wb/9InkwbaSiiy3vntcTZH26XNfAfVV5xfnlYAo2yLX6N0p4W+6OFbYBg4Fk0VoJqS26On3SYpZesOlPOuADJ3BVkhsT77gmAFJ9N+Y90ypNj161q0XjlW0FeILhdIv0JNeKNrw31y0+y/pc21BErj5v8GXD0CBxSJiZxCyXfm/1KO+FFhtmWtlCD4Fu75hscNOIBv9vX0MbRfV0kv42Wp1S2uy/LOhKnbnSwRJIzLYoAqbDfExnEnOPj6ytqlyI3AJ3NiQza+UXLdwhovuCjjNPKTR78pqO86aKOiYJDQWtvKubo5E2clAp+heHlxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(15650500001)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++nUkN2MVEP3WScTEgRRbql0gvBTZY4agpjlv1MsmEBxO4lAk6OZnPBGEpZX?=
 =?us-ascii?Q?IZRH1AG09irqrtBdunCVmVKA0Vz0Mzg5Oq3fjN3YwHZ63U5Kj4Zm2glFBZ2n?=
 =?us-ascii?Q?9s9Gh29ILD6MJTXkNK0bRL/lf461cDEoH6pph65XvoTRRFtBYteXkOdt29NG?=
 =?us-ascii?Q?KDeqjDTfz4BD4QlVv8Tv6eb4KGaS9I4nSM9UdBbhmKQaamv7jVh7hhAgrnBt?=
 =?us-ascii?Q?RNV7AKDqzsclNDES3esf4e2LQakNRD9r2ucNQqi3s50jXDgSBAcYcdORWDws?=
 =?us-ascii?Q?vgChDOLI+oJECXVNjBw8NrDwYsgIesAhImabjSSifww74WAVWESd07ripqEo?=
 =?us-ascii?Q?fBW8xRsCveughzqKntEzSivupuXmIu/Yw5r0Jodg4ydgE1yVX37yg+NnR5hu?=
 =?us-ascii?Q?DXDawN75FjVhik0lZTV4/9Te/Imic+/lwlGiFPA79S/iO+FbtPBLoQ0Ix3lJ?=
 =?us-ascii?Q?GQOpq7k+NZNcWjr4zS2uq7dnDeaDe1+r4b1kbJBvMFslvCEb1hmd2p+SSUNR?=
 =?us-ascii?Q?Nkc2vA8cy6v/z9kr/nfS0ZIetSPdLbhC2CUXs4ljZjbArsrb17BJjB0iDNpM?=
 =?us-ascii?Q?1z0DJx6R/5324S5Qr6y6ofQ6fFPJ/W254ZJEKrRZQqQbIfwucXSqveIXquYe?=
 =?us-ascii?Q?6luDyuVJ50byknF60xeLv3WBaKjBM7WueMULwFW20bitqgxM4lNwhHUYYaf2?=
 =?us-ascii?Q?TU/yDGPX5rxm4KJoVcKStEqU/dZPulOWMf5hSSFH0A0/cUa2zyQ9ZTWaeBrU?=
 =?us-ascii?Q?Jv2Y5uYaYh2vsLMWkZ44OtJoIpmMncQbwxsnF4TPvFqQVQ6o7I0dsA/Qdp4x?=
 =?us-ascii?Q?zovC1sCvKq22q4qiKRWSjiE50HpFWSB9t8ORrsnibUzaDYRziWgdsS4IH9sH?=
 =?us-ascii?Q?89tU7FbnjScXQQi8dQ2df5ZKjUOG+DashUkPvUcaDv0GnHWXmNkLB7TezuO7?=
 =?us-ascii?Q?ock1y/yV5fDu4BNbFESwVz31ktjOMYVDm+n+Hq32bsZYxVjx098Np4mqX91k?=
 =?us-ascii?Q?PPLQ2yGZ53pVJoKHyoFeVZr8dJchCPxIcr9lE8fmz76ueTsvvDQu4Ig/9h8y?=
 =?us-ascii?Q?iTvKxD/A4lk7fx8+fJp4aY+0RFSJOqXoz2mXs/Wi8gfrX4OwGBuVOGmV6Ww3?=
 =?us-ascii?Q?vRFdTay4VqAINLIm/LtbHxq1E1jjPJ/Z1O+BfPkBNEMnt7erEtmA4zU6slHy?=
 =?us-ascii?Q?KODLgwuSvFUKd/0EABSvjX8nJkEnqs540/VDtZagmbV5tadufqv/4Gs9DlZ3?=
 =?us-ascii?Q?G8tEVaWEsvVnDo4qae7xFu5vK59Ao9uk7KG/vehsk9hFRac8sHP0OvwP3LWb?=
 =?us-ascii?Q?FHPzNL/3Snsxph64T1PS+/LI803bdU5dFCp8G0jg3Q3avwXzkvpW0DPTSOf4?=
 =?us-ascii?Q?aK2EEKbSbe4vpMT2AGtRrg79cWfnSYJpmYd8wxaQX6rBaQt4e5Wye2Rjf20T?=
 =?us-ascii?Q?GleqLNHB7Bi0OOgtrhXGWRirv/eksQcXxobg3hUKbmarm8nivJB4dsDFePJe?=
 =?us-ascii?Q?pLBQOaIx06921X8F1iNGEZb4TOI/ehQfJ5Jit2cIF2suMBY7sES7r7HK008S?=
 =?us-ascii?Q?ocgqdvpLqD4FqCQLoQQJpWzDIzExEkZNMaqfjzor?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da4a07e-cfa1-4442-74bc-08daa9cd20d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:11.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ4k+ag/WGlOlWvjv8A3GaJUkMiVFlu8DvmfGm221UIWdL54lVX8KDwYua7sfXQ4ysuoDw9deBnyfO85Tv1EMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There may be a need to handle suspend/resume per role. This patch
will add this support.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci.h   | 4 ++++
 drivers/usb/chipidea/core.c | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index a4a3be049910..005c67cb3afb 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -127,12 +127,16 @@ enum ci_revision {
  * struct ci_role_driver - host/gadget role driver
  * @start: start this role
  * @stop: stop this role
+ * @suspend: system suspend handler for this role
+ * @resume: system resume handler for this role
  * @irq: irq handler for this role
  * @name: role name string (host/gadget)
  */
 struct ci_role_driver {
 	int		(*start)(struct ci_hdrc *);
 	void		(*stop)(struct ci_hdrc *);
+	void		(*suspend)(struct ci_hdrc *ci);
+	void		(*resume)(struct ci_hdrc *ci, bool power_lost);
 	irqreturn_t	(*irq)(struct ci_hdrc *);
 	const char	*name;
 };
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3a39eb5e7dca..7eeb667bc01b 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1383,6 +1383,10 @@ static int ci_suspend(struct device *dev)
 		return 0;
 	}
 
+	/* Extra routine per role before system suspend */
+	if (ci->role != CI_ROLE_END && ci_role(ci)->suspend)
+		ci_role(ci)->suspend(ci);
+
 	if (device_may_wakeup(dev)) {
 		if (ci_otg_is_fsm_mode(ci))
 			ci_otg_fsm_suspend_for_srp(ci);
@@ -1422,6 +1426,10 @@ static int ci_resume(struct device *dev)
 		ci_usb_phy_init(ci);
 	}
 
+	/* Extra routine per role after system resume */
+	if (ci->role != CI_ROLE_END && ci_role(ci)->resume)
+		ci_role(ci)->resume(ci, power_lost);
+
 	if (power_lost)
 		ci_handle_power_lost(ci);
 
-- 
2.34.1

