Return-Path: <linux-usb+bounces-13122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC099488C5
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 07:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 465971F23B2F
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 05:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BD51BB6A9;
	Tue,  6 Aug 2024 05:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="le9O++9h"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BCC29A1;
	Tue,  6 Aug 2024 05:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920782; cv=fail; b=rRGZHDThHAyEtAA8bXGc6si79eisxC4HVXwDg50RwK9h7WKPDdGwagC9zGGabtJi7G090+scVEekBNronuRylIdWQNOHbXLKx4tX2pw00wu+oWXsFg0SGfOyEsAHgIXmck71TYQcv7F9iOUFQ/V87epMv4UhdL6hyhSFYGH/XYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920782; c=relaxed/simple;
	bh=gPEwdE8dZvDXCIUUUQ9yC7PY3tEZafzUTem7BUO15fg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NmGy1uNIq15LaN5JO8VYpaqf25GrR+/cVZGu19ZKv/6LChT++vfto5Bampi7hyQs/JDdHDF5cjjiRnBb3XVYFhTZYD3lLVo7m9eSxUNZ1Pypihvd2+HzvXRIpvFpk2oMn9rkR+xJNcSluEDWu6vtnvepLY/YNX6BSDobYGrd+6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=le9O++9h; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdXXFmOCIRJcUUdncoauteTJdbC2I7WvtIF22Xh80P3lG+lCJsL4wagZU1eoIBv3BZRwHmsWnZs+s1gTV7pUKQK4EivtY4odldmgcYI6PRj5goJZKBHFP1OIvtwlzUcMahLWFsmMUb/XM2T8pmVmk26CKgjzVwLau02w8P7ySQqBztoNHeFbLIUzUnnoN2QyJsjggYhpYF4PtX/4RKsLzSI1bXBdcCUIvAEco4ojN7/3n1h51YNc3LLyHkECRmxjJkKgvW48gLcR1/b5Q6xEyLsEXq7gHMQtvLni8QF89mkn9GvQDyW+uISROaZgn7MyzlsIIH5uwUm9+8bpfgUZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/dPPKQWErtJ5eP+42tTIwEytUkrB53Y/g84VB8dN/8=;
 b=b9GVuN6U0saTg+DnO5n7kovGduVxoYlHwhQGgR5/0GwmwZGpchDsz2jo/rKQHZcD+2dmyRP4zpFyErhN2Z0Z6bFcEboZwY1LFFBsjI9bWfzv/zZ6yie1OupdmHkVDMU+i0AwiUbJQ2qJeIvnjKQkbtJnpx1DE+VjaaHLNZxZihCK+DYA5i0gUC0WSDJoDoxLdEj9aH9I4YluL1n+vsofcdi0RtKolXivVVccqHbQabtvZCc9B4+6y4Sr6tZEQwBTTpadDGWoIIz/HxTyBntSAGtkn/blz1wKBB49u8b+hnMIXPkXHndZFfBmZTjXS/WjUzRXo1JZb7gDQYkj5kLlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/dPPKQWErtJ5eP+42tTIwEytUkrB53Y/g84VB8dN/8=;
 b=le9O++9h1iwLyh7t8yTOpnweUDtAX317h220wymLd2KJ5UNjSZWgM+VpSri62poIc4b2Y009yAc2WuShIbe/F6leQLzVK7c9WfqpqIVczAmNgLcw3gnezLwj5iPkGBIjKjWoOWpcp5ozMn6u6QTqj+bfngG8PQTwFGsnI2lEYU6D98qiS1ydW7g2O+Yi6ympm3WHB7iE6tcZ8LqeWtqiVbuxtyiwXHzpaKjvcMLnz3c6NvNlC1rW4lAd8l8joWrsHp9GgyabfdCupu7NsaOSA0g9B0OrRH4Ldj3vcG4VZzsje62mSHO2vHpOGHpMwKpY7lANMJf7J1bDwJHK6u/JUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 05:06:17 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 05:06:16 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy: imx8mq-usb: add compatible "fsl,imx95-usb-phy"
