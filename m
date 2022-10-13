Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDBA5FD56C
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiJMHMq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiJMHMo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:44 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B467FF8D1
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsklKexm6KVpe4Tq8thqV5bzcKQhh7rguFrHpTuXBCXV465H0a1JXBAz/cJ0aM2BbXZBh1QB2V8pJ4c2dN8noxoXgpfEaM7qHcrJPiU0InK/BSAo86FKCh7Sptxkkf+HVfzZ5iY3LAICgYpM5PhaRh1MeUKqMRiluV9AHVL7QlPlaZ5R3IfbNwYjbBJ7fHsl0rLyriTo59LBMTM991zyTzfmPkkuqKDoorCrSh8ClRdGnkN/JyA+mTz+wTL1HPcf0qEfCJd9GEZkkidszLoNIwm2MYhvAjiwvyAiMKgqLytwugZgS7/5T95puZQmBytiN+zxcSokiVLhh8XcXWMIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfr8uR5zlqTwzz4sp4GX3CWRVHjNBWd6bsjciZTifvg=;
 b=WygR1PXI97YuGljzNl7nTN9+Nkt8EH8ZNsdrp4Muh8R7xoQR6iOCd38MQe8xwvEE3u+UrzDBlabdntgyd/hWRolXk8jS7SKl6rZfIthtzuZIEi/Hl5/lwEY6kBgxgWyvrKINtugxTh8yrX0CppmUTacmGDeoAMZxgj6N6b/hyFt0kXI1Hrz0rKGjhuc2R+LFYjLmpxuml6P9fQkAZpg+VSj+ylqQuTH9ImMfRXkn/UGnTDzoKA/L7rxordn04BqIYaAdFOFd5+B6LsGlZ2b9fS202Di4tLzmfC0FAaUXEzo8bGPj276ghaC8BCIXZRAI0bepUsr5TsoVfywA02fDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfr8uR5zlqTwzz4sp4GX3CWRVHjNBWd6bsjciZTifvg=;
 b=SCQhh2DLFD2WCX6N5sHUKDRSWqCGTzUbYMzCUbUtjgKlIUGJrTvhA+Klea2uviK7kxwoahUOJVEldHR4+xw4RB0PGXkBfBKpxrXcCBFMCfqNxWmKbF3tyn8c9oitCz1T+ttjWONSnGtDg3Dyi6wqekSp8X62HJl8vmZKqzliIaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB8444.eurprd04.prod.outlook.com (2603:10a6:102:1db::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 13 Oct
 2022 07:12:40 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:40 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 1/8] usb: chipidea: core: add controller resume support when controller is powered off
