Return-Path: <linux-usb+bounces-21672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE817A5D822
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9056B189C6A0
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 08:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C6623534D;
	Wed, 12 Mar 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oHOO20dq"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0913233D92;
	Wed, 12 Mar 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768057; cv=fail; b=kn1TRaazZ0PzMnugz8cEnNqo6QoEyHvrZtce9xFWXcsWQOnlZBCEsdz5cTKMfy9wP+b/3yT8MpYCsbqK/MjSrvrLtx6bvBan6FB7bWPJW7G97rpuoS/leCtR84GTR9kr8x7j7uAHY+AsVvhgCmKun06aVj5fRXOqRzytZ+bRnEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768057; c=relaxed/simple;
	bh=qG9kaa20GNgKSp4Eerh5CY8UF8jt+IvrkyS/Zy6ZRGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZIbCn30zNo0bc3MUzv7g0VR009PMlbAa+T/b/nQG/RKx1r27541ctthaz6Rs7WR4aVwHpfy5eiMC6DUXmSHcDASyIyBjLMESNVna/aNh9rA/RlFgzKz1BolLFjLJeMm/V8FlxEokohZgjT+gLPH0+AZntuBMVgzp/44ZRvQp8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oHOO20dq; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRrHKwNVDCCuA26CcrvDTRfy6GxEdyeIDu2DQPOOxwy/QOXlSZdBk3eHhG3u4Ycu5NIwtAVO8x4lmmE01D5J3N8oBaWsX0I6riSTL1HhFTW3qQf5ud22dD+0/rsaJqSgi5nhdoZrZ30RvN1AyN/FXCpZDH+vIxB1cG24/2Z0O6KLuWbAIu4p+8FFUVm676qRw6Eb6+Y+kx7kS7Era6fF0ocsY13An3Hkn7CLoSl5A9xVwzSHbd+KJfRqy/lcBWdompQoBB2wmbYGms9DXsqPGGAZwdMlaUbDIvYjwKT+eF2mv51+4TaFMBtpgpTD5iOASgyI8Ks3KavuJbj/7EC9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyxnITEL9jnSsYPyGbbysmctNyRz2aklx4gCUxoJCVw=;
 b=TQaHJL/btuz8YidD13P6X1232qCkEkKuzwPflMjd/PaERd+5hQi2CfmQeZbkZ+Jtq9PAxBcHODTGvhOfyHjka06ZLs7WiK1S8LtdC+sUXkkbW0T0JtORRyM/JTGyAecqO4jiMwPTHuoE2ZM3xESEKfYU3u5wOI8SXaFYg52xrV3aMZtep6RbCrxFSW/Mnw02j3iUbQgIi+HHxjAwJz/ux+O+RyfkSzUi5kc3hWfvnur1aRYEKY+If/9IHpvWOq82/sgjlPNxNL/T2XUrDbncF6rj/Q+A4FiN22mapj7ZXnCAJHMeBmMMUsmUVttdj6VeOsfvYkIIH19c1CHJKEaEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyxnITEL9jnSsYPyGbbysmctNyRz2aklx4gCUxoJCVw=;
 b=oHOO20dqwtEeBgWp7FxPtslEWgVuNkrK/VQlXGXqWUMaGQ7XuqLn+3qW70yNfi+fX58FKbcxRM36sNvfkpoOOmivZIxzac4gGh0SxoyXsJNo+gcKcPM/Rr9LLXSeTr2xsVpYjWUZCok2Jwi0fzPl1L0VCgi8kzOTX6MWbU2x0Limvr9xiZNLSnJ0FqIw510eGQ1zyh6NIdQR+BwNpxqInYAi3Hkhv5JCjyK2Vjn/Kmkl23Bm++1hpBzqKJ2lkJu4M6cftN3UQ3tTAHvfY6mbUNSHU0Jtp0BOSpWXO03bmWyW0Vv5K3kvTN+ED2FyZY+vroyqIPdRl9P9SevoFpnh9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 08:27:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:27:32 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v5 1/6] dt-bindings: usb: chipidea: Add i.MX95 compatible string 'fsl,imx95-usb'
