Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905CD292469
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 11:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgJSJKW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 05:10:22 -0400
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:33899
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727235AbgJSJKW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 05:10:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az/VMl3vR2FvXPjBOY3oyoEdUMLUQ3QwVWQB0JdZrJHlIh1fdZ804FkZwvbwReEbw9R6SFaSON3oh9IUzKfT1msdzFBmo+1f4/eDDPpBl/GGR/t7x/l5P9LOSC+z0TKrk2uNDvFWGSzN7SG9ACrW0G0v6Gx8Fco4CJOp+Z5TEeHxjs0ujdsLY3WVuZ2CaYegwwcGVO22tsRgrMGVM3UlnGpnplGrDTdYN/7/zBAyIaQh/jApAeNfvR43HqPCuCINqf+ukotezOpprB/husGMRPTu6GghohufmkCDWFhIZ5ytgGhOuiftmEPg/AzvXYPzfiDK8xF5XRGsbN+6/mq/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGAZF7j1tY7ekCQx4t0zenYMGcEWBf86Hpcd54jlhRQ=;
 b=MH+K5gmzLuYJcM7Nj4ms2kGywr2vOye1J48wLoNVDBgMD9Zv+wzfOGCs5djIUKvGkwNA9rA/vlXrAM8Nz44m4A5+jwLe7lzC8zeJVT9mvXxJWPjgo60PTyx3SeH67UUkPQnxd7NWpuBMY47/3EN02MW75DzUU96ysFRO4ypglo4JxVxjpxnV2eDPE+KFo6MbiH+MQ3T2o7K9vG4Qfvz379CJ5Ak93svs9S/82x4oZJf9s4xTkWLCbwNiyl3rt5yNJECTMIxV1xfVwdUky11ConoAACoC2O5pt+Uoo9edLr0P0PSrRWBD3ZcafMfoL0fK17NPs6M4armg/cRx3KM1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGAZF7j1tY7ekCQx4t0zenYMGcEWBf86Hpcd54jlhRQ=;
 b=Su9bFa/vFYvCYlh/laDCLpAOni3KRc6G4VkkB7ZEwBr1tIf/R6cwZsDnrIeZbF3xQnwEL3fE059Kew6TWTJkmymjdgyTu6MmXoMfglAO3pCA5+gwzVU1sWj2gFBx/dWSBP4wAMQCsBCPa79uN2bVhD+PKHRKpArGeS86Z/TwSl4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB6PR0401MB2342.eurprd04.prod.outlook.com (2603:10a6:4:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 19 Oct
 2020 09:10:19 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::35e9:2f0b:112b:28c3%6]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 09:10:19 +0000
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
Subject: [PATCH v4 3/4] usb: typec: mux: add "compatible" property for switch match
Date:   Mon, 19 Oct 2020 17:03:14 +0800
Message-Id: <1603098195-9923-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0128.apcprd01.prod.exchangelabs.com (2603:1096:4:40::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 09:10:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 203fa0a9-84f8-4bfa-8eb7-08d8740ecca9
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB23426C78947DBEEFC55CAFCB891E0@DB6PR0401MB2342.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvE/WysMZaa+42AbIlcoumOJMgeugmFQWTcXtn1FDIZ9gVbl8tfZxe1YATk+E2waazs2n1kSyPAEiy4bWhXpgWa5BH13dr1yXffzoxzrCncdNo86yl2mdtK3Iy/1d39b3AUCs93JDrUEzr8EID5ccOP9kqaWkZNGaKeeazSh7IYTXVc1QsRuuZLVIeuFGdzJOWtGAJYuEZ7HE0k0i2crd93bBxvP7o/xyKWdSRF7gFmSeFrEhJR9sW45QaZuFey0tZO2QQ1u2o7+mdnBLQVTQQnGmCBwjVWecmL19H7puvrKS/EP2nO+LxTVK4T/pwxyJW+4VM0knTWvRE36wrLWSj0yn7Q1jC8ruZEFkElgPNPAeCesJJhBq2Ful9UKx9RI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(8936002)(66556008)(7416002)(316002)(5660300002)(6512007)(4326008)(36756003)(66476007)(66946007)(8676002)(52116002)(69590400008)(478600001)(83380400001)(2616005)(956004)(2906002)(16526019)(26005)(86362001)(186003)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uItvPlkJMKGwt4B0/GPIbJFgWH9dmeIe7pv9TyjYLAZjinyaZFaaY9Ath+2LBVUMxbtrBeMLKDeYzCTzyAqsFzZ52BzM01Sw1bOQ/UqEo2FN6ZNiFv6uvnbGXigKImpGaBGxsmsw6SbZ7zzYPxosciSpSBGlL0nxaapcp6fKrq0j8peXaAgHYX7/z/iMDnvJtp+HTZpojk7ul3QUU7AtqgTEi4rw89axccQYKfcDM3InDwGI8T1E2msgjAuL0XgRB34Yr42cvhKzn4XugLkjmdmOWZn65ZpoerOv4w++6RYoTEhYWHE1Ua5pCLUkxFDvmnQYqi690vWMz8kcFe87aad6gizlYMPNs658tJv5ysuGfTEnSjBKRUND8tCsoqpjN+4QH+e4NxEUDBRp9ald2VY0WKB1IMVrIJzz/RqlwGQYjfbr+twISsq/WUwqVCXVgQzOeDvndk6DjxZVgHV7Svq25T0rNKuenrwRFwrIlqnyzNfyIL9tWnqpCFTL2AvaO2t7340iiumQDWxfLKmN0e3bKxTgc3zQpkXgMD3xveue4W61N46+9qDyms0wPYKIe3vg05C/oplcWldD0LOkgHDItFVZC3qT3JBVwsOTX0UWDJAw3dhuqv1SzOZqGSVQUvJwiNX1+qcWL0y1baIDiQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203fa0a9-84f8-4bfa-8eb7-08d8740ecca9
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 09:10:18.8491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3kt1nJokTAMb1tZbATuFU8SElyGk05rWj0N9uTJ9vW1YZWSpgWW9lZ6lmpbPXvD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2342
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For those need a dedicated typec switch simple solution driver,
use compatible property for matching.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
New patch for v4.

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

