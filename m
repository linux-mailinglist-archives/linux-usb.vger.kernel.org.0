Return-Path: <linux-usb+bounces-15269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5AC97D3CF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 11:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9996C1F25D6B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 09:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC1213C816;
	Fri, 20 Sep 2024 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JEUFk7PV"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D613C67E
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726825213; cv=fail; b=WNKwGCrNgGCfkSx/TBa8oeCfljBD4mLwAgd+hpKB2vsLdJrt3TpzTd9bFIAi9kjBC2YWO9uMzHQMn6sBP20eRXMxcffnOu1ZDvoKHuR6LBwdF48nFuJNh67rCUgi/xG7FeKJXfZjKFbyBucjdYt/pZj0+JO1OesElmn+sWdBwIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726825213; c=relaxed/simple;
	bh=t1ABZvI0JQ+VlKICZHWmyDZ+Wovq9jVfXqsULN4MKjk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W7GIbIrDSWGYoW/xB8GS9/CAM+8Rqt5ESMH7DTKnjHypKG4/FTEWA4N2jfg5j0BaPZcMeMcdBtwuRtzPrz4cEzKJyAnfSDBQ/PbtttNzpqFH9lsDpCJU+BF5JbHZVnRShVFvqna8JZjn2hcKcWzmtPrKSINs0GdSLoAy21rnIek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JEUFk7PV; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3l/ezMiUB2z8DPZzGLBcbJF57UmOEiXxXv4cIUkFl1rxR9ReUa4pqtMLzuUWSlHxmP9h+IdlcOY8CKVPfpJ1/fvLBfHoBenCXR93/vn7rcBEnt5eGD0Fcb/+5TYn5X6AiV/DXjwQ62mHfkKf/WMWbnja/pXscGGDHlfvRFL71XCg0kWisP8SH6q0/f5pk7q/7Vi6Nxm38xBHSQnz+IAt0ZrLRMjQ4rcEHqGxJv5D3VYzf6kzTiczpLKs+tyYFby8ROWOsQa59NCIAbcNrmWq01hHIkVwea9f1vr641cJfao2lz11lMfMxfSTPvqGVunFnaVU00cHQXkaRR+5lmhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he+lsVjWrtn1tVIXUA7TgQZWaBbjcU23UVG0jilaFPk=;
 b=og8zhWxltXqm4pAwWVcsC3P6zNgND75v69nQificwO4f8leK/Et8VPQXwO36vrpdidWO5KDhgGNAAg4kA3wkgH8vwSCTxi4DwCSyRwsdu+vV11pQXCC4E3dMAdLn63tKis7hnuen/+RuW+IXPerLw/ArtUne3OoU/W2hN4yDXF9l0r8Nl41dczv6yUtBMhyuXQ+TvXSBtLNEXIHiWniV8wNPJxz8dAqb8fSne1V9qWp1cBTUn/egNQpf4oI3Zd2A4uuCCchn0eP5zar6dxoFL7/wuG+jdyGKh4Ncyxn/UH1P+sZUQ0a7J1HRCHLhlH2nHrBeDClXzvnz+7uY4n8iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=he+lsVjWrtn1tVIXUA7TgQZWaBbjcU23UVG0jilaFPk=;
 b=JEUFk7PVj/7VxBP6xXI54MyIqWni9kJafIASr9c7EbgjjsITlK9MNstCM0MkdtI1qHo+ym7BKwYnzdrg7+Roaiv0rnaxNPm7FFja7zPSaq59c/VB+uk7POOgsleEs2jirNFkBgy9vWhoHMuykGocw7aX+WeXWJiLwkKxbnCWaIi3uo2WxYIpkH7dB9OPBqTjgRemwrldiJd4R7gwpXvmEqjAj9FSoQ5GJ2T025+gymNzLDs3JykkSCZTzqnV5gIilBzQ+QvLRUxnb0zGgMgmnpt0rOtXa28djosjfipXr6r6RX6ois34wWddYzHqvqCeuEiS5jpgwkPSUoa13hhTXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:40:07 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 20 Sep 2024
 09:40:07 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 3/3] usb: chipidea: udc: improve error recovery for ISO transfer
