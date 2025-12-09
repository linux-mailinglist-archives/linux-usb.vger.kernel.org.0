Return-Path: <linux-usb+bounces-31308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3ACAF086
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 07:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B53730AEE9F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 06:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E97632143D;
	Tue,  9 Dec 2025 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="iRhNnuaU"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4EC320A38;
	Tue,  9 Dec 2025 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261677; cv=fail; b=eDZy3NbxdRxdXQvmNvLYmWYFAsqyJXnEkH88CKbAlOL9rGJrTLT0DF/0OmPuUz74/P+abXO6ISDXg/absX+mf2w1tqLQTbuupQUhPuOEFcm/dvSqfvQaJyBrH5H7HblCYh1UUbasAfeYMbtCMt3AyMNhrlsK0K1QBlpWgTLDTNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261677; c=relaxed/simple;
	bh=i3jiGeIy4YBA4XIH3HTG1CRqX6axK8LjLnBhoGfNw5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5ILup4+tPPmG0aHEaZYH/WbPV9SPbV3DnDtjwp3yUO84b55Xopg5pRED7Nrg7QVe/P421c1cIdBr3oUf0lvlZc3IEpEXprA6K8vefH8zy/9z4Tyh0RWV4uhJnnYsq1G/us0k0AJaAcXNYXpdweiLk3MhVRBeMfL1oVEvib+2EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=iRhNnuaU; arc=fail smtp.client-ip=52.101.53.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fkg8C+iuG9YP6EUK4sLniptgtcYcZYtyhaQrnSw6PS+VxgxBN/vRCUm6/bQiwdBLrj0Z3uGtPuTLwOhwr7XOQaMDfJsTQKEbGxbS3B6o6kzZZxaZvubP8bs0ill+1Fk97JTKpJZSILbvY+CT2IK38BP3m9HR/qfxhuc8NrwJF1A0iiw1lNM+fEPBZzxIUwtSR3YTV8sqws+usZvILj07wzAenK8uI9WXg8ZM5Ggqc1sS4KBc3ZbEN6U0bHnAVrlaRjUZFaNSgRe12XsLH5l6NhBLCSnOrbLCOqn2tg7Y5JHQUfCSE5rIHMrIM1e/ZrPPC++2nR3OqwPlcFHQiwr50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SntfH3u65cPEmFkivHwDlabdzbJyMJRf4OMbgNkqw40=;
 b=gfV122m2fXxJhs09i3v2To4U2tfEAOTIjVJ7AMA0GYIhkapjBUdDnbCo7l8Ks4aKgOTuoQUU6tWP9W8oOPsv06AIlCPjpwcqin86DbBjbcxWX3uJjJqYDCpaUhR7vNWyLwjBGc8vI1enwtNg9TqQ9XQNFXPLkotmygWSOWVdoy9wdMQFdxpFdg1RXOqCybgeVmqkNFr6VNLMFpf6MMU5PfO+TMNHbLatxhkdijUavgPMR4l2IXiEFejxJc3c/nG6KQhlxrOiSWOECeEgb4vNM5BK+7IeOOcRdYJVgPo05w8m1JQGtj4DsS+MxKn9dXrn+ekvYRV9cBzMWRxi3Gmpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SntfH3u65cPEmFkivHwDlabdzbJyMJRf4OMbgNkqw40=;
 b=iRhNnuaU8giCSQhguzxDlgzwLmgsNNpPlXEXxph4BOpCOKjZg13Lh+4mSdmTQMBgEDIqjfuma0DGSLgmsZ47V1vqtODcwi6kGf2/BQrsSBExGzzvUPBQy89QucBq1hDQs5LG98SPZER/aVPo7eVvvT2cuWcVxoF7k7lQYrSytcVxOUt2ssSOr3rheVsK+M3AW76fPrZthcySrjAq6xTvEN8Y8PILtV2aJqSS0zP1BBwh8DWFmyydx3FPchPp3xPdEGjAfe4V57ZeqC8KpkVQp1wM4OpFS0orQGKfH2dc9qsaCYAmcqSwJKgaH2+Xq4Q78zZS/6rChmRwowyROFBRlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH3PR03MB7314.namprd03.prod.outlook.com (2603:10b6:610:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 06:27:53 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 06:27:53 +0000
From: adrianhoyin.ng@altera.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Thinh.Nguyen@synopsys.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 1/4] dt-bindings: usb: dwc3: Add support for Altera Agilex5 DWC3
Date: Tue,  9 Dec 2025 14:25:08 +0800
Message-ID: <4c8d2a1fa93e38afe64ce71bf2709e76352eb630.1765249127.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1765249127.git.adrianhoyin.ng@altera.com>
References: <cover.1765249127.git.adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU0P306CA0008.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:17::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH3PR03MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d70085-a1dc-4219-7169-08de36ec1575
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AzHyWzx0YnpNfZSSJdj1Mh/wp5WieuG5Lrg/N1TIREOJpF86+woIvFirTH1C?=
 =?us-ascii?Q?hsWIHL1MtE/utMS8KlLXbI97jAsCYgziRByjXN30Q3qCylOOdOQZfZlfgiCt?=
 =?us-ascii?Q?OnUl1ke/jJAqd4XlisQMIdRnW//f8xFSaxAXk4Hk105rgjBuOKVSobT8hqse?=
 =?us-ascii?Q?GdhY2N4+1lOfQAihJALJhq9dXlqDykB9UGGDOM4UO/8S4Y/TIL5bGtZfGDwO?=
 =?us-ascii?Q?CYdVyX3ddIGPDb7uEmFhly9sgzL7I/x5EVsjRMgrrtqGFL7CdSfEt/fl6JfC?=
 =?us-ascii?Q?zUGNdp2LQdaDyUu039sTS98mfFzpUCaOjGC6O+QSBs4AXqRFLjr0tIWkAIQ+?=
 =?us-ascii?Q?N5kw710zWj7luk+wGAh2Wz+v4kZ2Eii5cGS2teiPZ/5yEotPl8Dj3E5jiR5c?=
 =?us-ascii?Q?g5S6fK4h1jNK2SyykCZXfgXaEBU5bLO0d0c6iAB3s1GU64VPEq4SyCuI/Csr?=
 =?us-ascii?Q?5S9fypw1ARra8JvXDVcw0LdR4uA7uvrh10FqF3qdNRDFbyzxyRGZQ7qWVWDT?=
 =?us-ascii?Q?67GWzSnIZE2HWm1knRnPrzHQBTPE3pQYJSmSyegFJdcuIaNVQ5A32e8gbsNO?=
 =?us-ascii?Q?BoJ79y8WF5uyBqMegVD2AteL7v+nxMrY4O8umzC9lnOl+3x2DWBtmB8wXg4q?=
 =?us-ascii?Q?OwcYD8Lp+qsy4R1ZNAPxhUajzn2kd6znt1mfapeKymfVJTzNq+O1iYxK50I5?=
 =?us-ascii?Q?QXsHKM6MQ+70N0iOjdSqMAK2jQpW5lFOYBboG9WCtHaoBwFXArifzfGjwIuX?=
 =?us-ascii?Q?Dm2BBgYM1chpCKgYvG0ogpKkVwQn37z9+2RLB2y23Nb9IG8+VHD7TYgqfUVH?=
 =?us-ascii?Q?raaq+rdFDrCNVFaqYg3pmj3XEpl3VTkdJXr1QK/5UAekUfdjE/OJIO33e5A2?=
 =?us-ascii?Q?hbjoHfRa3cuzhpMKEiFOD/5BSoJmCjLOWYaLlS2Yowuloz9JEPljC3EcMJyU?=
 =?us-ascii?Q?evvOXzBlYe9/uWI0hJpJbifFyKsbHCkEmfos4wIPqNuUGwZksYcEAX1Fu666?=
 =?us-ascii?Q?0zJWybTTROh8hQgD13lTgjRd+ICHgKL/TA86Yw57M2z10G+tqDikS1Kdb/jk?=
 =?us-ascii?Q?nlb5/jnbYIVlDBvMYNVWfAbikdX0krbvwUfZzUbFvSCY7AxVX2TUzK1mD91v?=
 =?us-ascii?Q?Auwx5Ahv7GJg2AOJ/LG1rSAapWsgtjZAluArS+i8vuZxprfcPVaXZptrKwt4?=
 =?us-ascii?Q?Xa2OdqwTML0VdMi2ZZ3342/1fo7PuBEjDNKiOVXzs6q2cmSjuyB8ul7FDI0K?=
 =?us-ascii?Q?dTArmYqBwSWvb2YMRd12RkH1Y7flSbVD5sA1vJ0DqgD67puZtJ/NKaHc0NQ7?=
 =?us-ascii?Q?7waW4E5VG75eYkHWLkTxJM9WRo4a3mWVLmn0j2XLL7ar9vBKmMI+2JRmd9K2?=
 =?us-ascii?Q?+CoGAW0BrcMlUhmXeffhV0BAUW4G0q+693lWEsG7eAqVFYdr2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NhxE/e9tiolHKcfMAg7mP2pgKG9r/Ni6PgqL5glEvV4a6wczUKaT2Vk63mWJ?=
 =?us-ascii?Q?WKShBMt+lWtnUWHJrSEagPjsyryQI/1vHlkf/KdUlECU0l+qLy0NK9BfUFk6?=
 =?us-ascii?Q?AhoPxj9TesDcZyxY7HoepE+rOttUL/HqYHtcdaRXGMgz2IUQmck1dppbcFbj?=
 =?us-ascii?Q?8y+n51PJWkVmUBoecl/RwCtjEF8WOiTU1xCVuYQy8dnO253cY6dGjI6g8+rh?=
 =?us-ascii?Q?++3rP73b4r9u7rtfAs6HTdx5Bfv/mkhi3kHwO9osKjnkXgJaYloS75D7XtFb?=
 =?us-ascii?Q?o4MpByYLpjeU+i9bfTKyJ5+04CVu2J5uJtsbTf8GCRQVAAS6sYCIjb1l9K/H?=
 =?us-ascii?Q?vD45RU0D2ZfiWFULzeVFvV7tOv/3ryrEXm26viFzXt5+1eEhTI6PVdd241KN?=
 =?us-ascii?Q?j0WHzgDHwoylBy2FP5RVveSVP+MLn44UzSI3olLHD83VnOskzIgcLX6V/a1f?=
 =?us-ascii?Q?F4cIBjRtTAtqYfCmZfyDUCRiQy2EII73wnOJR8+fdPU8PMXEe7hMavnCzuv/?=
 =?us-ascii?Q?/TeSFbvjoFl6yVdXjY6sr/eaDuq8r3LPW2/Ssi7Mdl56cUubmZk5P/YkWNv+?=
 =?us-ascii?Q?Y/L8MzfPCKtq3lqxGTFq3KS4LxFG1ht2X6TQgp//inN2dzQ/g934xc9CBdrq?=
 =?us-ascii?Q?FjMqTrQ16zo1LPZiYL24YqiAFSQEYkxm5b50AEW+h1cxGeNPTHbfOmIzw3nu?=
 =?us-ascii?Q?9GVKIYsA7QAur38MNvyXMMqQROZ/7N6yea5T/GotTtiQqqbM9nnj0wFGSl7D?=
 =?us-ascii?Q?n/EJ8g83tXnOL5DKzuPJ85ZORp+DNBqxi6fnJ0su7tNSc/BqZTJf0zjtlgpR?=
 =?us-ascii?Q?9+6guFmKUIx+OoWjDoJg3lUCO3KWl2MJn8ltfJQpYMNbEgjQNtFocFWejDdg?=
 =?us-ascii?Q?cvWS68SQ3xT7VK6fjvct3HCKY9XMFjSjutqmtaTDSzAjF6+0MuZpXse8ddxS?=
 =?us-ascii?Q?ddR3QhCtmhcVgZN7aMIpJl+OECkt+uBWpEtcdkhSuuH0fHwGBUklaG7Wr8XC?=
 =?us-ascii?Q?TU3HIRGtvy/NYTVM5oA2ZamV7LdlIQqm+KKijXGKAj5hFdrC2iTB62KGBmHE?=
 =?us-ascii?Q?pnwqHZaKv4YpZqnCOGi+O4JaCiNkbW5JeJry82KbtSOlOQHJkcEPzafi1rEt?=
 =?us-ascii?Q?lpZQZVp/SXdruchdA8mYHkSsymGHXZtiacxJrPL3zK6mhQTAhgS6mJO86ZFh?=
 =?us-ascii?Q?X0eC10WJqX2hI9NbD04hurTmFf42VPgtuCyKAzeKT3gWa283VXpZqOmuiV+2?=
 =?us-ascii?Q?7L8bfiA9PHOY13BV3s3IqJgLexZrP8trVhu6sj/GH2CaAu1HFdEhPqKttX39?=
 =?us-ascii?Q?GpE9Y2rHgytH8fDMv/AXO56WqEzT74IcoE3EnFiQp+fqNXEa12QRRkhxhvWO?=
 =?us-ascii?Q?EExFBFoqg4AzFPpp3TTL0QybBZZmUVSVYuTtcI/N1Petxs0oWSLRv8mjJd0c?=
 =?us-ascii?Q?mjcvyJhz/n1A/OxYpgQgW66K+tHawJzn1u5699l971mt+/IuHXuTCvRzvgep?=
 =?us-ascii?Q?KI/rlE/UZMoecNwHwu1SAyL1L4Dka8sqCtMakDKl9XQbpOUV+NGx5OXDa85h?=
 =?us-ascii?Q?lRgJ1dIp5iX0e4nyP47KKWrs5s1POLEOUplCy8iZZkLtzUlMbtv/ct2SZj3F?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d70085-a1dc-4219-7169-08de36ec1575
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 06:27:53.5815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3I4RFtMqnzDE56xeCdZGQjSJnKQHcIHjHmlpynM+lISxEmLeYxwm9Gk3gytReacuknqJFAoZDMMt3xLmDwhQ0ThmVIc1/xD0CH/1UjH1NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7314

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add device tree binding for the Synopsys DesignWare USB3 (DWC3) controller
on Altera Agilex5 SoC. The binding describes SoC-specific integration
including clock and reset control for the USB subsystem.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 .../bindings/usb/altr,agilex5-dwc3.yaml       | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
new file mode 100644
index 000000000000..d40719e0e49d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/altr,agilex5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera Agilex5 DWC3 USB SoC Controller Wrapper
+
+maintainers:
+  - Adrian Ng <adrianhoyin.ng@altera.com>
+
+description:
+  The Altera Agilex5 SoCFPGA integrates a Synopsys DesignWare USB3 (DWC3)
+  controller that supports host, device and DRD modes. This binding describes
+  SoC integration including clocks, resets, PHY connections, and optional
+  IOMMU support.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: altr,agilex5-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Controller suspend clock
+      - description: Master/Core bus clock
+
+  clock-names:
+    items:
+      - const: suspend_clk
+      - const: bus_clk
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    items:
+      - description: USB2 PHY
+      - description: USB3 PHY
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: DWC3 core reset
+      - description: DWC3 ECC reset
+
+  reset-names:
+    items:
+      - const: dwc3
+      - const: dwc3-ecc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/altr,rst-mgr-s10.h>
+    #include <dt-bindings/clock/intel,agilex5-clkmgr.h>
+
+    usb31: usb@11000000 {
+        compatible = "altr,agilex5-dwc3";
+        reg = <0x11000000 0x100000>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+                 <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>;
+        clock-names = "suspend_clk", "bus_clk";
+        phys = <&usbphy0>, <&usbphy1>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+        reset-names = "dwc3", "dwc3-ecc";
+        iommus = <&smmu 7>;
+        dr_mode = "host";
+    };
-- 
2.49.GIT


