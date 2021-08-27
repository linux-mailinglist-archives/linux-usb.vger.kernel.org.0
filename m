Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A993F9887
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 13:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbhH0LtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 07:49:07 -0400
Received: from mail-vi1eur05on2058.outbound.protection.outlook.com ([40.107.21.58]:13136
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245043AbhH0LtB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Aug 2021 07:49:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ND13zfK75si0ziZMLCAa9gSsFW5jGszo8WnHKrZugCIAalcpMNpJ+TWbjujf3MQmzplTnwC5qqeXXi2YpsHHow1774Chjz6ZRKCmFXD580g6eauw/OAXIhnkPjB2xEU5f+vHm4KW9UI6NQmz7L423yfi2URD4mDU/1EZcTvxZZj5aP6hgJXkyuR2zq7AwfRv5lsGhTnX1xJ1PCZ6aRqELgUzZ4x7fnsoPKy48eTPVRCqBrr2qtoHA7OMOOvOWTP5vhT80QwzlTYAlamkwzKgMyppKoMVtafozaliFVRp/pwHklNIlllupnVC2h3uCE5kTJ+81+I5p2kTA2Xx//iUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eD/nu1nwx0Qtd11pE3rKiO6N+uyR8he2dEBG4vb4WOo=;
 b=CSwfEo80AKJ9vOBQ07FNfeG6P4kpNb57syyRFgoYtt8Tvzr8ZG686gDTVff/jfqTAyKytFH1htnRUXZ05DEVHZJbZ3TpxFetPFZLEnkGGdwNFPfpzTlvXssdR2ADargJgrPm/MG1wErL6WIxouk7JSLDXQcZ2DxbW0enFMYJHbR94RUYiLpuHSEcX4kE6n48aS6t5aFozhTuFpucE6aZJUvK+g1/Nngjsj6doBTVpgByYi8yoOGq6fiVaID5pcHnJxiVAI11nbIPwWDaLDLxyjTrsyMiGrx0RzOxcGf1my3eHBCtb0BlmpYIDIXSXSXH/cDpoRCkhA9dWKlseOxPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eD/nu1nwx0Qtd11pE3rKiO6N+uyR8he2dEBG4vb4WOo=;
 b=U8eDXZNw6/AnhXH96DYkUmawcNQyOXaYBKWLOuCfZUOZNmvp2C/ulWl17PHQK3QWd1wOupoZttXmibh9KQIekm5w1G7x567t8a9pBJ3ouEZLithME0qNM054NPoyFtcd/5vcRM8gGQRlikwdDW2qLXMN3fdBW5sRcP8OLvrnrEA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBAPR04MB7318.eurprd04.prod.outlook.com (2603:10a6:10:1ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 11:48:01 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::c40c:1c27:b836:703e]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::c40c:1c27:b836:703e%4]) with mapi id 15.20.4436.025; Fri, 27 Aug 2021
 11:48:01 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net
