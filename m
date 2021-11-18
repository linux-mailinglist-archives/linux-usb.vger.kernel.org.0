Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D334557F8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 10:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245135AbhKRJ2c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Nov 2021 04:28:32 -0500
Received: from mail-eopbgr10068.outbound.protection.outlook.com ([40.107.1.68]:42382
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245126AbhKRJ2K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Nov 2021 04:28:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvPqR5Iymf8QQiChhXvztu981s21qE7es8xDT+768oBFaBalokmFduHHFkfZ8H+lrSlf+HP5AFkIDKMCsbKuuiuFQOsL5rY0F1XihpvoUnbhhG6gGROXDWDitU3w4/QjU1safg+eyTruhdIy048P0qjLu/9tJpfc589YY0/AMzk8whFdA9RVlgFuakJ3mbsMlQ5AH4h5lEk5mcSkDXx+kk54lmBg5tgM1KIOZTXIx/paC0uW7NynT92fbkFhHt2D00utCuDW+ZcoFAe75+nelAiLuo+Vfrq7peICoonuXtNGQqMw9SUDIMkvvvNGw1EcotYnV5WiAFz+88c/snhNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVGNN+s7n6W2ooMn1hB5V2shT0MAnAebcwhOkQ7LP4o=;
 b=ZjSlAsThyXbdbeYPhlznkhqD3McXZ/gJlfb48wOZVTiBT8ygyXd8VrP2MMbOHt2hVo/hjCHDS5n4oa19f8C8UJ30oHBSRQvX3Igvoqgvo+DnnC+YNxXYoJxbKK6NmG2Ss3hvnhYeYeqxlnTieHTRZ2KklSk8yRv9lWHqAlZNlYnupOy4OJGrLEuAkt1gnd644gYulqQOhhWAxGWO5XQslz7FSwnJ5RiE+nSztnrEe5MJxwl7wAE43WJlqJ4TszIfPFUq8edx7tdMhTSAlsKxoGZNYg+mW1L/tiFyC9sGTLOlXQf58mxRML/UlnnMjPkXVnW7llacpbrBQA/cQTBxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVGNN+s7n6W2ooMn1hB5V2shT0MAnAebcwhOkQ7LP4o=;
 b=O2Lr15sV3DmZE21l4AhVkafjEW1acqIDjNUcpRjmSZHZ1kPlpANzi/uVc148svhYYM/kNvwP3oXTJMQNhinDdzk2W9i3bV3D8AeknRp9sBQB1R2Ju5CJiYxtZfy7Jm71t/t1ZR41sQX6khHCvqDxfl0pmOGx/9BDTY4pN8gsA+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB7PR04MB4475.eurprd04.prod.outlook.com (2603:10a6:5:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 09:25:07 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef%4]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 09:25:07 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: [PATCH] usb: typec: tcpm: fix tcpm unregister port but leave a pending timer
Date:   Thu, 18 Nov 2021 17:23:52 +0800
Message-Id: <20211118092352.259748-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::13) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.71) by AM9P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 09:25:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8480977c-392c-4c08-baec-08d9aa754f43
X-MS-TrafficTypeDiagnostic: DB7PR04MB4475:
X-Microsoft-Antispam-PRVS: <DB7PR04MB4475E30D5C997C658665D06B8C9B9@DB7PR04MB4475.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2pvE8yF2x0kN3gyJeQgYPI+NgJAZvJLFeVkMkQXhorcg9aY82ZHruJw6JPfLRNoZdYz4YSf+2J3tqYRIA5bhZMenjNy3sl0dmdzzhMM0iAk95UO6sS0MZ1PoK8w65svKGYUk8Y2NXt7fbkfboPHk6aRZEZgXMNzGr91gRL79U0/xHHxh5hnBolhJGUATTIVMmtAlqbzPuUmvVSCPKZEXhW6yaKbOa2gaKpM0I4i2tta6QRlnl4mCy0bbXCF6xOPx9sRfaIk6RVpno1jCp0/xFPVAQBk5hw1UIHf/9nR/YvDU6VZcXP0BN+5Aby7Q8m65r28DotEeecgwX8ti3mi1HvYcQBszsoU/v3eWdg983+eROnbduW0PiWWH/E/3+FQqRasFwa+SlvztHnrZkUumNyNOh1i9llbtCxUp9440FgF6Eg9nJgwgxJYBpLEkgeKS0/kNHQx+hXBxId6udq22TloPOalyjqunvBX2krgNhtqeJKehAiJrVMz4EpCePAp2MG5PMolyHI8PNRMVkT/NHdi70ekSd0wJWv9yvtoxRc2kdQJ+2RLJIV9C6PKNvQsAch/VqV2D015gurTyEzaLL8PoAMYT/FIeLASSS+lDPV7uIe7hBYkWBfXCd0fPiY99B9+Y1lSb1gjuGVdRd8WQbDWjVO5Fusj0kwCXxIk3QDxMtoVLxebjy+sCXepM4wx5UODLlIiDf3HK602M+/K4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(2616005)(316002)(83380400001)(508600001)(6512007)(956004)(6506007)(8676002)(5660300002)(4326008)(36756003)(52116002)(86362001)(1076003)(8936002)(186003)(6486002)(2906002)(66946007)(38100700002)(38350700002)(26005)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bZFh2dks2Ez5TzVkabtckn2V/jkp9xzNxQ4K33jgLDlb+AXdadxq3iebHxEr?=
 =?us-ascii?Q?CcMA+ll3ujSWrmGaS/JNh4OdWSySNiqs6Xui3xdM+ouCggbk/qR5KnQKDpuq?=
 =?us-ascii?Q?YS26Wd55PgKsUawY9JDVy2Wi4gJtBKHxzBiswMzGb0LmUekyGchBNu2bak5q?=
 =?us-ascii?Q?eD9byYAM4ufkGvqVD8of5w/FZ/dCKDmDjy3UWeWfDQeocTF4Bev/xhwm9uD5?=
 =?us-ascii?Q?xQgrIBe3+vOJj+FUKY4cUgAdilnZRRTiCY/hhHwqBgYesD+VRY4cnohejltv?=
 =?us-ascii?Q?moq7rGx2Pof/LF2JRA+Db1nQgekCwH1Os3nNAUqTqOuX3kYbeiqDqaIyjaQT?=
 =?us-ascii?Q?Wt93DkSFY1roZj8kjLclKoLXpiAGN6C/7DxbV4NmI/by0hXayp+mQgJoFO9X?=
 =?us-ascii?Q?+OFac5KPjYY3F9DvWItY04iisLt2nvrIpHfC+D1Ot9c0eyPXzJSqb5TvxIZ4?=
 =?us-ascii?Q?uwfWxa0pJd1EHeKvxcc1eW7EhWINsOssTAYC3ai73SnjGqwzfMxxIJ/+KmL9?=
 =?us-ascii?Q?HUbYUiOC7n3Ux5P8W1P2ocEv6zvIdGmNEbDtR6pNnjAABi5BBeA5d1o0mx8w?=
 =?us-ascii?Q?R8Hgv5IxAHUdxhtb/OdzTWKr9QPC7/1rGEt4/JEVhAgy4LG7003i1fMQjEX1?=
 =?us-ascii?Q?gVZ0H9Pa7x1DBPGtwU8FsnCt1nXu6QET0rSKhgtcMO4Y3UKLRGZB37Y4yF5Y?=
 =?us-ascii?Q?fwm64nJmRwbzix9BbJG6ZCgG11BeCWv7yR4MqOP18R0N227dfXkX8ypAtsRq?=
 =?us-ascii?Q?HlbiMOWV/M91HC04HEfhTzQcYJdZFU5cJl1rrlQPLkB1bpBQcwlZEw2A5m2Q?=
 =?us-ascii?Q?MNacYRCzI+J4iarXv0uQlQr4h6dTVWFRXdMOTLGptEpugqcd9FKxezcgx6xW?=
 =?us-ascii?Q?nYU1kvKPZSGNEzPPKpr8kVK5CkQB/UTJsZ5aAdZnbDsjMZJUiNfqu4Dl7hpw?=
 =?us-ascii?Q?XHuSPqdjV9Zxo2zHgmfsp21LRXbRzzMzwTBoLyfGIMyw2DexlpoO0o2F+oN/?=
 =?us-ascii?Q?38I5Hgm1vjzIyA1X/lPq2xGcpOqIQyOlOHtVs+z9qFkGPXsZH4s4EdBCOH6l?=
 =?us-ascii?Q?QXHNCbNffNc7KSW749PyeUNWXIBvjuNMlJ82hDfPAefPJ0aY9q8dJwybX5HZ?=
 =?us-ascii?Q?6YMxyW1en6wUB9H3kWjHIqTs9Zh1niG6XZf3uRoiuvTTqpoB4Jh2dilUEjiV?=
 =?us-ascii?Q?5CmgEL+Xqa2pH2VcY9eT90LWy6gyHO1o9zVWQ1BYkWe1WZK0u2eGwbP2LcWp?=
 =?us-ascii?Q?Ka5cNqOz/Ful1Pv67gDR/h2/Ty8CCvJfxKqKCWU3VfkCKRt294SCWcQgjnvA?=
 =?us-ascii?Q?AmI8ACU7Xnjau9zmcLkKGaaWMismiLUsHbNsfe/rgSeq4OhOW/Swtc62RWZb?=
 =?us-ascii?Q?vQewbliAX4pN5nyuMubaynqOOcJcMiGcDLyOyrV62y/kQg2N5L4k+Soc67Ae?=
 =?us-ascii?Q?LO2f7B/yrHtXWnhR0zj0QQNGFZ0fH/xiAb9pgJ/j6nmIjMnWDtoXZCNEjtyy?=
 =?us-ascii?Q?pH+aevLJK966CVUW+ndDkqoeApzmpYx3knh5eKaP9q8oQC+qSCd7Readzgpw?=
 =?us-ascii?Q?5Fujc2TefwQX2R5wkmQTXPA8Vn6fI7CIw9Sw41VtpN3k8xEwxW2LC5zIM91Y?=
 =?us-ascii?Q?2DxSwRcqSP4PwqXQSBqRbA8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8480977c-392c-4c08-baec-08d9aa754f43
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:25:07.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mp0yKDe3O8MWZCt0lrtIHkLfeE8e3E2eg9DBLaPp1PqvoxUMYy4bEpajJ0t5kdJIOBK04o0WeoLPHMplkt0FZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4475
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current design, when the tcpm port is unregisterd, the kthread_worker
will be destroyed in the last step. Inside the kthread_destroy_worker(),
the worker will flush all the works and wait for them to end. However, if
one of the works calls hrtimer_start(), this hrtimer will be pending for
timeout even through tcpm port is removed. Once the hrtimer timeout, many
strange kernel dumps will appear.

