Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E492706292
	for <lists+linux-usb@lfdr.de>; Wed, 17 May 2023 10:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjEQIQU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 May 2023 04:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjEQIQS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 May 2023 04:16:18 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2068.outbound.protection.outlook.com [40.107.241.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B177310C3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 01:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MY5lxdMvVAoJWF3pfKTiBtWUWYb2pVH37XstTCxKE3bf171SMag80B5hHbnpTEkxvbQMLIodfnaod6z/Pm04lKtNnSxgZOz/YgmnvMLRmih764LXdYw+nqYD0CR8Che8/uLLmrekhdt9YNIgrahbigN7ELqvZU7/DUTDHi//32MQz7/B8Hq76fvEv6yyz0HJqwStJ/soMM0qQDHyksbW+PsA37lHx1OyOCen+wgzcHJ+Zc4hz1WWSEriJ/GzRQa+WkErtywKp2Wl08ieT6oanIKakj2vLVd3039p6X9PTJ8sPtZ+LXUrUkS/qLIoRjfxNfPcfbn93Wmc8GPWcEaYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEoKPlNF9NjziCk89E4G4ETSwybLFFLEQjuXRYLNHcE=;
 b=So9X7gVszkMK11jxf/dwOER6374nRhGtKgyt/RJsPddng7/C1aoTfNdteXeVxwB0r5zsqphiIPCKD6rAbI2zsXhXJEJKhFtSW6BJPuUOMCe62wwq9LZYO2ov08V3GnQPoX1eQxPrI6qTg++Y1lnlWX0ZoJBs99UhXCF16mUfVzKmSBGhYoBN3rLR/QDimaAC+yWD006dDoYQCJ/KrFq5l+bz+nmrFmpE69jqmyMNWE7NYYmLDljSJF4pYMY342yqjwSyoiGIkIC7sxvO/1+CEojx+cecbdfvjLrNIYLNd/EsO4isb2hApet8gsnZ8sZTAyAa3GsYSVt+VzJqhNwUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEoKPlNF9NjziCk89E4G4ETSwybLFFLEQjuXRYLNHcE=;
 b=qDlMTTDg1GEJ080838H3vabkOoyg2yrshzrlCFi1SbZkssH4ScI7M5tnyf2iACTPa8zVoT2xBhbms7h/Umy/WDGJwGk78IikdW3j8BXPHj0mJ6w0GnW7S40BDdkJhIcST+RMlndHhw6/C7q8HxtnMYCGnsSJC/1WorBz7aaVmKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB8446.eurprd04.prod.outlook.com (2603:10a6:10:2ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.25; Wed, 17 May 2023 08:16:14 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%6]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 08:16:14 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 2/3] usb: chipidea: imx: turn off vbus comparator when suspend
