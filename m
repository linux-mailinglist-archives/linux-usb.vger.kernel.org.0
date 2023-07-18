Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68804757A5B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 13:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjGRLXE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 07:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbjGRLWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 07:22:54 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048BB1731
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 04:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgUdpGSHZ5ot7+R6F7uC3LTymauVkB/QQhmiURMctCH0lK1u59Q1D1SsYG/Y03n9txbUhwgUaLHDR71l04e8PasMqXLmVpw/q+PPKQLMo4XslUc9qNh0lrS8BH1y0aQ91wspvXoyb+k9jlP+9I9a6lxP9bNtenbk1P+wi9QTXumtbLKBXcnwJs3zlSV5343iGrf8xQftScjX3h/bxk5ZR5cA0m3+YHe0qL+6BtoTnMX6FeOgHGSWHwZ51J04Y/ZOl5ZmyR9r+lxwNyrDJW89pIZolSE9jv0T2VGQNmKPq142uz6FKpL++dhvVymrqsw2LPRvDrKh11XkNVxgtpjggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxYM8wAOWLY4g48aacF1x+UadbVDfLASTVbSiy4zkeI=;
 b=Lh7s5tWcL6PiYzeY6NT0Zfu+ehNuMmbua+GcRPZaCmqO13vHlKb8ANcH31OJUwKr21+bnIrFS1jzzEP8sl0iI28+fXnIhjjnxN/FTLqi404IDEn5UZw7JnBTIYgJVo+UUqKXXS7kw+c6mxtpLjhEi3zkCObALt5+SCnGZo8xRv/alaxezL/jDfNo4GzhFez/N10w2ipjNJhsIutVq6Sk/0qWpJd9f7l1khBYVw6JT7JQO0FN/Hq0COwleN7e11l7J7MSr0Gim0vw3PXDhb/M/87Ze6+1iMirDQcHkpOSaWAl2H6iGgPmkmzB04TZe9v3JgMy5EgZOPwtNqgByQHn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxYM8wAOWLY4g48aacF1x+UadbVDfLASTVbSiy4zkeI=;
 b=nIUweqZmj1sHMNay9KZUwYwHoxpIQ1ITey3gt8tuMcIueFHo+4YwEaXrHV0cZqbOfW0uMipx8Xcsdw7yV+Jy53dJ9iMU/kCiyu8eoI2KRb+/UzQoZVvuS+Zk+9N9RcEjB0+CbGraJ5RvhfD3Kb7tpJNydsYsYi0YbgeDJjtJQYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Tue, 18 Jul 2023 11:22:15 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:22:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        xu.yang_2@nxp.com, jun.li@nxp.com
