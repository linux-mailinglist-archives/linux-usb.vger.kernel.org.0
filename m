Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245975F8A0F
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiJIIGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiJIIGQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:16 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19112DAB8
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKmaHgeifuN9AMzhZfu9NWgfQ9iO7Wbmp+p7w/RfIj54/Oka2NfAESgNgPd86krCln6L/C2x0tWOl7TcTFb3Aiy7k9SaLx6OVxlSef6n26ELOdPtl7KkZG8yRCnXzN8dZsdHsddFY7cJ0lCdkRM9PkzL6464/jTXtKZl+ByFVuSy9snNTt2+EIlgdVPiWpr91L6Z0cO4cIPbitkFAeTpzzOyCY74qFK52YXTfbt0pbNHnE2JqDSYZQfzXrlfriYtMHmGzlRrO9q5nycVo+5Y+oOxAziLbYxN3uQwjvuFkRUnaD2oIJ5gWYEnyDOyIhNzvUdqi76MdpQA6SK4hN+awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQecZ+QavLsvC2E9wmm4WoqEGk1erl6dZJFaCV3rQCY=;
 b=djstzdiwbkzgZA3+nQ1tLr3+htfBYK+Jc09I/6ekfGcswutgcEofzxDHmNoUb5sn3qDPO8Q3lboFQXvuIhsjhZi9eRRaZiW0Yuen+O183WckNUE9Jgr9UUw/73UtNFJmlU/0YzUYfhS5wMZoqfvEpuCTzomUvFheL8V4jCnZURYIE1PAfLcO4gpEB3+VJ4XvtHB6xdVWZKJdSsElcoQyjUqh7f4WT703q+kp1rbjznhsOBoxALb1T95d01CKUqqOzvCGmhLahXpYvQCVeIbvehiiGYdnTv2nv5F9XDopRujAUE6naelymHFl90YCSRaxhggQEuh6YWk0u3m3bzOC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQecZ+QavLsvC2E9wmm4WoqEGk1erl6dZJFaCV3rQCY=;
 b=I9fCRB+f5jQz4hNUDJSLtSiOXI+H8u0J+0lStlrUTcvXFiC1n9QyxGiYqX86a+dLHcuSI4D/T2eU85f/3b1O0/7qaqSrJJtMPjXq38T5v7UzOVbmEkfSMeaEvj00DnsiaAVBvSFwjNtmtPfUsdUuKCxyoPWe6cUd6Dkt3LDTYP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:13 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:13 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 3/8] usb: chipidea: host: add suspend/resume support for host controller
