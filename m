Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B490D5FD571
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 09:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiJMHNE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 03:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiJMHM7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 03:12:59 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915591162DC
        for <linux-usb@vger.kernel.org>; Thu, 13 Oct 2022 00:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI1nWKEF9OlStN2Dl5n21N1sYzUF+6LByz4hiEzrLju6hXNuAQwnR8tq2HkuAv2V1XVmufu1oM/wIyZeUx/UAUOAmR7Glqu7+a96jvUhqQfgGaSkP9h7HtCPb/0XUbH+z9qMXXBu07T1JqEhPCYNvh7JZAvtJlmmmJgLzxuiuBiaQWmoUJb5N9VVosmkZo9f+g8PEYcNrQpN0jGPM2j9UKD91HxWpuVYtk/aKnAkCXGFv+3aoDmb5EfeMJ0GG7I0X6SEl37sfW+Lez7EN25jHeEMVZXTAIbuMJEZX7nTRsCxTvVu851mjpgdgnfqlTzaHuEgpHqVg/ldzfJFSm7Tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7dqoBkoOg9b+6lS+qA2/PRHdtJ6lL98lbG6iVeNysQ=;
 b=E7rLujoehVvURmejuZkMJQFZfB4YL9ZOMWGVMWKeDhZQQcHpcxcIcDc3tbkXx1cy5ZeV1bs3BBGrVhjnlfbY/qJtRvSPFw0FIYbrlZovTws/yGxgCVM8qeXCL3XKbLVzeKK4AXNyfoqZF0bW8mqvVpsZuI56lsZNR7g8y2NGEN+3A/o00OPACMnAV1UhQoEA2yzSQ5uymXtFUtsTKwmdWaOvMPilVnOszj47sMde47xU0EC/tPR8PJQHQwuipzanml/3TdNz+lfx6T6oT1u5o/R0IXP4L6D7vLpf56pZ/+Kk2CZdK1WA42GXuz64AyehAuH7mNx3ijH0qJaXu+bUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7dqoBkoOg9b+6lS+qA2/PRHdtJ6lL98lbG6iVeNysQ=;
 b=cHPDtTZAGRA32xumHj5AcX7iUoo3d5u1pumIeh0Gj2Kr1PAM2jkT2BPeTfIKZaGcGFsIAJ5CCk/ESmpKnVL1rlt0RiiZnyVQ7YCjMUkQAALEG+3/s3MUBOOABxQ3SIwsk3nuQB6wOIjQEsxd8rH/cA6i1/ZrRhEdhu++gmYx30I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 07:12:53 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::855c:7884:639:f875%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 07:12:53 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2 6/8] usb: chipidea: usbmisc: add power lost check for imx6sx