Subject: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware list if the controller has stopped periodic schedule
Date:   Tue, 18 Jul 2023 19:26:00 +0800
Message-Id: <20230718112600.3969141-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718112600.3969141-1-xu.yang_2@nxp.com>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d23877-ad59-4450-c49a-08db87813d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKVelnQ6df/B/AGdPcs8AGaK7ORhsrf9g6hEjli/Zoh0v5zxg8e3NwRp569KMAzkZbJIsWpClZmQTD5fb2GsgyK2aGCOzGIk/cZgkHQG+RI3oOWWdtkqGVyUsSz/ycQDJxkwlxnkFzraAClCFLW/YoLXSYdlp/7YdQWSAYgaQtX1ffPoRHHxFAJi6EFfzuKBe2ceiLvYv8DGdSIcmvKIT//HK74AFZeGLNwOm2PBP9VzRzMFsdnrCpyXzOpqmNxT+3HK9pC/ob5S98K27OIkbXE8E5aGF+6nj97+eQwvf7u2v9By7ntmXqdGx0G1sB5UaI0+Ad/UJyh2P4AvK3HXJdQ0fdqM8XSUXPkAFK5BrnyAu5J/J1JNnRyUcUHtjPwzEw4YovWyu6py5v6f5H14tWdRDM+Ta2SoHSI/1po+3/yyE7h8W99trwzYJHOxiRAPlM8jLkxmPFeDv49XHrI2v3BGvlcHPwcmEacM/NV4eNnp0KKt3B0pY2MZA8Ql+uFUE/0w+TZ0kMAeEAIDr4lr+jJHWXVMrsISfthd24EhegZW83AA5JzJl/7AQpFk96lMAQnpRFsrCiicMhrIKLnJ7yJggvReyxnhtxnhdk32Iz7D2cILm4MiJTifevpmFY/h
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(86362001)(2906002)(66476007)(5660300002)(66556008)(41300700001)(4326008)(8936002)(8676002)(66946007)(38350700002)(6916009)(38100700002)(316002)(186003)(36756003)(2616005)(1076003)(6506007)(478600001)(26005)(83380400001)(52116002)(6666004)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?36uZ5+rrR8CXyCBR1qdsiXMn7fOpAGEpI2oOvqKVtuw6VF0adSlneIKXvvRG?=
 =?us-ascii?Q?7ndoKLWexxj9KA5IX3f9KelFpAhNSQ32VyURQEodxzc1Rs9q6du3C2Qf8Zw/?=
 =?us-ascii?Q?pGzh6ZEsM+2nf4Ed3sg9c5M2PUsm+E/sAfCZLJJW3hpskl13Hc+LJAttc/xK?=
 =?us-ascii?Q?b+7zMJyd0dHxG2amYW4SmqaXUgtFhS8a/XzI4+6keBlRTUWxaoOKJ2u+r3tF?=
 =?us-ascii?Q?mDB7Ya/S/UMd4OW6uAzbyagmea7BgMv1yqiF0E5J9zx373il18Vqr+2oumHj?=
 =?us-ascii?Q?+zpP8IiKgwc72fb2hgKqFD6aZ0AOHf3sYREfV435ceqFGSgDm+f9h+zFaviP?=
 =?us-ascii?Q?7TG365kb0ThvH0VhLivI5LNpGkClp8uVBPPyyONGObtsbCMNeZy2S72XW9xD?=
 =?us-ascii?Q?gJ/7a4NZIRqUosdb4+owwTRqG41wPL0bWzYBZnToC/RNeNCsIVm6WqnFkvlw?=
 =?us-ascii?Q?HsdE2oROsg3ss3wxLSMe6LDdiYHiTPuzj3rH1cRp/9/EOyh2uiKilNKozhA2?=
 =?us-ascii?Q?oF1TFeB9r9aojsz1wcELaO1UAOl9cyw8EGebcpu/wkuSGUO2gAnQDDV28xxc?=
 =?us-ascii?Q?jWG+Lb9rQKJdaDynBfM2sY2dUE5nmwbThdFLVxzt475kE6gpSo6yHXT1Lw62?=
 =?us-ascii?Q?y8Fa0gEDUX0CJkpsobIhc0Fe58aH0UY4+i3O/Trmm9PBI3BLumrDQtnjoJWu?=
 =?us-ascii?Q?sXqKoqsJdoJOFGdt+wyIoPX8SxfFiBZ1bqOlC3nVGbj9tKB9oUfTGvOFlftR?=
 =?us-ascii?Q?fismUPOztEkWtDsd76pOr3nO1vpztiO9RFedBtUqDBSeS2C7KzCaHI8XISH3?=
 =?us-ascii?Q?66WWxtjXFwPioiPxwXzxs5g3cjZWMdWrHgFLTUxhyAWJowcRC2KFEDHGt7Id?=
 =?us-ascii?Q?bpeVkXNx0KVf40Q4ozPRi0cxGxhp3L9a92kswBYT/tGf6lPgySZoAzZdTeAc?=
 =?us-ascii?Q?dbPxAAIVcMcJ8XMz+wr70yo2lo+5V4D5ANDVC6YVBiIlMDjtCrnxFdpNg4br?=
 =?us-ascii?Q?cvHOGEm9gmbdXwmAIwJoG0U7B1Zy5yZvBUSrcKnWzXtQ7uipKRAD6RNvrJ10?=
 =?us-ascii?Q?Na/3xbaCIbxvWtCN5lwyDkfbJ43zJzYy7Yl5jBtHZ7PLL+dXGgq6AaU2ZURe?=
 =?us-ascii?Q?hlkvBsA51AqTMydAWvlCjpwgz2fxSWX7ihoY7ip4dZpCsF/8jV90v1k7IMrl?=
 =?us-ascii?Q?bkpE/GEz/OAqxq/kz3ZR1u2qOE2bE8K205BwowLTHo3pbwygoSMSujIBLqo6?=
 =?us-ascii?Q?5EXTNzhGXd8m09BvbTlc79tKRVGV2bMxFg1RuWINTC9jhtPih6Rmu697241F?=
 =?us-ascii?Q?gaJzR8DZNiq2qs3ESxsnpgTkw3mcCOYvATFh/FC82qeyd9rmTGg6fPDtPDiI?=
 =?us-ascii?Q?TWb2y5gEhorKeW30iKNTAnut0mw+Y5j9gbEBg4UNPGek4MIcuuQLLsLzJZfF?=
 =?us-ascii?Q?W7Mpp8T9ccOLsm8Ykt+p87xLRTb3mM5OcFs6Gq2Vxk9627NfYCaZV3L18/FB?=
 =?us-ascii?Q?BwwpCnDMF66ieCOOGtbfJsiKCHnYYntG2GMIzYXca2bV5/WtLVU1pOiq9Yw3?=
 =?us-ascii?Q?wtKSQDGBwYsmYTNdO8ecIPMhHna35EiSt9O5hcz4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d23877-ad59-4450-c49a-08db87813d6e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 11:22:15.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1yjPElLjq//rrulziwZ4PVT2DHUmaovpc9VfXfqLqENbdSum3oEmbZAdHiZj0eyF88CH0JxeWSu7uEaRRNwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current design, the ehci driver will not unlink itd/sitds from the
