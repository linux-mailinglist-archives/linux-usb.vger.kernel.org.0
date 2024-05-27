Return-Path: <linux-usb+bounces-10576-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E68CFC3E
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 10:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A7221F22705
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 08:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3614869D31;
	Mon, 27 May 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FT4rZUIY"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2050.outbound.protection.outlook.com [40.107.241.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E203044C68
	for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716800173; cv=fail; b=FXbZ0GdTceUaAo7Dr0U6x2vk8ak0M0UOQ8WWt1GL41PFltCwWcUpaeOMCiXLQylu5e6NL7aDHCBZXfNYE5FySRR8btUf3+Ad7qSLP8yraM8lvfiKmrl1Zo+EjAB5auWVfqs7fjJDNbBQSMIFsxyGkK+t/cu/q2x/SPxVGCFThBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716800173; c=relaxed/simple;
	bh=fb7oqODOOpFB2fPHm4CZpN9Wb3k/EBcIjvCrsGPWzV8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fj/psGMflmAR6xqGjcLIvpK7DeYqbv5d2gxJiTj/hM5lSMH55TqmU0jDLrpcBkUovgK+BQJj2AgiUa3VaVrx0fcWhMD+cX/lmanXzpbQnoJZGWxSBHm8oqn6CCKrkKN8vRDKp8OhUaItrY2WKbAjCVU1s8YwIgDSbrvamecJeMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=FT4rZUIY; arc=fail smtp.client-ip=40.107.241.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVzfM5pT9yS6ViUgJOilpZ0XZX6lFrr+vUaKHS3WlWhmNbKT7vPk5Rx/926PPiD2+EZWhuA3v50rzSnSbj/C0XkZF2dZUnvY542bBnBHJcGMZ7jT5K2wlFQli8jYBZ84yP9Tpz44DPspXpjW2xO+pOLUhdgovednr4BFpwZNSfYUQ1eZLohRNuppK4oTJP5hg5vvRAmUXoqg3SilDHMegVZiAHIzqxu8WFTYG1G0T3hm8rLaBHHryW16O+LJ7Wk5lJ3rQjEiEGZJnsoH0ANewfKGeSEF77Iq8fRrdFrFI/j4OucmcgvK12KutOaAnPMOqrq9lj0dX0bH9mImSv3C2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmIKRgenPZTqGVh84fNJCgz9VZurqWhEsYTDQTtS/Qs=;
 b=To8nihS0XFP3TVoZozW6KFtDFW5YsI2VMtjR9KkWV8lW0u+MyZQTd+Z3PjGegFJ6HPcNcqcU+lQyaA9TnyAF0PFAYTZKQkQ7RaY6q19mZ9jpr8JNgTdVJ1T1rtRr3S5zelxd6QEPEggaI7iAbkBfU/nTgUBQd0nyO2MBzj5syq6pjKC+Ik4xOkf/j1zotZxKuKbo7HPypUaNBo0PQbuQruyY9q1pMKTFndG+CDCEZ48gtcQXKEk2PPihMid1lnmWAvNlAkQDaJci1N4ZgttWL1Sx1p7wYpmXtlBtaBZk3mug6ESBKsowXTIfKJRd1fWNSbczLf9beJDkP+lhGQc9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmIKRgenPZTqGVh84fNJCgz9VZurqWhEsYTDQTtS/Qs=;
 b=FT4rZUIYfUdrCQR769hF5eLTELzDqeFOgeshxCpSI6W84kmXAo+xEKl2mvx6chlUEMeFmjGR//8Kt5lH1BbXoooORt6cBCQBvdvUtilLgR3/3QnrdptJXhZVOv8ifW5P0iEbuzxqcKgn2pDft+LEnY6BE8dDJHNnm6yLVgdf8LQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 08:56:08 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 08:56:08 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org,
	jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH v2] usb: dwc3: core: remove spin_lock/unlock_* to avoid deadlock when suspend gadget