Date:   Wed, 17 May 2023 16:19:06 +0800
Message-Id: <20230517081907.3410465-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517081907.3410465-1-xu.yang_2@nxp.com>
References: <20230517081907.3410465-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DB9PR04MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 984b9c70-06aa-4965-3675-08db56aefaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boUpMxlTfFShGr2UNdyTfgy9wuFUBZbWdNkiRMy4aOjxlBWaB0DeaQ6pEkiQF9EGlzvXVCvexjxv6ecWhOU4Ku7kaKg9mB3Dolb76itTbuVBJtsIq7eKZJ2mRF8TshpURH40dduRL0sXqmIcoAihf0e5PKigneFRuhNS7nyRgdxPOxJpV4rRFmrWpPd68xeWlWdzP0ZMqxJm8MqOspezVoS6XYHE1h8vkKoK4SckKObUZFHIRf5jCnOPJFNGRQlTnTLT/bG/mMgQszAeO+ly691VvQrA0mheTI9quaILyjHTMx1LsSS9/QaPDTt4Fcv7esQUiLTI4qPfNgJlVnMly7HoBMzLqCk/lxIUnt2/Eputml7kXEYFyAvHBzIZp8JNVZr+C4ggtKeTC9NFB7aO1B7vDk5l+B8+ldpiLSrJbmT8v2k2jh1nFIPgWWWrrb23ru8FsiEKZYWVNJ4/27mDWgj2YenxvrC252ZpEjqLFsgaaZlUnjCL1aNyFFIldhOS256A8ZSAXPNpndmKkLoyJfZ0ieugxde73qIViR5TUzEi58BoCt1I+K8pAH/EdpsAPnAyuRU2t5aktJNvgc7dpEIXintXHoqg9LQt6se6kv+QKPyE1OhTaKLxr7J8yPss
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(6506007)(186003)(6512007)(1076003)(41300700001)(26005)(6486002)(52116002)(6666004)(2616005)(83380400001)(478600001)(66946007)(66556008)(4326008)(66476007)(6916009)(15650500001)(38350700002)(8676002)(86362001)(316002)(8936002)(36756003)(5660300002)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h94oash3nbWOtPlBWc0KDZ3HruE89y1e+zIJ5X373r5x3r7ga+Fa9LcCGe6F?=
 =?us-ascii?Q?FuD/smc65hazE86zDBqV0jhtBwrgyO42Q/M4/cUoUMnslhnEPu1r9HCDsmUG?=
 =?us-ascii?Q?+GAqUnbFtcoLVJvFVY3h7QJwMQfIX0nxJyMjzfj0gcFK7KraCVFgx/1sHkc1?=
 =?us-ascii?Q?m8SL1lNZrEHpVo7PjzdHPOQZ+QDVeUqb9DJ62wzLdtyFCoTu9j+hMTGBw215?=
 =?us-ascii?Q?MggerDGHiOLXrmzqZDe4tIHEvN51ulf3u9pqUKS0TEO3dpeSnl2swqxkEASt?=
 =?us-ascii?Q?5QxFj+NyrVpf4EoJQMKw0dsuGcxkvzdNdfqqJo9b5s/hDicn4DPsqiIZ6ICD?=
 =?us-ascii?Q?l5i78Zmt1je5og/J6VykAK9IGQrY7QxDs0QX8KhfQpI0Wnlj3OgLckjmi+Jb?=
 =?us-ascii?Q?A4b4fwlJx+zltsDIdJ9bpJKIRbDOgBe3sXt/jT11Gy/W2fBnUYqLferVJDEP?=
 =?us-ascii?Q?AVCnWfX3fY/sYyDMkrPZJFfHtgmGLbLcX1yZ0iTG7A5a7/kiPwH5nE6mXu3R?=
 =?us-ascii?Q?0DAVUrAx35DkKNLLURcp91e180Z5h8Gc3EamO7cgJB3dDn7Tl4lRCGdYZmRZ?=
 =?us-ascii?Q?KA9kH3j/3B+af53dzwxbAfoMRaU7SLV85bW8s2lYuP41i9G4mKdPdVwBY1/Y?=
 =?us-ascii?Q?jLgs9lbtPPwd855QMl3No1pDzJ4i+8qAHwDoRz8ITwIr3p1T/Mc3l2+ogupS?=
 =?us-ascii?Q?WGcutD5Lhda6YvCMYDDyaIYEdZg3KIBlS853OQy4xH59NC/nGRCsb9UxsMo7?=
 =?us-ascii?Q?Jc9EZjvpOoOR4hH5675ufzNY3TT9w88TK2RFhqF+cn9DJ5Tn6c4ic9JmDQIM?=
 =?us-ascii?Q?kfQewAe4vH42kPVfWWuQxU+PwIhnyPKz4YUjj8xXFZTpcLNuZLNROOJVUvUc?=
 =?us-ascii?Q?8luSCr29B9tAYQM23cABbsw8uSDSPW7rcj9qjS2ykRs8yAFI1k2r3epk67LC?=
 =?us-ascii?Q?e/nBKAa31e/eMdw8lme/P9V5m6JolyQ1bEAf3FYnks4zC5Dv6vwZZ84UVZLN?=
 =?us-ascii?Q?lRhQJH7tSF0I/1Tu6Foz+ueYz1jhNyWBn0fojvwSlIx3LAzBOYt6tHXyr12Q?=
 =?us-ascii?Q?2NZA0E5cC19yHf6HVrYVqY4/iKtDOeGyF7KD3Bum6SpOg4gLVKlVTi12nxab?=
 =?us-ascii?Q?1Xl+FhPHRs7dcaaaY4suZrwdZMroEG3LvT7GMS3Myw7hAMBAAKo0pzLqSJKr?=
 =?us-ascii?Q?5NU5eMFBG4IIAo5G9yleQPedvF0gvqCxLcI3d+uAy4o0TcU9TkMskT1pheMG?=
 =?us-ascii?Q?GiDktVhbA4Rk/nqVl0u09DSwMpGTfyr8JK4oCdPwmrAi4jWUFpFM/wvqxCUZ?=
 =?us-ascii?Q?dG8iJri4YcOTr37vNoAj7ECxT0wdGvsMsJuXE3reHfS3Xdx6StS+Yx0I/BCl?=
 =?us-ascii?Q?HtHNFilBnOILx5f0zGxrNjSZ28nPIu2LOsScPhplOwGoJlLrGinL9M32VTNp?=
 =?us-ascii?Q?/xfCwF1b52/L9/utTRVcf1iXGOgKaUecpGat0BZ8HtEHnRxdu2k5aJKUx9Hl?=
 =?us-ascii?Q?MYVJBlnv8rrAEnGNdY2V00v94l1Zjv5vrkdbaNTeZyBk1keDdiPT5ZEzzcY7?=
 =?us-ascii?Q?OazLs3EFUisv6cEb80OSViMNRICHHKexLjDL7AJP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984b9c70-06aa-4965-3675-08db56aefaf8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 08:16:13.9803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3DnGM7/9b1AdSRx1A0NGrQZjN5EvbimDnaz/GJT228DIpzK1nWYA4KOvv4VE899iRv3XiBMTZ2XGSQpq6ktoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8446
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As we use bvalid for vbus wakeup source, to save power when
suspend, turn off the vbus comparator for imx7d and imx8mm.

