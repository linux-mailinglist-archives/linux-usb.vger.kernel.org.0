Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3706624CB13
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgHUC5f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:57:35 -0400
Received: from mail-eopbgr50073.outbound.protection.outlook.com ([40.107.5.73]:27655
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgHUC5d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:57:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSAuI9IuNCmyWUqKys2SQE0BrIMa0FN1abkvoFtzx1CifZNKpMPCF6GXyAmLB/QjG45d+b/yELjFxSuV07pvbsJpJtjHnO2Hk4suDPW3466CzSc7I+Zs2FPoiMZz40Y/8knR/BegvN+BfxYxh9hn6o6slbVqda+ox5WOTuPkcMOHLeHjVjKThAfasEKWbEHYBp6rlJoTiW8hu5axXsHV7G3Bx96yejj+X510AVjI7/PMJ273TudWhtr12rbgoeAgo7CMZvy7wDK7AB6ks8tjNApCskUsYnNU/EMe3OgwHliixXl3ggd1DhWtDPChuLxOFhGJD9rnui6jOyYbKKKxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci2E9RhjzD16z5shhZe3379+Kb0uePAdK/CxEu5X2DU=;
 b=C2DxFUDTfAxXDs85pWR64Id50KqVFGXo5gPxo7a7+lZ8yqVVg0lJryLegroEpwuoprj42OSjIGeChR/nK3HypdzFlJ4RfYodZBP1rZ2duYVMu0eU32QtGSXZs0dwP4CHg5Hy2D72UVhdM3RbVenKL2XWpjWbIucZ1pZthKKiB9+YCwwY14XyVSfXdEl5wIcbrDB59fWye5ubIG28odJ4Trtaot2FeP3NyvpwQ3V4dO6uM1fzVXwAEPDecvC4BK7/twrW1hYQ2aNpRt+koJA2fDvu3vYvDGC2WkYnpM8tyvT1fIJLrcQZE+nzipBqXy5fB8KL7Nkz946bxOuovW2JgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci2E9RhjzD16z5shhZe3379+Kb0uePAdK/CxEu5X2DU=;
 b=JPtYyj4SZIxQc0BAGrLGZlJnZu+aDswVAtqY4+vTdfqSVdZRGYQ6y3c6WBXhsaPlbh4Px8cNx69HNGK6PgvBXjTtFre1Q9q+qR6j9EE6GMN3uJh+v+4B0bQaJkKhqIQcQBguau7Ya9/wrdPNTzm9DA1S30W9rN9LKeg6yYkMKq8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:57:25 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:57:25 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 6/6] Revert "usb: udc: allow adding and removing the same gadget device"
Date:   Fri, 21 Aug 2020 10:55:49 +0800
Message-Id: <20200821025549.4591-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821025549.4591-1-peter.chen@nxp.com>
References: <20200821025549.4591-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::36) To DB8PR04MB7162.eurprd04.prod.outlook.com
 (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0132.apcprd01.prod.exchangelabs.com (2603:1096:4:40::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:57:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e193ab8e-dd45-49c3-556b-08d8457dee9c
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5577778C5F42F4EB6B13CB698B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5euJVqLC3ugQCk8ES/3bFNcWPTM4KCa3A8OFyLx9bCTYgQANc8El/45lzEmgja6OSL7qb6S7blEnJrcCXb3wR+JuwOK4J0eE//IWvtmwrRtb1rdYK1B4kd2kVr39HQYb3vcLWWk4PjulUw/kT8ZhR6QWIgGtfYjEkeu3HAbFBZpW3vaVwdWgOBhnhXQUdIHbvEOgFJTEgFd6sTSPlY+2LgzrkKPjRJBmhMr6sDLFbb6oRWM9f8+k4Wx2Ro0foYm2QnUPmZ9GLCdqdnMhQoPFx/PSOFXxv5yAxvSBJVb8dtghndPkVMIgZjngUJbfpnHeBypK0jFFSqhtOwHBzXvxTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(956004)(26005)(66476007)(66556008)(4744005)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Wm6Dt4WRbeQfXQmcw/wbdFrRZEPOUgEV+SUV7kAriwRmWf1QcC5iCs6mBC8eAIwsX6PF02VsN/d6/WDexQKzs76x4/BmxCIRDgIKHVcoc478MWcZoOKtzGmXq1igNqFt0ixn2A1XXo7NPArPRDQUpUxYRQszwrFm/9NNeoTEnQ/S1kCfVEDAO9iBUwIAPqP77b82LySCdUhKrHNddM29zjMIbBg8V6giObaZWI3MFMe/09w/pgtXVuz2qjvQzwkCG7OyWGDeN7/TyWexWeMJtE07cizKNITGtEE1mxCMPYDeuwGzsLM24D+jl3lqrRuRBG8rQ6eHnI4dyYNbPs9t9NsGLATWdLA2NYvkWAm1CyiphWrJI2GCaFY9AjdClTwvfT7HDUFZcpUVpKu8XxgkX68CxukgJhSOL9E8V6O/UsPUv4tYoEu0lxxdrXZBvkaqdl/0YnFG7SO+yajjKkQr+LFKTs7P13h48kWvQV7Ck+jYXukKQo2L/a/q2adLoI84aW242bAwtCyuNUKt6HG9aF9OTAdzG3inJs2Ylta2I6QVeNWnuZeAciUXFu0320pouayphX2+pWllMuaZDy6l3fr/14p1axHUP2sn8dlK6RdB2BX0FJXDVebNKcCDIOvwDeBLIY7FI5WnL+xPAyckLg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e193ab8e-dd45-49c3-556b-08d8457dee9c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:57:25.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Nx2owVMQK1Bx0MP85AmB54T7vIC8bfFFT8sn+iTJLOf/srWsBwY5z1SwWWaY2S66ijVoLA2e0loKkj11rS89g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have already allocated gadget structure dynamically at UDC (dwc3)
driver, so commit fac323471df6 ("usb: udc: allow adding and removing
the same gadget device")could be reverted.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 2b6770d9fb3f..bf1b0efcfaac 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1389,7 +1389,6 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 {
 	usb_del_gadget(gadget);
 	usb_put_gadget(gadget);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
-- 
2.17.1

