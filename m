Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E98F3F5D16
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 13:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236575AbhHXLa4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 07:30:56 -0400
Received: from mail-vi1eur05on2069.outbound.protection.outlook.com ([40.107.21.69]:26272
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236650AbhHXLar (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 07:30:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5et5X5Q5VCg5Qb192tQKfdGLi6LlUkJZc5doxg5RUB0vibHRtId6ZFc8VWvu9jCPp0e9t4lFnT7OyCcdVi/u5PxsUZpnxMOQQWILoSRTx1Vy1iiGvpyIehbhlUFmakEGDCUyHR5kAESCiik4j5rsZrCE0EVkKu2JXqVNkw9AEuFa4hvTDXNxS8OB3ESUsB21SU0DWnqqUoCtABWkuBrGwafbA9Kot0DEos0iPhYl3FijG4wKo8kXRxkWXbDqyHQ+NVZsOx9l6DiccbKpIg1RUoXhTgN6QqcO9+hlo6cgO12xhh+9QxIZPMFjkSHqKtme1nbBrRCiInt5kwmsg/KgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rdFiyTX6ds3JzeKsVhePMJ+vREPAhxheGTDEaaJlZw=;
 b=aIguuILlwC3D3o2fjllg7GbcYvnLitU2Ob2hATnORzqs848D0Z4fhIq+DS5rMZlkK4BKDLmue42XyrKq5u5WD7OEI3rsq5N3pYEsXlHBgDzXZM1GHcbPdnyk4rcQAzbWYxqhEgkD9aze22iIps11eP69yFdEM8Z42Xuk/X0u+0pPxZ3UU0lGtTjH5tP3olUK952D2Ku4UiwabHko/9gtXZ5LknYPzA50N3F0i9NrnPdB8p+/w1pbt895jWXKF+ImtDgvKgY+eXZy3wCj3OlkqGBSz1ahfQHI6cbk9zvCn74qUXXCz/so/PmpEzZf+DHbLbrS/+vfFkk7zvrDk47oYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rdFiyTX6ds3JzeKsVhePMJ+vREPAhxheGTDEaaJlZw=;
 b=awjBLCNOWzuvDULp7oR2TZiy6nRC+siG2oz9QQWly8n33JVbBtbakURs2ee3rHqsxQbMchwKpBJxeWVBsQDMp3rJvrdRWKxXk35ZJhDNhBna/ybjRk8Be+ivbAwiJJb3swYxtX7uyot3EfWvstuxZYfQS0KSUCuv9K2aQuJXK0A=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB7PR04MB4473.eurprd04.prod.outlook.com (2603:10a6:5:34::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 11:30:00 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::c40c:1c27:b836:703e]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::c40c:1c27:b836:703e%4]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 11:30:00 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net
Cc:     jun.li@nxp.com, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/2] usb: typec: tcpm: Fix up tcpm set delayed state which may not delay
Date:   Tue, 24 Aug 2021 19:30:13 +0800
Message-Id: <20210824113014.1420117-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR02CA0083.apcprd02.prod.outlook.com (2603:1096:4:90::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 11:29:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60f3ead7-b910-4af3-cd84-08d966f2826f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB44733B46DF3F3090E6F7A08A8CC59@DB7PR04MB4473.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKKKYsK/ALumkcxFb13jigQ4oeyBCrSvAxQibkPaRL8aUWrKU+3Z/40A2vWZlJihg+74v+pTimZrSgE2RgwyA8FUpr7OOSonCnkO0OVF87EARNTvx42ttmlrscqJ04aOVUEqiefYGomRgIn31Zc5W1EY6U3VkT/Dy86I4oC+ibPSaq7hKHsIck677d+0QMKTN894wB53gwPD0yRbPoOlvj8B8PSrjpVXFtwOzovZtUxfshlVRhNWpcV2aJRSDrA0TzJH2OGrufY0eIefC9aiIDMqqHteIYPCrhXiojfQa3+1PdoS7e8m8O8471eTUEZUkiNYGJ9ozScq+ML7A/HTP4BUbv5i4k87cGf3oY7W9R0DPIVJYzBytUA8zP9pxrvEwGMv7Auore+uqjKb27YmjIgs1uSue5u8mqKnbQCiZSZqvu65/OzUAYRfUd9mU6ARoJTk/AGGF12w15humkVSQNxNGAvYIdswrsO4h6JvO/p6Q5pyLBskUsoPqoy0U/aq5emq5ZeECIfImPMjkB0wXSBZtz7I7Iv6PqOML0G1v+O8MeWu5p5MIua1rc2OAnQjRYWs3MMXRox66ikKcaJ56RS5qeAL3LfOrDddJzTa7+pBqdMRXSac3PF4NudNVT38Hw1VsYCuXvSTYvz2arM10bpCClXkvJUpRyPDbNQXdz68UdERWLe9guCFCBZorL9t126nGY4wIzewyY3ZjC+Phg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(316002)(2906002)(38350700002)(38100700002)(6506007)(186003)(478600001)(4326008)(83380400001)(26005)(6486002)(86362001)(956004)(66946007)(52116002)(6916009)(5660300002)(36756003)(1076003)(2616005)(66476007)(66556008)(6666004)(8936002)(8676002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?El9ERA2fFaClo46COryD1XNLC+qZrFXLtZi/WsptBXdZ6Rm+JdT+wA7FC9US?=
 =?us-ascii?Q?C0ru4k9TZJ3N2c9799RssEN0AD3zGUSskgqanWOEu+zlIIALnsIFL9avk92l?=
 =?us-ascii?Q?PO063vf7lJD8AeFcY/SOM4bxuQuS1UN/wEHxn5VsRLmN5RNd0KCInCBKHFWr?=
 =?us-ascii?Q?tIVJGj0TeBrY1v2Gg8tB5izpmjyHcBiQDdkuGZ6VeC5wjkJ2tIM/AY1Nxqd4?=
 =?us-ascii?Q?AmPV28y3rvSVcTk2+okl+kJmfrEvSjVVu1PKkICYta3I6ydtndHJ6j9SDLRS?=
 =?us-ascii?Q?TWCDDFA4mcjM2QxGmm+NRhfGJwnQvtWDrtvVb7vLua8mKCG/fjs8wh3eWlp0?=
 =?us-ascii?Q?WVtflmy3RHo8WFiGZW36IETGdbB1PnO+WUPtWa3WiMrTCjJ7MLL8pTD1WZFp?=
 =?us-ascii?Q?Xr5wGq0DF8q5MV3+rMSbHmtiA6dXxMQ3Kc522660jH4C8X/0Py5nEFKv1PTp?=
 =?us-ascii?Q?ziGwCbQGhZCBncuZEVMqdwDfeR0xs8xdLq4sDwEXTyH9vgCC1kHYQ/TJEF0k?=
 =?us-ascii?Q?3+/5aRpmxO+ylDyCjHnDvb5XphgXRIO5K38SqoJAfjhxpWhaLxWqzlBZJEyg?=
 =?us-ascii?Q?YUh+CnrlzhbxOjlGrEugVzt55bYkNmwShPm6MWdcoRCH0R5FYKtf3qSFurnR?=
 =?us-ascii?Q?b6UssAmD040vf8z3Yx0sq09YM1r+QkN2O0gIjeBuoilRP/zGkT26G7R9Z7dv?=
 =?us-ascii?Q?wK/hTQS9EuWrBvi4cTDcL/DAC1PSieoyf29AbWADJWOjP4/qiELJRqWeKzxC?=
 =?us-ascii?Q?8GlUCOivwJfYJO9QGCTxkF+u9mZyh20BE04iQyNw98BSMuk9myTtVNg+j+PW?=
 =?us-ascii?Q?5y4zB/0etS7ilpZbix6MKzp0ms8llkUfpw8CpXl5qOrGhp/TzWYbwTpWYxyR?=
 =?us-ascii?Q?fOBBYPU4tk5ko+m18As5sPRgBjxsEAHWcxwTTO/pwqTIH9X4VHffOZkxBZvS?=
 =?us-ascii?Q?Q4R44xZ//xmObCUHsHxA7yFLkv2utoE9RD/46MhANWq69HsE15eBIcwe99e7?=
 =?us-ascii?Q?B4t6Fp+McCPWDXeA9CGM0eeKp1uq3U3Er2Ux7RNy+Vn1pXbR8/r6eDvO7f6S?=
 =?us-ascii?Q?3yyABsBh18pd0PMilAInouaGZSOcu/bgPe/Kb9ZqB38UPlVBvOrOrjVieoza?=
 =?us-ascii?Q?1hj6ufSG9roeJQshs9tJz2rLie+JMqDGEvsc9+XFkUwLpBkSrbegjVNz4xbw?=
 =?us-ascii?Q?gW6fVQvu2o7RwTp2ky6+6F9PZm0G0mtrIN0LE6BhUJsehJRltKkDZKIlgpos?=
 =?us-ascii?Q?HxrcikN/Sro5r8lrd+1X7Xh4usuS701YrDZ1fP880JCfV0LZ7t+Tb48snJcO?=
 =?us-ascii?Q?jZYCqegCATYaQ68PQuP3GYme?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f3ead7-b910-4af3-cd84-08d966f2826f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:30:00.7692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wb4lZ4HWE37DnqVqIl3IBqjIfxkEKi5Cel6mQoENwDhXcUxhIkmBdMLNQoDpK8WqIXKhmvtO2gocuhs4Wn8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4473
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Setting a delayed state by tcpm_set_state may enter the delayed state
instantly without delay for the specified time.

[   65.424458] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
[   65.424475] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[   65.427233] VBUS off
[   65.427238] VBUS VSAFE0V
[   65.427243] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
[   65.427252] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[   65.427258] cc:=2

In this log, tcpm should change to SNK_TRY state after 200 ms.
The following sequence may trigger this abnormal result:

          [tcpm_pd_event_handler]      [tcpm_state_machine_work]

1       tcpm_set_state(A, 0)
2           port->state = A
3           port->delayed_state = INVALID_STATE
4           queue work to worker_list
5       tcpm_set_state(B, ms)
6           port->delayed_state = B
7           start timer
8                                   dequeue work from worker_list
9                                   tcpm_state_machine_work
10                                  port->delayed_state != INVALID_STATE
11                                      port->state = B
12                                      port->delayed_state = INVALID_STATE
13                                  handle B state

In step 9, tcpm_state_machine_work gets scheduled because it has
been queued in step 4. At this point, however, both port->state and
port->delayed_state are non INVALID_STATE which causes the pending state
to be handled in step 13 without delay.

If a non-delayed state and a delayed state are orderly set in some works
except tcpm_state_machine_work, this bug will certainly occur. Also, if
set in a thread different from tcpm worker thread, this bug may occur.

Therefore, when port->delayed_state is a valid state but the
state_machine_timer is still running, tcpm_state_machine_work should
keep the delayed state pending until the state_machine_timer timeout.

Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c40e0513873d..4bdf119b1306 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4815,7 +4815,8 @@ static void tcpm_state_machine_work(struct kthread_work *work)
 		goto done;
 
 	/* If we were queued due to a delayed state change, update it now */
-	if (port->delayed_state) {
+	if (port->delayed_state != INVALID_STATE &&
+	    ktime_after(ktime_get(), port->delayed_runtime)) {
 		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
 			 tcpm_states[port->state],
 			 tcpm_states[port->delayed_state], port->delay_ms);
-- 
2.25.1

