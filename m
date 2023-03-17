Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247336BE119
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 07:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjCQGN5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 02:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjCQGNz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 02:13:55 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDD7D538
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 23:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPsshA7hs2vhjYhrkTFuATnKOTAkoijZoTG+ReyBVmiffIAFil2XvdtFe7qjmWucXPYQ7qxiJdn17eNQLDUX4UQzUaD1whszjefMBo/NJJ7wvFLQdhf2QclxFgYwVldPxqKqmrE3d1ayT/H3duNHiQatV4j7rc7+yRuqjpr3lnAEAuli8wVV5PU9o6Sa31STKKIAvyBsNI/nXmh201jkcTLQsuxd4esKnkhepEe+YCxLq7DFqxOaJfvxIlXtD4xkr1YR0vgl7LGTuc4V4aMt4EsCd9DptGDk4MlXHkaxbuV2Wnl7uqjCkY2bvp47+yanza+MYCWh2gqzEHSbbDEHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8DrIXeZlDUTfGstEdQGon4yIw4bL7V+5etchI+9FV4=;
 b=ev8Wpg56WNqKcFcWkJ4EWWcO2eAoYYuufGYez64u0OV6NOrAJbBgY65QgA/I67IsJpU+I5cHTq2miVouhl8GpNd66iFNoJ8FB4LNcsN+Es3I9/RRYZaglAH3GBGWJ8AH50uu6w9gxMShe8yblklIbaonAkuEJszcVArAwAtnIdlFTJcgVut0Obk9KhXrPEfZWMP92iODAwg3G3kzaoYGEsYPvoaEtmNmhXyOfhQTl9CdPBtqVtkGrqrXqe6NksKrr1vbFCWemINndFDodUkkT02GQOxH4VVB3rzyre/5/ZWxV0/l1SOtMh4tP8U1pXTD+jWEZssLYaktTMBHtCV/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8DrIXeZlDUTfGstEdQGon4yIw4bL7V+5etchI+9FV4=;
 b=C3eO2dFNUFC+iJl1JLormaUc9XJgf3gtPo6O6giMLiQbASCO+ETlOl8ZG9fie7O1IBJjBlV8xPrhGZbiOkE4tTfovvDBkvqZRUTOs8BMpC2VW6QyAxlk8gCg/xYtAyYrpq8t70641OAO1JkC+OSJYxb7nUF5lySMs2AAqMqeKDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.31; Fri, 17 Mar 2023 06:13:49 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::5466:bfa2:3158:97c6%3]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 06:13:49 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v3 1/2] usb: chipdea: core: fix return -EINVAL if request role is the same with current role