Date: Wed, 12 Mar 2025 16:26:55 +0800
Message-Id: <20250312082700.260260-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312082700.260260-1-xu.yang_2@nxp.com>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::9)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a583ee-0ef6-4948-d85a-08dd613fbbc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ic2ooYo289Jp7i1hc/gFpeZ0dZO9ALfRJ96L4qaM3AYW7qTssT75537x1nMi?=
 =?us-ascii?Q?E7K47mcLo0v9HaDzJn4bugV0sDLjzlV6A/c9eTE0Rds4CM7VV+JthjVzfFeU?=
 =?us-ascii?Q?+dUtHiZzoRuV/2JeIgpDFAhFLasG6JSJToZSBkkOObhNOxB49j91Omb9XHXp?=
 =?us-ascii?Q?dJfFik8XI/uxnTJB8h+lJ2pwZSPiDIq336RmF5nay0f4FchOFoOZf0LO8dEq?=
 =?us-ascii?Q?OPIBmSjtpHMxBJfrUTn9yvOpk2FsKU9fvVuzKRzni47rFA4VhWShhG6h+I81?=
 =?us-ascii?Q?xvUa3Oqc9MKgNZjcsBWCjjOkF/BVSFyE/3MfzThZm+OcGkYV+6rW/iG6bitX?=
 =?us-ascii?Q?19V9DDXDjKRgJud4p+rQ215gJN0g3t7j7lOoUWxCv/k9L/m403hK5yjiu1ht?=
 =?us-ascii?Q?M8VIAF21tecwOt49v9I/vW+eCwAw3P8fUn6I7fYnkaPqKSkTmG44WdjbI7uD?=
 =?us-ascii?Q?21uCT0CZjRo5Jf5SOkT6Ei7AYWhafzmW0pl7jFOgEzxj4swloNqk5KGm5XM1?=
 =?us-ascii?Q?fRB74HCziAwRlibvgdRHy4Bn0V6BNKZEOKppfmDbw1n0zCmts80+hsLfgbo8?=
 =?us-ascii?Q?dezBm/B3UPgLwrcq0ruR9UUfJbc+CBCY/8syUMQeKRqpjDRczVwXDXaLyNMz?=
 =?us-ascii?Q?BDc/kBnvl2USafStFuCnFvNbedOuP4jV9Rro1DvVYkiZ6nphHrmO6r2W6o63?=
 =?us-ascii?Q?OwiuTxmeBaNxeRPkMrcEVMjZSUO/9+TAIMi+a4s997q1CQVUYON5uGATBLhf?=
 =?us-ascii?Q?opziyYczecluBiry/blS2DOgq/iODqeFqQyV8lTQ6s2HLNiSmdhpkocbwH1o?=
 =?us-ascii?Q?xZ+dCV7vrtIR1ZKwXIVGQsRDxKPI28Fz16PL+UspUmmqCTd0sod4shruYOeH?=
 =?us-ascii?Q?tGcJY7cVtK1jxAqKJZWxMkxt2rrDRqcpVAYqtO9zr+Uguy7ovU6C3EkrAosS?=
 =?us-ascii?Q?GgW8GdWAbth44Kdf9mbj03lhIpfX1R9BKJJx2rIc3FjGQvoUmRNjNw1VdBXf?=
 =?us-ascii?Q?80t/RiGDPfVChYOBxh3LC1poteqtWakrbXaY5c1007eT7ylszq1paSO6dMbj?=
 =?us-ascii?Q?gO9WRluu5u7CSctqcK3296wCBF0Mx/eH3+RJfpehHd3CEAx6Vehc59qUuTIc?=
 =?us-ascii?Q?c7uPX6szRYytUHpqn3uvMOB2+zI00V010S8pDyqY6sx8Xtg2+YKfv29tq3Cj?=
 =?us-ascii?Q?v9XdYFdysYI5/sM6V9B9NibdzoMeiCyktNTbXSD1QACLCyvqZBWQDRAdnvFX?=
 =?us-ascii?Q?nACQpGmjTWgKXxNPoIJox9PHydH8vWgh30DMCpVBvUepT9tcrcZXaE0M36Rt?=
 =?us-ascii?Q?ZIL24oEn6MzNioT88+Mw6BhqKrTIBORt7YW+CoYP6h9DJ2Hi+C7VhRMhPwJR?=
 =?us-ascii?Q?sv7EVFFFEN83bB4s5SlUIioOKGydqYOOJTxqjlSycnmgKxv/oLVGuBiG6Slo?=
 =?us-ascii?Q?3tXg3ovlHVnRwYfGAxtrZwfL7BBBgjsM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y3perkeMmsktg9U9dGM2dv6tQnrY/qMsUDpLJPzUO9M08TzzBep1z4KF1FCS?=
 =?us-ascii?Q?68U99T+eV2z8FeqzRCQyLjS+F/Fe6YzCgVC9Fu593412rkQ5vmWETivY2A0L?=
 =?us-ascii?Q?lTUndoH+sLcTyCwmtiIIoOBdhubsP0mk2unekO/u4px9Q1JiIdszXQaqJ9Dl?=
 =?us-ascii?Q?YX34liZSiiZPd4x/8PG9i/DE+zNoSohIjzwCQJ5skhvPuMGN1Ora5SOovRxf?=
 =?us-ascii?Q?W+GywAVtsaWKROxrhY4Zawt9C5TauZmm3anVBhgAwOctnGtNgdvDmrfoMyA8?=
 =?us-ascii?Q?uUXVTA11dxtTEf5OOj6BAXK1auZbut8AhzbTo4SWJrOUUjWz3UCMdn7ckROj?=
 =?us-ascii?Q?oyYRWh5lh4F8ZiKvndkaaQeJDsh0XwfxyKU9A7ASKD9Ytn9qhWa6zghZyt6q?=
 =?us-ascii?Q?kIA5GzfsKDugSVJ4ZLICS0LNhdxdpvbIcfr1tFwg35ydBVwsuR0vHTN+lYJH?=
 =?us-ascii?Q?pQ7Hnx6Y/Vw7Z7zy/V7x2RFhRScxj6UQZWEEzihAB29uHQE7UdngibP7Mrmz?=
 =?us-ascii?Q?40UcAKeOEzw4ocuNJtCtQ/L6GHsCJYgZf4mbbOecqN2Nj1zqCT43jP94tdIP?=
 =?us-ascii?Q?wFOflwQ56MbtaHikfBi7PurHsU6B5Diq9wBHrDzm5oBL4CIDpFS69zOvalVE?=
 =?us-ascii?Q?PLQzVgvq/9YSY0IohoXdImUgU4CNutsijghRamHkXUjyWGBJv6d3LO2gUoeM?=
 =?us-ascii?Q?NfbOWylAD9CUG5k12fA5CZCmAH6JYCTXvCc14npqN5SiA6Z2jw8KkBYQvwNP?=
 =?us-ascii?Q?Q0iKSJ2nk5puPwoILOSZLL4Ko/Wt0p0AW/iyCOJd9GYeoFBGzxrGrnx/LN6s?=
 =?us-ascii?Q?PmxkStXwZOyblWUptkLaySx5xbskMhKWDTCvz3Je92ea2dG9ztIopVF8g387?=
 =?us-ascii?Q?4Hw5XYf4it4B2lXR86RGheM8mdqwRTjbGEXiCmcLe7Hx9Ntn/M6PsjwlVjoW?=
 =?us-ascii?Q?/F03I/nKhqiYHJ7K+ZzTJWsLjE2TLYFFES53NPLa4hHPt0vd87If/6uAlxXy?=
 =?us-ascii?Q?PxtWv0FQC1j+60cczCr0MBlCrLtMAitCw13RrEQZLrHJMOpCD7GsvzQYOZb3?=
 =?us-ascii?Q?hS/ZDvPzqxrbShrBSO53dcnpJc37iDSaCqbxUI/Z3wZDyY9oHVLI2N1apbQt?=
 =?us-ascii?Q?BiCNit7qPI5dOCjZRuAer6lsWUUt/XzoA7payZCTfrBV5b8lkUWhMz93fZH1?=
 =?us-ascii?Q?A4g6ElCA+zg/wj+823TzEC5ywhtT48q8r4pXVshp4GZ9r9dmb7sJDZ2e2TsO?=
 =?us-ascii?Q?2ajMvX2tdCBX9Um8RnzqpiNPqa3KvLpKgj2T8uztakPr4zMqRC0WJP2AIJgh?=
 =?us-ascii?Q?qb6W/JGFxUA0hEil7NtKUaqPZrwEF4R0dCrLFF9Nzo1009arnYFEcj/UFHSC?=
 =?us-ascii?Q?KxvJMGP7Abz1fCqbwjh9Y2BZwLP4Cvnq/Z16aTR74DYDkAtMRl82xSzalrMK?=
 =?us-ascii?Q?j0zbvVupj2q2ZG2vH7reChK1Q1Hv1nlK63ZIJh5kjlC0MgPC79vDvuCK4OH3?=
 =?us-ascii?Q?wHbboOdyaWHFlvp+LY1QSOnk6/CBuzGOlR8gP8926ILUYDdzwAq9hyFrjXnb?=
 =?us-ascii?Q?WmsBxv1re1T+5plEWE4Q9i1bvbJ6HL86jvcvffDN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a583ee-0ef6-4948-d85a-08dd613fbbc0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:27:32.0197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNI9QyT4VvGVg3VW1r8FBUVg0Sz8+LGPLAeeLKDYfQVzU69hD5axeLCfmkWC0YB9Dpl7BlLexvKyYFsSldUHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9624