Date: Tue, 28 May 2024 01:04:13 +0800
Message-Id: <20240527170413.1107831-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0135.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df2576f-37ef-433a-b98c-08dc7e2ad9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p5TyrSRXtki+czVPA8Y37R7TDFbXUuDKo6swf1Sz87Oe8Vfjb7hHXyXCsVY3?=
 =?us-ascii?Q?PPRawFoamnOeVN83VLLg6f28gDHrcZCEoBxlVzbSWe5kHFavfvHhikM9iOJ4?=
 =?us-ascii?Q?jFiiQeX+JC/8UhpYPPUOr0e9+jDar5THOQiXGWBtIxGIrkfRf+HJE19CMuFg?=
 =?us-ascii?Q?c7xfaa5oCtoSGPoZ4QBFozlVbulC+GqJgggBGJ+BQwq8uLIDnK3xRPqiXtjV?=
 =?us-ascii?Q?ygCTwkwtnRLgsGmfg506mbrJVzBGO/LIQGQ+oNl+tE67moOtSZsUZNZ5J3k7?=
 =?us-ascii?Q?Mg40natEjFNt2gUUFVdTHpqWHFj3wbQxWlFyWXRs/dK+0NBrLggr08qy+N16?=
 =?us-ascii?Q?unXzI393uYqoTEOjeXG31fZO8HnMamUNk4C3pYT0G9NHVYfZF+2vylzqEU8n?=
 =?us-ascii?Q?z2Z0LdjV+SH9L9oGP42/VeuSxMrzD+eUTgYhaovDNumPiZkmFBHqSa24oNG+?=
 =?us-ascii?Q?yETzLrSrY/R5kWJLrVfNEHDDVg9kYL1RAAMUYnlwp7ITc2D5JTdBfqPZtCjS?=
 =?us-ascii?Q?s7+uuMDdHG5tU01rgQB2XlBCTELFB1CWA7iSY5khMGBGC4dIwn5cucQPK9of?=
 =?us-ascii?Q?X2oc8Gdk6kOSsYM4znhrAKUbUYJHp154SQaLmtDTigK7zNeaiHlpVovNiAOy?=
 =?us-ascii?Q?Bx2M/30msGCA/BkLxXjmF1QbZVbpH6WQNBybOrlFngzjxUsU5bfELWFM5gKj?=
 =?us-ascii?Q?+KnayEQ6yJVOgP/NTWFRXq5zk0SWcXqsYN1TxzPqUq701IYu6MhNgfnaGs75?=
 =?us-ascii?Q?YbCBH0uAL89V0no2sLZq1oe24sdEXqsnJHdpv7kTI6nhVLu8bhnCQBd6pl8i?=
 =?us-ascii?Q?8uJyu8u8coCVmreGDznmVZWKojeJ5vxg0qs3rUeH/PVZgXJxDwZwRkk4we2V?=
 =?us-ascii?Q?jkVna4bhRYTFYaiIku2tEZ/uowGa8mi1C+qlRjpzKRIPtPjeGvQ102FDfb2I?=
 =?us-ascii?Q?/889pRVVhDMn4TQxLtrjJjRDJWGdu8tzoFnzlksFJz5LZwRDiGPOb6kNAVH5?=
 =?us-ascii?Q?uEs9DKM50ZCNSR44LIVnfO+5sqg7JclNJ0J+AuBRCr1g38Og8iDCD3C8e/cr?=
 =?us-ascii?Q?Dqscha0sNnot1WzYKGhhj6XzdOxLf0G90UKLltv4Gnx81rTX4UgMU/IBAAOK?=
 =?us-ascii?Q?HoYfwJmf2/Sdvhv1Fw3wrdAkxUxbXymGezSmm3XNqyoJF8fjaxv/LrUB0QTn?=
 =?us-ascii?Q?nizy8zlSdWMO9E9CCBLQJVMOHEr83hoUe21dX6MeSsTeqwbqXSBXg9a8+Hdi?=
 =?us-ascii?Q?fvxH8rpy8ZFN6mXIzyQuhwD1tD6td+5joCZqEXYu9ZfVEBmTXT9NYfrJ8dTC?=
 =?us-ascii?Q?zTDblQ3UI5vrbrsJevVMeOAFIIaTsu0+eW26zb6z5DVRwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t3PfiQY3HphsWtWGf4/SNNjDKnKaoqTltwQQ8gnndPecqVhsW8Lu6UBizD7F?=
 =?us-ascii?Q?Ve/i7dW2CV3owLLVguzTMMkPQD/91G8VrW8qdb6q9mYA1jrZQPof6wsneP2H?=
 =?us-ascii?Q?kfObfvKtJvf7re5ISQYlQIeJKQtBGkJdjvwqWkTYFfI9CR8u5O9u3bCXDs1z?=
 =?us-ascii?Q?u4bKLb0f1Tpz97NMU7eu4zaECJ/ZZbQiWCs7NZ5lEWWVSLNnlOPoqHqsQGCq?=
 =?us-ascii?Q?Cp15YnSYtwKIKZA3Ip1i+feXuTqi5Ba7MPmMGtKL8RRvkHeKitprUsLJRR2r?=
 =?us-ascii?Q?jrgsEW/Xw12ZAoscrJ1RiUjXUJeqn/+x/TOUK/pyhMbIJGjF/oN49tOFRjU5?=
 =?us-ascii?Q?UI1y8blnkpqrU0mMQa1LjDfVRZqH91i8MkKkm60i682dyn9lgEwmOKNL/1gR?=
 =?us-ascii?Q?30+8iX+77QhG3lLGEB4zKRz01JiUaeySe9J9m4DGDXAmbkXyCF5zZkLI9Gut?=
 =?us-ascii?Q?TCXq6Cjq/jnkZYsbYSkP1aqgg5viN5ErgrL1SjxIwt/VlodONRhsf7cRNCh/?=
 =?us-ascii?Q?rF9CrNJff2qqtmEWFSvQYrYD5L7a0/+TcNj5zxKgts6/tfjKbXqaDFOzpkj7?=
 =?us-ascii?Q?4rAvUOA8nwYGj2/uLOdFlHwY3cuktq1IVspKMckuiKv2pbSocifqPFRz3wFP?=
 =?us-ascii?Q?ozwXIR3o/t40dBgoR+MhoA5B/JimRahB3aSJnreGqYGVzMVcATE0o68RU0t/?=
 =?us-ascii?Q?DYD/GDOcGKl00Zx475aI6t7jyN6bmwYQEOrYeszZpq71TqrrJWWxzVw603Bg?=
 =?us-ascii?Q?QSMOnRdGPnTt887ApYKvdI45gsypSw4GJcAx9sOi/wJ4HB1dldd7NbF9Rhyc?=
 =?us-ascii?Q?3iBaIY105ZatPNIpxbRUFGdRKAR45EOK5FiLO+lF0e1hNzPk7OaqMOBV7WNX?=
 =?us-ascii?Q?+f/QtDTz//wMZxMektKn/RAPksNhbnNhRx+Y6QifLBbMIM4D+zn8/c9lFncv?=
 =?us-ascii?Q?/rAhQ8GYWvrmGOrLyJO3B2VtsVcfZJmBwyqdVW0n0G7miD7jlCc3dSd34A7Y?=
 =?us-ascii?Q?cQeIoNpvysN+A3GhSaB1gk6XYhxSPzuphjv3LxikgY4hKSf1W4j78fB8jEGY?=
 =?us-ascii?Q?oQWHHtZsFRCBqNp5tQb8m+hmxKsl3B1SwReGmnr1xlZwDg1EBqEiUTD/UHtg?=
 =?us-ascii?Q?ios5+uZibrsM8kc1porw7YvOacxgRgAXqrzRAGUF+a6ZaeWPhUsVnmf1ixc4?=
 =?us-ascii?Q?wvfzOtuTlzP0X3zPknkiLo4Y2jodAniiW4/EG4SGUvpMjLI8BNAqmePGQPHG?=
 =?us-ascii?Q?IYr494TyBJ8Rse9PdHfcOGZiZsATjOLOii22nsb8Nz1CKSpx/uuOvdSE144P?=
 =?us-ascii?Q?NljAaIJYMwz75zZrCHQTwgWvX3ar64r0e5g+2kpZIuBle4Cj0R94kGGsXBWN?=
 =?us-ascii?Q?Bynvj1JBOFpOO+ck5I0lYqlL43EBNDqZVzg6takmmAzWWfDJ8p5loqNO3lZ6?=
 =?us-ascii?Q?HOcdnbvNov/oPz7Ske9eHWISAQf/WddiwV9ZpI15EYKWtDH5/SEdnTqjiARP?=
 =?us-ascii?Q?g3HQUYbP+e7CmXFHcDWo0PfwrKCi1MU7sgUCSF482zhwa7zHuQ1YuF00Ple7?=
 =?us-ascii?Q?+sX+1t2yFDl3JmJfYH5j5woV28sQX+7fAcgA9Z29?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df2576f-37ef-433a-b98c-08dc7e2ad9a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 08:56:08.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoUsN93BsVDeXQX09Nd6/uXFbRwKqJW1dNFp17u5f/Hgg+pEroQ7c7MfEM5klz3LrKJr1QVyRZi9IhyriTQHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

In current design, spin_lock_irqsave() will run twice when suspend gadget
device if the controller is using OTG block:

dwc3_suspend_common()
  spin_lock_irqsave(&dwc->lock, flags);      <-- 1st
  dwc3_gadget_suspend(dwc);
    dwc3_gadget_soft_disconnect(dwc);
      spin_lock_irqsave(&dwc->lock, flags);  <-- 2nd

This will cause deadlock on the suspend path. To let it work, just remove
spin_lock/unlock_* in dwc3_suspend_common() since they are redundant.

Fixes: 5265397f9442 ("usb: dwc3: Remove DWC3 locking during gadget suspend/resume")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add fix tag and stable list
---
 drivers/usb/dwc3/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7ee61a89520b..b8193edc41bd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2250,7 +2250,6 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
-	unsigned long	flags;
 	u32 reg;
 	int i;
 
@@ -2293,9 +2292,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 			break;
 
 		if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
-			spin_lock_irqsave(&dwc->lock, flags);
 			dwc3_gadget_suspend(dwc);
-			spin_unlock_irqrestore(&dwc->lock, flags);
 			synchronize_irq(dwc->irq_gadget);
 		}
 
-- 
2.34.1