Date: Fri, 20 Sep 2024 17:40:56 +0800
Message-Id: <20240920094056.2680590-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920094056.2680590-1-xu.yang_2@nxp.com>
References: <20240920094056.2680590-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a15a0e-9243-4ba6-18ed-08dcd9583675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6r0h6knRaRd61oSXFYplHMYNIV4DkorU5YKRG6CcBVC4qxiK3yiPk8ewiw/C?=
 =?us-ascii?Q?qd5q8VqBRsJAED41FN3if/8m1tmyVFmAv8k0Bmmj9CLwGWPJHs5xEuMCVPjW?=
 =?us-ascii?Q?hbRQBXBatb/5qyRscHbekOvBbyzd9KoKF4FF1/o/o8QExYKxVWfnNUIwX7vB?=
 =?us-ascii?Q?8ZZeisRjBQoQxRLcnNpYd2hxRujjdr/1kKbL25SnXi1kDi6h62E5XXoGRDkD?=
 =?us-ascii?Q?bAGUkX/ENNHCJ0jcAJ2BET9tD54Eb4ksBSKH31at9QTVo3Sr6V7i2p662Q1n?=
 =?us-ascii?Q?+n75RiEkvg5+twzCw24LPS64RThGpiXWZAk9A6fVB+JaNQIx/Ge3WdYntkXk?=
 =?us-ascii?Q?S4lF/HBT9/BblkHaVk2h476evcdvPfZE8yfQNEbKUMSbhqjj1pLk0KMi5s2T?=
 =?us-ascii?Q?aYelRqBQuvebfuTldIwnmJZK07FAY0HNqCY5Hm93AVnPw2ym0jcIPmnquZfZ?=
 =?us-ascii?Q?lrc639/JlZBC4qctR1p+XZQY6eJJlQ6+lTIzyY/VGqTxka0NIPSRTVulfe50?=
 =?us-ascii?Q?c4T9m2UQbeTPu9XWlMKmgyL0c/CPhcfaWvjvh1g5kt8MLqhBR+QM3cDSL67Z?=
 =?us-ascii?Q?6BVpnzoLRlOdYR5vijx75JV2/Elza/06cmR4Wg2z3Hhhi5KiWYAYCSzQtLMz?=
 =?us-ascii?Q?F0NtfJxJrwc7wDwGA95Ozet8voz06+YEGCYHp0kBtm6Qqdfgf/63+mTx6iun?=
 =?us-ascii?Q?MdcroQjiTIJzuxfnIQK484fWnhbW2cjNtg2zy0QpItGldNRu+xP0rFTOa4re?=
 =?us-ascii?Q?Fva1ZkbRYl0635uQaMrF+4NjKw9fUW/owP/QIEPoHZKLR+VBHPqF4gY4/yjK?=
 =?us-ascii?Q?ASzrZUgxvucPTm1sDneKWvW/1s4GWwCm7nzSUnGSp6Kl148qv84jLWA+NTHT?=
 =?us-ascii?Q?jWg2+id3mCMLXM+4jsxjmrla8YJp+XfH9Yl5lTzKmN78/LSaJ7TUgM1+parH?=
 =?us-ascii?Q?xsrZ7jNl20+7LQeyTEvQGAeX7VvcmZQxipC8BWZaA+FP4xD6d6zQaDPKjVqQ?=
 =?us-ascii?Q?YW+AOayADTy4w6c0tLWl3pjGA4oHo2YJhMSHeOLcT1ZP6n7Qqm9RlFOjcqoj?=
 =?us-ascii?Q?KYYSROdmE88OVfcSfgy6+iydSKk3qrjBymJV85vASQlqld3VEcM/uM0nrNLQ?=
 =?us-ascii?Q?S+2Qeqb4E+k7zIE6fpB7IxWtwz66IRwbu6a4WTK5SORS1YzKtI9GstrLfx7g?=
 =?us-ascii?Q?WpWKp5hKoFBPtlnq5Z8rduwjcuIyhvbOVG0lPYKyC5XImqG1IaXYYKZE/kxV?=
 =?us-ascii?Q?hyqMkpilgchRVqcsRNggi+BzWdWgmfUnnvFn2zprQnryGN+Kib3/Plqays9p?=
 =?us-ascii?Q?2il+eC6BgZn3zRTLpIfzSYlGx7TWSeCdWoc3VaCib1JjrzMRM64nhPYLdniD?=
 =?us-ascii?Q?Jl8Hk2TRgy4aMe/xL8/LxCus1wWfn5y/q1Oicc77HhC/PC1fvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n/10zFeQsszrlvQuTzqrRmMlcpaK7WFzu1uVUbKH3FPyaoCwSsRnkZMugey8?=
 =?us-ascii?Q?tQAPq6FwW/eI1H6pvPNNJs5f2oabVPhZBHXC8MsTJnrfaJzyyNkNoD5GWRbL?=
 =?us-ascii?Q?0fucMzXWgoJjc0lwDi6Yiufk5vMMEpanH3yjHJp/GSvBM14AeNbltUdavzuh?=
 =?us-ascii?Q?lZA076EaA67ynxU86H52Uc878N8dNNgHtDe/t9hi5DzbY5xgzpqgxaAM6gnW?=
 =?us-ascii?Q?mMgqM9CWxeVjIX8t8gapmDCXWk9ayrf9bjK8ufKF7/cR+Q6/6aBuF2L8gtXl?=
 =?us-ascii?Q?VYeXp8i/9FBkmveHsbkBs8FEzfrn8zA3Gj28xzn5OrpgCmdJjgWKlTUc19Fk?=
 =?us-ascii?Q?+s4Ev/Ao6oJbK9an2CqB7gaheGH9NI+IG4PQBcsKsDfEvBthHwMEBkKhLUo5?=
 =?us-ascii?Q?Xsk8wQOMMxHtyGDL8yImiHyUjoseBBWYZTy7vdseJBd9DhY3tz8sZFDCBy3y?=
 =?us-ascii?Q?76xf0tDlwrtU09ksawaZrhUSMidt5/tBywpcyv1N1P0oOXWvJZZf/eVC/gkR?=
 =?us-ascii?Q?xgIuSDHJ8Ta5bF4AIAole5nsaPVmyvBw+nNuFg6fZj/7ChgXR3WP7KF3YEm8?=
 =?us-ascii?Q?FTvvQobBlgYGUzbmO5fAeq9/zKVwVT95ooyv7wwWD3xsME1dyD4jhvkomm7c?=
 =?us-ascii?Q?kSO5ez0sXKI/IZH8fEWPCdCYX37UR2J87DqLjyBuJz+2ydBCABpS9/qWRm3f?=
 =?us-ascii?Q?dkEGMOpZ8dCD6oA0zrh+mwMDIJf0L09OHCT63Y7CHnsh4TDlXAbZWvmrqf+5?=
 =?us-ascii?Q?y0IEVL6AiZdvo4nXAxb45rJZVAf5jBWvmh1YW034V5Y6rIkhYCvAmVBTyePH?=
 =?us-ascii?Q?oAHng3tu9kXfUV/1V5S7Kj99DenrgrDQkM1Gy7mb942xYmCQlE5HufZeFcLx?=
 =?us-ascii?Q?+BnENRF5oOg+DueSBmKxsseARp/a32i+7E/1KzTs75vC7oKgpeC9R0gFzCgz?=
 =?us-ascii?Q?MmqEKQ7/mdzwHspPvfkzQC81KDAxv3/9YHRlmYBW64c8OAXVbbmIcrT1h7R5?=
 =?us-ascii?Q?gqt4evuBlAaImNtZYHM3ZzHgtasHGHn8dz/hL5XJ4kdlr6Bksyk3oK7HsEV2?=
 =?us-ascii?Q?l5PtohdsUrO8GdUlWy/NH8MTranKeq9mp1drU6G7fS9dtuPtljmPfZC01mhH?=
 =?us-ascii?Q?JqpbJ159+DWrzIEU325oX8LG2eJa3qrPay+ZO8X1a7hvsGQTYR1p5k7Cw/u0?=
 =?us-ascii?Q?D5FP9Ug/zTBQRJOvf9ewhq9MdCGEwh3+J3R10yrVEe1CSc1Xt0Q66H5sE9cG?=
 =?us-ascii?Q?MrYPdmfvtegOcm0KIVRoIBoJOTHtfgQ8riy8TFLXx7tFMWCAWpWy0C/KxOMp?=
 =?us-ascii?Q?tjGIXYZp5Aa0+CcwP7uISYKUkREkFjIa3pnCd5PwRl91f0mNQmchkMQNzt+9?=
 =?us-ascii?Q?mqSvHZA9Thzt6IFa7D2ckyNM9dckW0ZLSC+csevuXRfyTPHM/7zS2/86xxnH?=
 =?us-ascii?Q?liud5IFbWig5SxHCNqPDnOnX0nI3LBpBcGp81belC9sGHuVm1/REQdml+r+7?=
 =?us-ascii?Q?Ed9FQfI6r1f9+vuwetl3Q8d9eYoUAfIXGHl7YRVJr0Zz01/7D41tPMZaaGH+?=
 =?us-ascii?Q?yGcstcpKb72T8KrEjGx9OqBix0Kl1ZqnBUhZ690N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a15a0e-9243-4ba6-18ed-08dcd9583675
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:40:07.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsUdkhXoQtGPSBjdZYsSwTHZ5U7RHchKocLVmGjeWqqbCmjAYREHjuoIjTqC+XhJOvF9BG7/tADYBjTKiBglxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