hardware list when dequeue isochronous urbs. Rather just wait until they
complete normally or their time slot expires. However, this will cause
issues if the controller has stopped periodic schedule before finished
all periodic schedule. The urb will not be done forever in this case and
then usb_kill/poison_urb() will always wait there.

The ChipIdea IP exactly has a bug: if frame babble occurs during periodic
transfer, PE (PORTSC.bit2) will be cleared and the controller will stop
periodic schedule immediately. So if the user tries to kill or poison
related urb, it will wait there since the urb can't be done forever.

This patch will check if this issue occurs, then it will unlink itd/sitds
from the hardware list depends on the result.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/host/ehci-hcd.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index a1930db0da1c..26dc1d1ae5e8 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -930,10 +930,41 @@ static int ehci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 
 	if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
 		/*
-		 * We don't expedite dequeue for isochronous URBs.
+		 * 1. We don't expedite dequeue for isochronous URBs.
 		 * Just wait until they complete normally or their
 		 * time slot expires.
+		 *
+		 * 2. The ChipIdea IP has a bug: if frame babble occurs,
+		 * PE will be cleared and the controller will stop periodic
+		 * schedule. So if we don't force dequeue this urb, it
+		 * won't be done forever. Here, a force dequeue is needed
+		 * for this case.
 		 */
+		unsigned 		i = HCS_N_PORTS (ehci->hcs_params);
+		bool 			need_force_dequeue = false;
+
+		while (i--) {
+			int pstatus;
+
+			pstatus = ehci_readl(ehci,
+					&ehci->regs->port_status[i]);
+
+			/* Any cleared PE means controller has stopped
+			 * periodic schedule.
+			 */
+			if (!(pstatus & PORT_PE)) {
+				need_force_dequeue = true;
+				break;
+			}
+		}
+
+		if (!need_force_dequeue)
+			goto done;
+
+		if (urb->dev->speed == USB_SPEED_HIGH)
+			itd_unlink_urb(ehci, urb);
+		else
+			sitd_unlink_urb(ehci, urb);
 	} else {
 		qh = (struct ehci_qh *) urb->hcpriv;
 		qh->unlink_reason |= QH_UNLINK_REQUESTED;
-- 
2.34.1

