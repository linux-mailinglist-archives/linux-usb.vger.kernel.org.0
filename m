Return-Path: <linux-usb+bounces-32071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7BD048EF
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 17:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B01E83543BE4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 15:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E262279DC3;
	Thu,  8 Jan 2026 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="JLFYIuAM"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38A42D29B7
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886507; cv=fail; b=gWQc2GRqen4sXa3tZYISp7rmecVL6De/ArWh1IxlzMu6DB4od090W5UEH5Zyxb92dkER4NP34OD/fNyKRH1PZzAqvpekoAekgueXNSZPMnMTn/oLj2ylakz8nLGvmVy52VMGh9AeiYCq3AlE9S3vXaNpDxMQNv5HAbLuZPSlQR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886507; c=relaxed/simple;
	bh=GYsKi0Mf6DUxVTRvFjP0XnQPt/nxBGlwwNh8rlZ1F00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GL7GKtnK1tpEZVWV0plZk8N2txZ2W+4lx5YvGKlUgchJmokogVaSOi5ofl9MhvhVuAr3ogUHFkQYhaZenB90Vqky+tPFEhb3m8xe6aQfWY8lJrEY21IMq54+bauD7fOlHME+EiZKtdMjknM4I+HRiy0NgGpXGkUIMbqhGQ2YA1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=JLFYIuAM; arc=fail smtp.client-ip=52.101.84.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxbiaRNp15BiVqTk83TuqAh9Wt7ylpGUJpXIpdhpSB2TvVNruYmC/agOF8m5CyBpGocVWE+2p0+Xup5oig7MYgOE+iAXMDwt8xkUSaCljZZS3pjm871n2AUBXOSoftBHIbw0AU3K3e4BxXKdCLbRRw7OfumeMrd2W0ajT5qYISWjlvFoLoP8VqIAm7CJhR6Ot95jk3nq6si2Bi1nQu1wQavnXT9wCRCfUB4FQvHsY4UNt0nnkCSk067Xo6ifogaeZfQzRWjL1eCvlS4mPmmg64ABNEA3bTMzmIDO49MBliwbeZnKKCCyF/m3s3Cvql7grnH0MfXg7t1R6r6p2O3ocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwxLeFZll88hi+7Fa0FNkORdrWnJluMsiZqbjInoT3w=;
 b=LpYZXsJm+EFLR5XkwtlhhPoXtUWOCBsSgJxda7q6k6Cwla3r0XWAmJYcXGCdiNspfzZEx3/zFdHiSWwjssk1Yy+nSj01j04EHnsYBlurL/ZvrTssJtI/LGuMQgc+s9zNB6+nkVQPrEhrHBQMDU36YuCvBmOue6J54N+x4iEOXlccbBB50CSLeYowgLNiPa1fI3V8sSnkgiw1dVvD5a7bdopCuGS7jszHqwhcZa969Cu73rgwGMZHVUemKcdoHV/yJMMEBYakeMeFY+6kAOS87Dvoz899vN+Vl8VM4p7dWdtU24vjklhVDKt3QL11SSBuWtZQKetVbbM5/8mGcrZscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwxLeFZll88hi+7Fa0FNkORdrWnJluMsiZqbjInoT3w=;
 b=JLFYIuAMkdbpTlUT3AOSo32iyN61cuOy14awllgGGjUkxnBHtZG/R2d4OCeUJv6fN74+BePYLQj7yEDm3zlYoGaLthQ1z8GaS4UwsxAyO3xuDe5w3bzI6bvqCQ8g9oWMZ0qC/71xPCebzgSVDbXKi5Hiv7TM/g89pLKgH28zna0=
