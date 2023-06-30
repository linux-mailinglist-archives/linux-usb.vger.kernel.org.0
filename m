Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1156743A02
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 12:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjF3Kxi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 06:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjF3Kx1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 06:53:27 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735252D56
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 03:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5mcEzII5LR7XK2I6Mngukz2+fBjltX1OkGVi27a9FcKSux5uqw7qFPr2ZqrE2REbMh2sFSYquAba/aFzA3PaRZaajI3eNcKT/XNI6zcLS/BzjU+XpsKuvjrammEkHDdmNUvROtjzFVJfWCDoeqJLNLo/jImz0Gc3hpg3M27SyQb3IErqs8DEgullbI8ck/6wwjTu6WvYbCoLs9yUi7QHwOvqKc3mNdpqWXQ5063ehE10rBn6Pmvs7qVihj+iMuHj++EFvZsjrwyJ/7DkOfI7wqenuOqdDqwREiVN5CkwJMFM9R7EJcefXQcqabKbPMbhzxad/JcNNyOMR6BjZLD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIMrlG10Ngq/BYLhPY1BPsWI6mdYeKIj9aD+c8iAsI0=;
 b=TKk3OGrlK180TgtiHLEDXO/qsIa/9PLx56JYz/alANFqORh+osBnJ9+DawZFPO0Wx4DQOSdfCS1bEkDFf73JKnEbvKtv8nsHO0W0BcVfSn67jK8x9zWkRfhaGXoospN9ssA1EHY6fkn255cpCFCHc84s/5pyVo2DdzGUia4GPC/0QnJRwMbW4cYOzS2hYz1jcOK5r/1vip5mj4Mx3HdB9Db/RyINMzRNKe6wJ7jVgbuWR4K15M2qZXVdJeiaphOIuScFHOV2BOmIOMbLV3dUkV04NqIo97kh1/EHNlCKzv0gsmetXO4DKdnDPKFj0rdgZT2pHa0+skUtO46b0rMRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIMrlG10Ngq/BYLhPY1BPsWI6mdYeKIj9aD+c8iAsI0=;
 b=Q0t7c/X4SqWb5hYesdOmUE5tQ3gzB+DAbWcEt6dJUoAQUHkbH/f3OqbR/fbgzsh0GzSci4seBkV1wjt5DnElOwHZa6UX7zvv5xRlxztyY5VM98k0bSmI9yxPLamQ/DAxAGXCUohaRI1axK2z081KrzDU198Gz0Ew2I+JRnZ+l3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DUZPR04MB9869.eurprd04.prod.outlook.com (2603:10a6:10:4ad::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Fri, 30 Jun 2023 10:53:22 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 10:53:22 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: typec: tcpm: not sink vbus if operational current is 0mA
Date:   Fri, 30 Jun 2023 18:56:56 +0800
Message-Id: <20230630105656.2828595-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DUZPR04MB9869:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd39fbe-7969-4350-3b51-08db79583913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CuPMBlcc4NvhTmF9G0Z8UYeqYs4jO8FXeFahLTGpkp06DtSJ3Qv1+jdIpZWS1xHsPC4HqvHZ9hleQCBosrCoeF2XTzgDMGRYiq3gGtU5SVwywHDueKSo9ZPeQlaQ/0bvI92nR0Nm1fDG5nFt5BvSNTr+a17odKVN5I2glSWEKsVqQGvhrCnwL7DiYzx0uYXk0I4f0JuWc3JLJ1xmxy8LPky0kGGxyEyry0nUmsSY8zM5Qx89KXtnoi0tHbP9J0g7ADyi3AAp84vyxY1/jbvdd1Xvu2dInxSAkk+LH5heJXdx6dgGyaGW3FXn8ZGCIjgMt2LanwIlS5G4NpDg7w5TSAvRmCJKn+tFo2zg+01Cjn3DdVMcRa8qzM4Y2B1oBcIsZCqFiP9F6fzOqR4AK1CSQpFhN3J6p0jq8GrHeLiBfd6w2kuUy7l5H14kUT01WH4Llfvk5CSvbobpE5F37gEIUee+m3Axw7zjZC4pBW7QLyDIqPXpk940q2dLSpHhTKFlES93DG+0Mr5Wm5fqGtJOSDMH/4ZcC+eDYwBBQU+d3mD8zUsQCphio0gqvQiQg8m0y2L70hrObtvoyO9q0MFEwW7Y4JtTn3VI+fvZaHO83+hSDJ1gXW84cWOGd05AS+SA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(6506007)(2906002)(6486002)(52116002)(2616005)(38100700002)(83380400001)(38350700002)(6666004)(186003)(26005)(41300700001)(86362001)(316002)(4326008)(8936002)(66556008)(66946007)(66476007)(36756003)(6512007)(1076003)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtVK1ZFbFh3aGpVcXRIYlZ2WGxxVzk1ZkpPNTBZWjlMNGV5QVNlVGFtSm1L?=
 =?utf-8?B?YzNWRFlKcDNTT2M0RlZnVitMTEtoWFlNeXpxSzdHdkpmdkVlRVpIQVJlcE1p?=
 =?utf-8?B?WEpGUXIzbEttMHJuVDVXaXFneEdlbmxZRUlBQXRTR3hvVkNlbkVhVFAvVFV2?=
 =?utf-8?B?S29wVzIzeHpCNHRZVjhIdHNPVmhlNmhDaDZCWmhublBNSFQ5MjFoYkdJOVFK?=
 =?utf-8?B?Sk1OUmtqNStLQlhUbnQ3Ty9HTDZJam1oR0FxRWxEYzFCK3hSaTBWdTZZTWkv?=
 =?utf-8?B?NEtKYVA1VU4wSXlmanBUMllCVWdwM3lpVEJzTXU1RTN1Z2h2OHgxeVMvak02?=
 =?utf-8?B?UW9mOG1NMDVxaEhrOXJlUGtZc2hHcGY4RVRqM051Z0RsRVZ1eGNXaVpMdkxL?=
 =?utf-8?B?b1Q5VUpiVVhrYyt4cmpRTGErVGZDWDVxZU5vUE5zRGg5eHZaeEEzRFR5bmwz?=
 =?utf-8?B?NjdpRFJHYnpuRlhOVDM4cjhVaUFsRUNSNXJ6U2FyUUdOZkErcjhrTTcwdXR4?=
 =?utf-8?B?blFiSCt4UmFTY1RDODg2SFovcTZlMGxOa0ZoRTA2dkxvNXdlcDdpQjRPSSs4?=
 =?utf-8?B?QkFLa2hCR1FrUkN6bWxDVnp4OFl1c0RnRmRKQS91MnEwbDQ1QXNweEVoUHZP?=
 =?utf-8?B?RU52WG1YSXZzZkczR0ZaS3J2aW51cjVkOGVIbm1YZktSNFRLblRkQkdXS3ZI?=
 =?utf-8?B?NG9iMTlVWDNrbUxORmR4M0VkRE9vYjVQbjhFMG9QWHpZYmtueHc1Wm95Nysv?=
 =?utf-8?B?Mlk2QVh2VUIzQWJuNytKZkpWZjJtTkQyYnlOVmZrcXBVSllJVktFbGRNVkVI?=
 =?utf-8?B?NTBGc09uaXFIWUVCMEpYNzhTdlczZXhUUG0wb2dMeGx0YnBYU0svQ2lWU2Y5?=
 =?utf-8?B?bmxpOFk0SWc5V0o1eDBQQ2NjbjFEU08wRE9Hc2JzUDliaVBPNkFlOUFtdElr?=
 =?utf-8?B?RGwwK3pVb3dKU1lDN3A2ZmRDUlhlc2FTVGZ0bEV1N1lzb0VuVDRzMHdoUURu?=
 =?utf-8?B?L25WNDhCWVdHb29TOG85aStEeTh0a204Z0JQNEUwaGVKSzlQeGluMVdxZnVy?=
 =?utf-8?B?a1lMRnF1TUVKLzVHMGJGVVI3VFg4cmQrMFhtMEZHeFBHdXgrR0xYVEl1WFF1?=
 =?utf-8?B?bDhLa3ViMDZrU1ZaR0ZETVBHNExYMktocllqOW11aHpJTFJDN0UxTzlHWjJ5?=
 =?utf-8?B?K2tERUJIN2E4cDhQM0lUTGN5TkJpajRpTjlVdE13MllyOEhLQ2xIaEZ1Z1pu?=
 =?utf-8?B?YVBYdmNESklueVAvZ1AwdUt6d2hxVFhFSjVqZnk3SHVkemdGQjBLblUxYzM3?=
 =?utf-8?B?UEx3b2cvRjAveEdGWCs3Z2VEVkg2L0FJNU5INTA2ejh1NmRXZ1ROdDhJQ0xp?=
 =?utf-8?B?Wlp4RkkwS092NW12cjhmek9yZ0RsT3Q3VVBVbjhrVFV2bUMwd1VEMXpLbUM3?=
 =?utf-8?B?clUzcFRRVitRV1ljbWU3QjMzekxlWUNKRnRrb09SSlRnSGc0VklvQmROaXVF?=
 =?utf-8?B?UVBYMkQrVU5lSTAyK2w2WEIwRTVxZFlxblJaSENrMTJDblVTUUxVNWQ3M000?=
 =?utf-8?B?RURDc1ZRRkE2dUx3ZlFER1cwNGRCejNoaXI3V2FkdTJ2bE1PQ2pYSGVTUnBD?=
 =?utf-8?B?dkhxcktiZnhhekd3dHpEMy94cDhXMFR5REoxNmRHcEw4Unptc1Iray9yaGN2?=
 =?utf-8?B?NkZva1UwTVI2cDBHOFN1Qk91KzlGYlBYODZYVDYwd1VyMzQrd0NGc2lycUZz?=
 =?utf-8?B?T2FMbUw5ckwxZjd5RTdreExKN0oxSVRZZ3AvRXdTMXI0VkxhZ3E4RWZzbXd3?=
 =?utf-8?B?MXFRcGlkV0FQM3NmNFg5SEJqdTU2S0RmdWZOdlV2bE1rbS9IeURyNGdWeXY3?=
 =?utf-8?B?eE50allOSGZROERsU1FCVDRPUnpqVU5oNmd4bnl6SmpSU1MwbkRkVmV4V0p0?=
 =?utf-8?B?VStKcFJ0UVlyb1hKb09kQzhpeGdTTDk1NjJXMVREL2RqbWVNVWU3aU45ZUMr?=
 =?utf-8?B?UzNKYjY2eEJyZmtFYWFVY2ZhbkNWOWNkTFI5SXhEcnpNUktqNmlKbmtjTC9u?=
 =?utf-8?B?cmhXd1VQRFdDbVM4RjUxdzhicTl0SFZ4VmpOUzlsOWJkR3J0QXI0SUR5Z2ha?=
 =?utf-8?Q?Mykb5KWmFbzEciDAWE3g3qJkF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd39fbe-7969-4350-3b51-08db79583913
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:53:22.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir8xVnVnn76k0VQ5kReunhiGuwrfEXhcWZbQU+MhTd7yeSyszomw3sh/CmXX7bZDL15GpkQ/tio8mqDEZgp/pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9869
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PD3.0 Spec 6.4.1.3.1 said:
For a Sink requiring no power from the Source, the Voltage (B19…10)
Shall be set to 5V and the Operational Current Shall be set to 0mA.

Therefore, we can keep sink path closed if the operational current of
the first fixed PDO is 0mA.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 829d75ebab42..4f7e4c50e847 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4301,7 +4301,12 @@ static void run_state_machine(struct tcpm_port *port)
 			if (port->slow_charger_loop && (current_lim > PD_P_SNK_STDBY_MW / 5))
 				current_lim = PD_P_SNK_STDBY_MW / 5;
 			tcpm_set_current_limit(port, current_lim, 5000);
-			tcpm_set_charge(port, true);
+
+			if (pdo_max_current(port->snk_pdo[0]))
+				tcpm_set_charge(port, true);
+			else
+				tcpm_log(port, "Not require power from Source");
+
 			if (!port->pd_supported)
 				tcpm_set_state(port, SNK_READY, 0);
 			else
@@ -4582,7 +4587,10 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_current_limit(port,
 					       tcpm_get_current_limit(port),
 					       5000);
-			tcpm_set_charge(port, true);
+			if (pdo_max_current(port->snk_pdo[0]))
+				tcpm_set_charge(port, true);
+			else
+				tcpm_log(port, "Not require power from Source");
 		}
 		if (port->ams == HARD_RESET)
 			tcpm_ams_finish(port);
-- 
2.34.1