Thus, we can first complete kthread_destroy_worker(), then cancel all the
hrtimers. This will guarantee that no hrtimer is pending at the end.

Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7f2f3ff1b391..91136d71640f 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6295,7 +6295,8 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
 
-	kthread_queue_work(port->wq, &port->state_machine);
+	if (port->wq)
+		kthread_queue_work(port->wq, &port->state_machine);
 	return HRTIMER_NORESTART;
 }
 
@@ -6303,7 +6304,8 @@ static enum hrtimer_restart vdm_state_machine_timer_handler(struct hrtimer *time
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_state_machine_timer);
 
-	kthread_queue_work(port->wq, &port->vdm_state_machine);
+	if (port->wq)
+		kthread_queue_work(port->wq, &port->vdm_state_machine);
 	return HRTIMER_NORESTART;
 }
 
@@ -6311,7 +6313,8 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, enable_frs_timer);
 
-	kthread_queue_work(port->wq, &port->enable_frs);
+	if (port->wq)
+		kthread_queue_work(port->wq, &port->enable_frs);
 	return HRTIMER_NORESTART;
 }
 
@@ -6319,7 +6322,8 @@ static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, send_discover_timer);
 
-	kthread_queue_work(port->wq, &port->send_discover_work);
+	if (port->wq)
+		kthread_queue_work(port->wq, &port->send_discover_work);
 	return HRTIMER_NORESTART;
 }
 
@@ -6428,6 +6432,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
 {
 	int i;
 
+	kthread_destroy_worker(port->wq);
+	port->wq = NULL;
+
 	hrtimer_cancel(&port->send_discover_timer);
 	hrtimer_cancel(&port->enable_frs_timer);
 	hrtimer_cancel(&port->vdm_state_machine_timer);
@@ -6439,7 +6446,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
 	typec_unregister_port(port->typec_port);
 	usb_role_switch_put(port->role_sw);
 	tcpm_debugfs_exit(port);
-	kthread_destroy_worker(port->wq);
 }
 EXPORT_SYMBOL_GPL(tcpm_unregister_port);
 
-- 
2.25.1

