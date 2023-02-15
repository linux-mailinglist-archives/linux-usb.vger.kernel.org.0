Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAA36975FA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 06:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjBOFsY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 00:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBOFsY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 00:48:24 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2059.outbound.protection.outlook.com [40.107.15.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93CF2B0A1
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 21:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7TgZ+AynD5VcipKDlXPXnpXutINipg4eI6/0R3R6x9CfbPhzQ1Mj5CEZGIJCXvhsvKN8jBjpLOjPZ2ci22ODOhoLbDtop8zwNdMUB60Lk2reb4ewNdK1UuRHlmdtjOHnsdN284rvDHfK16BW3FtuYhtHs0ITFWAgZbi0McZ1enBw8KbK9XYnJe7dV8GVmDIGd4ZVyvrm5cnU7Jsbr2YERskfaLjHpxJuj77bQ5UL8Mrl436cDRQgQzRYHB8RQG7D5flWuCd3j795w9l4MVr3zDcSGO1K4DFfekR2W6Nw33jSn+X7j9OZbMAADUpyjqcv95F2BttxV/SVOgQp5lSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xAeJxwCVj3t7mewBG5sjtJMCrYPkqd2AluKA7fc85M=;
 b=JIgD1xH9drTb4PbZpmCLI001qrs+T8IB2229JWfbfHHsdet4PPerqmjpWSkStbTxlTVfZSclZl6as+q00IBkzs6bP4dge1ESt0TjX/+IzTLPhD1w9IDulLVXBvlcTsPgcAvSKfu096OTl+56zoycIvvi6mzE3bI9Y5FQIfmsFc7iyGeW6xTFD7js7D1F5/WHu0HwSAz7gu+Ujjh6YXR6+ygb5gj8Btup1lVDyaZEFbUQbBqaksj0FRXyz6ezGO+q/1kNgUEoKdEIleFdGEMTIaEcE2K6FRLJwUTjf31sU3M2K3vhHSKbmO7SMKTDjUS0/MzagNBO9U3SxXN80ppQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xAeJxwCVj3t7mewBG5sjtJMCrYPkqd2AluKA7fc85M=;
 b=YK+MCdtZoGMG4vEY6h+RBK6X8FEjzNGtNP4urpwYGkGK1q+kBCmchrY8zkC7fLTpG0h61v5SkdZz6oO0BL8RL1lN3BD6D/plv1A85TpFIjiiZfiEbDeJEyGHEwstOPHDxWo0geVkWWlM+0ok96Ab/ibiZLXDrb8r1q8wm8WQiQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8024.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 05:48:20 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f874:ee07:56fb:cbe0%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 05:48:20 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v4] usb: typec: tcpm: fix create duplicate source-capabilities file
