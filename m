Return-Path: <linux-usb+bounces-37419-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLvHMFDFBGqbNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37419-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:39:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC1539193
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B69F300BCAC
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255083A16A1;
	Wed, 13 May 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4Zt75Xns"
X-Original-To: linux-usb@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E662F0C79;
	Wed, 13 May 2026 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696963; cv=fail; b=qx9nYwZJHpbsqDODiHwdh/J3pgSlcUpxuclnZdzi293JRdL5+6BtcYAtQHSZuWwZR8xL3rk0VEn0Kvycx/OlVW+H21uA8BsYLZSHLouKf9rHdXPb/EfD+bv62hNXl9GdpiSsqkZhhBZM2MyQ7v9GQXtDQRITcHVlUPskbFz1iEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696963; c=relaxed/simple;
	bh=ts3pJYGdSnwCfYXr+YiHLIPz7xaq5axbKP+EoRyhdB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=srPdnhDGbcHBGe29bMhQCo31Jfz6FVRIfSqldUVTtkAu6KxFHLjAgWuTDmJHDz2eJk2LPoQWVqODiGxLPwz5mU6OvJ1+9XoxD4pJexygQ2o2YAfsEsKkWOXt+RcCThgFWOfUOcWt89Z8NKQbNSmyaUV1ag7lTw1EjylFM9iaEQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4Zt75Xns; arc=fail smtp.client-ip=40.93.198.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHEeqcY3S6PmovkVtkSWDCuMUkx1LwVXk1hGaSVWab/fyELeklM7MZNSLaECqD4j3XzREf0O/njrb672c1Dh2Jm/7limd+vK6lolT/Uv/55y7agUoUFpDILfgH0Kb/e32RnAser1Xdt/yZbDPjjWWP02QzmvjNZUDeeyhbmSAdSjcHHiGWKM57SGnrUJaiqxO0U6WIsgZ8nvHmJWTQNyjsEbh3ihmxeV4/3fhVYNe4t7QrWr+u5T17m+7ZxR9rBNzZxRThp0ik3uiZCbRhdop5AT45zO7LduJNH3iZPPBNRDnrtwwaZCDMjKTl5Ys2aTsC0wC03b9ZcjUfJx5/cwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czeHA1VfHFANH2MZSJubcMr/yKDyWLoHqTtH5m2oMeY=;
 b=MN3h3RDt3p3X55sJEEUBT8ay1UFFQqtLmF7JE5XNEtsITmhxC3Q1cGICauhLeH3Ec5ucdYz5dkx2WUIePDsDTmr/fiPCq5j1R3dulTzOMB+GbbFHXvPwMMgLzUZn1FBcMBmJ3I1cB2DZTmt+JLnTES+DsuphJ7FIbmu2jMVvTTQU+SyfB8pnvKJ02cAHnNJlmnn8nZXnfSFowHXzIdhNGO1GE/b0VZ384puiBr4azC0nLj2VBkimSgRoLpuiD939+SqW8nemNY524Fp9Dwz/BEPiQngOTfIhQQm69u/oFIe4hXb8NGhtzvQdMETKmPbTdrHVnvJp+iAiJ1+qLzgmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czeHA1VfHFANH2MZSJubcMr/yKDyWLoHqTtH5m2oMeY=;
 b=4Zt75XnsoWIRXnIY+LGWUXCbXhT/2zam2eNGfPXF8h7Y1Alw2Ee5WP+NrMTrDgAQ0MY1YHgALqNa1xYLgnuix1BsUWBwbLyBfYTenqYrUvO+yslnvJZb2DagmSVz4sglRoLgBWuyTgEixONuxfBYVqOJ5JOZ3dpe7sSA2IDIRoU=
Received: from BYAPR06CA0026.namprd06.prod.outlook.com (2603:10b6:a03:d4::39)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 18:29:18 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::8e) by BYAPR06CA0026.outlook.office365.com
 (2603:10b6:a03:d4::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 18:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 18:29:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 13:29:14 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 13:29:13 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/3] usb: typec: tipd: improve probe diagnostics and POWER_STATUS handling
