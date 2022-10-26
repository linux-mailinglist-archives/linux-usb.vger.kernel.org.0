Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E901060DA2C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 06:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiJZEJk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 00:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiJZEJi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 00:09:38 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E721034
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 21:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJim3G3ODB+l5RMz+tarxTB+k6MIanJxOdDj3/nkZaQJzVH/anQ+QEhSw/R6I7GMYlUH1Qujeitd5lT6VQQSzMabrK5swuG5vrxLz3TTN3PdSbuqNG4LVOiESe9WOHdpcEbgEAa38V1RgNJ13XS7gcQVFxTysEKcMUdhnXd3XE3QgVnCcdbzJrORiSiX6cQi30JR6aXUGBUEnuwPBTQV7Mw486H2jLA2rYJdA6+IsfjNVJTtlfinZBUVSn5N35Ah/HzgIqAerjyL+fFuxNG28DCpV6AnqWfr2ikJOBrEpE04vPyMGKIurCnX5kSpOa0+5x3kkn66tZBG9djlwCIcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlBps7XiWFjKz9STtA8M8z1t6wr7QxzauXAgjayN5WE=;
 b=LwWLeeG2gjD/qXINPh/On8effTeVEpcaL0/cdHazePB02g8EwlQKr2EIDMgmU+0uXYOYxlbv7ghZLM8NEaPPXkjPIzDpzpMgTyHIuzq6ml+IsB4//1q36CDLQhNHfnv8ZJMHhdU+SB2jswp29Snx0zo4mwYVA7/bwi+88zAuqvrZIGZnTwLkl/tQTCwZ+agn15bzuxjtKr/LC7BexsiC6s7R8sGY4remFu2Aus2gUJHWhOhHkl3E9Zv5TgcThpuCKAKWvgRaDMesFQnThCrcio9ThItLi3j87UT+GpXf01gg/67SRlc9peIMCKhZAh7Qfbd5DGUlcG1QcA1UUDyawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlBps7XiWFjKz9STtA8M8z1t6wr7QxzauXAgjayN5WE=;
 b=FquvYLmR8swAPHb0CaIj9e5aRxJLMp+z7LbKw68qdkpU4JwCpNLUNirWiAxAGdc7sc6vx+JmhHFniw5r7D3UGQGcfi1WDptpXl6+V6xTN37SgvFfh9g0O0c0EmAo0/1fc7cBTriCMdSK2Grzhu/sY+qtDV3Ie4ynTau5acgrf6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by AM7PR04MB7016.eurprd04.prod.outlook.com (2603:10a6:20b:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 04:09:34 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8206:7817:a8c0:f3c5]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8206:7817:a8c0:f3c5%7]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 04:09:34 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     gregkh@linuxfoundation.org
