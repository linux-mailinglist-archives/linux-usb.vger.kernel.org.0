Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D55946E671
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 11:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbhLIKTz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 05:19:55 -0500
Received: from mail-eopbgr60056.outbound.protection.outlook.com ([40.107.6.56]:61643
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232856AbhLIKTy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Dec 2021 05:19:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQbLLpGwF39LZDbgOVLPIb6P05gryMLxTZQsrMyQ6EP45CyWmUbrDa+ckn+oaDevWHU0Gr1bMZEcxpyoJ8cIEHWl0DjmS0OgwcsLko8CwHMBHDSRbaz03pbJVrWqh9apDRujF+WDc8/4/f1xyYwMVRd9I8g/dz/X0K31QJm6THsULyRlRvYsRmjVnss4hoK/d8k/Fy9i6Ia/EShDDLyZCWsQ3aBPftm+WhpYuoRkzejo8tpljI4kXEvwrjd238xeUhtNaizZ+77bzfEsZd2Sh8wqeLePx8YyeNcbtOljvaK1WBS1Zl6FzKmjpCHLJxyMCSLeJvpuDX9SncjTgkvKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER/Y5cjhSnmGQPujrPwPP2jyFvKLWXwFzexjPKBjuyU=;
 b=PtqfhBbhyCH3wqwQtvUXTwBpP29oceHJxvqdK6NupDJ/fGp1HMirX7sN8ai5QW6FZKJi9WhUskvvKny4FGixu5snkUdJLRV3PHNeSow+gM9KZV4hguP9XVgjfUPBNbEDD10kAcJ62CI/dj05mzdC1+3ugL3dlkEKScvZb6GF+vCCAkGPnk5jHNo0XXFykYhxR+Rr16k1pBYw2msE/ctEAmy6H6bzQwcq2n+RC8VadASX/aw7+qdvQrRrIaQ8bFsQETcba4BPyGA7JzGHwE9CbUOS4/hJBWxKrMIPqE2+3D2b5bK3qFxUntrfYGzPZ9PlwaIE1u3vo/89HE6GsYJ1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER/Y5cjhSnmGQPujrPwPP2jyFvKLWXwFzexjPKBjuyU=;
 b=mhjqDQr152WOidYU9s4oPgbMa99Bpajy3dydgtpnPZuBhkQGFc4nLkTh4/KLUX+bpBX1QVNIxH4hmgoAo7Hw5bUUNq2ew3VgsCNrFyWjcHzxZ1cerXs5GbJQFPqFOz5jijGnGyvQ4uFt7g7izRdrPN2c9GRW8ZcaKmrt2+u2e7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBBPR04MB6266.eurprd04.prod.outlook.com (2603:10a6:10:ce::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Thu, 9 Dec
 2021 10:16:19 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51%5]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 10:16:19 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com
Subject: [PATCH V2] usb: typec: tcpm: fix tcpm unregister port but leave a pending timer
Date:   Thu,  9 Dec 2021 18:15:07 +0800
Message-Id: <20211209101507.499096-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::32) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
Received: from localhost.localdomain (119.31.174.71) by AM0PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:208:3e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend Transport; Thu, 9 Dec 2021 10:16:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09059b60-297f-483c-e953-08d9bafcf13c
X-MS-TrafficTypeDiagnostic: DBBPR04MB6266:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB626608F73F9E3C772A86642C8C709@DBBPR04MB6266.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HW3nnkHglNe62msPBlgGGEASrK1dHtqQNbF8ZDNHx1pw3dGYB3Qxzt2ZlYfvu/98bt7uqVXGqcFLtUxC4ZOZDU/gE2/TpZjsiLbkgWR+h8PbXOBD0vJJlRXpAQskV53p4vMHHhXa8oRlQjufZGMqEGLQmWBt9LN0flyBCeAe2CTRvd0WBPbWgH+BZgRx4xud9f/iSiPmwP7hMuwQLsEOcC/ABHKU8LZaxHL91EeKAIoV19X+hFxma0JHlpOENKM8xfXiqtXt/4wXun0sxTflh0RiT9aamfOptm7azOqnOKrXYkGJAp1AV1wzy7jU1Cz1VdwYaWkCBhPlCRLoPHrYgZPc+Z2T8aQHH7YASR33BsCgIKAun9oWaqzgixJj5XWTwLZb9z3nFP1VXfM+6wilJXxSnRXcY1LgaQywgY/kE1Kt68K8O2tPGcjij7AllNZ9Yq8GAGd0hk9vbWA0mAdcbgqRTMvDxqrFMJOpEiho9DEiFyHGTEtUSo2P+87Nex5bEjI8C/v+2OJ7/vs4BPVRJ3roT5adVLfgfhyIRZr1J4K0Nm3c6QGJ6RkNB7PRW0qKxTVJR/7w55TewBjyQ3enek0zhNU+tWysjYjNcALGZ8bPQTpnfUAdvQbSb44j801ygzhvKGt9lOdIoirpgjG6BX2q8JvsuadDCpQgAdxWZGMKCcXWqrMLlZt9V4sZlhDBdjY7g0Nv6q+5Yji7UeHcog==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(66556008)(5660300002)(1076003)(66476007)(508600001)(316002)(52116002)(8676002)(6666004)(186003)(66946007)(26005)(86362001)(38350700002)(36756003)(956004)(38100700002)(2906002)(83380400001)(8936002)(6506007)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3w/sxvLHONd2C8V8oSR605DyQTFLtvcDAZOLrOZfAdfdsmpeyDrzyOQqRDgT?=
 =?us-ascii?Q?uGJmZbt7O8Q34ijwnSciN/NKADV1ojwKrhiiVcZskDUxdzKwdYuZSyjl0fri?=
 =?us-ascii?Q?BXtJXewHxOx6Ey7KLZhyY5XxVIgTjvcAvoqMdgTdP9gtiGd8KY8YXLpqnGIH?=
 =?us-ascii?Q?o9x3rvJDkwND3f3tSzBGPOuStdcRXFylkcMEpDFvqDr+tQdOMbPX3MdPrTiz?=
 =?us-ascii?Q?grYn+otaglI7NeLKI5v8Oqmu7eixXn5ZWTgoVsIfGj0YAaOMbfzOpOCSl+1m?=
 =?us-ascii?Q?iGW5BVz46HhrXiXERYW24gWV+cTTFb3PHaHeqaEhKzxkHNZhI61p3le09Jhy?=
 =?us-ascii?Q?BmSw9fMrWXMAb5QcQPHbpMcz0woXouPksuP+CZudgA0GKJTYHVgyAdCGQP+o?=
 =?us-ascii?Q?MOVeO82n1gdke7jh8anR1xamXVanP5tPzd7NHm0ybANn/vcrhiRdKbd8sWOS?=
 =?us-ascii?Q?CvyAeJZaIBmAffW+SuTWJSBqpTWNOGZxGMDJeuzyvJeb8L5XAOQMF6amzoG7?=
 =?us-ascii?Q?pjVpDm7z9fizcPVVSWpKfxplqO77rZ8qQtpUVXO9QX1Rijw9CCviktq3VgT3?=
 =?us-ascii?Q?xU23COBHFCBG+kUcV4tgBvlC16Td+ojBYnOSMCMtDTlYPAy3QKHSkEi4wqYY?=
 =?us-ascii?Q?D+3IsvKcLDmVnXvB4kufjCYPbLuzJj8KXdiC9R7e/rpq7LmjF0ZZk2yof7PD?=
 =?us-ascii?Q?kF2vnWX9ZFxqM5MJ4AUGShYiv1aQY76poI+x2uU2DD7NVLLnSoYsOqyqjdN3?=
 =?us-ascii?Q?0DhuU9huJTaNDh2Ss47EvuVLJRXnDtjjwgYUIk2hr+T+knMiOk8/tfSVpIZb?=
 =?us-ascii?Q?UceomfrmDw2YcoeK5vxFdtSTgQkmO0fLimwC2zwE68JQpcR4rVFysegHeasK?=
 =?us-ascii?Q?XLFQS++r8s/vntM8W9yfzuKtDDP2d0v7tZEWZGHoi2mIHDpDJvDg2egKDgXJ?=
 =?us-ascii?Q?vmHgMk9oSCP4O+bX4blZYHwHWGYjF9V397Am4t3HxnhDpmTwC8exOE6p0NJC?=
 =?us-ascii?Q?QUBTVtdR9+n1aew4M7/AT8HecvyIQ75HHFRLNkWadBDtwq6D9OAORoYu0Tat?=
 =?us-ascii?Q?/l7by5cbcemV9ZFYgNkW7ZLfCagbzzvENu4XLNj9oVVnaOUc5NQA36A6OzEL?=
 =?us-ascii?Q?4iqQ38Ps3MXfNMUpkpJpkd6nYPYvM3Ke3F3qFNgR7X7qnWx5HWEbS/RC5icv?=
 =?us-ascii?Q?uOVJc89WZvBKq/om43ZYHDxTWi3IOjht2BgDT0Q0OSJ7Y7A7xKM3lqi+da+v?=
 =?us-ascii?Q?SsAW14I9niYkxYGpYzSyqN68+xnPnPdh+KMBdoht2VvUKXudoUNhgNpo7cXW?=
 =?us-ascii?Q?H8RCTi7UT4JKywPppsF5ppebEltTy7HKPLsR2diwLBnrS+gRc6kqT9j875RE?=
 =?us-ascii?Q?EbNsUafKjpY4kYeQk/wHDaG61gxN+o8VkCmZy+2ZAgeInaB3iF3R5UbcB00c?=
 =?us-ascii?Q?+VUI7sC9mPzzH7U6J8z0rowiD/SxKPfTwOr7+evzeFW7VzfGMU30nGw8MTwC?=
 =?us-ascii?Q?B80Aju1vy4loAkf6Z9u0ldljxQ4w17a5mEMejPStaWutLhPXxt3O6neVSQBB?=
 =?us-ascii?Q?KQZ1ev0HyfEozUtG/ofKvRHv0iaVhZnq+gAFFWZDTRMXWnFPqbdFu5o3qN8h?=
 =?us-ascii?Q?mZALiJufExznRxmpw6vvTGM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09059b60-297f-483c-e953-08d9bafcf13c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:16:19.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5x0bHkOMxaX//bG6fp54BrGv7rXqsiLK3qTlvMt2TrFGy4mdefNrXyq3UDHwakSTVYyBWJC2znAigLzGCwnXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6266
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current design, when the tcpm port is unregisterd, the kthread_worker
will be destroyed in the last step. Inside the kthread_destroy_worker(),
the worker will flush all the works and wait for them to end. However, if
one of the works calls hrtimer_start(), this hrtimer will be pending until
timeout even though tcpm port is removed. Once the hrtimer timeout, many
strange kernel dumps appear.

