Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1AD748168
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jul 2023 11:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbjGEJtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jul 2023 05:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjGEJtH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jul 2023 05:49:07 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2080.outbound.protection.outlook.com [40.107.6.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6869A1713
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 02:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKxWZyn9XdfqtGdw6rsC1yTjR2bdSa/p5t+F8yqItZyJ/gPJ0/TspSoiXCyF7tg8W81Pqid/JEmA71ddjH/K3CWDRYxOKb9M7DAEUeNN5hWdnjvZMkZyJuaXvrsA+ZIb20cGkubHqY6k5S2nse+WVwVd1xXg16T3C7YjbuIsEeNMabBIw/X9o/2sZCdg9Q3W9gw9OvLtStT/5HiM9BKiRpOzWvoF5ooZ+voqYlNL9/LxsAMOTPSGm+VAPbFUqssH11XKKktH8KDNVlLxSdrRSoYqGroH9v2tIJ0n2WtG9MkEVpAQbD+7XFUfzdTIdg/hIhaFgiSIuwNvbm9Y4Mx6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heACbAkC38dd3EF2M/52ReXGOBvg5eS0yU3ovcgSk98=;
 b=Z3NJlK+hO7dJKnjwvR8JS1n60Vsk0hUWaK550lCSyHlk3J/uZ82vEe69NuhME0Lx+lAx5uQM5Or+/azcwU25jzXqysWjcChCg0kPhvOmSvv2KsSlOpcfuCjlkOxgpuCb4WzEUeCdHrGmzAoYy9nbthtH8fw1fECloeOOSeQR/FQ8kq2n8/s02R0vPhVPXfGj7JfP6hIOqRYSDJtcQICMkDK0lnoLl1rucJl9PS7DOf+FU3hqnPC55nTOf8yZ8TQE6XMy6F+3vomwVjK2GZVn5L1acfAhJedAuC+bwSdNgnN3OCCRZdvKTVw2MPR9pbWa3fkrBPmODhxLouz5r2m+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heACbAkC38dd3EF2M/52ReXGOBvg5eS0yU3ovcgSk98=;
 b=JKIrUXU07gw44/e4rA3SPDG2or4KaLMCdr6Fwc6qWP840eRXSMVo5v7NzNqAzgEB80PGPTS+8PLQMRiYynvAK/XuqsjgvAditMsmn2YGdwPLeW0Jkwd6ZxhEi/7LgNNjmIBScGBk0GS9Rtd36qaMESPkr1IuTI1uj32DuubvlD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 GV1PR04MB9087.eurprd04.prod.outlook.com (2603:10a6:150:22::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17; Wed, 5 Jul 2023 09:49:02 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 09:49:02 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     gregkh@linuxfoundation.org
Cc:     heghedus.razvan@gmail.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH] usb: misc: ehset: fix wrong if condition
Date:   Wed,  5 Jul 2023 17:52:31 +0800
Message-Id: <20230705095231.457860-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|GV1PR04MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: d9709024-bb3f-4b2e-905c-08db7d3d102c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJkeOUZca61sK6M2mzGA33rJBMsuWovJRrkzx+D4jk7mB5tJi1TMfl8XDvqCPlL9UGfbNCXMW5J01QS+uPPL0VyUNjQHJAXuBtiOmtPouV7gglqK3yYEJjWc6RztIpAmmU2Jvx0PU+T8qXcqfJhECxcDgeXjOKTzXX4HpiqWVCVbQWEFws/crXXDfL2vS0wYjglhQTmglaxCwMYu8PaLIgVhbnWhNAjefq3t53q+oXSVqCEfA2uvI+4Rigzxr7gWYu9j3IG4f32cCFlW7crTtiwgEINzaIzJYRa4JukOKtPMi0okKvHhK7FEobFDFLwdOAVOOX9UomkxHjYEX8xKYg7MhfK5256MZ5RQD2RtduskUjMCycfbz3vQED4CssmHqo9nVS+ieTPSrQXdw96BT+sqjcWifJqqUjVEHnQVDVSXBQx78KzPc21ZNbGA8QoueIgoQJ1YeCxW0n3IBvKG/29zOSX/xMgO4BMNYbzfn2rKIwsTo05W9KrbuH/xxLbTvPJaL/TuB+MqYfg5lbD2UEELDmD1jzm/5ZWfpyVglcwQAq8tf8pSh3dAMi5hbqUXMPq6DGERKnqZuiVgRmFi3gYtUc6q3vhd42c7Kbhg6oGtGircI4hyGTBSpKy0yKoZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(478600001)(6512007)(26005)(1076003)(6506007)(86362001)(2616005)(6666004)(316002)(83380400001)(38350700002)(38100700002)(6486002)(52116002)(66556008)(6916009)(66946007)(4326008)(66476007)(5660300002)(8676002)(8936002)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AiPkwcl2/AXWxebljS3rQyksE5j5PGRaDrCD+0tDk4xZROrVDgDOV1a+mskF?=
 =?us-ascii?Q?OLv5V6LyuYCIofui8X6EJfNYDN8cJWyiS5azY71P+4NIJHAyDquHprBNB+QG?=
 =?us-ascii?Q?8Rf0pEqu7WSTE8pTRbOqsPfUWz+q0Mra+wFzzHU8KUhSQSoR+QmPgEypZlEg?=
 =?us-ascii?Q?TMG5RumxzbzaeLsWxWWFmeXAKWRxeQGu61ccr82GBrq9U0MEPa39x/DX8UwE?=
 =?us-ascii?Q?stcnqWVhSww0mNFTLDvlNvMjWjp6NXH1SPRQ/JcaUm8QDyK434+iCNPQpzmo?=
 =?us-ascii?Q?SRqza/HPpQ5tZHmTSqhBLmI1ExidCYagzt6VWsy3yZDvnsmi8TeLOTK7tRYl?=
 =?us-ascii?Q?5i6DnnnKyxipJDu2Ob3NVWU0EHcLVOZ1hRCc9/caZqUbKtiYYQHeIbjagqw4?=
 =?us-ascii?Q?vX9g75ZV3GkBwUpBY65eyGIk0+gM9nQGHr8h7GUuKpjpQop7fIwqze48sqdo?=
 =?us-ascii?Q?mqn6vGWIXpsg9zQwW5cuyTOaZubdxBbCLhRnhFQgkUSMDEzU9n0fdXHmLf1K?=
 =?us-ascii?Q?sxsZ75n7OkT0VRaWb9ofmJzdjbczuq5A1zHv0ahMI/LDgs2esZoWEvvNUIm3?=
 =?us-ascii?Q?TXGKqw1O3f2IyLT3JPaCkANzAHhH+hT8+l6g+xoryn0hqf2Xn5NHVNAy9ezM?=
 =?us-ascii?Q?YF8fk8/N9wLQWLX1FjQnmwCwFbtz/jw9HHzYTyEYkJkhPN8yUpPTJVI3THG7?=
 =?us-ascii?Q?75acT3Xcoo3mZAt8+NEpdc9CVI3cW54XgZ7xS3bg6oRFqSJ3qzv1cUOL3X5N?=
 =?us-ascii?Q?okOiBVPxG6jyVQVcjaWioPm0RqM0nujTQHu5ujvfGKusC7hKTH0ir9M7gdwU?=
 =?us-ascii?Q?ksHynsg6NzFwPDLQYlYmU8K0DccOzrXneTnaQouaQXz4IUZ7O3RMyRqQ2fVl?=
 =?us-ascii?Q?GOU5/ZjxbVoUvXxnDnPMECiOfig0Ivclv4XV3JwmPPazvPlRBotX3aICTlp+?=
 =?us-ascii?Q?TruKZYskHG6mt4ciXbrW4NznSz0U0Lj67rPDca8HfkSfsI0Pde1LGD6/c/PD?=
 =?us-ascii?Q?MQYrIkLMjkHVGieFBASDJt//iREoQLVUvWirEtWnxYLNXsz3jhg25BO560SV?=
 =?us-ascii?Q?J0cSD4O/3bB60dn+Rjyt2Fu1ISxPeniJYQa3RlbyJ2kEZMAk90rRY69mcVgN?=
 =?us-ascii?Q?Jy3bsug/jdMLokh4yAIfLqBDtoTuB2B7RjjfgkuHwb/0U0krvLGTJNKwlpPI?=
 =?us-ascii?Q?/BeGR0s6xhdumezfsWngiOeqEh2AMa8gmBM/mRcrTuu4qx48sl6E1Cdcwqbz?=
 =?us-ascii?Q?IubeNrqh8g5dTLFY2oGyptB8zPgJgkW88p9vp0S2JQJO1Pz7XoxFYKe4p8CZ?=
 =?us-ascii?Q?JP+0hJJL7v6doMAeA5A5x7uETLhvx7HRsYMopto/OKbF6w6+7I7f1JdiilA7?=
 =?us-ascii?Q?+waUpdxKGD3Es+oPLT3bN1WCIyFLSAgXDRjCEaagEyFrniMotuW72r3VpLkV?=
 =?us-ascii?Q?YD5ifqFQMcP3SFbAdTK1S08QIcIIDgqJ9imscxhABch+yfnt68+cEgNCAZZa?=
 =?us-ascii?Q?WjJgFvZq619hPIIJvCzjkcGP7s9nGT6PWnFC1Ej5B8xbaafkQY1F8qFw0MR/?=
 =?us-ascii?Q?CwsQVOCcwcL70QZCGI9ANQ/v3fmwyRlsehDN05JG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9709024-bb3f-4b2e-905c-08db7d3d102c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 09:49:02.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hfxe4srsUx9QW8p7qo/YI5tXRKpEpPg2fsCijirA8yxbo67OXBVV30Ky7KqlmsKI2zr42wPUkvKUhTXWFmW+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9087
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A negative number from ret means the host controller had failed to send
usb message and 0 means succeed. Therefore, the if logic is wrong here
and this patch will fix it.

Fixes: f2b42379c576 ("usb: misc: ehset: Rework test mode entry")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/misc/ehset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
index 986d6589f053..36b6e9fa7ffb 100644
--- a/drivers/usb/misc/ehset.c
+++ b/drivers/usb/misc/ehset.c
@@ -77,7 +77,7 @@ static int ehset_probe(struct usb_interface *intf,
 	switch (test_pid) {
 	case TEST_SE0_NAK_PID:
 		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
-		if (!ret)
+		if (ret < 0)
 			break;
 		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
 					   USB_RT_PORT, USB_PORT_FEAT_TEST,
@@ -86,7 +86,7 @@ static int ehset_probe(struct usb_interface *intf,
 		break;
 	case TEST_J_PID:
 		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
-		if (!ret)
+		if (ret < 0)
 			break;
 		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
 					   USB_RT_PORT, USB_PORT_FEAT_TEST,
@@ -95,7 +95,7 @@ static int ehset_probe(struct usb_interface *intf,
 		break;
 	case TEST_K_PID:
 		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
-		if (!ret)
+		if (ret < 0)
 			break;
 		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
 					   USB_RT_PORT, USB_PORT_FEAT_TEST,
@@ -104,7 +104,7 @@ static int ehset_probe(struct usb_interface *intf,
 		break;
 	case TEST_PACKET_PID:
 		ret = ehset_prepare_port_for_testing(hub_udev, portnum);
-		if (!ret)
+		if (ret < 0)
 			break;
 		ret = usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEATURE,
 					   USB_RT_PORT, USB_PORT_FEAT_TEST,
-- 
2.34.1

