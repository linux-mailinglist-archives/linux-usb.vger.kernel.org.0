Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD312902A6
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 12:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406626AbgJPKRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 06:17:48 -0400
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69]:41057
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406182AbgJPKRs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Oct 2020 06:17:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yo28TTQMxqbKHbME3v/qCyctpvE7O30Bi76Iffzb5241NSWCefmP2E6XLhPmVz0hxdiIEVJscGHRe5fPr9y70zvPF+p0Y1L/6Fh0IjisPDVNgLtfNVQrNsc90nPMEPbxHSIWpMstUuMoRcDrvN+XGKqK350beu3QnVDQyJMyVNAMvWaRS8UExQ3gKg4xPTndLtxDDdzCCXLdLUGV7a0rSMMhMEmQnupZt2hpiF8pIFhNXU/0Pi4zCOvnu4+mLemCVHVvfFuBfrrLmEE58/vCjF4fqACzP/E6d4nEBVf8C99CMZ+wK+GAJ/h0Sof0HrJR77Zclj289yh4pZ9HTemRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCETu0MmhegaGIC5cmmkurT+73lcQtLVZQe6ABQDNv0=;
 b=BgxSSdgl8eY8HkgYza55b8EGQm0M8HFCc3id0w9eIyNXpwrtIYkH5Nb3AIzftPGL0Kohhc/7YR4fH1mkhKJeczJyE4pa0zvmT0tXzKHHfpXg+agkskL6duEqBuhdbQmq91KHvHaBETQydQ8/stnwHDtJfL0fMhiqVC7u7MihmVk6TVxgGM6Y+wt5GWdCrQUmOW6QVPIInkOWcVP54p1U9OxO/xBsD9aII9LfXSH1KLzm2teHzwu8MtFSKXfGy920rmoUWNHE+BIxL6NxDk9BoE6ED78AOrHshwDNkAgHbeqoTH7Oxxkrvo2On/GpXnjoAl++irx7tFrXkeaRyiHaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCETu0MmhegaGIC5cmmkurT+73lcQtLVZQe6ABQDNv0=;
 b=i1Un6F5DFPsFp37oowUmNkfDltQdMTv4ZN1B6MbfpkrxEtlCKZSAghJ9wwQdEz77bija3xtp1gJzcDysKoUrnIT7T5spjqYkJXgNM8mk4h0Pmwn1PDyPg2wpb4m9h/YiRPw61gmFgRju7W9F94mAcPc9/j8jvSXaGFDYGgRVdEs=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4002.eurprd04.prod.outlook.com (2603:10a6:208:5c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Fri, 16 Oct
 2020 10:17:42 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3455.032; Fri, 16 Oct 2020
 10:17:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/3] usb: cdns3: gadget: own the lock wrongly at the suspend routine
