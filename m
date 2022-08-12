Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C022590FDD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Aug 2022 13:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbiHLLBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Aug 2022 07:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbiHLLBc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Aug 2022 07:01:32 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F94B61D88
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 04:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgsA+6B1KtAiZBJe7VI8oPX+6R9wfSiBbm1bFpR/FrTWJoTL/akUW5W2iGcLouJSXWHuSiCoM6I6qUAyy9x2JqwAtS642Lk6M0p9jBXE0fyYD97O/NO7gUbpwAlyO2Q/JlofBEmAyNa0BaZQtG+WvmcjnPaCCz0caR8cxvFO7sdgRPjoC/qNIbpdJM0N3rmc3CJFKMF45FoPBjvh7Cliwv+JgP8DBKIZyx4q+Dlo7FGKpwPSpx2F8G8NeJ1PZlfPbMOy9Mvtl5DbpfxfUmcGCnzsGIVm07qrgcU0Fqrei1KetLHmLQnGxTtVpinIY7nTenDtHBThbNQA6Me1Bh5Olw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/ci0Wq8n5PfMwg17RYdHaf9+2WwPIlXP0gE4n1Kqlw=;
 b=Rdw/UvwrUfR0U97UJu/dx7IEE5MzMLsLKOcGLq948YhiDkqT/tlzUiSXBkHQ/AoGqhxF2sJHfasZQugbpPEB/GU0AvRmN2xCAHmv1d0LlEwtVDm3bY0GvjWvyIM5kbLLL4XzWUcz5ddQlEIjBZ7OE0cW2aXJ2eXOKG9ic4R9/ZgniGbTchEfCBGvkBnP+c5hglIX1+aHVnXNbo0f7T5+pzBhmXItF1tAEprNteawTKeFC+dPTHQUCcvpY6R/1VtcHW7l2Tl9Kd7xxPMmacatqgoERoLL0jEyGgkSYVAE7CHt2+Cknv4v/9MCJQFZ/WVHAY+y0wvQTQTQ1UlLjYP/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ci0Wq8n5PfMwg17RYdHaf9+2WwPIlXP0gE4n1Kqlw=;
 b=bOr/aArY8eYUhXkYkvOloAE3pK696wHak5LFHH+Qz/+NWEKjBeD7ThMOIXpVLjbYP8R3orxVBTEeCsXgWSknzAtZuatMwTZYp/EMXAYWG8NIcYMPbV+bAOfRyIGLAbX9Z61ShPviAi6sbDz6pdlYYjpKZR1c5ytVpswKVGqjwBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AM5PR0401MB2593.eurprd04.prod.outlook.com (2603:10a6:203:37::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 11:01:27 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 11:01:27 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH] usb: chipidea: core: complement wakeup support for usb role switch