Date:   Mon, 10 Oct 2022 00:08:08 +0800
Message-Id: <20221009160813.776829-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f141cb-9e52-4c8b-ed8b-08daa9cd220c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHR2GphwroWfm280bMHaYL3MzJfMH1JCYJZQ18vOYPWval1lZWhrgF+sB7oFmsRLOTNpLDEqmnRJzkXzaqKmCV046a0sSEiaQmUxf2HVHRYYf9nzOwE49J+fdXj/xOP6Vzw0AmjZJK80wkgz8u0+k6yFV0Zx2qMLkrFa4oCZJ8rth9Xqbs/ZhALHB99caIqMeeP1ky5OO15TlM+Bx77qrkb/w8ncfVMSClzU7lOQ/+EY/Y6cfEIABmxtIdq1/HIv9vM7Cl8uKnkPrbdzzr7NT6jJzyJBv/Nxtq2SJRSZx9DvMLWvlOCUHiSM33AOjgadi26fMh3i8jlbH57oMxDzrzfYi/l7wA8jTT4NcvEqjeW6RjkbioRysHAemIPWl4uhWEOeukVPIPYzFFp5oQdEx+rdDoJaNyMwRNv/hPnj+Z8ZxVhPHC7BafNkDJ8ilFoumbbLmMX3fX87GQzpkshTG8vLWAHehAi3HCxE9hLaV51jBCBU+01uCHaTxjzYauP2G0nYFgnI20xvyl7a67fb06b/ew65VieS/5FlZG6gResHSV06Cf36It+6T6eUvg0tIzyJVuJZgo/ORLjAbRelKrN2RcLCK412VAl+VU3JgoKjuMRM6fVi2jr9O98NaRwflc/nmwqJt7PgILwwaKrGxhhZkXKZPCqxHuLdLPTn1d35nWmH7gLaHovjQeugqSErbdNyBfzicJCMcauvuB+doj6KN69umxIWXuMjtRDnBF0rNywKBoj8+Zo0lMZM2FHgUbT788Vo+M5BoDSByXawlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(15650500001)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qdk7b5ZtpM2fsqnLZ5YbKEKnczCS48yYXuiXY6yALRs3rFbxTQ5NJpE3G43k?=
 =?us-ascii?Q?F59lKUA8486jyecW2plzETZS+hJ6E1WlWeQONxct2c+b8KxlBfWJZOKd5ZpX?=
 =?us-ascii?Q?F3oqVf45DBoOBSGJQguMA2RXckKd2xnBhXx+Es2PCqn9JqMYyk4K1nLXYNwq?=
 =?us-ascii?Q?jVEGY4PGDmBCp7puG6yPdysgQ4zhe+tH4idWQx4rh5j1XgD7HjM3HGA6P/xl?=
 =?us-ascii?Q?pCgWX3RFCg/fekyTuYAirn6j2xhaWYm4nOknnajIakB/wfAXHGLb63gctky2?=
 =?us-ascii?Q?xxXHYWOuNh/7o0r4ClJGZRU9c3MA69sqyIKm95L7W25zQJSEtJ1uorLgT30y?=
 =?us-ascii?Q?QYDLEViE/joXBV+IUId7QX8Bve8qqSI++Ymq97/T3ODlWcnLj2RTNbdbXeF+?=
 =?us-ascii?Q?Z2aVN63ie9yNLJOpMsQ9D1CSBJAJCDm22ymVkAKgx5tTe/5yWREhQUE+Obx8?=
 =?us-ascii?Q?TVnJZnUSFvCcUjf6HzoyxZXHWXjXIY/bfTZKlSzMqRriieg8MUMEK9tkx77v?=
 =?us-ascii?Q?NmgyTJsTf/dmPgYdsnDF9VHP7McyQPPKy/Tw+9CgBUFXV9v3R+fIaYWHfVGw?=
 =?us-ascii?Q?YHnsuIkEXLoQj1V+8c4xctihhWP/3/FQvhiZxfJmSpywRJ+I2KwudfXpAZui?=
 =?us-ascii?Q?E9z1zAMSVHmDYG5I1XkiRZwilSUhA9QJdAiLu8K8h8EpaccBIdeULHZOP1De?=
 =?us-ascii?Q?zz4VS2YzUYcSBc+J7632Upv4nKOfNR1ta2bivBPd8zJCI44gf+BRtOuvOidd?=
 =?us-ascii?Q?vamqGaVk3MQcOwyqNj3ugLIsv25g822wA2C1B9ucdQnHYiioAAIl0FT4bZ00?=
 =?us-ascii?Q?no1BD51N1eZTj2xfAKocgCvZSLGkgRQVzpwwPMsA8j/oFjoCs9Hinh6tnQUa?=
 =?us-ascii?Q?HS0lPx70iSUsKxniPzUaI2cMGWBzC0rGXbLJ/xmROuzE5GDxeQrd1nsGNwMy?=
 =?us-ascii?Q?Q/ECq3xCubQ4FIKFU0QAn/AHuGu5oAD12LHxYMdNKqnRvJLbiiEgEC5S33ZU?=
 =?us-ascii?Q?Y0zdPUv6teT3tQ4UPIajdN9cOk5hK1/hDsuR0o+IsLfp7cn/8P6kgxpF/yNr?=
 =?us-ascii?Q?7gMhU6bDS0vbNuqG9aYFvbbT2iYjD7pTKfJ+m96vHFpXEHplg4qZJEk29Ttd?=
 =?us-ascii?Q?19tMjxkGxH4b4nWyggOF49TiLiNTk7ONPM3Wj+Ee74nYAHZ75xwxeUaHKbDq?=
 =?us-ascii?Q?tA+OEJlKiDujEkgxr6RIB26rj29jYYctkbRGePqDxnelvTIoANelR233Fahv?=
 =?us-ascii?Q?qHlgefAJrF57bCvLgGS8Op9KKHYg8YaESprgWktsBY7RzJn2b6/7KLCl5cd+?=
 =?us-ascii?Q?YsxlZYRTS8Hl1LaspBqWE17ZywIq+AfHM4etHb62ODC/Q19e1DSnxjDZx+rR?=
 =?us-ascii?Q?NdpxtUeD1Qi5DnCcbff6wFpz4sG5vrtVJ9RLQuxrAeecuefvpa89bPO4g5+2?=
 =?us-ascii?Q?a0CObQVgARWUoULI0o0UtqQAgkauPyRxumPS3dP5GnF2Be6H1Bxio9teDVjD?=
 =?us-ascii?Q?61q+PVRYvszn1GO3+ElT8bqI7QE9g1uqrARPWqf7UGODJ/B5SIRqdPBIgbOm?=
 =?us-ascii?Q?b1m/93+yqWjbJxEf874EE4et8FVz9AjvIYPcgQib?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f141cb-9e52-4c8b-ed8b-08daa9cd220c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:13.3663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hYvxtoRlnKa3wTdIqcpBr/DUqwAFQI2gwPwIJKxNEXNRH0MfW1BKs3jQDTN2OK/Ny91Qxppu7Ss3PKhg3TpIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller's power may be powered off during system suspend. This
will add suspend/resume support when the controller suffers power lost.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/host.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index bc3634a54c6b..dc033272c31e 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -459,6 +459,16 @@ static void ci_hdrc_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 	ci_hdrc_free_dma_aligned_buffer(urb);
 }
 
+static void ci_hdrc_host_suspend(struct ci_hdrc *ci)
+{
+	ehci_suspend(ci->hcd, device_may_wakeup(ci->dev));
+}
+
+static void ci_hdrc_host_resume(struct ci_hdrc *ci, bool power_lost)
+{
+	ehci_resume(ci->hcd, power_lost);
+}
+
 int ci_hdrc_host_init(struct ci_hdrc *ci)
 {
 	struct ci_role_driver *rdrv;
@@ -472,6 +482,8 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
 
 	rdrv->start	= host_start;
 	rdrv->stop	= host_stop;
+	rdrv->suspend	= ci_hdrc_host_suspend;
+	rdrv->resume	= ci_hdrc_host_resume;
 	rdrv->irq	= host_irq;
 	rdrv->name	= "host";
 	ci->roles[CI_ROLE_HOST] = rdrv;
-- 
2.34.1