Date:   Wed, 15 Feb 2023 13:49:51 +0800
Message-Id: <20230215054951.238394-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AS8PR04MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0aa86e-5d98-4d93-aef4-08db0f183e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CWQfY7uxhbr2FBJMVAa+R/NdfMBrFuBiVrJZFjINO9KSiTOCDsEGeBrgdi6pLZZVH+6NXXsQbosWfrQ0UiW9D652bTAS6+6QuX7mYzAy8/g3EzmaXlt374JMEGSI56LfK0r617dvJOnl4hqoH4O1eic+o83ePaoxIf/xd2s4zaHzsIQhhmdqUfMZRRwiXoFmDyWVnH6sDLr16IOUKhEaubzlexwHF7jQk+gdzS0+lRdNGdiKJwpj4utw5bWTcIJ0arz0pLKUycgbjoLOtdXs3yPME+brMk1x6s2gjsu20xNojFFtNI0rzD37Wy+UKzga36T1AqpjlfynhTdBOsXURRkkj+wIZuAyulFRlmQJtNneb9f9YbSWTqQpOVcZ0Ex0dd4EGUrPz5gLdJ4E0jlbWcgr9p8B2h0Eka8FMDnpPLj8yQ4oofxolWJS38I4lp0UU4dRrt7wXYLGfC2qYqm/g+GIeWErzDVR+yvsTzEonxEUX30idr/VwXc5/M5fbLw5QiDdQeApBJWDkI7gjJ3lGnGlZJvq9ZEadVtbb4cO57zXQopy/0FcyZWSlJzXqng4O64mBnVoDglOEE7uu+xhwXcO1t608u85xQAxucUBbnmqY9ABRBHsCuI8xnzo6B2OhY6gDiOdg4N0SchueM7pu2gOiYrZDxxxc0XA1IUF4ROATAtrzNrUkE1oka2PFKMDd1HkHbDeMCwWvxaF5TQghA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199018)(478600001)(36756003)(66476007)(66556008)(66946007)(38350700002)(8676002)(83380400001)(38100700002)(316002)(186003)(6506007)(6512007)(52116002)(6666004)(8936002)(5660300002)(26005)(6486002)(1076003)(4326008)(2616005)(41300700001)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cZGm5joVzFVGEeOW1RoZx27yTs3nEhKrr05BBSQgWYs+l8wYKndKEpu3Bj5z?=
 =?us-ascii?Q?vbBcBHL7QY60UUujsBGowK/efF88HIAQG4xZR5q2kQ07SWDtaER9RpmiZW9G?=
 =?us-ascii?Q?m5r3xNRG4O8DKfN2PAgmyfNeZlS/8nxXcUetTSNRx+NI/O60OBV/Kvuc5QP8?=
 =?us-ascii?Q?FxJgXaBRg5nbEgVCc9XlFbwEWrVdCyD+5b+TazPjo0E0lq+6iW5FD7ThTswU?=
 =?us-ascii?Q?ZTydqaR+C/YoCYp9fu1ZJauWKfArIcpvp32z2Ol7/m6XtOMEUOJJshvVsQ2F?=
 =?us-ascii?Q?sO04NGwFeSSfzgMplfTW8ipcRG4f8/SpmXiCR3f7OMDZXmttDE0DOCgIC3Vp?=
 =?us-ascii?Q?NAwmy7mU0vx3zsD/7SGCkYkjyPW4NcVHZY6VveJQYWu4K6QUgYrrAozpGi9K?=
 =?us-ascii?Q?ylOxX6b/NneKFJNSNJPag2JRUjfkCzOUzrS8+RC+Pwg6C/gwWAde870Mkx1m?=
 =?us-ascii?Q?aDoUMzXLkL2cmGq8TDgVoZDvjCgqylJ8A6XeYvAfchyGHOZe27ain1HjEM5p?=
 =?us-ascii?Q?WUmbQ06L3hCiOj8YJxFKxc7Jo9LQDSmnIXHue4rGYQM9f/lwCSvnemMY3HEq?=
 =?us-ascii?Q?Uz4g6SwYcXHlKJRk3r+jGKM0lOOu86CVqnFJogqLovZG0EhGYiHKrhNtiz3L?=
 =?us-ascii?Q?sYc3NXJ+MIefXEzj7KY3ToeWAztCptItabCGw6AkCEGzy/gbYHUs+lQrxsIR?=
 =?us-ascii?Q?QzfxtM3vN0OtcyIkZK85IqMUx7vgrZKSbMGfN8XG9Yhf4pBC8csxRD5XOCdt?=
 =?us-ascii?Q?ifRa5k0ohz12YDRjI4ZeyF9mrZvbEXuaWiebhdGOBFoHh7H/VHFSnz7InREo?=
 =?us-ascii?Q?opSO802rnV6nL/VZtB63O2pueJQM4Q6kcH1DiMakf9vmFVBqS1wTXY5nAeV4?=
 =?us-ascii?Q?nY80EKbXYBM54w67Bt+Udtw68WUo+qV1NlMtF3NsZZXjFuDi1QihT+9F/N0I?=
 =?us-ascii?Q?OfFXyenzBUrLCBc1yaNgDjbfdWzS8z5H1YiyUrG8LCm3wgcamyRmf5axQhX4?=
 =?us-ascii?Q?XK5wH3HWsyQGjYUpUzjZL7dcgp3B8EfAJmBV8N3fxMfKmjsZty4FhvkWf/S9?=
 =?us-ascii?Q?y8B0wwC1bWiUDUuEJBR91EZCYpwPTG2gQTKWPHyT8INAz+cmK1svVJaoJMNe?=
 =?us-ascii?Q?/fwaDhspjuScFoBDM8MmvKghBqh4cpfsD19sy+tO9OUP6MONtLMRZ0fTjzGu?=
 =?us-ascii?Q?WnQ0x0JrRRlOJzmCshSemYjZjie4kAIeT+ALhFM1WCbLwud+4MTifFiMBf2D?=
 =?us-ascii?Q?S6u4VYkaYtGd3yRxYyn1LsYdVuZNRA4MtuxqsVQTkevnmFkKCeFWwChZBBFX?=
 =?us-ascii?Q?vUZN1rMF4XofDN1HEpSNzGZBLBsgFxw7OxdG9xgdh4t9QlQAu1i8XbNPUiZM?=
 =?us-ascii?Q?4hptbo8OMz6cRk4GFN9UBPnmcRI9HEnNB8UIXajQGLgEy866ETkQBqWl9hL4?=
 =?us-ascii?Q?T1H7jeeND3C3foCn7MmXIYqkKvqtDNXlUPg8artSVNmXQqJ0EEWYEaA9cm8Q?=
 =?us-ascii?Q?Pa/kHSkNnwcXTniPipk25gj5cc1ylhLZXVdpvyPTVdDVYeor9GGl3sprVHOJ?=
 =?us-ascii?Q?po8UsSgyr9g3wL4sP+CLBfX0FWE28iYWqVxFl64s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0aa86e-5d98-4d93-aef4-08db0f183e3e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 05:48:20.4265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUSHqeddgwuS7bpG4ASOJzy9i4eBT1lclohhS2wLQu05Q3MygKbGIjFPXFOBGahx7N50Uyo+FSJSoHcZ17lLUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8024
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
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
changelogs:
v2: unregister existing capabilities on specific cases
v3: add changelog and modify commit message
v4: reset port->partner_source_caps to NULL
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a0d943d78580..7f39cb9b3429 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4570,6 +4570,9 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		/* remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
+		port->partner_source_caps = NULL;
 		tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
 		tcpm_ams_finish(port);
 		if (port->pwr_role == TYPEC_SOURCE) {
@@ -4589,6 +4592,9 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET_SEND:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		/* remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
+		port->partner_source_caps = NULL;
 		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
 			tcpm_set_state_cond(port, hard_reset_state(port), 0);
 		else
@@ -4718,6 +4724,9 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, SNK_STARTUP, 0);
 		break;
 	case PR_SWAP_SNK_SRC_SINK_OFF:
+		/* will be source, remove existing capabilities */
+		usb_power_delivery_unregister_capabilities(port->partner_source_caps);
+		port->partner_source_caps = NULL;
 		/*
 		 * Prevent vbus discharge circuit from turning on during PR_SWAP
 		 * as this is not a disconnect.
-- 
2.34.1

