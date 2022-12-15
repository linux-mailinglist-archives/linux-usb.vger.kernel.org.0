Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB21164D649
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 06:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiLOFxw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 00:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLOFxu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 00:53:50 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EF72AE3F
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 21:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6xS8LuUWBvKdCpGbsp4me4Q8t0jNnTIgEvlJMks4rnWtl8KO1RhSuobuTBlN1BezQlx5Ilmfyhuv/bFWi5irvKvLz/zhn1mGmbEF6AwfrJ5AE6RxgjT8Lo3VMmkrU/MN5Qvnn0H1Vg8WAz5qIJ1DeFRBCHSwwNBAZMDu89hkumYHITYhLCF3ruPETK/DvcdDDlE1VvKZixDIClVl/MlrHZXzxcOs0gbB/J4Awl0pNrkbdt3hpUG7XFP82gTY8OP5KhhxGuJOEP9o1NYgYds2Tj54uAfx2IMjw9Vde+sWUBQNIVBTsMZKnT2QhyQDu3RB39y7Iw/08rTRmDikCUZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJRhnsUNE4xQW8yGJcz8L/+cTaU1PZeMhPJeQ956sLQ=;
 b=NpQUArU08wm7v17HfvKkG44v6s2u13sJTz71SCqyI+um0Pq0powgN18M0fz/1CcgOThEe9m87HXBxEr2/WgRtQHZsMgaYwSEamZN2T+JwOMe847S47MgG0ULtSHrEIsQYG+gCFiXQL8Acp/cFqRm6jZjnusPgzzJoDHn7VtmIuSpF01c9SSN1qNZU4bIgbjZoEH3EUC3Bm4vq6CnAG/WTaSgoE3JcYXYNxIDDmX2pMvmHtzNUbVOiwNcnDbhs/+qY7peWuYoraWBBvmhxyOEzdMa2RjNmRNp64FtYvk4SRRqHsF8HZUOYDF9E4LxG3UAuF8H5nEeRUNSF+pX1VE7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJRhnsUNE4xQW8yGJcz8L/+cTaU1PZeMhPJeQ956sLQ=;
 b=OVMswUm0wpXhFJRxPIu2KCgkH/W9fJo2UH2Lh+ywnncF74xzWqbXpaEv65Grj251k7GBfLOxPXRpfKIEJKVZU+Npdlf/EFGHfBcLGH31JZieVxf6j2Qy5XXsBm5zY6Tixw/yl8IQcYpJiuiwrhvfEfxJONzI9jw5L2vbK1xcQsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by AM7PR04MB6901.eurprd04.prod.outlook.com (2603:10a6:20b:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 05:53:43 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%5]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 05:53:43 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: chipidea: core: fix possible constant 0 if use IS_ERR(ci->role_switch)
