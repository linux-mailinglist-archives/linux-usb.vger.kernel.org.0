Return-Path: <linux-usb+bounces-17417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C79C3A73
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 10:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 718752825CE
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 09:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACC9158535;
	Mon, 11 Nov 2024 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PTvCKwjd"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651D170A2E
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316174; cv=fail; b=eHX9T6LXEzf3en2rJzt16KQ0OJgICaCWbOAjuRJGhyhPAqxf+AdOvOXzSZbdW4eU7Jsb4mZK59thSDEwVu4P0GiF0Z+2FSwXtWlCqHfrO7KzSIkWZ5jZQCw0ejM16FBg4NzP/rX3UKsLP3zjAREnFSUJwVDdiTrn++VScRNuPlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316174; c=relaxed/simple;
	bh=Gu2tDQt1ZWFDNfmb02YpLiXLk/79q+sXhxH0IwuvBXI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qYOeDWkj63czEgowdH16ka7d4RID56C7veVI9+jZjtI57FnRHsE9affKFo6SfQ7pR4MeYGLc0bvtFmJHxqwOgzH0O+tkH+5bS52AHXGYk+ctYKxFbefxan7gxMGYfcwNQwq4Q1vs0YzD/W2ZiSnPZ4y6ajsQuwHYx7ik01rAvU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PTvCKwjd; arc=fail smtp.client-ip=40.107.249.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQLjMuDSnWMtL2W+qNcURhHAmVff177UNw4n4G7alekTxm/d7LvOnLQ+908KsTeLI3VOYoXnutOpZyKQ0BKe2OnK4F6MZYPnD4KXIwdTQOpxXbZu/GZB/oYjY9mJ/ioWOXMdW3Q0C16PEEQYY4J7VXlRy6d8i4ZajTdGWx4v+s2rRrhedcfK9ugU7Sy3wclWp9Os+YYTrFTikDFJlyz+5yEJMgznGvDAcXL45H/77ufExveLAMh43dGZw0kTnSM4XC8+4gbX6MKVmmWtgEfSaF+8SEVxj/Lv5Z58VQmK7pTrq9Rxx5xCByiw678dNnGt/fzmRXTfRQPDk+y1Gr5EYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MW1PmgIh9+tbUoVzYK17ziAHvT3mllEN49CQcfhPsGc=;
 b=Ot6vIKqiIX21GHseEsPEQ52wWGkX6nBJyAdeNkI32qw37iHmLgLHOPH7YOPbI8uzvIr9HlCtnRz0uXYzm2fLHfFyWnpAE2IDAgFMJGCOxoVybuNQ5KV7Wu9R8h4qZWzZsdbTOJBWgfm6Bv2fGbokhwF7AtMciEjtX6Fxev4YoXXv49+R8D+u2UWdXCb9c6ygIq1fFbxeoNcqayLf/iX2SSzOVsLEevFjP7Fedipz8ipBrzAExvg8lUGRklPDiPtLknJGj/NB/Xg3lftWxxp77/Y74CgjrKgGB+X4mTzi15FM3XqlhebAYr3xXBlgviCUVLjpD835I31PYFin9HijtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW1PmgIh9+tbUoVzYK17ziAHvT3mllEN49CQcfhPsGc=;
 b=PTvCKwjdtV8TgiI1no1WuuxXFSF83IInN9aSVbx7ihBVABgT2LJ13BuwxCd7QMq0d046d0e4cQa30lsxjbA8X0e5Xs+NbiBqI19gyg5UnlO9Cdm+LNPAnL1tZui+qD2h6k0vZWEMWoSDsDQzrhvlW1A41j3puKAptO9zDDP68N+yoPcPtOsbziHyFrOZ/WD03ghGs7O7aet25s21K2nZmvPZKbnLJruPoH0Rpjm5Ny7kP+uRvuV5E/jT1yCbQsOhAGN59OgQlYvNZNZtgbRtkTH5B153NRoGx047rZmMoB48WUGBpEZ/JOORVryOJ4e4oxHHf7M3djBkeUDU7irrcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7712.eurprd04.prod.outlook.com (2603:10a6:102:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 09:09:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 09:09:28 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: imx: add imx8ulp support
Date: Mon, 11 Nov 2024 17:09:16 +0800
Message-Id: <20241111090916.1534047-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fe6084-ab94-4d21-880b-08dd02308b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IY+P+X5NcxgBnawgswjnn9OK8QNihrA8F6V7dROZ+/DXidtIfg1G3rY5OzwK?=
 =?us-ascii?Q?igfy4O72RbUQY7xonqwYPKYgv5Pswv9gf7OFMJuZEELl669ve38O8bQpMGe+?=
 =?us-ascii?Q?b3mVDOQ9qMpwUPup5ASzD+bgf9rL0k/GFwB49S7wxDw6vQFl8YldANJEyf+S?=
 =?us-ascii?Q?4xsMk4IRu6qUbYiUa/QTnZg0CWdH2vGiND1RSIQs1/Mi0mUC5O08wrSaeJve?=
 =?us-ascii?Q?rHHh6Nn1eW5TUtrzi64AeXYeGaVUmcm0boBwdyBIf3XEw/c7nqMhL1HKmx+m?=
 =?us-ascii?Q?2V3Qvo0OI6U87pF3aX5memLbBZjGN0y67mTku7+Z7c2XUprKghTYS4wuenLL?=
 =?us-ascii?Q?5h31KZfVvedATwZIdrppMI/cMjCfawiMAVlKHVVJCs7JyRJvI/X+XdjORx5e?=
 =?us-ascii?Q?CypNCzH8kzYqxxT5jo88zNfK0UKST3uM0YBHqXdCHzJSjTKgxwY7VPRiHOjO?=
 =?us-ascii?Q?ncJrVfaBoYEsCpc3Y+sUKA9mbcOj6Zm7L+9yJAzK1Q+CVMHAFOACiSDjGStV?=
 =?us-ascii?Q?8UkbVHja48YiZU9lAcpGr/gAilT9rrLbV75IId+IEET80Xs1FvVSwH7YGKbv?=
 =?us-ascii?Q?cjQfzSBrolleDfWAUry2vvhK3p3xE+M6dY1C/Tz2Oya9pxWo7JFI+l9ooyeN?=
 =?us-ascii?Q?fGakS442thhZolMvTTwPG/5mUJaew+TekTdDf0fLjIKn4K15vE2PSQvM9Nbx?=
 =?us-ascii?Q?J08fUSlJqJ8sDF63opwfKkc2WB6kY02usjwRRWG7MryitLh+qtPv1rPzhxWk?=
 =?us-ascii?Q?IvN98d8YYe7paERYCkagLNV7iFjn2rZfoqqiJASh8/UrU7TMTH3HkJbeubkd?=
 =?us-ascii?Q?lRUKxtXnBsqxrani2doEJDUnuyW2TePk8+SOAEHyXFBFV4hCWVKWB58DgCWh?=
 =?us-ascii?Q?3rxXPXBPiaQKezAlJxISvK1L1nHz5P7pEOt8G1+efIzt+OHFwfo0ttxeKOmP?=
 =?us-ascii?Q?eNxwToCRJMGyQykRF23uE+IHt+dHKpBQiohjAvd5dTLgTDxy+2X2FJND77JR?=
 =?us-ascii?Q?c6hbUU31ahcQmZLvXqEotO8phTWM620tRcbfKr9qHgBTydMaHCDLgirn7poq?=
 =?us-ascii?Q?SS6BL6NiXw1NSZEzW9syMzCQuWvIqHolthYei0aMjBZPOrY7RzyeeG8nxSuT?=
 =?us-ascii?Q?tcXn38zXqv2nqvnykMyRuF1yCSqIosuqEmzAcuuwAK9cwqImUkjE0kjrdqUa?=
 =?us-ascii?Q?N4olRwkn38WxaUKerSKOz7ocJsKC3azaiN3atPFOuS6OUPMj7CDqfb4HD1yg?=
 =?us-ascii?Q?H6i7LHvVdNgfS3H5L6j/QLlZUlbKbsBhmjurBmT3h1CHNFCmJJmxBTdKV6as?=
 =?us-ascii?Q?n+P5Ie/wjWUgIypfS01SDksuxRtYCn5+eUZ17kSKrq9KgX/iNNJ9ogrm9+ml?=
 =?us-ascii?Q?mdFOE5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0dyqsjGJ4ZxzB20CnLokYLu6Ham1nLYh4T1Ss+R3X/YwaoG0EDTVMVaKCyDo?=
 =?us-ascii?Q?SqCSxh4Z6EYNDXqfRfgERVUVZtf7onDhVzqgRbvv0nO+q06Iz4/LfvuEkcyL?=
 =?us-ascii?Q?wb5CE4StuSZCOhx+V6cRusrSXhFhx5Xw0APsxP2qBUp5hOqzBOnZtm2Elafp?=
 =?us-ascii?Q?X2/nn9AUTFRUj/wSV4d8ELdGl+2/55oNBS1EMDc0xBNWtQ0ni8WZEY2eTzYj?=
 =?us-ascii?Q?wo1KQ8naMhMt8DFbtNZHrUXYxNUy1F/3dDk2sxToUjVlULx8ga7BUCrygo8p?=
 =?us-ascii?Q?88HWvEO1FYyww2ymCmhieIu5cdt6F8HpQ4Qh7wGNSd2QQz0sllef1A4omrsz?=
 =?us-ascii?Q?JdExns8/kze+LCfPS+aah8uMeiHXSBmC+2WWfqES9fjd/gUb0853gAVEtSPf?=
 =?us-ascii?Q?4ntZhqvTK8sBtkfUp58Z/2TM+F8TR4gzulycCMCNNFTpfHr668hF9KlzMz2D?=
 =?us-ascii?Q?y7EU1JzVGegVzewJ1DFc1PSrS/Ze7Phe34STUiWdtNQWDOSVQz+aAhQF32Yi?=
 =?us-ascii?Q?/JKAwJfqnOgvozZ74O7hhbAehqsyFIXyuaOkKQY41C7EGQ0RUxeqZWJUgy3C?=
 =?us-ascii?Q?wgyyjJZ/qoBQDv8NMhsc1vQmNQvgEJzT1rg2pwZwc2qXpUc79+RrtebITEQB?=
 =?us-ascii?Q?bv/l97kyK9czEkW9DPhu2iNdGdJQxUeKQAMDJQIu01PJYPYFwko5ff9JpHgk?=
 =?us-ascii?Q?J05Ay+052GgmtSyEqjNFU+CeUfrYYYNMfhivexi1rVipTe/jCKAfnyVPT/XI?=
 =?us-ascii?Q?wVarDpCTC0KFhxPb9V0ttbK1AgkfgD5lj/lR5iQ2k/eg5C51d9IQTf4p76ZK?=
 =?us-ascii?Q?6WX+6f8YAwfiBpigA114l5c0ILPFWCcW9KJ8MNSh9fo09e8s4YizT/gheglJ?=
 =?us-ascii?Q?YJEDeEtyHBYeagsm6OABNVO9solBanm1kYg3qOJy4vO27q3hj7lDVknkPp1M?=
 =?us-ascii?Q?xccpxJMPwyIVcLsiAihC59ZeQFtb+MgftY8qcJ4MmKwyH48vIDcYOfz4BZ7v?=
 =?us-ascii?Q?wKjzNJsXD70Kwa+6yG/EEQYSZTYWNQ6QLjKa3iIFzUae892gK5nEJlQcGT1V?=
 =?us-ascii?Q?w5eZvA0qnfpbtcIy0taoBMbOVTInxITFOk6dfVxTuURkQ1KrM4NF48ds5Gzt?=
 =?us-ascii?Q?p536N9VjJAm4rwEiQOUEa27pl3EozD6fef+rZTA4Y/Kf68iUrOuBvjyD+SW5?=
 =?us-ascii?Q?8V8hx2AkCdOTJvvH/xd5gc9uPRZNPNpk3zAb51QtbHx5xhoUuZng+X9KiTmb?=
 =?us-ascii?Q?xv1CWrozDc7s7ew3JXnYgNHrh14Iyht2Iy3jYLWxdjH2XmXHjEIRWFyEUdrM?=
 =?us-ascii?Q?Gyb06dIYUbp3ZzQtoD8IAKeuOq+MqpC+Acy3nWnkJadLVZhrMV4fojN0VO6I?=
 =?us-ascii?Q?1TELXgGisf1pU9YCpv5ZzLqdYnTqSxu0RYURwgWHZHMv4QPoottbp5y0tEfS?=
 =?us-ascii?Q?+wyrTSMFMMGR/h3s2rw7GLVaoxMajYuEngXwawB4fjE0/HVSXaTQQxHA1mV+?=
 =?us-ascii?Q?+WTVBwjNjmI+OlFvMB9FizHFsfWdd4vWUf5Og9CEZ3SwXC9CKmyBDJsCXB6a?=
 =?us-ascii?Q?pHmWFYaUeYyqJRzDJRRmm2go2vMOGEGpQnJbFNNH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fe6084-ab94-4d21-880b-08dd02308b87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 09:09:28.2592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnDKrqzp9owpWHDTK6N8T5M/tJWDv4QbhFEDbtzqJZhQFSxakqS47r05l8XclHKQ638zvT08UVUpNwfkSOFC7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7712

The dtbinding have imx7ulp and imx8ulp compatible with imx7d before. And
then the dtb follow the dtbinding. However, the driver doesn't add imx8ulp
compatible now. To make imx8ulp work well, this will add support for it.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 173c78afd502..1394881fde5f 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1285,6 +1285,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx7ulp-usbmisc",
 		.data = &imx7ulp_usbmisc_ops,
 	},
+	{
+		.compatible = "fsl,imx8ulp-usbmisc",
+		.data = &imx7ulp_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.34.1


