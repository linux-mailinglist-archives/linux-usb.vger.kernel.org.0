Return-Path: <linux-usb+bounces-14970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AC0975FC9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 05:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F361B1C228E8
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 03:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A48D1684A5;
	Thu, 12 Sep 2024 03:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n6JV/YV2"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2045.outbound.protection.outlook.com [40.107.20.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2251714CC
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726112110; cv=fail; b=mPhxgEb+E4uSGVAzxp6LRpu0D63ucnhkO0tX751NC7ZgTSZxLt4dtnDDhFNy3IcW1v+jU0VYNIyfV7EBlkvZ83WzARaHk2i8VWRoO3bzczOx7qHAdCZ91VwO6fQoGM1An4YJXBifiaiK09dTPDIQ9mHFwjQWqRkg+hU3q2fNJ8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726112110; c=relaxed/simple;
	bh=pCAe3xzSE14RZ6oYTvg5eejM7aVdIhu5uKPgRHiZZbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/E0kdkDG5px55pkXZIStq7c2fbwF2DirxWJobxyU4CMwogVYZc9x4PHeDl+9jitj8sG65w6hC0OzEhZw7ldmPC0TZCNcHPugihN+PKriPHJuPdYLLHJH0eGc/6iQtHax8HE5ZvLssNF4pFzsxBRAfCumldLTgurFE0X3rRMjVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n6JV/YV2; arc=fail smtp.client-ip=40.107.20.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgIpEJk93C1rv4tbblsRhoFxaOSoXgeWGmwiniNV2dtUmhYw9+H7AY1DKoJhndY30bUvL/MIzfOJyrXX8Vn+NE2SWX5kkRp/8zPQ0Cy9bALxcoIuWzZchDIG13hzAtMsxjMrM8jSFawzqVQbjSztCFeFvSWSxMikaJ+LgMhhiutj5lZtt7PCIAzrv5eqvCOFhRdhJ7a7z7yx30TuBqpkm0Hne/qpn0QW7hcW+u6E8xu6xJApLq52hRspYqtCUj5I3kjhLy0aBwxuq+O2JicC24b0nRTP3xzLCsdP1wxG9YAgS0nF2htkK1arFU2NMM7gOd1jJWkFq90QH0ksCYw0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjJESt/q2kEdP4+f7qsKmbh2QARyRcr4pIHDQj9m8x0=;
 b=OrUhvZfzHRfvHspJdg0B6EZ/qAxLwdylffKUq8z9r8/rdVHX/x7xRmVvL4+WV/pVBEZ0jM2kvL5g1DxKN3+V1RnQPB6uAMXleLo/zG8TMsJjp4dTNA1WWkpfOBFiiehkcoy9X4LnQNIx2eOUgOBDMm4RmME0zBtw2AxYe8/MypL+cotWLZr5FkSVAl//4p8xnK7KtsTsHpwa0+3Qd1WUEZkZsZEfa+GQ1ybQgIDcbjzg/q8xU+KTYJulxpSRtrr6BYwos46MT3nKqzvGssiKPCAOIOEdF57a7RV0oUxgWE/z+vqExHj1vxAbwmhWvQyFbnxxIMpKw2NICn0b1syPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjJESt/q2kEdP4+f7qsKmbh2QARyRcr4pIHDQj9m8x0=;
 b=n6JV/YV2un+iI2F9Gu2hz7QW0U8ZTAOlKwpTnKHS5OcqmnnaKs+blyk154P3fgQtq5ICS/atVOYhBjPPH0TZrkVDpdu6YeHRU4blCw2rXIGbLH5RpMg0X8kceBVxpXORuuSD7dDF/57JaWu7QinUMCXaBuLjOlhMaKt7Cam8whovjszHj7qGBRE6jkEDfDVIPtA6RtkwVLGQHWXLrD7vajf4oMJ4DyeQ0tfnSjop5+Ux1tkR0JpDBLGpTE2E2CxBhGICUKw+XXEWB4n+zXgfkqLYDBBS7oPoZEyrOKePRpk1aJtu2BP7JOyi4KziHb+D7GC3MLdTwKPNZ5zO84uIeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10953.eurprd04.prod.outlook.com (2603:10a6:800:271::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 03:35:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 03:35:02 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 3/3] usb: chipidea: udc: make isoc endpoint a bit error tolerant