Date:   Thu, 15 Dec 2022 13:54:09 +0800
Message-Id: <20221215055409.3760523-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|AM7PR04MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc444a7-7e9d-4d56-c07f-08dade60b936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACNj12pGKAGbe9K6+tYT7+8FWUhMAENcuypzQ/zF7uLOgmO0pGt78kIOkMddGGMJuOp+tfwYkTG0wSgB7Os3okMib6RhCA5AwO1B5fCbmARbws/nNte+cG2WSH6LcCzsiIxTS8lPEIO5qY+Ze7qqi5+OkP4UbNhozpbMCsyJEtCVqg8cJGkoUod2XgRkmfOAn09Y/84v9cO8OjpQKSuanXwv+25ns+fFGwxybwdtOUawx8XqywCg6JbagGa/DxCCIJyfwIVgQaQvzZXxdWWWLcqLfoR+hK3PndadJ2wfuNeXmaLn4+ETA83b3Hk5oNw1zfArs7DvFGc1d50XPGZDxaATkqhKJcEhqToS6+d/ZNVWkwg0QUShUGLZMIK+PQSO9QSbE6oyGv64s1YHrozeudS9bZd6Fve33gKUiAO9uNz3WW7ye5aNyUUti/PEJd9eZXJr9pPF2NPcjd6wjrC9NRNO4FGsLgPeSGDZb9bW+DIOb8LKHA0CUeuOCbRiev2G5vDHxYNN7pcj4xPuZe9Uh6cvdsCQ3OBS9VhfjuZeicrjc4EbO2MmmGDSQ1Q6EB4qjwLItsdSQAqqjAlujza8jftunt2iRgl06lojQZNadeFGnLRDgIelzJdapNDv10xKahnG3mNZCCl55tI3FDWL9bcziQ7dOv5g4ehvfzuEe2y2+3Jlr20xN5uPPCnNvy18CN83JXUeltKYc2UkNoY98w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(6506007)(38350700002)(38100700002)(2906002)(316002)(36756003)(83380400001)(4326008)(8676002)(2616005)(66556008)(6916009)(66946007)(6512007)(1076003)(66476007)(186003)(26005)(478600001)(8936002)(86362001)(6666004)(52116002)(41300700001)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VXZnYQFr1WK2mDbMoH5jLMHV77feDDTobJuRqNqY48S65VzXxy+EXDQyYihB?=
 =?us-ascii?Q?uNriBHTerti9IA4gEqgOh3Y3LAMtxkbxV1bARSQWBeW2RYqHAJWjkrgpV3xx?=
 =?us-ascii?Q?1lPd87eLhJ6mXDcICW6xQGWUGDHeTQ309Hen/uDXhLswjgCpF5iZY4OPe/h1?=
 =?us-ascii?Q?v/Yq6kpdxnrXsHDZs6ktBXxOkEjh8xSfMhcqgKaaPqCBTaNxqJ65kGAwuYMS?=
 =?us-ascii?Q?ozmCF4lxhNMm2gzDqmaX97bDPGawmDZS8l428f324+0bFu93M6PoRvEL+MjN?=
 =?us-ascii?Q?0TimXwABGq4MnOGiVqKPTJO/I4ZB11T8fcG5+QskYfYWf79jfs4hAP64KzVL?=
 =?us-ascii?Q?83idDCAtJH4AZcP9nk+gBhf3od9cCitWjFWBW4LKmRjQIbHzJt++E4Vv6Obx?=
 =?us-ascii?Q?DUikvJf43ithGL+CuuBfhPu5I0bghlXxMyp/xo/tHPtejAAwjkqHTS3xG9Oe?=
 =?us-ascii?Q?mUWGibI0L0HNL6JI4Tj67KiYuizIMWKQHuxIvgKnoyzlR+yb+p9VTvyDs4dF?=
 =?us-ascii?Q?psuGxlhK8Qx3MwKT4RjolRC3PLB751cWitGoBPhUVCUpTr9u7vcV9Xz5RMba?=
 =?us-ascii?Q?GJM8CG3Uqz1691Ha5tCC6s/uQmOUMK8TCvhnpi0RBqMkuaUra5ybIEblKL4/?=
 =?us-ascii?Q?W5+hzY2GnRPxTtWHJXRwFb1uByDjYepmcykrTejytNvB5sqmbThu4iVsS8CA?=
 =?us-ascii?Q?yP8XQ+CmrPzCh2D+oLAdjSEaINeSb7R1W7NgLBpCyC1GLQJxsgeGR3q6GraT?=
 =?us-ascii?Q?pKH5eeEM5XFM3XeZGqT9H+npNPHASJS+NPWUznbFhT3MlZoCXTsMBaFgUmtl?=
 =?us-ascii?Q?2EQLa6I/fhUm9vkiJNwA9TORL55s0TEwqFwAANB8acXHgTSkjiyjo1ac6GSC?=
 =?us-ascii?Q?x2j6mKpLhpiXUDQHfdMv6B3pnSU7W9lfZUt86sf6bcp2/uWKj61tyB2s/C9s?=
 =?us-ascii?Q?9t2aEWlUf3eM5FjKlk1wt/+KNt9VgauXQn/nz7yRW2JPeoWeYSDA/Xwf4vuS?=
 =?us-ascii?Q?m/H8UQLyDofVkUBBlAKf9Wy2CJFpdbhEqDPSFE5Z7wieK7qgIavkkZvic3Td?=
 =?us-ascii?Q?7ntL2j+KT4bU+NZWyaF/u3WjtG/BwQTG13VldnKJ15BOlzrTDDIRoPvSZbH8?=
 =?us-ascii?Q?UXgosUi/LNH9q1z/dep5VKOxDw00qlLiaVtr20sFW0q8q+LfFIPxaVNoSTq3?=
 =?us-ascii?Q?mmxFpTK++1VZtvbX+ejehhLhII0kXqxAKl0mgjJdhBnwlX18GbMl3vCsM25S?=
 =?us-ascii?Q?y9nj1XveoZ12oFdStmVZqN65b5YMaQ8JxO66SHkh2PM3l2emyEKHG6NOMe9s?=
 =?us-ascii?Q?mTfFH04ocr8yvc6Roxq25kfUJLA+SuXGoSmgKuQKmQqPxUnhOwZAsJc0mhPL?=
 =?us-ascii?Q?4lkTpKRkD+sEBTnEvWA48AfuiySNwLSKjg2/+218FhDDWGPYbXutQUWKFBIk?=
 =?us-ascii?Q?ieiuf+Bq0ih4sf2H10Lewqzt9L855lPnI2FvosHemqGA9MJgBp3LjLeoNGrd?=
 =?us-ascii?Q?Wrk4G3OOYkvGrMXGh2EvXFXpGjSM25DeHxZmvze1BeA26b+I6PUpxqf4a3BG?=
 =?us-ascii?Q?dcHux+GSwiOK9fLwexPhva+NcUU4EPYo6VrJxN+m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc444a7-7e9d-4d56-c07f-08dade60b936
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 05:53:43.7726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXx9ZsEGOrbe8IvgRfoUwBiWel/KW0NkQlAkJSJ/aSNdgnAuRnoSQuaqn2TlYEh7ZiKi/Jgak9DeaDN046/65A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6901
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After successfully probed, ci->role_switch would only be NULL or a valid
pointer. IS_ERR(ci->role_switch) will always return 0. So no need to wrap
it with IS_ERR, otherwise the logic is wrong.

Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index d7efde30d59f..281fc51720ce 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1303,12 +1303,12 @@ static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
 	cable_id = &ci->platdata->id_extcon;
 	cable_vbus = &ci->platdata->vbus_extcon;
 
-	if ((!IS_ERR(cable_id->edev) || !IS_ERR(ci->role_switch))
+	if ((!IS_ERR(cable_id->edev) || ci->role_switch)
 		&& ci->is_otg &&
 		(otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS))
 		ci_irq(ci);
 
-	if ((!IS_ERR(cable_vbus->edev) || !IS_ERR(ci->role_switch))
+	if ((!IS_ERR(cable_vbus->edev) || ci->role_switch)
 		&& ci->is_otg &&
 		(otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS))
 		ci_irq(ci);
-- 
2.34.1

