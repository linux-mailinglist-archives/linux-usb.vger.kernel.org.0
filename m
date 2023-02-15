Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B12E697AC3
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 12:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbjBOLaM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 06:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbjBOLaK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 06:30:10 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B21532E69
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 03:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngvicg+QlmkY4DPMwATdhe1aQTl76Xjgj6jWPq60YoAb6WaNzUYsge+1E8R8zPfyejmyJ6BMu/9gZVImtGnjbIGjw+RW45VX5qR3ZYHQsV/h7/qk+LeXEFHayLnz4w7iyuJOKEoNrOqboBhQjiqU5lYEkpSLx0YWXzINkhGXHjKdKd10d7UTU+Jak0QmBw08UC2sDVIIPXnGttSVG1A0043PS247qiC1xBr8CFWVgKOy52rLCnxtikvng5yKUteJT8kTAr87PCkPplGiQdiNXUVRpa6dCHcu0Ll9JDJi+GyMzIg+7OwZlVcNnTQAFruZx/KSmKDp5QjYSJ40ku6ubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS9WmpKmlw/McdMyxrCuDG/R+N+mVei1W+1k5Jqy1mM=;
 b=jGBNNVEnz2BmyTqRXHOsLm8ollza2RZol+mQR/sF7orgUeF1yvI6laxaHkmmGEYldJXvkN36B77wIT9hpMSKv668ReL0Bj4kBghHRR3OqLYWooabawsVgBsWaG8moBUdlI9IaPt3QkoOfsG2f3L8bKSM1BOcBRtZ7V10Xn5HEcl9AwtpRrxxdddcYycLs4zx459cRnawauVHtBtd3QNEmD1kL0Ohn1XnAUJ3IPCaeDN+zQHpVC1IbqJypEph1cx6Z9V6VBA2fHoVb8LaWPnk4o/4qLkS0aZUF7jsnRXen84aLWB7DJwFb9/+Yh14fzjW+pNDPkECh7S86PeAVAzOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS9WmpKmlw/McdMyxrCuDG/R+N+mVei1W+1k5Jqy1mM=;
 b=h53La9+WhujC7S/dRszKUCIjLiFM+SShgMXU4qHrHjYcteYxA0hQb5QeCr+hmUkpOIHKnVNmQA+Wv0but2aNqiXdVEFcELFofrOU8sxf9ARQt+zsTr63IvbeIJMP/OnPbvApCiNoC7Ibg70rw//Bu66qLgOUr0ikDQsbDNfVX9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 11:30:04 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 11:30:04 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: typec: tcpm: fix warning when handle discover_identity message
