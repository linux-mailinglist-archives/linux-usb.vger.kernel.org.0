Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F242C9824
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 08:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgLAHbA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 02:31:00 -0500
Received: from mail-eopbgr20050.outbound.protection.outlook.com ([40.107.2.50]:30790
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727533AbgLAHa7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Dec 2020 02:30:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9VhYoxZh+/j3Xq+MVw/iNHlvqhiQX6od7JNHbItqjj6WLYk3DV1evKYWGvVl9qZR+kR9rM5qFIw1rHJ/smqjoxZGxCaxSZQxe0GffPr7DbgOlqCC6aON6zw0jVuHCPtl+avV3TFWnSUCkXlbCDbH9XEy+ZzvowVmZraVbJDIbfG+AXaGk/V4rtECae1iMKRzn6rEZ8rIKCjhP8mgWGDGzlnvBciTurg9j3RrVeoESsPfBj8SBaT/tL/w/qnanfhgYIkU0KYtA6UsCfPM+To7U3D7exY2XL2yUiIz0G5UeatneqpbkaE3nL3qitTTu93M0agrAu6yF2QhxrouLkViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk8ulykHWsb0Hyd0skfGxDVCLsO3A+Lt76cKq1Gz56I=;
 b=FIRBiM0FGKEQuLKcP/lv+vQ0U7+mJlPc/9Ntx4gJ6XgnyCNQuZKdFHq22z3vnaVN9zSAW58hdgI8UeigdGg0JhGRp09HKDhzN1fNRjMU4UwhtYnRHtVoathFKiLL8HEcTpN1VVQb42tzR2BuFtzkDlDThQLsF7znqV7pdnj+B2DegvqxKTMZIhPJX+a/QCRih4vfKMikOU4DEyCARdv/ZUMZiZXm1N+TRfKQWVGJLeObSkbKift5pRtsvFBcgsUmmWrfO/YfPDQV0SGN4ecJJoq5BLjt01+OnJ8vllT4la6qnc9jx5bUdiuUvk/OBAXZ3yf/DiIweAChjHjaPVvZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk8ulykHWsb0Hyd0skfGxDVCLsO3A+Lt76cKq1Gz56I=;
 b=U3z6XZ7l7iNl3gmWPJnIdk/BxUvrfpge53IVov6bdDk7LuSTXKfuxv0JtS8GR0rft4HQGZNkuT/7cO5epN9kgWKGWjpRC+RDQNhNUJQCtV4jbpqSXGExOZTUhgnPySdX+0ST6JK0pRP8ReZsupbLHvaYFtLTv/U46jyugEKaZnA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0401MB2576.eurprd04.prod.outlook.com (2603:10a6:800:56::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 07:30:08 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.032; Tue, 1 Dec 2020
 07:30:08 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH] usb: dwc3: gadget: fix delayed status missing for clear EP halt
Date:   Tue,  1 Dec 2020 15:22:37 +0800
Message-Id: <1606807357-12574-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0194.apcprd04.prod.outlook.com
 (2603:1096:4:14::32) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0194.apcprd04.prod.outlook.com (2603:1096:4:14::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3611.20 via Frontend Transport; Tue, 1 Dec 2020 07:30:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: abf81a8f-e507-4fc7-b65b-08d895caee1c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2576BE1FBB8E87F32A15B8E789F40@VI1PR0401MB2576.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: um6KAB6nlzilOcBLO5EwRoeGRIRacXRop2KMCHhs6/h35GsQl75TWAwCya4PsaErEPSNgGwTmCMH8QvN4TLShsjS2fYjGyy+UX1PLLhw0bxENB3k1Rwoa30Y7AZ3bdq3zP9a0K0oJeVrXfF55zg/JwBTh6e8Go28xIJlQdnoITz3GI+1S4N94ItbNquDvsRaBRwhTNm5EtDWqiv6nbxt0EgYNjnPxso/lvgZAP6B91Z+1S+w3WhKfYy6hOhn7Ra1HlyAH78HAhFbQvNIyiztJI4VI3NsOypXiZ8h2bBeB2O4rDO11rWpI3sLbWHJm21VIWgeZ+Ad9lwMUoGnwPLPybIhZrw0496xD8Lk31KyR+g7aY00QhPPquXZHf1GcRwH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(36756003)(83380400001)(6506007)(2616005)(86362001)(478600001)(316002)(956004)(66476007)(69590400008)(66556008)(66946007)(16526019)(26005)(5660300002)(2906002)(6512007)(4326008)(52116002)(6916009)(6666004)(8676002)(8936002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5jrvzhLDjxt9lWNbz+gHAgwR9x4c1HbsAoEs3H5iGrJeGCgyv9/PnafkaBgs?=
 =?us-ascii?Q?mfg4BmwGUhL5DJIoDk36nWCxtg77es1BsXQpAEg5PKCy3WOw7qwZZlq1vjlv?=
 =?us-ascii?Q?/5fPn2fia+m8VxdfsV4Ht9m6YI9ozuvnbrLW2oIW6dAUmMQRS3QK07pSFTLV?=
 =?us-ascii?Q?gzXMPSVtds85SUFw51xhLvdySy7+Qz+Be4FY5mfXch3l2S05nz1qZov7fns0?=
 =?us-ascii?Q?NL6cDvJ0/y5fu12wMIZm0ph98rPoS1irh4nqRIh4B3UHFucKWN3jk9NFTVO7?=
 =?us-ascii?Q?cEQjYU3ZR0VUDKNaMfGGdQjyg0jX9L/G779tgFL64ogfgZoCM4dIAEijqXyw?=
 =?us-ascii?Q?FjhTp/ws1mSBMHrBSe1MvEjUc6IIi5SigevssEOWQcMMMqnYnlbfYf2DMTOK?=
 =?us-ascii?Q?LTC5wbodjKopCVqbypuomXm+y5iMCX9gBh0u9UsZtOp8jlHknswIMACvJnTM?=
 =?us-ascii?Q?3LEKWw9kaA8jyxRMgwlV6VLR8HU0+IqqbAJeU/jKvF5NjFEgoMSLIv2YY7B6?=
 =?us-ascii?Q?23ts1AhMK59uH2x8SrEIJqFQBLwQIC5xwEnZ8GoQshZhxzhErFS6d0UwEQB6?=
 =?us-ascii?Q?s1z6TSjMt1uE36+y15dM9r6td97xao1S4seq9GroU9t1dxsdPQEGrIl3wQJQ?=
 =?us-ascii?Q?+EvMpk/V6sHhd3gAyku4pyDYRl0jAG7QgTkj5YZR/9R2OzYdZsd7g8XAyApJ?=
 =?us-ascii?Q?3kSaJ0Q2QwnmECLCzeSvKcTlqkeOxs45zcctxm6I6lj/hzZ7GyiMBMFuXdSF?=
 =?us-ascii?Q?Kut762Ccpe6ArkbE0mFMM76HWpqMxC62htjgPtS3RMYdyUXBE+TOCUjkE0Eq?=
 =?us-ascii?Q?hApX+DIuMY5t2+we4UU1rHQ76Kvtr0Y/zrK5f+zpznGa9rx9jABr9lDnoP9O?=
 =?us-ascii?Q?zcmqh69d9ERj+4CSW9LvxGSjLrx8Y0VeRk0J2JBUIjuNncf/Q7qmYC7GZcLQ?=
 =?us-ascii?Q?LtgwVUSc7d9gjwQfZYSKbsKiGUgwOHy5TTI6ZsnTt4O9OrBA4xW6CMLJbqVC?=
 =?us-ascii?Q?qjrg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf81a8f-e507-4fc7-b65b-08d895caee1c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 07:30:08.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6gXppi0RCyhrVMs1K5VArb1pK5r4+Kc6BTeaNGJsoofeD6fTs+QHX4nODK4eQqJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2576
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With several improvements on handling of ClearFeature(halt), there
is one case of delayed status missing: if the xfernotready event
comes after end transfer and clear ep stall command completion,
we can not send the delayed status in dwc3_ep0_send_delayed_status()
as the ep0status is not ready, then in xfernotready event we still
can not send status because delayed_status is still set.

Cc: stable@vger.kernel.org
Fixes: d97c78a1908e ("usb: dwc3: gadget: END_TRANSFER before CLEAR_STALL command")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/ep0.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 7be3903..9580e9f 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -1058,10 +1058,16 @@ void dwc3_ep0_send_delayed_status(struct dwc3 *dwc)
 {
 	unsigned int direction = !dwc->ep0_expect_in;
 
+	/*
+	 * If we are ready to send delayed status
+	 * but wait status pharse, we can clear
+	 * delayed_status flag to let EP0 XferNotReady
+	 * handle it as a normal status sending.
+	 */
+	dwc->delayed_status = false;
 	if (dwc->ep0state != EP0_STATUS_PHASE)
 		return;
 
-	dwc->delayed_status = false;
 	__dwc3_ep0_do_control_status(dwc, dwc->eps[direction]);
 }
 
-- 
2.7.4

