Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6A628CAFC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 11:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403962AbgJMJ22 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 05:28:28 -0400
Received: from mail-eopbgr60085.outbound.protection.outlook.com ([40.107.6.85]:54087
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2403925AbgJMJ22 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Oct 2020 05:28:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Akqp5tZ/a82cdb2LMVSwQ0w0KqDE7X/Kf3yp4yOJhDN+s2iXYrmPKReAslMQqx/LCrj+Pv/NjqFYHbQre6aECdLI7Atcgp/+lPa4Kgo46J747iUm/ugMzPywFadl/nKe5d6ydf9apvL97cteQggLreY9rfZR1PtiJxtrQ+/miLSzntojym+VVlvlS2V9g24C9N5z+bB5KZ/lTDYElozJr+kMgwsLCPTZawUTWr57uj75IYAEL9qVjKVHOJPdXjAaQeehuY0JyY7J9KYWgsEXDiuvL0I3XkdfBgm7tVYwpENXGj9+4SU0j/xN9AKQE6QxfzmziMTY2zc9I6tyDhFwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k55LTBTg22UkXA+DuTEVqvu423dGP4yE1dNXe4nFM3U=;
 b=nsdmUmLfn+42esobXrSMcVH5RyrlgtZukgeDdfLDJRLZwx+XO4+jbM+EgiSgnbTI2wDMILyZB7Y7oexRRDVMapF728rTlWsQF5gOiXROVa1pBcPWBvne2joiiRICFnnkOEC2lsOrsBvmHK6iLbsWA6tmUEzhkULfIn9d5mByHyPdab7DjRY9QiTm/d+ZCg2+lqZoKFFTOE+fahryFvEf6qoLi5eq8WQwsxjmrzwO2m5XVbtnl8vwGTxwzomnzE3BQBRl9hT3ske7YopOzJrV3o61XhlAf8RMvB907JL564a7MjkU6CrZm6yU/jEBDu+efG73bIuS7SK6fwwDcxwRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k55LTBTg22UkXA+DuTEVqvu423dGP4yE1dNXe4nFM3U=;
 b=XyAi5nHyzJJakSMZ3noPyKkh9JtQed5tMYVlY5BG0XRI5jQuh4ubfQ1nk0gN8o6+/ALdf2OxBNPxEWZru51MYm3R55Tp3b4SJRyj1BM05dK7VL1WsvcEbn21WeO1ujIZk/Ml0s57CpJYgju0AF1xd2b4jOuuRNZcEjrhT/FpMqc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 09:28:25 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:28:25 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND 1/2] usb: gadget: core: change the comment for usb_gadget_connect
Date:   Tue, 13 Oct 2020 17:27:45 +0800
Message-Id: <20201013092746.10602-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0192.apcprd04.prod.outlook.com
 (2603:1096:4:14::30) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0192.apcprd04.prod.outlook.com (2603:1096:4:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 09:28:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26521647-f0b0-4e2c-b45d-08d86f5a55bc
X-MS-TrafficTypeDiagnostic: AM0PR04MB6852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB68522217B5DAAA2AF26CAA3D8B040@AM0PR04MB6852.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7dw7EIVyhTBcryIJZCT+HbgfCi9/Gctd1POLf+vRehFE6FtNKo1qU7W5B734WZZ73hZuLl49ULljNJdD7eUhsjxSYmenWU4NF3EFyveVbHxYshF6lV2UTxywDemiT5ltMBJTAhWkHBFKycaCVZvLg/BFjCw0rvb3tDo38xVU6jYFey6tdgDVo/VItrqIO/iKjTmKrVxibqQvKyUCfLAn2OvKV0LK9iBl/B8aswN8dYVE55j+yZrMxx2OJPkop8UN9W4xueyRKuwJ3XYAJZTSKIw2Kl/I4A8iDdhoJ2808SNvvL/SGKXoqEcPd9otlyIQGGv9Ln5Xjz+ir5hcq/Ahw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(86362001)(6916009)(44832011)(4326008)(2906002)(6506007)(26005)(8936002)(83380400001)(8676002)(66946007)(66556008)(52116002)(16526019)(5660300002)(478600001)(186003)(36756003)(1076003)(316002)(956004)(6486002)(6666004)(2616005)(66476007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YZLeZN2ijRt74yCwIVz6IxCRMC0JG5woz43c7Kz1t0+/yVKdzzGVuvJ4c5D1yoW4nvhjFp+mr0kL7ss0VFAgHk5FbcUllCo3r6IKpolibzMi62gigBkwHMxgZro0NJbWnLQt3dpwyQyQQquL5BWN0czh73F2uHXd/dOvIqdTjS7S9f/xWP44mioCQxBw4PNn9lIprGJKJ9DViLXPCaX/U7lk0bmj7ehILGXeUCxRkbJ60okEGehCVO3VebAQ/7ANbOrXDz1ypECX3LqD+S32LB6W0jP4TyQo0YTwxoNvP8Rmaz3FX6FMrPkpw932MnEYbUo7vaH7TZiVJjGdEgJSQuDQo70OFAYcxYnczC9K0S8e5HKhXQgHd9ylcbiAJQujFH9iiuA79DIW6uKd5h5v5uP6SHIRXMz+OtowjXpK11LBla2bCypsiUY34tLk2/lJvBS6Z7TILgtvEnRSM0+al58lXlRF/u6Y/IwoDU5SrBXsBcugppvtWWX8kczhRQsBf17fizsZFbEaymmZ+zd38pv8pLZzsbmy/4Hcw1g9NUiztH83TVDRReKjTsYSU203wqSsVB4i8M8mdI7cohKGxZBx7y4kBp+vHvfV1iExTFzVG9/u2UkjyKz/9eJUMGwHxfdn5luvgUgJvuemub/Wtw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26521647-f0b0-4e2c-b45d-08d86f5a55bc
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 09:28:25.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsDxnbd+3SXL1w1RApLKgOF8ZUWnXrZZo1SbRm8yBsjc5Tlk1l8jR0C9A58CXLPuGyb9kv0u2EvH6WRyUEYdPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pullup does not need to be enabled at below situations:
- For platforms which the hardware pullup starts after setting
register even they do not see the VBUS. If the pullup is always
enabled for these platforms, it will consume more power and
break the USB IF compliance tests [1].
- For platforms which need to do BC 1.2 charger detection after
seeing the VBUS. Pullup D+ will break the charger detection
flow.
- For platforms which the system suspend is allowed when the
connection with host is there but the bus is not at suspend.
For these platforms, it is better to disable pullup when
entering the system suspend otherwise the host may confuse
the device behavior after controller is in low power mode.
Disable pullup is considered as a disconnection event from
host side.

[1] USB-IF Full and Low Speed Compliance Test Procedure
F Back-voltage Testing
Section 7.2.1 of the USB specification requires that no device
shall supply (source) current on VBUS at its upstream facing
port at any time. From VBUS on its upstream facing port,
a device may only draw (sink) current. They may not provide power
to the pull-up resistor on D+/D- unless VBUS is present (see
Section 7.1.5).

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index debf54205d22..215ecbe8b692 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -659,8 +659,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
  *
  * Enables the D+ (or potentially D-) pullup.  The host will start
  * enumerating this gadget when the pullup is active and a VBUS session
- * is active (the link is powered).  This pullup is always enabled unless
- * usb_gadget_disconnect() has been used to disable it.
+ * is active (the link is powered).
  *
  * Returns zero on success, else negative errno.
  */
-- 
2.17.1

