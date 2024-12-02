Return-Path: <linux-usb+bounces-17998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A409DFBFE
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 09:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 620D0281BAC
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 08:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE2E1F9ECE;
	Mon,  2 Dec 2024 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fmyediqh"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E451F9A90
	for <linux-usb@vger.kernel.org>; Mon,  2 Dec 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733128496; cv=fail; b=WwINW1cJzdci13oNUPyl1lRmpolNguUcK2sAw/2sLIxCz1+Y0iA3yTvReOVyQF5lDxV8VYnjO69j+2Hl7+JSUtF2rL3HImJ4kEWlmWum4cw+MLe/yxBaAsfk3//RnQW664UJuPdJahFiZ6V4gAxGW3iz6cf8siPo1KYQYuPaFFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733128496; c=relaxed/simple;
	bh=HTob8ECnYY0pjWqn/UP/a/G9BgScLq+wE81engs67HY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FwcN7vZdMe/VRl7IjqgGv+U931mdF1NVtHSZjVgG1HlD8doDxHaOv3wq/5wgcBdzV/psLpiiBJFWCBWZoBAiU48BuZKWKqA2R0LAMRhr1ph5Ex7/vldr4IJToppeS0THnW7y5SpPTycSq1LWg78KgDxMq0sC3Y+6S1/85iA4gso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fmyediqh; arc=fail smtp.client-ip=40.107.22.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB8f+kR5KQhxUW6Zi29pAFKe9M05HKssxUYb9YvjNnmN5kw5PDxyvYr17nEdN2d2Gi7LEGL5Osa5A60wJ/fnzGTnFY2LvoqweGVQDB2F31bVMPI5YNgCgzKRwXsJ8FQbK0Yac7nOd7w9y7YV/h2feSW5MyjtV2c/suf+jDUEoaF3RXSymmI9ZOOW699HZo/o5vAU5GxlCxPazSqqhAbU1Ri5c88HHuEN6XzpPEHD8tK625LLmYdHG44+Y3+chzN2Xa0pS4zvBiKbZeSzt8BDVsD0cODmsoYbvNc8RUpMgklaHvIbPBvk9k/NGMV7UDiMEmkRHMI/m93U/aKWlD7NoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAmwkI3N8VF9+/ZMJfYG958lbQBPl0INIn+c0P5H8UU=;
 b=m80NAqUyprwB7mddmVFuKbD6d5kKOaeDgBvJR1gCPCs0iYJceSiZA4LqGaA9GXqR7JrDniC907TKVL8TdtCc+5aBnsxQsXWUnD0mchLdaGa3uFwOC5m1Z4zKuhccuJG2a8hMJLYAkOtGpwh4f05ZytPK0Y0fSlPrG9fe441o3are6Bv5KyLlEgPtMsqGxNaG56bY4sF9RjC+LNDtu7SMA3IbkntIrXJhCMeNFhmw9OzncAvBzz1q4LeEft+tBMEbmKC2mjtcaP+kkYUH7FMOMcW1lXt2LiawjXPtf4WwFQ8qo/ERfV6lwB+EJhwPH/Erd6u/zb7btQ0hFhpgRWVZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAmwkI3N8VF9+/ZMJfYG958lbQBPl0INIn+c0P5H8UU=;
 b=FmyediqhZpod9eSDHOWHN2kgfTTkiu83BaoHkmAT9rDfOOw1sI9nMfXRY4ACJA1jl5tVaea5pB7incuD7sPTj6a1cjyDP6f82Z+7yOyqncd5JkB3y5YQAYtKhH+ZN6YUGg9lILZRbDIanKHcW2m7jj4vy7oLNXA63IY0de5lclMKraaVwoGnQq34OpuwmIrbr+XtoBiuUtSmADqaLTfMb4f1LM7F4rDfLCwqG36kvbVG3jua9qkI6VmCqWOuGWFaB4oxA2MuKTVGqp1w4kawDNZYickdiZslBoqqiW/00NgxdhPu6ELAxyU6ciCPNYB4ESYzE5wE1dwN7PPlhtafMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7543.eurprd04.prod.outlook.com (2603:10a6:20b:29b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 08:34:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 08:34:50 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: chipidea: host: Improve port index sanitizing
Date: Mon,  2 Dec 2024 16:34:53 +0800
Message-Id: <20241202083453.704533-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:990:77::11) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaba9c0-5d83-4d65-dcaa-08dd12ac2fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x9B/syM1fy2lm2I360iHCAZ2pwErS5hYJWhwT062zxEnH3uVI+yKPLmrXBd3?=
 =?us-ascii?Q?bru4keDvMrP0axcffJdikIolhKF/C4Bnk1TMhhxOJq6gpcZxSnycxL4k1yMq?=
 =?us-ascii?Q?++ozjfAL+x3l/7MZOeuqmO7yKlLm549ZH7bGKy5XPYF3P4OcHFD6Aw9psYYK?=
 =?us-ascii?Q?ji4QJY3cBhn1ym0GMDj+tCEO8Q6c0EtNyD81j9d5HSiZRo758RBw3W9066Uw?=
 =?us-ascii?Q?qh5wX7Besf7tsyxWVvWKie+h5lkbAhKzQB/xJit3+ccdxaUFhqS+8MNPuyx/?=
 =?us-ascii?Q?2iUgzjAm+LfrwLqRVYCc1FcUXhNNwNj55cly/A/BdeeIA5hd92kAOC/L/06e?=
 =?us-ascii?Q?jPcTxFJJ4On2RcILmrOgF/lQH3RAS3OuaTHy9ouTbSfFXgp8pBGRTXAUg6Vv?=
 =?us-ascii?Q?UJN312EiY/ruBo2n/MSG1xqLZFn8kvYId4KWa0gdCPhyh0g2GtVr7lRlHjMg?=
 =?us-ascii?Q?kgDBmkC1HoWNWrrUjZ2BCbdnZzj39NcTVebPdqV3RbL860QmdmVYaS/eaqYK?=
 =?us-ascii?Q?Ejqnz2HA3zqF9iGrm9kfv/jzqQV0ZZGyYf6gP3GlA+HZgtwojjRpMet8RPg/?=
 =?us-ascii?Q?dsV/FM3+sDGewP9WbSSd4y8sMYYegSn5V2cjbdcPq4Wip4VmI9fw+0FwLhT+?=
 =?us-ascii?Q?hUAwu7de/lV6+jzjS/3QgLlMp7Eo3u8tQ94psdgWtNcghVZH7JrG1iEVFlga?=
 =?us-ascii?Q?GancypeNRiPU41ZOIzdyHFjXGdUYWxXyUWv30O48L94ROnnkGSxUkcLSnNgQ?=
 =?us-ascii?Q?GLhiuderOdzwnFxxZuSqR0h1M67SbXDNVJVSrfeYn8/bJgsZCfrd/As/0wyY?=
 =?us-ascii?Q?NK6/xOoxGKiCm3VlMJTrz9wQiVzrWccAzzNAcZQNpi0xHrd9mmdzCKrrSSL2?=
 =?us-ascii?Q?DKeZ3xhye7qNahu7k2Z0j/QzcJsMGD/W9MP5HE4u+QLAh90if61dNyChpf9d?=
 =?us-ascii?Q?vwuydyfuGNtMIAWc7bD9+gHpiD9I+Ty37CGx4PSi9z44AF37U89sm+Q2TziS?=
 =?us-ascii?Q?EtltOKL2p1Ki7OIs28MgwAykmQ8HxtTT+oTgx1XSByGtmLRIiniSKXKfgvil?=
 =?us-ascii?Q?9SuP4uziK3DCj+iEj9GHT5ozSNmSabLXEtbhMK8EvScn+2oOD+8a9lgcRtSZ?=
 =?us-ascii?Q?Nf/K50bev7h1atgLI2cSKRvb60JV3+yeECaTDVo/4/zqqAvxqa07vyscDG0P?=
 =?us-ascii?Q?GG85C5vi+0OGcOlkdbT6y68GR54+HZS3gnDNsH3cS01upzMvGyEjOq/UjCFr?=
 =?us-ascii?Q?+8pQP5uscDWZEE9UKHWetvBe8g+XF2Uyy1fJ9NkMB2hG0IvX8ozy90POmzyw?=
 =?us-ascii?Q?JJJQm3ogr5GTRm9WTfgsFu0hSM+9W5yHIFWk2WK32MDiuUrbDEcsZfwqyUdY?=
 =?us-ascii?Q?ytZfOwVQAh0cFXHxdB06MhFpC2aJheVcOTWSDOW54MBMkCVnLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tJMSeZ67ZJWnrkYNv++KJilFKyOvOiVWJH8BE5Mv0lSvcWbvzSavABWRaSUu?=
 =?us-ascii?Q?iMDYnRGeQkdZzkzj+FOeAfdYR4SOGErZFILguXvdFFKkzcGFnj/75c7LITCO?=
 =?us-ascii?Q?eA0YljmFLuwRHNeCKLSkJwEOsgyy3VPRiKJYha2LfMXDMqed9GdUX45Bpq8t?=
 =?us-ascii?Q?a3MQczEqKo3tBOQZ4JOvFwRRJk/TY9GE9EZNvtFX6xscoSeBaX/yTI97rJyN?=
 =?us-ascii?Q?QAE1RsBAtz6Cb92388udsg5NALQYnWfEJiLiQ/qi3bbgx51Z9BQ0Ro9CfwZS?=
 =?us-ascii?Q?bv+aZ+Dmwl+SZiIyuTD/AetEounnw0FHZOgaTZbRgbjhA4/XCMgSf9Qb2OKs?=
 =?us-ascii?Q?34FvlaPAwnogZSWiCVZ5GUpInOBVNq5ujaAC3FXL1AKIEGqcjkxZDC9sidM/?=
 =?us-ascii?Q?Mx7FbQI5RF46mF1/MEUPAWZTY3NZKMP3p0FrigM8R/4bqscVfuhgn7Tvd2BJ?=
 =?us-ascii?Q?t1yGtcWZkJwwYYy2gRkUKLwYGhUJnlBxfWZNm86vq242PN2JNUgpQzivxw+C?=
 =?us-ascii?Q?o2JcXhksYY6aH3OtI7Eas1Ztgd051adv7rSvsgJed4iJ/x9n/QDDEezFBf+e?=
 =?us-ascii?Q?gia8u49iukGoNKNADt9+sJgnpOzmNH1bERm0GLecwRJkPPaxArMtf30+XFKj?=
 =?us-ascii?Q?Qt+o4aD22P7BHNv/rV4JlSLkR1VMmHODlMSibVs7W+AS3bsq1AM64CB160iG?=
 =?us-ascii?Q?fHd/677pOnTxOB9kak2UZ8Iypm6AATO0DJ4sgreJLg/KfH/eY9k1XAekjayG?=
 =?us-ascii?Q?4O3CyGf7hMxaXbiddhnB1eg6YjX6tRlH00LYaQtJfdCrOjTONmKTmRifvUfK?=
 =?us-ascii?Q?Reu50f6pUkGgLDH2NsYc1wX//cRxc4bRULCZ4X/Vy8H+Bsm+Wx+ZmhDHbmzi?=
 =?us-ascii?Q?c/NCsWCUTN4OqUF1nbgDjxIAqgJDk4b6r3ovFdzENf/075XsG17duD2E75O3?=
 =?us-ascii?Q?oaFzrCkymeWEs4v/+mtoe4kMmrNPXajAXtProUZ9oVpWcIAzf0X1uT4LNorR?=
 =?us-ascii?Q?O4rCyPnoGTlAdBtWg6tqF+sbNQYrAlVIA3NlpPNWJciDpG7EIbXjYhlFizjK?=
 =?us-ascii?Q?nntkfVlb47oU71WnsWR/YqnD4wfgm+YwV1pgpjvyZD32HaiD6s4b/wSGSV3L?=
 =?us-ascii?Q?PpTDJ2Rlw5XhqjO39ZQsxGoFwnNGCpiIbu5j4Yjqd90/1xTJQEIAoz2iRCyx?=
 =?us-ascii?Q?jTcR3Jft74epFqpxchKtviD3/SRh1G+iVu6j33mqvefAohIIq+9f1JNK70cX?=
 =?us-ascii?Q?Q31t/SzExDStA61N1wLqDk8LYXxaFkszDJ4wvrWPv1fbJNtb+8HAZ/OTCsrb?=
 =?us-ascii?Q?5AJrdanshnN4mseovXhsNiNgAwjbeRj3bW8ha8nyJV2D7pBkAl9htjoVsigh?=
 =?us-ascii?Q?2l0/jnUdA1Q+MSPMgT0QroRhirAZdMAaTuhGWf++na46G5EscAZfA/St5mbW?=
 =?us-ascii?Q?PYO1hHodKHMfhnsOXJiBWiHs//Nj4ZL83zaHB08HR/iQ8GZUywAHHxptxLa1?=
 =?us-ascii?Q?aMKt4PrZ7GqjLtxnjRkDM7MWPHeZ2nNUHU10E0WQr0RrctgH4AP39yBKoYQ8?=
 =?us-ascii?Q?DKlSjOrBLDpiW0SLOVV23PMrXmgcvF/aOouAdkUQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaba9c0-5d83-4d65-dcaa-08dd12ac2fe0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 08:34:50.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obV8rgniP1r5xsnkV7Zw7qCS6N7AUrhBuQx3M8WYuLxg9iHUNMKrhVMqeUC71Q2qPwWO+IsFr/LXglJ0qCL2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7543