Date: Thu, 12 Sep 2024 11:35:51 +0800
Message-Id: <20240912033551.910337-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912033551.910337-1-xu.yang_2@nxp.com>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10953:EE_
X-MS-Office365-Filtering-Correlation-Id: c017e631-b758-4ac4-a27f-08dcd2dbe272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zJVFhTPn55vSUuPIX76ycnYbt8ALQro523DaCOvXN3BSA+4b4cvlJCiBbk8t?=
 =?us-ascii?Q?ylwJqYuOiGm1HXWbL1lziCvkkeddbgV0MerMWRHgcwHkRgklE2DDqgOxtPC5?=
 =?us-ascii?Q?qw+D+w2VoiNE3GilaUM4J51pSY5NWYkYNKIejlA5Q/iarllL3wwwzDyoXWZM?=
 =?us-ascii?Q?ahPfKYp483h5pkD/eHXh+uOJjC+nW3Zji4e7HA2L8oFlfRDXKncwcDDTn9gK?=
 =?us-ascii?Q?ZU0TX4QDLsN2wNfjjxq4dh+Usgik6r8wyb429CijvYxPm5rTW9OB6/prh0gC?=
 =?us-ascii?Q?1enXArYNRW26DNyoWtzVgq+EhU9ZC5jX+JN1PFBddu1I98b+yG5UbkXdARIw?=
 =?us-ascii?Q?t8D8SLbxYTOw4KRP+X/emc/4s8d8Ap/2EGkxcc1txnTPpKmnbCNg4z3wojUU?=
 =?us-ascii?Q?w51kLUKvkZk2LKCiDzhAJ+E4Zj12L7qjpqF5XyhgA9jhPRfrKBXHe/sWQyfN?=
 =?us-ascii?Q?YIUNUxURlYBxcDYz0IoezuSbfxdfdA0xxbHY8IFWsPvbqktSMMiDPJnOjigv?=
 =?us-ascii?Q?wZEyCYx6iePi1FryFwVDEXHUvQfA7prWj8Bp+465l+20Qz2WZtt5eIPyLPZ6?=
 =?us-ascii?Q?xhAEb72vcxrukQpSPZDWrtS+KsdA2fS15OloDgv+acb4gwEDEQ/RGCgNGG4G?=
 =?us-ascii?Q?VlPo916ve07W9TGUiLs0LrdwKGNl+1q6X4KHnb404mKGStJ2V4XJttcGHinF?=
 =?us-ascii?Q?9h1HOniTZHag4/iCi3eTWktHmAvAKGTICB+T9kpN86CszCl6skp7Sx7+mZ6U?=
 =?us-ascii?Q?CD7CzFAHFt3YJfiFpqSF45+zucW2PablA0YGQOGIKi8sTZTyAK6BNZhgjsMI?=
 =?us-ascii?Q?YUnURSXopkE0UY0E5HNKFotbbJLUcsLRseDQfmyIRDIPDove2BW7rAPo1/HI?=
 =?us-ascii?Q?xDw/NPUucOLRP0dwQR9L6FKXK75VNVE8TeW5tB638HGd/GNX3u/Div30ixnf?=
 =?us-ascii?Q?HLUFAAX7kmDw9FAGJ1hnq2VMH8Ka87NzEwByCMSajRiyHBmmKMU0DgU+cKDr?=
 =?us-ascii?Q?wXJ7HFQz00N5qmPYW64vA+Iao7fcUF40GZUhug/9PsKXwyi5xg0+DRi5PuVV?=
 =?us-ascii?Q?Rt588nRTCBPWqqGnpsHOtkY+2cGo3GU1l1okV7DBXmo5/bHXKVYXsOGnYyAm?=
 =?us-ascii?Q?WbU0+5AbPhXuxzFUsk8GZczCokW3lZR7UWnpk25LhJe2ueZ9khJhTY9c2pH7?=
 =?us-ascii?Q?SZMaSfugCxZjnunwdkjgouz3pyXGjWtIYwp+qgHU1ojgND0VGbYrpLUFPuD9?=
 =?us-ascii?Q?RtxK0OPE8Wk2u7sQpL6BkS2LE5ISo2OhR75/cvdESqSvyMtl+VtqauA8Xo6K?=
 =?us-ascii?Q?FPvV9zeHosKQf0Q1/84wjQBAFOqyxN+3F1cb3dZUuK2onEkOam5/N8BTcQ1/?=
 =?us-ascii?Q?xKzD7sxFjp2HcRFX69fkMSSNiqTp7pPCPfGxPXfmWsuxisC+5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TdsUNI7QR2dGVPcmZcCVrngUXqXxQ/mtYbgjkPdxkn5t3phuvc8TRSdgLTzB?=
 =?us-ascii?Q?i85S8zTkttg84FQ6U54KaAFHCMAoQ3t06CfRPvoXaXimTtOgpq/3yd6QW5Nd?=
 =?us-ascii?Q?SiQuomJ1yRuYseznfWCJzFcrUA3mqggg5ousEPsAUuMSkSfaCzilY7PuSmT6?=
 =?us-ascii?Q?30dDXvl5hBMxI0F1lOQcgTid2yAdRzv1qRK52IKdWtTbtLg3WhiX6QjG8wxp?=
 =?us-ascii?Q?QzeiGDeuBCQhUzjt1K7/Fe22hj1qZHMeSOPUFI+mFJi9VSh1dBAc5+zr2Sqt?=
 =?us-ascii?Q?ruj89deykeDgWUNEKgJBlxr1Y23YKk0L8LQTibCCwtIvv3oQHMUz14KNE9ZA?=
 =?us-ascii?Q?isz0N296oNXDyu9elppzCgUQmAUy58ng7InUQiM3Mev8cJUkjOIOJX5+6o+n?=
 =?us-ascii?Q?4ijm3qvb+GvmA9M8UG0BZXIVCqkmtJXpipG2qht/NvV5e/Wuj1bkOk69D4mB?=
 =?us-ascii?Q?zy4SrO1vc6y5D+cMtmR2iwB139ep3SW1Ie2Sk0RMN1qykolUj+gxvGb6SSnb?=
 =?us-ascii?Q?ZJA1snMMvnES0UixG3tuQsNFkkdS24XAzG3xOWAnNJeFX8qsZTxGsoHFkIPD?=
 =?us-ascii?Q?vJ4DToHv8uOC/gnQc4FGJTEQuX+HpUN8ukO6GSfs6jr3OhZhrt4oVXOxe3Qo?=
 =?us-ascii?Q?qrnhnLiLoxlUbyi9zYNuQiP0jHfhzvE8+FeUIKEWWv4OL8MjDvijcYGPETW4?=
 =?us-ascii?Q?WtUEMvKZZFlDkbPcMMRw5rEVPAVVwCxcypODUGRSiCC7gcZzgZOLq0kgvOjN?=
 =?us-ascii?Q?8Fo4zgNFcA+iKKG4xnvF9M/aPKWBJnbAMRi2IvpH6Q+NQeh53y47miVufmZI?=
 =?us-ascii?Q?QQ+juZPqYQJW1qkNir48O1vZNVB0KHhkbz6Fl3/jyQRJVBEMk+pNWrvAutsI?=
 =?us-ascii?Q?hzB6r8R7Z06dAgbvTBXPjEhE6jgMbGo8cctVFmk9E/W2/oD9p//N8xKzmx0Q?=
 =?us-ascii?Q?1lnkA+oQhWqtlR25pqhk35fh0GTEPjJXp+Ptb9qDIH6m/2E38b2Ktx/WkyU+?=
 =?us-ascii?Q?9KIxbHnZTad4Zihg68Bxk7UNgWni9Ugm2D22wTwQHaqdogHaVMu1KmsojhQk?=
 =?us-ascii?Q?VosqocpFM3h85o714s/A3ZOz31y8gN6YUEsUKk5Oy2djgFa0ukr99VnofHj8?=
 =?us-ascii?Q?3vzmi7ZydthcXrQuvupkIkmtuZcT0kNBUJNjn/1NPs8AYyuRIGlwkWotTn2Z?=
 =?us-ascii?Q?3U9XtOy5tFw8zyOv3/Z9z+6HFPSBIeFYchLTRbyK3yHFPPDHGByDAHTzStjK?=
 =?us-ascii?Q?v5j45Y2jZ+uJezt46fumw92cO0rcecJkK9ELgxJ11dO8zXXr4Y0j//mDnXjq?=
 =?us-ascii?Q?ndTswosUsAYuVG7J+tDxRmsc6ID9SwA410OhYqcm2UOapS/HtQver3zE03W+?=
 =?us-ascii?Q?9Jfu2ukPvvmJwMSxPvDrZJCtrDeJNi/52d0nn4hMr7Ib1xk4GfDOT5CyBBxn?=
 =?us-ascii?Q?X875ULfhijvUv3hkPzzG8JjEezEl9zb14UmLwwe5mVv7TXIJ6Py2jIAFxzJQ?=
 =?us-ascii?Q?Tu7RFRPjf50FimuBBWs5Wp+PqNEV4ak4iHqhRjFQB3zvfLUkynIKc2gi9sN4?=
 =?us-ascii?Q?032kahKkY773abeezP3+p1GHT8eTl+/wBaLDD4Sj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c017e631-b758-4ac4-a27f-08dcd2dbe272
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 03:35:02.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPmzPyEo99NhCnc9dfd/BXi0aLVaYNehXrKxegnNlDqSyGV/iLDeLhqjfntYOBOR2VQd6tNdKKRDuXclt8rIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10953