Received: from DU7P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::32)
 by DBAPR06MB6712.eurprd06.prod.outlook.com (2603:10a6:10:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 15:35:01 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::6d) by DU7P195CA0019.outlook.office365.com
 (2603:10a6:10:54d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 15:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 15:35:00 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 8 Jan 2026 16:35:00 +0100
From: Mario Peter <mario.peter@leica-geosystems.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Date: Thu,  8 Jan 2026 15:34:58 +0000
Message-ID: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Jan 2026 15:35:00.0125 (UTC) FILETIME=[59ACFCD0:01DC80B4]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|DBAPR06MB6712:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bcbdeae2-ecd5-4b5d-09f9-08de4ecb7c57
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j3y1p3+VlrUm3bBlkTO+DjIUfs1HO7Lxw4BnOpMFavA/7QIC/1sjwB2sIyiz?=
 =?us-ascii?Q?D8o4yLNn6bAQY/i/HBhsEzbFemXzHrlgwPaIwHh/I33hNzDYK9xed3Cne8Fw?=
 =?us-ascii?Q?ReMU3NlT+YdqkLBTnmd/vhYnwpNGVTX5SP7Bd8egLY+l+cusCCy+LNuS9jNl?=
 =?us-ascii?Q?najxXE/w4r21jbRA/AhHOE2k6bPzwinbzJHrAtrjE0rESOuXy5IcMEAoMivl?=
 =?us-ascii?Q?1I6ry++FL75HfKFrUDbFB6y2oWFNfTymGiAqHIWu2TZ5QjRP+mn4R+JAwS/9?=
 =?us-ascii?Q?XvbVbfJXQB89CTw/9KaGaRQTU8yt50nxPmEd29tgBu+lWLaDyweQLENPhBR+?=
 =?us-ascii?Q?1P0MBSWlHlMaeN7x7t+6aGtN7RRGQlyJNl6Pr3dA3yy3vzS3+4brL5gQbJpy?=
 =?us-ascii?Q?0M0hkQ3WxZ+ySpyjDFyjs4SxVZZN/gQo0F5s9th6jKA0LnVXhP7nUf+smXYu?=
 =?us-ascii?Q?3fJvCvTVbcBjdo3HIkKrwkowr8i1DSJ61RJIUMzImRTMmWREStCQyCWqNtGN?=
 =?us-ascii?Q?UwlSJLzbqLFHh/v2tVK7/wPBm+ZlR9M/j5nhQyQtNWjDIaczNFlO/AX2aElt?=
 =?us-ascii?Q?VvipdTCDXP9qCLNIMUTYMjkfCS6w0xENyDOpC4vs9ibWRgNUjaM44wu5KBoD?=
 =?us-ascii?Q?ocS1TWncyM6+EacP7fOkFu61xVdJSRA4EtWk4QA9JJSM3GOGMCSUqTK/e5Sh?=
 =?us-ascii?Q?BARkC+x40UVSTZOSOX1fOrPLLXFtMzUfAFoPam+KksZ+LzRs1In1CeLBS5zM?=
 =?us-ascii?Q?3ztMQa1Esx0HPM9WPn+j2l4u26hXDpi9pGHJQ4FsTYgWdIerzE+jcaQYlESs?=
 =?us-ascii?Q?Hq4MgwZtU2r2NIF2k7JWVSyq82NGk5Mw4gCxtGfVUSa3vHGIAr9Vike3XtOI?=
 =?us-ascii?Q?RW2J0TeIBIZ1EGR6Uefoi77hkSsT3oYaNnG8BYAdieVcuxaZTQ634W0QeUXz?=
 =?us-ascii?Q?2xJpdzi2Gj5mD2eyvgW8386SxeEmpuuV+kx6y6bxOYWzlh7p3Vtk436F+x8G?=
 =?us-ascii?Q?2fv5m2oMiXeBtj25JudYxGRjmHX2MgUSB/I2vsbxcCT4idxg5BwoCCaVo67U?=
 =?us-ascii?Q?8eHXwqyabMYvkb+m0Pvz9VvvGH0whJdDAz3Qur/M6Wj4+JmgtyQlo0rTjQZc?=
 =?us-ascii?Q?98tWWgbGR5uXFhavqUlx2fP0/vlYcaa7r8/RrohXOKp+sMAzOykPVXmjem6O?=
 =?us-ascii?Q?lyJZ5zQucp+P8P+qbPeivA7L57XkZ0CgeXFXR4xqRVwW3bonkzZ6DBVfjlIZ?=
 =?us-ascii?Q?G9x2K5RZJcS7f+221P4gkGRvpzO+ypv4ebrs0zUXYPgC55Gwr/B2nAK1Lrs3?=
 =?us-ascii?Q?U8ZQ7TC5KhGj+x8z43FVtp+zDftqB9lQdzmBc7kdMeBVVZUlmc9KqXwPy5FJ?=
 =?us-ascii?Q?HZmk4N6ojsxEbK0eyTExzCX+k8sMzbbHIx+qyGgUfnE8wZYhfuasqZ73oyvj?=
 =?us-ascii?Q?i10ok9USFWZIefiqVxKfokn6Qn8m/fU9rbI7bTHI+9h97WvOYhdJ0+iq0N/T?=
 =?us-ascii?Q?vUfavvNzyaYIbNHtBy6eyuqjb7PpbeWgnxVBgkkviS15K8ML+kI9hvB7vTrd?=
 =?us-ascii?Q?QiYQtzKQZr6AHjicV0o=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:35:00.3932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbdeae2-ecd5-4b5d-09f9-08de4ecb7c57
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6712

Switch to autosuspend mechanism in ci_otg_work() to prevent race
conditions during rapid device plug/unplug cycles.

The current implementation uses pm_runtime_put_sync() which triggers
immediate runtime suspend. This creates a race condition when a USB
device is unplugged and quickly replugged. The controller may suspend
before the new device detection completes, causing detection to fail.

Replace pm_runtime_put_sync() with pm_runtime_put_sync_autosuspend()
as recommended by Section 9 of Documentation/power/runtime_pm.rst.
This updates the device's last_busy timestamp and delays the suspend
until after the autosuspend_delay period, allowing pending device
detection to complete. As documented, this approach prevents
"bouncing too rapidly between low-power and full-power states".

The synchronous variant pm_runtime_put_sync_autosuspend() is used
(rather than the asynchronous __pm_runtime_put_autosuspend()) to match
the semantics of the original pm_runtime_put_sync() call.

Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---

Testing was performed using a scripted sequence with a relay to simulate
USB plug/unplug operations at various timing intervals, verifying that
devices are consistently detected after replugging.

v1: submitted (https://lore.kernel.org/linux-usb/zuzsjr6isq6i5izw3rkyo45opyikiqjmy5xk7flpmlgmqb6mgh@rpbdvi3s4u54/)
v2: dropped redundant pm_runtime_mark_last_busy() call

 drivers/usb/chipidea/otg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 647e98f4e351..d19c27f44424 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -230,7 +230,7 @@ static void ci_otg_work(struct work_struct *work)
 		ci_handle_vbus_change(ci);
 	}

-	pm_runtime_put_sync(ci->dev);
+	pm_runtime_put_sync_autosuspend(ci->dev);

 	enable_irq(ci->irq);
 }

base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
--
2.43.0