Cc:     peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH] usb: chipidea: core: wrap ci_handle_power_lost() with CONFIG_PM_SLEEP
Date:   Wed, 26 Oct 2022 20:11:57 +0800
Message-Id: <20221026121157.1491302-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:3:18::28) To PA4PR04MB9591.eurprd04.prod.outlook.com
 (2603:10a6:102:270::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9591:EE_|AM7PR04MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffb78d7-cb5a-4a03-2941-08dab707e40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FViOruCnhPPgDh2VWIw1mY91HPyxwEfaWg1TiX2acApVXEspsttgB2tiROB5L4kuN2Y9kdXEkQHsnLdT1G5P5xFdlLoZiWx7Qss/ue+sbOLAuEkWmWYQtlDEzKjEr03XS8YyUthOcyY7hBPsxHRoxR90UzAS/vNr6k06/6v0mxWdhDhw0GN0Musf+7DWqYAsMLI3SoAKqba3jnqWEucKRhnpzL0FQz5/mcElHSX79Uxa8/V1HkhJ8Ir1QV9ljPtThjDle2gU1blzk8jW6myCCEQjrKEQFHijOI9AnUn+KnCW2XYMpfkrSWTPhwfLjkskARsM/3nAljxdFyVv6RKypBDZPcmQAV1/IowCPpUtyFEQCCoE6UV/ejIaixSEAxaGZW6IhliaGUIITAU2x7m6B0eGG1V9ZBsbyMSg7Fli7cTfO5O1Ua5nOKu0kyw2VjIWPYhwz9+yP/rjgTBfmHDp/xw+5u6/mTji3ViohM3DrBATRFN2HVdqHS+mt+E/e32a1loIto0iZ7FS4+pxsjzWp2jXpg3EOMFcuUyd7svSKOS/qePdCMDhRLowCByzMFK/uc/vV/0ehawZ1C3fTV96aIdNuGwZZwfpLeCQZt7Yl7kYXC0cUBS733QvkAzCcN3nRtqDwyWYDP/bXGRdKU+Lat1jNdNDaHs2elMZl4HWJwfM2f7V8IxnEtZ+bOCV7HXmICyujrfTilTXuSUakAdCdQo3BxLAKkB4YSvSlj2B1nFTyykxtHMMlNOot+NKK4KoaUiYRg8gdLXUIULFPsvlKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199015)(36756003)(86362001)(38100700002)(38350700002)(66476007)(8676002)(66946007)(66556008)(6512007)(4326008)(6916009)(316002)(8936002)(41300700001)(2906002)(2616005)(5660300002)(1076003)(186003)(83380400001)(6666004)(478600001)(6486002)(52116002)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fgxg1tIati0EtJHhsxUMCKkd4DoLF2LBDG0d1w6K0s9JENMj9fzFnFH4KR9U?=
 =?us-ascii?Q?x4clvcRl2t3mcfyGuTLMB9m+p3Ihps/5uuUeE+LuSZ+hIlFbDI5Np5uOXj1h?=
 =?us-ascii?Q?TOoRwNQD4bwULm1W28rq4nJCCrYDKayG+pCzIhm3DxF719MUuPyVUzs0AlsI?=
 =?us-ascii?Q?+WuE6dVZarWWkjt28YYvrmPkoQr8GxUD+9WDzxqDwFZQJ+Asd2lj3/7GuQ4E?=
 =?us-ascii?Q?Rbq3S8WDQhdE2Y5eK4yelsjkAa2NXtSyBZICmg+5SNeXKMs1e4oocrCdbqzX?=
 =?us-ascii?Q?SMiytasZxJIlDIGBboOn4k3+5jvNN7T9iVdzorQLGgmJVcqZp7l66wOn3jsc?=
 =?us-ascii?Q?8XfnLXM/KG3xPrc+3kwkK/+ieWG2LwjXTVo3L6H+ICuLtjLSsoSStjFA50Oy?=
 =?us-ascii?Q?+E1SijvqtJIw/TxZaGflbLj85tUJHLD7tj1zzVJdgUiSfXleXa0s/ftK6XHa?=
 =?us-ascii?Q?1kDcCj/UzuV+h//Dv3/AmseckE3EaSwfOVk0cd/dlWE4cxfYPwxbT35yK+Fb?=
 =?us-ascii?Q?yBAsMwOxMrHZOjF3nKaH+mB5AWfJcQDZyH1A8pjlYKqIND0GsqN+Z60UH/eY?=
 =?us-ascii?Q?cVeHjQOL/JIrMFtciw/DfSqXChuLuFUCgJcHrqcsDjkIoSxrxS2sYfhg/TTI?=
 =?us-ascii?Q?XnrbGbbN/qBJ+bY7ss+lO35JD6aYC8aFFdbSqrUsnPK45kNU9QbQozswOSfb?=
 =?us-ascii?Q?XkgUhKqcRHCybX8YvgGQAIGKRCHj8LxUYp1fZg+9L2y/FPCjOAX4lyWb2xnu?=
 =?us-ascii?Q?nkF99giHEddIWU1Cx9aH4BtE3QMm9xr49SMDtWqi+aIph64rzGQA+Ykc5Xnn?=
 =?us-ascii?Q?7AEXbWZGzh5AEwYuAT3MBcMcZvQSLneU2RHcj3DOPHFlNd8lWXRHnOLtWDv5?=
 =?us-ascii?Q?TG45anEjI3sp1WVKgS7j1AZpIUgVhvhvp0apG7Ryx3uPDOabKAg2d7mCvvsf?=
 =?us-ascii?Q?oQwTa9vn0/xl1H4hKRV5utisq8TQooIp8l0UypFbjv8nslI5W7gS52khFlOM?=
 =?us-ascii?Q?M7eVFvdShoJbcvkeNqQ/S3ghczu79gT/SQmVwmyBzQmA72LRL0dn1nyRV4kt?=
 =?us-ascii?Q?p0lQvBATKVFmKXVeHbYPEIVd8XVIiW9ffaPDdbfsct7j7ej4houwJNEP1f3w?=
 =?us-ascii?Q?3+sGUukf47wUetCc25NKKRWaenba8PPh+6llG73Y3LUTmQUqQmmENRDzGS9I?=
 =?us-ascii?Q?4ezjy73yN82dt1Vl+00v0fy0n05GBx7u/dUo7c82Zn4xs4QQLsGtnheEmseq?=
 =?us-ascii?Q?dDRR9ORkKM6jlz7TugOMCXph0VdCO9iGDJp4E686U8gkqXeNYjNb2croopLK?=
 =?us-ascii?Q?9oNuiB97DkBKMeBM83WBmxzGrHhwQ6d61pBJbeVZjjzFTZ4A7f/FYM38pQeR?=
 =?us-ascii?Q?ODhMH4/wgJnnF47OtRUKQHKLBjYRE3GaQQZKaip5pw6mbc1UsCBcUTmgHD8v?=
 =?us-ascii?Q?JKrH79+KfWvDVCqGatCBXF1mYfF3aRf7CF6awb49fcv9iaBFoyyzZsZQRC6x?=
 =?us-ascii?Q?WnSkzbRDkSao+vns1I0h2L0yoOxp5ayRtB+xIBUuh3ZhbiKjikR6zBlRvgUn?=
 =?us-ascii?Q?Qu1JbM7/JE2AB/m8aPUSMr00OEIjCLOUtlE9RjSl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffb78d7-cb5a-4a03-2941-08dab707e40b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 04:09:34.6656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7aejf6YS4G2DftqnHMtboUuLY0HNCDmAb5rLOHW9O4zYYeGwWI6WTZPg+Z+KgGu1qjV7tNCaCv7dWVEe+ZP0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7016
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If CONFIG_PM_SLEEP is not set, the following error will be shown up
when build kernel:
    error: 'ci_handle_power_lost' defined but not used.

