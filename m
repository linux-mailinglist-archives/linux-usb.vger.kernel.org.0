Return-Path: <linux-usb+bounces-16637-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67299AE6D8
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05DF7B22D3D
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55A61E7664;
	Thu, 24 Oct 2024 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BrKn/NH9"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090E1D220E
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777063; cv=fail; b=krzECqSNSewskjuWMsmnfl/0bweMmcpILNXXpDbDRbMvtJDf6T+t+9FpIjZnVHBOmteuvTBFzc9pBY6UD/6mq/NUUaHuXGYNV0KPBQteZ4eQAjk61ibBxhQAhH8L9XaTxRE8i0PlrFAaJr9DYlBNCXJBNnJSSmM59gVeMjb2KzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777063; c=relaxed/simple;
	bh=B/cyxsQruhC5j94ekg1a5UxBJ04wGLw6JnoQrsr6UWo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oVE0wcYpHMke80Ljp/rPGtQ+YoMfI+XVGIM3C0pwXOymi8x6KLhIoTx361RYnl6y0U4WeApL5QnBMni1oWsUdOuUBnjFYNeQQVcLeqIMExCaSYOoIEi0zxy9hBFB55+4CYRn/ps/05vMx1/wy4Py+vcYm2RCTHK9Zhhrwa/7aJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BrKn/NH9; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3Rjad5QruXuvESRRaY/uSDDcG9Bv2PIfIWZqiWyg9Zx9C5Xw3H7uV5vZatBUO4l5VT5oT9lqVi+C0iUTdOs08EE8T13NZ9HE8pyvhtzKdkvmw/XA4G99vOC3Mm4uqKPCsWTdqW8nNXLpaZhHt6g7ARSObTCFzKp98Hs64EOczAJHFMugBNYVvArInPs+irgN4nQkAO/TXEtqgZ0LYb8EOtCe/Jrgw4PP7MDTjWiz3bFgsu+9KHuozU2fenkkYUS0lcQCKxLQB/wLIx1uR6vXhPM3vrGzf/MM9VjtdsHoL4mMOyogxAJNyArPzgScsY5WsRPDwTNDVL5ADLZ1tfz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRTnJ+tg+wG6CNvj1nSFp2dusGI03rIyNDtaNKx4usI=;
 b=EFf/nfYkWDsfy1npFoMb8A1XjHcTxLfD6+dF4ySKiGpwj7omwmv6gHr+Yej8hxGD1H661yBmm88GPRM9KEG2ua8VkrD4s+3xXu1BohIC+jgxWstZBU9nOukJaWYnvEZ3rScynmItfzR0xxLgywaZnP/xQNDxkTqnzl0YZ9cxGMDgJ02NZMP7uq2NzJOvElnkl5Ysfz0GapNW4GIaofwIe5d+eIywBf6NJIqLdN9kt5rbg0ww4DlDIuA1dtGU0Ft6ES+2cSCnChpcqVf4GLKz7nVhe6ZktCjwH5wU4thh7Eq2HxTtKSOU48mRQjyYvgSJ20XWHfkb+iPR61FDcKknLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRTnJ+tg+wG6CNvj1nSFp2dusGI03rIyNDtaNKx4usI=;
 b=BrKn/NH9QdZrrkcLWh7/AZ0NNSZsxZFjoPINhHms+GOB2pQcq/89mkoN1q7oPiKFKX81Zubj42JQW1pWnMo+eOxK1n6R33c96W97pVvIVttlUNNQPuh7CEvowkNmVfarY0MgWIJQci7Re2JgIn7vaAV2Kt9xynRcQE67s3p6N8Q=
Received: from CH0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:610:cc::20)
 by SJ2PR12MB9162.namprd12.prod.outlook.com (2603:10b6:a03:555::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 13:37:35 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::3c) by CH0PR03CA0075.outlook.office365.com
 (2603:10b6:610:cc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Thu, 24 Oct 2024 13:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 13:37:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 08:37:32 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: <johan@kernel.org>, <mario.limonciello@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v3] xhci: Use pm_runtime_get to prevent RPM on unsupported systems
