Return-Path: <linux-usb+bounces-19630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF751A192E5
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B50D188D6C3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED975213E67;
	Wed, 22 Jan 2025 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="bmoxbwma"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC49213237;
	Wed, 22 Jan 2025 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553663; cv=fail; b=q1rYT5j0w9ZcK5jiamSB6AVXSOXYTpTLmpSatDisQ/JsPybe+aA2yDC48I59QM57hlio+DMgqZr6Xm2aBVhmCPLuSkJ76kbAETQ+eMzcYb/akxMugvE4nvI6F66fbs/KIloewSwW7IYoA8RTswJv/gSDpFqKbwSuG5RTMWI4cVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553663; c=relaxed/simple;
	bh=frXK+sfOGcdRpBqLdvWvTbLQE1o7HCXnG2cL9WbYRk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nxAaUQ+p6tQDRBcQchzVWQVtLxai4POFz0MkL3QYmpq1GpzsnuSPmkxpVpDmJfCk8/QkYTup2Bm1nYBR3UIXfnI6MklHgXTlSBzb0fpdogBI86Vd65ymIAmHThprExL6LNp3rL/cjZHYT+lfZDkhq6r8FXRborktdW+EMUnSpZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=bmoxbwma; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP0WlCIs1XBdYfq44ML2OzDPvZu5C5HeDXXig/QukcosH8I4F032rNn9JDqHTTfl9pB6BpTRvqf4K9atusJPQg8cvbXC15sG0OdhxQFQTV9sNj+9Q1J6NGuzpy7ncaxTPnzlH6ZoheR0a0pGIGfP4BFd0SmWK3aZNky624wd5WfAcfXYGBhNSjUT4rsng+wrZCZiHjE+hHxPKhiCuFr/ekYc3YXDY72zk4QA73/2ZxKNSw8UQeqYRy7vSWH0pSQa7tkgIlRqjo964qErNLD8upreNGa6P4ngwQvuMNyV4nDhkewoWtSjMTuYxcAJXUd/+/ZFd47KrOmxygnfrmyiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeyBqT6IbF2Siw+th1OPtU/f1Y60QjgWl2hWYSntXNg=;
 b=ykCDbX5Hq2GEfE5LM+z+XLTG6oy7HKOYHcYod9BmW4n/d1dbeseOz9pNyaHJVO56lqlhiR2JYQQcF4xV108arOtIUDGRzzrYzGNzI9odln7hYot1un2km4v0U15BJjVqji6iaezEMgnBp118jLDoFcfDjck099C6g/ZmuYl8tW58nBUcwaZnzkAgilqLyQ9De3FXgbIII2HyVmfv2ggmBs7YdqCCR2i67S28mADVDTxCumKg+/9jA0NiBgBwHJMGlgSeywSdF5Ay5gan6Ammq0fvYNi963RtiNh1rmDm72CkVHkM9Vf+4qLXaIFCqU+0NWzWwa/yriB3+scMaw7CFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeyBqT6IbF2Siw+th1OPtU/f1Y60QjgWl2hWYSntXNg=;
 b=bmoxbwma2r6zf4t+Y+GT6sMZGg7MsRtSKBKptS5VBXyvW6pGvFSsLA9ajBvfLwDMOhdu1yPDAZX3tcplvqVF2ew22c2QWhMrfu+B7AEA3AjRuPl3piTdDO2IUHMrIg+UczvsvP2iEnpoHAU/IGHoaf4sd6HcKn0NHqBAVFWh1IM=
Received: from DU2PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:3b::32)
 by GV1PR06MB9386.eurprd06.prod.outlook.com (2603:10a6:150:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 13:47:36 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::24) by DU2PR04CA0027.outlook.office365.com
 (2603:10a6:10:3b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 13:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 13:47:34 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 22 Jan 2025 14:47:34 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH] usb: core: support interface node for simple USB devices
