Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1C9769597E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 07:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbjBNGzJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 01:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjBNGzI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 01:55:08 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0332114EBB
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 22:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEqBRy40fUKuW9hQ1r0CSGD7oci9Aw6GGpoKZV1XXOz4o1mtgpuvX6pl607LDnb327b96xULrkGt3arFMpubH32raLsDcVh9jp5Gr5AIMfvNSyvMLP/9wD+ngalOVYFgu4a9YF9BdCozHNCybHAOVspsLOXc1dCwXZSbpMhQ9UYNy8jdth0NTLO+HuQ15ePxYKi1qBQyuC4C0+QBUP/O8hvqDs/fQwIQ9/Dcze95EBjrS3xCd/LWZYMw0tGz0+qMOjHBFfl/AneM7Z0XLh64xYgZQtHrqqdWQDQbRU124/Qst2Yx69URuZ8JHISE6wjWCWST/ieGGU2mbgpaj1c3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHtMdCCUCkZMj/tcGCvyqJErR/sgAGB/Gr7gLqyp6pI=;
 b=GLB6kse+cl3cx9BiKGJPAvi98SOJsCZnzPeAqAj1fjQTUrLEXnxDuL9XkE5+UAaVC8m1SRxWdQ+wgPldyzOQI60Gz6rqQORR1851wEiTEdks31VAGbr09AifjBczUAEWPT5yKeDWRvJ1RbvvfOizTjlC0xivqZQXT2aB5XX7h2RWcXcUUJjYW75sFb3JEfUennuImFbk3ih26r+iK9OAv3XE4qzFciPkj2CcyOKRDdARwfi0grvfRf2k1YwMWcc5sIEewfUS3E3EJ3PLcc/ioGoHcuOXWwspOep/DvTUmvoSrLwZEQ7Tka/BRPs+boDzUiG88bdYUk1BchZ/Z41POA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHtMdCCUCkZMj/tcGCvyqJErR/sgAGB/Gr7gLqyp6pI=;
 b=cSdt9657fl6GEIxs9Xhd/XsSTi2buHWmerxXbQT5taq83zuBL3cS2Q354Gi7aTWE8Lic4PNZR/gSklPk70XyXSDH+qmrNottCuVLDenZBrTT7anwQalJJ80rXm/B+XhvJeG9B1DLVtQeLJue+zDaj05aBrB1JtdLv3mpPtp0P6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Tue, 14 Feb 2023 06:55:04 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 06:55:04 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v3] usb: typec: tcpm: fix create duplicate source/sink-capabilities file
