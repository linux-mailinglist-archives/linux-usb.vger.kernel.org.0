Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D52645271
	for <lists+linux-usb@lfdr.de>; Wed,  7 Dec 2022 04:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiLGDO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Dec 2022 22:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLGDO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Dec 2022 22:14:27 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::60f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDF153ECB
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 19:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYdgeifHRR7ZrhlbTeQCT4eh06aT7t+dJhZYT/k5lvTYdOHkfqhsmMsay7HeKkttjz3Rsl2PO6dz+ge5wXJIIhBq1tR6ELbX2jyCux0Gh9k07CNRO1i3cV6dqpr8rAvVXNUq4oet55IvS/nba5u4uvFQtidv+o5bXYXR+DOkCzdJSzB+Xy1ao/3vyr85XXkg74SpZAbRfyxgp1VdF7ZwIEakXHRtIM70s+jiR+YBLRz6Svt2N7b6tluXCA/7TzQZnYhPXJirTScYJC2qybPUZJUJTYswyJJuZhiOtA96Z2Hq4rs4Kqg2wuO93q8Sau/H/NKwh0R644lIjYYLuD9dDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxPZEZ1uEcl462LpQiCFgxX750AmDv2yyxJmFyVD51Y=;
 b=G2/XA8hcmwD9jwx+7zSX2/3mdU10yVoyZO5nj8kIjoUqW+mGc+/Jt9HA5Rhx9wHxwYkwgOiDQh464STlf9AwPegH7k4q9rQbGu+fK3wMQe1+OnvH5UV7Mz1p0NNuMWYjswG+/rnvH6+5a04N9RHDOC6okUbGXTF/ISZzJA8HqQizzes7UYzTTQPUr1e8tKCB83ve0YkC/BOlBYPKMSytFCSQro8TYwV03W8gkJEyQRFfXoel2VQYwTB/Xql7kcLdzNixyROWhR+yj/1qVjuloMCosUU58dGYdNcIntDfiMeDiEE0BF/UBECnpAh/hroZeEwDTRXeSfkiCiRBFiYKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxPZEZ1uEcl462LpQiCFgxX750AmDv2yyxJmFyVD51Y=;
 b=KqazxIHsfyR9NiyBgVW6lIUe1D4iCfkjb8nbI3nmIvchUau1yJ4L/t1dumdNQdHpel/UHVOG5US9AUDnniO58Djc/TQmabqRHXwKeUOb5ELHehzg7/4KeD8DGr41Zs59dDCiM+fukOLASiuUhKrCtLCANhzupp6A0IfeO7RNvJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by DB9PR04MB9473.eurprd04.prod.outlook.com (2603:10a6:10:369::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 03:14:21 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5880.013; Wed, 7 Dec 2022
 03:14:21 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: chipidea: otg: handle vbus change for udc iff it's in device mode
Date:   Wed,  7 Dec 2022 11:14:48 +0800
Message-Id: <20221207031448.336080-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|DB9PR04MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: c9856800-ab20-4a69-f4cf-08dad8012287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/rZ2tcvD6iEP3kuDnurqpgpnv8v+J7ugOTlcRjNG3SjEFeB/krWU+aBulARc4GT9yLDs9xieQxcSpE1oMoShJCvg7mMl/hJokP98Ddl7aEzkiSAUm5wVTY6UkZB/swwXIZM1F5JSHzkkNBKTx+EZBYvxDzzGwcaeq45dYkCwkixxZ1Tqi8jVWdy2v0cah3TSpxn1s8UjMMwDI/QdOy+KDBnHgYO/1bnOxlFMNJn+wYao0eAVkXUWwACAhoiKqwOfnlwwNWeLbhPCYk9XHrfu8liGflDf+TJ5hQzkinDJAeTJyx/ZGq4SfMQZLoaHy6V97BK7kdVgk4XdSBrVuPPgGEyP/fzPG+1S9R3yMZPezTT9/a6wBoiEmre5CQRsZFmFe/kLqQAlD2kdJMn8bAG45dhLLm3dy/2ryF9b/LCqU4dkOzRcTESJ27zlhOdDn/hMge0KNCFxLWsciNieIVwdvHvq3UvTLYAbg4+TEl3BgP/UM487rnga078QIhOQwVhRLlT+hBgTDuzN59j27B1scrS6U93j0t/fr3ehEGILhgJgOQEgS42nh5pqgb09PYsrd4jsOvBZpv0d1x+dv946Ips/SzhEq92vSqTp6xJYapdLV5QVHjvCG5D42XBlTZj03NcTq+ejlCVXl2DFAZV35BzwM5BfeCGZhdW73VSh38r0fkWH2zmWtrjKBp30EAs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(38100700002)(36756003)(478600001)(86362001)(6486002)(2906002)(26005)(5660300002)(6506007)(8676002)(66476007)(6666004)(6512007)(186003)(8936002)(41300700001)(316002)(6916009)(4326008)(66556008)(66946007)(2616005)(52116002)(38350700002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lrvFn+KQeNpKdZHfo1AVX+nnqPewYpE2+ufW2M0gy9n2ReLe788RZfFHw/W4?=
 =?us-ascii?Q?7M/VBYFyAKkAXys6i/wd9PO9P8cLqVLgGe0RcYVD4r40MbrDT7Lr5pfdHaHv?=
 =?us-ascii?Q?pP2KAQmazGnyz1dDYzBlEh2XFzuxHInPz5LJs295FsPfqTuv11i5jVp46ufS?=
 =?us-ascii?Q?uz3OXyDPfpSgqyPekS87U60uh0gfmrapIrN1147XVPC44/MUcV2/qjj/1icF?=
 =?us-ascii?Q?RjOBoDJMN9qEnfy+Cv+4wcaXluYaRiWic/uc1Ut19rZeZYh4nnj2PA2djlb6?=
 =?us-ascii?Q?goBG94ZH+ZzC9saaiW5rgSZbrJwUkxiZtD7zdi5qtCVC24xHogNSJ9sj6VDr?=
 =?us-ascii?Q?MES76lWbvOZDxT4ayxA9fr19rmGxnmPEAs+NzSoeCPjF8CzmaZuRFUNFFhV1?=
 =?us-ascii?Q?UffVxNuOyI56wX2DiOXAFEfHUFXzTRvSMrtgyA2Y3HGmzj/um/8R8WokIWl/?=
 =?us-ascii?Q?4nZlwyMO2FMuAZL/Xam0PIkDBHTgrITwFlcBoJT2S8nokdW7UL49BG+Tw8kv?=
 =?us-ascii?Q?96qP7efkTZE7OOgu3u8mp5LwznVOk6uf8uaVKuGP3v0Qg2SO9F1pgPxLcHtG?=
 =?us-ascii?Q?P9OcwORVPIUapUwv+0HsjvbJM6zUR2WXocGpZN+fGldIi3K5vrAIzo0W7LdR?=
 =?us-ascii?Q?i1LZmIBypfUYFz2Kj0ivbkci5Co/E/4C1CU7jYtwwR9kiEQnAWdrLb5RhyAE?=
 =?us-ascii?Q?YEJNUT6Nm2Y/iqJeltBNkcg1Mo9LqujmcdEglhOWV22vevkVk0uJHNmNwUIm?=
 =?us-ascii?Q?enlalvV49VDd+R1TV/q3tLQeUHFg+0o+bd+vaB4pJs03yUlHjrvR0LvdLjfj?=
 =?us-ascii?Q?oqim075zgwIkYPUDDZaZIzOne3cAvp5Zhj4fF8q/eyfZNpIXgmV3n6j+4SIb?=
 =?us-ascii?Q?47ZCyDjlwFdN0hkXLTX+oSMTY85cSxmvszzB+0M3lJffEFqwdKsHupzA8qJ9?=
 =?us-ascii?Q?oeAi4aGJMsxuGfs/yzrthxCEp6dIw8kt6YZOWHbrYAZ8ixe5JTxUognSlgRs?=
 =?us-ascii?Q?p6JN8VDgsp3nV1pwv9qVGrxVSm5piMheaFL2MOhjCafHnjyownJzl5CtrB0Y?=
 =?us-ascii?Q?Q7b16ZHmiQVi0i6tkPrPl1I1IZwM8BOlOSiYZkqoMsCvsF4c5/exoWpr/vi4?=
 =?us-ascii?Q?7J99Coqc6ABrp1R8EJ5hd4ZbA7bnA8/Jy+ucB7KT6bNO22P3At4d570avgun?=
 =?us-ascii?Q?tvHKdkC9hwdvLVd8mn4AwtKvT17G0FNVdZm6R4IMKO+1dK6dvc57bQM/dwOH?=
 =?us-ascii?Q?5rsZlkaWxgTaWGI36CgqRaUiVeUS7+C/JhJPwaZYGutS/Zt34Ypi5GAxhfSC?=
 =?us-ascii?Q?QfV4G07jEkoU1qTlWTTf6gHF5CYcRCUMaTQYNhm3hehZr4Flzypk9zMYJ76N?=
 =?us-ascii?Q?dQ8V+WSsq4NbFZBHZcCk1FerIN4oY6AtqBPGyU/Hz+27Pg/ZrH/+XMM7MyHT?=
 =?us-ascii?Q?1wLuB4E2+nruF79+KcksujwP2TGHpJaNSCujJoxHcZSPKbONBiiTK2YhqJZh?=
 =?us-ascii?Q?JjGlsULOPiYRVzrfJtEwormcrt6Qnq2uM+mb+HM4gGzoyOlUXmt6lsADfW0H?=
 =?us-ascii?Q?gk2iQt96mVvraijD1zssG9HV94K+OyUOdHY4apnr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9856800-ab20-4a69-f4cf-08dad8012287
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 03:14:21.5216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Leojhb73ff2vjBRBfWIozIw+riBdGNrE5PZBWsI2yGNJSPaDnbO2NgN//Xw7nj2fAFJ9kHA0OiX7kIXZvtLlRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9473
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SPF_PERMERROR autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When in device mode at first (BSVIE is set),  OTGSC will assert both
BSVIS and IDIS bit if changed to host mode. ID event will be handled
in the first interrupt. Depends on whether BSVIE is cleared when call
ci_role_stop() for udc, the 2rd interrupt may be asserted after a
specific interrupt period (BSVIE and BSVIS is still 1). If it is, the
driver will continue to handle VBUS change for udc. We should avoid
this manner since the controller is not in device mode and the worser
is gadget related code may be executed if a gadget driver is attached.

Fixes: a107f8c505cd ("usb: chipidea: add vbus interrupt handler")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/otg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index f5490f2a5b6b..31c38a3ab990 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -133,6 +133,9 @@ void ci_handle_vbus_change(struct ci_hdrc *ci)
 	if (!ci->is_otg)
 		return;
 
+	if (ci_otg_role(ci) != CI_ROLE_GADGET)
+		return;
+
 	if (hw_read_otgsc(ci, OTGSC_BSV) && !ci->vbus_active)
 		usb_gadget_vbus_connect(&ci->gadget);
 	else if (!hw_read_otgsc(ci, OTGSC_BSV) && ci->vbus_active)
-- 
2.34.1