Date: Wed, 22 Jan 2025 14:47:32 +0100
Message-Id: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Jan 2025 13:47:34.0380 (UTC) FILETIME=[30B81AC0:01DB6CD4]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|GV1PR06MB9386:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: abe634aa-e0aa-4a91-923d-08dd3aeb5374
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ig930z4wH1Y6yKcX7wrWEnpGkUkVgoui0/So+/iFiSfv5xX86E2aFICk3HMG?=
 =?us-ascii?Q?tZrfoj0p1mfuJczbNPDNivF819f2dtDkYgUnXIkMUm0X7purXd3g5ZYn/E+a?=
 =?us-ascii?Q?zkwiC2m2jdhUBFIGsJ/1iejSRdvsxcmnItBQjcgLFBKDPY2s5pbuc7LPDfGQ?=
 =?us-ascii?Q?DvefC2vf6hTOj3aqMcag10pUAQhwSZM9I9wKZab/6Jh9BBuHIODH9ZUWi+fB?=
 =?us-ascii?Q?7BX0fCqASRP2YKXv8cAnHCYFebPEylwycOjyTfp/b3tAAq1vRd7y1zpMHreX?=
 =?us-ascii?Q?HKIo651WHiRy1VEZKVwN0JwzsEj9eNSipZih3v95mcqYFtu5NGgdXfZRPUWF?=
 =?us-ascii?Q?WHbS35WX3b+8fgJvtPuF0pc3kQ0J9yMcVjKSdrabVwivxfGccIikzmjmflGO?=
 =?us-ascii?Q?hshKluKXG2O1MgPuBBwcRYMdmRkocsrCn/JC5SfDKzfPge8pzDP1CvgMw43h?=
 =?us-ascii?Q?RyZ8v0thNoQNNx1myisGSklP1ODVr9XjOcWMTWyF9/nTE0FtisKuWEyWkD+C?=
 =?us-ascii?Q?gfUMfqIhfjfX5Y414VnKp/Z2J8xv2Z5zSE5snM38iPNOdfCpW8YzT5beCf+y?=
 =?us-ascii?Q?ZmVwoYr7zeYbd56t9nKG8vSTxMBGM0J618ZMoEL5EgRORDjhZuEw3jq63e18?=
 =?us-ascii?Q?pNugVJyLjFafyNjxnBC+UobYZ1enT0blcEw0vE4v0i62FlEeO4OwOYpi/dg0?=
 =?us-ascii?Q?29C1FP3SfY0OW0h2S7+SNgV1MN1js8ZLnd5vgqJOnOAEQDQqn4UebWE4MwK8?=
 =?us-ascii?Q?kKchEt433xDOImg4eqQwlZgstl0dOfCfoGt4j/EPzp6xUANaSJHG6Q1D/CvE?=
 =?us-ascii?Q?T/4uNv7aSWmIDHOwUpe5KQ/5lqns7lIPlZBmrugbi4TTH6UZJ+8pj71VqItl?=
 =?us-ascii?Q?NYIYMLnpGgcV303YG3TQbe63HLXJA8UzHTFnFQVh7+Y1RMlUiQKr+GALU3vl?=
 =?us-ascii?Q?EQoTm4r5o/F7NSCQm2YhJuws1kwvnoTmxwwqRJg8BpwDZU0eO89Su+YBASF6?=
 =?us-ascii?Q?VKGTRZFeV57ekoj6w9+/OMn/uemffXYvfaE+EMxSbMuzk7IvcY6HVh+J0rSP?=
 =?us-ascii?Q?/z2QDdqP+0G4kph0FAIKJcGJv5qsP78K+NDFL/IP6D6RedA5lyCJxmIMxMjG?=
 =?us-ascii?Q?GeVfyQjRiRbAy1d/oJj8Fpaywyj9dc9e33BdPzimsHE8ncZC7AMG40a3S95b?=
 =?us-ascii?Q?03boAgoocQV0X8tha1jP+X0gQxa7wzHd36a2ooraYIzZfZcp7KPlW3hDLwNQ?=
 =?us-ascii?Q?er5y1p6EU/steq1/w13u16r06hnZJIYO9UjeaojMqM6xcx/vUxcLD7dEetYI?=
 =?us-ascii?Q?SviOm0JPqaitwj/giVnb7XAf2pts0YEEkyT3bfLy0G+1+RDJ6+9YHvqV2RhR?=
 =?us-ascii?Q?ixAeFClNHzv2JI+8Z41/ZH/SIQfNx/AVXW+Tj4JC2N2oi/qhQRhfkEQDwN/D?=
 =?us-ascii?Q?kmUa2jEJCKBmtqxTkM5apuL8lg/rwgLHs/OY1K2BWzGI/wfaIf31QBscxsrU?=
 =?us-ascii?Q?NSCMOZT+IfyznOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 13:47:34.6946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abe634aa-e0aa-4a91-923d-08dd3aeb5374
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9386

A simple usb device has a single configuration and a single interface
and is considered as a "combined node" when defined in the devicetree.
If available, its interface node is simply ignored which is a problem
whenever the interface node has subnodes. To prevent that from happening
first check for any subnode and ignore the interface node only if no
subnode was found.

Example: FTDI chip FT234XD that has only one UART interface which is
being used as a serdev by other driver.

device@1 {
	compatible = "usb403,6015";
	reg = <1>;

	#address-cells = <2>;
	#size-cells = <0>;

	interface@0 {
		compatible = "usbif403,6015.config1.0";
		reg = <0 1>;

		bluetooth {
			compatible = "nxp,88w8987-bt";
		};
	};
};

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 drivers/usb/core/message.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index d2b2787be409..f4a9d1831f6a 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2102,6 +2102,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		struct usb_interface_cache *intfc;
 		struct usb_interface *intf;
 		struct usb_host_interface *alt;
+		struct device_node *np;
 		u8 ifnum;
 
 		cp->interface[i] = intf = new_interfaces[i];
@@ -2126,12 +2127,11 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		intf->cur_altsetting = alt;
 		usb_enable_interface(dev, intf, true);
 		intf->dev.parent = &dev->dev;
-		if (usb_of_has_combined_node(dev)) {
+		np = usb_of_get_interface_node(dev, configuration, ifnum);
+		if (!of_get_child_count(np) && usb_of_has_combined_node(dev))
 			device_set_of_node_from_dev(&intf->dev, &dev->dev);
-		} else {
-			intf->dev.of_node = usb_of_get_interface_node(dev,
-					configuration, ifnum);
-		}
+		else
+			intf->dev.of_node = np;
 		ACPI_COMPANION_SET(&intf->dev, ACPI_COMPANION(&dev->dev));
 		intf->dev.driver = NULL;
 		intf->dev.bus = &usb_bus_type;

base-commit: f066b5a6c7a06adfb666b7652cc99b4ff264f4ed
-- 
2.34.1


