Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978A32A447F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Nov 2020 12:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgKCLqs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Nov 2020 06:46:48 -0500
Received: from mail-eopbgr40066.outbound.protection.outlook.com ([40.107.4.66]:28642
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728687AbgKCLqq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 06:46:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c08olgZsOnRm+EkBTfBOI4FA186YZ24wdWmHS1niurjvUuT8hVgwGi6qUEZ87RpYnruoRekSPvBhpHT/ByaYi8b2gefCzp5otj5l7BGFviVV8TquH1qrYfsZM0WZ7Ezq/5MZLWh9eJgRft53Ygb462tyIml/7vraUCug2gV0XAK8A1sFAxhVQgyQCqkGcGWZmTUKoOIUcpEXL7t5m9s9vZr4VrviIJlZB/x3973TeU0wcgjPS42OIClJ1k8CyFaQdicbirJtn3dBdwJOz+EF8px2GsmcZDuYIeuwaK3RIyeA2ZpDhUIYuJIIoEBwTaA3S761uFj/dPbblwgwMruBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYw9QOWipAPRCL7dYJyu98rQ8T8VyjG02b+r45CKa2I=;
 b=CtWPO21wMBjppC5aTo2kGNftCczHhs16ei4cP+gjKK1sxQxfZzlAnoohMfxy5fEQPKQtbfo6whGBEwxp33NYghwY9TnaUGsrI7sx+GqVw8ajBNslo405ED66jDF4OnKnJL4ztVQg+o8iirD+m9Nrnx7juFX3Qu/IkSrJqxMiJM4yywxD5aRgSWBHJ+iEAKntiPL1WHReJJ9Qr5vhG/mglI16aYb5Df9O2x17kw4IY/MYCmU9Cs5zj8+llQw4GXfHIEwCmANeqo/jbb83uA+NRzVNhE5U26uXQ5KHWa6lQRSO5ECNGDEUoIgxX1OT5QdL7KTIhqH6/lNMWJx8OShi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYw9QOWipAPRCL7dYJyu98rQ8T8VyjG02b+r45CKa2I=;
 b=AgF7SuWmgDbxmgCW3tcJJFxTksdj0t0APK+cvnuo+bGYkFkyYqxKYmVPYIHTxzYZy6emEA+xnKFuPjNU1zL9jhiZ3jbEFP+SBMB4x5J2FGyWkaKfJteln8uLd19UmnutiJV4X2H/73+4NP7nRfUQOhqnn9KbFmBSDsWpJkMuydE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 11:46:32 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::852e:24d5:4c9f:5bdf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 11:46:32 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org
Cc:     gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, lee.jones@linaro.org,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: [PATCH v5 3/4] usb: typec: mux: add "compatible" property for switch match
Date:   Tue,  3 Nov 2020 19:40:09 +0800
Message-Id: <1604403610-16577-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
References: <1604403610-16577-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0131.apcprd01.prod.exchangelabs.com (2603:1096:4:40::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 11:46:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6cbd9975-693b-43f3-ab4b-08d87fee1b89
X-MS-TrafficTypeDiagnostic: VE1PR04MB7278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7278FA0E4667062791AA6C5889110@VE1PR04MB7278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EkHFvnwZZ9+9nAT3iseZPyMSqQ3DYKd69w65Fxv2BpeaiBHs/3k8QFavj2Tfhe5hSUjBwEcJrsVZM+cVLzwSoEMiUxiY4R+YxF9Nsr7lyCyadt46ZCZyccwybsajP3zxW+Sv9NOHLL4ZlGtrhIhDWRWUvpDuORI4V5KCSNdLuHsZl51NtgUE/LuudSV7y6tLAWBOGntsOK9fkFo2KO5TWUdtzfjubcEBrCSeuawoGJEdC8GeggT8gmQ1iMcMM7kp1NqRM5HGkdBmDm+6frtrI3CFoJ0Elxf9u2wYNDMfeP0edP26AfBfWNBw413Qa73Mallt+3aIbwaKQYGsr2o7vZMuv93RHfO7nLAi5pijEVcnbaxKToPmCSFKvXcoKSRR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(69590400008)(26005)(316002)(16526019)(186003)(8936002)(6486002)(6506007)(7416002)(83380400001)(4326008)(6666004)(478600001)(36756003)(956004)(5660300002)(2906002)(66476007)(2616005)(86362001)(66556008)(52116002)(66946007)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: quiU8LxRhZVI8IgCJBVukABYQ6O4/r96GOYu9emVjktZ4JY2C27/7q1KEphmrg4ixYjgm/GKNT8bNOEDN6p+G9ks3yK//nUzJLZjsPk+Jd+53RdReFuYMIiSLqXd1qur2P4Rx2ROPY2vhc29p/GilzCLNcBlcHMeKUDrRVurzto5HpAC74KA5FbtO2Bqi6QHh+uifTL3+0N/BAX3b5z0CSA53ovVGHzDSginMIoKm6fWK47NcClUEFIWGMAYozP7mH1SMRJLnsMF2ORkpwLcMmu5nzlQYuBuiI83yFvhRDt16W77VfABUHlga6Orad844Hy2ASGXrkxkuXZ93Gqbe6zh6sVvFXK/8kND3m2Se3E/rTTvVkxA9mmYM7+2/vXUCd4x8Yft/DwgeZ9W9y1bf7Uwn99nGixcdoAxSe33UX22LUN5Nk1u2/d3xyA/6IEPta+tPFNKYrUi6XhATNIGTFBtgKzJdpZAu7L17yws+QpvQlhBFyLLxc8NNohtZQwgwOcXgE/e2juIx5jBrZ0CSnhAe09DG3lJYeonT5SBR+Dbo3SrwAZmyPHLIexTgIqNTEBBv0xHAv7uZtNCE3yDGZz8zBEKnVJnGQ8pZUd2ewevhnvYhxM4JCHNgLlKUq75ppcG1yF7Rd/oL14JaWQRBQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbd9975-693b-43f3-ab4b-08d87fee1b89
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 11:46:32.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQC7xBjt6WqgLyxaK10/k5odhrhtTEUeWLEsubWAH+Ng7moL6pI9e55sXp5aTD71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For those need a dedicated typec switch simple solution driver,
use compatible property for matching.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
No changes for v5
New patch for v4

 drivers/usb/typec/mux.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 52ad277..3da17d1 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -39,7 +39,8 @@ static void *typec_switch_match(struct device_connection *con, int ep,
 {
 	struct device *dev;
 
-	if (con->id && !fwnode_property_present(con->fwnode, con->id))
+	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
+		       !fwnode_property_present(con->fwnode, con->id))
 		return NULL;
 
 	dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
@@ -61,8 +62,8 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 {
 	struct typec_switch *sw;
 
-	sw = fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
-					  typec_switch_match);
+	sw = fwnode_connection_find_match(fwnode, "typec-orientation-switch",
+					  NULL, typec_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
 
-- 
2.7.4

