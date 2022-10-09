Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25125F8A0D
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiJIIGM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiJIIGL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:11 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFAE2DA85
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG4h9a+/crtVxoctOCdS2tNxmdebCSoxnycesDnW6VSBL1oQ1gYk4xih4dJP8ZAy+NJ4BXrDa79jv/drCwnzvGMI0lYRb0zVIur/w6l/4urtklEZMUbDrjo+BXkQPVAWI/so3und0l+YjfIe9kmtlnsNW/zQTAbTwzq8A9i0YMb8jCdtbaoEflnnS2TmBeI3fgXdhbgxVasqh2H6PqVcqVOeZ0tWIgHZQ4CT7X/2diLRPQiTPx1ELVF/pH3yn+Ww0Cibp20OTzEc1C7fzlADoTFwhNkQZfj3+R5Lxvm9JBs5AihgcUHGyqs8hHWuGSkpuEZnTbtEtEbE3HHbfc30hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rA4n8dqhFUUYHiRzzHpNbhrYXEcDqPcdWPhRB5q0O0=;
 b=ZoskruVv/koPRwK/FhiO0zX5IJSEJykapmKssHbPs+VtCmCBX5IAJ+W+9YdhF5C13mewR1nkzoKxxx71kHgipduVqDZlKn6Q9pBBKdQM198Ru8OsptxTAYmu5cMgAdUGltYcF0KqYZXe5SM57vsi2G+MhB5CraTfqQS6WapiM7wNxE4YovZtPDXd2uYKYw2IJjtLE/YLZ5AUanUxO0iwbkdqg+29V7LkgfTIAkBJo3VmlXWI5mmc3nEmewXkGhYdAWh7dNphKgjuRr5UAV9hvOBhvAuya/Ow/QgyPbB7curAfELlliCpyb3yOAOHVLhRPnky4yRLrkfyuvNb3bfUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rA4n8dqhFUUYHiRzzHpNbhrYXEcDqPcdWPhRB5q0O0=;
 b=lZ5tJuiz9VX5JQMMIb+PHZcl2PfVg+iTa4uvWaoFCdqK9SuNNABHpGouMsfslRPqAXPZWF0z9CmPc4YfyHpuxRpyrbH3z02Flt1DbLHVynH3wBz63kcrDnd2i4s4T2MAjZdLYUOEqAv2TsFFtyThD8Nx5ZUdmVhLoc9WHzQIWg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:09 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:09 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/8] usb: chipidea: core: add controller resume support when controller is powered off
