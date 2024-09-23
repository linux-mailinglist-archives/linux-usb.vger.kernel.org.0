Return-Path: <linux-usb+bounces-15303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 039EA97E74B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 10:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C161C20F3D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 08:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF6C770FD;
	Mon, 23 Sep 2024 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O4GzTVk/"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075DB7441A
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727079074; cv=fail; b=ZuZzRXemUkpAI4bzBZJqmxyjBg/OsbiOLydt0C5ELQ3Yo5i1r+CVGxjPgpoO15WfthlGuVM9qMPYuRpKDhKAuv48PwoSj9KRPjSZYqJVvNXoCS/nFcpAROaGbI6VGbzPMaTeCy6W5+SwWGYYavM+n08ZZA0FG2ea1BgCuXrZNmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727079074; c=relaxed/simple;
	bh=Hfqq2gKviGZoX5M5SLxYQNMsXxBIWmcuHVEMBwtQkNE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G/80Oi9CzCMe5E3xRXblDfpXc0jragqX96TCYKw8fD+M7YQABE6aUwuNVBIryxeWWdjc1X9UZP0x4t8UN8w8m5wiLMj6vkYZSIx4xdb0iLGb59Plu8oBhyGyeSvRU3Mq4lsz7mSD8UVCB9um5zwJ/7Um2vMeYNxs3rgA4ly+07E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O4GzTVk/; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb1BY5p0Vr5aNYAyEs5XhtZhhkpjt0kuawbvkj1R44EuGpawZjIlcoDCilitOSdnn/ekoUIenx4TKbhGjv1PAdRvIlHYjahqrN9UQuq1zECP2iuw7QjR4RleQBlxB6egoth/5BBDb81G2DyqJBrB3phNHeViXos8m45af2FuviUOocYuQp2Afhp3vcFV4dsZ7i+dGu4U3bUruPNr3ZgZH6c6B+A+pheuLiUZe4w/urG+HpmqqAcTJ9kECbiylp/qJq+td7/iBlh45XRASqBGOnVDS5oCcpwjbzG3G4HnfXQHS/Rrinb4+1mWjHPjcUJXdCRl0d1Ofq1FAf7B539UQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMhZP/5QVHjnuanH9acnHrgJyprB/uX6cWEDIRp0jkA=;
 b=nWQU2fq5r/RcvNsx8TVA6oE2bpn+SjosngBsFt6ICJtKBvFJHJ+3CG/Qyx65pVOKGvm/Mpwhbpybaso/fpWywn0bbqp/m8a/wVFfgUduX30momuHOR08fHPmgWgt5JYxNoKC2OTp7ydlRaTMAZa9HP7TCN8T2sxZTcjVN3FwFPNcrSr6HlDeFWIRsxlk6E5gMdrBFKTVSl95gTZJyHqtx00GmK16b8eJ+WsCyiuJNCTqzbkaJPC50yg/XboEUjbbya3cxPMSHQ1Xe6uQ+xZidFTlPojYvwE7U0ewky5tJuOT/Tf370g0JYU/0Dd0rNqEEWl1rOFwjMvQJxZ3SiRodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMhZP/5QVHjnuanH9acnHrgJyprB/uX6cWEDIRp0jkA=;
 b=O4GzTVk/ffbv7rI3vbZp6cgXb9z6sNIR1JjlxxHChr230AFldyd0oOqS0OCyUWpvJnsp838DZMT5qIzKYpBSMp8uFtL7foya49TW3CmM9PnAQ3E9Cr5UpTQLDGUuRoAjAqEUZT+hWcRMq7GS+jfkIudfiq0qi6KjwbClmO+sTP1DNuXrAK+eOO1oEkdUPM9V1TbvXcDQKKQBc6S7VtjbQciEUqU4Xc3QUiqsDHzxrGZ++cv1XlzZg2C9oHWBVAe51fxFY39i4ZsuffXHAde7ml12RztUUbAiw2HMJBYz/s+biLtLYdGWsjUWK8DR3KyG3YTqHTQktmTHK9wsRtfxww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 23 Sep
 2024 08:11:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Mon, 23 Sep 2024
 08:11:07 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 3/3] usb: chipidea: udc: create bounce buffer for problem sglist entries if possible
