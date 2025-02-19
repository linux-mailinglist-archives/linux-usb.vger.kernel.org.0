Return-Path: <linux-usb+bounces-20815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D63A3B9EC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25DB47A8797
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFF21E25EB;
	Wed, 19 Feb 2025 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hVDN8UDU"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2063.outbound.protection.outlook.com [40.107.104.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDAD1E1A20;
	Wed, 19 Feb 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739957460; cv=fail; b=DqTCOX/WNCqw5y2Iun0QQ2f2QPL0qHQf8abktVGzElZCOnGqDkQ6hJIy5GYU/7Qe3tStzpw8BjOOiR4pfcj6IEhcC654PODWaJ4pw8X0yA2k06XEkJ0/wAEeppVwvZEVKa6CiZOukEDQKOzULH/bl9Dz1Z3KzX9tvcdm15w9/nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739957460; c=relaxed/simple;
	bh=EcKoj2tfppzGKvouzHdVUugfmmqrQgb9gDMS+E3tfIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jvjP/e4YQyg09su/BEsLMVmb5mHZgcvJNyogfzKHHUWugW3GqCzU3aZxOtllPWNzS6g8eoacSGb+KIOpN3L/24IS+m0DY4uaurowYy1BLajfYUGsNGxTVfa8bZ69KZuMvBna1rY3Adr9oQHcoIf5d/sdUeoFYzrcfjfnmfClAzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hVDN8UDU; arc=fail smtp.client-ip=40.107.104.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLQxAlXgKDXBDk4N1Xvj0JYczExXlsvrKZK0B07c7wKEF6hJwSOp/eWr0i7iKWB5aaz7PjRUqUKstbMcTiNBpUulcSQD2fokpGdbB6RSNsxwgzJk8FKeNOkJg5VUL+g1GygrEXAtVO5ZeEUMedzelKst1FS5NHJ2zhS91/5s7NbSSaguyEwI0k9aAnB6bhrZzlQ71TEIVyw7eKaToBe5o9RLg2TGicsvjSwUAR2c5MsVajBCrQGXtUyoRrLicHLBoLe6pTLaGQOrSF62iJqPxagGKeJfyKQ0EOFKoulpk6Ui485d8Imp+pz4BUS/9nFiDZrwd1XjgO79Y0lMMXxqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDRC0qcYisqsKBDrb56yQ9roKP7EdKi6SViBQXntfFc=;
 b=i0ff+AwwpvRyYffuxDDG5S8Rj3kkhqVUu7EkvoYFIkCX0N9fQTa9qUX+lXLUkyI7/a+DUIaSv8io4XI14RvgeLM7TC3eB8kzAEFODy0bEnIp7ATbqM4bxqj8MgRV/VlDPPS2LTvIr/iIotuXTC7X1pLWqKeWZhKBqg6JLf6BsQ1lo0AJ5VdIEmyi3+mix1EqicLTQjJOMIM+xraC03JPEpkCEcBOSHo8KQ35klnnQtusWoZJx+dXhBYBr41xNJTMhvVBB+09j1lL43ZI14oFNUA183mlQD/b41YqAnXfMPNLxV+05++OBjYXbAIWf+wbily1uWMnSL5ld5rRqtXUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDRC0qcYisqsKBDrb56yQ9roKP7EdKi6SViBQXntfFc=;
 b=hVDN8UDUsaq+zNeUuoPIJ8LnT84LoL+Jf5yjbSDFXPotnructrY+Xwz6ztb2Y9J6cdlUccsu7RlwCV6GqSa4iRUp8ekhdC5YcZ07g9xfgMwKLvZXjSl2RPfHHrnMWdgze1024uhU7izmG5l/DOXjMk4orpOMcrGQRCS6MHHMXz5OfI6qMYpbTEmABO2niKTwxJ9igApnfFd1ZJ5wH8ozaaxFul7zzgAlyh+dGD/up53Wb28E2YdeJJG1H6EWtUGkXC0V8jJL/aIgZp/EBGKsOodlXjDSIqEcjE7kVYXOHx6mJ0meaenQa8yWMHHlzuP8HuROKLqEMWMpHPkGgdxLIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS4PR04MB9550.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 09:30:57 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.8445.016; Wed, 19 Feb 2025
 09:30:57 +0000
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
Subject: [PATCH 4/6] usb: chipidea: imx: add HSIO Block Control wakup setting
Date: Wed, 19 Feb 2025 17:31:02 +0800
Message-Id: <20250219093104.2589449-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219093104.2589449-1-xu.yang_2@nxp.com>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS4PR04MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 550ff45c-84fa-402d-167a-08dd50c81d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7f/BDQeB4VOjpSlsM0/3mmFOdybuB8zgnLKRP/VssvUaVR/GshczkaGw6OuF?=
 =?us-ascii?Q?pMT6Lo+93aeVwji7+YRMc8PheqGUh/4ikkq6ozDJHQUTpax4brGeNe2SgewX?=
 =?us-ascii?Q?hmv7ls5zxbTtmwdZvjK9nSyjHXdOro4aWfSfMzIqvzrBgmiE5kz5fIJPJ0Yq?=
 =?us-ascii?Q?Z/D5QaN6sIcVi9bPXQoq1Sq9ChrXsv/b/SFwxYayQ/NrT9qi3uOYilVo8FBB?=
 =?us-ascii?Q?/0Tuy4q6ZMB/wevrQ42M9d4KHCw1aumYLjBSLMDHVgM40FnmIEgO0LpiivLG?=
 =?us-ascii?Q?wMSD+UeACpxt91WW7jxvXcHmOIIeEZNCPe59zIa8gdIqdQoTcU/Egw51Kq9i?=
 =?us-ascii?Q?kPtfXEiTvJsqhW4+P/0y9Tk5X2+O2qdFxVYo1rrwRZ1LVB6JlrxEjOsB2uDy?=
 =?us-ascii?Q?qiXYpZkVQEPSb8Fxe1GhMpiXWeSPddODRqbhceojsGSO0Sz9d0MoQbDJsIvU?=
 =?us-ascii?Q?jMXinHaX+K23oozAeJr6/hAuW2+hIYVs2aHwDJbdxEvqhptl43Bg+DDF+Zq6?=
 =?us-ascii?Q?3aGVI4ceNwC8TPDhCd6xLEjAy1NxTggwSmh+Vky0l64uU6vpItPxyFzj0t9E?=
 =?us-ascii?Q?RmEB4XGFRujGx2oPhc6yo1Oj0gA4JJnL8OO8OdJ+a1wDhUHgAA/vAXWV4ap5?=
 =?us-ascii?Q?Y4DjjpqjoQxnL4qrnbtQlhn44QV/mTwSDUEBI2LWDz4XXgDdZ9yaWd+pNMD/?=
 =?us-ascii?Q?TJJ6L616nleeHhe1FzIp30wj42HxZF1isIkd9nHKAp2rNe+sm1HfmYoqxCkR?=
 =?us-ascii?Q?6WhP83Eo4WI52squtsZQJkiocwq8Ac12HYjzfTRJFb+3bsj6LwITp8L5GXDP?=
 =?us-ascii?Q?BRLK6ti3neqwHOpiw3aSBPO/efGvoX6xu7TegA4caIGRgwbCG1dSPh6ChAlJ?=
 =?us-ascii?Q?F2GIBQUKRi9C5UfF4F9vWOf6n0IApJAlauusecOBAfDQzsy/8CqwLRpOSXtQ?=
 =?us-ascii?Q?ssjtvh8ygKapi4f2TzqUyiECeHIprc7O+E0BpCHhOw9kpThXDO42u9Sb/bT4?=
 =?us-ascii?Q?mzanDGYIbgpYq0MqkwtQNy66Ec5JbJUk3O6721bblCiolPClJPcuULxnf4g1?=
 =?us-ascii?Q?+mxfEZsw0NSiQwUweQhyHTmdoQ9T4jnjcfxxxM5QYYBs07ZM21uPV34oS4py?=
 =?us-ascii?Q?4Fk7xrkq7jp64ECRbf6OeyVgrJyYHr6WPQL1PNs6XWW5ru9RwSbdwF4Z5RTZ?=
 =?us-ascii?Q?aK084bXi96dtqcifnBOI29vxfmqGq696PzGc4Tb5isZ6gDhEve8oNhE8cU8N?=
 =?us-ascii?Q?SrJNxe5HZrLjWqWHvIv0ySSlaU+P8CmY1x3nRoV8+UtwSJL4IILfsbBhJ1dn?=
 =?us-ascii?Q?60tthLahZerawCqudnAg0wmDg8nITl2iT1ahy2bU77FofqNkArqnwpIVY8TQ?=
 =?us-ascii?Q?VjfgnxvMlLP2qUWusY8vjaidzg+Hy32akwPm/b/TFejQdCWGrJw44HUpiqEM?=
 =?us-ascii?Q?oaFcXUmvmlRUmC2wPeC0P4FU/+tci4XN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DgpHh+ZRJwRnnXFgZbeFUrpd5VLs54Xyl7mH2aKMdGhsB+u8a1DSUmoLiAMy?=
 =?us-ascii?Q?QTZbDFgRX6ECdkO2EY6VjLNMIJJmMQRrxtMOQu9VVdZfBd9w6qjEHD+nlN9e?=
 =?us-ascii?Q?05wQje+IqfF8r52yeQhk4/YTL6gOVGPaU7VlozkB2fG3p04MtKSoxQd58rhK?=
 =?us-ascii?Q?PjsLIzyWLipvxCupZ9IeEIt2nx2CjibiJk4zH5XAQ9d8rGMnJ2CeKszv2h/H?=
 =?us-ascii?Q?t4sFOJg88Nxb0t1FFk7Qw28TZX9Qa9DycrhwmEhMdJKd/ioS+7x+5Gi+283d?=
 =?us-ascii?Q?swOnbIFp3zbsVBaxkNJZ+U9B2DZPLfbq7XxmLY4PAlEhdZ+uq/B448/SR92e?=
 =?us-ascii?Q?kKK8fscyALYFQGqVNVmA1tFO4YHFlPsBpAZdkV8eIaIFDIHt4qTgWChBJB6U?=
 =?us-ascii?Q?1nVyRxOHLBk5NdUWmAvyRXnW4wNRAgPMDAxB0sniVv0XeYVjIGZidifMYpHu?=
 =?us-ascii?Q?U6ymGSNMSYKt/M1yRT/WGJG490Ey0McZxOn0VXMAxCveo5suNm3K1twttnII?=
 =?us-ascii?Q?gXStxw4tYEk6HDsUqzl30sO0afQWKIW51v39iFVzWhZTbXOTk99rHUd6DZMS?=
 =?us-ascii?Q?d6Kwe1qr25v87HAnGj4mZqzx3Ustpq1yhnF41rheERc7n4v56oTUC4c+iTWz?=
 =?us-ascii?Q?IiDVmpssDZIziapeuFr5j0CtiBvmZtfrlYuQ+V2Sr9rQsXt+IarY44NKPI6N?=
 =?us-ascii?Q?W4aPtYUX561hiTRzXc7oOcgFj9lK0FQ0Cf9sY8WdqCVxcmgA02F7osUZcG7o?=
 =?us-ascii?Q?1xQBLMoUibSVr8wxmgiawDaVqB8GP6u/0X1GyLJBDwib/IG/hAydxgGIi51l?=
 =?us-ascii?Q?OfpqJDsKbrgde2OLlhTPPCIGVhoKYg1hGTb5/w0uSdG5DR95xMWbqSxbXUYu?=
 =?us-ascii?Q?JQsmT6hme/Gwd+QSRO5es9W0uuBm85CSc/I+7yhX6KuC6jIJahmj0G9PXjtn?=
 =?us-ascii?Q?Zn7yIK/wHQSGedj2J7k2J7zw2D6G9CJWDVmfRLsxrJdf1fltETlShiHU3dm9?=
 =?us-ascii?Q?o7BAfOc8QyuDw8fHJRoEUNSywR75mHRGm52no19+QcDM6D+n8+YfJFjrPHD+?=
 =?us-ascii?Q?3bFvbq8ffVkPYaFqGUwx8U4Eh13csbjYPqWEqiSfuTI08IkoODhmNWNmyRBe?=
 =?us-ascii?Q?X3+tse5yVjHSWEzggslPyeSbDRY/EC9Y62X8/IEAkOlPH1KQHInE3hzOrXZj?=
 =?us-ascii?Q?i1jyAyJ3o43x1vzUuoTRr2nmVbSEBvqixF1vv0zz9nKfuYfK7WGhdE7GqBnO?=
 =?us-ascii?Q?6ExLDTGzTvYOE1MaKOO8fDFmIrIn4hfiBeT2zb3HsSOxJsX7A+og7cF336vR?=
 =?us-ascii?Q?ZhNG6NS+JdLN3LMHd6R98/OtYGt0Hootqg+Gvex+A3xYNfFWdAq1xuA5UNQD?=
 =?us-ascii?Q?z+b4OHmuHWtfR2i31N4nHvMNc4Mm7KOywLnzQnUFXZp0eCDzxxOQ0IiksdCF?=
 =?us-ascii?Q?SGAskh5c5MDTZ+BP+jfpg2oxLdTpMFCCupKTh74xJC3ksUZ4TFMNic5nMhOr?=
 =?us-ascii?Q?noe+nqtuMBRNsLqQWlnQnSuIsqLHiTBVWGtjJILst3X2mLKhPapsR/tkIR3y?=
 =?us-ascii?Q?qpiOz57pKJgVVbH6ECV/TBKqVv3rjlM4NMwS3QNd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550ff45c-84fa-402d-167a-08dd50c81d3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 09:30:57.3205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7yUNQ4fzv+KiruOXIteiMUaAPj3j3ZnZ4KwMBZW2/Q4uUSnESQNVAWJgF/fDY/iITBVTZY2UfCHbLqgxZDKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9550