Thus, we can first complete kthread_destroy_worker(), then cancel all the
hrtimers. This will guarantee that no hrtimer is pending at the end.

Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in V2:
 -Introduced a flag "port->registered" to avoid race.
---
 drivers/usb/typec/tcpm/tcpm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6010b9901126..59d4fa2443f2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -324,6 +324,7 @@ struct tcpm_port {
 
 	bool attached;
 	bool connected;
+	bool registered;
 	bool pd_supported;
 	enum typec_port_type port_type;
 
@@ -6291,7 +6292,8 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
 
-	kthread_queue_work(port->wq, &port->state_machine);
+	if (port->registered)
+		kthread_queue_work(port->wq, &port->state_machine);
 	return HRTIMER_NORESTART;
 }
 
@@ -6299,7 +6301,8 @@ static enum hrtimer_restart vdm_state_machine_timer_handler(struct hrtimer *time
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_state_machine_timer);
 
-	kthread_queue_work(port->wq, &port->vdm_state_machine);
+	if (port->registered)
+		kthread_queue_work(port->wq, &port->vdm_state_machine);
 	return HRTIMER_NORESTART;
 }
 
@@ -6307,7 +6310,8 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, enable_frs_timer);
 
-	kthread_queue_work(port->wq, &port->enable_frs);
+	if (port->registered)
+		kthread_queue_work(port->wq, &port->enable_frs);
 	return HRTIMER_NORESTART;
 }
 
