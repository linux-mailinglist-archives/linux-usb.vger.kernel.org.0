Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509666BAEC2
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 12:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjCOLJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 07:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjCOLJF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 07:09:05 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B01489F1A
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 04:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/9ZblhdteDh5QWzeErWeuy1RS0AAkhsZ4cMhvRQNSmyGJW4gog+obxNUUXpAUTYEW/qvO6u105+ahBgw90JvbMZdrD5kfuGbz5xKr0tBKsVJaUo2N3+SOKqFiN5enj3ZV9PCTgUMWp5tXszF/3txqequ/49TB4eTD+WLFX8rPJBOUsYt6HpeJvonDUhxyfVvcrdpC98YqEvFLf/Dj0Mgn4cMo44FCe2WI4XHX6wRZuPmbCL2mx6D7QGzXx/4r33Dq89wURi2A1E09P/aawjQrL3SfW34uvkxN/AQFf9v0RuJvz9Q/+cAyuHjv1yA+HfR2a1zxBUr1Com8z1Fp2BTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlOt1+3d6Ayc/dDA73DUH0TrWf0sB/pwn+T7yUrPwew=;
 b=gWJLWt0ZSlXcFhM8AAh42WNyKhd91UpqRsNGz+/+WhGi0TfrcWwm/wSxVguVT3c+TMJf7itlZpaCMX+NyBCE+MGwpcpzx8BDIdChZK4sPuT5ZzKx1yP+6y/3VrtRP/wughOkQ1Qc8YLHGH0p1GaNcelgo+lO7hOcjoqvqgTollnSVa2S3wktzyWVxIrvfxMOVUxpAqu38/Tg2CTZdSgJj3W48S0gt8BFEAVbYx8OlHXC/CFEzN8HlZspyatS4RKpTMYcy6ksc4Nv5l8YuKRCZnjiLQP1+GU9RAf2eOeFMjihr+/LEmVP0bJUo93isvmJZ++XoLvSm0b1pqozfa3vFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlOt1+3d6Ayc/dDA73DUH0TrWf0sB/pwn+T7yUrPwew=;
 b=RkEualFQO9iffRadj98uzGhcbZ3VJK2dxnFJDjPv5DaUOtCV7wcRzGUd+B7Wf+KlsPdwojtRWf9O7YF+LD1uZKg3zS1ZTYM7+AfLT65X/5jmtRNyfuTPfTFl6Rtafi90KfhesMq5ctu8wdBfxf9kS/mUzuFKPWpYsydu64uLFAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM9PR04MB8114.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 11:06:59 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5b9d:2097:31d0:c3a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5b9d:2097:31d0:c3a%9]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 11:06:59 +0000
