Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1016873FAA4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 13:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbjF0LAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 07:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjF0LAe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 07:00:34 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACC21BE7
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 04:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY7E56gb31xjVnbPV1YA9U5APi6nF5woVQ+nM+OFZp9kLJyXm997ZkYAdTt9nqgNuazdi+DRu7Yk2tvB4R3JUY54uB/RdtneIZ66ujDY45vPxrGTQ/n+8p1i8aoqHH3EUuXjZ1VXT/QARO9r0H10qrt7jRcr6FN2s3HxKrLdeqXGDF8jCt7+hkHTRSstNFQgFjNSdwYFXB+OhwAZyFkryUpsFbG0PhqF9l5hvzF/7gflvYKLtd+Ia/n2RvYC8fD8gmUbg3dQH1eUcpdXweYtdtVf9iOU8eBxb06uAW1G1HNoDJX5YGeTLPZfz66Dret6Mlqx7tFsYpgbqE4Zx9zAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwtTg9lUeUL0GzdtrGKTRgC1V6L7j/8aRaZuAWgty88=;
 b=oKHifpML5TcbQrU925roBrNQpe9fYZaQBofI++D0UeGv7z5nZ8u2EqaNf2zGHOlb+arCuNnBmZ/7NgE5z4lOQAwrHo/5fBbPoWx8Zkdp1hceV+dC86/9vYQWbZS5od3ZQ4CcT2FwqJqeIvfCj+yDlFPgTv+3LsZ8VobTNUIl7Mb8xGTqE16dXZCGrtSxWZDjxjZYpa6Ffmu8eEcwRaqZDzd76Ep2G/j2szquDLlIQLY3s6toVXwjqeqelzbBOMR7sktEFoVRdTPw1iUlgQ3xdpJ+kj6WeHXwqj1HAmBlhJDevtfdfT4YyeY6lHvwmA8sKj4QM8FArZivLSLLS0t+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwtTg9lUeUL0GzdtrGKTRgC1V6L7j/8aRaZuAWgty88=;
 b=iarUTZdzjnZXcgxDANTTD8DbmfDsZDOwx2SVcTxgTMxlEU++WneKlE9xg0L8/H5WrWEFuFt0Rm/xrj9lEqdKxviBLHBAQUD0IEpq6kV8YxL74GCD4k6jQaB2N9Mqe2F/Sc/fCI3Fep4XyS+WxUS4c2pBGrEBcE7iCWdvfJ5rZTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM9PR04MB8114.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 11:00:31 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 11:00:31 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        balbi@ti.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
        xu.yang_2@nxp.com
