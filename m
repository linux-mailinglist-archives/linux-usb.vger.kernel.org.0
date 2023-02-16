Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89802698B09
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 04:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjBPDNs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 22:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjBPDNr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 22:13:47 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8E234F42
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 19:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4n8qYhuXQaKxsg0YTibIH76PBiE7nGTpF9L8d4k4EqFJHGNOr0LZ4WXzDGGMLRL0vK90GBbIAjGNrBrem2qM32Nv939JMV/AK5TFyQFlJxCMIPu13GGo8AHbhVNShkJDzKE1VXIhNUDikEOzOB0NYNSqvkqkAnd9Xn8WF2SxUwl+qMj3+7G5ugxGf7JHe0+u/ExnqxtRwKQmWq4cAjz6GCbPLVW9T72DurmPB6SVAZrN6fvZo/WxKHHFA5GRvHSegCz90MAovSLofJjOQHWg9e8VlE2iiExDdEBImpSYvXg74V6Z4ZGHCvGMWLU3YXh6hrBj/oUVMdVCSK5NAJPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqjBxnCCQhKu/KLVQkzZJIRCQHBdb/+uuMOCqz9EHxU=;
 b=cGui1S7Ucm5UNUjTYHGjenercIL4+pihBdCAMKgVvVWN5jMp4VipOUpYUR+HiIgOQ/u3QYtEPU1/VA/7PoHTHy7AYNkVIdQgmu16+MjVK3aH1X9ww6/xdP+mWpHMx1vSSZybCY3MIwy8bT54rHWeTFPmd0SEyY5jpTxgV4fNv0epWkSEQcK2+jxb/vXmSu4jrfaloUx39QlMrYo2lHKpCj8FCeSjokrJVsJcOVhDDnm57RZJvdQHTaDPutUOA9BDNumJ/h4POx/+YOpL6pBixGFd5H+wy9Z5I4HcF+LJZPnwmUrEGeWC/nSCieg8iU3Qllg3rr0ZPsN2cB8/hYy9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqjBxnCCQhKu/KLVQkzZJIRCQHBdb/+uuMOCqz9EHxU=;
 b=d2xPJxim+2lO8MtoeSqKAmZw9DGvVytdPgnwNxGsru2zR6TAjyEssJmOTTQLc3iQvMl3Wf6KovmfLuoUPdSxw6HaWvSps+6X58Z/g8laDrIEtBZ6DzM0Ga9SqTRqeqkzGoVnqPMb3wAqSV4Fodt39m745QWkE392GXzvjVNzOMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4511.eurprd04.prod.outlook.com (2603:10a6:803:74::17)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 03:13:42 +0000
