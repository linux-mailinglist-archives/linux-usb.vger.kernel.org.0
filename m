Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DB323EAA8
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgHGJnX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:43:23 -0400
Received: from mail-eopbgr50089.outbound.protection.outlook.com ([40.107.5.89]:59671
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727816AbgHGJnW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:43:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HY14biX5XbvCpdQwCf5XkJszdNI9/IwtbUAPaRW3ZbrJbVjLQU4gdYezZ3Z9SWKY7gJFBRK1mqUL753BW71e48V25xt86p6paFgWyfW7R0iAVycwXRNdwYFDCQR2P4yPrkNuED+3khrYe8ECqi9cnmOSNQFsdPmKDhq+7FW4NPRmQfUqNWes469ZWs6G1hBvmClE2ApgPMEu+j9H0645eDL+ePzBc0MRPVvuocz5njdYcYkZRwK0PIoqR90jOIbRMSX8dE4gNm+KGeWDm2HIgKDgTf1R8b0ahp5ymgD/rphkg5Zb42/08N7vv26+WyjjafU1pkfsMV3wfPEYmJgT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yl/iWukT0lrKwuLLCzY7NxE+toQGclgOpMCtHxmD830=;
 b=XrtxT+f+mzM3PbvKOaqmiyCuKAiXgI6AUqtOOQgh4roFCcJevyi9a9ptWPPBD2VcstXyzdS0yftesejDsdldaUs8B3Jqpzr3Ol0QtSA/nrK34V3+Si2PqSeVg7sTIX+9ReksInhSR0pxXdeMXZ/KJPpITJ1CYIIRRi4ZTysK2+6AFjwsmBXjm9WoVdVfBFrzTCJLOLDvRAd03X0LTnTPtTblOwGj4nZaYNctxBKDxNFQIaPSASzfWKL6zBKkD8Qg2smz8ptH9wX8cGncMmB2VmPGy5Dfo2hCa38WPqGSQsg1GkTgzKNTEAhWUO2wvMWkMLJ+bJLhhW7G4cpDpF9K9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yl/iWukT0lrKwuLLCzY7NxE+toQGclgOpMCtHxmD830=;
 b=Q1Ar9mo5xmQZ44yT8w10PR+3d3j5A894CEuOPms4ffRcgv7EnvTOZNrSpkaKxFMzceuNI1yyE5Emdn2Akd6KBL/KZlfIpwz/QfLk5DSNylOoL1SPEK5iWxvtXkWhNf4k04AH0FG9Zh90+FR31NjubU/ps13PWM0S2Qic3kSGxNE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:42:59 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:42:59 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        Peter Chen <peter.chen@nxp.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 6/6] Revert "usb: udc: allow adding and removing the same gadget device"
Date:   Fri,  7 Aug 2020 17:41:51 +0800
Message-Id: <20200807094151.13526-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094151.13526-1-peter.chen@nxp.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Fri, 7 Aug 2020 09:42:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e482c232-7a1c-4987-2b11-08d83ab64534
X-MS-TrafficTypeDiagnostic: AM7PR04MB7077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB70776B007A936EE7A82CA3988B490@AM7PR04MB7077.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pSgON/DcAscYP2oSXoakGjTf8OTGN67OIn/Zbih31BePpxH8i9rWg9yMU1v0VIeGANs6BI+8l/RNuamM+I72gXGLi5d2pTH7epUflIdk6tV10Zw8cotioPrLxi8rrrHHi7VxNmgJ2bt3DVhnsAZPwg97qOZYtfMHkRlbBMzdKlhTQafFwGY7n/oDRP/Xq2/IPqE2NzmU23wt3LCDNGAm9yrMvDBLWOEoWkDV2WwP0Y+1mxPfs4QbWzhg5VF1+N8hlgpP/lskWzph5nnWd72xuY0anTcM9mfb9iamllOD6Ta2XQWDizFNxaY2P7yxNUVmRO3Llayg4ZWWm8VJHCJGgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(956004)(2616005)(5660300002)(86362001)(16526019)(44832011)(6486002)(6666004)(186003)(66556008)(66946007)(4326008)(6512007)(26005)(4744005)(52116002)(8676002)(83380400001)(1076003)(54906003)(66476007)(36756003)(8936002)(478600001)(6916009)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kDo19jh3l4YFAVW/zHg3UCEt5f6bJm6H51X9RmdVTpJW7RR79SP45TOG61MO1PBDREsSgmwBXjkO6MrwHKPF/oXukZSudGtbmC2lx3U9shLe8mJvuhsSi9GPeHTgm9CmPDv2Nlsjkz/ouzxU6np/GGg7rnl+kRa0qyXKHU+azxQc+ZRv62VVKlVGpuCILthoyVyZWZH6GFpXEFwork2JySw59xzlP9gDm0i1GcLBUay4xRwjrec9UJ8lHERkWNfM8nuOe9A7pV9E+9BPMoA11NXfCDCpuv28aXTqKzZvTRee2baJu9pY5jH5kVw6I6/mXr7BCWl9Ei771amDUkOwFDe3mRum+PBdi3/p3092cEjoNboNsaW8SjxtdPO7SxsjVBdkAtzzuSDepIiKNWHmHZS4njw/0DXJBtVqg5psn8LOlQeV1obHcZ7XJ2HY5rm7WWjSD/hT7S9th/qWhgy4mi7V7ut1e8Xy+Ap1L1vJNuXkDBsEzRgeFFgRuzcenBBsK1k4eQek+Fi+2DE1RcjXPfOH9eKojWHsPDYALk7ILqZNRf4kdZZb7uIGYw1zoJxv3o9Gc3k9Tz48fJdIhEqMOI6CLJxOOR3mFjXgj43mqZo6rmFoOpcKZoJoHIA7OX73w99XkdYCzNmT8giwsFfXaA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e482c232-7a1c-4987-2b11-08d83ab64534
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:42:59.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0Co8QmOtwusUSQKhtEPo75FRxiohrwOT9G1vtEdXLbbhfC2uP9RfxVzLdGg9iiRmUA4aGClSdlUnKoDQkNn2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have already allocated gadget structure dynamically at UDC (dwc3)
driver, so commit fac323471df6 ("usb: udc: allow adding and removing
the same gadget device")could be reverted.

Cc: Roger Quadros <rogerq@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
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

