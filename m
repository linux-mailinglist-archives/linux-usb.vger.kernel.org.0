Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4459BA52
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 09:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiHVHeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 03:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiHVHeL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 03:34:11 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF7B13F70;
        Mon, 22 Aug 2022 00:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1ji7HfZ88pKbjiCc3l16hk1TYZH80l9NQTWQYAB1regxebpb2XtSaXgvqCA/SrIp6MwTI6WVQpCM+o3u6yxeN7I2Y9nNGmfMilszNZ7xiMdF4117lvNiyTB9083w5ba0X0sbHvS1xx+paDL3ffEjVdmX2zftjFpaldwMpPaLBTRPwdJGF5HK7PYOkNb4bxoZMtEZe7mB4AxKTZB2alobyFcoQt10pcogc5icYwKH7c+t6TjYC3fYBTD4EypekE6NQj//eqainc11CpAm0NH+Qyb2FVD7FA1z20UjaA0qM8V441M1Yc0em8xddfZIcC49yTOJJi4pHiHoD6uVJDA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5Wdp0Rk/tsppEd8A/RRcJbbVPMH9Xog7x5Rl4P8t5g=;
 b=mxArx4ZHIWETvzMFUZcizUmdCxQFowdWagny4ONNzbJNwDFuZoafnJRQQlaElHxSa5xtNWnlGpST5GIrgn+FlHABoo2QI2whzRn9w/ygOTy+t1199LUeDmsDDqKdHu+JrJThEfdiAdJZG/hDKAqlkDswfECIuW/95AL+ZB6K7V/UcyEUjOedpoeWzUPEkjAG3whUCNivHoL/JfVVaL4C8TSV1PTdymrt9GFVccTfGoZMftReTRoJMujn00jjfep1WsFl8SfNrB6d2ethi8h7R8ye0ewKM3oDGGZg++khn9+jTq583TTZF/PVZPnYqploQDe1E+PB4aq/OwWi2yvGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5Wdp0Rk/tsppEd8A/RRcJbbVPMH9Xog7x5Rl4P8t5g=;
 b=bpAn2FpQXO3AYmA7q7Hh0FU0UNiyM0DgJWwWfIP0d0hqmwOAsEGRluToguqMzIdKyO//I0y1IH6qWdNsz0rSqK8gEC+BzeofqVzW8UelRZd22w8jsJTeOcm8T+5uikKFoF2Fi/erqurTFfCX9yW8bGY5yAEne2qyyKfmj/ED0xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR04MB4640.eurprd04.prod.outlook.com (2603:10a6:803:6b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 07:34:08 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:34:08 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] mux: allow get mux_control from fwnode if of_node is NULL
