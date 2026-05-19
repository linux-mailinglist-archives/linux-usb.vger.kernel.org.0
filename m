Return-Path: <linux-usb+bounces-37731-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEkWIgeqDGpLkgUAu9opvQ
	(envelope-from <linux-usb+bounces-37731-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:20:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B458392C
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 183D330573B2
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CAF36A01E;
	Tue, 19 May 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="289svHTE"
X-Original-To: linux-usb@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DD36997A;
	Tue, 19 May 2026 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214830; cv=fail; b=dnvkZo4cbsa0NT4LX1UcQCirCP8UBPlBsEbYMAWmPw+ZPQOBdYFQlxxl/E/iYSHSt3ZY+tw0ADv4RKFZMWuYJPl+8PgFKW0inEh7oCoyf1YDbbxfBzcichxDnvaguZoXIXn22J6TMMW3qDWHRNbaVtLwP77P6Tb2RCROg8WYMaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214830; c=relaxed/simple;
	bh=uJgWhRyWWxIzRR6QjfikPKtjeiXY3rw5mP/rTOgClUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1AljcfMz46PMbCTr7n2L3MS2geo6rsGJRhn3CLTy+qAyfNrSO4BZYYWBqPfGmdEeWuWlWh3UYM1FUrZqv7EID3HofO3DdsNbR6goqoKbyVEFAQnP7dASdIr9bL9bvTZOzHfo9S6q0cwZBex+m7Pn/xCnAQCIZI0ZYwpfZxuDjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=289svHTE; arc=fail smtp.client-ip=52.101.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3AVCZ5Ik0nBeaKzx1g6tA1cKgsuXwTOS8u2fJpNQhugSraVVm8Q+uOiS95N64ii9aUWCgc6daIOhM3V8Afp+/62GS81eHl+pXTdmEfcW9n24VL6fozTksRaTUScx7CpBNGjyrBAZnNQXpJaKMIh2im1G5KJSQ/lR+NeYGlyJA0q50eMLBG63PXWkI4AiC/e4UXI59uYRbOGsSO/1SQUBb9R4Y4tIP07fFzuLsaNQhf2+GtGJG7FJ962bMlz6T5n+6Z9OOZb5HIfmK56PoJ/0hBB4KMq/3GcpGjG4sOE8VLWS++TQDnUbDj08bXVyaMxBg5Fhxp7f+mIifncH1kFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7MidDZ4qFkVOl1M+oViGWB2koRYq/3IOKQ5slihhgw=;
 b=fCPW2kqheAaL5MwC5pB7cUncCLGHq/Nzl5uwVbnxrTuQAADzBFfbEKol3rjtfNRSl5+s/KNQ/TqwXAasmE3hTPt7qq5YkM/qIstOTLenoGv75JaOes+ssMMGtEZttqLIKYJ8FWbG+XYh2XSVryfOiCQj3UvW80XSGnMN3Q5aNm1azCj/ygFfarN2aYwV0mnHZOWX+VB2IsYs7okwOks+Ul0833XFSuBbm+ZEaMo8KuRuEfaGTU6Th7U85fx1IUkqwXWRh1hfTXeN8JR2lGuywv3SGvlr8LDi2HoaP/rnqgf8fs8nzyoL5o4+JXSNFHvsppWwT3Sp60YNyM12zLtf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7MidDZ4qFkVOl1M+oViGWB2koRYq/3IOKQ5slihhgw=;
 b=289svHTEYSw0tdAJ5edLmRZ4VeFFjbCEnirEivqS7j3Hmtw8GxjAiBUqvzELynJ5YP5SFrdgfQ2r+nk5pky4OHm3xDMD+/PVeGBHrYSIZ3VFNIQdbIRVUvDxcDr8fMEIfQkEb64cm10aUudhYz5lBAOT4oF+U5MEUFBmuJkZRHE=
Received: from BN0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:408:ea::13)
 by SN7PR12MB7023.namprd12.prod.outlook.com (2603:10b6:806:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 18:20:23 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::b9) by BN0PR04CA0068.outlook.office365.com
 (2603:10b6:408:ea::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 18:20:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:20:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 13:20:13 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 13:20:11 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 1/3] usb: typec: tipd: add error message for vendor ID read failure
Date: Tue, 19 May 2026 23:49:54 +0530
Message-ID: <0aa487d3f054b34689e95760fefd72f7571f64c9.1779214249.git.radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
References: <cover.1779214249.git.radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SN7PR12MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: b25b2faa-ab97-480c-2e2b-08deb5d34ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gMlw9zqZ4wLbRbhB49H7SfUjvFqeV8BrAZUblbuOpX12j6/yIKnlnsjdoBzSqDXeHlsrfrRl3/PdV/N5TW3E/QBIXRdcsx1UxESVN/nLsrBhj6lFJ4iqLHzly84nnkYsJ4nn1H6Ii1XYy3wlcly7RmlivAHsikqthOxY2VP9pp4ZzoIhw0iOXisQXMwo7COR8d3RopHTWckLby2bguacARylPpvK+ZcRDjstVGWqoUYJIcr+4PGWKiQBqhb0F6TlI6btybigZQjgeBvpVA9sdboC1yG5wtiXiULD4a/e7K50EE64x4u+GXXvDLZ7+riyadqxx+OeHD7GVnIXSeZcMqwk+4Kuqof0eGeDPjQicyMCRQNlEcw4OgVSNpX6ZRdAVx2CnYtc37M8itrN3JyjfRwOanFKRf8E7raQaHd1Z3y1D5NV/U0TzPtbkkBjoaUTKM3vdV4fTcMSG5JWesJapfP5LfxfzPOnX6/WzbPJYPC5RqVacd59Dd6mtQq6ooD3dgas93G4/faoMiYI/hgoyNE/LXCanwIRaKNRI4cCgFhYK1SqYWMS02LZBMslYxoUJME1Mw5CGs23eN9/5GeKlXcs/JkbAJ5XYAy1SegvpONtHbTTjezkspk80oLuAZg2TtxLAm7M7xgSRyviLWcjlv+o9AuU1X0Z87dsdfh6jjN6PKyGXHvKTVto+J1aA+nLJvXOPL/PiIBWGKVvt61ZhPM74mbCjPzVBo2e8mXRhwg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GsrHdduorVvARnv/B7iRsoWDMF7jGp0j2wrpmXMRBPNsjldmQu/U4o/TxejVu0vQoP36bm8ZrTfjrXOxgjGGoigLuNw7opY1WxvmI6vts07SXXp1JO4KTC1vPzw4No2+tZEB+NIO1IJyxXIERZAZlFgOE20BLcGBs03GmbOwoJj0gbYgHBls4IgFcV4paGh5ryp9/tARu0A08x7n0fl4xX+RJ0maiULhg5J+i45c8vQ6i1y5E3lTnK6V8Ca2PT8nXfJsySpUDaz/VuDyS7sH0gPus0Z9HZo/qWuWzb3CCfHqXuvyDwX36Jsx2MSwE71DzvAbyI0tbmN7p/zx9m8tVBpLjfWUyV5aylvKpGcLsEOpodKtU55cnpfYa7Ms1sSFhntFlZtYxixOtnSIDYjh/2/lUfDIYJgGk47XSyuBDTaXFwevGfkAfXOdn16BDUsq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:20:22.9896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25b2faa-ab97-480c-2e2b-08deb5d34ac4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7023
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37731-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2A3B458392C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Log an error when the vendor ID read fails or returns zero, including
the I2C error code and register value, and initialize the vendor ID
variable to avoid logging an uninitialized value on read failure.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- Extend commit description to justify vid initialization.
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
2.43.0


