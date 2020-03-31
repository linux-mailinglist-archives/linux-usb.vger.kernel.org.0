Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1E9198DFF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgCaIKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:10:15 -0400
Received: from mail-eopbgr20080.outbound.protection.outlook.com ([40.107.2.80]:8974
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729950AbgCaIKO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Mar 2020 04:10:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAlM+YDzQRQfltFsi+IplupId22hlGXQh+iraIrwaL+1ZUZrH+kwofxTGLnkZKcC1I8cLfuqVNOlD+bixY2iEgyUzjpi4LPWzyTazYcC1MYkB0OptTgJG01PY2qdffEQcpL4JJ1h/bUjSJgFYMm1b2+Pugfa75vfVHD088LCLZEFe+mxIqMxPI40TVsEj85AdBsjrEdvo90K+yXWRQAVriBvu2zN414unDbQ2pD1X+ESLO5QWjdjCOmORwNp2OFc9xLVzIsuv5w33QLNyPAU/2RHQ2nsjP4C94NP11M5xLlXynRTz+V9OOvhVbVvczLyM0uCesqgdrT3+L64H4MdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYX51b0jE15IVAtYC1Si9bBHA+W7j9qFsPyHajnvFuA=;
 b=DaONF7/oBa3GY2yfuE9s0+7dv0SQr5ECb/A7WJ+/XhqPQlv+NH/Y0fiJNdQaelnC9yBXi0tPqUFXYqAl/eRuBgZHChQatJWCFe94RP4JYflseyPc7VUDjisL+ECda4YjY9WaMa9PxnexoKJezTFeW2khwzwrhKFw1C4VJYArk/uBMDlu35e4mVY+W8/7iq+JxYHppZX8zTgVxRgWWBXM6L5x3rx58qfvIVpgxDnB+gz7dQ29XSfDtOpC6//t8jkcaaFPQpk4lY875Oy/UW6aPemkotmesRXSAF/zq67VnxXKhlD0mDtO3zMy73pLJNsGgZNg8YY0l768yoWF+ubAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYX51b0jE15IVAtYC1Si9bBHA+W7j9qFsPyHajnvFuA=;
 b=EwwEyv/LwNKJFtqDV+4MCztcMvv/N0cJLbndvoy59f6JrxG6E4mt2/5EjCzeriwTWYaT1WE7haGdiiYCA43Kc0mP0p+7/zfnKXp+OOnCQW7u66cIjueGXK/CJ5PegNEkIiq72k3TT5tXUI2qPWRyFAiMyJsmcTR6h53qI2DzL1E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB6934.eurprd04.prod.outlook.com (10.141.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Tue, 31 Mar 2020 08:10:08 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:10:08 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/4] usb: cdns3: change "cdsn3" to"cdns3"
Date:   Tue, 31 Mar 2020 16:10:04 +0800
Message-Id: <20200331081005.32752-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331081005.32752-1-peter.chen@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0123.apcprd03.prod.outlook.com (2603:1096:4:91::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.9 via Frontend Transport; Tue, 31 Mar 2020 08:10:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bee5e3e-b5f4-4341-f8c4-08d7d54aed8a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6934:|AM7PR04MB6934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69342CC7C89037FE623135768BC80@AM7PR04MB6934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 0359162B6D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(66476007)(5660300002)(6916009)(16526019)(186003)(6506007)(52116002)(26005)(6486002)(6512007)(44832011)(8936002)(956004)(4326008)(81166006)(66556008)(8676002)(36756003)(2616005)(81156014)(316002)(478600001)(2906002)(86362001)(66946007)(1076003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 78Uyt6kaKQ5sTarxPNQ8GIXhUZ7hSQqXiYnau8bMuZtY7ipzHYqTjsnUrip9yBRF2lQksS3DOyCI39azrMWnDdg8WJ4yQjLOi6v60Ri9PnJhziWGhrM7a4u5bCge+aNzDQ/pG8cIb3C/E3yVq9OYu21Z3s90NYPSPGnxIFst8QSPjKO9aBvlYUcqWn4S7rxkHWcrgRru4jRlaoyqYU/4aZkH7sp0bvQUli0lkuB18nn90ZtfHNR1403hkCGRDJpyXObejhJ/1HFZUZ73h+fwB/r394oDf68m87l6U4iRI66Tbx5imYJY1X+L5GSfXGYn9UgCjPl7MnA53ySELvmVndO86rGQK0vsaROON1bU8MDgzZMkJmSP6FuTRjxtDUwl//w+258wH9qX8sj7FvXjrjnYPEUZdO/L6DH256TTlvI2+gbpACHaM42Gmq7ej1CM
X-MS-Exchange-AntiSpam-MessageData: G+B87m3hpKcXpJ7TCooOPXOt9czx6jlyY20r8utyfX9O/Ggj9OOjaHkKkZZW1/qlXWdVh0n04BUUceD1N2JWDRKoYi+HNJpC6DKrEXl0aMv38UveCZw1GJoqCgpw+2wJh9Qpkmj/yA+zXeYTuXR33w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bee5e3e-b5f4-4341-f8c4-08d7d54aed8a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2020 08:10:08.7361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrXMwd3gzbSc6il+4H6RTeNCMCX/cpBfvOWi6cDLiiG2wJO+yPtEjHbW+osEnW4HDcydmVla9FWcH7wxpvzQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

And delete cdsn3_hw_role_state_machine declare which doesn't
be needed.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index f57c66a9f87c..19bbb5b7e6b6 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -82,8 +82,6 @@ static void cdns3_exit_roles(struct cdns3 *cdns)
 	cdns3_drd_exit(cdns);
 }
 
-static enum usb_role cdsn3_hw_role_state_machine(struct cdns3 *cdns);
-
 /**
  * cdns3_core_init_role - initialize role of operation
  * @cdns: Pointer to cdns3 structure
@@ -193,12 +191,12 @@ static int cdns3_core_init_role(struct cdns3 *cdns)
 }
 
 /**
- * cdsn3_hw_role_state_machine  - role switch state machine based on hw events.
+ * cdns3_hw_role_state_machine  - role switch state machine based on hw events.
  * @cdns: Pointer to controller structure.
  *
  * Returns next role to be entered based on hw events.
  */
-static enum usb_role cdsn3_hw_role_state_machine(struct cdns3 *cdns)
+static enum usb_role cdns3_hw_role_state_machine(struct cdns3 *cdns)
 {
 	enum usb_role role;
 	int id, vbus;
@@ -294,7 +292,7 @@ int cdns3_hw_role_switch(struct cdns3 *cdns)
 	pm_runtime_get_sync(cdns->dev);
 
 	current_role = cdns->role;
-	real_role = cdsn3_hw_role_state_machine(cdns);
+	real_role = cdns3_hw_role_state_machine(cdns);
 
 	/* Do nothing if nothing changed */
 	if (current_role == real_role)
-- 
2.17.1