Date:   Mon, 10 Oct 2022 00:08:06 +0800
Message-Id: <20221009160813.776829-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 975aa26d-4659-43c1-ec0e-08daa9cd1fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nT7fjzBqI547Hxr58POM6UgivzJtCA8kL8jzehIvhkKN/KASy1rcXDppx/UlhAiE4/Txqynfgd5IW5NGxqrZkTxwHd5XS9i8MKD64P0BsL77st65Vrv8bLBm1nRbZaQnBc6S25O29gleJtdly9FzmYBzc7HiPX8hWejfvxGW2gezZEN/1Dl1pXMFsSWf5ryuh1QlDx9nigh8A5kwn/2WPM9FGdKA3649ed7H8UboFSie0zBbEBtPbLAexD37Qtqq+dbf+4zt2DfXaBRWCb5fLE25ATtwbORUS1zi6VCr8pDBdBve/h0Vli7zJeBD3aAFW8iS1WZaXj1V812Ob4QReOPO1DnruFrNgLc8ythS5V0LgFE09RfBFeH1PS6jr3y7oFzqidpZHKIw7lK8/riIAxjOLK3kY/3GApfnWYV7qem9gIDdCnk++XaIOKOKQgUWucgfIQt0Qq51YCIuxF8X+hjyQ/fPFJf1V7M1Ot9TtsOf/N+FoUkfeSWuyeGSpYeJDgi3kuB7ooT6de+NoinJanL1LqmmRDx4WouEyU60VTgOS8a/JEnkp8NrqKvOQzGehselCN8Et19IQB91UHeCIf/ciIJhJ6hKnA2Kb1eDFhmXZgiHHKtAYqKg/JU5h3H10Gkq7GNzXSKt2kT8U18h4rsD5SBEdOshqIq/NifYoNorhAs4eNPUmTIraRHcG0tBQ1YCazIhgxdo+E6aSa55Ri77ReBi+fZOzAf8Bz5ab5BEvx81zLhLime3Dl0n5po1vueY7yOiJoO5XsZJBe2eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LG3Qo6d6s0X9NbPL85/vWQ0jmD+kWAZAEaebfcw8i/cL1ggwQ45glOfRWdsA?=
 =?us-ascii?Q?S/euTZV4R3Hx8S5Xuelodx2SStLZ/ckzr+h92UBq7INKw/IQnxn2b+5JuMoA?=
 =?us-ascii?Q?EY4vBScB5fmhRCePd7Auqq+Ky4dOpPcn4BNdmxZgX5GXpqD9MjKxGf8w2xn1?=
 =?us-ascii?Q?efZGFijVPV/ELPKV+FmwCaJ9aCmVRwpMxhWLMuz5iJAEf5Bv2GEZCJph51Gb?=
 =?us-ascii?Q?4oxXIctIgATNrz9hPd0sSFYuZDSLmuF0J9+oDeu0ais/c3w33qwh+IzT/+DP?=
 =?us-ascii?Q?D9os6cf0r0oXoIWlEMOYyqCEyD012OzsxU1rCzWDYCPaWyhV24iGbUYusaM5?=
 =?us-ascii?Q?vnjHk4/FHXhKnWjYWnYt3m49K4genYiczBM78bQ4O6zZH4aIyVyhP8ZHvHJK?=
 =?us-ascii?Q?7BFI8jxePhDArk/aOJjBzGj5oPjDF1nPloHalnSAO1U7VUK23n+hefQ0eg8j?=
 =?us-ascii?Q?t5XBzqUKsdhaRnepeWLHH1XrtBC339ZBhwsvaXAwXWVUDg7/oWofQVlU34FL?=
 =?us-ascii?Q?3ZKf2AyDoAoKgmbNuNMe380NqIYWxIO7k1w29i1qdjCRc9UVJPBoObsKzICi?=
 =?us-ascii?Q?DtdGaTPfEYwZHMEvkq8hhxaZdSbrkw5zul91fyKyZLSHJy1fjBfraZVO0Ou/?=
 =?us-ascii?Q?32B4WjR36DW6iPGUeApKNFQzRKITTtatBM57OrK79vbJ5IJpbmdOZA67QVnD?=
 =?us-ascii?Q?v4nmopjT19UriBhzLWvX15KiJR5RRoxyesb01BH7YFEVctX66QnmxFsBLe0Y?=
 =?us-ascii?Q?NT/95Ped7jxdCWbeJO9R7Xz90SPq5MVhoqn4ahA4fkS5GF3nhsAnVUn6qTPq?=
 =?us-ascii?Q?d/kZBD2m7J8oAWPU9Eu+/3Wg0VZUoclCFA+/hPKby8RoSJuh3AhvxkSdO/Vu?=
 =?us-ascii?Q?5sqcYNX/yeIdrLeZhex4lY2UrV5ve9S/8j1kXb1sC05IlE9guVte9gyTmLy7?=
 =?us-ascii?Q?y4yM0m1hhfDuUELS7e3X1MV1DM1JJQM4ZnalpaY8ZdaW4JsASzsdATUeFPOg?=
 =?us-ascii?Q?nsyeNApzW0qmcuzB0WORCGsJmsjN3/lppP8ODMF9l7MzrlQnsuJ28UKmoe+8?=
 =?us-ascii?Q?vGiVPcNV23q5OgcBshCyMZqekAJUh1BwH9+nbUv1yTF7CfZiPdzeObd0zUZK?=
 =?us-ascii?Q?bewhk3O/8hQu1CzHXpbM2NKN3YscFzl3H1YceegTWZLeS86m/64lWicrpPqt?=
 =?us-ascii?Q?RPLe1kE7Cgf1lNig9b1OBbwSy2CYpT7pIEyKcaWznMpy3ejCUHWG326xgsfh?=
 =?us-ascii?Q?j0K4+mbQwOM90xIzljRo05EEB9Rtli3xUamP9gJCoaG3VVGTE7KFTsG+HKt1?=
 =?us-ascii?Q?T9h2OzfKDmTNUL/H5glrFVofK8b3HENnFqw5p0pd9M2LAiOn5AuZPm1yDna/?=
 =?us-ascii?Q?snFxUn1I4Sb0MfhKSqX6g0cqXWlrYCVvl6IWwwul0ASAsSWdmrK6YcUdrWFf?=
 =?us-ascii?Q?bB1vcH6to1ntzYGijvWRn+Oi/gdh/0mWryuQfrf6Uf0IqWme1AkdwZMlNe+j?=
 =?us-ascii?Q?Hwkca459+TVEvziRQ+DHNjToc/tEMejSRsoZ26QbgKYnNwyLc0u5PDMWvicl?=
 =?us-ascii?Q?uJ2sV1TviuUt8b2D/mTompRDQmTJSa40et00swsS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975aa26d-4659-43c1-ec0e-08daa9cd1fa7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:09.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we2o86OhQ0nVwPXCX89Q63GYidxEPpJgV6xjrd5GXIRFjEP5bJ70Qk48BfIP4i0h383HWqrtUCm2WiPsM6382g==
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

