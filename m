Return-Path: <linux-usb+bounces-37420-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOBcL2LFBGrdNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37420-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:39:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC905391BE
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B2CE310BE63
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0173A9DB6;
	Wed, 13 May 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OCJbKExF"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DA23A9015;
	Wed, 13 May 2026 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696966; cv=fail; b=C1JRS4BkMOhmxqOIRgbo4Hy2pkaNIukd58qz080MBcrA/PMANB8eCtKnUKy7V4MfTsi0YnRbIStvuZqcdqnjvZ5bXsmjZv6Tie39gzm2jZedXlU/3vRVfnyCpaX+n/rD/KBo+MIsnt6bBjfwQv8LwKSUrdiOtSEzJ3N3oNxWCjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696966; c=relaxed/simple;
	bh=uTdKuKt3g7PHqqom3sesRoQzKZVLXJJ51xGJrEbfe0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PfRDXZvzQjUcbcbtBJjxUhnS5YUlJbvTDOQiDWvcEHR3xrY2bbWF4VLACF6djnVGsrKNet6upXXAfqvbCHD0qYa8oVP8D47DexJjOizy8vRyRxvF1eYf9HuZ2wnfqMpVTQSNvcElI9UEQWOrxn1rYnlWP+o7Nd1p1CyfT+2s8P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OCJbKExF; arc=fail smtp.client-ip=52.101.52.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIRROuQAWf33YPDH1FSzoolJahI52On91GidvTh3uqc7/8zR/hOTUsoSbhoOcM7J6hbIU+FE2GtkdwHzUf68ZfedJk+oI++R12+HBVSV4eUvo51R5mvVfuwqHzRQB4VCQlLFGXItIbShwxGotSOt1Nse8tOcixmK5YgOn4vQT8kR0nbTotSGbmaGIG/m1nyKASAlupEhtbnmZitUvlBmZCct7EXCgpO6j4ef+N8QC/dbBAGm94+eDycvhUsS9aBQXnobxDWGRnCOU2dx7AmGwkx6/3GD3Vso0/1Kj0JKt3aJWmS7ntYsyeX4mroi5P+mXn7cQC5QGvd2bXCX/PpiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhmstGMTLyD/2zh1jEj5JtG5eOscIiTPlDFpv61O5XE=;
 b=hynXVEb1GlA/WLConNN0Vife54oyZ+uDhr25NZVNuJt30UE9t2yg6fJwIsKqVqMuBwGaTjvKX/LhVHdFLG+iI9vqlDc0xkBiHiFh6kNV52/7Kl1iT/3D88PnIOVULo6pvOa2sw2wcvI1/X1EuZMPlxNwXGRfV7KLlMt6FjlujPJaAE6XR2ZsHEpk3cTTfE/qV2NNKg7hSG3tS2FLEapOQQv6hvNEiUMM7Tt7CpTl9jCOV1rB5sKa/0/q1wMgq5v8rdloec09ETVaufhY0a1cRNU9trbL0dJi7fB+b95T4IYDG6cR3eZtY/Sow1junZfy/I5qheCgh6GMzQJW6wcGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhmstGMTLyD/2zh1jEj5JtG5eOscIiTPlDFpv61O5XE=;
 b=OCJbKExFqafxVg9vg1IzmD+SyiZ50jgFeUDMuWCcpOKzb9sTKaD9E45uqTeeCTKI3OZ3NQ/hrwRENqdjMCS5wugijLpu5CfjAWD2nPZUr1utpROL69xVMNbLxtvL/g7GTEivYfdC0JXVNiL6iDO6Tj/kQrL0fXImsx/mbv/i248=
Received: from BN1PR13CA0013.namprd13.prod.outlook.com (2603:10b6:408:e2::18)
 by IA1PR12MB6186.namprd12.prod.outlook.com (2603:10b6:208:3e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 18:29:19 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::29) by BN1PR13CA0013.outlook.office365.com
 (2603:10b6:408:e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 18:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Wed, 13 May 2026 18:29:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:17 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 13:29:15 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/3] usb: typec: tipd: add error message for vendor ID read failure