Coverity from Synopsys complains "Illegal address computation (OVERRUN)"
on status_reg.

After below code executed,

  port_index = wIndex & 0xff;
  port_index -= (port_index > 0);

the static analysis tool see the value of port_index is now between 0 and
254 (inclusive).

However, ehci_def.h define port_status as below:

  #define HCS_N_PORTS_MAX         15
  u32     port_status[HCS_N_PORTS_MAX];

So the tool think illegal array pointer may be obtained.

  status_reg = &ehci->regs->port_status[port_index];

This will follow "846cbf98cbef USB: EHCI: Improve port index sanitizing" to
improve port index sanitizing.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - rewrite commit message to better understand the issue
---
 drivers/usb/chipidea/host.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 0cce19208370..442d79e32a65 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -256,8 +256,14 @@ static int ci_ehci_hub_control(
 	struct device *dev = hcd->self.controller;
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
-	port_index = wIndex & 0xff;
-	port_index -= (port_index > 0);
+	/*
+	 * Avoid out-of-bounds values while calculating the port index
+	 * from wIndex. The compiler doesn't like pointers to invalid
+	 * addresses, even if they are never used.
+	 */
+	port_index = (wIndex - 1) & 0xff;
+	if (port_index >= HCS_N_PORTS_MAX)
+		port_index = 0;
 	status_reg = &ehci->regs->port_status[port_index];
 
 	spin_lock_irqsave(&ehci->lock, flags);
-- 
2.34.1


