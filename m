Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FAC73FAA1
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 13:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjF0LA3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 07:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjF0LA1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 07:00:27 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720941BE7
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 04:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd07ga6IUftVho3Ia/5zoo4S4bvlH++8p+clo3pHAndcVUL3xmLVXwqjcQg00TkwDGcnTWHv1BAuLoP5ntHkNB8EucDFTSkKJgt6/oyflssH3oyNRFT6tDzsWCngVHP/33mIWRomCkKlZVJnXhez/AztC0eGj1vLIJRgG8sFSPYtFMRoHL2Xpfq9S34GGIHyFdhOn1IDNOwxZM8dWYyr2lR2ETJQS3T+g7qe7WqLtHLE9CCCTDtketev4ClRpRwkbs9zaTtEGgV30PHY8+gGSvWd6lIZKgtFw1CxkKYwTB3gWGDvU4JjAZ8vZad1GDWrevj6k79/i+Zl8XC9b7sNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhXuCDUG8dJxI/URKLPtltDnGXmnWRs3uNRkTKqFwZM=;
 b=GrL25z6vmgrmRGILT7Tk5iHRDssD3d6ZWTkdYk+fDiW8bASN8Vmgm1vkL5UqZSRFaGmzrzDqy037dsG7KJZPKkGhRDJ/x710Ez91y4KUmcLIzQ0pqaKBmyZSCnNp0kOHM/henWdqfdF729CkrFU0UZrJW1G2J+lkX9v35bQmyBYuSbrvqJJbeS8rO0q7Un14AFQl8U0H1I2bUofLPEplDySsZo12J0vtiS0JD17vcOdhoDWTBJJEBGgOduyoPM4Oyd4yC7IgSeS7AbPqG+og0ONfstvNPXssQH3F1lTtw6E9XJa7QzyPScx25OWgkYm3Scjq4oXI6ke8z1sA6CIaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhXuCDUG8dJxI/URKLPtltDnGXmnWRs3uNRkTKqFwZM=;
 b=PqbSDQdhmV/pxUgXUirx08KkXiEIos3ZSyVNSYAgpN8AC3YqKXuDZrX/p7Qds2Gucjl1QstQA5A7Fc8oj3T5mLRON+/sz61KLLhMyzpt2YhWzagrWHbr5KkrRCBJw+0sNMqEVq5z0AjNHkzZsTnXfbmO0hK+onZ67fg8DebKrQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB8114.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 11:00:24 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 11:00:23 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        balbi@ti.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        xu.yang_2@nxp.com
