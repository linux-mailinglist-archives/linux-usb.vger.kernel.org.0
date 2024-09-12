Return-Path: <linux-usb+bounces-14972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579797602A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 06:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F529B242CC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 04:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DA8188908;
	Thu, 12 Sep 2024 04:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PfI69A0T"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F218859C
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 04:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116664; cv=fail; b=pTAb0v+HaW50TRui5KAWWWM7ln4PvcJjLtdyj3u+iduciW5m7Srw3ot3XyL+QyUe0W01+uqYrq31WoiF4K3VyrTBEw7NgysVg1KN9zrbRqcxblaZg2AZrfcFKEEGnBqP/HXmSwoU19rvuczWteCYaZM8MQaW50leDCTcaI5Kcfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116664; c=relaxed/simple;
	bh=VRMoQRNg8U7c6Z1LmhaWctfO53jtbg/vkeBxouMuWQw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TUIW2/8WiCGWtfkTUBvISYW93ym9kig8TKy/VB6nfdLPqtDoRZzT/z99pHgM2+Xyy71ewmNmp5p5RPNLq0DEfLAhUj+EWMHCFNcyKDzS4O0dE9808pRVHtMbdG4TD5X/k9qknB6fxfpDB9cMS/N1Ba8KMvInzyIPAGP8FnIKhmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PfI69A0T; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDzK77iMJyoLd7eYcRk+7dChdrYCYIy2I8GusSjloJhEg6rLXGfk3SHA9cUGrEWTc4Z6/cfK5gzm8c9//3eyVUTh6qNZizSqwpvWze9rT7b0UkdQeJF0XheSSLtYYW/QAD+DBp686ev6/Py/vjoUaBSYBqWkn0tOSxTIH187byWyZJAV9JFEipwwMe7C2n9w7UkZnW8BCJwD64Fts3jrfg1SExBWLn5N2cKyFeyjRbUT3JbkfajnO6Cz64R1BprXZ2trSJDdRyDb+nfRNFqFVqdfPkanixaOiuyyWFUtkoVSEvLgnqKK8ZAXK/fGz3R+hEmIPPENMKVpyYc8Y22AzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoXxw0d4hV1AU0N4blzSjNRbpVnro4J+x0yHJpEQGh0=;
 b=fkM27qt5DwS1DdH7bNos9CaXimRAFjQvTjXXdNrBxkWc5GgEL0skdPbSQOEBedadn8WHg0XCAqOWf0UanDI9gvVS5MLQfyjT8dyxKdfMetGsIHh8cGE6B19IZy93KWTel71kshXYgbq7wI9uR7OLbdfMOMlkYeA0Kxr4SI/6wdMSQC0MNAAR+jAfNjIKsIoLj0ybaakX8kGiyOVvPc0xbq4SF1av4s0296BWQFdXVDUt/CXNi6x/QD0ZNhxtzXpD3g6Qj9HbZ4AQTBArhBNLQI2iLmx7F5YhY/xZYc9XBGdpKYbxpRrqDd0sl9nORiAXlQQ4gTZJjIc7KqgLHOrnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoXxw0d4hV1AU0N4blzSjNRbpVnro4J+x0yHJpEQGh0=;
 b=PfI69A0ToRm/vaKIRibbyqltzRTYJmNvfhHmDlMfInwziAg+K4VnJMTpXqtlg4BBXVqHg/56znqTO8VackMeQPVJaKt99fQHV801tAVIJy7x6QY+9vNEDzzAA2rym+/EFIhLhnKMRMdc8wToyt8yd7OIYXIeoOkHs7uozD3RwtXqDxFO5CkV0nMmf/ykcYnnhUFuQIUd8lnSElsr/aQ8sWISNrKRCCscgAsdC7guFyflL3NTL5kYLK1DuEXHnZeGoUEwdhx7EAPEqTNrmVbFCIDxIEEeyNm+5bTPpdhIYl/z4aiKapaZ/TKESzBKij1hX2tiyWGkXpWz8Rl/dkisoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8555.eurprd04.prod.outlook.com (2603:10a6:20b:436::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 04:50:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 04:50:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem sglist entries if possible
Date: Thu, 12 Sep 2024 12:51:50 +0800
Message-Id: <20240912045150.915573-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912045150.915573-1-xu.yang_2@nxp.com>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: f6498d79-d345-475c-1c98-08dcd2e67e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aFalthhhvtfyzcZSfrPHXV60zWXnzJhTPNaQi6V4nNo/YpuglMRzEeuQdtxv?=
 =?us-ascii?Q?vKbRPW/stDhaK9FXPC1NDJ5Hz2GJ4ara55P59vgdAhmhVGUz1zJQVDx8VEDf?=
 =?us-ascii?Q?zpsCxAGs7Dw0oSL524iVwP4XKtptGrluzfiP/VLTuaghd1Q6kK0RWxvVogMS?=
 =?us-ascii?Q?YyIIK8p7pkXvlmkDXnQ/gl73M1ZSvw+G12Rh0fFKlRdD6/6xM4uMD7abB3NU?=
 =?us-ascii?Q?rUOx5olHYCwrgyvH40tbn+w9xMaABE77ae+3u4eekp7AOPvpxDh6doXVHFhR?=
 =?us-ascii?Q?8k4YCGtq/ApU28nmvL58sBO43C6WKq5RsFlwioMv4BEr9iPIPREcGLZ8O4pu?=
 =?us-ascii?Q?89cN/xfoGbugj2uWCZU/xyPUd/h53fopgwkkgjCXQKTVATZTwsjjFnABApei?=
 =?us-ascii?Q?ujPPjxOwO5N76yR8CmuTqa6ylhBeio3Jv5xIIWTH3uAgC078nT9QzXBrrFrO?=
 =?us-ascii?Q?kgKKnVwYsMBaQGF17GQa639j8Qm2RDdyNhmxgYje3ewpnLJAUEvAiZVUlwpf?=
 =?us-ascii?Q?SNC642brw1buFOXTc0oITjL02riLD7y9tpKMDwBolucyhBE6eJ3oNEMZnVr9?=
 =?us-ascii?Q?8UMri1MXwVeJh8AWNy6IXIpjiBaW0oVLdR/gowhRcbjmAYRWoGmyaO0UHGua?=
 =?us-ascii?Q?2pvNrRFz71wmoXNJmjlmd4K40vG/3cIRAAceWvbFXYSCuwdTGaXdKWkU9nPw?=
 =?us-ascii?Q?/GRpkW4PBpqfycKMeuv73bWpHivmeUGCCQg1q66caawy5bGRnd8E11oyxhKo?=
 =?us-ascii?Q?OgmGc+1KX+R29JQSP1ky0xG/vBfICI40H54e41QHHDjz6kj8GLB2d/4luNH2?=
 =?us-ascii?Q?nIUYHiMyYTQrdCi2Jyg0YMm4+geXkZtnzv8BqRP0D5UCGJhpDmsI8uT22zM8?=
 =?us-ascii?Q?X4uU6PV89mIDd7iEc/ZSwhMw+FyXnSz+UWWcaPA8W0nrnORoWulBQeuQ5leW?=
 =?us-ascii?Q?qUlcyFstMmXSvfOwqxgZVKv27EbLoYuzV6O9HhR/kVLn6//7tJlEAx8qGzjY?=
 =?us-ascii?Q?fJ86j0jOyF+e8o1auLyaUKYAnQWDGeIMQnOmRQu+xwPYzemmh0b/y/G4Doj+?=
 =?us-ascii?Q?xhiTdpvSrHZqNENkT+69hKuSgizVtTnkgMcPyAHW4jiHYNbI0kXtZ9soAttt?=
 =?us-ascii?Q?zWftT5xG6aAsjnAHwwFFADk+TFAR+CeyZEDkqa7rE5IdhygHSTIHheXYeKPH?=
 =?us-ascii?Q?Xkbc4RRbUDDLZNGX8cC2A1/PpRRq0ia1vCKJtsD4XrssHG6fO/UcmyzSyU+l?=
 =?us-ascii?Q?LtmdySkeUKlcmwZ31Wwb0+hRPAuK3A3X2nxRyRQPGQP1fEpaB/rIQcvUFx94?=
 =?us-ascii?Q?DxLbxBxzUGH8It82JeUsLGMJn8sxxQy85qGV3W3Pjjt5fZwee2kOtxRo7zKW?=
 =?us-ascii?Q?WdXclJ0ai2t8ibSv5KaC4Fa87UooRh8tW1WhN+Pow4CjDPVj3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5cX36YJdSn4RILW+DiWn1epKD9P+e+uhfsRvK6kClWB4ZFKezg+9b2qJz6Fw?=
 =?us-ascii?Q?iPLack+uaBsa3ETCioc/GyY2FC4gMEcSKKZAvNe4ChzczFCPSta0siRCDKqQ?=
 =?us-ascii?Q?FGfUg3KgcOH7P3z0MqF0yRvwRzD8dsi81uyKx8Z2lJwZKBctRElv0SxoQMQ9?=
 =?us-ascii?Q?FltmPN631qr55LPTWJW1HlHnFFSKXPBqE/pyCbK346CSh9YgvK1Fcc2YatzM?=
 =?us-ascii?Q?KykC4fYGCpRXIMQkFmzOA88EwcbEg4axUSMeXcGIvZN9MId+9npsD52V6jrd?=
 =?us-ascii?Q?uAxgxxEe0vJ4IGx//s/yN3MU7olMowUJjxLi7pGNr/AqcupD3sl09jSFFYuN?=
 =?us-ascii?Q?MtWf/MTW0muNk8G5mCK2s1Ck0itAZynE8r4fdUgvDBP5b5s6TYjv3Wsym5wr?=
 =?us-ascii?Q?d3rJablK6RwUEI/44fmo/9w1YWiWG2y6ZhTc77/m2xQ06Y/g//IcZkazrFP8?=
 =?us-ascii?Q?5aROTE3ep3gvtvheQDCDgnORwtqd/Sl2obE32GIf0Y5TTgDOooJf7gAH4khN?=
 =?us-ascii?Q?O8puZGkiivEvu6tpczFxRAOVeRZO4hS6lwtAYfAS54eTBRaIOgnTbdUQH8KE?=
 =?us-ascii?Q?GHj4UM8de4Uotwg47bmrDj4agC1QcKUG6C+KLsvhNwkTTTrqVup3CCuoQbdj?=
 =?us-ascii?Q?Xz75bfsOdWOwY5ymYSMZoe/tPP5hBDRjvbDY6TwOhKGVUTLSn4uULDRBqmJi?=
 =?us-ascii?Q?y3UNNZ/UgTJg6NV8v5AcJppTkd9aG1icyo/0RE9HD1NaJ4rYZAvANrA3s3BW?=
 =?us-ascii?Q?mpB7qzkX+Ga6IIENlsGJWYxIS+Mh7zwxC9kJAbdZUjGabauBRxX3l+1y/3eA?=
 =?us-ascii?Q?5BjeCkxpmmPVwSVIuEINoVRERSSfa+9uG/x62IcDjBOLQ3X0r0SeVJkMEpXw?=
 =?us-ascii?Q?hl10jnO7Ccc6niJICv8l/NkZt39fItfV0CYj8bp7xTW8vjz/YM+BEf7RhYcd?=
 =?us-ascii?Q?TQYCwkc6cgQHDFtUlAypfS2PcKJTjIG/kJdPJdDp4cDWp8P1iJ1TcL4NzzKo?=
 =?us-ascii?Q?0P0Wi5f01GxkoWaJmtl4i5le6uRNj9HJb6e3o5bUsrbGTRMy9T4JjQuW2S2T?=
 =?us-ascii?Q?rxgLQtMw11oC4c0KQcSLIRoYDW3zQwzoxVFq/TKSHZO8qkUEH2Ysz+qd0R9X?=
 =?us-ascii?Q?rOSGBKbX7BqOkCVlXC4Y4kANykPbMNXUFPhUTNhIBOdtWFm5uC7oT4vUeLLp?=
 =?us-ascii?Q?Eo0RekP5KAUNHWN0hx8H8tKHUtbdcCIIIiRWAhn01H+7jKFKqqsBRRLRi2By?=
 =?us-ascii?Q?5Fo/9JYlW0jnCwRG6F2QpmNdLXw6eXutIP6LtW4aRo0sz7cwWc1FEniQ0qpP?=
 =?us-ascii?Q?9KA7ih8zGHINBlQ6F3D4cTNEXpL3aScb7Sj5PDcGRgmCSU5DePTVFcrXROfh?=
 =?us-ascii?Q?UunGINFWx9l8bDLlcuMa1oqzh5906VouQRO+mozKF3d4QV7Oc4c5UH0tKI0J?=
 =?us-ascii?Q?RPmsHGcBPwpJnu54oMxwsN5bkLfYSZODJjtzhn+gJr9cil3N1QI81tUtIk8j?=
 =?us-ascii?Q?Ro8LrMqf7Jcnv3KPZNKzAlfzHWpzK9UkbCMfIAeDu2BRyDqw09mXlRcavMoX?=
 =?us-ascii?Q?4Qr5r3Xg6wwFVsYeryYOUUoTF3K5JNC0boCS+0Gr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6498d79-d345-475c-1c98-08dcd2e67e09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 04:50:58.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISw33SJPP8AyogwCrEgIk3/TqVdizTq4o6EpGveUMKfjzQ36PEx83EAfIQyJ/6ASX4DI0uP4dORELHD8CDg7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8555

The chipidea controller doesn't fully support sglist, such as it can not
transfer data spanned more dTDs to form a bus packet, so it can only work
on very limited cases.

The limitations as below:
1. the end address of the first sg buffer must be 4KB aligned.
2. the start and end address of the middle sg buffer must be 4KB aligned.
3. the start address of the first sg buffer must be 4KB aligned.

However, not all the use cases violate these limitations. To make the
controller compatible with most of the cases, this will try to bounce the
problem sglist entries which can be found by sglist_get_invalid_entry().
Then a bounced line buffer (the size will roundup to page size) will be
allocated to replace the remaining problem sg entries. The data will be
copied between problem sg entries and bounce buffer according to the
transfer direction. The bounce buffer will be freed when the request
completed.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 147 +++++++++++++++++++++++++++++++++++++
 drivers/usb/chipidea/udc.h |   2 +
 2 files changed, 149 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 5d9369d01065..dc4dae2c31b4 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dmapool.h>
+#include <linux/dma-direct.h>
 #include <linux/err.h>
 #include <linux/irqreturn.h>
 #include <linux/kernel.h>
@@ -540,6 +541,126 @@ static int prepare_td_for_sg(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	return ret;
 }
 
+/*
+ * Verify if the scatterlist is valid by iterating each sg entry.
+ * Return invalid sg entry index which is less than num_sgs.
+ */
+static int sglist_get_invalid_entry(struct device *dma_dev, u8 dir,
+			struct usb_request *req)
+{
+	int i;
+	struct scatterlist *s = req->sg;
+
+	if (req->num_sgs == 1)
+		return 1;
+
+	dir = dir ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+
+	for (i = 0; i < req->num_sgs; i++, s = sg_next(s)) {
+		/* Only small sg (generally last sg) may be bounced. If
+		 * that happens. we can't ensure the addr is page-aligned
+		 * after dma map.
+		 */
+		if (dma_kmalloc_needs_bounce(dma_dev, s->length, dir))
+			break;
+
+		/* Make sure each sg start address (except first sg) is
+		 * page-aligned and end address (except last sg) is also
+		 * page-aligned.
+		 */
+		if (i == 0) {
+			if (!IS_ALIGNED(s->offset + s->length,
+						CI_HDRC_PAGE_SIZE))
+				break;
+		} else {
+			if (s->offset)
+				break;
+			if (!sg_is_last(s) && !IS_ALIGNED(s->length,
+						CI_HDRC_PAGE_SIZE))
+				break;
+		}
+	}
+
+	return i;
+}
+
+static int sglist_do_bounce(struct ci_hw_req *hwreq, int index,
+			bool copy, unsigned int *bounced)
+{
+	void *buf;
+	int i, ret, nents, num_sgs;
+	unsigned int rest, rounded;
+	struct scatterlist *sg, *src, *dst;
+
+	nents = index + 1;
+	ret = sg_alloc_table(&hwreq->sgt, nents, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	sg = src = hwreq->req.sg;
+	num_sgs = hwreq->req.num_sgs;
+	rest = hwreq->req.length;
+	dst = hwreq->sgt.sgl;
+
+	for (i = 0; i < index; i++) {
+		memcpy(dst, src, sizeof(*src));
+		rest -= src->length;
+		src = sg_next(src);
+		dst = sg_next(dst);
+	}
+
+	/* create one bounce buffer */
+	rounded = round_up(rest, CI_HDRC_PAGE_SIZE);
+	buf = kmalloc(rounded, GFP_KERNEL);
+	if (!buf) {
+		sg_free_table(&hwreq->sgt);
+		return -ENOMEM;
+	}
+
+	sg_set_buf(dst, buf, rounded);
+
+	hwreq->req.sg = hwreq->sgt.sgl;
+	hwreq->req.num_sgs = nents;
+	hwreq->sgt.sgl = sg;
+	hwreq->sgt.nents = num_sgs;
+
+	if (copy)
+		sg_copy_to_buffer(src, num_sgs - index, buf, rest);
+
+	*bounced = rest;
+
+	return 0;
+}
+
+static void sglist_do_debounce(struct ci_hw_req *hwreq, bool copy)
+{
+	void *buf;
+	int i, nents, num_sgs;
+	struct scatterlist *sg, *src, *dst;
+
+	sg = hwreq->req.sg;
+	num_sgs = hwreq->req.num_sgs;
+	src = sg_last(sg, num_sgs);
+	buf = sg_virt(src);
+
+	if (copy) {
+		dst = hwreq->sgt.sgl;
+		for (i = 0; i < num_sgs - 1; i++)
+			dst = sg_next(dst);
+
+		nents = hwreq->sgt.nents - num_sgs + 1;
+		sg_copy_from_buffer(dst, nents, buf, sg_dma_len(src));
+	}
+
+	hwreq->req.sg = hwreq->sgt.sgl;
+	hwreq->req.num_sgs = hwreq->sgt.nents;
+	hwreq->sgt.sgl = sg;
+	hwreq->sgt.nents = num_sgs;
+
+	kfree(buf);
+	sg_free_table(&hwreq->sgt);
+}
+
 /**
  * _hardware_enqueue: configures a request at hardware level
  * @hwep:   endpoint
@@ -552,6 +673,8 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
 	struct td_node *firstnode, *lastnode;
+	unsigned int bounced_size;
+	struct scatterlist *sg;
 
 	/* don't queue twice */
 	if (hwreq->req.status == -EALREADY)
@@ -559,11 +682,28 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 	hwreq->req.status = -EALREADY;
 
+	if (hwreq->req.num_sgs && hwreq->req.length) {
+		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
+					&hwreq->req);
+		if (ret < hwreq->req.num_sgs) {
+			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
+					&bounced_size);
+			if (ret)
+				return ret;
+		}
+	}
+
 	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
 					    &hwreq->req, hwep->dir);
 	if (ret)
 		return ret;
 