Date:   Thu, 13 Oct 2022 23:14:40 +0800
Message-Id: <20221013151442.3262951-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151442.3262951-1-xu.yang_2@nxp.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To AM9PR04MB8777.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 5435dec7-0cb3-4eaa-b151-08daacea584d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dq5stG2dK54P7Lv+qjdPFYdJubg+azsR2MlYmbzlAsRyUTcmVX52oaohpabtCLLfYHnVWhCXkMns60TZqKFE3fkamLtBKH1wYw2tZ+t4Gd3wmR5xHWhlZsaYQDchBzD9K5i1MACjlOR28irNDsmTQnEfe5x7wFDvGzwNh5hg74UzTjEYYVRPDNswlMCVaIMnt3whtaIyDWmhEHQGRYJowLpBd67MZp4WOYTWnut4amg/swECatbALV9NkbUzOV9TfQE3l+OadvDTqA714ce7SsMRzSVjXSpd/nHcZrSAR+Y5SLwDYdvBHkbExFaH5Ilg2Caz8Slsph1WRch8i2Jkfmk5FC9BINw+MEg6z3iuixqhmcNv7VC3wiHgt3hU0u43pU6zgoJx/x7A/5zmnjwKf9jbNdI07EKaIeA4UWY2cFevaZ1Db9Vrc30oASLViSe1w9UMbo7nJ2P4j2wif3vALl1lZXDpLE9FAscEYNF6x/21TtR0d/L9V2UbKZSiK6Sw60A2+q7aSIUpKXNS6D5g2+cvkWpQ6K0Jfcnp9Y7drWTx8PPsvSDmuLPEoZnGEXpOHffZ7z+7j1a5T9Z+h27eH2ikTk2naFO9zKC0hhmc4kk2j9I4rg97pu7LSyIhHvHWeO+9JTeqjZXB2gnu1zCVt4xCJpHarGBZFf93t0h0qWQiVCSUTeO/5XZR2wDkXPGMHUelIdpubFqA/n4+ZocMwsxMf0/IxS6X7zl/fuW1dq3ZsKw4VQ16hRiOYXTBgHsOq/588g8+vI1cW1hokshfMkmZOQJQALWFN3Sdu4iI5uI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(6636002)(316002)(38350700002)(66946007)(8936002)(38100700002)(2906002)(41300700001)(4326008)(66476007)(66556008)(8676002)(5660300002)(6512007)(186003)(6506007)(52116002)(6666004)(26005)(1076003)(2616005)(83380400001)(478600001)(6486002)(86362001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lcz8s8xqAm+sXuDE2KfW0yJ6f69q+wighAkbWzH6UKcGS5fxaF5e4neHcOZF?=
 =?us-ascii?Q?SmH8qHYRVO6NTr45aYTqHqv8U1kxSjmEPKJifBsECWTpxRm0i4ATTy9UnV5z?=
 =?us-ascii?Q?FVj47pnJckFUENY60D5t3F6bOkBgEuWUZ9IBcG3ksrvV60ep6VQ+nO2zKAH+?=
 =?us-ascii?Q?Y4unWaR5KSJIqcv871dy12a72OVUWgndN7VQ+wYiV3MSrQ8K9O6TqLSA5aIU?=
 =?us-ascii?Q?5sIZ9ch0k0nxZoiAMzNPwy0qs9kZUC0Wgsg+6uj4oUNwpWyt/3HD5XHcXHP4?=
 =?us-ascii?Q?wMejsk4jSwsxSLLAQDAcxy9IRKB84IvHy9vJ1BVDgZox/v6D8cetNEgYbwfU?=
 =?us-ascii?Q?7vFxUQhJYLCiupB5tq7CPI4kLE+oFGXQcgnPuMpp0FmHdo0x5EZHVGbZjHlF?=
 =?us-ascii?Q?L9w4L1Jj0ZGut+OzA6/kvlqGv0w/ZnkYpDSk1KAAfzaw3cIOfwSuHGD4S/+T?=
 =?us-ascii?Q?NyUIKTVZNRWhXpJkg5XjKN/n4xXHuvRWVKIAi5CqY/dyD2X/Pu19Hsmd4Dqe?=
 =?us-ascii?Q?YIEZBcoCYqeKkSH2+3WpANE6BWdc0vHtT64BdzIDvXfuM9UBCdUEh/FE3r2K?=
 =?us-ascii?Q?waE9ldLdeamnPrkgDIKbMhGLuBka1ZsJbP7TkEvmgubz3RLBGZriFPmyPEi6?=
 =?us-ascii?Q?9zNNSHuibf9U13cMErL1hc7QpywFPSJ2tyjBL7UwgErrOWjMUglG4TWxZg4B?=
 =?us-ascii?Q?KJd8nCq+NQeBXu5sKrMYCL/dOvraTkaWyfNc/ZakVWem6BA/++eq3JtteraI?=
 =?us-ascii?Q?y3PkHc3xBsU9+q1HEolrbG1/M8a4qhnRAIFzGLc5ZVHiQhVB0WZg3NHkciev?=
 =?us-ascii?Q?bYQyPeZIIKZj1+raOWly94js4aLx69YMG08YNaOiGR+aFP1Mmw1t6C1UrS5Z?=
 =?us-ascii?Q?wWqXRz95lgEKiXp7pEUUIW64D0k/58hzCnM6VUcXbx+5IxYyyer1DvEFOWA1?=
 =?us-ascii?Q?KHM6YgArhspoj7TyDWcb6JdKbTNTCiZ+vtSbjP8qMCFSeAhXhLH6rsiwxFHa?=
 =?us-ascii?Q?i9w3g8RnI2fTbOf6+sHGGLABDA5IK9h8Cw1R0cWC0TgCvVL91fRIV9coms+c?=
 =?us-ascii?Q?hsPtB7tnKH8Hje03bXqHuqGtEz7OupoWGGMFYYDnwUJNxXfHuhtheBt/YT5c?=
 =?us-ascii?Q?jUJ0t4eUsYgLIUIzJUmVqzzgiyZU4UOPhfN9QjOSwxkUH8zd5GsmVgiLzaSR?=
 =?us-ascii?Q?gzuA7MRkisfZ9BnyF3bN5R7JNZS6MrdjuGxe3ophodiqI+WuN3Z9OVm/0XsO?=
 =?us-ascii?Q?YDIxHoCJYpmEaQK9ItXYQVnN8UYhH4BnZcIc/nwrgklj9fVd2oSMsm8tj5yP?=
 =?us-ascii?Q?HU8zo7v4Kv9v3B5l8wTdEE0qWxcubI7OCDNb5PHMazlf+hVXn1jce8dmWmnJ?=
 =?us-ascii?Q?gj9l6ZJ4NIyOlEgQQILkeSGi7usHu9QnE6zJz3Xlxtip/UIm/b1tIks1nwlo?=
 =?us-ascii?Q?XL95KSwuJchlu2UI8fWzym0m92cxy5xSab6q4Ft+6WedG8sSYU26ZHoVedpe?=
 =?us-ascii?Q?JVVzmmSRcRvTUeJoktnb+KAxuGpJPdec++tUl4oU/8lWLO6wBD62ajawm1U8?=
 =?us-ascii?Q?6zDmum9BUahmXZeNRr0pxBhyn5vXNucXQ6C0yToO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5435dec7-0cb3-4eaa-b151-08daacea584d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8777.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 07:12:53.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsJS2Ymoz2WbDkXT4OnymiX77ruP2+88txXQVGNaGyY2pv46i3l53XJCGvyxCltuvwQbB4UOqF6XgQp59fpaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

imx6sx mega off can shutdown domain power supply if none of peripheral
in this domain is registered as wakeup source, this patch add related
codes to check if power is lost.

Signed-off-by: Li Jun <jun.li@nxp.com>

---
Changes since v1:
- No changes.
---
 drivers/usb/chipidea/usbmisc_imx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index aa815f6d3fe9..7bfbfc83cfe3 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -939,6 +939,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + data->index * 4);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	/*
+	 * Here use a power on reset value to judge
+	 * if the controller experienced a power lost
+	 */
+	if (val == 0x30001000)
+		return 1;
+	else
+		return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -972,6 +991,7 @@ static const struct usbmisc_ops imx6sx_usbmisc_ops = {
 	.init = usbmisc_imx6sx_init,
 	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
 	.hsic_set_clk = usbmisc_imx6_hsic_set_clk,
+	.power_lost_check = usbmisc_imx6sx_power_lost_check,
 };
 
 static const struct usbmisc_ops imx7d_usbmisc_ops = {
-- 
2.34.1

