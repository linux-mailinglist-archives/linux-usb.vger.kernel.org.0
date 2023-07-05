Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52457748290
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jul 2023 12:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbjGEKyM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jul 2023 06:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjGEKyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jul 2023 06:54:10 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872D8CE
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 03:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9IFlgvOiqsfqanbbrr7hSbviDZeJTnVgdYatQwnUXJ1BMJUX94m1BKEh62qQYJZbUM2CsFxRezkt3vSEXyJnhRXBdj+MVt+9aTqJ/DAfw7ChYj+hj8REUcPUXeGXt+orP2H0Gdwie0dG58Usc6xH+CiLM4uIgqLMJ2pUfDT6ygcWRMjCqrm2b96GB9ouzQMgwpM1Lm6cRYIqysXKWnqhNhlIS4DXrrWBHeN3tjIHRu5HjBt0HKlTwcNaSFkHjcwtDGUIieZjkrdOkIVgV6s7fn7nOSdjxrfNcNnX1wQgN0galPxabl5kVlmYHjFBljIiupoBLWiAZ7s+ktt5sb4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qu0dOjpr1ZD6Zmq4WPldGfk7fgyle97H+Xh3MJ6BbWU=;
 b=W/dFQw73KmngYxfMQFpIm7EBJq6Ws79fGxbwuyFo2GjAVAgtDKRTfwp1EmM7LRm4xX46pQuAnzwdtBEG0GZWuy4+gMzYEuhD9LKvtcEBO0IvxsUCMSoihRYiJz3zslUeEp251oXJvTRASe8HsWqDyQiew+o4qWG8fpY1IRdyb3xTeZdnA4x6ZiCvLO211CNs8m+VJLgoe152PNaK7iwzzChdsEkCurs17kVUyNdcaZpitnfMYwrmqnZlB7ytxvfz7fXUWiDXV0NDCNgVNtRvthG1zdvafSK4DKJwGYw4SCzVAx3LjbNgRyQuyKOPcsivfyH34GkcROv+0r1yLHnL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu0dOjpr1ZD6Zmq4WPldGfk7fgyle97H+Xh3MJ6BbWU=;
 b=Uc+hQjeZLEgDXCbc5SQq0/c4tuhT6sMIjR2D+/ekFaGtkMp3Eui4PERCxrMNGOz2xaOTevTBKjXSzpmMo4xSUm1n9elJmw+pxU2UiGmXVDjwFpLbfFan/PxFWMoXfNGhYQN8pplXJY/DS+HiJHXJ80G32ujqa2v8R7Gd9JGf39k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DU2PR04MB9211.eurprd04.prod.outlook.com (2603:10a6:10:2fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:54:07 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::f9de:26c:9ca0:5ca]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::f9de:26c:9ca0:5ca%6]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 10:54:06 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, aisheng.dong@nxp.com