When a endpoint met errors, the usb controller will firstly assert
related error bit in status filed of dTD, then ENDPTCOMPLETE will be
asserted. Finally, USBSTS.UEI will be set.

Due to isoc transfers are error-tolerant transfers, we can make isoc
endpoint a bit error tolerant on device mode too. In case of error,
it's possilbe to resume the endpoint by reprime the corresponding
endpoint.

When error occurs, this will allow error dTD be deleted from dQH and
giveback request to user. Then, a reprime/prime operation is executed
depends on whether dQH is empty or not. If dQH is not empty, reprime
will be done during dequeue process. If dQH is empty, prime will be
done when new dTD is linked. In this way, isoc transfer can be recovered
from a small number of errors.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 0ab57b87b07b..b1a1be6439b6 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -683,6 +683,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	unsigned remaining_length;
 	unsigned actual = hwreq->req.length;
 	struct ci_hdrc *ci = hwep->ci;
+	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
 
 	if (hwreq->req.status != -EALREADY)
 		return -EINVAL;
@@ -696,7 +697,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 			int n = hw_ep_bit(hwep->num, hwep->dir);
 
 			if (ci->rev == CI_REVISION_24 ||
-			    ci->rev == CI_REVISION_22)
+			    ci->rev == CI_REVISION_22 || is_isoc)
 				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
 					reprime_dtd(ci, hwep, node);
 			hwreq->req.status = -EALREADY;
@@ -707,7 +708,6 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		remaining_length >>= __ffs(TD_TOTAL_BYTES);
 		actual -= remaining_length;
 
-		hwreq->req.status = tmptoken & TD_STATUS;
 		if ((TD_STATUS_HALTED & hwreq->req.status)) {
 			hwreq->req.status = -EPIPE;
 			break;
@@ -715,11 +715,13 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 			hwreq->req.status = -EPROTO;
 			break;
 		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
-			hwreq->req.status = -EILSEQ;
-			break;
+			if (!is_isoc) {
+				hwreq->req.status = -EILSEQ;
+				break;
+			}
 		}
 
-		if (remaining_length) {
+		if (remaining_length && !is_isoc) {
 			if (hwep->dir == TX) {
 				hwreq->req.status = -EPROTO;
 				break;
-- 
2.34.1