Received: from VI1PR04MB4511.eurprd04.prod.outlook.com
 ([fe80::6a03:87a3:996b:e894]) by VI1PR04MB4511.eurprd04.prod.outlook.com
 ([fe80::6a03:87a3:996b:e894%5]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 03:13:42 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: fix warning when handle discover_identity message
Date:   Thu, 16 Feb 2023 11:15:15 +0800
Message-Id: <20230216031515.4151117-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To VI1PR04MB4511.eurprd04.prod.outlook.com
 (2603:10a6:803:74::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4511:EE_|DB8PR04MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5f7f5b-a18b-4891-5522-08db0fcbce7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jS2qK8rlTNvviIi1TEPUO0pWVRmkdH/iG9ajn4jTVdrFubnmfmnDlla3JzZAyXFltj27my/Ht1tEI3c5UpHMMsPXxT1JXWRG30odd41gclhpKziKD3SJ112WR0Af+zDzYOo7m5lTiV8xXGu8IoaZ83PN39RS7BKgZWHZrnKiSJ7RU2Ygffl1sLEjJhKVb7+I83kPQFf+zmhvMgXwsfZvfSNp6kVQI7cvJ8lT8AAm8fOv6o3MXdJnr6lJDIbRvsa8jWYEbyIv5xClhOnYy0Og7gwYixqfy3ZzZPZd3i6hYMEvaPyWRsV2dgv9rDbK3VsYvktCGZPUgbEbjA2fjNqYPoU8SfKJAF/cGTWOwUhF5PW3XDqaD6Yjzl0JA+B2k6K2pAy8inG8+ydwqGymnIS4V/5dYfFnDBQj2DgpFnDfrhD6dLMtfNhth+MEb0FYaSI14QtU49ZHJF8K399NswyBZCnPYvRQHGA9mBs/7CwcC29dRpYGR9Thm+0SbCdyM3KJlyxdDWVUd1wbHVuBQE5Z65QbUaW34lo9uiOmJ6NUyKQIMXD8qv+1OO6WTCswvLbFAFQuOiAW79RWzZ4mdoYeJ3387FwHw/IJ1UJcdzoAl1lsYD4tRcmwIlWeXgZXgiyX1sUjxPrqimqA5gI+UVc06EAlzhPWyuc20xnyaQ8YP5WcuNZWUeaOtAVz4byYmE3w4+YR1x7RHUWx6DDYyScF8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4511.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199018)(2906002)(15650500001)(5660300002)(41300700001)(8936002)(38350700002)(38100700002)(66946007)(66476007)(66556008)(36756003)(86362001)(4326008)(316002)(45080400002)(8676002)(52116002)(6486002)(26005)(478600001)(6512007)(6666004)(1076003)(6506007)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OJJNt+oJJuScMWSea9yiAThEEgw1jM5DPJuxaauhTw4bmcuGSqvziDaxxnBb?=
 =?us-ascii?Q?S8YNzALR/UM6rT4v3mIHd5DYs+9qGusGBOckd4fYyLwB5567zHck9aUSIh+Y?=
 =?us-ascii?Q?wXluH8cJhgEGEI2hdfeZzxbyxLViyjC2c3/8SGLdCoP598xxn25pcYhwoIyI?=
 =?us-ascii?Q?w8X46AKCiBRQnezn+cLhx4CbShcvgn6rFgAkXm0HCbj3YeP7SB+c8M9AYD28?=
 =?us-ascii?Q?Ems0QueeA9eOx112QSeIE438rCol8QPC6z3VaRNI65RgawJh0v2BPqSZCqd9?=
 =?us-ascii?Q?qvV23Lg4z03SfLtoFAh3nJOja3oVQUrqRytQMJroo1X4FQX/li/ubg3wiyzz?=
 =?us-ascii?Q?hUIFUd5sWE9BFroxp434F3wsodSNpAwdH82hFdmnqhqQKHhpqhM+OLQP2XeK?=
 =?us-ascii?Q?6hTA2nuXC4j1tUjtjTuxvVjxHpZlMpeLHWEaKi2B52OFGhhSXV/hMz88bddS?=
 =?us-ascii?Q?dzZqDnY2gSGg3SufefFN7q8yDups09/MI+50n1QfNIH0z6TznFh/dqjsiXbc?=
 =?us-ascii?Q?drRZQ0T5AeCaeQyGeo73BrJpYZkG15wsnVcN3fG8tLGlBhr2FxuyCTj/Fju0?=
 =?us-ascii?Q?wippxPcUXEzrqUVq52oGYhFM66i6oFSowktUVX7wTIknofK4ekLXZDL6ALUu?=
 =?us-ascii?Q?Jq9SJbSc2C5xl4mYOijrXhecSwiiXj+f7b8CIlyqY3RafyqzFpBISdX6+Mxq?=
 =?us-ascii?Q?RYz4XzWIl97Ok0bf/g76CD0c+NSjUBZQ6d9e8O7d1+Q6560/nQt0mosV2U6i?=
 =?us-ascii?Q?5Hukm5HlssdN/0hwweabKUIZ7qRTegKo5wdhChC3osHOPd1iNc4bRwAlEPmM?=
 =?us-ascii?Q?wUB690MjDMCyYks81wcjqiWu85hjy2+2LSh/OoZ+xm2bRsNaC6lTtNh2ilWz?=
 =?us-ascii?Q?FX+5hN/9Em8zkjs7eXy6CMc2ZOHlp/xYlq35/7YjphlHMCIZT+FmRmaqZWSc?=
 =?us-ascii?Q?p82bjnESI/I1C60b+/vuRPYS11p5v5cAQfkjo19r3sqXQYMwxVY52dpLiEO0?=
 =?us-ascii?Q?sXuz2O/utOgWK8f9ydy/sY6+scRH4ryDK9LUMx8FBfs7SEUhDPdqnJCibduM?=
 =?us-ascii?Q?2aRSrLUqWtopZlxtvIJvIV4YTe9yotUJzO7/i9T6jVGPliSrpiV9xRBclORt?=
 =?us-ascii?Q?ZgVlt2OQtnMIfPL/SYriF1aMiuYVzZYNy/WD6LqwfbVy44CSPqIg8ZdSbIw4?=
 =?us-ascii?Q?WWZNLK+MP7Hu/VtH7W4TZ19YJNAnp5SB7kzJiPu+9834iAJd+4S8op+x32+l?=
 =?us-ascii?Q?6soebJRZtp95RNeXfBJbQA7TsowdV9G1k2wrhzOlpGaas+wa8vfyjHdcGCOe?=
 =?us-ascii?Q?7Ln0aCujo3hrddn9EG1a7wmwbGv2//QWwA5dpDSscZ/yaQSnHI2gVg9y2+dH?=
 =?us-ascii?Q?ljRhzJm5EpkeAXKJWUHROtgQqQeggW7nVJ5Acuk8td5ZBFT5Rg7LiRlw07Vr?=
 =?us-ascii?Q?HwtWFzqjB3Slbw3BChLr7hEe6/pbJ3mTlgGterqIuF+B5RLeQ+qOADJ2NQaP?=
 =?us-ascii?Q?Mslsx7MJR982m3o2rxEtFYRTD3A3O6PPZoT1HFYHCPkwODBcc2wVfsctoOEI?=
 =?us-ascii?Q?fuO/Q6MtQVxdNxKXIHf9Nd6wHXe3pCMtNsyss1U3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5f7f5b-a18b-4891-5522-08db0fcbce7a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4511.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 03:13:42.1833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sVXzO2ilVPNDlQF+P0o+VGH2hX53oYaq3gsCppZYxQkHit0qgqWqWv3rRqgFCjoTtlsPJXnvwrH9/DKfnyXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since both source and sink device can send discover_identity message in
PD3, kernel may dump below warning:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 169 at drivers/usb/typec/tcpm/tcpm.c:1446 tcpm_queue_vdm+0xe0/0xf0
Modules linked in:
CPU: 0 PID: 169 Comm: 1-0050 Not tainted 6.1.1-00038-g6a3c36cf1da2-dirty #567
Hardware name: NXP i.MX8MPlus EVK board (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : tcpm_queue_vdm+0xe0/0xf0
lr : tcpm_queue_vdm+0x2c/0xf0
sp : ffff80000c19bcd0
x29: ffff80000c19bcd0 x28: 0000000000000001 x27: ffff0000d11c8ab8
x26: ffff0000d11cc000 x25: 0000000000000000 x24: 00000000ff008081
x23: 0000000000000001 x22: 00000000ff00a081 x21: ffff80000c19bdbc
x20: 0000000000000000 x19: ffff0000d11c8080 x18: ffffffffffffffff
x17: 0000000000000000 x16: 0000000000000000 x15: ffff0000d716f580
x14: 0000000000000001 x13: ffff0000d716f507 x12: 0000000000000001
x11: 0000000000000000 x10: 0000000000000020 x9 : 00000000000ee098
x8 : 00000000ffffffff x7 : 000000000000001c x6 : ffff0000d716f580
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
x2 : ffff80000c19bdbc x1 : 00000000ff00a081 x0 : 0000000000000004
Call trace:
tcpm_queue_vdm+0xe0/0xf0
tcpm_pd_rx_handler+0x340/0x1ab0
kthread_worker_fn+0xcc/0x18c
kthread+0x10c/0x110
ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---

Below sequences may trigger this warning:

tcpm_send_discover_work(work)
  tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
   tcpm_queue_vdm(port, header, data, count);
    port->vdm_state = VDM_STATE_READY;

vdm_state_machine_work(work);
			<-- received discover_identity from partner
 vdm_run_state_machine(port);
  port->vdm_state = VDM_STATE_SEND_MESSAGE;
   mod_vdm_delayed_work(port, x);

tcpm_pd_rx_handler(work);
 tcpm_pd_data_request(port, msg);
  tcpm_handle_vdm_request(port, msg->payload, cnt);
   tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
--> WARN_ON(port->vdm_state > VDM_STATE_DONE);

For this case, the state machine could still send out discover
identity message later if we skip current discover_identity message.
So we should handle the received message firstly and override the pending
discover_identity message without warning in this case. Then, a delayed
send_discover work will send discover_identity message again.

Fixes: e00943e91678 ("usb: typec: tcpm: PD3.0 sinks can send Discover Identity even in device mode")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changelogs:
v2: modify some code format and commit message
---
 drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7f39cb9b3429..1ee774c263f0 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1445,10 +1445,18 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
 static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 			   const u32 *data, int cnt)
 {
+	u32 vdo_hdr = port->vdo_data[0];
+
 	WARN_ON(!mutex_is_locked(&port->lock));
 
-	/* Make sure we are not still processing a previous VDM packet */
-	WARN_ON(port->vdm_state > VDM_STATE_DONE);
+	/* If is sending discover_identity, handle received message first */
+	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
+		port->send_discover = true;
+		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
+	} else {
+		/* Make sure we are not still processing a previous VDM packet */
+		WARN_ON(port->vdm_state > VDM_STATE_DONE);
+	}
 
 	port->vdo_count = cnt + 1;
 	port->vdo_data[0] = header;
@@ -1948,11 +1956,13 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			switch (PD_VDO_CMD(vdo_hdr)) {
 			case CMD_DISCOVER_IDENT:
 				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
-				if (res == 0)
+				if (res == 0) {
 					port->send_discover = false;
-				else if (res == -EAGAIN)
+				} else if (res == -EAGAIN) {
+					port->vdo_data[0] = 0;
 					mod_send_discover_delayed_work(port,
 								       SEND_DISCOVER_RETRY_MS);
+				}
 				break;
 			case CMD_DISCOVER_SVID:
 				res = tcpm_ams_start(port, DISCOVER_SVIDS);
@@ -2035,6 +2045,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			unsigned long timeout;
 
 			port->vdm_retries = 0;
+			port->vdo_data[0] = 0;
 			port->vdm_state = VDM_STATE_BUSY;
 			timeout = vdm_ready_timeout(vdo_hdr);
 			mod_vdm_delayed_work(port, timeout);
-- 
2.34.1

