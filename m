Return-Path: <linux-usb+bounces-5442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2DC83A225
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 07:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C70B1F26E75
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 06:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A761F9C7;
	Wed, 24 Jan 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="f8nBFm5s"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C838BE2
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706078380; cv=fail; b=m0rHay3de1ZHghgjeOXmWkm1Z5uRSyEUeQY/cuN0YotQimDc6L623QiJB50mlJ+q9NIwE7Wcs5Y8EsSxkfi4+wWcDI7ZgZvYlY72vRE94xjr9+eAHVhsH+PfaGmGe+5WF1gVn/D9J5LNRVq0+YL27pgCJyBIjZ0tLWLoDAHP+gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706078380; c=relaxed/simple;
	bh=wPuPIl74o0Hdlu1VnqYFZ2bx2cEh5dEaf7uK+8jCiN4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=P9oPB4AFWWiadcExH/KRk0J7rfq62IQcDxHLVSrUmCie76YPl06z/R87vESXgcrIYLarCbqmzGq/kUK38WIx3CRbjG3bUvZNlyaXBGMTaAbRXV2VQFPpLW40adkNZVLqZK8zvG9/Qg11TIvPF/M43Hh6tsaAAxR2Ih6XUTaDsDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=f8nBFm5s; arc=fail smtp.client-ip=40.107.22.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+lQlV+mxC/Ve9di2ML2u3okbqwcgUZabsip5emFKvNeT6R6pZ6eBJaP3LiYecAP3he4hdh4X6hJIGrq2BRxeYrxHFFICJFJMkidbCYtYqO6a8SowIcJnjVqQGF/hHQQ8GPMlKQyqBzSSODmzIpHW9a3B3O1NB8+HvGC+oqILvJ7caJV3vNrAXy4QK59RQMw3FImXVwjyOl52/A+H/6+jhsHFlkuyDLjnKhn2kIOus18EtGfSasawjFDHlA+Vx21j1YDyVF916vhg4rbx7jBXSHy/fVcZO4vITJtSgPXdAHAKvtZAz6ddlTPRK51gq9kzlzqb1+GtNcJkq7cWKvlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8NgsmM2LmuXxe21tVKsZacSEzwrP5piefLvJY4m75s=;
 b=S7FgmF71AOClsjjB2jfJqTj0xENFjW7pOTj0PeDgwn4RhfHcwbSUhD8oWzrY+TVcuU+5IQc8LsPYlPebvLLcBL00VFFPn8zYGU8i0Z9GwAZ7dezBQqGQ5xQIwfwoG5uXJeE3FQLsJ3iNCK3PFPZ0MoNSepe2ftIlQ1gn7cpf9ezrGX3iAmXO+GYqYIDXzfkHopdoqy4UlpTKAJdUlHu7Zs99+i/m1+MxQ2xcv4Jp/5Gksm72jxH8AmE+Ow9KM2uLDFip3rtGKD6UekrY0TGo2DA6ff9djDl6HZt1o9UOs+0ug8E+04ayjDbBu+yelWqKirNXsrpRfjen0w5EDcleYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8NgsmM2LmuXxe21tVKsZacSEzwrP5piefLvJY4m75s=;
 b=f8nBFm5sZ+S6zdf4RqzDEbKFXyOvY9RUN1RbKqA6ZvfjDKU7rGpNnvPiFlfk5R5KWi3mQ2cYsFO40SCtQPfdApmYH+g9kUnQJ2XgS/Rb67kQ6frc/nacwDz64+M0bpj0NigZyQyzufLO5te+2tn1SnfI722Iz0Huq6mfbV+OfKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 06:39:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%6]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 06:39:34 +0000
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
Subject: [PATCH v2 1/2] usb: roles: fix NULL pointer issue when put module's reference
Date: Wed, 24 Jan 2024 14:45:53 +0800
Message-Id: <20240124064554.1263339-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a77c5c3-198a-4868-eef2-08dc1ca737a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ck0QJMl89Qs7WDcwqCGJPxCS+7Uwc+b+P/OxlBNFrm+RzyEHQGj2VxU2WlZ6KehWaX4us65enkNQpjnvBymkEvqQ7i1MgxwiYRs3QvQ0x8oSdUJLhUegH3qCrVQT+rKNxTjc4GrCCJ3FO1ADXTb+mNcW4AYWlGhvahFUtyY4w5X+hGKFeGkL/dGG8XYaWoMqoD6iy7PzrBGXP7nFbIcjskh2uXptElLmmyG33BvWMSwvO1o4XKce9ZOZCwRUhFi7nbKYQmIwL80Jm7eEQK9UueicEQ9NpwXkYj4YqL7BgZlwlvHuwoUv+Bu7r0RzbcZKQ6BH35uSKhH8CoNWMUV02b9wCE1GvexNnfRgldLJTbpYlMBZ9Fq0l7LvTGVLny/H5JbOwiT3M3KlQB0m9gcxv7rdRIXILISdzFWKaAXZmZsaQGjUlR7s23Qk/AIx2nb9yRkoy/OWzSPd3Jbf+Dddl0Udl0YiZGyP0wOKBPWfZFnan36w1VOqLw1CW3d8+oLjY8v5DYoAQaGfsp+SJdLTP2d8Ix6WwObochJqgr2o+I4QcV15tIZZvdK43R6zOROaqoDprSgnU6TSG5a7sMk67Q9HrIrzwLYzS5NgiSVE/gY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(2616005)(6512007)(26005)(1076003)(38100700002)(8936002)(4326008)(2906002)(5660300002)(8676002)(66476007)(478600001)(6506007)(52116002)(6666004)(6486002)(66556008)(66946007)(316002)(41300700001)(38350700005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qcJWaPa+2j9Mt1vRO08CGa0pcPn85OT/S88m7IiED8A3a93s3aP3MO4Gc/dx?=
 =?us-ascii?Q?8fdo/2CM/kgZABpZhtrflTqBWgmkGbpyS7i/HLd1FUfK/La5XqBoPR2igLqV?=
 =?us-ascii?Q?ceCVEEQyo5rAxBT6sdRjY6YSDhbcfAaqEREL0kPKSX2ma+5+wFbG4k7P7ARg?=
 =?us-ascii?Q?JBD51ZbOycfI9wLFPK0MHeWl+xD3sLL939isjcxmjjkAl3V7shcM1WcXzuTy?=
 =?us-ascii?Q?6AJ1JCZdvt8i0QfFtxb1tqFGMns+A5TKkGvq9K14r4RMxBmUvLk2Is+7Csap?=
 =?us-ascii?Q?43P9PmbBxKSNmHMdJZtOKSTyWOiRzc5GJu2ANR92RNbApCoBqDMIMGfa5Y0K?=
 =?us-ascii?Q?Lvg4I6Gwutp3hw1xl1a7FZ1hQH5BVeXwegXfo+Y5zfs64WlVPBLPjflJhfG4?=
 =?us-ascii?Q?hbSqn742RuDk6hlpRu0R3ePVu0jQFFSE7nEN4JtdPxucdMWzfKJ22K6g85pj?=
 =?us-ascii?Q?vIcrFN0WAjJCxZdVjF5BgT7LqxE1EsUZjlfeFME9Zb7QL+MNw3Nn9vNBIqKj?=
 =?us-ascii?Q?2g0XJzyIYrNbJ5aGxWHKYykTX66aKTAht5kKM1T/+qpA4sBjVV7LPh82WbPb?=
 =?us-ascii?Q?dJ9GOu8eWIwLujp5+sUYMCkswGYM8YX/bnnZ1IGgxQSN9stdUf3fQ4pbdPOV?=
 =?us-ascii?Q?y51z580s3rWeMq2pW+NpIV4gw2n3C1B+Nz/qqy+uwbj/Xtqkfo0lie0j63sV?=
 =?us-ascii?Q?EgZhzLEQ++uO12D3IiwZ4LY816PRN9PemAMXCd1K121Eyd3rhqOsGFwQ7Fk9?=
 =?us-ascii?Q?YTDwmqP8cBIGtF9SSIgHJJ44u2eQ91cnILI0bjhV3o3TKl0l5wj3G44oh5SE?=
 =?us-ascii?Q?stbmkOV7qJLjIKpHb2qt+PUYQhc2pHzn0XcyyIgjJjHt80UpFIlqvYg78qlJ?=
 =?us-ascii?Q?Vo+AXp3a5NR2WzKRuZyFW2Gx9We4a4MWmPkNAXJJlMrb+fYsGFrhcXrU/sdg?=
 =?us-ascii?Q?zMagbTYYkZmS7I6/p/eHURav0Nu1k5bWE1trcPyfIMH1kh1eRGpIGe6qEan8?=
 =?us-ascii?Q?d/R21jhV8d2FE4FVNxRTQyl/7aw4onaNwU9ZCgb8EuHKluyEZWk1bq4Sh7rL?=
 =?us-ascii?Q?59kkW5XyRVzIyT4anuIo5m3dSAcj+0J5T5CR+vchwCcIOH3hYWx7ZvfIsFtF?=
 =?us-ascii?Q?HulPJO9RNIud7cboYJCFs0U7Zaktl5elaUqWjTEms2hvsuFrOeFcz3Wje+kg?=
 =?us-ascii?Q?QoU6c16A1ZhPd6WyoPRE6UQxWYlsh02RpJqMjshOHYxCJeVhVYzEKTRq2Xz3?=
 =?us-ascii?Q?2uGYKHYC6Van0ikZKTa2h9SiFO2rEYzHtu91hApCRQWpCxbZJqrIMMHlZvW5?=
 =?us-ascii?Q?Cy216nI+8jaHvWE/XWihj7nmzj/V5ormpLQOZ4jbEFvV8qYjg5XP+v/XxI2x?=
 =?us-ascii?Q?dnLWH3izLyCshuq3Y8FD/ZLfoHWKrehjNZedO+jNgo/T2zjckwKU1lcUp6U0?=
 =?us-ascii?Q?/aKI0t7K3R/XrZfQnIj/+dNBuE1sA2Y3TTC0pBupU/FdzqJzITJcvCVRsTlv?=
 =?us-ascii?Q?A9+iAIlUKqqy4OHiFAIrkrURmTyOJQNgwtuuOiLQ7ZCzb50BIf2Qpp5kwaj/?=
 =?us-ascii?Q?MoV1SVnripoNKFE5+KTi1nQOho2QHCSwT5JeARCK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a77c5c3-198a-4868-eef2-08dc1ca737a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 06:39:34.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuQXsRYI0DfJjuJf4Np+n4NMpsBZ+YbKQcUCcox5OBTLh5yv8wuf6mBNm5YHCtNh2c3qZYpdFsaQVrRhnd1QsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

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