Subject: [PATCH 3/3] usb: phy: mxs: disconnect line when USB charger is attached
Date:   Tue, 27 Jun 2023 19:03:53 +0800
Message-Id: <20230627110353.1879477-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627110353.1879477-1-xu.yang_2@nxp.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM9PR04MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a90d7b-240d-4c36-f6f6-08db76fdb928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgKGNnyUvJANVhUyQmdbvytJxt2jPHMCtKRN8gXniYxMHC7QpmVn5V9PxD1BWvD1KLJICqHtmh7CPPib5SDnEx6bhXHgRzc9Pmq7btW1Zv/zJti0ws5r0I7HJ17snnc5AfpIaYaJypzhYZMRGHxLwzuc4WrJ1aFCIhTJTj1hcarx25hTa4r5Tup43SmkAxjwzv31eLBo62x36bnLr5NLejno67t+tYAVBT8mhmseGoonImfKLgpHzKQJdinNC55yFHzghV2nRyfbBzL/6+kouV3Rf24/NVl7b0c0gakAwWXURJ/TYFZaeHjmUT2pdZJypX9Rir5iKphm+kE1XnCIg9Gv3hBuXQoFdY9IGrB0yF8WZmVrLszAg/LyVDzv9M6MkUsgNPnbMamxbMQH2u7kbSHOTHw8Va1iBa2vxxnJVd/HdSACpkwPBHyFXLTD/yLRG805m5TTMkgxkNY1n0t2b5/QVmJTmNHgX33PmQdXfj9GobzGpwloyDdTccVxRXqbywXZA/IBqRAAnLjvDKlNecWhiBx0o/wNEnug9RM9l/gKV2hJyEUnXLyAbX+OYBFTa+sepNaA8HyUm9imt0J+Wvlei+RNRr4/5wFnCR0NzuoSzB5iqbYtOLFeAu6HUhA9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(6506007)(36756003)(6486002)(478600001)(52116002)(2616005)(6666004)(83380400001)(2906002)(26005)(6512007)(186003)(1076003)(5660300002)(316002)(86362001)(66476007)(38100700002)(66946007)(38350700002)(41300700001)(8936002)(4326008)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E4sHUjXFe3LReTY8jiuuhRnz9yoXPMsCWHv/K1i69TScjfw0+KiuIYW226Ei?=
 =?us-ascii?Q?yZytMB+lGlqz8itmlWmyL6OstDKfJ6hufCGVrw+6op3M+azcMybXJdWU7TpM?=
 =?us-ascii?Q?zBBD2YdrLOeAWieVaTNPopwL9SoJhDcVoC+ay0wzFAxuPSdPyfnNAHv3iAba?=
 =?us-ascii?Q?buaTJhiGY9LNJni7EsxkSYvB4nzy8OdYKeC5OCgk1P2d65glXKV936M3pDMm?=
 =?us-ascii?Q?0yleFc91JThzeIHwAFPhfr+9MMExgwkewRD+AjmzMi4EjSOXmnJZokiJO3s4?=
 =?us-ascii?Q?NBAbXM1XZTxC9gf6PKhbQXV+HlzNePbUS4UO1VAC/kG57/aMYCJLQ81K5B49?=
 =?us-ascii?Q?bclPkGjnV5OL/cJmjvBwpGPx4BRjLOS0QeyiAZbVj5o6fVjKIiOi9Xu7q0NV?=
 =?us-ascii?Q?8yhtL5EINTA+923ic0Ik2fuxkrnXjOCGtiK0Rm1941BkzNmF1SbHIYlNMyN8?=
 =?us-ascii?Q?xjTTwxDM82434NGFAbFq/1EFi3eOTfclGMJ1+oWyM8OBydCtSJU/jqSU93Sz?=
 =?us-ascii?Q?la3hqbK+Jw+0Xv9bSu1IOtLk8F8mL7IbnCzHWtO3P0mRL1ZSc+IAab8gF8oc?=
 =?us-ascii?Q?ukRYcR0jINHjuZ6E58AODjrwpn2eU6mbQffc0Pg1oRckvnZhVV4gI18f7ELL?=
 =?us-ascii?Q?h7vEHdqfdGVXhpWNXDS6uZKmT996jEMXB6imPh3pnM2jfG6gJTX95zdxEXo4?=
 =?us-ascii?Q?lvaWSF395+iEYnjygYJgv1l6YFbu7wcBCc0G/POTd0XoRaf4Rb/dCfFztuNz?=
 =?us-ascii?Q?XmQ7p7weFQvc1uBt2LYAJ3IgiFKZV0kK/kHYp3RaQ5oRN7T6R0UlZiJp2vTj?=
 =?us-ascii?Q?hLBhjNffGSzHSyTqcNaFD4MpTqlEd0ZsVKG0Lt9cn31BepFj9xVbqFC42yiE?=
 =?us-ascii?Q?TVMmQ6ra7eQkmM9XbciVjVO1xRFLIcfKFe43mVaqHcNxQ+gj18m7TqMdtbN9?=
 =?us-ascii?Q?sEXFPqs6Eg1JnlcVddhFJuoPnzVLQZCzSUw5+x+GXP4KumCErAlT0jKsbZz2?=
 =?us-ascii?Q?Im8HjVfk0M+qomsG6+3jcJJAc4e45U74M1YOaR3soBugWmcgnkjukATFz/Hf?=
 =?us-ascii?Q?XAdxz2T3y4TtHchyjJDKXgPcDTRXe77/3JthAuGfBh0DEi8D00oCpwAdOJJY?=
 =?us-ascii?Q?Zq1zS22ouN+MwyZZcCB2TzNWl/JJHu9zhSjnVd/Q7sOMc1Sco4xY3PAW6aFv?=
 =?us-ascii?Q?ySqhnNQarfcW7KqkaepNPenumR+9xXaXs/p7MMWGMkoFZTyGzJbfvz0Cd6LN?=
 =?us-ascii?Q?yo8XfDvIz45BltIrQPZM3UzXtCTSen6HYL8NqyvwcvuUS+/Ulk7MPcG3xtW/?=
 =?us-ascii?Q?q8xVb+UkCAMDD76/Diy+a715FexjGYCYi10NhcSBB8yWBODLjIrL517U8SMx?=
 =?us-ascii?Q?dW4f/uuuBXm9uudWDT837na9Q2T5HFB1sW2Tg3ucEjjDuxLXoIripTq8IfFz?=
 =?us-ascii?Q?ICa5OnacMiGum6AtkYh9XMPFJT7UKueEvaMD5YBuHIcw8UcSxPVZPnFDI5E9?=
 =?us-ascii?Q?dPTCImavUAQ7RktXqXRGqunp6R9WaT/xggODaY/38ken7v2st3kRaYhYs2P1?=
 =?us-ascii?Q?/VF7Y060iAKYIjzw5OubFQE164QYyPyIN5Gb8HzW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a90d7b-240d-4c36-f6f6-08db76fdb928
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 11:00:31.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PRYGIYMIQdFiGSrAR011qiEYoNNzSwY6bL6eIIEQAaFmv3mbTO1IYocfRvBciGZgi9JCS2xlAkDMnp4Qn3TMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8114
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For mxs PHY, if there is a vbus but the bus is not enumerated, we need
to force the dp/dm as SE0 from the controller side. If not, there is
possible USB wakeup due to unstable dp/dm, since there is possible no
pull on dp/dm, such as there is a USB charger on the port.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index f484c79efa6c..619411aab86c 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -395,6 +395,7 @@ static bool mxs_phy_is_otg_host(struct mxs_phy *mxs_phy)
 static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
 {
 	bool vbus_is_on = false;
+	enum usb_phy_events last_event = mxs_phy->phy.last_event;
 
 	/* If the SoCs don't need to disconnect line without vbus, quit */
 	if (!(mxs_phy->data->flags & MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS))
@@ -406,7 +407,8 @@ static void mxs_phy_disconnect_line(struct mxs_phy *mxs_phy, bool on)
 
 	vbus_is_on = mxs_phy_get_vbus_status(mxs_phy);
 
-	if (on && !vbus_is_on && !mxs_phy_is_otg_host(mxs_phy))
+	if (on && ((!vbus_is_on && !mxs_phy_is_otg_host(mxs_phy))
+		|| (last_event == USB_EVENT_VBUS)))
 		__mxs_phy_disconnect_line(mxs_phy, true);
 	else
 		__mxs_phy_disconnect_line(mxs_phy, false);
-- 
2.34.1