Date:   Fri, 16 Oct 2020 18:16:58 +0800
Message-Id: <20201016101659.29482-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016101659.29482-1-peter.chen@nxp.com>
References: <20201016101659.29482-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Fri, 16 Oct 2020 10:17:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3130987c-66d2-4c1e-95bc-08d871bcb784
X-MS-TrafficTypeDiagnostic: AM0PR04MB4002:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB40028A9B10E1D8D02CF441A98B030@AM0PR04MB4002.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scPt06k7YLeOFRY/sGYxubp/YketqF5q/9SAcXJYkp+sfb7I4iIE8v2k/hJ1rI/khz0bkkAn4hZPgclrbnn9oKfqZCGIG8v33vT8NOmvWKAwKGeavuyeKCR/fXEFe+oq/WTn9CsyuBmo9h7k7LgIBu4doiM+QggF0p8S4In8c0BsQqZLlwDqwQ55W3O8hzMug62pFnRIq/noGDBhBpQ3eHsiNEebRZ+TFsYDBsN1GNEUQ3MOOs0IvvT8N/Ou4HRGHzkh89DQChu5jdDBvVHqmxtwnyXXoEzJ1K40u6Mj57uEpMqxW55C77fwlofmSkBoL2LKHSXr3fuSvetK7r9+kxWqMzd/+ZYeE8BrBH7pr99359F4gkmLNY3j2M1s3U2H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(1076003)(316002)(5660300002)(44832011)(34490700002)(186003)(6486002)(26005)(478600001)(52116002)(36756003)(4326008)(2906002)(6512007)(956004)(2616005)(66946007)(8936002)(66556008)(66476007)(6666004)(16526019)(83380400001)(6506007)(15650500001)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MWDezWhKrrI788emz1TvG8SzqoM7+0NYLwYofyPzogSiILkj4Jn8gURrU3YDtI6y0taV3SMT6hLiFOxjbEj/dYlSh73KYVtrgJmYPxFnYp4YsmOJvj47I1J1ZE6PyofhlY0ZB0Wli3/oHzoHato/2jbXJwI2jilN1Q4WiOB3pEcG50u5c0CSa6vMTigLjmjs+N3m6gKjfyU+1D2I6B6CMphgaaPe5GGHuuXfTu9iaiEQrZ3BQKEUP7yO+Wwjsvn/um2cspe5Y/JxrbMUnqo4eg7G0nkp5yLJSxDAbaraLruinLV1yDOEcIDxoTn0kL7gJLvAap5EbenjdjORQDZU5MkUZvOD05CTM4kTwGcYRX5CxdtpFI7qxMPBDedP0NI4mYSQxa6WQoMm2Jp5aGDOV5W619irEns24OuWwBQAiz4Y1a2xMnxQK+NdiLoSGSVmi8KaCmT+gAmevvonporTktgrfrPrmFZSMBQpdrScP3ol7LmceVlNDhVqkwgUyhFfkbx90B7LgVhG6pg9kpOXXpj+Yw+jDsjNX31msxx48PfkA4/7u2+kI/qB4qMzJ2YOhBjQpEK8F2HG1pEBWSrTlw+eppoACXT8jFXKJ7kSDDD+6jMN0N+uBFOSO9UCmbUS0RzQ0Mao13orkBfDOo5dLw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3130987c-66d2-4c1e-95bc-08d871bcb784
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 10:17:42.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4CGPx3Lot17BiY93ThIf6l6ezbHwSziWgzXS/dhSa9IEPKVwaxRpr/uz4LHU1HjgN5jK/YJ4cy7iUC4+LQeuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4002
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the system goes to suspend, if the controller is at device mode with
cable connecting to host, the call stack is: cdns3_suspend->
cdns3_gadget_suspend -> cdns3_disconnect_gadget, after cdns3_disconnect_gadget
is called, it owns lock wrongly, it causes the system being deadlock after
resume due to at cdns3_device_thread_irq_handler, it tries to get the lock,
but can't get it forever.

To fix it, we delete the unlock-lock operations at cdns3_disconnect_gadget,
and do it at the caller.

Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 6ff3aa3db497..c127af6c0fe8 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1744,11 +1744,8 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
 
 static void cdns3_disconnect_gadget(struct cdns3_device *priv_dev)
 {
-	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect) {
-		spin_unlock(&priv_dev->lock);
+	if (priv_dev->gadget_driver && priv_dev->gadget_driver->disconnect)
 		priv_dev->gadget_driver->disconnect(&priv_dev->gadget);
-		spin_lock(&priv_dev->lock);
-	}
 }
 
 /**
@@ -1783,7 +1780,9 @@ static void cdns3_check_usb_interrupt_proceed(struct cdns3_device *priv_dev,
 
 	/* Disconnection detected */
 	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
+		spin_unlock(&priv_dev->lock);
 		cdns3_disconnect_gadget(priv_dev);
+		spin_lock(&priv_dev->lock);
 		priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
 		cdns3_hw_reset_eps_config(priv_dev);
@@ -3266,7 +3265,9 @@ static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
 {
 	struct cdns3_device *priv_dev = cdns->gadget_dev;
 
+	spin_unlock(&cdns->lock);
 	cdns3_disconnect_gadget(priv_dev);
+	spin_lock(&cdns->lock);
 
 	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
 	usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
-- 
2.17.1

