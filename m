Return-Path: <linux-usb+bounces-35359-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDoUK/AKwmmOZAQAu9opvQ
	(envelope-from <linux-usb+bounces-35359-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:54:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DA301E12
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 04:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0841B311B4D2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAAD37CD5D;
	Tue, 24 Mar 2026 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="J4K8F0kE"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012025.outbound.protection.outlook.com [40.107.75.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140B439F17C;
	Tue, 24 Mar 2026 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324279; cv=fail; b=FutPZhwNQDn3bru67Tn4ldHs/wAg7vnZ1bHNcdjy8rFjn7IfZVu7oVxpNJqw572U1zqZLyJLjeruQnEmGMXH5xRUfz6/5c+g4nprYM7edTVzIEVWrhyorSXjWXNJxFIHw9MnGiXHGqt+j5jQJ8B4aNeUYV7/KMimDRkiNU5cBSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324279; c=relaxed/simple;
	bh=smQVyscc5Bcmhq4/7gvaEmzKhaJnwK4/vJJWpNaN9Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3HQKNjU1+qAXZKwSNiWL+D3zjm36QsM4+/5/llSxCnaUZHPuaEuGticQ3RzCCROFpZqa1sabAE7JCPl/xQr6MaxckOukUHis8x7hbKaue5ePt8VmUtS6uYNvLTJ7/AF8AWzJb4KBjF8MkiF8poFnsywMb575DFH+PHE4+A6ysg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=J4K8F0kE; arc=fail smtp.client-ip=40.107.75.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjjLaRb5+SEG0Ugoi+TgijE9HazCDmZij7JUU4aUa8wqf3kf9uAnn6fkLDJTIMI8hZHaRsUnGtNoyaflqpBbLxyUwrTjNmxzwf3KP49Ig3peqIEGcVjbF2o9vUZluDX9tnr5VEsy4aBojNWFcMOkUlZvOB/ZiXgcWKLBvicHs2rnWMy5wVUuDfMW0RB1LEfgL2bq+QTpGFWvuSWrP2bZ85G6HE4/oSEZZYoEupKCGlc5/OKgLgh1QlaCQjHJEunHzXXhsm9MRwaVum7Be/Kv0LOAh25qIa7cRP+0hxypbLOCL3AamY4ksZ+o4FqguE//wBL8OMki146rvxim0ZfMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ElD+sSHpFq2d6d4kaqnkOZS+spU1gn1ENAQU0xAhSk=;
 b=K23JyGtlUDh5c+VdBRhbdk++lzo/VWIX88++H1Fj8+sU2pg9QBipk54zd0uh46JjekQkf4H5YMHS3KrmbyKQdlCHskw4rxFeJ5ZUgGzTE3ud3x7Fyz6kwq05P01RPURMWSGCsvuTvVN2hbN0wCtuo8T9EvcvHgKJbjpglDXhFgUEckMFGGMzwK8VySECEOnwSvKcqiTp6dkBuNFnoTAGPOCjc5LBC5MDDYBEoILsHDsoG58wuglxQUKnf3sPuagnR+/rlx0zV+frgVYUU0vD8cLRYlYbNFBEzF8ng18RrPjc8v9Ii58K2PHYw4ZATzfBKRdmw08nYteWt4KPIRIu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ElD+sSHpFq2d6d4kaqnkOZS+spU1gn1ENAQU0xAhSk=;
 b=J4K8F0kEm5VyQv4jjZMHBATM87fgvZG1+drL6Y7mJrL42v59cbs33MFWTvJjo2yJyaFqmPFP35pe/sxknuwy2oaeCcZQ8HvfeUyqlQporn4OYzA/uK+bjKOEsaOLTYUpZ7X3BwbwMxw4mHWXo8gpmvyQkNOqwukMujfKs1RdvvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY0PR0101MB4844.apcprd01.prod.exchangelabs.com
 (2603:1096:400:275::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:51:03 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9723.018; Tue, 24 Mar 2026
 03:51:15 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v1 1/4] usb: serial: mxuport: add support for more MXU50U UART devices
Date: Tue, 24 Mar 2026 11:50:38 +0800
Message-ID: <20260324035041.352190-2-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0023.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::7)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY0PR0101MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: c1257c62-c774-4278-81b6-08de89589936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	K/jSAy59J4odCVGGQKwr1geK/dcwdvDm5rbJZygbZR/LZksD5rgFCQphfhjVi+2srdrNiDPQByVp9ZIDf+lZPGg7PjG7vcA7STAYhka4mL2a6QZ1NhBbUA8IaYu9ir8Czbn7qW50AkxWUGcdHbGEiDcSVXJ+gLT6aFUqrAFRK6Bc9N7gvIx7xbvuHvox/f7WHunu22sWdpuJZCGdiv9Xh4VGxyMsKDXypNZBb7S8COQRGd/f2fF5FQegGu22jAf1HYbshA7U9XqIv1pECcyPpO5JEfEn/JCSoU9wssfykfQqY8KZxjLxqLZXoyAed7B/B7Z39tskfHzgpwu/8R8v3R+o7N2B0JXLbyZm9hO+oIMUbUM39yQFltLzzJ8OAbQINmMsihS23W763HugF5lyo6ducNU5IR68lXcnskcnQhFMYxXDK0hcm3Gjn2cpaxkMpIvBL5Z6lQrq10wE0O0RR699mV+IvZ3QJ4KLYYDVJXulGTTltiiqGGwlvrGsT6zXxB+M3zNDleR1ce5zZXNoV7kcqQ+q8kWO3InHT47BtIr199tWLzM4mWYyd74sn5HSHDDunwv7kyLgWWzRzw88xuVUctldea/oiWW5kk/xy3HJXrfBxx6tA5NGsfg9s1Lyu5kuqzOOS6+yjwYaMJf82TT9SomZSNq28aUfR1o36HdEFUYmepxAIj0hK00U3joSwj8svt3BFv2AILbBjgZAA8wmIb0M8GD+J47PYmQlBq1LxEcubKrMcl/b6nB8nnH929/04iU9xGUyiC5jUt/hAKMZaFLaLIYXn+cDYqQ8rkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?64HnxLMhSbXMF/LLA2ReCY4NERWKfXWyBAe+K3zLg0rLGIgiqwFCsQrBRzvt?=
 =?us-ascii?Q?dIrWkZmvsyOad+5pArV3NVIEoc83/pJvHyZFanAxr7sWyWDF69EANty2Uy2s?=
 =?us-ascii?Q?n9QJ8h/zDRLGbjJC3SPdDmlxiXgMlXQ5cZ6mrnDBHnHYqvM/0KG4QJepsMHV?=
 =?us-ascii?Q?9WKr8bY1/qGxq9IzlS/N75qRk7wGQF14dR71Rbd1hACJjV5c49PhZWja3omy?=
 =?us-ascii?Q?jqFBS2YNgCtEMuB7Zhwyt0LBwuGTERgVdDJslNWo3kmq3iPXnQlLy0M8/vs8?=
 =?us-ascii?Q?lg+VCSqSbJ6yGSjv8/y2RfVvNlIxqbrBSTPzk3aeKjOQ7BIbkV3LtryXM4zC?=
 =?us-ascii?Q?INGQnQcQJc8L75GWhNb/mp+MTT83Ib8pMW2SK/XoucwSuJ37r3sFr40dgApp?=
 =?us-ascii?Q?vi+F0zvhmo28CcRPx4PFnp+lDFB/YZ7mrZvz3DCVC3lBF2TOrtwqWperfXt9?=
 =?us-ascii?Q?2KADnKL4hE/7DCXzlTk5RaXlE5o9ZoXooM5rBgYEf5PtQDLRU3jkf3ctPhvN?=
 =?us-ascii?Q?msFIlKvMQWwGCVQjFIuJBA+JdR4YPgpRgSg5EKSVzsBRJ3cZcBJNOggWvuxT?=
 =?us-ascii?Q?blK907RnxxN6W1oEk0ea/XFjIC0dxMHQWKJ9gmRO8Ish8kaDEi7g9fYu037q?=
 =?us-ascii?Q?m0CCd2pj8ybxfyNwNHrvxD5VwCcEXMcUN9o42UHYk/0y7spPbpZlHtfXmhHb?=
 =?us-ascii?Q?DItPwSr6QasylHSahIoqvl7R5zLYZfAKs3NIwB3Ea03Varw5//89Dd42l7Uz?=
 =?us-ascii?Q?S2pQOJMGA2MBvDzU8R7rlFJkv1eSDCSbMhR2PXVvcOays4GtXQPi+qQdha/U?=
 =?us-ascii?Q?y5WbjQmja69LRVk8/Uy97ih3CJmiba+jGQ8mzXU1nEPQslFGeQXPhkmOecsI?=
 =?us-ascii?Q?uO5Y6Kau39uCMRiKRc2H0y2aMkeKCLiQhFYc8TMIWZiWvviwLm4yIPo37Yn6?=
 =?us-ascii?Q?INce2RKUrVjeY1q07xmlIDXXlx8wmoe4m8oe9eGa1DKJH/0KQCmedNJ/VMpq?=
 =?us-ascii?Q?Qo5gPOF46W9hFRiVlVerEcLUmownIAUnTuhkvIKoZxemoWckb72f3nUmU0xs?=
 =?us-ascii?Q?08ee4Cq2qGXV6LQuKbUK5WnAHUgSzTFkeTTUYFCNCbQVakJ6623SWzLI0u9P?=
 =?us-ascii?Q?2y+7p7SyMVLguvc0/tQkn8dK+ZC+f2q9/LykmgIlXjfT86pz0NOf42DCYmas?=
 =?us-ascii?Q?dYJGZCcCdKYyALQqnpk8V0SPdJeWdlvRBqmWrCKcwwqSa9GNHO37VKXzITm0?=
 =?us-ascii?Q?UFnh0dwtPnGptlHDQJ121w7mkEdGPYQd/ZRpffhhgLjnHNUmstkBQq3jOM7N?=
 =?us-ascii?Q?Ol6M08HLWLGU8ObUrbQQTh5AQ3bkS7r29nnjCwyWrV9BAM+nukw7mvqmVaP3?=
 =?us-ascii?Q?DHW4jAbJIiq4ML9tWvMqf/OwbDY2bG52sKpUPcFiDQWddox2KPEdNS2SKzpj?=
 =?us-ascii?Q?ICGVO40p8k7chI+Yb09aflzTYz5pGSDRWF7GFSkNSEn+2bOU69oh4e745cjU?=
 =?us-ascii?Q?iUg+LK17rh0ghAf2+JRUif9ChJcAB5n2cFcwVVCVn7U9CEmYNZ5Bk6Fz0Oqb?=
 =?us-ascii?Q?NfI3p+Qb4dSMa2NRAnQjfXsAc2oAuSxtnxmkpHLxnKk7o5uxN2Jiq2QmIf1T?=
 =?us-ascii?Q?nLaKz855GQmg1V+o94z+KzB7GYtTiHADeI+Nh9q4gw1mVFce5Xvn6Kd8DqjU?=
 =?us-ascii?Q?1GRTN0NnMvwpK2zcmdvDhs9IZNipZcJZD3kbA+2piTL87T2Yqfd9NmJCr99i?=
 =?us-ascii?Q?lrnFoNOgqnxW1vdCPe608ZwOdFl/KYw=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1257c62-c774-4278-81b6-08de89589936
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:51:15.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwSQo8vb1pCBtVOgS5qIwyykIyCPqoOCDw/h50aSfz0CDBtlLbNyhVdrQJ1aAOVtQMjJVWStlgjNeJS7Ro6/Rycarl22ddgnp0Ggsz1H/Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4844
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35359-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crescentcy.hsieh@moxa.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[moxa.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[moxa.com:dkim,moxa.com:email,moxa.com:mid]
X-Rspamd-Queue-Id: 343DA301E12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for additional Moxa devices using the MXU50U UART family.

Extend the device ID table and port-count handling for 3-, 5-, 6- and
7-port devices, and update firmware selection to use the matching
MXU50U firmware images and version offsets.

Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
---
 drivers/usb/serial/mxuport.c | 132 +++++++++++++++++++++++++++++++----
 1 file changed, 118 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index ad5fdf55a02e..034b506322c2 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -39,6 +39,25 @@
 #define MX_UPORT1613_PID	0x1613
 #define MX_UPORT1653_PID	0x1653
 
+#define MX_UPORT1252_PID	0x1252
+#define MX_UPORT1253_PID	0x1253
+#define MX_UPORT1411_PID	0x1411
+#define MX_UPORT1452_PID	0x1452
+#define MX_UPORT1453_PID	0x1453
+#define MX_UPORT1619_PID	0x1619
+#define MX_UPORT1659_PID	0x1659
+#define MX_UPORT165A_PID	0x165A
+#define MX_UPORT165B_PID	0x165B
+
+#define MX_MU250U_PID		0x0250
+#define MX_MU450U_PID		0x0450
+#define MX_MU850U_PID		0x0850
+
+#define MX_MU850U_6PORT_PID	0x7002
+#define MX_MUX50U_3PORT_PID	0x7003
+#define MX_MU850U_5PORT_PID	0x7004
+#define MX_MU850U_7PORT_PID	0x7005
+
 /* Definitions for USB info */
 #define HEADER_SIZE		4
 #define EVENT_LENGTH		8
@@ -48,6 +67,9 @@
 #define VER_ADDR_1		0x20
 #define VER_ADDR_2		0x24
 #define VER_ADDR_3		0x28
+#define NEW_ADDR_1		0x86
+#define NEW_ADDR_2		0x88
+#define NEW_ADDR_3		0x8A
 
 /* Definitions for USB vendor request */
 #define RQ_VENDOR_NONE			0x00
@@ -147,9 +169,13 @@
 #define MX_WAIT_FOR_SEND_NEXT		0x0080
 
 #define MX_UPORT_2_PORT			BIT(0)
-#define MX_UPORT_4_PORT			BIT(1)
-#define MX_UPORT_8_PORT			BIT(2)
-#define MX_UPORT_16_PORT		BIT(3)
+#define MX_UPORT_3_PORT			BIT(1)
+#define MX_UPORT_4_PORT			BIT(2)
+#define MX_UPORT_5_PORT			BIT(3)
+#define MX_UPORT_6_PORT			BIT(4)
+#define MX_UPORT_7_PORT			BIT(5)
+#define MX_UPORT_8_PORT			BIT(6)
+#define MX_UPORT_16_PORT		BIT(7)
 
 /* This structure holds all of the local port information */
 struct mxuport_port {
@@ -179,7 +205,39 @@ static const struct usb_device_id mxuport_idtable[] = {
 	  .driver_info = MX_UPORT_16_PORT },
 	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1653_PID),
 	  .driver_info = MX_UPORT_16_PORT },
-	{}			/* Terminating entry */
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1252_PID),
+	  .driver_info = MX_UPORT_2_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1253_PID),
+	  .driver_info = MX_UPORT_2_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1411_PID),
+	  .driver_info = MX_UPORT_4_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1452_PID),
+	  .driver_info = MX_UPORT_4_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1453_PID),
+	  .driver_info = MX_UPORT_4_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1619_PID),
+	  .driver_info = MX_UPORT_8_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT1659_PID),
+	  .driver_info = MX_UPORT_8_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165A_PID),
+	  .driver_info = MX_UPORT_8_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_UPORT165B_PID),
+	  .driver_info = MX_UPORT_8_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU250U_PID),
+	  .driver_info = MX_UPORT_2_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU450U_PID),
+	  .driver_info = MX_UPORT_4_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_PID),
+	  .driver_info = MX_UPORT_8_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_6PORT_PID),
+	  .driver_info = MX_UPORT_6_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MUX50U_3PORT_PID),
+	  .driver_info = MX_UPORT_3_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_5PORT_PID),
+	  .driver_info = MX_UPORT_5_PORT },
+	{ USB_DEVICE(MX_USBSERIAL_VID, MX_MU850U_7PORT_PID),
+	  .driver_info = MX_UPORT_7_PORT },
+	{} /* Terminating entry */
 };
 
 MODULE_DEVICE_TABLE(usb, mxuport_idtable);
