Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349D377532A
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 08:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjHIGt0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 02:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjHIGtZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 02:49:25 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::61b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4732A1BF7
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 23:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBG08YDq3URoxBbYYaQ/nhpdU8YgztQ0uRakbH+32tMKEDPMKJ1PmXHiFBv0J2upHlP9bu0CGupWF7JXt0PS2knHehoZwgHdIgQOMFH9fAm5YMDyScGQ8t2c9g3cZsMPCwztYa/6y2XGQTkrQeCHneJ0io1AaZZWmOEscg3WaYucRrwRSoVCB5RtGGKl3DjxJfY5MhEV2rcfJKevdbU/slw47KqpdaHQstyHN2imlTs5jQIzXUR6vjxw41tueg2UEU+GCb2r1X4vVY1WC2hoBkwb9e6OfSuU3ED7wnjVFDHAlF9i1gXCrEbqcK6bM3bdyZrrMVnd9GgLoQFxQpyoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcc8HqfjDses8hNqV4H+NiRdDwiz9GrIrj6xk29+Qwk=;
 b=b7nW8JtBWVvs3Hneh51wh7rwY+ID3KtKFpdUF/sTaMNPn2YT1jYomHfibMDDOoQ5UYiyZ7NUCKl124LtiIVe6BOVUaFbD78opPnMotjiSPkZRwmG6GMp8HYq2mie20txvMvKhtL92pag2+5k21RuM46B+d0GctLw603nNRzNZxtX0WtQwux0tLedXhWHLcMVXNcnssBJqneBSLrvBviEiilrF2fZ0H0HHI/CiG79eKs8rioqDgoxQHV7Q8XpVTncvMQvf5FrmQ4DqQwpxDA8LTDLf8HpA/7k6WdoXpt9cfduhBgi4Xf+QCTDDVv7lo2d1HHNueur5yzUETh4iU/EDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcc8HqfjDses8hNqV4H+NiRdDwiz9GrIrj6xk29+Qwk=;
 b=SL+jbQTLysmw2ckZfaz+jnIYvEvZa7lgOeutPkCDeHpmNuMCcfK7KDr0Ep+Ko72HWdu0YMD9I/JPQVDJjFixH6le4LjcPkFlo5HlTeIw+4AbqKtBxMIwyclph+Ys5MO+W3co4RIzk7hKEdiGv1nPRCvgnl9U0dC6C9tqouJmUpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 06:49:20 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::85e5:acf6:574d:a2a1%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 06:49:20 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
