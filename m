Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562E23F5D17
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 13:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbhHXLa5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 07:30:57 -0400
Received: from mail-am6eur05on2082.outbound.protection.outlook.com ([40.107.22.82]:30657
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236721AbhHXLau (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 07:30:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2/5VYtKWp02RcM0YrBMlYD9iEAPagrDhlc3GsnbbCSD+biR7/egYW52rPRTUE1rtx/joBL1ODoSPN3TrL1qVTAz4OcHG5PJnavlwe1q9f//WJQsL2IYYiujsbrzcfJuJHG5gl1fTBV9rxggPexU4Rp0ezSlzHTBv0XHbUWmFw7FWC4UJt80yAkkxX/XxdMle9Ta8tRD7OEde7yNeDy2fzhcQJnosvixzccYDycslrl17cicoNOPvSf02w0gJ9EyvKHHLyweHYPdWYU59b5vjCwkYCAHG9v+f9u3dqUrq8eKvDzMazvAhJULzHNZ3ZkRAEUaK4t5nYWPRSPAT5YRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D8WsLNq0+HjDBdLaYaXwhs344aKkeomHy6NoVaRVZA=;
 b=FPxEuyyq8MZyPiD93dda3txME7daBslAVbgsDpj/dIR47dizKK7KASmp4wU9JyAtQZ8PQS0gX8AB87l6Ghg/kbqKxoh+Ih+GED37d58fR6vIjqHXxSV3YqMD6O0BFXQ18CFj4zlkLNmj9n7ojzfarCl2/TpvY+u9O6DCKtOGKIvZjsN6tnvGAvDsfnS2969Xt3/niszfR72k7pOAoNHyCAlvP6iUgdirhU1tF1ExeJ4u+2xlIUCn35IPV90+1Q0DuxO92eTNleE9jY+dvJZDF9oQevyIfmG/OwZQMh3cHFx62GdmsGEnd9R2qJqHiy+q5mdeOrAA53XzFmdLhfLUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D8WsLNq0+HjDBdLaYaXwhs344aKkeomHy6NoVaRVZA=;
 b=hR8Ryzk8aaTEO1opUY/lyCmGucB9j65sflYTw4kU1PzwraEwD9zMjO7tUUTOSIAjCOoRnvdxTc7Tcen3N7e/8K90FYwAFZS4l5mybuFFR3qQnA3vyhnPH+DA5Jl7zIP1Qq+G1MMj/n9+RBUR/vLqExE162C07CX8nVP7FXuzN70=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBAPR04MB7351.eurprd04.prod.outlook.com (2603:10a6:10:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 11:30:03 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::c40c:1c27:b836:703e]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::c40c:1c27:b836:703e%4]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:30:03 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net
Cc:     jun.li@nxp.com, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/2] usb: typec: tcpm: Don't handle two continuous same state
Date:   Tue, 24 Aug 2021 19:30:14 +0800
Message-Id: <20210824113014.1420117-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824113014.1420117-1-xu.yang_2@nxp.com>
References: <20210824113014.1420117-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR02CA0083.apcprd02.prod.outlook.com (2603:1096:4:90::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:30:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 833cf716-5d23-4307-7a09-08d966f283e3
X-MS-TrafficTypeDiagnostic: DBAPR04MB7351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB73518B02AAA232EA1224899D8CC59@DBAPR04MB7351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jx+RrQcK1vWI7VjVbvl9+eRsHx9ujAnOhJjRr+mJjZOChCHbLwkvyONJ9bgxWhO2r4B74uEeZdzH549n7RS6FveJQpRWD9qttBXz1KMEYGgjCbMLHDn4XKuEnjrYxGINCz2ig3cQVqzxG4O+MggZfOmWUfi1IkSkcJhIlXmLDMrduVNeCaMxm169ryhzNyoVF/draS11qr1qmlbx0avWmZOu/dS0epxviu5/tGSePNZBOpNVVYRlkmQpyKoY5i28XrPnGpit4F8kK/LaLFrnNXxCi+SSowHbLoMNh0k/ga7puu0WhPtY0c5jX6cOl3d7uIGDTIv+tygPgpIUhfJGUZVQHjpp9VZRAW2Nqq+UkV/V9vR4MtumWgfc+71vncQxhFhfpjbzZFRDcPY/riRw41SVCKpuqk/Jm+u0bEumnRsyc5D2Gzog33UH+p3iLGt2OL6TU0Q6bB1ETc/2A0vCbJha1SSr8uBJqYEOseKkerkQMFPed3yn9jXXSYQaLq5kPub6rz7uhjrETLO51g48Ac73h+0oZdNCg9QJ36AmZDqqT17B8HtdMdGgGDkDvUJUV9h5vu//3sM+OiYoMwRkhZZK9RkB5LqW7/Ixlx2SfYASuG7vcLjwWQd1wc6EoZ8mD+OrTK8VLwbY8zFTYEVjEJgTPoVhyd2WAGo6fiXKIIbZ7P59ucQataoZqKVNhWmlbUVwHLkVfGZQvvLj0A1nCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(86362001)(36756003)(2906002)(956004)(2616005)(83380400001)(1076003)(38350700002)(4326008)(6666004)(38100700002)(5660300002)(508600001)(6916009)(6506007)(8676002)(66946007)(66476007)(6512007)(26005)(316002)(6486002)(186003)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RV/NC6q7/YE98mDvZVHszUxPeceoIgCrO6gsBNkxe5gXCwhDLPzrq0l7voSZ?=
 =?us-ascii?Q?XGPCI8LNR7aDqWCNzo4jm3r1UqJ3GMGvBLXwJGEwJmEAq0MVg3EgvjlCYt0K?=
 =?us-ascii?Q?8tc7t7VB4KVZ5YRI35BbjCR9Eco00HnL+ks21GZSVfmhSuJ1MRGTBxLeleZc?=
 =?us-ascii?Q?C7pr9aA8vEf5XIYJegnhJ6mqq6ffPunaqDOVlGrozulqhnrF+wOoA0SLo8XZ?=
 =?us-ascii?Q?tPCdT3sfOAHnV36ybEmNm9muRpgQu1Sf2dIAtUJ4Dxu4Q67j+xOmlPUrBwFQ?=
 =?us-ascii?Q?VtSkkN3l4yDM1NLu+h2GQu9+alzBHnEWssN+ubYIkijm9qAN8GtcT6pb/WIm?=
 =?us-ascii?Q?0K7cIErzdt7d6CKFtK56xuNo99+OtTAp3QzfK6fEcJZjQAev6DEnBmtUGu3C?=
 =?us-ascii?Q?8l4JWHd4Rb76yIImhLHphwiWrEV77TzOqbnQ9rFtX3IVMxEfWBD+K3NSzsAB?=
 =?us-ascii?Q?haMMctcbu/IiJmoK8W1SFU1mlys1FY1d66Iwx7sPLwwwsNWa/WgMU/gqvr2C?=
 =?us-ascii?Q?Tz8pdc3N6Tw/wZYP4Xdm2FrNthGUvnwL8i32lIdf5miVWGynoKqU06q5KM8a?=
 =?us-ascii?Q?Zpcbr4y4ENw9YJarPWp7KjaNrFLxsTO+nA6gP7wHKwQtx6jTMG/hmbY76wHA?=
 =?us-ascii?Q?Y6LnhmYuO6W/Jvnb1DnhHRu8rq8iK5d/8nVQ2nbZe4+EAJAsGfKU2j/oiv3Z?=
 =?us-ascii?Q?kYa2kbH3hC6OhDtjGrfHlsrmAG+Mjy50v2zSxmw+6/4ULp3WhwZRYAQ9g6J4?=
 =?us-ascii?Q?rKoBv8n1qeeSK2LqdbUW6UOPfIUM4/rRLMiFVOHfje8F1twYFYjF/g+pwrOe?=
 =?us-ascii?Q?iJP+gALvwCoLtM8RcY4gWbIbGIbL/9ano7cTPkDSyzyVnK1z+3Di7+kiBSCI?=
 =?us-ascii?Q?RSDJFXBfMZe5BmdEKIK+oGUmQx9+y58kULJvLksBQwWZMzD2Q0hxZ6nDv6ve?=
 =?us-ascii?Q?eeqgS+cZXYGKyLAxqW3I8CFqtYKqqJ9pEMo/Iw/EhOZRh/RRhXOlB2ePHaIN?=
 =?us-ascii?Q?LBaOIfYbmnbhYt2rQD1nXwwmREYbbJHr5quKsFMQVc9YdggO7rMCKO0EM7Cv?=
 =?us-ascii?Q?4Q5yXvhMIV43erwpV1bUOJPUa0Pla8C9yCWcgn3XHAq4LI0oARgX1QLcv3yQ?=
 =?us-ascii?Q?6jVFF+PfZ3A5ZEFnCLJNMU0meKn0XoUoHbFn0FylYaZupiGWaaidbS0rq1sA?=
 =?us-ascii?Q?+1+9PxTkMhmk0Zc8ho8j/oAWLY3HrlWD2YDCJecOAk0/gZfUlxP5rz8XqQId?=
 =?us-ascii?Q?NimFACG6gBn4LV48TxKOz/aLWSPO/jpFPu6edcH2K4oTgPKQ/Hq3p6ZXcdSZ?=
 =?us-ascii?Q?IFxFWbsAXQoxqfTNVKjpSoEX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833cf716-5d23-4307-7a09-08d966f283e3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:30:03.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkzJXh7zwQ2k4rbAyceuM9fcu8A1Md5fhau4HSCG4SGvv/vXEt2I5Sh87jq3Ovo8CjjPDSZoM4kSPjJ3Qmkofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7351
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When two tcpm_set_state are successively executed in non-worker context,
such as tcpm_init, an abnormal sequence may be exist which causes two
continuous same state to be handled.

tcpm_init:
[    1.686293] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
[    1.686300] state change SNK_UNATTACHED -> PORT_RESET [rev1 NONE_AMS]
[    1.686309] 1-0050: registered
[    1.686315] Setting usb_comm capable false
[    1.687417] Setting voltage/current limit 0 mV 0 mA
[    1.687425] polarity 0
[    1.690709] Requesting mux state 0, usb-role 0, orientation 0
[    1.691599] cc:=0
[    1.691871] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    1.691880] Setting usb_comm capable false
[    1.692973] Setting voltage/current limit 0 mV 0 mA
[    1.692980] polarity 0
[    1.696843] Requesting mux state 0, usb-role 0, orientation 0
[    1.697729] cc:=0
[    1.697994] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]

abnormal sequence:
            [tcpm_init]                 [tcpm_state_machine_work]
1       tcpm_set_state(A)
2           port->state = A
3           kthread_queue_work
4           queue work to worker_list
5                                       dequeue work from worker_list
6       tcpm_set_state(B)
7           port->state = B
8           kthread_queue_work
9           queue work to worker_list
10                                      tcpm_state_machine_work(B)
11                                      port->state not change
12                                      dequeue work from worker_list
13                                      tcpm_state_machine_work(B)

state B is handled twice.

Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4bdf119b1306..e0a319e00b12 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4825,6 +4825,10 @@ static void tcpm_state_machine_work(struct kthread_work *work)
 		port->delayed_state = INVALID_STATE;
 	}
 
+	/* If target state is the same as the last entered state, skip it */
+	if (port->enter_state == port->state)
+		goto done;
+
 	/*
 	 * Continue running as long as we have (non-delayed) state changes
 	 * to make.
-- 
2.25.1