Date: Wed, 13 May 2026 23:58:48 +0530
Message-ID: <20260513182850.165349-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|IA1PR12MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: 3729c0dd-ee76-4db3-c4e0-08deb11d8b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vqvsuC1uB9hzb0B01q3HtasZ4uJ9AjCKk2O+U95cKImPvVaKgtk3obVM2dDKiW3myvypYdx1vApbsuqAPRdGH3RTwWxN7j68ayC+yBxHH8IMhMi8Ra13D52SPr+DaNL3w1BGX9EaQ1zC+7lsv3hy2CeRN/6KdKXBF96X73mtWxKwAYDCeM2OvlrjTXnQA4Eaz6R4uoSqMbeI2lJc9NSnlyQgnC4I0aICdsa0Xkdr0XFkpUvoeDtcEdWGjaRXAKM2sKryWZ2zCVfUDPLB6BNnpwQ3Gz5C/brKt8TZ87VOv62Yl7UpNJfXnWQN9CXGmhLLAWMpo6OwRdh6lcsROZ962bGCR4zEHotAIF64Ergu3sGAwErOoCrQ0qO8iFu+GdOU9nwik8jG0mb29oimrzcaxQHTABLI69TBbeUwWyP7SLWYCuCVaEEg8OMnE3xfnXR2HwWStHhs1lN3/d9Qb/rUSN+/zTodHfVFlqioRNBAyFe0p3fvClfeFI+f3VeNgYeOyfhRSS1hHjcGKM2O3dGVVAlqx4TqRbhLW9gMSs87nmSSXmDRQpKKgR/bg0MGw7YGPrNa081TVQagTg7bg14BZXebKvUIytpbnPPr8HtheVHh2vR3wOdcuOSYpihLrYicKbKMjApTc5QUVgl3HSUN6LuF+3UXm1S2OabN2NSIvO8yS5RV+ubb5OIcCUVLm8QcAAbPApfdPoTQRbgucrhOrDOvAs9nfeSIB4FaaGsS5rw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x89HGGd/6ZdwbJ1R1tOwJUPFy80hrrMbpFN2AAT26uIhspIBsvi7004NKF9LcQlDqPVuNLNa4LSbonyqjQ20nEll/15de2ig7k2RxMhkAbcZOQwGb6K5cyu/vUbaC/f9EQLsXcJjZQnLkP3J3v4vUuglvpx3FMtOOQmiVnhVcrTeEKDmaT806HZ5eYd85D31Ojl4/3fH+l29Rdu4GCPdUR6ZI68cjqp1bkIYAaiX/HTFYdpzchDNZkxuNSjaXkzRn+fhHpyGsD0heAbhQ+PKf8W2vUltOxhA75mDSNrpWFCnFxoVMtK7bKsCEL6okJOav7pu19cD0AK+flqYbm0MZmMIVKTsbiF9YYQew/Alv3BwZwdEcnnCjgLOnhqSq00m7N7G8mBDhWoQ0Dp1TSpZok1w/cSJea6FEyBhBUzqbkQ6OGG17y0hieNZq514SdVm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:29:18.0793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3729c0dd-ee76-4db3-c4e0-08deb11d8b3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186
X-Rspamd-Queue-Id: 1CC905391BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37420-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Log when the vendor ID read fails or returns zero, including the I2C error
code and register value, to ease probe diagnostics.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/typec/tipd/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 43faec794b95..b282366b5326 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
 	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	u32 status;
-	u32 vid;
+	u32 vid = 0;
 	int ret;
 
 	data = i2c_get_match_data(client);
@@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
 		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
-		if (ret < 0 || !vid)
+		if (ret < 0 || !vid) {
+			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
+				ret, vid);
 			return -ENODEV;
+		}
 	}
 
 	/*
-- 
2.44.4