From:   Li Jun <jun.li@nxp.com>
To:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Li Jun <jun.li@nxp.com>
Subject: [PATCH] usb: dwc3: add 2 registers dump for debugfs
Date:   Wed, 15 Mar 2023 18:39:18 +0800
Message-Id: <1678876758-11272-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AM9PR04MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 843ddddb-4f48-46f3-e663-08db2545656b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SWrXmCFWgsnXTWwCWyqhV2/V+0Bs8OBM2RyRMV5UDqB3JqJvV774fISB5pXrxj81OrNwTvrFrxmpK7BLEdFZuuKgakX13Qt+Vl/r3MhTMp/W1v+70+Hp/1tbvfawXHf2XOVUcaBcalsGuKJsOfIdWcEDlbeVvYEhZ3mBllPtOAwx+5BKRhz5nLk3H8qWzu9XQetJI0onAnFJaDtZ6nRcCJ98XC3zBCgqcLc/PfsVEvkqRDgeCWwCT9yW3xKZT/uu3gI0hyEyxurF2qI5wMmmnMK5R/7SrA1Z1QtS7iKEiRBUWc3p6Dp1puBKToEEaDYyDrODNYDygkZ04HhOtqSEFvih4ccEC/4MWHWNeJfmMvKmwQ10OWbHqwvgMEOxhxD9PDyzeBUkzp7BCYczjuHO1Ds6f+b9qxV5rRr77v1kQIU9MYDni90EHe5PyuDePBWFnkk482nBut4SATqBNOPiBloTKg4bslld6jdKzEqyOJgp9gJGs/nYiF67uMCgALFcf2/ajkqCVFiG0O2IIz3Pm1Zk3PAD+cGCPIuFLDV0wt4u0hhf7nFLiqPGC4I02aDLjTFWh8J005jCv8U+JUfUzzWKf6i8RyWHA9EhwDR2q9/vyI4LwQUaDth4EmJEH37R3ln/qA0WL/hkYJErkszv7jv+5yAA4V++cBUXdtP80eZxKSFBUuaRUqxKGtDXtVTIPbFMrLrCM4Z5NKBWwbhBXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199018)(26005)(41300700001)(5660300002)(36756003)(6486002)(52116002)(478600001)(6666004)(6506007)(186003)(6512007)(2616005)(316002)(66476007)(66946007)(8676002)(66556008)(8936002)(4744005)(4326008)(38350700002)(38100700002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CcvPl6kVrAD5DoVho5rQvFtBLscn/OfVpYfx7BfmdCiTDfWP52eCKLZXZtF4?=
 =?us-ascii?Q?sE0jHk4pimAM6fosqUgnkpUmk6TFFN6Wy70uW8C5WMJyOf/YrtvMxgQQaMUW?=
 =?us-ascii?Q?E/LCfb3fibrW3r25s+8bOtC/6m5UkTp3lUk7n1fWb/nfro33bpdoHWEJovC7?=
 =?us-ascii?Q?0jLTx+XpHtscg6+njdF/mdCfA7AJvkOcXmPv18VNCkaXB/qm0ZpBRwVKCxXo?=
 =?us-ascii?Q?UxmFR53NEDVgRIz6HH3vCnteC+Det+O+KGD/mNyZguYy7hR6b5oTNaemoJPo?=
 =?us-ascii?Q?KFAIMg/Acv6uEAI7ANjbDpe4dHANrrdKlKedjXIDM+eheWKhgT4YTrsdLrz8?=
 =?us-ascii?Q?jzNvE3QpXnGr1Vl8TGBuJGEEstAA63XvkDAvDP9hXXf78HxMsm382q8pB6KI?=
 =?us-ascii?Q?+J2wBVpfDuhO7kwCIIy3OGxdg2MUECkJllD6HEToJIz1obqLtkgXGoFeYbq+?=
 =?us-ascii?Q?DZzhF3zccEO9aAL0pirhAxIsc873zIG0Vvc6kDdJ1vqe2LVfBhpe3/CZOki2?=
 =?us-ascii?Q?/Uvw4NNylykAUJo5I+LZA9R5KQF2YA4JO/w3hk3+fj1T77hq6MSi5NdTHw7X?=
 =?us-ascii?Q?kr9weoh6GSWoNsoyO3qwZisxs1h8gLZx85wAtO0MM66F1p+2Qd+P8J0hMWgt?=
 =?us-ascii?Q?j/FuqCP1boFtxvrP9jv2OLQM/J7POBrSnGh4/EVPqYYGhEm6d7Y/aNGcKWBS?=
 =?us-ascii?Q?85G9MxOa9V4GhHUbTSmcLJImZuoxcJ7Z9FI6KDrAiLNgrhneyyHi+Hi3ubPv?=
 =?us-ascii?Q?nO7OQhPDBxWMOyJWoYWxVo8YMbloQKeFqRjcQmR9zDhaQ1CAWWI++9qLgJWP?=
 =?us-ascii?Q?1SLBvonSBvB2DkeCgWj7LL0afsajP7hg2atskTkooPXQCFfxLOlpl6KtcDbO?=
 =?us-ascii?Q?R2dpKkOP5zO4us+7jhdAOFwQKLhbqYM9eWkyyc54CQN/v6MX02USoiOuhBQQ?=
 =?us-ascii?Q?W5QSTjTMaVKtpQRUtQGN/Xi5S6pbcUnOlWiotT9wy5tIGG846/FN3PMJ5qtW?=
 =?us-ascii?Q?cZ8nv4zrmCXgFfPyywxafnKf2R212wYdjkVcOdE9cUIkX/D1Vv1lev85UyJV?=
 =?us-ascii?Q?3HZi0xXU4IIERyxyo+tqeG2nx7gpt1N/7W7farxNxr1Bd1B+r8EOqG7BKHdB?=
 =?us-ascii?Q?jyzBTAT31Gbij7PA5EvMw64zbSSijhfk1VrLCLkot0jHYJY8sqTgmmjIWqzr?=
 =?us-ascii?Q?/AsI9Xyxe7i6FqJEnQ7ekOTHVdYQ8uMFLfmUxnYX1VxZk8lYGWannBGkqi/e?=
 =?us-ascii?Q?0Q34PnodtfmaaFTzXTCJYjOU8djPzjN7ZTs0K4I11N50vnPuiOfbhWWH3OY5?=
 =?us-ascii?Q?Uzw8AvVMWTy8fMA63ZKyC/WfhR6Rd0COppE3x0+IZldY4PQK863uuVaxL+qC?=
 =?us-ascii?Q?g7hM0FK0dmeqsEQzgV0a7D0rgz23g8U3bRv0CBFl5xQggr1lyDSuBa0RIqn8?=
 =?us-ascii?Q?ONWfzMsixgbdyXcU4Fz3eB1HP0NWMoZiy126GLA7GaXLPUh8z1YDeT7zF9sY?=
 =?us-ascii?Q?Jazr/abB4Q+hjNCpuNHWAmpYyAioulyzJ2JHWWIDPWosQtwvib98cu/D8I2d?=
 =?us-ascii?Q?qsAUWCiXE7fFw8czV2Un1ji/4ppLbhqkvoiLxy3S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843ddddb-4f48-46f3-e663-08db2545656b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 11:06:59.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUQkLcn3wj3J2GMThBk7dOHJtD1yHaSOEovvkFr4xqjE0O3aX+oF7F+Ed+Iy8Ro9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8114
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add GUCTL3 and GFLADJ register dump for debugfs as they
are in use now.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
index 850df0e6bcab..54d4678e6232 100644
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@ -229,6 +229,8 @@ static const struct debugfs_reg32 dwc3_regs[] = {
 	dump_register(GEVNTCOUNT(0)),
 
 	dump_register(GHWPARAMS8),
+	dump_register(GUCTL3),
+	dump_register(GFLADJ),
 	dump_register(DCFG),
 	dump_register(DCTL),
 	dump_register(DEVTEN),
-- 
2.34.1

