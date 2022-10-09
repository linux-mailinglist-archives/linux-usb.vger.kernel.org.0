Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D185F8A0A
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 09:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiJIHvh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 03:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJIHve (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 03:51:34 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541BF7645
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 00:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGbklWH8pUiu/+p2GfiAqTMVsob9c4iHDNp1T78/ZA34FdazxkBQJz9rTiBy2l7VaHLF7AMZzwQvzcKTngvCsPuCRwBjuD0fcvTNzzMLZ/ChQ13medeotq/qVPrTKw+4ARqwHUFIKpIzcnJ5RhhpDoznxxwH2Sa7QOPReBAHgBSNh9bW9TJUhkmNmKlmcOXP4unnhm5gVNJ2kwAZyVMrIcZe/6o/vQ3n8RWT6+QQgJ+873NgdFnCaALQekkXHcpK4Cf+3mrVM9CmTWw6NSzZItGoAFq91AcZLeMhZWiP/LZMd9O1FFHs+M38r/CQ3rBMFwXa8NDaw2QGbv4B/+0UDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XwaeAxmlvnFKZVHarbcxurQv/OQWlQMux7YEF8Khdg=;
 b=KJ96ertIUbqQx7L6uOesYMalEoCCQGLHQm4TrGSLpi5QdNNpKUPGxzbRyxNUu79tZ8VtV4qproXi8wMVdVKz2VszaWf8x5JoVBR0Wo8ir115xueE0eZD54MMQw4it3XDQmwZHo5KCwUiJtppVl51DxeojvC2m3LP02Skvs0KUgzFL5vuePYwffgJaTsYer/GXz7IVYg/Wjnwgeg0KZh20ADfD3M4YHkDPVy1Q290+sq77H0a17xxS6INg/QYxfO5ZyNW5xZRVu7GWAeGQE9pvmNXGFnmBUrUDuqGF8LDpFVHqRRzB4eAh784L1AtdEQ2tIauCOe9EAgneoFkLD1Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XwaeAxmlvnFKZVHarbcxurQv/OQWlQMux7YEF8Khdg=;
 b=MwMrkZDFIONSFIGL/Q6YunjvXpkrL89/vl0gNZJrvosFwa6M/NwuLc4c/stb7vjYui4t3a62gPXm+JgU5fLPsv8q+MJIHvF6hMdgqbp7ncoKJK+mQonnrXwddT+eSBG6QhYN8ZdPd8/Ctx4E7ZrVCAl6Zd5hM1b25sMegUfh8Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AM9PR04MB8715.eurprd04.prod.outlook.com (2603:10a6:20b:43e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Sun, 9 Oct
 2022 07:51:31 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 07:51:31 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2] usb: chipidea: core: handle usb role switch in a common way
Date:   Sun,  9 Oct 2022 23:53:36 +0800
Message-Id: <20221009155336.766960-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|AM9PR04MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e47b54-c95f-4f34-e7ac-08daa9cb1420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JGK2JVSMaRUORdjGqvY/tdRpA0XUlB5vby1pjelXWCupG/2ihiK0X6vnDfAFdjbqGF6+qn95c+P2CKCmc8ia6JwYumk+Z/mSJQyk3dCi0nPVo+SNqZ2CLbWys8/FRrTt4g2WTDlGCwEo7tRG3ZqsGQJeA0T8RQylGs3MJwtJMiK1AoDueCd5VUuMVt6oMgcUvsmdhoujuswFU43SrAq0nRT50/LJRcfTQy0XKovKDkjErwzQO9djbOtvt+1VhbfgscG8MT53iBcBZC1gDlvOt6Fr3HFIF+6GdGC4cf4ivGdAsySBe9cQYzsoaAOqIyJcK74+0rBoO0hd5BF+ppDcsWXwZA/XM6Z3kq6TaymiM0g7Ye/IgY4UnyLlyg5pU5sEGovdJnWA+iqoE4cN6e8zqbzmBKJmOcwZPaoUORb1j09JhKO6QGg+9eHyvTfpoo4EJSXuJ/LAzS0JpxsbtAbZEkxmeoyyS1rVF/7QZ0FSh0ploQeS4ApeNvRwZq6rhsyhI9hDH29ImSveUQAFarGycfEtLCtfi2n9gW7A1irModP2FQ2vnNSrRFj7OYL3FBh+WhlTvUilvZ0q16qC3/0sCfGu+Tq8L3r+OzEO0ZXASwQ+r5xfLYXOJSNMrFMSvii48TMx3VpbciPJm327jnhdKzp46nB2wte47R7D4RulLONJumZnlVbu7j2imBRfpGn/eUZ26GkExUS+q4uOhf5X9AxD9M6xLqLA2GkzKrSNh1uN/UyWbmjo9OC2Em29EOPH6VzkB6ky+SN4CCbyvWuMJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(5660300002)(2616005)(6512007)(52116002)(26005)(36756003)(41300700001)(2906002)(1076003)(186003)(8936002)(66946007)(66476007)(8676002)(66556008)(6506007)(4326008)(6486002)(83380400001)(86362001)(6636002)(478600001)(38100700002)(38350700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V2YQ7I8Vn8O19DtHi0pkI1jh6Br6zv7QZghKRZkJc5WRTePCLLN0ehJDIGvw?=
 =?us-ascii?Q?3PNsPjDgQfzhb5Is8pujYOTzwv/SlKZgMulOSJi8wwT7+qPdmgy8eFjyIalY?=
 =?us-ascii?Q?YGanaL8CXuFdDuMRdyrCE6oDwrXhsYriXwoOfWXJcYKl3Ch2VI+6xi/RYtxj?=
 =?us-ascii?Q?u8Mmbzj5DCsRiOlu5X0BZ2Q2DU1fnw0SMB6RkOjLZCgAAG1QFBIWLSuN2Xgb?=
 =?us-ascii?Q?ffBQmqdV8XjL45t/2li8N0Ltg5HiZ+OEW4ux8b2iRyMt+bZmuh3NvVPgnRfU?=
 =?us-ascii?Q?tfABF5OXFsn0ZXf1aIYUuovvAkaGYzD2xOqlCz4Siu5CM31XdUnBjRLptn6f?=
 =?us-ascii?Q?tfWnrfUwgTvM9lcY9GIQacAdvXNwCdQH+/Bi0TE29Nk9tUJydqnhlysVjA35?=
 =?us-ascii?Q?Sm2YYj/ZsVwPqxK4IJPGKxoY6qPzzHIaeMeFbOtYo7ceBlHqpCG8avJzt+pm?=
 =?us-ascii?Q?JB5m2kxSvOJjOoguhph5BjAbjgFvbM65PLjlbYbuGfdPDbOIr0FyHp47MZcG?=
 =?us-ascii?Q?jSddqt72Ncs6xJXyVvMMa44KQWWfknariFMEKgAwEem0Bfossw6Z02WNvZ0q?=
 =?us-ascii?Q?+9qvxCws+rJJYPZ5pWn+FV4ZnM7iPCsVPEbObEqCIq+Se/VhQ8JdIm8JXf3Q?=
 =?us-ascii?Q?KEcOI64nGnoknySq4gJo+OiV2fNbTOOMkl2+rGLPUHeULpLsG6jE1nvbOIXy?=
 =?us-ascii?Q?G5FwK+6Xq1oeaC2g34KQECbZrbSWmqhQEbLdG3TDGgjUS+0n2hvEffGi20me?=
 =?us-ascii?Q?fdOGhzTjHtiRO9GtbMJwW7uXPx9Z2FZbOsmy8mjVFFXefINNeJUPdhFOsV9o?=
 =?us-ascii?Q?D4HveK8y9kdP9n6Ph6N/c+udzqG6FNp1eRXWPwKTlxsoDBTQk69pI+py1y1g?=
 =?us-ascii?Q?bp67g+/BHkgpwS7ZUtsBSv/YcHdT5a/UjnC5cyH7ywZK4DHUOyCUxtBXAmIq?=
 =?us-ascii?Q?k5zPb+wWKcInYdaGUMf3kOdB8inXbu4EVTLvkKKCUyrFnS6CGz4apY6q0iAc?=
 =?us-ascii?Q?0TZt9EASzF08MiofcHGQQFRKxx/J51oI5g79sKRcYaFX4qCgA0z7EJ8PjBUo?=
 =?us-ascii?Q?3mjpA/dAcrVtT8aY98wBLsl6tegFy3YkfkREpDJdqjqZy7ZI7ks8e0z96/SJ?=
 =?us-ascii?Q?JPX727E04iZC6eRXBYmYXqv3D0uYdD/cQtBp8/l92aMFus3zX5bou1wN6Gy4?=
 =?us-ascii?Q?IogvGVOo3qnY8A2txd1EdWZpHGbFm7ZixF3R80bpzICg9bhPQbiRcSUcOKAe?=
 =?us-ascii?Q?D8AVcNNFpw+KyDSh9YGU3cpqoI4vET3Y3cFe5Ugzpepgh4wE0j+KiUMA6FMR?=
 =?us-ascii?Q?WO9C6BJXae+kWHW7NfD/bw+V0XcIyGU1GSN14Eu6d7idWXtZIkWot8y/Mc9w?=
 =?us-ascii?Q?6UzM/EYXT6fmKS42CVTjXVTfH9bXBc7Xxe9VbHDqzwMOPbavv/8mzKNfXTpY?=
 =?us-ascii?Q?UBq8LWlxZKKvXPwQOzNK7wmxu6C9gyA5kA3ZIP4ApuYVIhFieVrXYltkcirK?=
 =?us-ascii?Q?/PlUJ95bbuZgn3Hkp+aBXnS8GKuDNNVxfnzmtwInykNDLCy6BaGNXTiZwZE+?=
 =?us-ascii?Q?Q96rXEShp2iqLClIAE8IICAPZfrtAEmbIR1RCNsl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e47b54-c95f-4f34-e7ac-08daa9cb1420
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 07:51:30.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2V1CMBaDkHWMoTNIu8qIPvaXlqTu1V9pvDeP8rdkZtuXHby021QV3+Ofx/yrzFf8dThH5KTMcGJcFRpCdbXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8715
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, ci_usb_role_switch_set() may be called before system resume
stage when suspended. Worse yet, ci_hdrc device may stay at RPM_ACTIVE
state which will cause pm_runtime_get_sync() fail to resume the device.
In this case, role-switch may unable to complete transition process due
to not exit from lpm state or due to lack some means after system resume.

Same as ci_cable_notifier(), usb_role_switch could handle its events based
on ci_hdrc_cable mechanism.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 55 ++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 6330fa911792..ae90fee75a32 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -608,49 +608,32 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
 				  enum usb_role role)
 {
 	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
-	struct ci_hdrc_cable *cable = NULL;
-	enum usb_role current_role = ci_role_to_usb_role(ci);
-	enum ci_role ci_role = usb_role_to_ci_role(role);
-	unsigned long flags;
-
-	if ((ci_role != CI_ROLE_END && !ci->roles[ci_role]) ||
-	    (current_role == role))
-		return 0;
+	struct ci_hdrc_cable *cable;
 
-	pm_runtime_get_sync(ci->dev);
-	/* Stop current role */
-	spin_lock_irqsave(&ci->lock, flags);
-	if (current_role == USB_ROLE_DEVICE)
+	if (role == USB_ROLE_HOST) {
+		cable = &ci->platdata->id_extcon;
+		cable->changed = true;
+		cable->connected = true;
 		cable = &ci->platdata->vbus_extcon;
-	else if (current_role == USB_ROLE_HOST)
+		cable->changed = true;
+		cable->connected = false;
+	} else if (role == USB_ROLE_DEVICE) {
 		cable = &ci->platdata->id_extcon;
-
-	if (cable) {
 		cable->changed = true;
 		cable->connected = false;
-		ci_irq(ci);
-		spin_unlock_irqrestore(&ci->lock, flags);
-		if (ci->wq && role != USB_ROLE_NONE)
-			flush_workqueue(ci->wq);
-		spin_lock_irqsave(&ci->lock, flags);
-	}
-
-	cable = NULL;
-
-	/* Start target role */
-	if (role == USB_ROLE_DEVICE)
 		cable = &ci->platdata->vbus_extcon;
-	else if (role == USB_ROLE_HOST)
-		cable = &ci->platdata->id_extcon;
-
-	if (cable) {
 		cable->changed = true;
 		cable->connected = true;
-		ci_irq(ci);
+	} else {
+		cable = &ci->platdata->id_extcon;
+		cable->changed = true;
+		cable->connected = false;
+		cable = &ci->platdata->vbus_extcon;
+		cable->changed = true;
+		cable->connected = false;
 	}
-	spin_unlock_irqrestore(&ci->lock, flags);
-	pm_runtime_put_sync(ci->dev);
 
+	ci_irq(ci);
 	return 0;
 }
 
@@ -1305,11 +1288,13 @@ static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
 	cable_id = &ci->platdata->id_extcon;
 	cable_vbus = &ci->platdata->vbus_extcon;
 
-	if (!IS_ERR(cable_id->edev) && ci->is_otg &&
+	if ((!IS_ERR(cable_id->edev) || !IS_ERR(ci->role_switch))
+		&& ci->is_otg &&
 		(otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS))
 		ci_irq(ci);
 
-	if (!IS_ERR(cable_vbus->edev) && ci->is_otg &&
+	if ((!IS_ERR(cable_vbus->edev) || !IS_ERR(ci->role_switch))
+		&& ci->is_otg &&
 		(otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS))
 		ci_irq(ci);
 }
-- 
2.34.1