For some SoCs, the controler's power will be off during the system
suspend, and it needs some recovery operation to let the system back
to workable. We add this support in this patch.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 80 ++++++++++++++++++++++++++++---------
 drivers/usb/chipidea/otg.c  |  2 +-
 drivers/usb/chipidea/otg.h  |  1 +
 3 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index ae90fee75a32..3a39eb5e7dca 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -637,6 +637,49 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
 	return 0;
 }
 
+static enum ci_role ci_get_role(struct ci_hdrc *ci)
+{
+	enum ci_role role;
+
+	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
+		if (ci->is_otg) {
+			role = ci_otg_role(ci);
+			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
+		} else {
+			/*
+			 * If the controller is not OTG capable, but support
+			 * role switch, the defalt role is gadget, and the
+			 * user can switch it through debugfs.
+			 */
+			role = CI_ROLE_GADGET;
+		}
+	} else {
+		role = ci->roles[CI_ROLE_HOST] ? CI_ROLE_HOST
+					: CI_ROLE_GADGET;
+	}
+
+	return role;
+}
+
+void ci_handle_power_lost(struct ci_hdrc *ci)
+{
+	enum ci_role role;
+
+	disable_irq_nosync(ci->irq);
+	if (!ci_otg_is_fsm_mode(ci)) {
+		role = ci_get_role(ci);
+
+		if (ci->role != role) {
+			ci_handle_id_switch(ci);
+		} else if (role == CI_ROLE_GADGET) {
+			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
+				usb_gadget_vbus_connect(&ci->gadget);
+		}
+	}
+
+	enable_irq(ci->irq);
+}
+
 static struct usb_role_switch_desc ci_role_switch = {
 	.set = ci_usb_role_switch_set,
 	.get = ci_usb_role_switch_get,
@@ -1134,25 +1177,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
-		if (ci->is_otg) {
-			ci->role = ci_otg_role(ci);
-			/* Enable ID change irq */
-			hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
-		} else {
-			/*
-			 * If the controller is not OTG capable, but support
-			 * role switch, the defalt role is gadget, and the
-			 * user can switch it through debugfs.
-			 */
-			ci->role = CI_ROLE_GADGET;
-		}
-	} else {
-		ci->role = ci->roles[CI_ROLE_HOST]
-			? CI_ROLE_HOST
-			: CI_ROLE_GADGET;
-	}
-
+	ci->role = ci_get_role(ci);
 	if (!ci_otg_is_fsm_mode(ci)) {
 		/* only update vbus status for peripheral */
 		if (ci->role == CI_ROLE_GADGET) {
@@ -1374,8 +1399,16 @@ static int ci_suspend(struct device *dev)
 static int ci_resume(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
+	bool power_lost;
 	int ret;
 
+	/* Since ASYNCLISTADDR (host mode) and ENDPTLISTADDR (device
+	 * mode) share the same register address. We can check if
+	 * controller resume from power lost based on this address
+	 * due to this register will be reset after power lost.
+	 */
+	power_lost = !hw_read(ci, OP_ENDPTLISTADDR, ~0);
+
 	if (device_may_wakeup(dev))
 		disable_irq_wake(ci->irq);
 
@@ -1383,6 +1416,15 @@ static int ci_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (power_lost) {
+		/* shutdown and re-init for phy */
+		ci_usb_phy_exit(ci);
+		ci_usb_phy_init(ci);
+	}
+
+	if (power_lost)
+		ci_handle_power_lost(ci);
+
 	if (ci->supports_runtime_pm) {
 		pm_runtime_disable(dev);
 		pm_runtime_set_active(dev);
diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 7b53274ef966..622c3b68aa1e 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -165,7 +165,7 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *ci)
 	return 0;
 }
 
-static void ci_handle_id_switch(struct ci_hdrc *ci)
+void ci_handle_id_switch(struct ci_hdrc *ci)
 {
 	enum ci_role role = ci_otg_role(ci);
 
diff --git a/drivers/usb/chipidea/otg.h b/drivers/usb/chipidea/otg.h
index 5e7a6e571dd2..87629b81e03e 100644
--- a/drivers/usb/chipidea/otg.h
+++ b/drivers/usb/chipidea/otg.h
@@ -14,6 +14,7 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci);
 void ci_hdrc_otg_destroy(struct ci_hdrc *ci);
 enum ci_role ci_otg_role(struct ci_hdrc *ci);
 void ci_handle_vbus_change(struct ci_hdrc *ci);
+void ci_handle_id_switch(struct ci_hdrc *ci);
 static inline void ci_otg_queue_work(struct ci_hdrc *ci)
 {
 	disable_irq_nosync(ci->irq);
-- 
2.34.1

