Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFD364E65E
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 04:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiLPDbd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 22:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiLPDbb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 22:31:31 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2077.outbound.protection.outlook.com [40.107.15.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BE237221
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 19:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng+6xR7SurQDW2RRVDT18TzSsAN+W/CvwAR9bX1YTQicRXrYnQRqMzT7Jo8ZcMOd1Ajmr2p5hJ+tGnPmOwAYNLtICWlr3qyRDrWXZDwIXNM7STrd6kE55WHsx/1mi7KSq15+JaieEAoNQ5tGLxTpAoZu36WNPu272X0NbD0lyrg73yiZzj+yHOaRp+RSuc/RxWDItNqw7OnzHaX0zM3J2qrlzRCcvJ2EyTsbfcpCStxgV3zmAHWrPjwUMYWVT/LBCXTmzLRbLFjxXxMaFdo+YTujs+PANBS3J7oaDTjMHjToYaw/pz7nupRe9wvGWqw8WOwQF1NLsx0NcOTO1rQEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2kX1pD8/zbdFO9PIm1hpCXb6yl1DjK1hTKsA9e9ii8=;
 b=kobXaL+iFbykbYMBvF1ETwlO7IypmshVqJ5yRAJChSm+WtevFiWUsYzm/UfovupXCV14zPrHmrTnes/3i3c2m8lmcbLuOfBDiw3eueSvSAY3ICOJolYLP/iR2Fj8OdXwO6D9F32B6UhE8tFqerh7QsUe4sBooIfcxR4duAZmOlYCnJVo1JmGSa3f806orKaEXwB+mHHZRFjsoKRais9FDkIuV+BKgaKadtaeSCUKszN+WNhDQ4leRCvkWz2rABucmSzjPpVUx4IJCbOWB43r47SSt5w6Y6wZ1Xxb3Ow0Re9aHYbt4+QuTqSVm/h9uZ+UWhXfzxyO/b3+3lWRVC7MTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2kX1pD8/zbdFO9PIm1hpCXb6yl1DjK1hTKsA9e9ii8=;
 b=f+O93Pcz0ekQ136g2nZFH2bFtpweVXSkG3NENf0Ur1/X4D5Iwj0AYl1D7nWjqpNUPslCcTdaUHIiQkndiyYlyJaoheQAyGpeWDRlqnUDfJUxFdjbUQFFUVWf0fcpV3C52uKRNjanlidRDqDqo/n4ZXEEvZskuZ1xRegl8WOGGCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by AS1PR04MB9583.eurprd04.prod.outlook.com (2603:10a6:20b:472::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Fri, 16 Dec
 2022 03:31:28 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%5]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 03:31:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: typec: tcpm: fix create duplicate source/sink-capabilities file
Date:   Fri, 16 Dec 2022 11:31:50 +0800
Message-Id: <20221216033150.2683718-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0065.apcprd02.prod.outlook.com
 (2603:1096:4:54::29) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|AS1PR04MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 2194a93c-5207-4126-84b6-08dadf1603ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emZFXRsfitvOgo9JoYlfeAgqMGxui5NvX00qtb+vHxH/MeM86krF9ND5RM8sYE9JOXPfhdK3/aP2QhWxUABNCiSW6pD9Xeaqd9sHc2Xnhs6IEPtLOPZaYoVWtWEnyZ2sky/h9iQ3TFdNk3uDUoegzsD0YEe+OLeMTEXgm9wPI8kB/g/3hjZ5K42KXVnncZ6+cU1ujsCFV3yGxL87dUXm3zC+uamJd3XRW64JBFvUQXbBGyQlLpIyYjC+JGpbVyQ6rAQtL+qOkkYX+9K371+Kv0lLUo9ZUXh7bEk+8yjQeCEMLQ6PVKb32DjNHeBoaAGfpzkHHZmQtb5MTKsSjowbi/6gZKE6HiAv+6DQjfKm11K89rSzG8igX3uydXnM1c0XZtvMGUrHKmBG7mpquZ2gR43f4DRgcec9nyhT8QoTawMWCguPEAIk7S+z2+pir6OJF0qukV9b4rwYRcgJKSKFxQ+cDPB53/1a4I+5bDBxaxOJmT5+OevUBr+77K5o3rnD6cCnDtutH7yijLzNX0xjLHYsnF6t1Amt+wzZt21OBp7TCRXf1OC1/rZjd1vDPTREAvGtvK8lkaJrkpuw6f0PMr+ILnYuEj/LRohlKodCMOYyLOI/oAA18OeMyobPg62K5iQxrO7wCy1ADLyHUg4WbqyeBoOzvl4MphL6Ew/+a8YQtKez8htTU4zpkR1hTd6X
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(6506007)(6512007)(52116002)(478600001)(186003)(26005)(2906002)(6486002)(6666004)(41300700001)(38100700002)(66476007)(66556008)(8676002)(66946007)(4326008)(2616005)(38350700002)(8936002)(1076003)(36756003)(316002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WdoztsYspp+nQCpexUOUuy+2DaSLhf275fycU6j6muTfZLCJk9C9jO9RCsBQ?=
 =?us-ascii?Q?r4rRMdjYxJOCOwS1JLfqQzlRcWB314i4SWuThSyF4/x582dfnk0lr2VJ+8lD?=
 =?us-ascii?Q?mPF+kEUdITdV2ITbNUO1ySwhUL26uAVFJ1wV19cmpPjtuHjay5WpR89sWwgl?=
 =?us-ascii?Q?QrKZkG0s3N9bWS5tcqQ/UNg975D+oGifYeaeDnwTmTN0gmenfYVy55m5sxqm?=
 =?us-ascii?Q?YQG9UWMaPEy3Y+qK5rrJ855q5WaVmPyDmpehXMpWYrjeIFqIy1STyOYaO3jS?=
 =?us-ascii?Q?7AL4wdh6gcQdIdURw7aVUTwBQLru1QmHPXMpH8oXe8EGy5lV01Wz3CHE5EgN?=
 =?us-ascii?Q?LiYhCQg91Zy0jKAY2euL/9KMycC4FLeLOLZrFYu13cW/ulR78zIAzsDN35ss?=
 =?us-ascii?Q?DjQuqvczAzDbgLgfHMScAJW6L9jA97HStWqVxXRgW1R43A5hNnwAR7wAF50j?=
 =?us-ascii?Q?h5OBch8YY53cH0fAc/eIbvbs7DCysbTa09ON7M9AdUYrRA1Of64aY+85rqHg?=
 =?us-ascii?Q?mPnITwzZ1J8k6iK19E+rCoGtk3zSyfLFAZ4o12ZvEx2zEuo4hs+YOtPinJVr?=
 =?us-ascii?Q?/IeDNzFK+/M4wc3swLfghsei6bzpu5xwlHCII0cF2fx3P6zw8f2jvGdxYY4w?=
 =?us-ascii?Q?rIhaBiVO+bgxYyrqzwoJYRzNFEOfc8I2LsVWpOzgI/wz6t7kTIdd6WVurr3L?=
 =?us-ascii?Q?PrIggmKbjz7PkX17sr9FmvQ6ZfMGhZ8lCl6ojyWl9SSScvQxfvFZUNYjGy0N?=
 =?us-ascii?Q?WCjsSuxnXDdew4BS5NGCZX46wKqW/2kF8BlbfsdWHbYnTy1XmdPwAbYmPEVG?=
 =?us-ascii?Q?RzIvOtQ2CVHNKcyEGLEGQ0zh2dm6qnqtFVJULE5lL0l7CRru19XrxTUXocqc?=
 =?us-ascii?Q?v2UYYptCzIq9Jn0vxPOb8Ftu6lu2b0v+lnishtBnk3v5niG0G5Of2+U081p8?=
 =?us-ascii?Q?KUfNvCbT2sJSUfOs57GQBYezQdm88X2bA9dwp0COqlXU3zGLbEuPCABW5XMS?=
 =?us-ascii?Q?Okvyzsja/OZMI1JlGCIHl7z/IqW3XPqrRqMHMLO66/ar0bMACSw/F9hIT4d+?=
 =?us-ascii?Q?h7dL5sIuvNHlR1YNq8uyzwXEQw2/7YHJSQ1FWgrH11SgtlCIgrUKndhKEgKk?=
 =?us-ascii?Q?Fea5HM2xiN0l1R16x4cvkFw8cw8tfVeZ9TWhM80q9+K0cUoNs5qMRtaEQ5Vr?=
 =?us-ascii?Q?zetNoXE29fmPfu/QhZWWnC7e9GKGE1D1tDIgy711o7/hIRVxbEcSfY+yjGig?=
 =?us-ascii?Q?HNH9mpehxUkchmfEExGg5tLMYE2ZQvK5+Z43WLcqQz5OYWpXnOD28tQbYZFC?=
 =?us-ascii?Q?vRzFQov0e7q4n5ubiIBk4qRd4Qz8KrX/pf0A1Mw5OKpjY7BbbiihuZf6Ktvu?=
 =?us-ascii?Q?gxHK3fD4Y7KuOPc/xB3GwkJAzkfyV8W56j2foDhdAbbARYkO0rD4z29C+wAg?=
 =?us-ascii?Q?4bz5NHu8XN8NOeqRbVyJ5qjC67p4YQm48TZeN4KQV7FOByfKy9cvCnnFiQ98?=
 =?us-ascii?Q?hFrvz+bxyWfpOrg9SeytTJiRs+4EiDMGSghGFR74nqwZMyIn93RgjFib1F07?=
 =?us-ascii?Q?oe6OvaXTEalj+OFHprNLG0KAPBvqDfdvIzwwDu4T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2194a93c-5207-4126-84b6-08dadf1603ff
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 03:31:27.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkY1vi4XnXC/yiNQpmqZLiSwIOIovzlPUtvNQQXuMrzXbIzu5F/vvHm9PrLwN2S8BybYWiu1cX0WPAbEuuAEuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9583
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After soft reset has completed, an Explicit Contract negotiation occurs.
The sink device will receive source capabilitys again. This will cause
a duplicate source-capabilities file be created.

And the kernel will dump:
sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'

This will unregister existing capabilities before register new one.

Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 904c7b4ce2f0..02d8a704db95 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2371,6 +2371,9 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
 	if (IS_ERR(port->partner_pd))
 		return PTR_ERR(port->partner_pd);
 
+	/* remove existing capabilities since got new one */
+	usb_power_delivery_unregister_capabilities(port->partner_source_caps);
+
 	memcpy(caps.pdo, port->source_caps, sizeof(u32) * port->nr_source_caps);
 	caps.role = TYPEC_SOURCE;
 
@@ -2394,6 +2397,9 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
 	if (IS_ERR(port->partner_pd))
 		return PTR_ERR(port->partner_pd);
 
+	/* remove existing capabilities since got new one */
+	usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
+
 	memcpy(caps.pdo, port->sink_caps, sizeof(u32) * port->nr_sink_caps);
 	caps.role = TYPEC_SINK;
 
-- 
2.34.1