@@ -6315,7 +6319,8 @@ static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
 {
 	struct tcpm_port *port = container_of(timer, struct tcpm_port, send_discover_timer);
 
-	kthread_queue_work(port->wq, &port->send_discover_work);
+	if (port->registered)
+		kthread_queue_work(port->wq, &port->send_discover_work);
 	return HRTIMER_NORESTART;
 }
 
@@ -6403,6 +6408,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	typec_port_register_altmodes(port->typec_port,
 				     &tcpm_altmode_ops, port,
 				     port->port_altmode, ALTMODE_DISCOVERY_MAX);
+	port->registered = true;
 
 	mutex_lock(&port->lock);
 	tcpm_init(port);
@@ -6424,6 +6430,9 @@ void tcpm_unregister_port(struct tcpm_port *port)
 {
 	int i;
 
+	port->registered = false;
+	kthread_destroy_worker(port->wq);
+
 	hrtimer_cancel(&port->send_discover_timer);
 	hrtimer_cancel(&port->enable_frs_timer);
 	hrtimer_cancel(&port->vdm_state_machine_timer);
@@ -6435,7 +6444,6 @@ void tcpm_unregister_port(struct tcpm_port *port)
 	typec_unregister_port(port->typec_port);
 	usb_role_switch_put(port->role_sw);
 	tcpm_debugfs_exit(port);
-	kthread_destroy_worker(port->wq);
 }
 EXPORT_SYMBOL_GPL(tcpm_unregister_port);
 
-- 
2.25.1