Cc:     jun.li@nxp.com, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
Date:   Fri, 27 Aug 2021 19:48:09 +0800
Message-Id: <20210827114809.1577720-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::30) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 11:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5cee45d-868e-40dd-5547-08d9695085d4
X-MS-TrafficTypeDiagnostic: DBAPR04MB7318:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB73189CE3A06F31E66C82FB968CC89@DBAPR04MB7318.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lHMtfyVGB1as18kwI7oQL9J8Hd9nDYHotTtZbSGD7agaqyqgLoAEi4KvH9tQ65qm5cH5LKtCANKT58EURFQHrlozPVJ6K2TB2i6g6fbeTUSkBg7M9GtPRyPU6sa5kWaeW2xhzBVfjL9YoAa5RoaII09VXi+x+z3RFbpwR8d76qNuaXrbCzB7VF1Zhuiv96FZSnjs9dIgSB/LG0Z/tAobNrkJEMMkSMumvmCkw7p4LerM8KEjZDscoo+k/nbnPeh/2YCcXG98EY4fU9tiXSgav0zOyGNlTLMYnEzfBdmGjyY0X1FlLogG6ZOZTLDOVTh2GKyLuMImDcNUf93cs2iwXmhF+Fv4p8EdOhgJqhuIPYUVHwDwDbECmegazEYD+MQNeewH0jos7aMfSeTflt1mmdKZ5yFKPLzaaIsxMpXC6L1x3Tvfipl8dGSqFLFJTB7ZxwsDI5Rl5eBXggfRtz2pNrfnGYOI0bToai3C+71w7CzzrbpAiO4+CDOYm07coROOO14UDArXLPXoHaADtfSMYD1INBulGp9EifJw7O7w/vavE7z1YTy9P8J2NSSY93JplQ4QxYLLqYOrSMTS9G53mA2iJVyokEF1gYTMdMcD5v350dGQnvlLTAzOpJ/bH3LWHVIv2ks7zUrlbDTRQl6AkJlCsG9N/WorIKENL+Gl88SImYY9v7rz/FJynMBEYb2XJ227vlhGKy3497Vi02YVgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(2616005)(6666004)(38350700002)(6486002)(36756003)(6916009)(186003)(38100700002)(956004)(86362001)(5660300002)(6512007)(66556008)(8676002)(52116002)(83380400001)(316002)(8936002)(66946007)(6506007)(66476007)(2906002)(4326008)(26005)(1076003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sEhCOG02Rkbo6ZyTFB0G8MB2d0kpKXgKEzI/KbTNevPX8Orlw8nD63JT5TqY?=
 =?us-ascii?Q?6iVfQVi9sdI+HKMd9BqZHeVfyDHOT7us9udbzQxFpvmXHf3E4R1zYf29eCMQ?=
 =?us-ascii?Q?q5LycfXwrhMUWX3FbxMMXUpqvCK3XbmZCsfhvPNG99cMnF8rFgoznmizKcT5?=
 =?us-ascii?Q?otjQrlCE1KxEEN1xeM4Fm1w5SrB/+1f+FcgJ95umiVDbK6o9JqjYk4rNyiu7?=
 =?us-ascii?Q?LEPrqHQDbLI6RLvF+npSKBCHL/RDWFmQqvb9nziePSUF/ItTKoMlA0m/3h0Z?=
 =?us-ascii?Q?4Pn4uR2PP0g1rFOOINcYGOHLNj5BAnPclLouyJUiqd6hrdhXaqmWVQu3PM24?=
 =?us-ascii?Q?fw5ZYOIR1DZCIpWljD2E1gVbsNx4xC6s2wa6ZHWw/PPnzVBg31IzhWlr055b?=
 =?us-ascii?Q?13kYlHDv8Hv9YaFJfviBJN1r1kopsmIFtL7FLAG6xicjIqIOMmag+68W3Zzl?=
 =?us-ascii?Q?ZF/w0eBVcWv6uFdt2j7DHQa8N4M+rMHQtQQ6Lfbw4s4gnG408IoXbb3ry7Jf?=
 =?us-ascii?Q?1yG+2zoOAdqse20fOc4vAIP8Yn6RPnCA6cgO6cqjn4juTug7KsccXG5+mEF9?=
 =?us-ascii?Q?9t3faz9/n9nfSy6GDl5eNHa06CcQuyM19LiaBXKud1PJL+jHoniR+yKTnSnx?=
 =?us-ascii?Q?+ncpV38apfQ4L87f3W5TN5zJru4YKhBUMCdlKhsmg9Sf6Gr4NyZNx3Lc9rNx?=
 =?us-ascii?Q?mGeTB5ueYP7YdDQgzn0ssjBpzybPUMlBl04beUtozrHVd/f0sHysZQRTr6N9?=
 =?us-ascii?Q?1IVLvKYCtRedXfP14Ty1oGlpAGv/G57TuuXmPgxHu+Ga9Q+K83Vm1iAQq3tP?=
 =?us-ascii?Q?TjId9JaCkNRlDl0ZvNUKu4ckMhnlzjW2WBZHIIYXARsvfXiuYB5IHUxaJO/0?=
 =?us-ascii?Q?b3NgqB0IbqxjRPQyKcVvZaPn5IVUb7RvK4W06cbykTXHxEj45CQtBw7VX1Gt?=
 =?us-ascii?Q?77NI4Ly1lU8pLWi15NmNB/iq/T3BkSdp6zMFdizG3MX16ds3XFPl/W4BnnqJ?=
 =?us-ascii?Q?F/zJbWiPrkozS7S2buVbPZGj94tqCFV2BGzhrmt7ie+6MoJpuZQraPoCYjlZ?=
 =?us-ascii?Q?LUtO1rCfjxqhfVOlPY4ZnI8XuBxiQkSgm4OtNoSTCpj/vb3ORfPmzJHiCZ88?=
 =?us-ascii?Q?dl9M0uU0JYqAxkeNdWFgBq5ysSTgHgdPfylF2wAgm+C1P6E441GUzXwxgXrE?=
 =?us-ascii?Q?JcS7p+3q4pP5EDFbInw1J3Lw3uNRnd+CkNs/iyxkNNNoevmzCY6fLLevWSW+?=
 =?us-ascii?Q?o8Bu8sGd5rIgZuKey7oYlfiIYLmH+GyOa0JoUTSOKgaccvbPt91Tx8kaPype?=
 =?us-ascii?Q?QAyFFy6X5dY4Fxp9ALoJ6I9X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cee45d-868e-40dd-5547-08d9695085d4
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 11:48:01.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2JWZ9dPEDT8UYXSLdJs7ospH0m306e7LUzg8+wBArq1pwvd05FFu+ysXwW4Qb+S8AnJXFI2S7GKzgzrcx33fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7318
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

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 049f4c61ee82..a913bc620e88 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -371,7 +371,7 @@ struct tcpm_port {
 	struct kthread_work enable_frs;
 	struct hrtimer send_discover_timer;
 	struct kthread_work send_discover_work;
-	bool state_machine_running;
+	bool state_machine_pending_or_running;
 	bool vdm_sm_running;
 
 	struct completion tx_complete;
@@ -1192,6 +1192,7 @@ static void mod_tcpm_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
 	} else {
 		hrtimer_cancel(&port->state_machine_timer);
 		kthread_queue_work(port->wq, &port->state_machine);
+		port->state_machine_pending_or_running = true;
 	}
 }
 
@@ -1250,7 +1251,7 @@ static void tcpm_set_state(struct tcpm_port *port, enum tcpm_state state,
 		 * tcpm_state_machine_work() will continue running the state
 		 * machine.
 		 */
-		if (!port->state_machine_running)
+		if (!port->state_machine_pending_or_running)
 			mod_tcpm_delayed_work(port, 0);
 	}
 }
@@ -4810,13 +4811,15 @@ static void tcpm_state_machine_work(struct kthread_work *work)
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
@@ -4837,7 +4840,7 @@ static void tcpm_state_machine_work(struct kthread_work *work)
 	} while (port->state != prev_state && !port->delayed_state);
 
 done:
-	port->state_machine_running = false;
+	port->state_machine_pending_or_running = false;
 	mutex_unlock(&port->lock);
 }
 
@@ -6300,6 +6303,7 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
 
 	kthread_queue_work(port->wq, &port->state_machine);
+	port->state_machine_pending_or_running = true;
 	return HRTIMER_NORESTART;
 }
 
-- 
2.25.1

