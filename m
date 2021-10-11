Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C1D428AC8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 12:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235855AbhJKKeS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 06:34:18 -0400
Received: from mail-am6eur05on2064.outbound.protection.outlook.com ([40.107.22.64]:32352
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235852AbhJKKeR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 06:34:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw2kzEHrXhXhU8frdKGHRsCU25Cz6ZtIAVeIVVKof3WdgjoCoXcQWHE5KpvdWkAzRnYeojQ8dEYtQeOjt75owzOjnOw5rPdqYDVfCB5ddXDOWbbW05SzBohjbh7d2CzLXaAiLxeuhJIUmB9dtouC+OOe+YQGwTy6ad4H564a1yOle2Eceb43ZHucxEhQPVzDLaxaMHWl1u3uFhCQJMgynS7mQB6/HJbBLpKD7OBjmY18zpGzETBzlMVs8/wbavbwDEsQmZdmgczH3rWTGKiOzl4N0R/ZpvI5dSvcpaHjee49h7ulRCX8ZsDGkQgp9wJ3lu6VrE7S4byHS9zek9NLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+APmAem5+Yib46J/XXgPM2S6KeherCABulAmqGYxt30=;
 b=CX20LcCyzi6TGQTUuJuhC+vDXbqNi7jkgCDCqSA8PgyM7q9GuthNZVwfDSYifSXwnRSJqFnHwJ/fX78t+sY3xr9jGSYtA2rqRBHPYj+XgT9k76IgvTjPe+pljx8o6JQC4CT/6bpylaA+/aFdvbE9vFp7T9e+NjJZwfI7HsEJBvlSul7ZCh2B+ZHIrgjO85G0Lv1+43VOvuaOzBvDe7YJgagvhpPiEv810Kqnj4fIKyyJqGXPqBzyPZcr13cXtAiioUsCm7FKCzDLAwVE62uIn0YXRn90K5ZMcUQ1z12p8cDMmemjEltZ6qWQ+pVUbF5VZJ0B59F8loBt/D+NTm4fgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+APmAem5+Yib46J/XXgPM2S6KeherCABulAmqGYxt30=;
 b=ePtvS74c8+6DJnciDJmUsK5+fLlhfWQCV1YZLA7kcc6H79PXuiZwCcDOJv7iK4n1TOx+XWXHMITpkRyK+nCTIUMEVpJWrlukSkzqNG3FAsAXgOOsIikfNBkdwxyxCk9jioVnK245XjyTDgEMzDjS8JYjHt3aoFHEudanWVKRdHE=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBBPR04MB7516.eurprd04.prod.outlook.com (2603:10a6:10:20b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 10:32:16 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 10:32:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
Date:   Mon, 11 Oct 2021 18:32:10 +0800
Message-Id: <20211011103210.156552-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.71) by AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Mon, 11 Oct 2021 10:32:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 890d6128-5b1a-4c16-9da8-08d98ca264ca
X-MS-TrafficTypeDiagnostic: DBBPR04MB7516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB75165904A274005AE67143188CB59@DBBPR04MB7516.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scXbPYnL+Z6yWUIDAo9k93IaUKd/n/9/sORGwOV4g51oQzG8lJPcKzwu4QQ8Dl3flPKQFGFmNqTpB1E4MmgU0jVdDmUIqEExB6k2SSa/+gBrB+owpJEO8YQiLapKRQNEpTYOTAkeAhdLVZviuzEzWtVxwrY8dmQhqraLTmYP6y9iTVq0fTvMyMS/JR85eTn9lpHhjEkzjU93t/3/7eZct2HRNrd10rxm6j5rAnTHSC8krJ1TEbsiCQeMp4eFnJQhJwL/YAWZoqFaVJFUbd74g1fC+7thhyEqxNIMnaRTn1002UVkO7dEzykWo6vc8+LF91nPhSV0NL/r/cnrdAlWnIrcdO9F3virLNXztkcHgiAp39UJqsP/JJ5MgKOGAN0ifsWaSJUy38FTzfir1riCJ5/b17OUzJYNHxiykaYPevOt0N9+vLUZcfpzvsnXjl8CSmrvuusrmE4wXWBxPEVwtHtDT6ZxTK8pGAwdtooNqwtgvc+76kczViKRUBwXqjZMmdBJOAME/Qmsx9C3d9xMOGA9mhBPIUodJZBWIISNw5CRwQ9VCC3yyK8Wl6BGdsChAa6RYZR+QQv19LDyRx7Ru5K/fUEJ5pp52WizvmcHCnyKixcSL8rKKAl7HkojACz5YconVuh/GHZlRQ+Y4wIAiK/mt7aokL9bCvi0gQUst4iBf28xV7xfQJA+O+xQRbPYLrJLQmJxXa9lnl7S/hH0/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(316002)(66476007)(66556008)(52116002)(6512007)(4326008)(508600001)(2616005)(956004)(36756003)(38350700002)(6506007)(38100700002)(26005)(186003)(66946007)(8936002)(8676002)(6486002)(86362001)(5660300002)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7gyTs++5WUEVKb6Ot6N+3z46yxkXkS0qvLt36ePPc2p9eixAjmvjw49gXjz6?=
 =?us-ascii?Q?hquCaXUh8+DEZxb2uNdnkaE7Ltl1Rn2roiON3gOh59Rfy0P4UH5g2GaymwP0?=
 =?us-ascii?Q?l2UkZSieUd4gN2yW8ScUwX0lv419VLKj1kA68MN470bx/tjRSfVCRfsWimN4?=
 =?us-ascii?Q?cOfNBdv0so5VUtYailuCzC/6vW6W1fd5qs+tTWH4/JPQmfZxdbYONcB+DPl+?=
 =?us-ascii?Q?WQasEGB6kB6ho2/uds68VqXQzzTsszKWwwRrsAPUdOiv9I4WfP49IQ130LpD?=
 =?us-ascii?Q?1feIj30KpN0/BVW+8h5QTrSX2ElhS0Fs/y6Sb/TqlERxv+g689UGowuM1aKY?=
 =?us-ascii?Q?kXudX0TTw9mTnveDE4KI/2rYt6ttfDBzTsGYEqw2Tnl3H5dprdfOLDQVnnxY?=
 =?us-ascii?Q?B2fNrJsqm0S2pzIXHIZ5YzDB/q+RN5De+bc9SfamhWENlBQu+WjCs81i8sKt?=
 =?us-ascii?Q?W2MIk5m/qWNXuM03fLpQnm1VJVnfkvqenRPzzYmPfcycJz9gaaR0ABXugm9b?=
 =?us-ascii?Q?MTwRx2tXZVHZ6Yyk1VeomNNHE8x4UdKCbBTALpfEkN8/xQ0BV+7f4A8Lkpl1?=
 =?us-ascii?Q?csPW6Bmx4uBj9Ax3MQXLrmW1C5kiUVTtmC6bN7Q1wN2+xJoMGmxbw6q4zmIH?=
 =?us-ascii?Q?JvVsD72xXUkFGf8JlNF+8bnnJQMs/8cur6WLeOuz+0cnLylhE+2G2T/Crk5D?=
 =?us-ascii?Q?lQJLCVZ7NiWqNIGLFqrbGLtplVbgJHA5ua8EeNa/7hHKIHb4t3rAZ8lzpCaw?=
 =?us-ascii?Q?eb9SRfIBjWa28rPCQJ4uIJP1qJhZ+7h6fCHnAZBOjzoWL8kbUYW/mKV3hi/f?=
 =?us-ascii?Q?qm4Sa7ggUwGAbczGz01RqeSyu2sSYruxEyaV2f2olO22GDF19vzWBuWT6VMZ?=
 =?us-ascii?Q?nautegQeaxpNTP+0gWbY6EYy4+wRBFGkfQS7h6cU4SVEIYJTZCtZC3otMFfI?=
 =?us-ascii?Q?oT3MfFpnEnCzYEpPZOUMOQ1efUzRAIshxPKEpu1Dq8iRUWBG04Jd/fENzdVH?=
 =?us-ascii?Q?tHIBc46GULLNhZoWJcj4au1VGnFN+WAKWVl7Xk92S+DelGSiN4z2bAnGxXL0?=
 =?us-ascii?Q?Jw9LHi2MsmXSAbG7ZfpGj4Ab8We9xS8g5U6lsyYyWbfPdVqLBx98ZLcXjbLt?=
 =?us-ascii?Q?0yxNei/RmdQu4jHaDNwttbBxcZ4ReyaVQJr4KuT3h8/lcsS32PQUXK4HSTRy?=
 =?us-ascii?Q?J+j9Ayf4EvAXBE3WuOsD0UtW53izve8TnZPVEILZMeT6aGjYjZ6gdwFpyF4l?=
 =?us-ascii?Q?bpesvSrrtSsdqrzBy3lnuNq3oKlXZpJPgfyoI5wRQaF1frrJq4lP3XisI+66?=
 =?us-ascii?Q?kvlGK5Ybu7hsOVIEWNhSqOzz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890d6128-5b1a-4c16-9da8-08d98ca264ca
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:32:15.7079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhEoElIaIX2DCZtUVN8S4IxGv5wuK2RHtg1cnj0XjRz6s//U9jlSbBQWcE6vaY7rX4ceo2rHOdny6w/lBllgoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7516
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are potential problems when states are set as following:

    tcpm_set_state(A, 0)
    tcpm_set_state(B, X)

As long as the state A is set and the state_machine work is queued
successfully, state_machine work will be scheduled soon after. Before
running into tcpm_state_machine_work(), there is a chance to set state
B again. If it does occur:

either (X = 0)
    port->state = B and state_machine work is queued again, then work
    will be executed twice.
or (X != 0)
    port->state = A and port->delayed_state = B, then work will be
    executed once but timer is still running.

For this situation, tcpm should only handle the most recent state change
as if only one state is set just now. Therefore, if the state_machine work
has already been queued, it can't be queued again before running into
tcpm_state_machine_work().

The state_machine_running flag already prevents from queuing the work, so
we can make it contain the pending stage (after work be queued and before
running into tcpm_state_machine_work). The state_machine_pending_or_running
flag can be used to indicate that a state can be handled without queuing
the work again.

Because the state_machine work has been queued for state A, there is no
way to cancel as it may be already dequeued later, and then will run into
tcpm_state_machine_work() certainly. To handle the delayed state B, such
an abnormal work should be skiped. If port->delayed_state != INVALID_STATE
and timer is still running, it's time to skip.

Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes for v2:
-Try to avoid such problems occurring from the source.
-Set a state_machine_pending_or_running flag to indicate that a state
 can be handled without queuing the work again.
---
 drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a4d37205df54..7819deae6bff 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -372,7 +372,7 @@ struct tcpm_port {
 	struct kthread_work enable_frs;
 	struct hrtimer send_discover_timer;
 	struct kthread_work send_discover_work;
-	bool state_machine_running;
+	bool state_machine_pending_or_running;
 	/* Set to true when VDM State Machine has following actions. */
 	bool vdm_sm_running;
 
@@ -1194,6 +1194,7 @@ static void mod_tcpm_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
 	} else {
 		hrtimer_cancel(&port->state_machine_timer);
 		kthread_queue_work(port->wq, &port->state_machine);
+		port->state_machine_pending_or_running = true;
 	}
 }
 
