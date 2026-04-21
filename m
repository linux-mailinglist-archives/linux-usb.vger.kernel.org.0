Return-Path: <linux-usb+bounces-36374-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JzyE9fi5mmr1gEAu9opvQ
	(envelope-from <linux-usb+bounces-36374-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 04:37:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0AD435886
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 04:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEBC4302D514
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 02:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0259F286415;
	Tue, 21 Apr 2026 02:35:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022119.outbound.protection.outlook.com [52.101.126.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A770282F39;
	Tue, 21 Apr 2026 02:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738910; cv=fail; b=opZjaHdc6/sPhOX47y8/AJSo3AKW9wNHBAuzWv4vEoRLHNZjDeVsRzZxBgB31unwX6E0Hlz2kM0dYvgp6ZU2repyIUcWMELzG+4iQQWLzIg9GhaKlVYdtwk5R8z0ggHdXKiWHC2tB4s7E03XTyOz3uVdEAtzXLYlOQlW1FN+7vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738910; c=relaxed/simple;
	bh=u4geRa/haP7v2aaNn33kcv8eCoFrePVlTncTH6gB/Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsxSVhKCL5g4rPFPs4myze4q7ZAYFvqbZ+BzyYsPqidh4SYR7q3c7sUv5nyHrcqcLjOdsX0j6VDpA2r4RqObgpBbl1mYhFez7IeFYMju6rhQHVy8/aGeAEvsAQOalYfQj88U7zB1Cl9mM0L5Ewz15d1nRxJk85fysTeeHr2dBiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx7HNsDxo7b6GxNUGHg1ox9/CA/nQpqUmjQBH2RTWKYkcdhejwtBxIrIRPgwts+zPet7mbNDDo0vBA7WQUaUILoNhAnlK8yce6nNVUs1guh2zl6/nqw7LWSSraq8RJckM263ilmjI3Dinb6eg3Cm4+iaYgNAiqOSENA77VG0ZObArnVLv2rB+xOXExMwMZrQYYMg5R+v37YT1zGNtTIV3ixvoAIzvzku5MZNVh3OHa0HnpCm7Ps6RAXheVmBcBviyV2lNOnoknQ7K1Briidq2GF9h7kr5N1q65FRoagdlLOxsrSHKPTtVUTuBH9jXMXbl34BqEARyPcw5XieG7/0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBX0+BBzZg50Jd/nRsSeX7H/x5pFQvBiZ6iNsPAUPNI=;
 b=LsmdcC0OyXt6wYeKatgROpQPl3sICC+LR5fZYwh39GEJqG2XzpGQTCMRF+tCuUkwkae18CHSk+GC9foipYc5aiOlHEylDithdsZpRGykRa6XFsc7vw0XmUbdcIcgmKDAH9kWDtKWeFCx6b1XLCRwWQLzi8EG+vJHsdr6lClYigEQr+2yL618M64+E5xO0uHilxPnFkixnZgaaVRu/EIsYixxvNILw0lACfqPBv62qugSsyop7+nA7geKOOXag7j8nvqda6i1kp3kq10o2v/22qrPQJRbTAHc/qmVF/RBu7arFvz0pKyomPJEJGDNZvb0wc6FcO51tBedhf63ivQXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0166.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b::17)
 by KU2PPF39B5AFA96.apcprd06.prod.outlook.com (2603:1096:d18::48c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Tue, 21 Apr
 2026 02:35:01 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:101:1b:cafe::15) by SL2P216CA0166.outlook.office365.com
 (2603:1096:101:1b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 02:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 02:35:00 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 728004126F8F;
	Tue, 21 Apr 2026 10:34:59 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	pawell@cadence.com,
	rogerq@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: cdns,usb3: document USBSSP controller support
Date: Tue, 21 Apr 2026 10:34:58 +0800
Message-ID: <20260421023459.506145-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260421023459.506145-1-peter.chen@cixtech.com>
References: <20260421023459.506145-1-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|KU2PPF39B5AFA96:EE_
X-MS-Office365-Filtering-Correlation-Id: b927dafb-41d4-4ee0-1f17-08de9f4e95f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AjN4zzuvUg1Qi9kLhhV14rPuq2N3T61SSPtzJUdeI8hIEETHQbqluA0M3qSoPeVoVsspArCpWUC+QzZGzXZWSeunEl+1EzVUWbrVAKQzKWqWJwj5kKYqer7gQBxLGrb9I4FWIuFwvUMUTZG8WvExdJWkY3JXNCdu3v7X/GKOSnj44h0xAyMD6AmfO4JX9l0Podojs1UUWbsxLYXlF9qTQRUZLRcFX6BTgttdAQMPso51cUyu5k5Io81ZPYaNDq92sUFnK5XtFsNEvrXPjhX3dQOIao9WgHeCGon8MAoY5JwUt/XbVaXVEX+4BXIGNyXWyEhhqqPXvbc8H86O7l3GKI0Vao6d8Sg7ybD2Zzp/5dyWrupVfnt5orVtBf3O1AwG1fKK6bhlz7EFH4jsMLHTp2OfgQIW/wCZfSe6HQoULj1MIkG8/cTtIQqUs/CWmWB22TD4KAnOjLyFg9KeYAhgAq/M6jhfZPko5Or20Fm4nJlXmZQvI7wBm4ZPZhh0fh5wSV3Zt+Fl/9XTtJhVFpQsTUU6D+eY0T6Loti7bWlt/1fS5EDSRoGjahTd7rDFzuKad98MAgOhsAwz97bXLCa8kDiR2nNe0Eb5qU2PYrPnpyhgHZpaIDcgTYvJRDumcN3wfjz86fjrI7AYItjS0P3NdaTlR++khes3SSfsZUoZhOcjvEQNNkdP+Hf1IRDGkXv0hIqtibr/h+b15ftvXtAwTNoNaf6DRDmDfAfTuoVNkmk=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5N5oYfxVcq95GW6DUWdJqJeba4QW+lV5aRUr0tHInOlOBrPyNJIfEjJWtZDwBtMrhMlAH+slDaBSGTvMcVXUyieN2LCDbtYjiyuCm3cYpF567dR75LQttRDnz/G6bdmAPGoqnlb0eZ2I1vIB/f0i5jbv2x9a/EIWgwh1FR45q2dASpFpPpkpvxuu8ATqReHuUPBk/SW3HZgo1ZJ9D1GS1k4gAhHN4HY8zn6RlFeZpk98Z49dgv0EXHjMmegNcW6XvtyAT+d0N43i4g1jMqWqid8zRzBzqFc325A0EYulNGO3wI+y493zZtch+45v6LuaejDFOISUm8gz6Rar9ITl2GJV0E3GBMU6BFmgZSoNPic5TpaP3JqdXrIz9OKnq8eRZJhlImQKmhrzOzFf6TMIQ6HVcZ6stgLWjmxlMuER2CRzcCRuhZvnZHol5AiXcAQ8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 02:35:00.2830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b927dafb-41d4-4ee0-1f17-08de9f4e95f3
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF39B5AFA96
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-36374-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[cixtech.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:mid,cixtech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: AA0AD435886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the Cadence USBSS DRD binding to document that it also covers
the USBSSP (SuperSpeed Plus, USB 3.1 gen2x1) controller. Both USBSS
and USBSSP share the same DRD/OTG register interface, so the driver
auto-detects the controller version at runtime: no additional
compatible string is needed.

Changes to the binding:
- Update title and add description
- maximum-speed: add super-speed-plus

Assisted-by: Cursor:claude-4.6-opus
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


