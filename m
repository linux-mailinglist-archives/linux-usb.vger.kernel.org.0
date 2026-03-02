Return-Path: <linux-usb+bounces-33848-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BuEOCL+pGn3xwUAu9opvQ
	(envelope-from <linux-usb+bounces-33848-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 04:04:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 857D51D2990
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 04:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490E930179F7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 03:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474D02C1584;
	Mon,  2 Mar 2026 03:03:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022111.outbound.protection.outlook.com [52.101.126.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C17250C06;
	Mon,  2 Mar 2026 03:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772420628; cv=fail; b=ZYmPygJlP4EU87qVlX0U62rQuq7t123XWoiRi1D0M1oIW83a4RcyWhRaluvb/sJ52LpJbb27F9raWS7U+l0NFLQWfEJW7G9d47omXTw1CzFPh9175nkS1HI5XGB9sNPFlG5nsP1fWOJ1PrY4a6nO7y9eYAcrM7Np9M1m/1QGjKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772420628; c=relaxed/simple;
	bh=RNk/godFhQlXSGrSvE1nfORSJhCAwTIPnA392tY19ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XE+2Xz0258V9la1wAYI+t4iOhUC7MRz4ajzi2PYjevph+ewb5FrgPs4tNK+t6A9A3zj+wSQy11eIv+JWtk7s6OhefLW++56o5FSJQWVuj/gGy3bb+08Yn+EYVH+YLPbvywDwHN1lEI3dTJMKuRn5swRKjp+D5/f+c/YEsB1FrpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBwfyAdN+6EqxODxl6hrTyO6zy8NZeCQe1CbkQmGZa5PexZNHblhJ96oFCOSqLo9Pdpu8FJfIAWyf40R48xJMbTCruDu1Gc/ns80i5P2tToAXNatQ++NH/bmR68assRT79mHRz0L0tV/7Lr02kyKbXonP3fH0ViiO3dCzKDds7ts7XDJfz2XO6bWc9JWbFVRVSTQCg7ZoThRVECKK0djk5PYPEG+RkN5vxirg+JdzVyRE7+ysskqEs6R89584CdZceRhHCkYoNu5rKbISjrdejBGNdi6ds7QBz1navQVOFwATf6hRpf3z37k5ngsii2B//rzm5klOf3QgN9vlgoXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2HfCtX+1ohWJFmOZVTNZoH0ZUVXvGN0TzDW2OgyhyQ=;
 b=cMUoUnz9mPPyJRLrEXz3Ib/SXX+nqtOAKUuIQ8MY4zOTWHcDXDJobaAjSJaGudlkGM9QxVQAboAEGTVEsHgzhKnZLQJ0b+i06c8tlASVTspR2FfmGDOUwdrMVpEMK4DV12EirIaA8MoCFAOBBa5dJYCpAZjmkg1hQEa7puj4jrdzkyehd+sZrbxU8RqqI+cWZoKszZgjgp1FewBqzGrU6+H79BHV9wDdetSLXghs1un1Tiho5uBUrtbJ0/CeVILox5gVtz+Ct/6fRvpvkg8xVJ+ZMRU+hqvP38gQEF6rqFKtONRobhhYRb5JUGk9IBnt3i7NevEtv0BlAJ+hoce4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) by TYZPR06MB5784.apcprd06.prod.outlook.com
 (2603:1096:400:268::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 03:03:41 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::f2) by SI2PR01CA0030.outlook.office365.com
 (2603:1096:4:192::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 03:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 03:03:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 76C73435071F;
	Mon,  2 Mar 2026 11:03:39 +0800 (CST)
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
Subject: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Date: Mon,  2 Mar 2026 11:03:34 +0800
Message-ID: <20260302030339.324196-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302030339.324196-1-peter.chen@cixtech.com>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYZPR06MB5784:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12737f35-8966-4484-afd9-08de78084e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	3TCT5hYaZXLLfLlCRg9KZXgnO1HyU+1dtBB5wlPPbf02IZUPdwrkDhveBxcz/tzwMV8pnu2YcdhmudLv6llS9W92rRzvo8kFeI+Z417VJdWcycLpsth5mD1B4c4UFGufalAmCFn03kRfDWGwtwj2Id8/ND0sbHNDgwPotS7l61I3MtEIeEjg+tiWQaiMbZJsJaMd0DJqAPouxB0mYhZ64bBT5nFrOkksw9tL4Zo0XL7JKO2/CSCj81uoI30qRymWmsu9e8GrZzlmzZIZvsgI5iuEpYycCdjBbIaJlc3YqZ1FohaM0Zq+BY6WIWZS9SW0GV9Pkn3/mmyYNbMx4icUcuAS3TfuTsbN/lsaCw5SqFZ2ypENVYx2i+YXSgT4lUlSho7aoOJh5l5bwXcCIIjC8TYbkQQNDRCk8CnDBMOzifLj+yIrqK3c0zpjhAtXqh+2+NZT2HY2rPnGlRkKhc+qM5JBpqgggoivMnJys1UWNosPq8pvh6Ojmd1loLQy0NvXx4QPl54Yqb/TiR3cCj+vjuMfbZOMKYCFcGtZ0/90SrELr5pQGkxsLiq6oJO7JYsUi/C4OKztJ5fKOJ+XPc/xyKpfHFJv1hrD+iw3yETSS6iQtnkYKznky+xQneBNJw1JyuDU3tROrCDiHHY/d73J8xtvwlC8U/dqcc++AhxTcV8fFMbwh2bJNHQdgeCH5le+yiu+/Z8D52HqLtLwwR6vFxWhbFDC/y1O+AHmcggM/WLUyPnvwYJPj0v1QHjPl4imtczxk8mXZqb0mept3ZcLhV6seB5ReTVDKhQZEJ0LAtU=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VAE5fscWEz5+rMw6cunpoKqc3waLfbg6zccdt9mlSP+XpvhWOdzkGJ+4TuQMmEJwgpxxBRN4CJ94fSSn7KqiPQmsMiv8D+6tfw9PLi4UTPYsYglYZtfW4lPv+RQFKaHMaKVYDiBtNdBl8mijXI3BVrJv+zBPHUjDbOE40mEv0NofIXp6naRDjE62USjZiSbFJkW53XDNg9eseiwOnvYkTaEqW7JYV+r+E8S7GkJVALvryoF+nrXSIAFspcbeVo49NqjlrzezhlZG5oPTYfzKFKtFFRVT9KjxXfAt820Na/Yi9rZb71KRsqoZhuXxgkn5oo83k9BaSZguAlkcXv71iR9E/SC6zQhMURyaNwHlQnUTDlsTk/GDLAE1IWqQGRE+oDnJy7qa7ICZPcIPdkb0Dg2qQN/eNsCn8ZP8C1hNp9xba6bSCN0GW6+0qo9ZjRjz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 03:03:40.0459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12737f35-8966-4484-afd9-08de78084e52
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5784
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33848-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cixtech.com:mid,cixtech.com:email]
X-Rspamd-Queue-Id: 857D51D2990
X-Rspamd-Action: no action

Extend the Cadence USBSS DRD binding to also cover the USBSSP
controller by adding "cdns,usbssp" to the compatible enum.

The USBSSP is the next-generation Cadence USB controller IP. It adds
SuperSpeed Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an
XHCI-based device controller. The register layout and resource model
(otg/xhci/dev memory regions; host/peripheral/otg interrupts) are
identical to the USBSS, so both controllers share the same binding
and the same platform driver (cdns3-plat.c).

Changes to the binding:
- compatible: const -> enum with cdns,usb3 and cdns,usbssp
- maximum-speed: add super-speed-plus
- Add USBSSP example

This patch was developed with assistance from Anthropic Claude Opus 4.6.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 .../devicetree/bindings/usb/cdns,usb3.yaml    | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa..f79333e7fc1f 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -4,14 +4,22 @@
 $id: http://devicetree.org/schemas/usb/cdns,usb3.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Cadence USBSS-DRD controller
+title: Cadence USBSS/USBSSP DRD controller
 
 maintainers:
   - Pawel Laszczak <pawell@cadence.com>
 
+description:
+  Cadence USB dual-role controllers. USBSS (cdns,usb3) supports up to
+  SuperSpeed (USB 3.0). USBSSP (cdns,usbssp) is the next generation with
+  SuperSpeed Plus (USB 3.1 gen2x1) and XHCI-based device controller. Both
+  share the same register layout and resource model.
+
 properties:
   compatible:
-    const: cdns,usb3
+    enum:
+      - cdns,usb3
+      - cdns,usbssp
 
   reg:
     items:
@@ -49,7 +57,7 @@ properties:
       cdns3 to type C connector.
 
   maximum-speed:
-    enum: [super-speed, high-speed, full-speed]
+    enum: [super-speed-plus, super-speed, high-speed, full-speed]
 
   phys:
     minItems: 1
@@ -90,6 +98,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    // USBSS example (SuperSpeed)
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     bus {
         #address-cells = <2>;
@@ -109,3 +118,24 @@ examples:
             dr_mode = "otg";
         };
     };
+  - |
+    // USBSSP example (SuperSpeed Plus)
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@a0000000 {
+            compatible = "cdns,usbssp";
+            reg = <0x00 0xa0000000 0x00 0x10000>,
+                  <0x00 0xa0010000 0x00 0x10000>,
+                  <0x00 0xa0020000 0x00 0x10000>;
+            reg-names = "otg", "xhci", "dev";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "host", "peripheral", "otg";
+            maximum-speed = "super-speed-plus";
+            dr_mode = "otg";
+        };
+    };
-- 
2.50.1


