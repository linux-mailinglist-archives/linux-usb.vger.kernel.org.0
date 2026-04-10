Return-Path: <linux-usb+bounces-36135-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vItlLdPj2GlajggAu9opvQ
	(envelope-from <linux-usb+bounces-36135-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:49:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE313D65B8
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 13:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFA0C302FE8B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 11:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE803BAD8F;
	Fri, 10 Apr 2026 11:40:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4A18A93F;
	Fri, 10 Apr 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821237; cv=fail; b=kwaV07MaecfzLMMs6T/qCmYSN33iqQ9Y/Z3sx4OmBGcnGTzJS7Yq3emEyQIS9u4gBewGe3QhMJklKffJrVdkhY6VI7H+YKmdMKcb8P0l8GEy6wAbeSPyaXXTj4oyomzZcx/aoxkAJBYNxK8X6pfGHNBQ7w9whikFuPWuNaopQ0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821237; c=relaxed/simple;
	bh=f4Echlr4A4ZYBEvsWjoH/7Tm2tUBKBgFHxxyGdYe0h0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YHmeQOxB5CmkrqO7n9tlxws4kzHGSBGeZWGOBKHQmdoYCswJtSJgksIMbhYYv+ijXUgBK9Yeb5CVLDYmzQBjoQtuk7MGf+uRdkg+L/mfyBFcMYUWjRH/l6b8gfBUr4w4XIdjjDLEI2uV3CwV1MczYze4D84DG+F6ZPFB45PeqKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/zEaU34JuNCCKvMDhn5NUJl690URbXbr3pg7dSdJ+i9NIUvhP69xXZ9oHN3btZ6kK9kVHxEGxrGSefB1mplBADCsTOvrZiX063hWaE8LC5Zg5ggsFhmhDt4dnv6ImDaG2bwJ8SR6bYyNg4/DXOYOuyIMNeUhy2HsdlJEZeSIlsFnNbbmyOiJehJtNH350IVoBlyynkYemYg7tWoOSdZgZSRhJoixfVUj50K4U+Z300Nw53GiC5DMdog1yQEHeJEdbwjU0Q7qHGlFzdVko+gkqzcGOTpk089AF89hoLBh+844GEmERamxU4AznBOjoT/Gjkuj+24prmb4uZ/pk8Zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExEyxRXTyRZ4u3QwhQiNsa9bpCCYnZB/NsY8lDZaXzo=;
 b=IGQx8E0pNB3yRJaff2WNEYRs+VNNIzycioWrbgshMvI9tZQItW0AvQPS6HV4kx9GF5rkPDX7TTQBoe6xohugvLXjepWJxfAXWpnrUY6C0wuKIv1A7cffQ33DsZltRZRwiyX2t7bF8d4iE4Hf4/S55e2DJZpDHoZTAJQ3WupANIYcgyS9tOsGfY37mG2mthBz1Jt7V055V7d4/tAicdL7WbO9n69q+veOFwosUHaMCNK32PXgfxQNBygjWmEZVfIHhU7GWdGRuMpjR8ariJvHzdZwcwEWAgTERTHmpIHeTK0DCIGENTZsIH3sO9J0nRrqJUQrOno22EEm8dIMuC4A2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0749.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:27::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 10 Apr
 2026 11:25:09 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Fri, 10 Apr 2026 11:25:09 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: dwc3: add support for StarFive JHB100
Date: Fri, 10 Apr 2026 19:24:59 +0800
Message-Id: <20260410112500.90432-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260410112500.90432-1-minda.chen@starfivetech.com>
References: <20260410112500.90432-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0749:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba114ab-3a52-4fd0-91e3-08de96f3d2bf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 /H9FES4jTD+8cA7HgfMo8FgOZjBWnrwB+jBCVTAno4g+JKVUSTaIyjADs3X/5TaxD7l1CjZSedIEC5kNH6x34l3fK/0yoYSNZhUXdDd23fSNNXSJU5KQoybWp6Y5WdM3aFlo9lPslhdDJzQ8is39T6lktTrGgQY8QAg76dIlBnuOH/vYcTXwCh0li/kHJY96z83Xj8PNORc1zmbnjXbYGtigerahZDUD/1s3dHYR7DykkrP0kPXWW+o1YS/UaYPzDAFgjVhAXIGJwuUeO5QZNKSG84qNBhh65yYHcXA+fAwjgiBB3Uv8gJ0os1uJR4ak4zuwv12MwFv1/4TlCN4B878q7BrbrImRsyp0ininxSuy/Pl3JSlAVDmWiOG7BoGQBae1DR0ayufUUPFp/mDg1os7ofobyuOb0iqdGenqkYOFpGqyRx9xhlQzLe1LT/iu13YPZnO2f7NfZPRl15gQySYVHnObMra6iyyzx8WStDkX9NF8P3hza+Mlp6gLOo550qCM6g0XAR3VmWsVeBES4xvzzNTwk3JwnHZEUZhv011IVCiQ9gR7BnOx7e+1LFhp0ct2dEX/CAn7WRGWxvcd7yxWLLOy9473QBsQNzaJRws=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2KtQXfxqLmD5EF1lc1kMZ46pqwDjMrm6i4cQ7KSqjyUw5BMy1lCsdUrTPt5h?=
 =?us-ascii?Q?0HIeG+lzQjiMZ5LgdVccDMSd1M6zflC/LUJcpn4FcPh1e285pPFFhoOzifwJ?=
 =?us-ascii?Q?ZpbCFx5BSXicD9s/yH9T13zTroF0LXyyEXbV02h36tZsSheFKQxepgVbhO0Y?=
 =?us-ascii?Q?UtS/Eircnt3X0/gYDYi8X/fjtm9Mbqa4cUsSvmK/MTvdMkJRkT4FtHn27Efk?=
 =?us-ascii?Q?r73VpCA5PTRH92NMas5P0A9ofd1HOlc51sqqKeBeTZaK0Uszn1vUP701AdW0?=
 =?us-ascii?Q?EwkcxLW9oilvT4DIzDFgZ4HexfEMtwEgFo4jSnfv9wOacBgfW+lTOkvCXPJ/?=
 =?us-ascii?Q?hUQFx2GGgJeUQC8i2poeBI0BBkp9KVwVdOHfKAtIMpPKhhtRLkID3hQiMXYK?=
 =?us-ascii?Q?fmDPR+IZ6ZNp5RnLA7uW8+JlsiFQt1AOB1ecfNJr0YEp6D27qvg42GTvxnv6?=
 =?us-ascii?Q?U7FPzreg6hRoSI8IyfnipUP4G/75MXCzdcNwtTsnxefhsTe69bwKSUL8RlgD?=
 =?us-ascii?Q?zKUdicfoHKTwqywSIpHURtJRBrWKURawooD2WR5Qs8SFCCWRUfa99f5n9FuK?=
 =?us-ascii?Q?l93L6atjMGO+vwWrPFWeT1+0AHoUeEPUV3ATVTlYoZLo3tE90I4iVOXKRfn9?=
 =?us-ascii?Q?oqda5kFKSSL674KbNcHDw8+gRJB/2T9CYIDPzXC6uXkqIBeefaZNoo1vZS6Z?=
 =?us-ascii?Q?rwpfU25zj6ssGJJ7Sb9pzb95L71lRzz7OhXfxFi7TqvcgfB0PiTaReX+62of?=
 =?us-ascii?Q?oyjya2s8U+bz2NlWX4YtWsFt0SJY0qpmNo2XUvRdOKfMAicWlsV9x+RdAKih?=
 =?us-ascii?Q?sR2n58V745EQgE8aNqbyLqVx27aX0qxLq1d8wtnI19NUUyWrXTlfKOEtMJRb?=
 =?us-ascii?Q?jvYw+RKZCm2rni+/6GCIq5MnAtrEiGI5A4PVIMuQA9RExBtM4Rv/Q0PVzPjC?=
 =?us-ascii?Q?7Dcj/cAuHHeMWIZmXvVUnyDxXVA8uOUYCIaQpYbGnNtj0kUxrjS+3X9zUPSW?=
 =?us-ascii?Q?wNsLZd08uTUQlHKioVf5n4INTSG0tj96KZ70GME01d7j3qoNnFHWMmCIigh8?=
 =?us-ascii?Q?kUhxR+HiCjPRahriiOaKnJZg/N+sy0zsskSNKMxI3gRO6IHLtWFGGws/sBd7?=
 =?us-ascii?Q?qLtNALh07HNezD/WivBepOtZWQ0vEcxphSZxmnA6wbLiVHcUUPUW7Ig0D24B?=
 =?us-ascii?Q?y9dxK2yEaB7GkFQuL2nnO7ABgu/tE5XsE5NGfb5hiFPLKq+jZhrZIPuSDkDX?=
 =?us-ascii?Q?JxJyCr9bONZx4ThwukiogEMrryfhhBOiNLA+S0ww35LqueuhcDAc2MS3E9sk?=
 =?us-ascii?Q?aOUeNjW00TuT3zrgsYtdI5sNxa3ryLAHHVYD9zVoPU7pudo8J6jVABxk8ica?=
 =?us-ascii?Q?RKBYgh3kiSm4HpuIyePez0ZxFw4IhroW0NdgvY910gTHKNdHef4pubyYkiXx?=
 =?us-ascii?Q?xQ8kw3U8kHJOueev21D6pVdGRJ1Lg6GwSdF/WLQOCESLW7FuIYjo+iwfAVpJ?=
 =?us-ascii?Q?gRzSwd0atcvHF/xoajT+tca8szHYw5b638C2+o5pcfvnvEtdUGsIwAns2gC1?=
 =?us-ascii?Q?Td13urNKLiFgmDsfREGzSSmZBuBmBD3xF5U79qDYDlp0e2d20jWje7CJGpb8?=
 =?us-ascii?Q?CzwHk18J7G66TOqNaBnxLj5htHZH9Td39aQXEPBxkqjwWPZFSREJ+dWpbuZQ?=
 =?us-ascii?Q?gsVb0oRysRi5mGd9mftUXBYF+lYYgCAjXkIIMzf3fRJN789cqhPgCLwb6lbP?=
 =?us-ascii?Q?43o45LyfQDjso7quDvWeKCaNU9sVVl4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba114ab-3a52-4fd0-91e3-08de96f3d2bf
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 11:25:09.1234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01cQuw/hc9FEnt5CunmEYkckuns0IqSWD25gbIM0Tg6OUZ4P4kfoVeeGSDNTqzppa0pDaWz4q+ieFRsmV83ueG7fsHVWLg4Xp+E5A0Mpuow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0749
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36135-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,0.180.13.192:email,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Queue-Id: 1AE313D65B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the USB 2.0 Dual-Role Device (DRD) controller embedded
in the StarFive JHB100 SoC. The controller is based on the Synopsys
DesignWare Core USB 3 (DWC3) IP.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 64 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
new file mode 100644
index 000000000000..fbabe99e9d5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/starfive,jhb100-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 DWC3 USB SoC Controller
+
+maintainers:
+  - Minda Chen <minda.chen@starfivetech.com>
+
+description:
+  The USB DRD controller on JHB100 BMC SoC.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: starfive,jhb100-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: USB main enable clk
+      - description: DWC3 bus early clock
+      - description: DWC3 ref clock
+
+  clock-names:
+    items:
+      - const: main
+      - const: bus_early
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@11800000 {
+        compatible = "starfive,jhb100-dwc3";
+        reg = <0x11800000 0x10000>;
+        clocks = <&usbcrg 9>,
+                 <&usbcrg 5>,
+                 <&usbcrg 6>;
+        clock-names = "main", "bus_early", "ref";
+        resets = <&usbcrg 4>;
+        interrupts = <105>;
+        dr_mode = "host";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 32bd94a0b94c..2f3475e0b678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25252,10 +25252,11 @@ F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 F:	drivers/reset/starfive/reset-starfive-jh71*
 F:	include/dt-bindings/reset/starfive?jh71*.h
 
-STARFIVE JH71X0 USB DRIVERS
+STARFIVE USB DRIVERS
 M:	Minda Chen <minda.chen@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
+F:	Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
 F:	drivers/usb/cdns3/cdns3-starfive.c
 
 STARFIVE JH71XX PMU CONTROLLER DRIVER
-- 
2.17.1