@@ -944,8 +1002,16 @@ static int mxuport_calc_num_ports(struct usb_serial *serial,
 
 	if (features & MX_UPORT_2_PORT) {
 		num_ports = 2;
+	} else if (features & MX_UPORT_3_PORT) {
+		num_ports = 3;
 	} else if (features & MX_UPORT_4_PORT) {
 		num_ports = 4;
+	} else if (features & MX_UPORT_5_PORT) {
+		num_ports = 5;
+	} else if (features & MX_UPORT_6_PORT) {
+		num_ports = 6;
+	} else if (features & MX_UPORT_7_PORT) {
+		num_ports = 7;
 	} else if (features & MX_UPORT_8_PORT) {
 		num_ports = 8;
 	} else if (features & MX_UPORT_16_PORT) {
@@ -1053,6 +1119,7 @@ static int mxuport_probe(struct usb_serial *serial,
 	int local_ver;
 	char buf[32];
 	int err;
+	bool is_mux50u = false;
 
 	/* Load our firmware */
 	err = mxuport_send_ctrl_urb(serial, RQ_VENDOR_QUERY_FW_CONFIG, 0, 0);
@@ -1065,12 +1132,41 @@ static int mxuport_probe(struct usb_serial *serial,
 	if (err < 0)
 		return err;
 
-	dev_dbg(&serial->interface->dev, "Device firmware version v%x.%x.%x\n",
+	dev_dbg(&serial->interface->dev, "Device firmware version v%d.%d.%d\n",
 		(version & 0xff0000) >> 16,
 		(version & 0xff00) >> 8,
 		(version & 0xff));
 
-	snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
+	switch (productid) {
+	case MX_UPORT1252_PID:
+	case MX_UPORT1253_PID:
+	case MX_UPORT1411_PID:
+	case MX_UPORT1452_PID:
+	case MX_UPORT1453_PID:
+	case MX_UPORT1619_PID:
+	case MX_UPORT1659_PID:
+	case MX_UPORT165A_PID:
+	case MX_UPORT165B_PID:
+		is_mux50u = true;
+		snprintf(buf, sizeof(buf) - 1, "moxa/moxa-up-mux50u.fw");
+
+		break;
+	case MX_MU250U_PID:
+	case MX_MU450U_PID:
+	case MX_MU850U_PID:
+	case MX_MU850U_6PORT_PID:
+	case MX_MUX50U_3PORT_PID:
+	case MX_MU850U_5PORT_PID:
+	case MX_MU850U_7PORT_PID:
+		is_mux50u = true;
+		snprintf(buf, sizeof(buf) - 1, "moxa/moxa-pf-mux50u.fw");
+
+		break;
+	default:
+		snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
+
+		break;
+	}
 
 	err = request_firmware(&fw_p, buf, &serial->interface->dev);
 	if (err) {
@@ -1080,14 +1176,22 @@ static int mxuport_probe(struct usb_serial *serial,
 		/* Use the firmware already in the device */
 		err = 0;
 	} else {
-		local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
-			     (fw_p->data[VER_ADDR_2] << 8) |
-			     fw_p->data[VER_ADDR_3]);
+		if (is_mux50u) {
+			local_ver = ((fw_p->data[NEW_ADDR_1] << 16) |
+				     (fw_p->data[NEW_ADDR_2] << 8) |
+				     (fw_p->data[NEW_ADDR_3]));
+		} else {
+			local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
+				     (fw_p->data[VER_ADDR_2] << 8) |
+				     (fw_p->data[VER_ADDR_3]));
+		}
 		dev_dbg(&serial->interface->dev,
-			"Available firmware version v%x.%x.%x\n",
-			fw_p->data[VER_ADDR_1], fw_p->data[VER_ADDR_2],
-			fw_p->data[VER_ADDR_3]);
-		if (local_ver > version) {
+			"Available firmware version v%d.%d.%d\n",
+			(local_ver & 0xff0000) >> 16,
+			(local_ver & 0xff00) >> 8,
+			(local_ver & 0xff));
+
+		if (local_ver != version) {
 			err = mxuport_download_fw(serial, fw_p);
 			if (err)
 				goto out;
@@ -1098,7 +1202,7 @@ static int mxuport_probe(struct usb_serial *serial,
 	}
 
 	dev_info(&serial->interface->dev,
-		 "Using device firmware version v%x.%x.%x\n",
+		 "Using device firmware version v%d.%d.%d\n",
 		 (version & 0xff0000) >> 16,
 		 (version & 0xff00) >> 8,
 		 (version & 0xff));
-- 
2.43.0