Subject: [PATCH] usb: host: ehci-sched: try to turn on io watchdog as long as periodic_count > 0
Date:   Wed,  9 Aug 2023 14:53:27 +0800
Message-Id: <20230809065327.952368-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d87daad-1b5d-466c-a554-08db98a4c1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQeB74hIw62hlqLFt0uTb1OcQZ6099l0wSQ6cWkLzxz0WdqRY7bks+02eR+GMUyG3oE3dR/34ZgTEgVjUHNmLee8SVY5aE1ySK7wMuQIz53cVcTR/wOVseaguUbXnvvzmgi5pn9umsTj223utEu0fPUxt8cYkHWYGf66mWoZn65HJzb2HlktSK2dt19456q9RepaVQe85TlT/EM20T4lCkn5M/ch+kssjJH8zTzqJTduAGsXp2XFOUtJEKqJu3tYbr5orT6o9RC9SHqPRmOUAq0J/7/p113amlEuuCS/fXZ9xKSonD8EfzdwftIVUeBTPxLnbUZaRYU2REbKS21soGYmjeikOxJG7lrwBLZckRY0BfM0FykYjrX+PQ2Vz0B4CXhGVg70sm4/shje2AnSRLU5/smc/HzeaNx2Xmb0FEXetJ7KkyszDzNtG802KNu/OSOz5KS42v7UAT/O6vlUbh2XwtkY+VIocS/MqRph/n39KA1kT9qk4SbgwEJC24RzNFzsH8Kuv+9WIuy/6hQwtLKw/lyXqjq88Ut/jK0cwyLt33uYsxJ2gtya8TRjfPPs1AKu4BlLtd3/Z8/Co7u0MnFisbNrnKeGW/s2d7Z0+PWKHj0+njGhRFBNYtJKe65a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(1800799006)(451199021)(186006)(8676002)(5660300002)(8936002)(4326008)(316002)(41300700001)(83380400001)(86362001)(2906002)(6916009)(6512007)(6486002)(1076003)(6506007)(26005)(36756003)(2616005)(52116002)(66946007)(66556008)(66476007)(478600001)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LIPTJJ3Chz/3EUEXPaicxTQ6KJ1mZX+VUde8KX6fiLskSoGygLvmTFXoJwGX?=
 =?us-ascii?Q?oeaRTuG+LMdc7rB/kfEI3kE54Qhx6eVa16o4UEGKOLlAIziTrzdG4ZAjvOiS?=
 =?us-ascii?Q?9eeqIhSC6ENGW0vo4LA6m9A3AgW/Ln8F3b8oOUXxaDSpq+diIDhC7xo7qgsR?=
 =?us-ascii?Q?eBlaXtUQx2nZYLnXNqM8qindfBrp0lM+au39EwrvWaT64xxUmM72j6ZZ5u4X?=
 =?us-ascii?Q?7pAoxHqdVQVetIDtutjWLosrnXl3rIoVBxG4ccMrHIyMmpE4cIhPPv5l+/qJ?=
 =?us-ascii?Q?zTBkd4SiRbIje4mb7miyeU33vlfFo0roEsP1o0Swtxy+x2LjyqROXVg/YtiI?=
 =?us-ascii?Q?7XkdNIDJBleGP0C28VICZ/NfQxiXppLHryVfoDnQ9zue+0ZCQOAvv+rttqFv?=
 =?us-ascii?Q?owOB2/CO8AOwcxHt2DQkYzPRCqNLI0yhLRwyeznIwPexYNbFqRGe7kneV0Co?=
 =?us-ascii?Q?+gwJbJYGe8gL4NSIOqNTQU/9bCIpePw+vBsoD002AHYXnkmRpFaeojmvBVsE?=
 =?us-ascii?Q?tTFieYI4v9THsBaKRtgrg7ff4q5BSatjf5tWDiYyLBpOmKfH4z9HO2IEMSDO?=
 =?us-ascii?Q?xeGiFWrB1nXEJ3H/IPpNffUaNmd/jWMIZj1FbfJsuh4ZYZ3cSMBypEXTGxtQ?=
 =?us-ascii?Q?jEKEPdWxDIHXY4k73DEaoN6xiwvUdXTO6hPz4H9bcEFL+pp2JoEadb4xYkTf?=
 =?us-ascii?Q?uzfswnzZ0gjDAEXJY+b8UR+TONHW0peE/QNIsaCgtLqdG55d36UQPruedm8W?=
 =?us-ascii?Q?WfnYM1CPnQMxPs2ZHbS0swtHhhl2V7IEFAxiJvPJwx5LRSEzxkxItO9ku19i?=
 =?us-ascii?Q?vGmtIBD9QeNucT+cTEHXstmVI7+r7pPb7My/X2Et7jiP4XJINnwVEykT7QK0?=
 =?us-ascii?Q?nWO/TATRtE/1qWHQk+LP3WlLx5qAV1IhFJ45B5CZUkRIw0PtDQuw2tgAgDcA?=
 =?us-ascii?Q?4ZMix3hDGr8bQcTxC+NF050LDmSQAuBYcNFjIAtCkd3rxRbL6r/HIG8WQUFZ?=
 =?us-ascii?Q?i2j+FIGkPHpObHsAkcvYxBbIFbvTJMRoPGbe9Ws5nC9QxDkQhZk+/btE1og7?=
 =?us-ascii?Q?852J5Qd9XVgRrUU+rG1kMKxkc4m6MuqtUX0OMJOvyvzCroY5Zi5pGA4gHHhj?=
 =?us-ascii?Q?KVpStSmFvld14DhI/h2tAVDlI54myCK3nXF6YplX5E6od2+kDGaXj4+h4gdp?=
 =?us-ascii?Q?zLCpm6RrdzMb+B6M8XR0hbEJYioiq48n+hHiY5jTRTHW9t2FyY4liKWPQg6b?=
 =?us-ascii?Q?EcOJsCOo1dHQwr1hMCJy/j6osk2CMUECzMvl4tb8/6weyusBs/1yQxEfCGm+?=
 =?us-ascii?Q?Z3m6Qy2thfm8YlrcWlB0rGfJUT5Oymubp2At8SLB370c+/66brF7SUpylq+O?=
 =?us-ascii?Q?dcsHZvBtTDKnfJDipDomQu9dMtMVl5zkh2Ob00ZQ9falNiqZWpF4yWxgvsSZ?=
 =?us-ascii?Q?Y8JJWWzJew5VzOdWuKvmSLWCUQbBzfw1YwCUY8pJU/i0pX6PfAZWd5nx+R3M?=
 =?us-ascii?Q?mOx50mikEYAGiyC1+XWKKhIX6dtO8u13QiBIKMnB4IeYJP9uEv6cHcozTad2?=
 =?us-ascii?Q?gHVlnG13IqlqUb3CSoCcOqeFIU5rBy4L4HZj6o7i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d87daad-1b5d-466c-a554-08db98a4c1e4
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:49:20.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czB//ub1OgxpuFR0ujtPCfuwFdgPFz5CbS50KUgGsqyxT8orVSKJn2K3M8Gh+2Z0DOmc7xH1cWU8L4E2Cd7gPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If initially isoc_count = 0, periodic_count > 0 and the io watchdog is
not started (e.g. just timed out), then the io watchdog may not run after
submitting isoc urbs and enable_periodic(). The isoc urbs may not complete
forever if the controller had already stopped periodic schedule.

This will try to call turn_on_io_watchdog() for each enable_periodic() to
ensure the io watchdog functions properly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/host/ehci-sched.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index bd542b6fc46b..7e834587e7de 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -490,13 +490,14 @@ static int tt_no_collision(
 static void enable_periodic(struct ehci_hcd *ehci)
 {
 	if (ehci->periodic_count++)
-		return;
+		goto out;
 
 	/* Stop waiting to turn off the periodic schedule */
 	ehci->enabled_hrtimer_events &= ~BIT(EHCI_HRTIMER_DISABLE_PERIODIC);
 
 	/* Don't start the schedule until PSS is 0 */
 	ehci_poll_PSS(ehci);
+out:
 	turn_on_io_watchdog(ehci);
 }
 
-- 
2.34.1