Date:   Thu, 13 Oct 2022 23:14:35 +0800
Message-Id: <20221013151442.3262951-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151442.3262951-1-xu.yang_2@nxp.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 911d9ec3-c01b-4cda-366d-08daacea50e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/pYrwvBLAjcuU60wP/l4x6QypMovNUSAmZ/wM1anX6jCwXCdMhi6kzGVyIW+8w36l6A4XhWQYpjupx1lKF/tZb9cbJSZZk73KLKg67HtO1x7+/Jo8vEBBanZZ4Q2+QmeneAASPcP/pHC6KB9f8cV4YyMYq/dickRgMHuyfzMqH4968cKP4EKjBMY7DT3cUb3WEYs2a0cWxK42ZkY/gswqMSqy2+RrXNFc80UVaAR/Dz8O75rDezs1aIWRK+VMgSZ1NkToV4X+mFYXy/EyGCEfNFWbRlakV5noOT4SB5mppGwb7QSl+hHzln9S76M5Ik97K2J+7N5iJpHP4NeC0IR+eObbZIef3KowYF4pELixd7rGyQUlTgSfcgqIQM3k567Xm0UJ8m3IBRgJGwDJJ6yf0udKRivOu2tTGeAMelPYcEuPXFswTA7VVIdEFELu/fbPwKKBrAB/Qii97Hlkl+g9e5sGxs5wUgy8GAOgA+YxQ0hn6gcgMiGihYi3wJHLI0IXiYjagC7qcvy0ICyKptczZXaGM+dl6RQBO9OO2XasHkruIHg7ix/DeVQi7sv1d9PrnruSrfGlLEOPehr83eN0evA41yn6/L7iDcPJigM92dunlG0hm9VNGJi9uBHnO+GBnwpFUkiwwNZByRfY9lnb5f8UNSzvjBCTVhnIjRv4HIE5t+CrXOEaElxsQpzFBQA7Qm3Ts5creLgtKnpxm6c2JK/2qB98LgjSrNz+51ppUztdU7091GHGbBiKjsSX6CIB1RTKGx7WJF/pE1NEhq9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(41300700001)(26005)(6512007)(36756003)(6666004)(478600001)(6506007)(52116002)(6486002)(38100700002)(316002)(38350700002)(186003)(6636002)(4326008)(86362001)(66476007)(8676002)(83380400001)(2906002)(66946007)(1076003)(8936002)(2616005)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3veGTA6f0Pa9LArxAXs4h4/2mZj73/EccskqXGqivu3ewT5jMuTwmhr2pP/K?=
 =?us-ascii?Q?k56XMBUlooEP041FulhoaaHDDA6i7Y69Le80PYmwPDnPE4AJ4ucnq8R/Q2wk?=
 =?us-ascii?Q?OuL0HlIlYh9MjyyA/YLhDpzYAmLdM0U1XbWPvHfAC57uBrjlO80NVQcfdgS5?=
 =?us-ascii?Q?Sjr8Yj/4VKUCEQClicZ6YqvCjxXDR9WHK5c4kACsRAYPntheQn4fSx4QzWJY?=
 =?us-ascii?Q?X5l/kmv+LKp7QI0idzRR+fRYBx5prsnkCzBRIhWV9iiv6kR1968iThX81WTJ?=
 =?us-ascii?Q?jtvH6D0TC2j0ltBB1RXf8rTXtC32B7TUmbXDCBHDF3vr0c7mT1gJf0QNuRJq?=
 =?us-ascii?Q?RKyONrJT+Q9RgiCMgvZg8pxIeu65kxDCDUSMy8Sr96pDJHQHcAr6kSm9OLT5?=
 =?us-ascii?Q?jyMV+qC3SAEbXmRrwu9W3F09isd1KRzGw86AZPX3MwNS+tLYU24xb290fT5J?=
 =?us-ascii?Q?AkMjPzbc4vYIepFZdcwz/kFlqescNBofGmjBJ1e6in28e08WiSRz6fREwX8E?=
 =?us-ascii?Q?kt1iknKCtlGG9/Enqt3OfXbUbj1OMUg6zZUiJqaOWwLngzWKbM3vuWyxLeF4?=
 =?us-ascii?Q?ORg+rHzi1nXAcxjADgwIRyYhaJkpJzOE9Q8oeBTBXF5FKiVfu8njndSVqtab?=
 =?us-ascii?Q?7843Eyq4+jglKzI0nRPyfTG87F9CY/ZE9T7JeGcPJvBmHe8QBvTdPPlq+ewN?=
 =?us-ascii?Q?Qg8eKuQEkyNyVAZW6Qu1zqOvvmamRWjy18DHQaXHR5EHKIINjrTtCu5D8RvL?=
 =?us-ascii?Q?aqq1CAcGki/Eg5HZW7UiIcscq7jwd5/nIMDiWi70Gziru8XmMb1jAA+FdXze?=
 =?us-ascii?Q?4GMx5gf7mmcGr770o2IY20CqzOfGhb8h/GRhrfm3Keh80ELfCbDiER79F+MP?=
 =?us-ascii?Q?cuxYRp+Ry3hesEHeUI6DFT+0tzEHFykJdt4WG5a95qxT9ApfggMooaXcr2jm?=
 =?us-ascii?Q?WiXjMHaAUyXCEAEbub635vOVfI2o7iLCqajOYqCUTcozLzdqWCND3dahnsei?=
 =?us-ascii?Q?hOdR8gGBNV/wt4wvBwlWaH2ijz0t/flIkakHdAB54P4aR/Ssq4Up8eN6/8+N?=
 =?us-ascii?Q?SIix1GTQmzYr8cFilHktL9E0iIM82jvhZe2sIBDDrJRADHkmbds5yutNSnpn?=
 =?us-ascii?Q?y+/DIzvlO1TznF9muTTUk24plaMizW9nKHd6xF51hGEWUXoWlyp9nFNHOKFT?=
 =?us-ascii?Q?V52lYL9bpCtImyOl2x4YCIzrnEjl2PKq6H51m/C6XfyPseQLYBUBV6CIuGJ0?=
 =?us-ascii?Q?jPf3B9gvTWU1VV5dYg+88eBTZ5+H5jSc4ItukcA0KZAk8rag4eq9Mhrqy1Cl?=
 =?us-ascii?Q?rK2GR2UnAGs1hgMnZI/ehjiyJOMxFauqeQ0qG3ZxRy/pAq35L64nouGsz1Wo?=
 =?us-ascii?Q?76Ql9/6VJ89BOC3W+hCnv24Ff392jPOIlLo1tv/SWI5EgowUxIDumqmQnQpE?=
 =?us-ascii?Q?bkIH0vQBi2u2SSGrCI3uV1GIHArrx2essLwQNfPuA/UPOLKNkCRsCUnLqnLA?=
 =?us-ascii?Q?IZYa4RKMuBS+DIzzglbwIEL/3qrj6RVraR7fYn8hu+ET4OEV0okMHKghB1BD?=
 =?us-ascii?Q?ZNyFF3Q4DS3rsP2P/9xNoA1pdL1FIfIZfGJ/9xSq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911d9ec3-c01b-4cda-366d-08daacea50e1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:40.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IJSJ8GFt/FbqiAhukDcO0+YXa/wTyKd9CshPKbdd2WNNzwcfg5n0io5lWCtGHViKP6RDvaKdiqKDdnKzXd6wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8444
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
Changes since v1:
- add static modifer for ci_handle_power_lost().
---
 drivers/usb/chipidea/core.c | 80 ++++++++++++++++++++++++++++---------
 drivers/usb/chipidea/otg.c  |  2 +-
 drivers/usb/chipidea/otg.h  |  1 +
 3 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index ae90fee75a32..80267b973c26 100644
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
+static void ci_handle_power_lost(struct ci_hdrc *ci)
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