+	if (hwreq->sgt.sgl) {
+		/* We've mapped a bigger buffer, now recover the actual size */
+		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
+		sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
+	}
+
 	if (hwreq->req.num_mapped_sgs)
 		ret = prepare_td_for_sg(hwep, hwreq);
 	else
@@ -742,6 +882,10 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
 					&hwreq->req, hwep->dir);
 
+	/* sglist bounced */
+	if (hwreq->sgt.sgl)
+		sglist_do_debounce(hwreq, hwep->dir == RX);
+
 	hwreq->req.actual += actual;
 
 	if (hwreq->req.status)
@@ -1588,6 +1732,9 @@ static int ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 
 	usb_gadget_unmap_request(&hwep->ci->gadget, req, hwep->dir);
 
+	if (hwreq->sgt.sgl)
+		sglist_do_debounce(hwreq, false);
+
 	req->status = -ECONNRESET;
 
 	if (hwreq->req.complete != NULL) {
diff --git a/drivers/usb/chipidea/udc.h b/drivers/usb/chipidea/udc.h
index 5193df1e18c7..c8a47389a46b 100644
--- a/drivers/usb/chipidea/udc.h
+++ b/drivers/usb/chipidea/udc.h
@@ -69,11 +69,13 @@ struct td_node {
  * @req: request structure for gadget drivers
  * @queue: link to QH list
  * @tds: link to TD list
+ * @sgt: hold original sglist when bounce sglist
  */
 struct ci_hw_req {
 	struct usb_request	req;
 	struct list_head	queue;
 	struct list_head	tds;
+	struct sg_table		sgt;
 };
 
 #ifdef CONFIG_USB_CHIPIDEA_UDC
-- 
2.34.1