Date:   Fri, 12 Aug 2022 18:57:19 +0800
Message-Id: <20220812105719.143556-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0107.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::48) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2200f0-611c-4078-9e80-08da7c5200c0
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2593:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YdJk+9J2LPsIGAHk3c3DCK7UghZQVRyoVrrymUhDBgL9YlAj7aAsyVTVZ4/YvYwHiw/0VXWaoyTJfNZTDw3EZXJ21IySztj1bfKLRr4O8w1AFgedA/XrqyIDrAeWJlO6e3J4Z3rdJEnhPy534sIAlyhTUHRJDWx0A0f1yocI+Z0lMaqeXU/YXQ6G9SmqdX/ohBsKBr1/kFXAMqyArU7Y9e7yGFJMCKJhkBqLFEThzFTYub975sk2GhakQeguzlRV7nkjEQa/2z78I/lbi2PhJiYZo9gf/4u/ZcczoG4KN4YL0dzyIvAHyF1D+PwsqVz1h4izOVkG4O+Hr3HeLikbBid+tTGcRpXL5hrqQaNoe9R0XqgU/n/bIDHTel4iIca0uhW7UwsOBsiayf40J6srkJjgROyKDizkyjwway7yXcwqz9YQZzjoHLXllgAS7y/BgqOLJUcKKmhAnTmjqIGHpMOsPCvYjFNn9ckUEFnZTdZ72BwjlRT1yeGBfpybBzi5oDuZZTn5BBpbawFJiO/8K7F0XFliEefSCwOzKR6tfClvFFPYlJNBQexiPPGyETq3Z8xpCOYZnplkOgeHTjiLuOrOshnQwgpi4d912v58c3bHyVGoL/4esLFgcqFsV1uC+W1RmPsgwDB7AyDRycHPebLA6wL28gISoRW1nYSCIH7zH8TEJlRQfEgi0cxRLtuYKR2LG2ZJSOhyoLqpqvZXN4KUPH5V1genYKIdhJANKnZ8JKtf4vpCF5iQMfgzAViiCGhpD5IziqSzQM+gVFyof+rNLMWgOItJiriFuv16QMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(2906002)(36756003)(83380400001)(5660300002)(8936002)(38100700002)(38350700002)(66946007)(8676002)(4326008)(478600001)(66556008)(66476007)(186003)(316002)(2616005)(6916009)(41300700001)(1076003)(6512007)(26005)(86362001)(6486002)(6666004)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GnmQY2WKhi0Fia3bEP7xAJXiAwKUdtV1NwnmWT/oLZAJVRgF8N06hmI10m5m?=
 =?us-ascii?Q?bjv4/l9dzKloNPTHmcqtntA5PYKPAMaAui3J6sqxA0dwN7hbiEtfZNtYYjOZ?=
 =?us-ascii?Q?XNOuG6VGGPHjs8DQdcqNGV8lt0j+zEiAUXU5e7z9C9RG7kCnNAsWmEP09N7d?=
 =?us-ascii?Q?jBpE4/NHatObTKspASB36Z6QIvVimpS1urvQj1TalZkAx0K3Bhd3JoUpsWkX?=
 =?us-ascii?Q?EFnFQ+IAh/UTrd9bawlKrhX8zVrq3HhLg4WXRoq4w7pBbB1s1phyH3PgCGwh?=
 =?us-ascii?Q?a2XqKtBwItXdJa7MdKgFDAA3el5w6JUbRIrGD9lUPpCiIY2eICmIaSLhupz5?=
 =?us-ascii?Q?YA9feCusn64tWKRPEwXVETYjWibUEo3FIZ0NCFlVdS0hS6m+QjlL4Hz31fji?=
 =?us-ascii?Q?3mxO1Jni6nLxO5/PsfO7o1w3HujJJO+b8EY/VQnVR3NUTYH4SoFY0h2Kvg1b?=
 =?us-ascii?Q?NnGiy+PsZz7I9lMukDmobfq9qcwiFH68AvViTATSkzhSQdDUvXrO0vfkENFh?=
 =?us-ascii?Q?MpPpysTo1hTXO1MsgQshIUIL/X7pOJ60P9Eecuba5bi90ZWf7zxbcVtRPpDT?=
 =?us-ascii?Q?6qlctQuGDc76uiZs6dEH1sVb9mEUWdKAorzqJmKa2dA/qaQsoDN66dGmTD6D?=
 =?us-ascii?Q?ffxXpAtwt5/T7nmTtjG7PIOWlIM9f7WoDD26ogtkHL3cQdaY0129NZQIhqmB?=
 =?us-ascii?Q?23+PksnxirUnoLEklMyw0Je9z2/ayoJUavlNKdJ5HVcXI/dwtnt2wlLXIyZT?=
 =?us-ascii?Q?wJNRNuuhHXbs8WQwFGdKEjOo34fIIB4MVNS+QxOtCiAVqdFu02LzpzsM54RA?=
 =?us-ascii?Q?i4mwVwa92jYu+ablG7Pmt1Wp+oFF57Qn8bzK1ZzpyoPRUY0p7DkvxALB3qAQ?=
 =?us-ascii?Q?TzerEAiqKhNsVgzRsXZzAc/5dBv9RvUQULpWgN+id5f1fFbqPEhWZ9lTQUJ2?=
 =?us-ascii?Q?SOdIhqjkwzq0BNFt7ehb4JBJhUSQJigHej1IqzaXZNgD6rCVCwWiD2SSGiL+?=
 =?us-ascii?Q?7mjpn4b56DrKy88L+iQOe+gqEHXmLqQW6mH5C6QeZzFYVw0LQwziyhhZKAPr?=
 =?us-ascii?Q?XFZCmMj7I/pnqoBgsAtPM2rXA4A9Lp/xcCKniKazYWY6e4buibPiQiRznOd9?=
 =?us-ascii?Q?S7S1sFiCvAQ6W9YDaQKfcrDGYtauK8xj/W4SaO4t5O1Cm6kouUpIMIA0lMHw?=
 =?us-ascii?Q?psjZEnS6mMhB6VlD1vvSYA1rSE1MONrB5aftHdnNwUSy2LsX3nD+2VmON/RQ?=
 =?us-ascii?Q?NGCRxa2QVDRzn6z686llRshepiyytmc/OmeOBLKFIi2c6T18OFklqr7xEhCu?=
 =?us-ascii?Q?Fn1a5ADaWFezj+U/+W60YuB9A2+hhdUZENCIA+Z2oX4Xae/f9nv+DuUAA2TA?=
 =?us-ascii?Q?BwTTgGFYRgdNlykTFU/KIatTcnACWWwJbB4IqvAs0cwVEDoh9pgMjWanRzJw?=
 =?us-ascii?Q?DwMA17+iGTTLQMc7ias4H53LpsNiBBqlKl5bnxxq+eQdzBXXj0c6h60/fNYe?=
 =?us-ascii?Q?58XiZprHOY10ZGX+Mv8skrbosw3YvMHEX/d6+rRqdBzSXE/nbRdLAXy0j+oo?=
 =?us-ascii?Q?kfhAmArHbdT/J/tiGUP0Gc6VmG85R7H8AhpsUWe4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2200f0-611c-4078-9e80-08da7c5200c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 11:01:27.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0crMGgh1qmRRK2TLhhTYc25AkQbLVB9UQLoPgWiN4WrOCNcfn3dYh1L6kj43OLYFbm65kmJ1AH0AE0XCqsu4gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2593
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current design, ci_usb_role_switch_set() will call pm_runtime_get_sync()
firstly, then handle role switch events. But pm_runtime_get_sync() may fail
to resume controller sometimes. This may happen when doing system suspend
and enabled typec wakeup source as below:
  1. starting system suspend, controller is suspended by runtime pm before.
  2. somehow controller get resumed by runtime pm.
  3. ci_suspend() is called. runtime_status = RPM_ACTIVE now.
  4. ci_usb_role_switch_set() is called due to role switch events.
  5. pm_runtime_get_sync() return 1.

This is because pm.runtime_status is still RPM_ACTIVE after ci_suspend().
Then the driver execute wakeup operations in ci_irq(). So there is a need
to call ci_irq() again like extcon do.

Fixes: 876d4e1e8298 ("usb: chipidea: core: add wakeup support for extcon")
Cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 6330fa911792..886b68e45826 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1305,12 +1305,14 @@ static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
 	cable_id = &ci->platdata->id_extcon;
 	cable_vbus = &ci->platdata->vbus_extcon;
 
-	if (!IS_ERR(cable_id->edev) && ci->is_otg &&
-		(otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS))
+	if ((!IS_ERR(cable_id->edev) || !IS_ERR(ci->role_switch))
+		&& ci->is_otg && (otgsc & OTGSC_IDIE)
+		&& (otgsc & OTGSC_IDIS))
 		ci_irq(ci);
 
-	if (!IS_ERR(cable_vbus->edev) && ci->is_otg &&
-		(otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS))
+	if ((!IS_ERR(cable_vbus->edev) || !IS_ERR(ci->role_switch))
+		&& ci->is_otg && (otgsc & OTGSC_BSVIE)
+		&& (otgsc & OTGSC_BSVIS))
 		ci_irq(ci);
 }
 
-- 
2.25.1