Below is this bit description from RM of iMX8MM
"VBUS Valid Comparator Enable:

This signal controls the USB OTG PHY VBUS Valid comparator which
indicates whether the voltage on the USB_OTG*_VBUS pin is below
the VBUS Valid threshold. The VBUS Valid threshold is nominally
4.75V on this USB PHY. The VBUS Valid threshold can be adjusted
using the USBNC_OTGn_PHY_CFG1[OTGTUNE0] bit field. Status of the
VBUS Valid comparator, when it is enabled, is reported on the
USBNC_OTGn_PHY_STATUS[VBUS_VLD] bit.
When OTGDISABLE0 (USBNC_USB_OTGx_PHY_CFG2[10])is set to 1'b0 and
DRVVBUS0 is set to 1'b1, the Bandgap circuitry and VBUS Valid
comparator are powered, even in Suspend or Sleep mode.
DRVVBUS0 should be reset to 1'b0 when the internal VBUS Valid comparator
is not required, to reduce quiescent current in Suspend or Sleep mode.
 - 0 The VBUS Valid comparator is disabled
  - 1 The VBUS Valid comparator is enabled"

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index be939e77719d..9566022a2183 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -151,6 +151,7 @@ struct usbmisc_ops {
 	int (*charger_detection)(struct imx_usbmisc_data *data);
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
+	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
 };
 
 struct imx_usbmisc {
@@ -874,6 +875,33 @@ static int imx7d_charger_detection(struct imx_usbmisc_data *data)
 	return ret;
 }
 
+static void usbmisc_imx7d_vbus_comparator_on(struct imx_usbmisc_data *data,
+					     bool on)
+{
+	unsigned long flags;
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	u32 val;
+
+	if (data->hsic)
+		return;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	/*
+	 * Disable VBUS valid comparator when in suspend mode,
+	 * when OTG is disabled and DRVVBUS0 is asserted case
+	 * the Bandgap circuitry and VBUS Valid comparator are
+	 * still powered, even in Suspend or Sleep mode.
+	 */
+	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	if (on)
+		val |= MX7D_USB_OTG_PHY_CFG2_DRVVBUS0;
+	else
+		val &= ~MX7D_USB_OTG_PHY_CFG2_DRVVBUS0;
+
+	writel(val, usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+}
+
 static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1017,6 +1045,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
 	.set_wakeup = usbmisc_imx7d_set_wakeup,
 	.charger_detection = imx7d_charger_detection,
 	.power_lost_check = usbmisc_imx7d_power_lost_check,
+	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
 static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
@@ -1131,6 +1160,9 @@ int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
 
 	usbmisc = dev_get_drvdata(data->dev);
 
+	if (usbmisc->ops->vbus_comparator_on)
+		usbmisc->ops->vbus_comparator_on(data, false);
+
 	if (wakeup && usbmisc->ops->set_wakeup)
 		ret = usbmisc->ops->set_wakeup(data, true);
 	if (ret) {
@@ -1184,6 +1216,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
 		goto hsic_set_clk_fail;
 	}
 
+	if (usbmisc->ops->vbus_comparator_on)
+		usbmisc->ops->vbus_comparator_on(data, true);
+
 	return 0;
 
 hsic_set_clk_fail:
-- 
2.34.1

