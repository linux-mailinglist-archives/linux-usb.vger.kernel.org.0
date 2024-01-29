Return-Path: <linux-usb+bounces-5591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 902808401BC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 10:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC5AEB20B37
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4766B56B7E;
	Mon, 29 Jan 2024 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YI0QFHz2"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4825677E
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520675; cv=fail; b=or1sVXCfRMan/IJx6WqFamhWKNUfJmhQBaYv4ZR+Ls6sy7ffdDfIF5n/7qH/BZQqOkVfPpaS+K/TPrPNZz2/g61IAwXW6MpOD2c+a9A5oVy1SbwKU/t69E74wnU3L+HaDBitCkbSvINo44llC5ctIYc7Ut5kfM8kReuKywZyQZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520675; c=relaxed/simple;
	bh=ydh41rTKIqy4Q6rL2x2uutUQv+fwBMau6RKfpkLQYvY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=n8yOVRhO48f/+ZIYaADX4y9YtZ2tQAsIQTWr9en7kRhyXPmKUWHmCq/cOvjU3H2jn0hUfEkVE6YksEay9Ko/VeYvCXeoVxqQek9jmk9e1p9qE1ntNv/jB/GDb/i9dPexrLVc6dJ0Ogv0VlLfroxiiKvETKa4ZjYmOlibTdwCo9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=YI0QFHz2; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaECeY9Wsm+Q9rlvYLdk4vANWUO8z3WSgSlndJji/5EHOYSNwZ9ItEjdl6r5yh/x/iGWzACpQvWRBoQQEOvtN4sngw8FjTVYwlLlIWbKySaLg++4o7udFEI16CNFxgDBxa738CS57GvhPuFK8IZuoMj6ZDKgMJGA3eEXU1Sj0+4wRBjZAfGAeL+Cc+3fIQwggFqu8wPYgPwD7BXqrnPrc6V0pEVOU/nNk+6o96hTB9uQrmHgQMuWE8/v4i3/jFylXAAGTtCogVsL+Oo5XmPIJNj14C6SDvyzqw7mA/sQ3cS3Wmuyq14G75gr2jzAhVh0Dzr4C6mFEYGfWCd+q8ik3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoJb5bB04iRB1/ov73mTeaWhKaQ3Le4be4LEqNvwQHg=;
 b=khWcb4maz0qKUL/QB2BbENb6tk5qmRa9Wn6t6+1Vw1jfazHLL6FtK5WcWdN4un5l549jJ6ISyTJer6jaQySK/1mgaEJ7zg6muqymaiHYKtpslMN73QBqOOw9NK2I6den23BfV2jPLGsnquRkWrLcDJee1A4F5Wa2s60hKgz7SFTVKx5xmFdDnF9fD53F8tO9WBOqOuDhMLG502HEKouo/5Zdp4oK85aGie0pRuZdq9iS5ZXMmAZLMB7w5bq0tNHZ9BD1lp+F9CeI5yk7ELEjPS4nxuW48k4HOZRGPWzoj3UGtOBycGeZNoR1Tq2nc4m8B/+RabnS+qvC+O4+Lsp+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoJb5bB04iRB1/ov73mTeaWhKaQ3Le4be4LEqNvwQHg=;
 b=YI0QFHz2HWzJyTKiG6zYA1uhBA21Fq1rpP47mvxA57rMtc8D3h9CfENp72jGIP32sqXpQSSmzUxOt56FfNlGR8Wsy+jw3fZEhQpiddUe4XYTUgu3krmiRAnXNlTy/rztAqg2p5GNXu1Sc3Ope7c6nyg5GQD6g7GJXj0guDMgagM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8927.eurprd04.prod.outlook.com (2603:10a6:102:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 09:31:09 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 09:31:09 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com,
	hdegoede@redhat.com,
	ivan.orlov0322@gmail.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-imx@nxp.com,
	jun.li@nxp.com,
	stern@rowland.harvard.edu
Subject: [PATCH v3 1/2] usb: roles: fix NULL pointer issue when put module's reference
Date: Mon, 29 Jan 2024 17:37:38 +0800
Message-Id: <20240129093739.2371530-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 397966c6-224c-4a87-83f0-08dc20ad069c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EH73HTUMIwT+SqvbFkw33e2iDjLl/lC+L4OczRbMTyMB9yvAq2vL0DpWFRjmfaq6YeI+7b7ry/Esggya87SdE52Dx1VrV5KsTUoqjwOg0Z86xnhqhmz4KPXGvnF/Um3cQqgzwVxkMu/zO6CgGB5tU2JG421BwSvVdqqUka+UeoSHn7OVoY3zzI3D5Z5yeZpjEA4QaHLwFAe0EeQrTeKB/MiEK2k1k6+BWEI4V7/R19cPhyVJt6Z2SM2H40tUv6PHYi0m2j6A8u6fsE+kJD/1JVyUmU+NZSDGPw+ftcN3lXeCfvMfZTdtlwUQL8rifr4EhKXZcFcbVvzJeNLpz2NmuWPjc2q9d4oWblPmWcwc40noPYU2B7qYgrLPVkqTQuGQhnSDP48x4yLWK8m/21hhs0OY8xE4fXQLfO8F4KsFzLyMufKb03fCktPrCslk/3bLg76Co+47TtAdinoHLKeEm3ebnyd/WBKkuI194jGBAsRxCn3QeZwkad+KfWXcWKG+G4rzOSLvBQBGGdBcE2gR6XTBUf0TEw+Y32gsuDdQG2XIn5deWPrSZuZKFrQguG0Yifrw1gJ1mR+xnx1BrIbdbRGq9hojlp8kX+M2bWhzkxA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(1076003)(26005)(83380400001)(52116002)(6666004)(6506007)(6512007)(38100700002)(5660300002)(8676002)(41300700001)(4326008)(2906002)(478600001)(8936002)(6486002)(316002)(66556008)(66476007)(66946007)(86362001)(36756003)(38350700005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sMRxW1Nia6gjIRxqChu4d4CsNrhsq6+pS/bWsmXJBRa4IfDzUeFmSnazQBj1?=
 =?us-ascii?Q?/T3W21BOXyDOJmHnXx7W2v+/nUw/zCtii38lnnSe4bQGbCXOqP6qoNQWpNug?=
 =?us-ascii?Q?Rxrxf8DiRKf8+bEBKeP82tXu3VO4KjbR4czSSKIRVwIAbnM9gzOGZzJH6S/j?=
 =?us-ascii?Q?BINcbCrUp2iEb/0Dtt+vIRKlVqBL6z/FT5AvaCKvjrgEazyXMrHHOJ2R+mHx?=
 =?us-ascii?Q?eJO8UtGxj1UYtPZVd7epR7UE0g/lNhBDlSRo1imSuM5uhuOnWBqW3Yc8Uv5D?=
 =?us-ascii?Q?3GIuXG8Zh8apXnRml96PcgeVxkaCw+a/uVxZleExietztnMrm3ox2rHsdnT+?=
 =?us-ascii?Q?75A+7Ud3SePzxOr91BPFrEsxYDp+lxs0MDHzdV2BqusyJAlSNj26NLH9uH7/?=
 =?us-ascii?Q?XT0mPKaTpxo9tO13upNfjka61BSSONZx8oKI5uwNRxZ3eMTDgOqZ1TnCQV9A?=
 =?us-ascii?Q?mjPrJrZUMsuBmDLAV4vNCE00FhSwTiGiwOeMmFdgRak5kOMDKr1itSri/XKa?=
 =?us-ascii?Q?/qTu00jqjKLMcT7wJ//n8xX4beg5WbD6oVfjCkug9TYJkpxNvgzDlvct1Nx4?=
 =?us-ascii?Q?LikJQPt6NKdRzJSBHiF7M2LN3I78m5O85sHSeNoVxYuQj//4GTlT/D5vr7G0?=
 =?us-ascii?Q?062qPImO3e1XpBn5d7YxFXlWZCBidgileZLjuZgph6Oy96+Ry4xycUdPauV1?=
 =?us-ascii?Q?gOm4bjdbfJCuwNOTRqQnJo1ZTVd01nLFjmHaFM1t843zUzKWa5Mes6iv6Q4S?=
 =?us-ascii?Q?yuz6OLxfnWk70xJriuK4BSN52PN8qzpbJ0a29wWM2JqVYJHPiT5QO7QB5b+u?=
 =?us-ascii?Q?wyeGrmnYCDJI/I0/0hwBuN1DXKG4qJKrDqSA0opxOcN+IYYUBFP6uc9/oPGx?=
 =?us-ascii?Q?TOYAcNzqifBfbVI8EsG7ljnYf1tLWlHefwpXK0oFE80P90vvKbih+Lyeo9Ov?=
 =?us-ascii?Q?vPjjy2b0b7lxzO4kcqoh26IKkrVsuobdzF9435BcEoMorGsWSAdq8+ohEp24?=
 =?us-ascii?Q?ILeVqiBu3XB2a1O35BVDnQkTvZXlAG0AhiHLFQ0XoWllviuA/lFbtQAzsUAx?=
 =?us-ascii?Q?u1h6BZKEOhfFajnE9MpE/y14Y/I7/rN42rIdBWe7qaXVAY4/OArftTDnw4PA?=
 =?us-ascii?Q?SulLU48/X3R63pl5QxMDhb+bi3YpbsaXz0yGIfsK2osiX//6E4KQHDqMZaKE?=
 =?us-ascii?Q?MlwyjYxFTtMclEzwGa4QvrpT/Yglze7vPUCqZIH6C7XJNYJWfHiNdT+4R41f?=
 =?us-ascii?Q?LTAufkD13oBLKxwtlK6W6+bg6UqtwFf6xo3N1LN8mSJRjvGTEm5q1JEwtu6k?=
 =?us-ascii?Q?ikvyhuVFfG2mxN/GA6TZchcQZtJJh4mZhuabBdqES4BXUct9+WTpup02xfMG?=
 =?us-ascii?Q?vyU7tFfYu+OWf/TcjbDd0u5iElqoYD1wH0IOmm0jISVV8fF7SdQpPChpKWMy?=
 =?us-ascii?Q?MdokAorQXWomXOAi8QENbvVJFfKys/Ge508NrSdBYz3frIXp4Q5sBeLU1ulA?=
 =?us-ascii?Q?esy9pz0WR3bfNZ1P/OCpkNFZefwjCVlTpaHxOikSCiTnxIUQpUjlETpvIbR8?=
 =?us-ascii?Q?YTRKoXIQ3sVioH5+0kISiAi7nRPrsdxcfQUQCKQg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397966c6-224c-4a87-83f0-08dc20ad069c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 09:31:09.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTD9H5C6Q2wMwRXgRsYjbPl+tdELSqGRuz3dyb1ukYzLwWtw+lm7i4VmAcogpEG4NAjT3Ou/E9yXYNM9le08Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8927

In current design, usb role class driver will get usb_role_switch parent's
module reference after the user get usb_role_switch device and put the
reference after the user put the usb_role_switch device. However, the
parent device of usb_role_switch may be removed before the user put the
usb_role_switch. If so, then, NULL pointer issue will be met when the user
put the parent module's reference.

This will save the module pointer in structure of usb_role_switch. Then,
we don't need to find module by iterating long relations.

Fixes: 5c54fcac9a9d ("usb: roles: Take care of driver module reference counting")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - save module pointer as a member of usb_role_switch as suggested by Alan
Changes in v3:
 - no changes
---
 drivers/usb/roles/class.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index ae41578bd014..2bad038fb9ad 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -21,6 +21,7 @@ static const struct class role_class = {
 struct usb_role_switch {
 	struct device dev;
 	struct mutex lock; /* device lock*/
+	struct module *module; /* the module this device depends on */
 	enum usb_role role;
 
 	/* From descriptor */
@@ -135,7 +136,7 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 						  usb_role_switch_match);
 
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		WARN_ON(!try_module_get(sw->module));
 
 	return sw;
 }
@@ -157,7 +158,7 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
 	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+		WARN_ON(!try_module_get(sw->module));
 
 	return sw;
 }
@@ -172,7 +173,7 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
+		module_put(sw->module);
 		put_device(&sw->dev);
 	}
 }
@@ -189,15 +190,18 @@ struct usb_role_switch *
 usb_role_switch_find_by_fwnode(const struct fwnode_handle *fwnode)
 {
 	struct device *dev;
+	struct usb_role_switch *sw = NULL;
 
 	if (!fwnode)
 		return NULL;
 
 	dev = class_find_device_by_fwnode(&role_class, fwnode);
-	if (dev)
-		WARN_ON(!try_module_get(dev->parent->driver->owner));
+	if (dev) {
+		sw = to_role_switch(dev);
+		WARN_ON(!try_module_get(sw->module));
+	}
 
-	return dev ? to_role_switch(dev) : NULL;
+	return sw;
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_find_by_fwnode);
 
@@ -338,6 +342,7 @@ usb_role_switch_register(struct device *parent,
 	sw->set = desc->set;
 	sw->get = desc->get;
 
+	sw->module = parent->driver->owner;
 	sw->dev.parent = parent;
 	sw->dev.fwnode = desc->fwnode;
 	sw->dev.class = &role_class;
-- 
2.34.1