Subject: [PATCH 1/3] usb: chipidea: add USB PHY event
Date:   Tue, 27 Jun 2023 19:03:51 +0800
Message-Id: <20230627110353.1879477-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM9PR04MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 766e6fcf-6fb9-4c6f-3ee7-08db76fdb4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CG5FDUycdmbFZbdCVItgAkZ+iulDNvZNpIPWn0qPsmbLr+ld9Q8zTokAyFtX/XKzSFvURzbFbQ8PQCQzgfpuhd8BiaPtrh172ySsSO9VWqTZ34XoickkvrWA43KvuGPqFSPaX3y/5l5z/eM/Wkgr9tHOC3dQavgaWuRMMtx/Bor2toR/KRUNrs+ZLg2Fjtx2V1IwqrdHt/ciQCE3F29gImAp3f/haj7sEiD/pp+t8qzm6yZQeLyIGG2MluA1vHN9MwrZC6g8b9m4gJbvuWiYw3W2mviHGjJG1r2YeK2gU7b7LnFP8bXppmTBnOWtJsY9CiUP8RDWt8cQ7GfRuFzsPVoTT4PTrH04C/pRL7pFZ3cmiO4yTCmZd/qmE5LdqPv4ZKD6eIxOkn5fF4PE8Niofbu3J9gM2gD3vkt+HgW8YKl+T+ifszja8TFBr9R8xHXtakTgnaAU+3twzFLAH9heLLo9zn2YqIUkTEuzPUgGkLjJQ5CylAgrf1yTyrjlnYhMe/7/qBBYQN6AmdZSZMBL6n4RykB9awHiEIlOp1CNZQJQ/aKkLVbPKmy3KErfu1+dq13Xf5eCh46g7O6ZqYAKXyCGFyyX2YeD6SruXrTDaw/FxjOBKT+AbTh/7WgadX+w
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(6506007)(36756003)(6486002)(478600001)(52116002)(2616005)(6666004)(83380400001)(2906002)(26005)(6512007)(186003)(1076003)(5660300002)(316002)(86362001)(66476007)(38100700002)(66946007)(38350700002)(41300700001)(8936002)(4326008)(8676002)(66556008)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSGZk81sleGF1AIX0XbUsiYbnqC6o/Jo9PmD/HzOgxPqW8Q2nrQcJYgny3oG?=
 =?us-ascii?Q?OZoHqcao8iBM8D2clV54SCzjkk8k3EdZiW/UwHnZgQ7/os36LhgKYvQAwMiU?=
 =?us-ascii?Q?nnoUaeDjxdQKzid8K/afzEjNjE741HRg5M1HDNZYfVKyZSdwP9xua4SB7buy?=
 =?us-ascii?Q?a1lVN7HU/3VyeJ+B6sY3Sx5J2MceNsaDD0mX5MY3BAe12qsdlK7l9vMP+AbS?=
 =?us-ascii?Q?U0gXKSco9RvtrAhoBN6tmFd3O4mXEfXsECaasEiZG3WzmaVLTr5WZYvccUsD?=
 =?us-ascii?Q?ncGnF7ZSKBqWHIqY18azEuDo9ZeBkmWx9GVsFAwlA8Si51C74xeg7Rc+eAbr?=
 =?us-ascii?Q?0Y1zfQ7EBpxy2Q6AhyrQpxNfz8Zj0gMk715k7lzuOzTLz7m2GlqqQWe+b7Pr?=
 =?us-ascii?Q?riAIMDy8M+SyEHmZ3XwjdM0ocdfOgfZ/7DpTyiFeYtLwwPpkFetYnhLnQijH?=
 =?us-ascii?Q?bYwtNeG497DqHcTbvciVExRPqSgkNWYz/mp8Yd/yBc85q58Jb6tjTUGKnGkA?=
 =?us-ascii?Q?zsVW7VHdPFgpiXG8PyNsCjH+h+ophMQuQbtoyzTYRrnx79rR6m6vUDz3I2OG?=
 =?us-ascii?Q?c8x0v0kCvPRX97GK9p/gspSyS6cFjDp/DpgthghN301cvNubIhZ4TXiyQWw7?=
 =?us-ascii?Q?6kQj0Q2b4nbM5Fh1hbVuJGkkaNBVTMwCGRh/tCcN49/1mlocdeGyfpXNIU2+?=
 =?us-ascii?Q?aiX3LkqnU33fqDKbm7inymrwSpMB9ZRms5/k0eBq1yozTLpcxDhCVrCxgVEE?=
 =?us-ascii?Q?Qhz7zqvWqD+ydbjqs11xEGfzFKt6avyZ2Vrl4AGSAnY0TdOC8e+4jGbp1W0v?=
 =?us-ascii?Q?DBX9s29Hom6oYO6VzMopRA8Ig0RJslHwlBB8AMUHKnLpeUtNK7qc2Yya530G?=
 =?us-ascii?Q?xF81EOKnNv8hf2OzTfS4MdkrHbH/pcKQVq4VMiPRcBP77MX789sCuOSRjBrT?=
 =?us-ascii?Q?OrWimpUvLdANUICQJdJeBpRrHlbf/BcAec2JvLFeJG0fI7omtUNVC5UZHoBk?=
 =?us-ascii?Q?hV7rC1zUnvgCOtoZbpUjskdqjdgRQIhLnv/ogDdJbgD4abTcXC7Xm7grOBBu?=
 =?us-ascii?Q?1AEtR630bOHHWAasqEcO87kpTlMx4MPoK+Q3Ll7VD7VDMnVJkvUqVVy3INbv?=
 =?us-ascii?Q?6P+Xyd52JAiBPnFiBPCAnSqjFv4ddJ0TtCs56JPJ8+ol8BH67uXb304zPpCe?=
 =?us-ascii?Q?pzdPloLZsmz89XYMXXUYc0ZrABjTxeH2Cu83Wfyh+tQlqJHLHxgcGjH6ijNo?=
 =?us-ascii?Q?6pvAhl/PIVP/U43Ywxd/sMOlxCnhlyg2k9Z3Jhfm0CThVpDoeVEU0U6uBfMJ?=
 =?us-ascii?Q?7RhpCCuCHPkrA6w0TmHclSUANqjvrNftC+hK9Hiw9mbygD+EnROkvUffpTse?=
 =?us-ascii?Q?lOP+gIa6I8TvpSXfPp1yS+A0k0rwvqNwI66Envbe03zAl119DLfEPP40+jJ5?=
 =?us-ascii?Q?tQwOIpemtP8u0qRgkmWrTfOFu1O7BhS80yeEj42q4yhWy0Nhn0CmL8egUuIo?=
 =?us-ascii?Q?Icw/vSRjgBRk6JwsO/NU/Gbs9U0mWd+BG6R/Tf9Bs4oyrKX/pREZ8kYNIlGD?=
 =?us-ascii?Q?xgXfxCzBPtfmQnL+8iWBCASHWrgvviTE/AQic8bg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766e6fcf-6fb9-4c6f-3ee7-08db76fdb4cd
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 11:00:23.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTrMkkl0pWy6aQE8SZ7Qkx2RmYboJpVI+C8JU/pcV8xE4nUWhxHnK/m86KEKvUiGTaiwUAjuAXvy6FM2qzRVhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8114
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add USB PHY event for below situation:
- usb role changed
- vbus connect
- vbus disconnect
- gadget driver is enumerated