This will move ci_handle_power_lost() to an area wrapped by
CONFIG_PM_SLEEP.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Fixes: 74494b33211d ("usb: chipidea: core: add controller resume support when controller is powered off")
---
 drivers/usb/chipidea/core.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 2b170b434d01..484b1cd23431 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -661,25 +661,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
 	return role;
 }
 
-static void ci_handle_power_lost(struct ci_hdrc *ci)
-{
-	enum ci_role role;
-
-	disable_irq_nosync(ci->irq);
-	if (!ci_otg_is_fsm_mode(ci)) {
-		role = ci_get_role(ci);
-
-		if (ci->role != role) {
-			ci_handle_id_switch(ci);
-		} else if (role == CI_ROLE_GADGET) {
-			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
-				usb_gadget_vbus_connect(&ci->gadget);
-		}
-	}
-
-	enable_irq(ci->irq);
-}
-
 static struct usb_role_switch_desc ci_role_switch = {
 	.set = ci_usb_role_switch_set,
 	.get = ci_usb_role_switch_get,
@@ -1400,6 +1381,25 @@ static int ci_suspend(struct device *dev)
 	return 0;
 }
 
+static void ci_handle_power_lost(struct ci_hdrc *ci)
+{
+	enum ci_role role;
+
+	disable_irq_nosync(ci->irq);
+	if (!ci_otg_is_fsm_mode(ci)) {
+		role = ci_get_role(ci);
+
+		if (ci->role != role) {
+			ci_handle_id_switch(ci);
+		} else if (role == CI_ROLE_GADGET) {
+			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
+				usb_gadget_vbus_connect(&ci->gadget);
+		}
+	}
+
+	enable_irq(ci->irq);
+}
+
 static int ci_resume(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
-- 
2.34.1