The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
requires a second interrupt for wakeup handling. Add the compatible string
for the i.MX95 platform, add the iommus property, and enforce the
interrupt property restriction. Keep the same restriction for existing
compatible strings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - no changes
Changes in v3:
 - add Rb tag
Changes in v2:
 - improve interrupts description
 - improve subject and commit message
---
 .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
 .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
index d2a7d2ecf48a..10020af15afc 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
@@ -42,6 +42,9 @@ properties:
 
   phy_type: true
 
+  iommus:
+    maxItems: 1
+
   itc-setting:
     description:
       interrupt threshold control register control, the setting should be
diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
index 8f6136f5d72e..51014955ab3c 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-imx.yaml
@@ -41,6 +41,7 @@ properties:
               - fsl,imx8mm-usb
               - fsl,imx8mn-usb
               - fsl,imx93-usb
+              - fsl,imx95-usb
           - const: fsl,imx7d-usb
           - const: fsl,imx27-usb
       - items:
@@ -54,7 +55,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: USB controller interrupt or combine USB controller
+                     and wakeup interrupts.
+      - description: Wakeup interrupt
 
   clocks:
     minItems: 1
@@ -191,6 +196,7 @@ allOf:
           contains:
             enum:
               - fsl,imx93-usb
+              - fsl,imx95-usb
     then:
       properties:
         clocks:
@@ -238,6 +244,22 @@ allOf:
           maxItems: 1
         clock-names: false
 
+  # imx95 soc use two interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