@@ -1252,7 +1253,7 @@ static void tcpm_set_state(struct tcpm_port *port, enum tcpm_state state,
 		 * tcpm_state_machine_work() will continue running the state
 		 * machine.
 		 */
-		if (!port->state_machine_running)
+		if (!port->state_machine_pending_or_running)
 			mod_tcpm_delayed_work(port, 0);
 	}
 }
@@ -4805,13 +4806,15 @@ static void tcpm_state_machine_work(struct kthread_work *work)
 	enum tcpm_state prev_state;
 
 	mutex_lock(&port->lock);
-	port->state_machine_running = true;
 
 	if (port->queued_message && tcpm_send_queued_message(port))
 		goto done;
 
 	/* If we were queued due to a delayed state change, update it now */
 	if (port->delayed_state) {
+		if (ktime_before(ktime_get(), port->delayed_runtime))
+			goto done;
+
 		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
 			 tcpm_states[port->state],
 			 tcpm_states[port->delayed_state], port->delay_ms);
@@ -4832,7 +4835,7 @@ static void tcpm_state_machine_work(struct kthread_work *work)
 	} while (port->state != prev_state && !port->delayed_state);
 
 done:
-	port->state_machine_running = false;
+	port->state_machine_pending_or_running = false;
 	mutex_unlock(&port->lock);
 }
 
@@ -6295,6 +6298,7 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
 
 	kthread_queue_work(port->wq, &port->state_machine);
+	port->state_machine_pending_or_running = true;
 	return HRTIMER_NORESTART;
 }
 
-- 
2.25.1