Date:   Tue, 14 Feb 2023 14:56:35 +0800
Message-Id: <20230214065635.972698-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 3421616c-8ab5-409a-42f2-08db0e586672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwaeBCvp5M+eMk4wAMdXdsdIbP04QDRFZpUdg9zeg+P0LDcj0VHuqfZl1qRjicyUW1B3zjJICrnu1hcUmqmAcBF4MsN/orah/HvZmU2VkThQtSddeUm70hET4JotxbhoxJLbfw6LQ5UA8R9+tI8iWMqXMTvsCAoU/jGSpAtzSGLdOSQLEFd/kHrQqn3rJj95x7B3bMMzeFrJkMZdw+O/hdE0EcH3N52nKf0aRhNxzQ3HJleoF2oiMyGLsA35ES49kdxO3jrhLHtu+GsbtsSnG8ftkNiES6xRmxknKenU3FJI6PpB2fhv3ZA35re5ka3Yzk7ymzYQrmmUluXp7OJw5xYHhYpaQ1ssMf8z32Cx5cTqIQQnU0wUNU9gFdEok/kaNT4pMLJL1xWYIkLSs1FW744O6wVaPq7x/MLBpdLjlRe0puK5lWUCV9y9dL/3xh6OoHY8fJVFPekxDdQL6mk0AAhrhsI1XYZQrSvRQ0lMrQTx++B9EIZbXuexL0G8ismrZBSMrEIdfd7Rrl9x0XGodxP7VZka+n/7PzShRDQwpE9i+uXQd4m5CJ4FVO5hZEsMhDgx7+VsH4WbLaei1unHZbFMuHJ+un6MgixXBplrlM4g82ZH0juTn7Dkx4LkpjjXZKYgE/UYhwGb5FBA2pqDqGlRxljUXsws07LZNMESjxco9WLllI7BEEWCFlADgucctxaRLo2FTwiklanBqy6U2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199018)(36756003)(86362001)(66946007)(316002)(4326008)(1076003)(8676002)(6666004)(6486002)(52116002)(2906002)(478600001)(41300700001)(66476007)(5660300002)(8936002)(38100700002)(38350700002)(26005)(2616005)(6506007)(66556008)(83380400001)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mereNrm4VwRjqQ/akOXVkLcSTDi9RCIkelCw1/aeDI/2NstHeem3cpCauHL/?=
 =?us-ascii?Q?jzLeh4w6fS5xGPVhyubb1iRFDUAz3LhTPklKGbjtk/MNFO/dlAAuocwmLmOf?=
 =?us-ascii?Q?k1Y07GcW88/UIqT0/IeFX2Q6j+cVNiUeYsbWmGY9A/bdSx82k4rUAgjERiUz?=
 =?us-ascii?Q?Ry+OV/o85BvrZpBo2pTvTbkJPW9iMKGmrZrNnVojNpQ/o6ni6w0ct6rzMKYl?=
 =?us-ascii?Q?RqNeDpkMK4bBU1OEJ+E6uUS0qDzkyfMfzSNZonHHiPy5Mjg0UqgulA5votp7?=
 =?us-ascii?Q?7WFObkIyw1X1bnDOi9fAqLfZ2nIM624o2ZHicalrFk4S+Mwa6x1jWvFPvvsq?=
 =?us-ascii?Q?mHDoTqPeMF/jcdnlYyRz1AhqOVtuQETjlv5GZKMmZTlGQxP1a8fOBUQh+h87?=
 =?us-ascii?Q?dIhaALVz4ciAGUI9V/Q1YGmOXziVbuoLUjE4hF+fpqovQsvy9Lpv7hULG45Y?=
 =?us-ascii?Q?p45OY+dcrirjl7Af96vyDVpq2LmDwsorkhuENH7aLw/rUt4cegB5YJ03UFQX?=
 =?us-ascii?Q?bEdjDD1PJjD092ItID2z40YuU461h9zEglQ4vCQVovzpVx/GY80BiaqiqcTu?=
 =?us-ascii?Q?aspoLP32pc/jYkDW/q69YCO+DAvh9xMjrLnZllVoHdoMmcZqYqbmSdbbeUIf?=
 =?us-ascii?Q?xHpkaEXNfasztG1UNrpbfreM4yBE2vDM/yd3hrgdoUJ4vKB993spFIuT5AeY?=
 =?us-ascii?Q?1vHayHO7Q5eEBEn8Q/0m7Tw/OnuuG/M1CgwjSi+dfNK7XSQJAh66rbHBp13J?=
 =?us-ascii?Q?bTqdWGm4okjIIzz3olFIj6faXV3t171SX5CiLJ0o2GSavvNWfPtffBZ8vdKA?=
 =?us-ascii?Q?PrAbIUsWbd7yfveTxORX6QJqkqw0UvHcpi2v5onaL55pQ6ja1eJ6yhzGIES3?=
 =?us-ascii?Q?JM423gXGs2QtuirYQiOvmz/GJUPFkN0pWu8rm3IUrYzoS9EuYl6TiItWp3Nt?=
 =?us-ascii?Q?K3HjTeDhYPRw8EBcEDInh750gXu6xSxdyN0HBplT949n2DjL6d4TPtQjom7m?=
 =?us-ascii?Q?nvzAf2uIchB//9yUFGWxITt1TwTx0lcrd0dMFgMfzM7W40tSYKiBWrCWiaMp?=
 =?us-ascii?Q?ef6Z5AE8ZqltWtEWTc4FfyA3xQeyh1WcW/l44ygfU4/N73LJ3CsGDeVclO5F?=
 =?us-ascii?Q?INPYbDokHOJdYAryamaxWygi0IoybxC5NGbTVhfbNvCWezclaKVbx3Zm5YM1?=
 =?us-ascii?Q?Y+v22U2oXfnR26bzHQUa8dEHmwZXRYAfjQ+dyIouBfVUQV/Tqv/948XFNPvU?=
 =?us-ascii?Q?wM0plW4uGQPDH10Ty+l+camoIVU3FyU92ZAcNrDfJeifC0iMiuW9OGHaE1zD?=
 =?us-ascii?Q?ZcIkNZ2/TbH2hUaBHMezOkOjvofwbkhQpUAkoylP+9RT0ZuzlORFBg56DXdX?=
 =?us-ascii?Q?9Opmms0WnJ7nZU32ZjMvmEOhJpT4iQDktAuhVCT/T/IrfGIF/8JPi2gzbBxc?=
 =?us-ascii?Q?+KeYl7tEMg/wDXwhFG6wgL5zijFUuqZuEcttf1wgi6X1ZiZf+IZrFx4gP8TM?=
 =?us-ascii?Q?VGgEKw/V9uIG9DPe4xuBBJ4mASY2RwQ6HJmqJHANy8NRNFXM/XcOTzQOIpbG?=
 =?us-ascii?Q?4y0Bv2IZ+5TeGUMvFMY9KpiAXVdG9zw3x4t76VCj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3421616c-8ab5-409a-42f2-08db0e586672
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 06:55:04.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+CQmXaMG95PUdrXtVd1dftzGAkD2C1VL2OixsPpcIopQM7WkX0bm3cE1mUS/CdX7LkSNYS8lhUax4FL8S5BoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The kernel will dump in the below cases:
sysfs: cannot create duplicate filename
'/devices/virtual/usb_power_delivery/pd1/source-capabilities'

1. After soft reset has completed, an Explicit Contract negotiation occurs.
The sink device will receive source capabilitys again. This will cause
a duplicate source-capabilities file be created.
2. Power swap twice on a device that is initailly sink role.

This will unregister existing capabilities when above cases occurs.

Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
v2: unregister existing capabilities on specific cases
v3: add changelog and modify commit message
---
 drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a0d943d78580..7d8c53d96c3b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4570,6 +4570,8 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		/* remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
 		tcpm_ams_finish(port);
 		if (port->pwr_role == TYPEC_SOURCE) {
@@ -4589,6 +4591,8 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET_SEND:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		/* remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
 		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
 			tcpm_set_state_cond(port, hard_reset_state(port), 0);
 		else
@@ -4718,6 +4722,8 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, SNK_STARTUP, 0);
 		break;
 	case PR_SWAP_SNK_SRC_SINK_OFF:
+		/* will be source, remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
 		/*
 		 * Prevent vbus discharge circuit from turning on during PR_SWAP
 		 * as this is not a disconnect.
-- 
2.34.1