Date:   Mon, 22 Aug 2022 23:35:15 +0800
Message-Id: <20220822153517.3747679-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822153517.3747679-1-xu.yang_2@nxp.com>
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b4794fb-f3a6-41d1-0d5b-08da8410b291
X-MS-TrafficTypeDiagnostic: VI1PR04MB4640:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9MK5KQU19CZDFuzPyO7k5qZV6gUjl/Ob97H749fsjlLn6SKKyB1YWmPQmt4F1KQm5ETUr+GCWg7kK2nKZl835G+UT0f7d+XCwkT4WVhFVgUBl0oxCnwLSCvlJEtFC3cVeeajQL7rdLdQzLk4wLTj7dBQu23PMh9wlMbqHOPYVavJA/uh539HuJ+JLCMZ0p+dqYRCYDXKWTWrs27tp864oD72d6LcoXtC5KRCIpU36jHFp0tS0NK3srOCpuBo1IWHQzVEXyFGnIJVjgO7Pn74imEdl+VvVyKptj+Gp7QMhtgZ7guNtu6jL0v+yyiLkUwX16I4OAkfwRZH+dcn1/Sdh3DQIp07Vu1D1fd/nohXCvynay04dt3o21MSLpEpgACp93qWVbhgPNeESg73J1MLg7S+pjtMwluvSx7ISyiGFgg6B8nycDixzOieU3IQoANDhWqFHjYCQVKls9WoqMmk9IeWZrPwzciZvxJeLiTSbj78ZWuJ0QysTjtiH0SB+tNPRn66wH2aZG9UkO9CcROlQD1wKSa+ODEV0uHtFg40w/zddtKU2CuYFvTWtAy5hvBMjbTg+862bAegpLo+GJeNS+AAmuBXnc1eNsVqH1TGKXQ7ngborm/+cbXQFzmJtHBTKEabzPl8mTePzyf1lFdlvKqnj5Qh8b3G9Bky3sBx3R3wDx3LkqBnyLvq0F5JflITkzq+/CRnicZ+PiscPzs7BmxBZ1pc9AaoyCgJd47suVZ/Eohd8hr0uXueG1NV7o25qcjSiBnMNC8k+NekoS8ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(4744005)(8676002)(66556008)(66476007)(6486002)(5660300002)(316002)(66946007)(41300700001)(38100700002)(38350700002)(4326008)(36756003)(478600001)(6666004)(8936002)(2616005)(52116002)(6506007)(26005)(6512007)(2906002)(186003)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ha+KFeI5QvL7aAVkMbDm12J9Q1la/L/QOVAqAJX5nBGde36LyNQHMA4SnbiD?=
 =?us-ascii?Q?WUekqmGMCC9qSf2E4Zb7+gDkwqvwcOCPWm0ILHqVZploDJB2jWgGkaIVf1fX?=
 =?us-ascii?Q?S9ubg72sr2URfc04EoC9KBi7kd9QuAwqJchO1irejbWigfoPZ5meNI7uVuKa?=
 =?us-ascii?Q?mVKakvh/fuANYVE6IIinmcZ44547keoCB1REPXCKidUDu7B9QKnqNz9q/PZo?=
 =?us-ascii?Q?e83HcbBMjpttHkeZvcax3kE70JVcM7JrFKWd2GttTW2ZpylBo5ouIe5NMxH5?=
 =?us-ascii?Q?Dah/GOBXtfKjuyo3p6WSWgbAQeazstI41WHpag9rBtUcaUBrzhoSijezeo/4?=
 =?us-ascii?Q?1V94mtygdQKi9mImGdwPT+jO8bHfZYb3hWZ+YGcvujsSX/0NNzZOgFSiONJg?=
 =?us-ascii?Q?9KNBTR5vTy7ZvOKU91ZPLN/H/jBcRYtTTujfbi0yVp4Kz2NEDJvtJoVZFvwV?=
 =?us-ascii?Q?oP+Mj4gh1sQWwdBDbdLWOg8wVu22trpELl7YehneJA7qMpG8Q2p1uxSpWP+J?=
 =?us-ascii?Q?UXFQKRMp1sx0cZlGvc06uYLlTWBFpKfHI2hIxz6b2V7gtdOCzeMvIKyHchxR?=
 =?us-ascii?Q?KRoeKoe6S9nukH9bxPsnImOuxyYgG6YchJpmKLhaQ3mY2GSNV++bqynYAC9x?=
 =?us-ascii?Q?661OFyySzDHFq45WrFglttpB9PWFNckf5PR4OywkAVqTFPOTeN/dZzn2b0gc?=
 =?us-ascii?Q?cnlwyA0BwCIIsEhoAOvUn7tTmItTlAXDkwfjZa8x3a3g32N5uGXV2UWJUE9r?=
 =?us-ascii?Q?cz+9IoSlCs38T6/keV+bbcUQMfk1d5s60i3niU2yrbkk8LFWDdUrdKsi8z2u?=
 =?us-ascii?Q?M2WiwpIKfMy79XnhLmmcgbkuXOuNue4bKU+2XgTmVyYWB+86z7tkV3Uz6sSj?=
 =?us-ascii?Q?2Eb81fgY1GPxFvpU/IDsGOxnGuHH6POwj/RM1t9DTg4xtlGFNsTHutg2aRMB?=
 =?us-ascii?Q?kP1UXdNXv1qhjqt3wNDqFkilnCi9u8n+GUn9RVw85beyyFh27H0kFiltHLyx?=
 =?us-ascii?Q?/pbSFheoZMPAaEzvS1HOG+zYeatRxLYUveDOvvo4qo4jM+3r3k1AY4F001DQ?=
 =?us-ascii?Q?CEqR4ji2m04BoHswieaFkWZ9N3F8D4Wp5qoidY63segdTOw2zwiqEd0UAZ6Z?=
 =?us-ascii?Q?WtjciNkrq2f3ZVqiHxnhhO4mz37yRkUV/pOKoIz/Yo2KMG8rpIfSksz1y1hl?=
 =?us-ascii?Q?PXCG/AwfzeE/mKa2G0lbWpGTutj/TYjJbodoaf1PF3F8GOWlXXGYCxbMtY7w?=
 =?us-ascii?Q?dJnN66XYGuzQ/licj4DgMIhGLRa9WLKNC67vbkYNzFdEfzr7gpALOx9ADpzz?=
 =?us-ascii?Q?bklJKcW7ejepmDledmWJHKgT4j+B21TJwQi4uCfPYSY/ABumdT/IeB2XLUYV?=
 =?us-ascii?Q?P4w1MeSNSffwjE4I3Aa4ux1+jKLcikBz5E7bRR+pSBHwnCXIH+Oh+eum9qcu?=
 =?us-ascii?Q?ZYgdU9CBXwK8RQM22Or6jSQFI3Cx7XdxQzNwHSqPG3zKPGSphGb8LyahOta2?=
 =?us-ascii?Q?A70A6VeN6G5zVRUVIZyru/FXY+84w+rZ0pcHZpW0vC9Q+dg2F+knWx0pHygi?=
 =?us-ascii?Q?9q5J6TLnMWKyvKh4fjVVoBc3KHdKL5MN5zQO8YPK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4794fb-f3a6-41d1-0d5b-08da8410b291
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:34:07.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EL9m6Wl5JyuoO6GkcMFS/oIhYbhut4KDnhAQLUwcNN/MqPdBgQx3qJaMQ3kPXZzqBeQo9FwIuObqBHmwz0yxIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4640
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since some devices may link fwnode to dev but doesn't link of_node,
so here we could get mux_control from fwnode again.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/mux/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 49bedbe6316c..06d4e232e056 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -538,6 +538,9 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 	int index = 0;
 	int ret;
 
+	if (!np)
+		np = to_of_node(dev_fwnode(dev));
+
 	if (mux_name) {
 		if (state)
 			index = of_property_match_string(np, "mux-state-names",
-- 
2.34.1