Impove device mode ISO transfer error tolerant by reprime the corresponding
endpoint.

The recovery steps when error occurs:
- Delete the error dTD from dQH and giveback request to user.
- Do reprime if dQH is not empty.
- Do prime when new dTD is queued if dQH is empty

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify commit message
 - keep "hwreq->req.status = tmptoken & TD_STATUS"
 - giveback status 0 to user for isoc error case
---
 drivers/usb/chipidea/udc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index c0b8745234c6..e1121db0aea0 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -823,6 +823,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	unsigned remaining_length;
 	unsigned actual = hwreq->req.length;
 	struct ci_hdrc *ci = hwep->ci;
+	bool is_isoc = hwep->type == USB_ENDPOINT_XFER_ISOC;
 
 	if (hwreq->req.status != -EALREADY)
 		return -EINVAL;
@@ -836,7 +837,7 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 			int n = hw_ep_bit(hwep->num, hwep->dir);
 
 			if (ci->rev == CI_REVISION_24 ||
-			    ci->rev == CI_REVISION_22)
+			    ci->rev == CI_REVISION_22 || is_isoc)
 				if (!hw_read(ci, OP_ENDPTSTAT, BIT(n)))
 					reprime_dtd(ci, hwep, node);
 			hwreq->req.status = -EALREADY;
@@ -855,11 +856,15 @@ static int _hardware_dequeue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 			hwreq->req.status = -EPROTO;
 			break;
 		} else if ((TD_STATUS_TR_ERR & hwreq->req.status)) {
-			hwreq->req.status = -EILSEQ;
-			break;
+			if (is_isoc) {
+				hwreq->req.status = 0;
+			} else {
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