Date: Thu, 24 Oct 2024 19:07:18 +0530
Message-ID: <20241024133718.723846-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SJ2PR12MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 60544f83-0f91-447c-cf31-08dcf43104a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FKyJowWyAGnGxnBCxvUI+q2hevCSxdYbky/OVurfLp/ZLLcXM5GltzP/ZDha?=
 =?us-ascii?Q?YJkBe9cn7PQiTjIcF4uaqeu25k1y39RLVMofX0cphYQjTSm30FCs6raQZ+03?=
 =?us-ascii?Q?Im2nmtIp28OLtqwWKaMSKgOv3Tf0IE54fnYATi41qyKOUNhO8CG1NteLrCRd?=
 =?us-ascii?Q?yhYTmsJOvJKe9nfwuUU+atWMAl2Lae2+hvl8ozbmhD7YIFiS5Gq1QesEWSEr?=
 =?us-ascii?Q?qYnYyaVIBActukGdYFFgx9E0tx+qEInsgf8DrHEUrIMtGOWDwCIomBfU/j3k?=
 =?us-ascii?Q?uqlKhbpVThqcHrDLEu/P9Sm6jBom28Xn25LAxSclmHHpAmnSAA7Bo9LpCI2I?=
 =?us-ascii?Q?OpqqSk2804SYd68yU91wboCibuzM+XUKqIv7BYjQoBiy6UtwMcONr++GO7rP?=
 =?us-ascii?Q?xACEq6HJuaxXg44l78ty/ltfGDyski1rQyRPQvV9QItxH0tqd2z8V/qnyFFo?=
 =?us-ascii?Q?u/BDjep/r64sTTTGtWYEgO2Ne5voU2I3Aa1t3raX/R5H22zpOKabKkk23GbY?=
 =?us-ascii?Q?2OOemQxEaOURsiKvAdBDn33fmKOpVXdPO6TDJYzLXOhZFLcx7P41L3yA0GeS?=
 =?us-ascii?Q?6U/sKHDqZHZWFZ7gLe0oai6RIRuAb0BZz6+ddTJtHphHY5SHF6/xRc02E7am?=
 =?us-ascii?Q?Ejf0a55IJCaxPf3AuIXy5p7Su6JvmmGChlruDgTpKxatPQbwAgF5nTAw2DI4?=
 =?us-ascii?Q?k5UXwWL/OglgJFeuPyG4E4FDLQYnV7vHyTVdIKjccWX8cewXXR5qQ6l5bwdF?=
 =?us-ascii?Q?MNTdsoaveuMTghRmf/KcE5D4B5q35DHQNuT6jTe9/fi1lyKw1+wlnLu45mGK?=
 =?us-ascii?Q?KxpcHi7KQtmLlWOr90zM5H+55/Sw7FpYxlKxzjegR/ZaPHXEOTglbtLO9P8h?=
 =?us-ascii?Q?TR4cST12Pvu3/d/gC/486bcn1yNddYoxW9dDfwiyYFcSmmIKI0sMV8pbw99R?=
 =?us-ascii?Q?NgSPoA0R/ZkNLzEHGh5bElZeyqQSgbwwAekKfGm2kGe5mA8KbvVeZ0sIuLlj?=
 =?us-ascii?Q?Aa1DZZ8Qr3NPpqFL7yK1VhL3NbJy3RrZ5eNfL1h67lTG4RszXeWYhgUWxVXz?=
 =?us-ascii?Q?28xhwTmbjGKXa/rhz0EArCxRoIIjmvZnV864XRypThy6pe45iTb1GbjzXTPO?=
 =?us-ascii?Q?iYIC2iWBn2QHFOHydWFOH4nd1Mtji9sfgrN3r1fHg/khTx2rNMFbAZonkOS2?=
 =?us-ascii?Q?ny5Oz1uTzXlWvUGMG94jrJtOuu1PLSsH83mX2vqp8Z36ivjDUk9K6kNzZZOW?=
 =?us-ascii?Q?D83hAI2GmZJ16eiiKmoLerL/gDXWO3mIiI4RBD48cmuxBh4moIP6TY8qgZiA?=
 =?us-ascii?Q?Y/NPT19nvsl/g/cLwzqu1fNAnEv+/l0b4F9HJlPGl2+R7uMLLRe17x8Lc/6A?=
 =?us-ascii?Q?3kJAo6XCXygV/6KTTMICGi+NK4E2VVPrLxKXhPlFsj4gf0Gvuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:37:34.7536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60544f83-0f91-447c-cf31-08dcf43104a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9162

Use pm_runtime_put in the remove function and pm_runtime_get to disable
RPM on platforms that don't support runtime D3, as re-enabling it through
sysfs auto power control may cause the controller to malfunction. This
can lead to issues such as hotplug devices not being detected due to
failed interrupt generation.

Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
v2->v3:
 * Respinned v3 with an updated changelog.
v1->v2:
 * Used pm_runtime_get and updated the subject line accordingly.
---
 drivers/usb/host/xhci-pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 7e538194a0a4..cb07cee9ed0c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -640,7 +640,7 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pm_runtime_put_noidle(&dev->dev);
 
 	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
-		pm_runtime_forbid(&dev->dev);
+		pm_runtime_get(&dev->dev);
 	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
 		pm_runtime_allow(&dev->dev);
 
@@ -683,7 +683,9 @@ void xhci_pci_remove(struct pci_dev *dev)
 
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
-	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
+	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
+		pm_runtime_put(&dev->dev);
+	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
 		pm_runtime_forbid(&dev->dev);
 
 	if (xhci->shared_hcd) {
-- 
2.25.1


