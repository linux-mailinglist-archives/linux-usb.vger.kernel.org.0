Return-Path: <linux-usb+bounces-37220-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEEPFGpCAWpwTAEAu9opvQ
	(envelope-from <linux-usb+bounces-37220-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D94507495
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 04:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB756300A8F0
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 02:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3543B30B53F;
	Mon, 11 May 2026 02:42:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023081.outbound.protection.outlook.com [40.107.44.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B362F0C45;
	Mon, 11 May 2026 02:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467373; cv=fail; b=b9BTUwMuMxSYVVGXOdOIoe7GL1KfpS7wYrOXx/mdNb4pbLcDFP+jkGFhy/E3WBqSw/DzlVVML27BQvGTp8RKBIJIYiFt/emk4kDUA256f7CywlkcUyq/d6gE5UR/5FMW/s6Vy3mjiVSyOjbxAeZWbJdCWB1eTHoJwkRsEOQlXks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467373; c=relaxed/simple;
	bh=wCwwwcT7BysMz9l4wBeneJbpiBRSSkTg2lyUac3FQCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMLRX59me5W0h03fSoXsdsys0EaiHMpjwQbNrYYViYEbveI2ClQ2oXUqI6X77USRTFBoDUHeq1MF5gI2Dw1ZdoqidUgAVPN94ubbaF9X7qfCCDHp0VV6FcZh8cibD7Xz7YMkrZfkTYIKGphCQo2aWWtCEndRlipWwlvRBGy2PqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNmIS2DCDxVdGHeYFcMjAU34tCf8wtOG+yamTjiIxVfPX6EDPKz8sIXwhejr2jg6z++d0JS2tuVupYQf3LQPUPEiS4miAQvZPVN2aXJ6+iH6j6+6EHvq1mKSSTlY9T5UsnQDG9SwtLfprEJU1yYWypiSEJrW0NCVra/H3ouXq/8WX0VTrdEdVaaSk8hgO8KCPQlFwAfRuovKTDHoc41Kd9hmhv/7gL3zH4yzfxD9eoZ0Of1kBqL09j42HLsx3Ji3wSy2VGuy7xVG8yR1U7lnNhGcpwCEtB/9gt+//eJmH6VPLN9Otj8L1ilmMOr58rYXZcKbPIMQ9D27UudOld1t0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mpe51utLyLC9GkzUxq50oEldYz3B6Rovb1HJututls=;
 b=yTn8WWg7Ki3vnYCNjsZDXMb39dEVIiQAskCkq9PgB4W1wkRpcigWG9Kr0tR6g7WEFjE+jYCmrLS6NFEG0So1SWqW0gJo2GzoPjPP779CcUdce+koV8KJjbeX490BdFzsGY43c77Ilj307ItEoho4xO4tE7DWCzZWH/4eGrxP3D35AMLOvkX5EcU5fWa+2VFnnXKOwmmq7PuDYF5Aic5Ax6kHzJpfy+1ORJSowa6KOfu0OcvZfh+pjAzks/to6GIflnlfNZiP91VoNYIiwH1ZSRWdv1OkjA2YB8pkaKxOZ2mv/EmSIMVRX7Z48V3VIwDrtI9fVJFvdyLumF4byD3PSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0003.apcprd02.prod.outlook.com (2603:1096:301::13) by
 SEYPR06MB6663.apcprd06.prod.outlook.com (2603:1096:101:175::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.22; Mon, 11 May 2026 02:42:46 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:0:cafe::2d) by PSBPR02CA0003.outlook.office365.com
 (2603:1096:301::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 02:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:42:46 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 47C534126F94;
	Mon, 11 May 2026 10:42:45 +0800 (CST)
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
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3 controller
Date: Mon, 11 May 2026 10:42:43 +0800
Message-ID: <20260511024244.981941-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511024244.981941-1-peter.chen@cixtech.com>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEYPR06MB6663:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05974e6c-895f-4f34-c3ec-08deaf06fbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|7416014|82310400026|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	L55i90/HhbveTOPZlfVnAB2odfNdN3j7bO+SR3EFxzmzI9SkYulPVHDDXd7Es+kPMsClwjMgQx6U5Q7c420f0fr+1dbLtTh1hsFsXyIwvbIpuC6xlpaQDBl7By6xgiR72EPiG4KlDe9/1kztYomPJt1/DMgw5HGbBSctX3pLVjgYxYB7jngkRR5BgyfSXrBESv2F8vWoNfodUw+sCF4BycIRfqkfxTAteU99AdWBEamzhTJk2Z8v6myfv6WPm7mCwdvl54p69nXjqrFBSiCjBJilb2ptYd69D9X75+9BYRsYcwqTBB+Rv8gEfY/BSe/1bd7m9cwnRiYKKdOLT6lMEyMA2Ppj3y8SSxUxKs7SA48ygaJ4scDTGL/KvARYqyq/qmye/CcEVDfBddW3vwXXzIXd7sX5aalFCy7o1UVOQpDohBwzDndBTzng/hO+3mmysKKib1NsFsGwcw4wRaVtAFOsTfnU5nisTwNGWJhh2FTaKEeUqiB9kfziVXDAgBHYCbN0aoIWuFg2UDhZmUomxxuyVPRcyZgobi8aHSeSIOnBmzIIuoA9kabyEjarpCSbVswvZJ5xr3Od/skGX00/Sl82mZqIqlE4kHv20cuq9lzrzhmEx+qCtJ2LWI1su0/oInBvDcq9+OhSwA4rrf9HabxNy6TmuMlp60LhRe/oCK3bKByj4WalTMWXWOiINHdO
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(7416014)(82310400026)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dwlGoEmRcscSp02gi0G1Ezr5WomIrhYaPzan5MbC102tNhQnvcNwduoWC7svBEFfzYCyPzt5QPLGKSw3gEa1nSNtW4zFDgHsfdKCA33YrOtsAauc9azSllfou6fYAoAxnS/XQZBXUOcz1jaNCuOfNNWimEThShwsxIlEghdU7UYYVaTUP1U+L9aFhA/AEu84ANJtLUmWZryxa8R1TWkFuZW0vQ7uYGOIPXGuEiTF5ho40yCL0t9symM4WjN3WdNfxBbhGMA7VVDD18Cui64+3G55sEhrDN3a4+1l0hmCNVpWKXmd+t4bmMNkAi+OvltyGrlnla4BtuLiBjNs1POVm1t2ktDdeX9Rze+FqEwngRvR3Imc45V5kft6UkOsdzM7vlv5us6R92JIsDsXE1UlsunLymU8Wte3eFZm8306trApAUIuovcl15dDeyf4zV4r
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:42:46.1196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05974e6c-895f-4f34-c3ec-08deaf06fbea
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6663
X-Rspamd-Queue-Id: A1D94507495
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[cixtech.com];
	TAGGED_FROM(0.00)[bounces-37220-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_SPAM(0.00)[0.066];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@cixtech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a binding for the CIX Sky1 integration of the Cadence USBSSP DRD
controller. The schema documents the glue register window, clocks,
resets, interrupts and S5 system controller phandle.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 .../bindings/usb/cix,sky1-cdns3.yaml          | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml

diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
new file mode 100644
index 000000000000..23d82d8cc9bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cix,sky1-cdns3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 Cadence USB3 Controller
+
+maintainers:
+  - Peter Chen <peter.chen@cixtech.com>
+
+description:
+  The CIX Sky1 USB3 controller is based on the Cadence USBSSP DRD
+  controller. The integration adds glue registers and mode strap controls
+  in the Sky1 S5 system controller.
+
+allOf:
+  - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: cix,sky1-usb3
+      - const: cix,cdns-usb3
+
+  reg:
+    items:
+      - description: OTG controller registers
+      - description: Device controller registers
+      - description: XHCI host controller registers
+      - description: Sky1 USB glue registers
+
+  reg-names:
+    items:
+      - const: otg
+      - const: dev
+      - const: xhci
+      - const: glue
+
+  interrupts:
+    items:
+      - description: XHCI host controller interrupt
+      - description: Device controller interrupt
+      - description: OTG/DRD controller interrupt
+      - description: Wakeup interrupt
+
+  interrupt-names:
+    items:
+      - const: host
+      - const: peripheral
+      - const: otg
+      - const: wakeup
+
+  clocks:
+    items:
+      - description: Start-of-frame clock
+      - description: AXI bus clock
+      - description: Low-power mode clock
+      - description: APB register interface clock
+
+  clock-names:
+    items:
+      - const: sof
+      - const: aclk
+      - const: lpm
+      - const: pclk
+
+  resets:
+    items:
+      - description: APB register reset
+      - description: Controller reset
+
+  reset-names:
+    items:
+      - const: prst
+      - const: rst
+
+  cix,syscon-usb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Sky1 S5 system controller used to program USB mode
+      strap controls.
+
+  dma-coherent: true
+
+  maximum-speed:
+    enum: [super-speed-plus, super-speed, high-speed, full-speed]
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      anyOf:
+        - const: cdns3,usb2-phy
+        - const: cdns3,usb3-phy
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - cix,syscon-usb
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@91d0000 {
+            compatible = "cix,sky1-usb3", "cix,cdns-usb3";
+            reg = <0x00 0x91d0000 0x00 0x4000>,
+                  <0x00 0x91d4000 0x00 0x4000>,
+                  <0x00 0x91d8000 0x00 0x8000>,
+                  <0x00 0x91c0314 0x00 0x4>;
+            reg-names = "otg", "dev", "xhci", "glue";
+            interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "host", "peripheral", "otg", "wakeup";
+            clocks = <&scmi_clk CLK_TREE_USB3A_H0_CLK_SOF>,
+                     <&scmi_clk CLK_TREE_USB3A_0_AXI_GATE>,
+                     <&scmi_clk CLK_TREE_USB3A_H0_CLK_LPM>,
+                     <&scmi_clk CLK_TREE_USB3A_0_APB_GATE>;
+            clock-names = "sof", "aclk", "lpm", "pclk";
+            resets = <&s5_syscon SKY1_USBC_SS2_PRST_N>,
+                     <&s5_syscon SKY1_USBC_SS2_RST_N>;
+            reset-names = "prst", "rst";
+            cix,syscon-usb = <&s5_syscon>;
+            dma-coherent;
+            maximum-speed = "super-speed-plus";
+            dr_mode = "otg";
+        };
+    };
-- 
2.50.1