Date:   Wed, 15 Feb 2023 19:31:36 +0800
Message-Id: <20230215113136.2838773-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PR3PR04MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c5e2b0-0945-4b78-ca3c-08db0f47faef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3rXi9Xd9db53MRBDeNCMsE7B/973e4v8LUlQ28yy7MP71x5+OB9Z+61lz1v5LFxjCMiCpLCJlH1nmvddpbnAtE5Ezb+CaO/D3YqHkmNBWGx9kIV75MSa41Jssfc24B2HDl0SIG62fWszfuvdQ78zD6QWWQCdqQXh+VZcRBCbQrEtr/0PAN3T3sMrHq1+WttSWWpLeAmjE1xjFY99+gP2P6EPj0kLKfebGGfTqo3ZW8l/OZyskA3RJ8y1HxcJ89gxXrqLBmMAApPuWG1DPKzbpdGXu6XnKZXFj+MXtIn5yXkKZAuQFLpQBoN7xjfLr0xkLwgSEA1vvaVejCSF2kLoGdip3V2OUh5FHguFoqt8X+max0pDvIcR7MG3bqreG+VCq/GtD4C878a9Vg7yE7TLLTprx3CCpN4jCXVjom+RhEMMKipbdtb4nyKagLXKU/RA6UFXQMatf1Mx9keuRLCah6yyJ84qeFM/51yPUwPsBFmxdQjzCD63PT3IZ28kL6U8hg6ZkAvk1frF7mBOfVC3JQ8ENWvF76yMBP/Ww6XlyHrmGh1haTMEJuCZT7AKp4kB3EpZkQe03q8gkuQCsBMb1+/buhbHriNHFnZhMNJI4siN9s9wYxBCc45OOSBbSMm2kjPfgi5aLZmUJRsdpH0H17ItMcI0SDvtMHtwZQ0MnA6yvn64UsNstcPhqRtlx+6Kye3aGEst6H1oOJJSM4nUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199018)(1076003)(36756003)(45080400002)(316002)(52116002)(66946007)(6512007)(478600001)(26005)(6666004)(6486002)(5660300002)(2906002)(15650500001)(4326008)(66556008)(41300700001)(66476007)(8676002)(8936002)(6506007)(186003)(38350700002)(86362001)(38100700002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?voMthG9rgmvaFK/ATBb3mjscfj5IFYR8JzNctcrQM8n5hkxQfpLMu1AH76Wk?=
 =?us-ascii?Q?TodZ/fxNLPt0MkVEvQJ+qlCO7vSqhGlOUMaEiYT3M9XRNHQc7qQ9OTT5dd7M?=
 =?us-ascii?Q?keunk3VszqzrAnIQoxMeF/DYnt5x61v30cq6nGB9xQT/8X/4DkNbwRnxJgBq?=
 =?us-ascii?Q?hWyH2Aj93X8sN+FnKguT+1f4cO1LMxf6HbjVXjKdETvGFoiAqTQTB+xwJZ4r?=
 =?us-ascii?Q?3hdM4m7qD/zQFYyS+XiO/LEwg1F6fyorPOF+230OKg6+ASGBZKr/HAFuqZ/y?=
 =?us-ascii?Q?pDT08Ry+2XcN4uhdh9a755s6+YOWPHlLFf+pIp7Ae2zGcUjlC4x2mNKD8d+n?=
 =?us-ascii?Q?DCNCUAPKV0I+HVEP68KHZdvP2nox/SKwdmUPsUWiq0WThbGdm8bOYhfmg0Hx?=
 =?us-ascii?Q?pq04iCFrpqYsqAxfDCjZ1z5xtOAAlwnmnU9fLnKq/lruZfatNbJig9+k54Ff?=
 =?us-ascii?Q?K0yTjDIOTzoRsn+4at41asnn8edC8iAmCFDwdgkGWGKjKA1qWBEPGqHKb38h?=
 =?us-ascii?Q?3sD1klqfUezoYVy6bjyQJOSkWiuBuS+eSXN8QLMWV0d1wZ49KOwLBDv0R+Nu?=
 =?us-ascii?Q?Cf/SZIROAY1yu6651L0lwO/gFoo1JgleK86OiMLUkC6gZOv7L2k105DH3wk1?=
 =?us-ascii?Q?GPENQvft5CMIjCPB1o0l4lJF9zNTefoL6cXd09EvWvWPtT4wqyEVhI7GP5sJ?=
 =?us-ascii?Q?r/N//5xSF/eKe+iukUDkISvCfVtCcTgwmFegboe08fI8VF00QtkM/OtyclLe?=
 =?us-ascii?Q?Q5WHP8o8oOh96xeK5v/oEmPeHrcSA+9kqFOXqEW670p+uumUsm9vWkrBZJJU?=
 =?us-ascii?Q?T6KRCzZ0l7eAXNcEMps0oRvs0GUHztjoa/hIfpt8ci/E6Vr2A9xqoAF0xYLT?=
 =?us-ascii?Q?bNDa49Z8eFfw03gWM8e8OPhnjM2U8AusFZmR0c0et40gGZY4tjoqnFW2+J6a?=
 =?us-ascii?Q?nh4YqMv/2HbFeXTRHUSxSlpI/2D4gP5zT76GWDJmB1t9BE8skzRg/zIq68r+?=
 =?us-ascii?Q?E6KZutqDm6Xu0xs7PTTwAc7eg6s5pXvYrB+C2euhksJtHHBL2VgTgIwH2UR+?=
 =?us-ascii?Q?2xg8HUVwXJhiiPQgrh3cYzpBqA586emTdURb41HALyeWhshR2mPY/uEGeJH+?=
 =?us-ascii?Q?9VnpJT7Hr6TeAmlZa5OjhQ+oc9K4BcqWEtgWcRyjiRZl2lMaAYWl64bC4w72?=
 =?us-ascii?Q?C6sGzSnmUQIR0FxHQSnFjTSVFsFmWngI31hXl3FlC+Wb0UkSvUZFLtHhQ5Ol?=
 =?us-ascii?Q?ErYCjW4mowxBPuChzXPGK0cpcLeQGLCFgNWWhd1lQ+dRCSxTYm3jedfkJm6s?=
 =?us-ascii?Q?BFKfvHLpQFOuUgNq3bjndrFJa7gKMyKTDZXLJxgrGpdq5Sm4O+A0rexmL6ev?=
 =?us-ascii?Q?NBh1g2Ru12s1e5JC+wSx2rpXisxqAAzHUF3Nd7rwgwo5+nUKOXbUc+71m9m1?=
 =?us-ascii?Q?lQzaZJstRrbo0ZD7Gv3hAQdG39VfmNUAh0S2289TeQeo/ma3XvdThn8WBYf4?=
 =?us-ascii?Q?E8YKTc3d8vVyD9Rw1mPAyqSMhj0Ybv5NpwJ1NWs02h+fz5iDYfSIQtwyTJY/?=
 =?us-ascii?Q?zAb+0G8sr4aWt7I8Lm5hOI6ARdueGz8PIJrgRDQz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c5e2b0-0945-4b78-ca3c-08db0f47faef
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:30:04.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg3dBFl4aAgmfo2nU8LMNisSHZNNr7O19HX3QJNMphF0lMsoYYQ46zZFxZYqOnW6zWif0YPPfTz85T6Tev6KCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337
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

For this case, since the state machine could still send out discover
identity message later if we skip current discover_identity message.
So we should handle the received message firstly and override the pending
discover_identity message without warning in this case. Then, a delayed
send_discover work will send discover_identity message again.

Fixes: e00943e91678 ("usb: typec: tcpm: PD3.0 sinks can send Discover Identity even in device mode")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7f39cb9b3429..914bbaf4e25e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1445,10 +1445,19 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
 static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 			   const u32 *data, int cnt)
 {
+	u32 vdo_hdr = port->vdo_data[0];
+
 	WARN_ON(!mutex_is_locked(&port->lock));
 
-	/* Make sure we are not still processing a previous VDM packet */
-	WARN_ON(port->vdm_state > VDM_STATE_DONE);
+	/* If is sending discover_identity, handle received message firstly */
+	if (PD_VDO_SVDM(vdo_hdr) &&
+		PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
+		port->send_discover = true;
+		mod_send_discover_delayed_work(port,
+					SEND_DISCOVER_RETRY_MS);
+	} else
+		/* Make sure we are not still processing a previous VDM packet */
+		WARN_ON(port->vdm_state > VDM_STATE_DONE);
 
 	port->vdo_count = cnt + 1;
 	port->vdo_data[0] = header;
@@ -1950,9 +1959,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
 				if (res == 0)
 					port->send_discover = false;
-				else if (res == -EAGAIN)
+				else if (res == -EAGAIN) {
+					port->vdo_data[0] = 0;
 					mod_send_discover_delayed_work(port,
 								       SEND_DISCOVER_RETRY_MS);
+				}
 				break;
 			case CMD_DISCOVER_SVID:
 				res = tcpm_ams_start(port, DISCOVER_SVIDS);
@@ -2035,6 +2046,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			unsigned long timeout;
 
 			port->vdm_retries = 0;
+			port->vdo_data[0] = 0;
 			port->vdm_state = VDM_STATE_BUSY;
 			timeout = vdm_ready_timeout(vdo_hdr);
 			mod_vdm_delayed_work(port, timeout);
-- 
2.34.1