Date: Wed, 13 May 2026 23:58:47 +0530
Message-ID: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a144edb-b97e-4a92-ac8c-08deb11d8abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eF8qiHOPLuJ0870nGR1/LPsE3xRbO/3WohhhNiHCGGVBZpTnB/1cbDLDz7t9CHXWflAm8UKKvqdNsb/6afToVRbgrYu+q0qcJAoycqu/AqMnppt07sU2XDQzYnhmEUD3L3pqGyA2FYNLiCl/111vAtx4SIOPGBV2i7PFvmAY4zRtsUmiYasceIVjJxlun43YogrTP62c5Rgmj8Yr1yoyQTmxgtnvIcpgoD7udRUp4nX+DBm9iZ7dh5kWe1KSvIOoqPW/e0Mp3jrQjgLnT8sb8XBUIZZUnzHCTjkgz06URoEevLwlnAXq5xGUQWllybr8tuDQu+U0KjBxEklTc7CZWBwYs1zxKKp3oNJJRdC/hGSJab6x1B8NKv01ym6WIGkPBLx8z+NMKAgLPN2NRTJUptMEFQDR5TXbuWo3icVd5Nu7zCblVz29SzC9xiWsKk4thZxaQgYx1PNDSpjCjRT75fFdtOcIDUT9U2L2EueIWyO1Bn05NwSm8dGP8wkDUVJIJfvVWHN3X6TEeZezuQ0/mDDIFYXRPsgGUZ3e9D+9Paq3aY4NZGp5WbtH2nB9Dgq1u4PgFvCOIE5cM2blyyxp6ACOeJoo7bQGGA5rE1t+pTaEF97ij9mfr8v+0UNyu/DJR5HKRpHwwcujCXZ9XQDjBqDNpF3h590vew3wYCXxLjOoDj2idYyaCG759iaQtVSAAlHlpsAGq9r8p6PKq16yF1mEpdUNZ0L2zHa8hOv9mNM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BbHY4k6JOF/E3pEVWTV9GALYuDTo6LSxDbgda5yJJlN99ARZQo5y4TjTONXkuwhCl3joL1YjhWt5n5upGPfC0+0qiaa4/HnsS/tDvpRPJnOqGOkTRX+tZ3mlEjmgDN2vo+6OkCtdnmrQEdVcVo3JKWFNgifE0nl54vhCPGF4M9W7kHAdR1hSlA3FFKMw36M3GjASbUFDg/cJdWSoRqiTYrHM8dLj+rTUEnnsjFG+7NDfelPZbWVKqKzT1ViDNYWmJvpI2lC+5e8EmaAwPI6bImfTIunbd7bXUyN0ccAMvdCqGzl/JrpqsM7UY5jfy2Khko74/L7dwsrXQh3uNz+Ru1SpK69J//87aTEop8WF71RK04/N+I4+qg8LNH26Bj4WdyR+yweK4LWY4IXbN9GOSrtlZyAVV0swZGVNAfjOEn2ODEamHBJJvXfDJdEomIwM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 18:29:17.2073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a144edb-b97e-4a92-ac8c-08deb11d8abb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
X-Rspamd-Queue-Id: 2CAC1539193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37419-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

This series tightens TI TIPD (TPS6598x family) bring-up ergonomics and
cleans up register bit definitions:

- Log vendor ID read failures with I2C return code and register value so
  boards with wiring or address mistakes are easier to debug at probe
  time.

- Treat operation without an interrupt line as a normal polling setup and
  log at info instead of warning.

- Name TPS_REG_POWER_STATUS connection/source-sink bit masks and use
  them consistently with TPS_FIELD_GET (no behavior change).

Radhey Shyam Pandey (3):
  usb: typec: tipd: add error message for vendor ID read failure
  usb: typec: tipd: demote missing IRQ log to info for polling mode
  usb: typec: tipd: name TPS_REG_POWER_STATUS field masks

 drivers/usb/typec/tipd/core.c     |  9 ++++++---
 drivers/usb/typec/tipd/tps6598x.h | 10 +++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)


base-commit: 1f63dd8ca0dc05a8272bb8155f643c691d29bb11
-- 
2.44.4