On i.MX95 platform, USB wakeup setting is controlled by HSIO Block
Control:

HSIO Block Control Overview:
- The HSIO block control include configuration and status registers that
  provide miscellaneous top-level controls for clocking, beat limiter
  enables, wakeup signal enables and interrupt status for the PCIe and USB
  interfaces.

The wakeup function of HSIO blkctl is basically same as non-core, except
improvements about power lost cases. This will add the wakup setting for
HSIO blkctl on i.MX95. It will firstly ioremap hsio blkctl memory. then do
wakeup setting as needs.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 107 +++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 1394881fde5f..f723f8670bb8 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -139,6 +139,22 @@
 #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
 				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)
 
+/*
+ * HSIO Block Control Register
+ */
+
+#define BLKCTL_USB_WAKEUP_CTRL		0x0
+#define BLKCTL_OTG_WAKE_ENABLE		BIT(31)
+#define BLKCTL_OTG_VBUS_SESSVALID	BIT(4)
+#define BLKCTL_OTG_ID_WAKEUP_EN		BIT(2)
+#define BLKCTL_OTG_VBUS_WAKEUP_EN	BIT(1)
+#define BLKCTL_OTG_DPDM_WAKEUP_EN	BIT(0)
+
+#define BLKCTL_WAKEUP_SOURCE		(BLKCTL_OTG_WAKE_ENABLE	   | \
+					 BLKCTL_OTG_ID_WAKEUP_EN   | \
+					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
+					 BLKCTL_OTG_DPDM_WAKEUP_EN)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -159,6 +175,7 @@ struct usbmisc_ops {
 
 struct imx_usbmisc {
 	void __iomem *base;
+	void __iomem *blkctl;
 	spinlock_t lock;
 	const struct usbmisc_ops *ops;
 };
@@ -1016,6 +1033,76 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
+{
+	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
+
+	if (data->ext_id || data->available_role != USB_DR_MODE_OTG)
+		wakeup_setting &= ~BLKCTL_OTG_ID_WAKEUP_EN;
+
+	if (data->ext_vbus || data->available_role == USB_DR_MODE_HOST)
+		wakeup_setting &= ~BLKCTL_OTG_VBUS_WAKEUP_EN;
+
+	/* Selet session valid as VBUS wakeup source */
+	wakeup_setting |= BLKCTL_OTG_VBUS_SESSVALID;
+
+	return wakeup_setting;
+}
+
+static int usbmisc_imx95_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	val &= ~BLKCTL_WAKEUP_SOURCE;
+
+	if (enabled)
+		val |= usbmisc_blkctl_wakeup_setting(data);
+
+	writel(val, usbmisc->blkctl + BLKCTL_USB_WAKEUP_CTRL);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
+static int usbmisc_imx95_init(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	if (data->index >= 1)
+		return -EINVAL;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	reg = readl(usbmisc->base);
+
+	if (data->disable_oc) {
+		reg |= MX6_BM_OVER_CUR_DIS;
+	} else {
+		reg &= ~MX6_BM_OVER_CUR_DIS;
+
+		if (data->oc_pol_configured && data->oc_pol_active_low)
+			reg |= MX6_BM_OVER_CUR_POLARITY;
+		else if (data->oc_pol_configured)
+			reg &= ~MX6_BM_OVER_CUR_POLARITY;
+	}
+
+	if (data->pwr_pol == 1)
+		reg |= MX6_BM_PWR_POLARITY;
+
+	writel(reg, usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	/* use HSIO blkctl wakeup as source, disable usbmisc setting*/
+	usbmisc_imx7d_set_wakeup(data, false);
+
+	return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -1068,6 +1155,14 @@ static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
 };
 
+static const struct usbmisc_ops imx95_usbmisc_ops = {
+	.init = usbmisc_imx95_init,
+	.set_wakeup = usbmisc_imx95_set_wakeup,
+	.charger_detection = imx7d_charger_detection,
+	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1289,6 +1384,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx8ulp-usbmisc",
 		.data = &imx7ulp_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx95-usbmisc",
+		.data = &imx95_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
@@ -1296,6 +1395,7 @@ MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
 static int usbmisc_imx_probe(struct platform_device *pdev)
 {
 	struct imx_usbmisc *data;
+	struct resource *res;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -1307,6 +1407,13 @@ static int usbmisc_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		data->blkctl = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(data->blkctl))
+			return PTR_ERR(data->blkctl);
+	}
+
 	data->ops = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


