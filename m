Return-Path: <linux-usb+bounces-13935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD795C6B2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 09:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EFDBB23976
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 07:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619D013D521;
	Fri, 23 Aug 2024 07:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QVT0yWkB"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B6013A41F
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398678; cv=fail; b=bvAmq89UizqiabqkEK+oCbrQxwgUNxs5KD5PxoYozBjdzSFBAwi0/dn5TM7ZuLpIDvTJrg558GTvVasS8hjST9U/NHz/sVR5p08bdoHIZCXR0cYs0bzwzTD9GI6aD4hVBcIwPoXD4yn2XMKS2pFN5n5PqtMjJGnHEJTTmukcGZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398678; c=relaxed/simple;
	bh=oOJU9xlngwQIvMSO8hsVqVBF8lQBce/fki9sQ1Xexok=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=htIATja8SPjXArO9z5+7rwTPoEsmJMKGzytuqnpDJ9FK1wcU7nIiPp5M3Rbt3eEzE570P/t4DLfIf8cUzrGZ57d7CHWbc7USYGfQGyiLvBuUBs6dQfOzkJ5r+sxxSECslXhNP+uODt2Q2O0b/kwpRYhBhX94gUbx1eXGGM2+cFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QVT0yWkB; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPemArR6AesutPbK9Zb4xvqe3nUnPpLAOKVJnP4DLkEXwJ0chi5+cQ2tCQy1GkPDun+n0XT0zGOGKfzVs5BMoCcqsKlTuoeByj4VmZv2C4K5enGNQtsG6nBlqSnGdfo7ygremKDAv+Pv1chedvkKcu2Kmhq+caWzHCa7nJC5qWzHeON3gGlkyK5jPjiHUHg27e2baEIibpgIy5GwBmF04bOpHdYL1FlQo7mAjaZks3AazE2ZW2h0j9z+H+G0oWSS7go8sTrdMiATUN/de9u+0uus8Jz77JSYdCG3VOgP+Nw/llKWzJZb7PnC5Zfsg+WH45NbNq3y5liiJf+ZfkBs2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tj0yQUQ+yVcMcZ1J/+k1lojYzmes+ZkavbdF0AUOLwo=;
 b=H2zfUxaImNT4/HYWPThHD7zDHzsSN1klYiwXGmW2nwy9pJGO2+Rw1QK+aB86omGIgA1GPiYAmzx5NLHJvOPRn/FPsz3n6MBGaDCv1nZkEu0Fzw1pOQSa9FjFFr/tBpAysO4NP+ayG8QkYYUhYmirC9YVR0gxayIczz5Xxv2Yx1KspKBCLFjtrVxpNQbx6wkr5kPnyKRvzxMeWCwM5mrQnCVxOeycnyAMEudmRQFi/ehuylS/wRBBoSuFs7047zhkneMTJLZ2Sj2jICNlkn4jtgS+Z1EvlP4u/9hHGszSWsvSyTgl2iebwfVmY13umYNFhon4iY5fRH59hG6DpkOTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tj0yQUQ+yVcMcZ1J/+k1lojYzmes+ZkavbdF0AUOLwo=;
 b=QVT0yWkBnSopcwAFlHi4VGYyurSg23hnbUYbvIr8dQdMh+7j3vbaQwrDpLeg/LkGRuCA9KcRoOB7SWO6wb9TcbX2/yv8BLOOzIZCHF5gzrvc5YYYlyWfcPSxHyQh2GlU2RRCXwaoqHzURQjm2T7xYjXt6sH04yL+MU3UA1UjTDAO0oIVdj5kNHQ4vG0jYDz/yytp+U95pC/Zw9/Ha93H4qShUr67lQLzyIKw91pnaY1R97mLnEpcWWs4f5jLXf8Atu1rmttDlZRWo83JypInH9jKukmVyO9t3VSNuYezwNGACUUkoXPLI7AKUMWG7gbmvRBvIiklvYwKwrAZBtAZ1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7996.eurprd04.prod.outlook.com (2603:10a6:10:1e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 07:37:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 07:37:54 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: udc: enable suspend interrupt after usb reset
Date: Fri, 23 Aug 2024 15:38:32 +0800
Message-Id: <20240823073832.1702135-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: d302a94c-727e-4529-847a-08dcc3467fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V7rGNHogK9Ol1iOMa+7U9cUrbk2f4f7rwfQOq3QqKcL1LzsOotmjXdXvkVJu?=
 =?us-ascii?Q?yKVjU3znW/NVguPd22c5cBYbD51t5Ybw7z1ylV1CduJsrgPJ48Awik17LOxJ?=
 =?us-ascii?Q?XEut93IEo6RqT4dFUnawOG15tqgsI3DmPPHuIQFnauRxrTsosFcttn5GeopG?=
 =?us-ascii?Q?1Ninr541xb+y/j6juV/VQPjAsXMTzNOMAcdlgzAQ4Rf8BeuE7xQI2Lb7yQna?=
 =?us-ascii?Q?olk4p5Hvoub1Ym128E2PocgNjd1JBlTPakP8X4MDMxjGqbQrVEJGnmAY1eSz?=
 =?us-ascii?Q?TTJedrcngLEFTc9rjQYRg4TgxCG4rYwYflV78Umlz7kFyEfoa+HWIYGzXk3b?=
 =?us-ascii?Q?YFVvMBvUD9EYIal9hndwtA7YBY7t480Ry30C28w0yp+OHySGH2LAizSuYta9?=
 =?us-ascii?Q?GgQFokkXW8v0/0rJwTI9pKVmPaSsh81iP4DIwAz/0iyYIC3tcv79oqLY4lKH?=
 =?us-ascii?Q?wUHo30jEXQckW0GfiNYPo9Ywc9lFhDWiKrIC4D+7Oc2JwnT21C4kZqyqobsh?=
 =?us-ascii?Q?dYKhJ4UzydJ8vfm5gziH0a9LsMz6/P934tpDoFoC4zrUMrlZ0s7yrOHsP3h7?=
 =?us-ascii?Q?WdGScziv+3CGoQTG/219C1guPNnQnCcPY9fAaz3wOMFM4QpJZ6Cca/rfWZAg?=
 =?us-ascii?Q?oaiVh0qCmvWlRMPkjSyu5FFDcbQ9haP9yCuYmnwDP6R41TC0wjL2aypn4SOJ?=
 =?us-ascii?Q?CwR7CAQM5oUFs+Ch0YYeCDz9lFMI1UnvCs8ID3u1AolpXulrkEKe7KRvDa+v?=
 =?us-ascii?Q?0trZQembDyff+OmICmOnMtLZ45J4670Exs7kINyqQmxa1iU+zvSf2usdNgAu?=
 =?us-ascii?Q?QPA0f8lqie/IrLiCgDPVUNbh870dhu1f7iPh+oMjD43jKjHLCZnBYQceUQ1t?=
 =?us-ascii?Q?ZM/9Jea/V9lEQ/jaCJf4qvz1gAL7TaPo9Coy5XFr3QoYxxEkP1O8IEbeGGpN?=
 =?us-ascii?Q?BQd0FWITc+/Z7vgCLzJbVbDNKCrNYJpnf2gyYadRy5LA0V24iNUS1FYMrrLu?=
 =?us-ascii?Q?yf//5Wn5saRHTlC7TlpPdeFt1nNFnM8oL2VrF7gQj7S9FvuEklc1XaqOI7Fi?=
 =?us-ascii?Q?L6f4j/jMIkbv2YpZDhZNARRnLnwpPE44pg/ifaQI8vmlc/s14WwQ2HkJBbgz?=
 =?us-ascii?Q?kRVup6rBAxdRiMb5zxuTKkMrVdh2noBuiGrx6P7Dmx2+ZY47N+QZYXS5MNHX?=
 =?us-ascii?Q?Sw5IosE8QhBEtp3ZnuyWWrYVRidg3NJzJC121T1p/uT/9cxzKHax1bDLnq4E?=
 =?us-ascii?Q?F9m5MQ6VETBhKME58dt+giggk+Zp3rv1ainw27ZJx1UA+oO8TI5Pu72tEmAx?=
 =?us-ascii?Q?qE5obnsDSOOF3Rj01C5anTRD1IaRTnnsQc3SPYdg5MvGLGx+sDILgVf3VGuX?=
 =?us-ascii?Q?0l1lg96spUSsHZRr6Qc5oswbfjyO3yxEPi2TauVtVlSrzPRvww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3KTcbpESQlOsjPZ/8pRIZ5u3QdThQ0ugFGb3Kc8NW+bGYXZj/fJJrOJJD6SC?=
 =?us-ascii?Q?3cU3W7nxfyEGkWBaxcgov0bQGMDNDfyJvswLVNVNq/faCmPAuZYUxqlDYNr4?=
 =?us-ascii?Q?8s3qw4N1JlurVqxaC0bVqXq5HBqQ/Mqm8FbLY/eljY9CZcbiYBrDHuVUEuvO?=
 =?us-ascii?Q?7Z8t6xnQjtCgCRYYpn+CCUWIfDBalkmCROZDVf+myu6NLpevTC8/pG/M7NRH?=
 =?us-ascii?Q?MXfCqIxBxWXko08unTb/5y2TmXM7tbsxemkNoelxNjKLnBZXCm82d66cKOHg?=
 =?us-ascii?Q?kC5C8yje4ZjbdulUOotFMnV8pEn7fSsg/OghRmMs3IbKBLM4sHn9HYcNRzz0?=
 =?us-ascii?Q?pKIGFTSXVgGCqMs10og3et3ZpIt4IPOArDgNzTHVXY+XhI1oCdqOwIceD1FC?=
 =?us-ascii?Q?2EnlGSgzUpRAbJz1chBLyoaiqit/FYEkMuSuBKEyZQPquzIMjJlM7YffoMC8?=
 =?us-ascii?Q?Bt/xRQ8+8TtQelj6ZQXrxj7Z+yiRMyTYOgB+VPZVU2cjEx30GpPL4kCCPqmg?=
 =?us-ascii?Q?+WHndODWuWTKCkp71g0CovMe2QHajouzaGWu4sdTJqkXIv9m/N+ut54ecliI?=
 =?us-ascii?Q?ILqoUUQhUZ85LcO5jfytEbHD9bN/lBxSOfg5inlnxnKvyok7fQNT8Zdpa72q?=
 =?us-ascii?Q?CEaRnyIBY+Yv4Pu6Qzl/El6PEMpidY9VGwflNI3mRt6P9UN3tUUtlZfZlonq?=
 =?us-ascii?Q?ureWdbViMKKucHDmtx0kerau1T6bONdlNekmaq/LaNZval5N4vOxvTLbLpZn?=
 =?us-ascii?Q?VyO8bvnsbbbra9mmNXue6FSSSOBZdjPUbwFwduqc34FOvJRvyzsBO8pJBN1e?=
 =?us-ascii?Q?LGGLgi15d0UWcgY+LhrkNQ1mGk3hXui6yiWHcwqS3NElqi6zaMqEtbDqjbY6?=
 =?us-ascii?Q?z2LNRFMhOw6jirkwmYrwazBymZoEeu1Vx9qvVom/sSlW7STuvD/A1q4drRww?=
 =?us-ascii?Q?MMUqNipnYI6+zZUkdoSVdCWtz5GaccNmUiWeFp/O1jnf2kAhopiS8HJcHmwU?=
 =?us-ascii?Q?kJK7twMb0IV/VrrN/3dONDcxfXSvb3RV2ljp833rPgEPRM6LDWPP6cImJSuW?=
 =?us-ascii?Q?T9zZN2G0xsE3wmfZzhRrJBJOrZwFlxNOnHbSOsYjbIXJHZnLIg7ejdmDhOpZ?=
 =?us-ascii?Q?F4Fbf03o/CbxGhV+0BO/L92WKn4orx6d8XJtPkUbBV5Vu0EAznouJ/T5B6s7?=
 =?us-ascii?Q?PJtoFmPP4FJgWPOpGwV76u7N5FagNY3lTlF7FBzu+prly/clElPnHpIRFzEe?=
 =?us-ascii?Q?/sQ+6RqWGi4m0GcrphkKJsOEDArylqo+MRiT7lztuq/zicSoWvU+dYF8jQRf?=
 =?us-ascii?Q?x1dQwMB4kp9ibP7NVHcqITRuoRSt2+Yg2FIULW9xp6e7yRp0GeYo/XFmsa1F?=
 =?us-ascii?Q?jr1848WyJ57Gz2fhDQSgUbfnZoqg0teAGZalzNFZr9fRAyA1jYo4b8y3iNJC?=
 =?us-ascii?Q?0JiF2ooea7iVkvOUF0fDTdw15EA/vwLMTcVkoutpGgBmOLO+qdmVIaWUGWK9?=
 =?us-ascii?Q?SpoLdxro50PfprogHldKGLeFtWzYATVM1JfldQMIkjwhXQIvYLXz+hqcFqYh?=
 =?us-ascii?Q?BIFp2Ak85TMtNWFZSQB1liVLbOHZcJ/5peZymGPH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d302a94c-727e-4529-847a-08dcc3467fe0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:37:54.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LExM7MfEc98jSD5FxrlG+fJlfO6lMNs1y9cj7Ld41rzfAWRF0mKthjmiPOheJT4MGm8aOdgSfoRJzDgYLCFedw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7996

Currently, suspend interrupt is enabled before pullup enable operation.
This will cause a suspend interrupt assert right after pullup DP. This
suspend interrupt is meaningless, so this will ignore such interrupt
by enable it after usb reset completed.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 2d7f616270c1..69ef3cd8d4f8 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -86,7 +86,7 @@ static int hw_device_state(struct ci_hdrc *ci, u32 dma)
 		hw_write(ci, OP_ENDPTLISTADDR, ~0, dma);
 		/* interrupt, error, port change, reset, sleep/suspend */
 		hw_write(ci, OP_USBINTR, ~0,
-			     USBi_UI|USBi_UEI|USBi_PCI|USBi_URI|USBi_SLI);
+			     USBi_UI|USBi_UEI|USBi_PCI|USBi_URI);
 	} else {
 		hw_write(ci, OP_USBINTR, ~0, 0);
 	}
@@ -877,6 +877,7 @@ __releases(ci->lock)
 __acquires(ci->lock)
 {
 	int retval;
+	u32 intr;
 
 	spin_unlock(&ci->lock);
 	if (ci->gadget.speed != USB_SPEED_UNKNOWN)
@@ -890,6 +891,11 @@ __acquires(ci->lock)
 	if (retval)
 		goto done;
 
+	/* clear SLI */
+	hw_write(ci, OP_USBSTS, USBi_SLI, USBi_SLI);
+	intr = hw_read(ci, OP_USBINTR, ~0);
+	hw_write(ci, OP_USBINTR, ~0, intr | USBi_SLI);
+
 	ci->status = usb_ep_alloc_request(&ci->ep0in->ep, GFP_ATOMIC);
 	if (ci->status == NULL)
 		retval = -ENOMEM;
-- 
2.34.1


