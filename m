Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2E2400D1
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgHJC0l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:41 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:49993
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726453AbgHJC0k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnxGnccsAPsTJzpN9a9InvJZxX9yaxIynJj0h8QeZvSmr5Lr3wYNFFlfqZDRn9rvulBASHgqcT7emJRZGmcR+xgchvYRt9lyhb4UsvPZRRqEtFmvv5jbW+5/d1mOjEX2iAuT4igxnQ1sTz4GYXlETTCDjbBX86oTueh614rsjvKt+a/0nqdJ6r8ETPmNmbKHnEWK/Omb093JP7jysZAx2bUL0zHh2MQd95yB6WFJEcDWXvlV8YXXlonzqUQ+bi3gKgo97d5RPSh4LXFQXp9NCbw635Udr5RyH1f5gLmQysZoLpRU0tbG2jzRiNvy9+W6A69vUHqU5pZiE9eoh9Jqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N4goH2jfQlG7Pb2yFXL49bnwKPGjHiD7ykFgsukWxo=;
 b=lRgOA0b5NjUXSfOl3OFf7kj14HHvYxgHTSp3eRKH10EMNGwPOiu0O+rp8g3UGeTCeMAhcnMhozH35dJnYt93Y7h+bs9t18GXlvCcXBS/l9SHU9Be8TMM6eTvOZG/qKKtuDoB7zesHfYHggQqTrhyHxfXCsXsrpDjWwlyX+D9O7tiFECQEXsZfw5W8AynkCgGgl2COWXZwAy4Nw8elXzwg1Qg+Nkty+OwgNF7GzqPvL1dKC84foUTHefv7g9pJhOyci/iJsBUKersrJDZN85XeX0CpvT1R1Gi4K7gha5HxWQwSkT3+jtPcy4qjKp8sQvxAz/HhxUfLlCwa0/Jlkf57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N4goH2jfQlG7Pb2yFXL49bnwKPGjHiD7ykFgsukWxo=;
 b=h1n1BbWLo8nTHBkDw1buJYeojhLddGayFvQOlw7Zst+amBFDvvqHDjlR3iZZWN0ucnIAH6cX19RcxfZUGFZvqOQpDyxMIgYWgub+MW8pJ52d6JwLUxOV4MuEiBpc7I6SQt0XPdfOgEDH4hetKMVOUzn4r51bgULfpAdbFb+1v38=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:31 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:30 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the same gadget device"
Date:   Mon, 10 Aug 2020 10:25:10 +0800
Message-Id: <20200810022510.6516-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:28 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d895f6e4-b7c5-48d3-5b19-08d83cd4cacc
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB71601F11CE8F8DB654593BA48B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:222;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EaoiK6rFp06b+QV4EkoBYW+0yVCcj3PhJDRSN3LG0okcOuzIh/MYHzJotDxnl48yyX0IdTf2rRS9HgI7931ttjPptHKBVb7FM0W1e9kumUnXfMoT2uHl2kXZf+4ZlO5BdoGkrmcVQnx/4qG8e9Va/qDzOiuZo+2w1da0Tov2crfv8hEP0IOFXKULm/s3xgTBLyJ+V0PVtb0FGw37l9mQhU/LuGkayHz8BpYq5ZwBcVUF370pSFUZ6sb7IWzfy58tl1uN6ihXgMvbBE8dp13hxfNFJ6O7yI+Jrq5SvU5yDr3LDvw5XYhoivItfM3Fg9VAVCfoK+46yX/nEJxV/3SBFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(83380400001)(1076003)(5660300002)(6916009)(4744005)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: OtSnSOSKU62To+cO0d3zjGf3tPNoMGZ5gSH2QACfUFnu47XXgqSWTcJr/ajfyqBL1dQbndnLRhIqhcU0GH+cget8wDiftPjX1C/oHcaW4uMfoK0cH1zAHwKdG6tQbyiB8sH+Q7DKnbIEWqKGMOzp5yLCe+TOPF/9B+48Dt6bVCIHGMobcZOZYkv7xSEkFKpQtmeUWmxGTo4P5gcsdwteyI0RF3/3J3PHC0VmXZsY8cVtW01vtPzarO5Hx6jQZ1J6UEUlLndBH1bEW8zNE6IL1I3aUaNEKmPu2dPwWGCTJQBgMtsQPhNcP8sgbfdh8hZKrsa7BVr/Rx1K1goSjTyIQSzwKLXDMNY7cwNlz6tvfAHf9ckj3rBqPKYfG/Jqj6PnUhx9QR7fyRZSOo4aC6s0ksg7aTgfcvCgARRKhyqKq1ig2sBqDERIBcLOyJpiB+z6hQ1Iq9ammr3NgEMAxttvBGzR14OTSCbNxe0V3cOCjSEVBqWSLRN+kafHCk2pp3/xzH4lAwm5bDtkptu/1nlWyJiBI2++A/GQQVOEiPb1zEkPvLnVe0f8ShqR4ssGRkJ0xcNwcAPIotJcYSoiaMVmrWkwDWaWwn9B3jNNWSVJiGoou8ykCt1fjRv4/ShGlgs1RSuJvbbdEqPqdJr9d0BFCg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d895f6e4-b7c5-48d3-5b19-08d83cd4cacc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:30.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjK9p1tRX819T04HKy41zteLX1eIGybVRzn0BOkYPB3g7zwQaksfTLXAlFZdlBp+xvgWMkMEWyraNyrTAPvs6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have already allocated gadget structure dynamically at UDC (dwc3)
driver, so commit fac323471df6 ("usb: udc: allow adding and removing
the same gadget device")could be reverted.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes from v1:
- No changes.

 drivers/usb/gadget/udc/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 473e74088b1f..43351b0af569 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 {
 	usb_del_gadget(gadget);
 	usb_put_gadget(gadget);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
-- 
2.17.1