USB PHY driver can get the last event after above situation occurs
and deal with different situations.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci.h  | 18 ++++++++++++++++--
 drivers/usb/chipidea/udc.c | 10 ++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index f210b7489fd5..d262b9df7b3d 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -281,8 +281,19 @@ static inline int ci_role_start(struct ci_hdrc *ci, enum ci_role role)
 		return -ENXIO;
 
 	ret = ci->roles[role]->start(ci);
-	if (!ret)
-		ci->role = role;
+	if (ret)
+		return ret;
+
+	ci->role = role;
+
+	if (ci->usb_phy) {
+		if (role == CI_ROLE_HOST)
+			usb_phy_set_event(ci->usb_phy, USB_EVENT_ID);
+		else
+			/* in device mode but vbus is invalid*/
+			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
+	}
+
 	return ret;
 }
 
@@ -296,6 +307,9 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
 	ci->role = CI_ROLE_END;
 
 	ci->roles[role]->stop(ci);
+
+	if (ci->usb_phy)
+		usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
 }
 
 static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci)
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 54c09245ad05..d58355427eeb 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1718,6 +1718,13 @@ static int ci_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 		ret = ci->platdata->notify_event(ci,
 				CI_HDRC_CONTROLLER_VBUS_EVENT);
 
+	if (ci->usb_phy) {
+		if (is_active)
+			usb_phy_set_event(ci->usb_phy, USB_EVENT_VBUS);
+		else
+			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
+	}
+
 	if (ci->driver)
 		ci_hdrc_gadget_connect(_gadget, is_active);
 
@@ -2034,6 +2041,9 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
 		if (USBi_PCI & intr) {
 			ci->gadget.speed = hw_port_is_high_speed(ci) ?
 				USB_SPEED_HIGH : USB_SPEED_FULL;
+			if (ci->usb_phy)
+				usb_phy_set_event(ci->usb_phy,
+					USB_EVENT_ENUMERATED);
 			if (ci->suspended) {
 				if (ci->driver->resume) {
 					spin_unlock(&ci->lock);
-- 
2.34.1

