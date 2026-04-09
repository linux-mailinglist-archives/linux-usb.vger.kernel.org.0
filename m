Return-Path: <linux-usb+bounces-36095-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NMHJR1+12m7OwgAu9opvQ
	(envelope-from <linux-usb+bounces-36095-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:23:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B923C921D
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60C663056D11
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 10:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B09E3BBA0B;
	Thu,  9 Apr 2026 10:12:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECD3793BE;
	Thu,  9 Apr 2026 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729571; cv=fail; b=sy01egE/S1Oqz85eZhTgfBZ7UYOMdzHpXKhjWNhsl2uFLU7zE8mrnMn3v3ilpRQTRtCBnBHJJJeh3cEzpb/POWtIldwLx6Et//diRQvEFArU605k9u2jhd/UJdcfQfOyk3BgtEoEzZUeSel517XNaTxAkf6vur1upHaeUisVViQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729571; c=relaxed/simple;
	bh=npMD4H8JyNR33pJ9TsJaoYhbODmP2EjXQW9NLp9eXJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d8iNkL+k/0jjsPy/VQVQUazs6yfrEltSRDWAJxACa1wsJedLoGY/YRP2dkoudXim9kGp+5KaUTQm2Q3AVQy43977MdhkNBjBTi1nZoyytfZeyZ1QLjH0na3FYAoZTkapvBmkBbEsE1qBujhJsRleBm5RwiF4UfiigfVR4cEk0bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAleJtkC1R++QHzZ+Zn3J5iETmFjfiMS6d3fV6TmUTZpfpMjQyuPMTwBYs1y4srHleV3D9MZOU/tWRkGcGPZgeNjCASt9MByKBRkRgdL0giAhgOPFaR7RMR7SFE/03cIqvsxdP+1zp3Rqtmr6UeKhOVcBHo8kH/BTe554VuSj6+aNUxE+r+M+71dS2kJjmXgCiUNQjbOEwntt0RBgN6XaqwTS1IJvqtS/ORjZGJSDRC7apjwvETM+YZui3Gc4+j63nHUsTYYoUptYo/7lxKe2pj/ejUtUxuh4FvMGrRFcvWFU2wSDIuOsXTmsETqtOyYMqCaz4n+pAjwhMnUmXHWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2IH0bsHkDpS9rAzuFxQCxQup8wTRoRBDR8wJ5o6UD4=;
 b=fUO0mGNwlwe6SLn1HMBY+F8kasfS79Y1I/NqQjKDtvXNnJL+5zQm0/ucKdesOV2xdbO2JmAy+ALSQqNFmPgbRX3BUfEoObq/5aFWqwJme/M9UFLhQ9EvpZUEtkLc7I6l3cn2Qno/DznmjhJVD36GtMGt9fJlz/x88ytmam7yowsDH1NTEpvg6HFc7yAnUXq4YWB3JRQcKgQZ2v9IbqQIHYQX5WXBQk00RTZzuKmi2FH8PPKfs4sUnnJ99YBnTtOm01igWr/B2mVuhNSt+ovt2DjPGSrVE3yLM+/pleZhgPGaOc4ZyX3JCRTHmnVKCRBfxIAtlw2kSgC11tgkkFc/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0752.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Thu, 9 Apr
 2026 10:12:36 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Thu, 9 Apr 2026 10:12:35 +0000
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
Subject: [PATCH v1 1/2] dt-bindings: usb: dwc3: add support for StarFive JHB100
Date: Thu,  9 Apr 2026 18:12:26 +0800
Message-Id: <20260409101227.39417-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260409101227.39417-1-minda.chen@starfivetech.com>
References: <20260409101227.39417-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::26) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b26b150-8615-4551-8dc2-08de96208590
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dGSPKUek3Ya8i5IAvX8qPjfqR/nkUuFs0FK4fP59EbxJDqIRYrq5Voz3sWvyTuRM+7LKsToi9rlTzpQJJ2nHZobglk854addWe9YrCHzGk9OkSt0BYHMeiK/G59SMzb6WNMIe+yO0pDz5T+mznAHfqdxHZcyJ6JUpBSJLxOO6mhVlYxkiDtkjqzEayic4ThImLD6+1gzK0MF9+hyz+uqSx52xunbfc9SFviXgdDLonLKvJaCRHgOn0hY3Ffotk1iw9GMYmCsMfodBLETdMjB5E/1bHrNF2oCIKXyevKPmQI16xq3J9b3FZEU7CzcU8boaVYR3Aa/75OkKmu+52U/vOUKWDoSyjaKmY6/pilvPEz80vIvs0Y5luOAcjZjOh6kDCsvd4npSlYxRXpkL5ZmCeoxdW0aTaupLbHx4q9XE/zHyEWYSDe+mQac/MMtlrgP27YSyyDgu2/lJ6+r6FuqdrfLafwQjyUQVsxWrAKvfQc53/tdsf488ke+4Ijsqre5XdxHrF1e+xuwyZiacgD1cWMY0x9sbTQoU8+49uIsFuhK3CyUdOFiUO1WeYSlYjYHbG2l80T5m/flhXcXNoxmMjF641ZjbdmcXOcMN821Wsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MS0SgNylxQ82mA1LcB4TVhImmq7r50kMcvBKrjS67/EOUpeHDjbdjUinfFwo?=
 =?us-ascii?Q?tbmCssEIste5nN8942jW07Q11M1yEM1wYzP3hytazBIyY++PZYkEeCm+YmoK?=
 =?us-ascii?Q?Ps0bdYC+B6w1H3lprD7+7YIuy9w6bY79j4mLFYzCIQ13Qfy2KUJ2OomCZZb1?=
 =?us-ascii?Q?Q6fjYn6YqEi9QQWtlueKZo9bgjkc0iAffryDNGtFHMSLVVk7IAz36AflQmjm?=
 =?us-ascii?Q?v+fO65rqj/tvEaAJ2OiSXAOzRcy0yENWW950R8nFQtiaWx1Ql66CSysnhcO3?=
 =?us-ascii?Q?zWlM13se+Q0zi5YsffyN2lIkqESgZNGaRUd/Lyd8mkCUThUl+9bhd8gtNrPC?=
 =?us-ascii?Q?oOV6ornFdcAXwHPlCkBozlyD5XqwBwoj71X1IV5+otB81+AjA6TOfm+TPu4C?=
 =?us-ascii?Q?ugsN7mU2RxkYCclZJ7WZhU+NQUbUr5RVcV1dIYIpq3gXdtNxpCUObotupxIs?=
 =?us-ascii?Q?3j4OQ64+7U6OqOa7SK/1GUFI2OFS3JFuq69We1or0yt0pdj5z42y9oYRUrMN?=
 =?us-ascii?Q?F0S64I5pBt05QlIN656C9uedrQ53YhgpZtNxNe66Pdd15JhqJe5p/B2x5Lbf?=
 =?us-ascii?Q?hTbuxxyVeolZ3+6AiJNFvn84qSAJ9fncpzC3J7SrKVEXBtG+9ermmcLIot3i?=
 =?us-ascii?Q?X8zCVd49uU9GMgjeOWwvuY7pf19AAxDv/eq5TaFiPqRQnSEuqxsKXP434htN?=
 =?us-ascii?Q?4GY8/Zdue/A/GuM7+mDWzAHwj2d5JT32iXzgvgCC8ciCt8OAjbEdAZnpTLeI?=
 =?us-ascii?Q?MeX9A3ms2MwDvb63MpH9K/Tui5JKIv8xEn9rGLRWsbYS5VkOBudewgE1py02?=
 =?us-ascii?Q?zvZ83OnEe74ROPljw4byLUR61xCMY8R9xBX4BttU5tO7NUhpBoYPFyoUGK0k?=
 =?us-ascii?Q?pJ6DQW7Onkdj891Ktd2LS8H0/LjF9wq7e5ugs4tffwoBDdb4iaEByDL2tnCP?=
 =?us-ascii?Q?dXjtILmBkqB+pi/TbdKyi1UDakENLxwrvVsYvDRajris5WWzeKiPCsXeB7ja?=
 =?us-ascii?Q?nyZMXgAd54a/CtKM5j2Xk6Cw3vqIMvdA6ySUVKxRQFRHMFXsVIxO51nuYNQU?=
 =?us-ascii?Q?/x73kibssSfzHMsK0torHLCaGYMIc0m/1Tk34rAPatuYu5SZqMI2/NBtRf9y?=
 =?us-ascii?Q?28txUwW2h8LeJR1rRISETKpohskoussT0keoKMQ50eCQO8uFSs7xdEllNOgW?=
 =?us-ascii?Q?oVqcq69XnXSCMPVatHPclxx4jt45r/TzWTpgAv83/45eRgMm2rHeE4t26sji?=
 =?us-ascii?Q?PIhj+j47/gTFJaUGJ9OtO5ww2C05sJ+oSwgEedkEvdS1cPBEiP8s9TvTF1Lu?=
 =?us-ascii?Q?Bg9u11jXKd4Fns0n6k5V6i2shuBP3zUf1P9PYIh9uRUpEbOgoJogikGDbXpE?=
 =?us-ascii?Q?k8jlT+SKRxWkTZ4yMjWohJ1iTFqzcsREez4DuTTet3aTI/PBsms38ja/NklB?=
 =?us-ascii?Q?/bMFQjxY8eA6+DWZG0ofBIIftXworZEQjzcgUXwTm6V2Gz/7pb5gY0JHOOjM?=
 =?us-ascii?Q?7wv06T266IqvpLdUh/kI+8hpIjkx1GQQ4J6kE16CUtpQY4qDJTjf6RU8nrnM?=
 =?us-ascii?Q?HVMTs+ctqCUmq6cb/FQvmC0Q8b3WtOZEhq/Cb+D4Uc/TDRPyebAOiN8Fz62N?=
 =?us-ascii?Q?SR8vUSJgyWV47+Fda19BJl7WsLKeW/e+OReAKdlhcasUK8DKqqK6G0RXEaBt?=
 =?us-ascii?Q?WLT/u77W4PzlgcvTR00aQfcNBclHQzLT9Pom9RoTp/6bd0vOldFL8ulDbbrr?=
 =?us-ascii?Q?ipnrm8CA+UmA9Drf1LXGkPGX4ipYk5s=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b26b150-8615-4551-8dc2-08de96208590
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:12:35.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncjzFd+iA7EP31RVBEmz5sUDODXEd78DHfsB5vyLhi6dU/FOXICuTv82QuWdxyNU0wAWM+KYesCZjfLhI9YMd72RjwLJiwMEhJEI6jLwE+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0752
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_PROHIBIT(0.00)[0.180.13.192:email];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36095-lists,linux-usb=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.167];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44B923C921D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the USB 2.0 Dual-Role Device (DRD) controller embedded
in the StarFive JHB100 SoC. The controller is based on the Synopsys
DesignWare Core USB 3 (DWC3) IP.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
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