Date:   Fri, 17 Mar 2023 14:15:15 +0800
Message-Id: <20230317061516.2451728-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dba8294-bbbb-425b-53e7-08db26aec61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MAN3ECxjYiqtEqG+abeYLigWrQb2XjLijpmnnL7/8SQf1DxzjWd6qXqjk9jCf5jAayUADZgk2YoniBF3nnetO7n2YV3CqSq20akZMIZJFq99q4Qqk3GfWAWDW5YOx00rfkE1mcPYnm6OlrUFsmpneP0zkdKAKJ/7RTq5Qtb1MtfvT3vKn3riaLh0YnP5Wz1G6AwgiDG+X3S9jFJRk4fLfpMUw2fcX18XSMjelpFmV5AJmBLHgjPpxU4cPAsl75vQzpZQdj2ztEZHHQ79kM02KmbZKxJg1ReNQbXfKYuCkSyjzFpPI9L9v6i2DgrwBNkvJez1G/jpyHTRkxvjQrlt98ZRw/ywKFHFYPXiTyeSBoR8uehRmE8PggWVLPTLmSOls2ZDqy6lLlTEUMmrqV+s0cg3cGjHiIjk/p4VY3Cx6cUboHf+7HOV50QtV+pC8Fqrxd6VZBH4nj15A+NnSgQca3ZGoo42jxVFXc5LEIBwNb8DuSrN5WyxfCxFfpd5QvQ59uORmYmjkN4HgN64sTzUA9tpcHcK8svRmdT2G19c3cI512tdo6QcR/IRTXjCGR7DZHqV1Js0z5QMM8vdGgsoUxx05pmfv6aZ0jia/otZvfue8d8LQEujxuaW2SeDNqPNtfrZQTRmRMDjD+WzOpAhP+jTPJy3ooDPgZvzJ2ZgdkcGhhNDa1usM2Xx8j679SwdpV5jVeBR34pjd9kCA0tJMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(38350700002)(38100700002)(86362001)(4744005)(36756003)(2906002)(4326008)(41300700001)(5660300002)(8936002)(6916009)(1076003)(6512007)(186003)(26005)(2616005)(83380400001)(316002)(6506007)(66556008)(6486002)(8676002)(66946007)(6666004)(52116002)(66476007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ewfRm3aYoqtrtA+dUNO16BAu7OrQHUv5XYupQQyiN7CHzEhbOC/64QrgbGXd?=
 =?us-ascii?Q?Y0SAsuwRNp6QGraEF0MIQxdDzeh1WOdVH6cPUkUw4OGGtYras5wZ6qhlA6kL?=
 =?us-ascii?Q?1lhFErvNJKs2jAk2Iog5yM2ACOocDYmgtH/kHV2bLBep8CmOwqc0s3OPasRi?=
 =?us-ascii?Q?n9GHgz7GBCJaV3weYvcNSmm2QYFayih7qbrvtESXxyxx6T31C+XmN/rwcLQk?=
 =?us-ascii?Q?B1fvwdgHSmhh/xM942NXzra7tEYgamrHoU/m+hhsTyq64C/mMhcaCndxsDHc?=
 =?us-ascii?Q?ep6Da9iD7JlLqAVuIDpAYe5wx6DRdBBr9VgOS5Vvj0Xs7+TehwKzmEKan3lw?=
 =?us-ascii?Q?oLxbkqFqQb/QstMbVN4pv2hAHKtdhuQfnw5LXAnqtZIw2J8HXW6SiOrweUf6?=
 =?us-ascii?Q?2WlffyMgm9jaogRuga2lahCq78+/dl7ZvLkrcGkQMVKZBTtnDMmROigjZnAG?=
 =?us-ascii?Q?SMdAFK2F+0f8CRqv0hFGDSlielf0M47Mob3om1WFhy6ypUsXbJBpmgZWdrc0?=
 =?us-ascii?Q?OrhUDvaoesQrEM/Jl4IRWwxDvm1PKCfdK7VGtsJVsoOTSNnYkNzhCAw7iXBk?=
 =?us-ascii?Q?Ofjj2yJRuXOcJyi2zKrW8edBbaAibioAXGzaNM3bvH+CJwV7a13roZlU8+Q7?=
 =?us-ascii?Q?lFJ7llEWflxTqkjjSY8zP89HVUCgRmoMbXOcZm9p6rBgfaA6Scew9UqocldV?=
 =?us-ascii?Q?NNJBiarFORgIA5SVypqJ/loy5tD3tJjvx6UoAGL6de2bV7T2M5ECO9iwKMf3?=
 =?us-ascii?Q?SkbBV3R19tjKLAf51y5d6beTuVZFqZgmyzDYRhS/4nfeB+XUgmUDVMTgfCF/?=
 =?us-ascii?Q?xpIHbZylQFWcN1Ds3UiL7lhGv5SdbZwStOyhFSlL8g3/CmXpRst1m1HhqOyP?=
 =?us-ascii?Q?ySiY3ue8FudENlrnfNuoze2ZMcyn8IDtuCThWnRBryfIFg1JTbXguFsLwZPY?=
 =?us-ascii?Q?viIoAR3k5pXKIbPCzfiu1hmEFXnyPnqdb11NNBgMTI1r73Xjhj+HvRt5vdNJ?=
 =?us-ascii?Q?V83RTgPQsvTdbBEdoh13qeFcc6KdhUX5K1ayi72Cvwn2pQVERnbyH7q/MRO0?=
 =?us-ascii?Q?MijqS40Fx4Lz6GIQ29T5U4PaseTd1imNRUpA7zRBw3PteOmODiEtpn3hrjFP?=
 =?us-ascii?Q?70pmWBaT/sZ2S4LX/kAM5DtNhhi1SA6UXRqINqESBYTyUWT6MWJCqOJ/MfSf?=
 =?us-ascii?Q?C6vHN3KNHEn0dJEI4sddrSZ5DDO+YVo2n6ZzTk9hvEk/4qR2Fm+794d3I3T7?=
 =?us-ascii?Q?/y02JAmstP25qB+hhDszNLfwh61iLgESguwt+rF6kNK9R7j3U2+ye3FkGiXi?=
 =?us-ascii?Q?eLJyvj48g/hntek3ks7tWHMwtyq9bqjay0TFlsqsTmv9do+Xmvl0HM3EH8zd?=
 =?us-ascii?Q?L4+9V8jdvrBGgI3u9SiRNyF/NRVHZhdowzWuzN6J/2OWRXDTRhCEdi7jlpHe?=
 =?us-ascii?Q?Dk3hDIOoDYIsdI+lxI3sKejSjy28Ok6nabNW7PRxdHu6skyPjFyD236n6o30?=
 =?us-ascii?Q?sxiADr3yI+HACFYisJmw5PrE4VpC39Nb1U8k1A95mPBvkPHpMw+jHhVka8QV?=
 =?us-ascii?Q?CcxjhmoKjmewGyT6V7ulHtdLUWpz8SKRV0Nbtyu+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dba8294-bbbb-425b-53e7-08db26aec61d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 06:13:49.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itowQ3umNyu/4dHIYzvEgOXV7WFM5xHpUmBAq6BxVAtiP1EFfchd10AiEGY0kwRBeRpzOyBT7rLvEW27Mns9HQ==
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

It should not return -EINVAL if the request role is the same with current
role, return non-error and without do anything instead.

Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
cc: <stable@vger.kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
changes since v1:
- no change
changes since v2:
- add acked-by tag
---
 drivers/usb/chipidea/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7ccb223ed53c..eae4bf865a8e 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -984,9 +984,12 @@ static ssize_t role_store(struct device *dev,
 			     strlen(ci->roles[role]->name)))
 			break;
 
-	if (role == CI_ROLE_END || role == ci->role)
+	if (role == CI_ROLE_END)
 		return -EINVAL;
 
+	if (role == ci->role)
+		return n;
+
 	pm_runtime_get_sync(dev);
 	disable_irq(ci->irq);
 	ci_role_stop(ci);
-- 
2.34.1