Date: Tue,  6 Aug 2024 13:06:35 +0800
Message-Id: <20240806050639.1013152-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f34e5af-feb8-4991-7a86-08dcb5d58059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AuyFf8QnFic4FOA+8+TEQalz9W3E1UfWZuzu+MbCLCNs1fnkeIkpZsUHp4xa?=
 =?us-ascii?Q?dfIFF1TNeOh/o6UiZXYwdKEzgHBa+QCbqGsAcdLdxVNiB0q/RwXYkAMsOGgX?=
 =?us-ascii?Q?cls91u5RqSDxFF1HQkv/+UgMARgGtJnfDpF+g7Y9IZL8wGUIzb5/9l+fyVj0?=
 =?us-ascii?Q?Y0GgU/BOqiCeoekExNUcjPfFilA0d8/pG3Xk0xxSD8jbftGnKYvtTZQYe04A?=
 =?us-ascii?Q?3RfVIGuv7jJ22XMvQk/dVF1yXfpYtSlpAqBbagBNjFKSQtSxnCGpTOY3P5AR?=
 =?us-ascii?Q?bKkatsALTJ7A0RbpkSxLxihz7Tm6W0e0+DT5H3+Ww8x5bj3gFl+AgDxkO/6x?=
 =?us-ascii?Q?JDqDt8YiqP6nlaL/yi7MVU0/hie9YSKlzE53eUs7JBOBg2f4hPe8KMqt+w0w?=
 =?us-ascii?Q?EwUmIYqB+XQSsnJbWE62JQMfUq6TVTGsU75UDcIfum6rBXUNGTdKVfZ7a3Ow?=
 =?us-ascii?Q?vZ3ZYo+gmdEIoRjFIPFAjUh6TxD88Kq8gfEs89KLi3mFIQNlntA1JfI6elot?=
 =?us-ascii?Q?RQk5STU2soBrepBw4EEQokkV0D1hTriY/ZUCPINWraeHU+y/+KbbjVqxid6b?=
 =?us-ascii?Q?BNLs+LlidcNNRJr8Q+yDIILLwkd0e9D0tie/X1TZJFuQ1Abo4/CBboNB2NEJ?=
 =?us-ascii?Q?DY1i7yJHvGY0h+7f6kAyK89WTN1qHyIYZvn3AFh1Zz7aWzhDkn98EOpX11mE?=
 =?us-ascii?Q?crsDdqi3Is7x9LPdJwsu6JLw+4BnCAJf0d+uMHnUqoo+zuTcDqjzTzi2JYft?=
 =?us-ascii?Q?0jhYlN8FJSCSvwtdfvG7iFM6qoR2RFsDztjmxCB2ntIJyFphiWiuxAlLApIr?=
 =?us-ascii?Q?TR0Y6PKiAJ5Tg41qusMMjdfELG/mXYxReeAAIH8F8yz+Hfg9sumLxRflP+7S?=
 =?us-ascii?Q?8X25CqS44cUolekjbYAnqhwugvP1P8KztuZ5ZfK5IH/PbM5KMiSs+l1MwyuE?=
 =?us-ascii?Q?2VtEYP0qd7tvPTRCZTPLUhYkqV4wf8JHq15sXQtL2Ucf7BSvS7P2i1Hise7D?=
 =?us-ascii?Q?bhb5qZnfJH6YiAKDEFX0cesjhg+8bMUofvSByja7Flf1ZJ93kcIwzY5U9gkA?=
 =?us-ascii?Q?1joX30IIMrlTgMPtczploXwZq7e2HbTQX0kziIV7s+V5rboU+vcokUspBIii?=
 =?us-ascii?Q?RfXJF52hctfJWyXi6qgwicdyHkh+yEAmN03SE4Xgtu01JNoCK0hi/F4PzmV1?=
 =?us-ascii?Q?Zbs17q9jxQXHQC4H8BSEsF5cKeR6sdWjIRLrygBSbtG5Cc+DANsR1L4vy0U0?=
 =?us-ascii?Q?0VMf69gWpt9QteIp39O1/YFwV0t5BEUDOjdEnKtGvKoOGbDi1LYMq/pLtIba?=
 =?us-ascii?Q?YkvMxwJSCGWKQfbJjo+vx5yqo0VIGAoTP1e9j6Y6AgDJogUINItYUuPpJ/zX?=
 =?us-ascii?Q?eXIfYg2SYbNMrqoOIyah0PG2PiLzgU53aeioJZ3oOWlwsmXx5nUGzUSQErR1?=
 =?us-ascii?Q?zBxiQmfaR+c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vEIdAEeO9GcuUbbofES8KC+TIpfPpQFU8ZsVEwCGtYFyVrmJvr8nJkVHhMjs?=
 =?us-ascii?Q?XJ5rI1CIcDbQeRn7ZVpA5bXaXXHoOtA8bM1ulZF0Al3g41Bk9JznS1VGwGew?=
 =?us-ascii?Q?VoGePL+dciWCzuadKz280nUoHsEDnKYKxpQVMp/k8LJcwm43i2+7MRERCxH2?=
 =?us-ascii?Q?nWHiDi67zr4K8lnvuLJjY9SnRR82FF1/Zru7wtSmclEdPcB8b7oln5wDLtBd?=
 =?us-ascii?Q?QuFZ9ZtwK+rR/z577KX5FmJhcfs3x+UpG6yh3Fu8bBrY0r7CblV2zcCnKDqC?=
 =?us-ascii?Q?tMHw4j6UkkQgYx+6DgHAh0DfpdJUSFjmmcwd0fER85u35M4E6kwfHrKBuXP1?=
 =?us-ascii?Q?cnNAsqN5qjOs83IvZx+E6wf9j7R0kbdiBAQutHYVgWEOhmqbzwGCNisbq2gf?=
 =?us-ascii?Q?mQDpRqO6C812Rin0ztAPysN3cKxaTazb1yh5wjkTQX3tYaLcmTtsPr4AjqhH?=
 =?us-ascii?Q?P/5RXg0czBtBf59Yin+V2C2NNL/kIXOOq8VxV381qek5FfoRpsbUAmC3NDJU?=
 =?us-ascii?Q?hPXW99Yw/Zw1Y8UTJS+VkMtZKuK5xMcdZ7pcyreAbwlLl+TNTcOzr5hfdvAA?=
 =?us-ascii?Q?vf3U8LX7zpA8iCjpEFwryuqWVotl8+mXJypYqu2x7LK0KHMs87XO1LCanAtD?=
 =?us-ascii?Q?VxoxS+xl2wHVzH6G2jdUM52MtFGreqnb4yUeDsAgH8JDI52od623ZZoq1AIi?=
 =?us-ascii?Q?ijzkCfEuDubMxCK4PPbV/DKmlTiNIgKKdIjgapqDeZE+aQ/T74ayzOxne4aT?=
 =?us-ascii?Q?RDjvg0EEVtFNaqhUrztr39iTEY32F6y/zdg+Ec7Ld95bvVMdVNfXMFjO9i3N?=
 =?us-ascii?Q?JxMHkNau9Op9gtijGVYoMSQqpEaF9Mn9HoNKP1BuoyUyntskVuRvNtDUcC57?=
 =?us-ascii?Q?bRm7j78WFW6vF/DtZzRSI8yBJ1st7KSGRufRe9Yeq6aQz9zsWmsMfi8Qhr4x?=
 =?us-ascii?Q?BxzE77dWZV2yyIBnBbpvAt+Lq/rQ4SrBwCeNJHoF7EZ5mNwJOsgkTEf5tAn+?=
 =?us-ascii?Q?BMi9FKEQKpebQXVisli4fkJHNmYcU0sBWuvU8Ks727S5VL78orxjK+StIPgH?=
 =?us-ascii?Q?VqbHvxi/ddZO3d37iQI7ae3zq2bHlukHsKHwd305kkfSqw5A271u3KgCt0ln?=
 =?us-ascii?Q?/z1TtmkWEZaFZO/cr0r/ojoHw4DL5ZClFPAwGtfqFz65aVErprxddEVly/Fj?=
 =?us-ascii?Q?i0M7Fg5Jy7+wqiElUAR4v5F29dTyIAde1UQ7BogrSB7khNChXbM2qKHWbi78?=
 =?us-ascii?Q?pK7PlFe9VFXADHTzDwcnGaP1RvVWbT6tVMXer4TeJFnWdNMfwPDJNEfzF2a3?=
 =?us-ascii?Q?WOiYifQljry0XxSl158FQ73o6f0nBDkwJnrClFf4s6t5u7IFTv3x03H8xWiy?=
 =?us-ascii?Q?cKgysSK7uaQGsp7+pdqFDc9ROpvjKI79kFkBO9vc6Go/xfQBOwCwlpXgD28z?=
 =?us-ascii?Q?oBxi1qbX2m3dggvV0DBkaAgSFsuddOlBCroRHZyz/epCsggl/jS3EFWxdW5V?=
 =?us-ascii?Q?DqJQgcFR4Y1m19a+Pel5e6R6EsjR7KaYwMG2GTzzYfszX/ybTQvwFqM5jn2T?=
 =?us-ascii?Q?HI6LO0qxZ9rAsT5SacFwLUncH3QkEs+ZjIjniTU7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f34e5af-feb8-4991-7a86-08dcb5d58059
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 05:06:16.8707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MC93k9JQ9IwRgru0gO3GI679woK/cMcAefFMmyXV5t+vfFq2mOH5ljJzKPzg/+a3Yffdl1yWGIpyHD7CBorrjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
block. Since i.MX95 usb phy is able to switch SS lanes, this will also
add orientation-switch and port property to the file.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - replace minItems with description in reg property
 - remove orientation-switch and port
 - refer to usb-switch.yaml
 - use unevaluatedProperties
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 42 ++++++++++++++++---
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index dc3a3f709fea..6d6d211883ae 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -11,12 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-usb-phy
-      - fsl,imx8mp-usb-phy
+    oneOf:
+      - enum:
+          - fsl,imx8mq-usb-phy
+          - fsl,imx8mp-usb-phy
+      - items:
+          - const: fsl,imx95-usb-phy
+          - const: fsl,imx8mp-usb-phy
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   "#phy-cells":
     const: 0
@@ -89,7 +94,34 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      properties:
+        reg:
+          items:
+            - description: USB PHY Control range
+            - description: USB PHY TCA Block range
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