Subject: [PATCH] usb: host: xhci: fix coverity checker CONSTANT_EXPRESSION_RESULT warning
Date:   Wed,  5 Jul 2023 18:57:43 +0800
Message-Id: <20230705105743.553052-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|DU2PR04MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: c2584635-250e-4a8c-cf44-08db7d462772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+Dc8N86RtOHusxpP/YMvNCCV6Pwd8K0HUukFt2gb0KqfkuWXUejiLfQiIoHfYSsCqnAbIFjXzaxTwqmgSX1OYAa99+dB/jJ4ADQqgmcjuuVxkJLRPtHN/br5PxTQw9cxUnRbAcwFpMNYdAW9LvMmv6aM1hzbMF5YiwhthnsVSXHukg0tQHas9fIijMMqUziFfFVrnXwjJlIudCo8b6LiiKHD5RqmjIw1wziZNXD0yEl7GUn44ClQ49qM75bcflcCfwHEbVTLZi90MR67seakHGEIgcBc0nLgs47mYdtQrHOikdiaTMu/U24WUTEYNIxRmKUsD+2uIKIOVta9ZXBrrPW0QyjXP8NCwhHLMo2Gg0DCLV4qThF/oPyPx2j5DyRIlh0WJeaBpAMxWCWztnBglqrYxWeW+rxmbjDby7yY1qwzfzesMguj3Dboj8noK1q7lUxqkuI3cQrYQBYZ2aVGvFD28I5v0Bq2K/K67ZKq3wVDR6AR0d7lQYjVwzG1MoQ2PnRRYgFipmAsPcVNd7uYbVeBiP05dwAH42qA8+pXu9Fyf4kFiqYOgBgNnBuh2SUZvR4UfrjpQMew4iEtbYPICYtne5ivgB80XfVW7JWUQl+tIzpzPdxYcJcJl91YETs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(8936002)(5660300002)(2616005)(8676002)(86362001)(38100700002)(83380400001)(38350700002)(41300700001)(316002)(66556008)(66476007)(36756003)(4326008)(66946007)(52116002)(186003)(6512007)(26005)(478600001)(6666004)(1076003)(6486002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILWi70qBQcZz9LsouFkMz0NWpFAwSDdlA0HLBcOwfIUOU9OYPJZaG/CMPl/w?=
 =?us-ascii?Q?90agIGwMWfyRu2v1icb/bm3GTMOX7Don47mQYyi+uq5tS4PcEApAdeA+Rf1U?=
 =?us-ascii?Q?NPcrkLRXjr1Qq3ikv8NT0KAjSf5O6tzG2/JqWcOefi4+zLocmz9O1XpzZlSy?=
 =?us-ascii?Q?lW0FNDrO880ty+eKrggir6I0lAVsb6TcTqbOPvKp2w2IWpy9BGcauhR13w7w?=
 =?us-ascii?Q?kIUmR7SGkloDjvviye+KygwjuoQluUMaEyr+2+M5I0PnL92or+VNwNKsvc2R?=
 =?us-ascii?Q?wuaZ8uCHgVCXipjoYLzxJavBziGZ8/KVs4iz3cXCpLZ/I7VNdG/YIuTZUb7q?=
 =?us-ascii?Q?YTvyiGJ+oD7EnBhqCE4rM/ffVIstkPkND60O7TPT9j6k90td5/Xp8TITiDdJ?=
 =?us-ascii?Q?eMbPa2GFw9/QUBbibcqmnHLeGKD18tlpMYcVgB1ShpBVw1mRw0Y0CCvwqUs8?=
 =?us-ascii?Q?/2K1xxfM3gB5TYU9JzZfaT0xDEFgF2wO2POGZaOnjvGk3WHVPH17DmRBdwNS?=
 =?us-ascii?Q?d8cvviger70cVEtWqXJP0zM/WcBVOFj8elVtb1x713ENwv20ZRS1vxJTjaCW?=
 =?us-ascii?Q?zosoIbVP9WBo5aBJVSHhVvHPL2kZ1v8/hFOJeCj3fjmQe+jeNUSlyXx63P2Z?=
 =?us-ascii?Q?KwkO3ldFQzmpcyHPhG5sr6T2fLJdD6qhus/TaPcuITF8LxZ4oxM09wJ/tZbV?=
 =?us-ascii?Q?sBvSX3rc9qnM6CuRZy0WAh5HZCQMtEgRYlzA7c/qKRsf9HUSv3ca5MIpTmbC?=
 =?us-ascii?Q?TYZfUDESjI5TxUjj2z0aQ6WxsGGuq7GGM9XrkKwp76kMkcXnIaQ9IVRbYloD?=
 =?us-ascii?Q?xT3P95FE8P20qq2dXFt6Nn9NfCZefZILbr2DT/dWmIcYhsDuiXc+IE2HmR39?=
 =?us-ascii?Q?7NVMUtx3dobIx/2AKxiQJXbj97wVWMtiruE38i/sDVIiEgxsHdL3lBNyFX+W?=
 =?us-ascii?Q?+y89X7ICp3Pt1LOFjO0YqKRTy2PPF3uXhGsK+OVej7ZI9GonH+f/mYMEdKRh?=
 =?us-ascii?Q?DOapjAlid44iDBZu8KA7Hln2Y+MbXb5VwnxIuR8CSOYtWDLIahGj0v1whW5T?=
 =?us-ascii?Q?wwPO6Tf/8dagS4T2EulaDDHXnm9qUHocWCVROp7eLI7KPsniNshHVWrvZ8bd?=
 =?us-ascii?Q?ACDaj+CKhltZhT+vof6vco8bZo9BLcLQztxFCTXAQVLdPqKs14J+QfSOnrOh?=
 =?us-ascii?Q?nk55t7+9lA2ECW3VyAR5TY278JU6nN5p2NFI7HcHryYqvdFXSWqu/fmqn7TM?=
 =?us-ascii?Q?smhAlziflCJPOb4S4aaG6t21GO/qNaVqPOufjrAeu0Gu/f/riQZuq9JLeyrN?=
 =?us-ascii?Q?VXOUf5ruqZ/Tme7i2fEEVgIX8j3mLcq9LiKL9Yqh0s6t2o2Jj3vkbKjlT9Wo?=
 =?us-ascii?Q?Z1ESq0NZ6W2JRdoa28jTmj8To/h5g23ZNfZy28qzfMQozrIhMaa6j6JIX1CA?=
 =?us-ascii?Q?SAOL3ejfuA3J47lE2uRTzmXW6mdR2l3MKob+6lgLK9HjRxgTEffs/Y8smB3O?=
 =?us-ascii?Q?ZSa4TF+tdpPqv96kTxG2qmrrC52Jkr6Cv1bnFnMJ9thwF/PhE25GARe2OnT/?=
 =?us-ascii?Q?0y+9P4YsrndBfQoO4JBgf4CND6Hs12Ra+hmx5Hzt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2584635-250e-4a8c-cf44-08db7d462772
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:54:06.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaKaSMtzTAyp2Ggs5GWgjEwbhRfGFVWcmshHEF0pcPkv7Nwu6Qp6gye3Sl9fra86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9211
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CID 28889612: Operands don't affect result (CONSTANT_EXPRESSION_RESULT)
result_independent_of_operands: urb->transfer_dma >> 16 >> 16 is 0
regardless of the values of its operands. This occurs as an argument
to a function call.

So convert the dma address to be u64 when extract its upper 32 bits.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/host/xhci-ring.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 646ff125def5..847a1eadd17a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -747,7 +747,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 		trb_sct = SCT_FOR_TRB(SCT_PRI_TR);
 	ret = queue_command(xhci, cmd,
 		lower_32_bits(addr) | trb_sct | new_cycle,
-		upper_32_bits(addr),
+		upper_32_bits((u64) addr),
 		STREAM_ID_FOR_TRB(stream_id), SLOT_ID_FOR_TRB(slot_id) |
 		EP_ID_FOR_TRB(ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
 	if (ret < 0) {
@@ -4347,7 +4347,7 @@ int xhci_queue_address_device(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, enum xhci_setup_dev setup)
 {
 	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
-			upper_32_bits(in_ctx_ptr), 0,
+			upper_32_bits((u64) in_ctx_ptr), 0,
 			TRB_TYPE(TRB_ADDR_DEV) | SLOT_ID_FOR_TRB(slot_id)
 			| (setup == SETUP_CONTEXT_ONLY ? TRB_BSR : 0), false);
 }
@@ -4373,7 +4373,7 @@ int xhci_queue_configure_endpoint(struct xhci_hcd *xhci,
 		u32 slot_id, bool command_must_succeed)
 {
 	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
-			upper_32_bits(in_ctx_ptr), 0,
+			upper_32_bits((u64) in_ctx_ptr), 0,
 			TRB_TYPE(TRB_CONFIG_EP) | SLOT_ID_FOR_TRB(slot_id),
 			command_must_succeed);
 }
@@ -4383,7 +4383,7 @@ int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		dma_addr_t in_ctx_ptr, u32 slot_id, bool command_must_succeed)
 {
 	return queue_command(xhci, cmd, lower_32_bits(in_ctx_ptr),
-			upper_32_bits(in_ctx_ptr), 0,
+			upper_32_bits((u64) in_ctx_ptr), 0,
 			TRB_TYPE(TRB_EVAL_CONTEXT) | SLOT_ID_FOR_TRB(slot_id),
 			command_must_succeed);
 }
-- 
2.34.1