Date: Mon, 23 Sep 2024 16:12:03 +0800
Message-Id: <20240923081203.2851768-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923081203.2851768-1-xu.yang_2@nxp.com>
References: <20240923081203.2851768-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0237.apcprd06.prod.outlook.com
 (2603:1096:4:ac::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c892ee-7128-4a1c-7535-08dcdba74674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PPopRSKxg/QXwTix4X8Wp3S49lrve72aPFe23dsIab4D9eKb9CnDrKMbUQ8f?=
 =?us-ascii?Q?en3Fvgr9MGoEjAAJ6u5rnbgX+mwdsF8gyowOqEco8LvXd1dhSx45x9rgZLQf?=
 =?us-ascii?Q?H4N5jSqecKYFH7FkazCdLCI49lHX+T+nfTPUJzcRi/7Gn/5a2opbL5yFA6qo?=
 =?us-ascii?Q?qWGK9/CnO8RxeZNNESI19I8OgiHwRYLieqqweeGUl47ku6YVYfbIWXWJXipV?=
 =?us-ascii?Q?ywaRgpqtEu9PWVhaZ955QXTa7BMNZBpCDyp3nksZYKIntHq3YndlVFwfYEVg?=
 =?us-ascii?Q?yeDKKhwARujcWMVN70ZS+RxmkRgGVX5eNBkoX4zbxE9evG8uYMdB9j5xtkDB?=
 =?us-ascii?Q?WQo85xAJkaRw1k7n8kBDKPGoeve9E6zIPaz4uxGLh+ohDLdoeCvcIpzJ6dUI?=
 =?us-ascii?Q?08t+DWDd/70Q6g0W2X2TfyT+qGPB/rUgU6uX9ZAwx1GkCocZkg8GJXxoocnb?=
 =?us-ascii?Q?wtPY0X0pWui5pYYJqyU5UjXpeUaaL/wQgV4po92tIBvCkzCB7GaxI0VDAWWN?=
 =?us-ascii?Q?qKVWyXH4eRSYwUH9ztEmTx4ZVRo+MyPhD/ZwUAgMEgBXUOCsVObp5R6hn/JW?=
 =?us-ascii?Q?Q7DBdD/OcILFSU1yn35MCkM/wx25ti3yD/44MEMKEDi8rItLubFsaYYhrTXK?=
 =?us-ascii?Q?XiS8FkUGry077BZ+DOi8raiF/379erW5Bq+PZq6ALF7LLHgEAA5v3kKAIDBd?=
 =?us-ascii?Q?fFuQXd5DRqyxEFQoyEpqVMkL970FTicw2HAH6jSm+VoU6h2hNwsCtzdPdiyX?=
 =?us-ascii?Q?6QgsFy67kODFN3cU/TGaDpir0KEDtp9qbeH7EiXzhI4TRaUSpW3gxG5K1h45?=
 =?us-ascii?Q?Ss9v04Vs0ebDMWTVNdFFDCB9MlwGolBf2yooBMTDKlAL/4suB7qfstc43Wrr?=
 =?us-ascii?Q?eHcfkg5jhjSjnVWCfG1oCmbalabolvc+1cXr51Be8UMbcGlUqZZFQG3uUtan?=
 =?us-ascii?Q?LYy7I1/qMvsPx7y9XoUoInSeITw7ONPJdxZtT53Cu/H97qa+2/PdFuBAjrAr?=
 =?us-ascii?Q?9tW2ltjx01zom0PfiXO2mQJWNgS2b0pfO8MIrVlUq3AsIReLucO8L+OstWPN?=
 =?us-ascii?Q?5edj64QgI/mk03gqTUKoAfg36b55Sb4jaHjlNdOqp5t3aFFv4Jm+WQJgH1AX?=
 =?us-ascii?Q?KAaJ30ykso04XzsH8/DysjcnHlUgbn4zvL8m6tw0gP3TRupeHGRkXvfnTn/w?=
 =?us-ascii?Q?k5NqwWvv36NqC5F5fIgE2V1ytMi6H0AdJaSVfMZw+Msv05RTfLT/FRIg0Tk+?=
 =?us-ascii?Q?uT+cr11GmeHHUT7QzkARB9irXn8pCJRBwxzP/+bFG2x2vpvFndIQTCbsDBF7?=
 =?us-ascii?Q?0pPJ/qBT0Owq2FpI1DxYmk8qOZG6Od/JqzDBkebOrWavWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TnyJeZ5yGsKQqLW6OcFiBRIJF7c7OIZP4aZir1VrNHdb9PXWjSKd2ibO9Vbl?=
 =?us-ascii?Q?yBc8B2zJBK8G12JHsulbPqocJAsrr/VJVO6Haj39l60+28JbHn4hiwHa0j+9?=
 =?us-ascii?Q?j/7Tmbeh8EV/Nsg8V8UHebGOLEvNBakCIW43pAyGqz+nRhXn9oE2gEgdnMBH?=
 =?us-ascii?Q?MDULWs1H26tEngCU0V4dLA4ZcmJjc3ZCS6ihQmL3OENOURhdyGHv/oFoW62z?=
 =?us-ascii?Q?WJ2b4rggcW+9V011GDGhC8yqUBZZI1QmunPVc7Zcw7CuIysWv8/D50t6dLcQ?=
 =?us-ascii?Q?a9WDQqYLlaSeBqCEry3nwU4BRr73CHrHrLeN2XxtVesOKYoosonxv1I+mWf7?=
 =?us-ascii?Q?IN8QHp7HKh86yO0hU4iP2ToR5SuJS1ZjB06JzIb9vig3Obh4Mu/qD/gcTh//?=
 =?us-ascii?Q?8FV0pMQE6zNPI4kY9DftqLtZmRVEz+kdKOhO8pgR3zEAlftebXDut/8eVcFH?=
 =?us-ascii?Q?OhvNm+xAkpB8kSBHkwS5JHQOtinNdmbJk1oafpI3qeR/L9uKHZiOxg8Mi3fJ?=
 =?us-ascii?Q?GbGS0aON02uc1T77tTxpCjm0WxQw8eQEST5T/PjdqHOfV/+GNqdNhT71P2Q9?=
 =?us-ascii?Q?8I/SH8AHkcELQHNCJX639OWjsi4hTD/IrE9emIY/FwR2wU1LOGllX2atVbug?=
 =?us-ascii?Q?kUwNbykbSizFzoxFgoYtQiqU/vO373CLU4R7OQwlt6UPfpZV3UIlreU0h7WV?=
 =?us-ascii?Q?R3rIQkbnxlB9effzqkCTAD2PbvKrvi8CnLHk2W70KGL3XA/jfGGNJh6fd/Az?=
 =?us-ascii?Q?Cksyh2aCHsGN1dp9n4vtNFzhy8PTKG5d993rrFjhnkU2mCKb/khkb0XvVYhg?=
 =?us-ascii?Q?FUMD2jI30HzU4o2u+CfJVvwFmJ3RLC4GaWDHsQbd8J6gelZXR+Rcaj3aULHi?=
 =?us-ascii?Q?BcLkKBFP0sJr6MxDM151adY71dnd3kl0Gi4n7Kyd+dgIZQCDAWxWxmtTJs5w?=
 =?us-ascii?Q?dqq2A26CICnxY12BTX56BBUqGXLVQiteb6hOu9R4tp6NQlv2PMvODv7X6WPr?=
 =?us-ascii?Q?ELkUZS6WYzbuITPgeIv0eiBhLbM7OuVOxwliclS7G2YqmfTQB+G8SXe1SnHP?=
 =?us-ascii?Q?bOqvhMBjdEoY/wfWhghASEdBvQu+04c3DkiWjWetacHsIpEWhHwIIAXhQe65?=
 =?us-ascii?Q?Dy1YQQ1lHNPSOn2Gs4zYjtwVyODacyW9M2AiLKMu9IefgQZoWqVsjJWR5BXB?=
 =?us-ascii?Q?8R9vTTatxnTqUDvCoZij7jsFkxoT295eKi8yWW5ghklRnCyJoDv/BxUhlViU?=
 =?us-ascii?Q?GB50N4Thoj93Y0N8G9nciaPX66AGGrmh+3LYZnBg0560RvtKyb+WZY1nOMSX?=
 =?us-ascii?Q?rdVgaPnc7WMbgP8NQxhbN8KF7eRvlkmE0aFoOntd/XALcHQnIEruaPFz9ePb?=
 =?us-ascii?Q?/wtMDr0BR9tYHVd2/z3KXsP16IWR4wWPX1RlKqq3gRBg5eWYYNfWtA75Zmg/?=
 =?us-ascii?Q?h4p3oLvxc8mlKvKEiM9JkaAmR7Fsefm2WKvTepZmQRmNEFcZcTE4rSNdAxXA?=
 =?us-ascii?Q?NLVHaNQQj46VnAnz5TasAvfdTH0nYXZupWUGafvok1qZAZO4xEsJ7hmFP0qx?=
 =?us-ascii?Q?XTvd5VtzETa+SOarrBKKpbMXwvOT2Z3MslR2tDk5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c892ee-7128-4a1c-7535-08dcdba74674
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:11:07.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xN2/3Rxg1mCuvzTPAPs+ePi9jGSAI6hMeDEQHAgrqa1vK/ADk/rcMvFHrOdtKnj5jbICF7+sfB3vF9toSn2Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

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

Acked-by: Peter Chen <peter.chen@kernel.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - judge ci->has_short_pkt_limit
 - add Ack-by tag
---
 drivers/usb/chipidea/udc.c | 148 +++++++++++++++++++++++++++++++++++++
 drivers/usb/chipidea/udc.h |   2 +
 2 files changed, 150 insertions(+)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 5badb39cb2bf..8a9b31fd5c89 100644
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
@@ -559,11 +682,29 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 
 	hwreq->req.status = -EALREADY;
 
+	if (hwreq->req.num_sgs && hwreq->req.length &&
+		ci->has_short_pkt_limit) {
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
@@ -745,6 +886,10 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
 					&hwreq->req, hwep->dir);
 
+	/* sglist bounced */
+	if (hwreq->sgt.sgl)
+		sglist_do_debounce(hwreq, hwep->dir == RX);
+
 	hwreq->req.actual += actual;
 
 	if (hwreq->req.status)
@@ -1592,6 +1737,9 @@ static int ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 
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


