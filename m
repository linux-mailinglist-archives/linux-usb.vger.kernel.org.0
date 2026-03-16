Return-Path: <linux-usb+bounces-34843-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOXcFMynt2k2UAEAu9opvQ
	(envelope-from <linux-usb+bounces-34843-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:48:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD66295407
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BDC43011C66
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACBF34CFB9;
	Mon, 16 Mar 2026 06:48:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023121.outbound.protection.outlook.com [40.107.44.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03820468E;
	Mon, 16 Mar 2026 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643720; cv=fail; b=QY0Mvb/vRjDhRUBHtxQ7LD3jBBFOlkjwMGfbli0DOD88y4aJszL+q9E9qLsaj5+dzXb9SphiNQFNYW2KmAhvXu+rhL8w/ETj1uP1eFeb17EK0EI9riIAQH3Ji8Kk+Wu1n5cpi7eEbsk8SxP3FbCmDbJc72n6B3a8n08zOOEMRTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643720; c=relaxed/simple;
	bh=Z3GdLqnrFsh38eRhnmEKYt+MRYvjfHGtAVF/ReQqvMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nrK+PAEw34S4ZHSXXcygaxAavss81+VwOKFqtopQxZz3TME035IqbC04cpU/VkChgMonTUiQQGy3xxqw2n6Qc67dNFSW02FHdkc2FiiSe9afm1+Hre8aUmUOmFxMYLm/gegSd1H79yZt2GvxwpqSoyktZsM53SyVuVZrvqT21z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GX1dgIoROvC2+jTtLjrK9adB9QrGgavNTp4OeDeUo82fBAMAPB1hY68WsBetRd6iVkjkwZMN/r6Of2YJkZJG3tnfMh8tkQEaT2VryhlsTtrJiYY4vMAAQ8EG/AUH1Me1j0fBbKGpyt5dZ+z9OP8oWlzq0sMUGDtEpF7228EiT2pPgGVkefjwEAOJOUX7ioLA3H/gIDkJ009vyLkfCw8tNnbGwclwXxxeSYZ+vR0pIvqu4W5tby99TinhZF6ff2EFeePDJtZBIM3nBXBfjfESsQiZaXOUrFKZyF+92jO3ykXuqIWqn/6qmImp8Rbhc7IQNrIkbeLYUXf9IRLvgPonEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXDSnA+Ere+2fWtuh5VlU/p2cZ40qwmiFd6570xMffc=;
 b=dgGN0jem0hy9KQ+6CeWExpvqNCIbbvwwF9/DDmGPyJvmikWAhCDbLa+ZrdUdX4YrePaJ0DHp1KaflDdhnkkCAISGHKh5SAI91OECmJhXDvGrEzlXHXqLiwHxmUVoKvhAKV8rYWUQTFWGiX/6ALkTGlR3Wi+k2oyb5puAoOiLzHpVJ/YWwbx69YLlOHLN9wjcjQAX2Hq2XH6PlomOit2upBzWD2ydzBV7pDtVy/vjWTZts7vJtXB3f8i/V2WaEJ3YvDWQht0j338BradEk6GfyNC0cmzYVcd7rpJLb7NUENw1Ny2wgvmcimZBkmLfTg/ceAHmHmE1LTx+LlkuzFBJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c6::11)
 by SEYPR06MB6484.apcprd06.prod.outlook.com (2603:1096:101:171::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 06:48:33 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:3c6:cafe::7a) by TYCP286CA0170.outlook.office365.com
 (2603:1096:400:3c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 06:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 06:48:32 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 728AB4126F87;
	Mon, 16 Mar 2026 14:48:31 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: cdns,usb3: document USBSSP controller support
Date: Mon, 16 Mar 2026 14:48:30 +0800
Message-ID: <20260316064831.274865-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316064831.274865-1-peter.chen@cixtech.com>
References: <20260316064831.274865-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SEYPR06MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 9028ad1b-9473-42b1-1563-08de83280a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	EzNRkBIHikWLjTb+TpMnzbnO+9GMo8DzKoensDQwZPoV3lzkqwkibsdjEjpslLMVqifEpusDgExQJByRwmfCP730SrSqLoNKQ4ppavp1/LD28RiSsoLebeLojAV661XUo7hkZ96jcNVZQ82/Phd8Zq230/SQiiuWPHPJetqojdkUaMCaSySwlulZ8efz7quDfp/gTLVJNWOyHfziWqqWGwOHoIZMQ9DV60oYAk2rSZ0s5BB9jEWdfothfzgHFG5X+1goWQ69kPioYTHljbNul8LBQuNVYyRCo+NOzncft4rBLUo45EJ1H7sPK/lsEcUAwHaZtbFU1RmtqeDiDU0Ei8Mall7YdqgOmmIEAP/74zF+CXlOen8ZzgZab8ZvKt/4dJU7R2R6v2hjNeTzuLq95a6EUGzeNabeff8NvIk/cbF6mIwDuN8G4YEzcS0dzuBubyDM+uCZp0sevzQkoRrmfAXs4vfZBkRSDCTz7Rxz9OhoTnzyeUGOFn3FK01cgeqlIWyCUwHga+rbkrFEWXMtwpVby/2M5ib6zBE7MTGt0zy0Cc0TdoMcGlVr0GI1ea8rnaiyNHDOQ2LRQebVbACME5uEvWZKTS55M/KXG6CV3zddik736A/6JE5NMyd3tnA+cijFXsQSkJZzv9aArQtmjSMnm6FA2LLJTkcqDbmgo/Rm0T4Wl9s5Qgoky04vCv4xr6GhgKmIrqduXnwfJk7ZRkr8XUU4b13y0ucvzxyAPTo=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hua1lM5yQx4aDDRIwDl29LIjxh9In5Y1uX+5AHmLbrB9PzwRHfTcMo4F8OBy7K0/W2g2aoRH/WdJm92fvRHi/LqBrNbio/KPTqB18PSxThYV5ycMh2X9/awFAmaLjqxjdKvINY4dW4f0Id6OZLSDElGE78puvOXlDOBxPVacn8VobbBk4g6Bqt8B3gtZlomCNQ9/JINLp7Ea3lUOf50HaL5U7PkFnIgSQHA8orSywMHLqgRefa0e99cr6GrgTAf40D1QJjhY6OoORqeTnhWvg4teO7FjlqXbxRlJeIs1Qp0QHdCVVfoStTz3DsZ9PcA7m+CwW2l1gUh7IDru+vj3rowzLBVowVI0mfbnqAarCFQ82ShC/4zeRV6AHtsL5RmtW/qrjypmJPkDANnvch+ruppvUoYMkGhN2Nhes2Kaq8nUs652I+iRGgzPIjg/bnQ9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 06:48:32.5893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9028ad1b-9473-42b1-1563-08de83280a56
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6484
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34843-lists,linux-usb=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[cixtech.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cixtech.com:email,cixtech.com:mid]
X-Rspamd-Queue-Id: 8FD66295407
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the Cadence USBSS DRD binding to document that it also covers
the USBSSP (SuperSpeed Plus, USB 3.1 gen2x1) controller. Both USBSS
and USBSSP share the same DRD/OTG register interface, so the driver
auto-detects the controller version at runtime — no additional
compatible string is needed.

Changes to the binding:
- Update title and add description
- maximum-speed: add super-speed-plus

This patch is Assisted-by: Cursor:claude-4.6-opus

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa..ad5acf956edf 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -4,11 +4,17 @@
 $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Cadence USBSS-DRD controller
+title: Cadence USBSS and USBSSP DRD controller
 
 maintainers:
   - Pawel Laszczak <pawell@cadence.com>
 
+description:
+  Cadence USB dual-role controller. Covers USBSS (SuperSpeed, USB 3.0) and
+  USBSSP (SuperSpeed Plus, USB 3.1 gen2x1). Both variants share the same
+  DRD/OTG register interface, so the driver auto-detects the controller
+  version at runtime.
+
 properties:
   compatible:
     const: cdns,usb3
@@ -49,7 +55,7 @@ properties:
       cdns3 to type C connector.
 
   maximum-speed:
-    enum: [super-speed, high-speed, full-speed]
+    enum: [super-speed-plus, super-speed, high-speed, full-speed]
 
   phys:
     minItems: 1
-- 
2.50.1


