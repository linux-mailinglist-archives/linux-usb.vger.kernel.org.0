Return-Path: <linux-usb+bounces-19326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA83EA10401
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 11:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69EE1889709
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 10:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474F224633F;
	Tue, 14 Jan 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fRqbeDiL"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7E1CEACD
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850465; cv=fail; b=uMwkceK4PpcDDYji85BmfoAtVNjv1TF1Lt26DkKwUFkD9Lx+SOTrG8H+gCh1R6S1LyXCubum7MoSXfIgQOmwKLxiQ0t1IM9Hc8/zlEU8j7lXUoGt1wzzaJfVzPYhWpz4yviViBpWk0PAcAB4AEPVWGALnU3KecvVUngtryYc43E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850465; c=relaxed/simple;
	bh=jhsKl5p08Vt9lk13TIk+sOyxLPv5TbZUR8cAGPA4RUw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=E/gI+Wi2usahR+/KxQFRBYwicGqB0uOruKuEZFzcHSsDdxVfBodoT30WxrqX3SORsf7dbgiXs5FNLeFj+Ko1Y/S7mWDUMOKw858MNs5JyO+oWUhCxfCcy0xnu+yHVPH3fNmXHnB8w1gEEaYIxQyKXalRMrSLV0d9xWZ/Xd8r2RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fRqbeDiL; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=em7vilHWJlNV6iYN6McB/o0XEKKwut5nNd7ZgCr9+Cbnhbl+4OmYWKCmYrJGIms9M/Zxws64GzeAKGR9TSkNhMLzAKfZQEHwtS5b/E3+umRXxcZCU17VjgrSbyXBNDIYG20mYAGlBT/2hkCNOUJEJQ4VLqNC1zAOzIM34NkaKTfSC104KSlpJG7Rsom2Y3ixAhiWjyklZXY+WHHarjG/P0Ulgpxe7SIdPGzzHW4x5fA0TMBSXANJcxL/ValUq4q28T+H10EsFNvtl+MuuhoWBEd24qWyzXnL1+LqsbvQQ3LGjYKNTJlqZ9r2qbG8qmmqJKQ+P07rwo+hcf21civVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqeEeYQpMhrJuNEY+9Ijt+waCNxeE3JV2CAF0R8VKDk=;
 b=cQGBBbS0+qo1Yvt99TMhYVfTmzvxPVqdU4pbrXIIwmVWHu2XtRXX6v4pGbriLpDLWocB+Tj22MHgBMHSPNK70WKM0tMqBlY7H10+kfxvwGgk+m0OR74xBc4fYvHtmEMyOvh5qCICcDAhOy/wLlnzI9z4DE/bWdyxPyvRvt2hA9Gqq85n3As7b/XngK+kdSX9eHn+Y8JpP7gk/aCpDDwMU7Y/VAZN6YreqnjaS/TPebb5oWPbUEBLdIoZ1KIEnQ1UltTwyaH4WwI/BuCwSXlrQcNWLBYQUttpNgmkTDpXAZUiVfmRn2O2bg77Wa53S5GkWddkEL8lkre0YrpLY05fYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqeEeYQpMhrJuNEY+9Ijt+waCNxeE3JV2CAF0R8VKDk=;
 b=fRqbeDiLdYjLNAN4qFhlpFisg41pxOnR9DHzlSi3v5Rl8zGyvkcgjG6DOvxtx3JXZ9dw5X6lljUQvucOvjOmZLUsKS2D4YarFu+MoIPLOteXK02pIX+78yNCr1nDaSxCNtYPxGgmLz7KFpKF5bCr0fYvYfBWvs6EJioF4hZu12D/OdmNS4jhMYqvyZMxYp168COBROuFz7y/LpdWqeq1SsyvyOArHZJibc4peK+GBSd3NdcoeG8A8MVW4QkjicyZuBaf5WbtO3E6WEz/rLuORJAb652OnoCjWlh9u2EPe6lLrFGFCr6VxCyi5LZ5yb6SYUt07gnC2R7bJDikausB4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA2PR04MB10185.eurprd04.prod.outlook.com (2603:10a6:102:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 10:27:40 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:27:39 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: chipidea: udc: initialize bounced_size to avoid coverity warning
Date: Tue, 14 Jan 2025 18:28:15 +0800
Message-Id: <20250114102815.2311956-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA2PR04MB10185:EE_
X-MS-Office365-Filtering-Correlation-Id: 0663180a-6d2f-4133-8100-08dd34861252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sT693deM5G2S8IS4rTGlmlAYI9/SkXScAhiS6wPcd3Z3lcG9+rLamT4451Lv?=
 =?us-ascii?Q?TygouNIBvXMOCjvv5M0N04iLCsI6Z80XntBOKfcNoNJ4zyooxOQJBjyikz2u?=
 =?us-ascii?Q?+W8p4Pao4716EnQCHOC3ka53CHexQABeToZMI3x1aFuUxQ4MlHBnmlyzZpgZ?=
 =?us-ascii?Q?h0DOL56Rq3mme4B5p2rPpEUZ5fm04bkZq6krQy6mjxg1ZduskcHaj/Sc8omO?=
 =?us-ascii?Q?6nPzd1EugYQzHN6qX3OM+ClucUmWQorSo2DecmmenL9A2xctp3D4BWcwvzm5?=
 =?us-ascii?Q?1jPXHvLHipKlUgvtJnjBKF2vUCRl30bYe8TADuEmlN87A2G/s3rzDFVJwwMF?=
 =?us-ascii?Q?aH9Y9efmQylbWXi5/3aX/VWm0p3ionHBFjym1njcyBimDUZ/nryjtNNeFu1Q?=
 =?us-ascii?Q?fNwEQMggygelWGL1zl2kLvvVAT0sB+i6glDl4Kj9Jn35scbFI1SzfBMBboUq?=
 =?us-ascii?Q?tlFFjO67+mPXOsuH13sOBySM8swYmKJjfCj3T5y5BvfWDUmGXPfYhQYGE1EH?=
 =?us-ascii?Q?01R/YvTSafFskewz5gOsNjQRP5s4EaiBKqbKUtKaHI/9/rWld8U2NDLqCBlZ?=
 =?us-ascii?Q?Fq54JDrUR5ZBvp4gYDvtqOvGuz9b9KQEsYrwsAUMG/ZhTD78oOoHdDNdJHQ3?=
 =?us-ascii?Q?jU2dK6VkNIvOYYwyF8hw6/2JDoMxyk6vx1wJLwwwmBCr5m/QxfToF2zEcLqB?=
 =?us-ascii?Q?Z/E/0uHu7aQvewjw2jUUVqQ0oTvfLh+nnilP8U3MZvVbmrW16hwSrZq4f8bf?=
 =?us-ascii?Q?jaztAtWrwBD2ebKGV5gc/1XiPFDDr0bgwqgE24bWx48gg8UuuKzw6VOH+hNW?=
 =?us-ascii?Q?qzPHGmOfz8Gbwj/xuqnS1OrG+Ia9UVy0RFlIs7dH7x2D9+pGG1vAhEsYWV+L?=
 =?us-ascii?Q?RAITngHdud1W3UnwJfhkeL+FnxXrYlSJGXnWqVRJevLjqx826eoAYiGEAWOU?=
 =?us-ascii?Q?ceOqvoJh/dOi4pIEkhemD9rvopMrSeMAQb7L7JZOBmawOB/GVwNMa4sW+bXU?=
 =?us-ascii?Q?ySFUB/W4apGELxJYjRcnIrqEkeBZiACNxnulHiY2cMvzD041F0mOR62pn6Ga?=
 =?us-ascii?Q?97brDTvgnOGz8p3l/5i5YpfYIq401dY7G3SxM/C8x59s/ttgZKez+witDh7f?=
 =?us-ascii?Q?mxerfuqhcjHxxuHvYNurTKJT7pPD2YRChaRQAiV7LbbbXmPDhoKZjnCdfx6B?=
 =?us-ascii?Q?iqSzfp8yYxUJ/VQvqKi3lM9TDN5XZ0OzZ7OhN06lMnGxY40ymABwftpJ+zls?=
 =?us-ascii?Q?AqjJtU7ETpf3d2oy1lEYq14810dEtnMnmYeGIHwUVZQlMMl1OIxo3UqFNkxX?=
 =?us-ascii?Q?2erU4k07ydT/YOMvt0joarEre5oaR1jpJod/BfMkdqZt2OTB6Yd6TU+byTnd?=
 =?us-ascii?Q?Rkd9WuDDSAxXjpf2P63sr3Xx4rrbkqaQJBXaoV/ZgkmwdfzCG1pbun5/7gyk?=
 =?us-ascii?Q?xLrISbX+FH1cTfizg+robuty3ku2hOa4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6X65GiVFup1xfqXzQMD0vCnb45VHYHjvBcUJkejg86w7MaOAWAYzzX/Xhi2U?=
 =?us-ascii?Q?ulZPaiM+bB6pgQzHRhVYyyBmpT5qm8DAa6DGQjORNJYiNRjrW98gHftUaFcL?=
 =?us-ascii?Q?7NbrpNy7imGyYDAGpPkx1AT4XxRxfqpdYXpRkP6JtN32g1/BNZsFkR+I3u/l?=
 =?us-ascii?Q?HAtQTTtINHlKXPM2KqD8xZfMifUErmgCnydixHpFTv5Jjef/IOQu207qWiN5?=
 =?us-ascii?Q?g6ZRMA34jVMXOiL8HAacsE+HLRIQRmcVUdY1BTCUsiTg7OnrwxEXtvXRfqvy?=
 =?us-ascii?Q?HBhfyMJJngLKlTmCbacDT/vynpgMoDviVwHqVcDk5jMrGxrEpFCn/j3QG8YU?=
 =?us-ascii?Q?3YMwbPwKEb7MWG8U0Ki3A0ttl6PHk4OVdTt+prOCHX9RxAVbxWs+CAh0hPfF?=
 =?us-ascii?Q?jHxwSjhz2SMFWIDkMYdEnPyeGSPZ6uaqAarZGQTX/3m/W8krTFJaX9XemfoO?=
 =?us-ascii?Q?zDJQjuG4mAcMkdlaNzYYdVnrY3AondP6lfrN0PAUyMTJk7vvYrMErVHBLjwy?=
 =?us-ascii?Q?8t1jcd258/ZaqWgXjupMpYefHy5PzFFT05bKSIk0jS1xFt76Capig97Hv+Os?=
 =?us-ascii?Q?7iXkzSlw3mWz1B6vu0c8LVR94RbcELtZlOEKQiEN1qvSb2zg0R/3BM/uRjbw?=
 =?us-ascii?Q?bRScEbRGARjMyOPmU0ZtTT/GWtWTbY1AsOMOJIyX1idwbD1k7/iR1HT34X2P?=
 =?us-ascii?Q?mMsPijFKlBCfDfM+yAz5hoAD3UeTdQQWpzqp/hAGXllOgqS14zJlIXHe/FfK?=
 =?us-ascii?Q?+AT1Z8RsU0d1/vKBP/ZcsVwZWpO/DfEjbbAIm/Ajt1SRy2s6N8G38z/rce+5?=
 =?us-ascii?Q?I+BBa5dIyfCeOhw3c6HdNXLzkOpPUSNJZUWwmuYOYCoBC94bu+XI5vT8CYZ/?=
 =?us-ascii?Q?11B7hlSsAHX1/Z0QHHMWxIYPA+QP9mrSDUCs7W17Jj9wSVU8sj+oilqZZJNV?=
 =?us-ascii?Q?sYM6xPx/F1Tqxpr066ezhyXLy32iS7wwpDCfFqSUMI8OblG+Z7JwdzeDCuQ+?=
 =?us-ascii?Q?mFUD7i0uF0a/FkOId2sbFC3SM1LY2W3mIGM5KeZVHPJdiIbQGN5/lpxQWAnp?=
 =?us-ascii?Q?Y62b1zfLcwuvhu27eaZJqJ75n36nuALlMd9hnhw/wBuj6ON73lK0YlsDyIKe?=
 =?us-ascii?Q?UmZIw8q7sfYT/tPA7OsKEYmeuX2SlDyBnTv/N5ccUZACQz4zZG1JFND+rlyy?=
 =?us-ascii?Q?ng/iMT4+0t6a5mmAHXgJUY0jY3V5DNgQoCE0920RTXbXodRtoIduINkCBwvc?=
 =?us-ascii?Q?XlMER0wLLEFLsnP7Z0F/RHLkKuCzX1+Cmsw2jc0axmFKO0DTLZAlFYXOBhmu?=
 =?us-ascii?Q?7i2fiIHAhIKJYD+VAjc/J16vcl4OsyVt5o9/UORFdtLYsBqfXElkuA5HBlSn?=
 =?us-ascii?Q?/CBvX/Wn53Hwn4QO+6w1nt+RuQRO6XS4cr2AGFsAvPEutecG1+F/DhEni2yE?=
 =?us-ascii?Q?5pD4hPSX8BrtXtut8YimR4n1DxHEEwN9tlWarap/UB/dAP3XWMZJQkCCz4ny?=
 =?us-ascii?Q?niyHPVKcR5cOX6xgWj0buTrS44U3Zui0OWzFiDdD9RWUINRvJBDZdBF9mpJj?=
 =?us-ascii?Q?AdrdNLYq/HxMxCpU81L+3NPrn/ws0VBYpm15MaO4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0663180a-6d2f-4133-8100-08dd34861252
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:27:39.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5tJ7KsnjvxRrzunuRSNv8QXR/VhVXC26/dqD2MoTfMR8Wzq+MZgMpUdcF9UQEeuX70WgMOr3I2oi7eMGQOWwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10185

The synopsys covertiy tool complains "Using uninitialized value
bounced_size." at some condition.

    sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
                                         ^~~~~~~~~~~~
Although it can't happen, try remove the warning by initializing it.

Fixes: edfcc455c85c ("usb: chipidea: udc: create bounce buffer for problem sglist entries if possible")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8a9b31fd5c89..8e496b7d940d 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -673,7 +673,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 	struct ci_hdrc *ci = hwep->ci;
 	int ret = 0;
 	struct td_node *firstnode, *lastnode;
-	unsigned int bounced_size;
+	unsigned int bounced_size = 0;
 	struct scatterlist *sg;
 
 	/* don't queue twice */
-- 
2.34.1


