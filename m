Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96322585A6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgIACeh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:34:37 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:38116
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726489AbgIACed (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 22:34:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLtUVC7i7JYNErZ4VdJLDXXDgjCn60rhBN/thwX0KHIFs9o4xKOGBfiiBqJfiqi4QvqF0MzHcoGY1Wy5ibtUCAaNkzajo5BpQuZ5WLJ4dLQmHL55MivESrgQqzBgRMU4qzVDp9yhJArHSORgl/fRqCbkz3CRv679SKzNvz8iu4pIfSSoi+PJcKCMtEfyFnVXGIv7KxOQqEyBPGYnoe+1LQyTf2nd1bvJ4A0JHKjV0YfkMc+pXGD/ZUyVhCkNkAc3xHUAc/cjRAgSbXnYLoVIYoxVUC7CrocnFqlM1MNHUT13XQ0645lXkOqEWXLBdk5MBi+uoZRwi4mDXQGHYTiYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y257xY25EdPqAKNa8KglmdLeB570pig64BFets0G5cw=;
 b=lbQXxuck42a7cs6qwJZg+htHSfDkCnEF3kG/3nvlK+h0Nyt9A3SvEYK4v0EkI5sgX9dCfvPTm9OD5rHXIuNDhxfDT66I/h6DX8VE5krHsFm70+xhmi8h5iLUbPC93zndNWGzmBc8bkQZ/OMqaRjsw4zSSfgu96pBujcP1qqaCS213dG6yC8+872z5DE75jdFScaDrul2tGulngQVdnMHlWRmXBwljFAWg+x78RDK3O+6M80fO6WXdSkh26IjIx7GqjgwSm6wtmsjawqmL/wkRN4LdfaMgZrn8p0f0PRXfRP7BiQn8pvS/oBu5VIbVzKlc5E+Il8PWwLUMGvzLakFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y257xY25EdPqAKNa8KglmdLeB570pig64BFets0G5cw=;
 b=A17IkOdoiXScFFK4/pHysqppIWIwgIldvBsADD/7G4LGWl21xxcYt0b7awhk3WyMuH+dVJ6gEvj41MIMQOI6U3JvFjaGQN0hn2VOcAdJbcvsKxendFTfViXYKqnOK+RP+1sZoScrJbqtrLBGshE2EDZ+IlXJtg/WUA5btzATJwo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6998.eurprd04.prod.outlook.com (2603:10a6:20b:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Tue, 1 Sep
 2020 02:34:29 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:34:29 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/5] usb: cdns3: gadget: clear the interrupt status when disconnect the host
Date:   Tue,  1 Sep 2020 10:33:50 +0800
Message-Id: <20200901023352.25552-4-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901023352.25552-1-peter.chen@nxp.com>
References: <20200901023352.25552-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 02:34:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9cdff27-0345-4ac3-6016-08d84e1f8d0b
X-MS-TrafficTypeDiagnostic: AM7PR04MB6998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB699816B46A06CFF1FBCD1FC88B2E0@AM7PR04MB6998.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ny5t2kRjdfIGgGMEms0+QNFMwred1AVnf9u8d4hj7ugzcM7mPda0yCXISeEkDb+qi0wpEr/mZDw7aYl1f6puMGtOmW8SZoSg9dNv8W5+58DoPdp4n9BRM4rULM1pTOOSeRTjBotUkV6zjnirrl4KdO1/FHldcyLwMKDcCvC/Q5hwhxcfErAmabus7dhosC1kZAwBbnSbRkdX/FUkSNPb9S5+b55bvlIZeZmKQB4BPtpjTVHbbg5p+WNasjY+q4iQJKEa2JKH2qo4/rOrz089xSMcwwq0iXH94A6qCIKgutQxpryWRmA1IJLSCzrUM4RB6mYQXoYkV8krp0fGLaC6bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6512007)(6506007)(4326008)(16526019)(186003)(83380400001)(1076003)(26005)(4744005)(478600001)(6666004)(6486002)(2616005)(52116002)(8936002)(2906002)(6916009)(36756003)(86362001)(5660300002)(8676002)(66946007)(956004)(66476007)(316002)(66556008)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0kr1mNkQTV22QVK/dwe+OtDkFC54ZI3fUROuoAdn5E5QeQHw09TOtutJ1wVDymlO2bD+YPeL/4LAOJ4lmFfaA4cVr4DN5QtTqdz2BqjxEYHXeZWGZPDebK0JthL2Kx2nNVH+fEi91dIvBumzj5Gu/cxJ7hv7UpckooKH6QzblZ6qmEn9XCdU1bvlvo/y+2623PWZAX6j+XkGYC4pZvs9TptQC0eRE5/QMO8toYMcscfljOz6O0illVSuB+Upm/gcg1LVRTEG5EmySFY65L2XNTHaWGA+fToSUqUULnfyB2j7JLBrdT9rYvst4gTGdM0hkZDEVfcuCoyu2kqeqB2DvFLQTgoIXe9sFyBVtpyYCRru7q/6Tk1mpq77FvxIfBBiIxN34gZ9bHcmKEvyr3UjMoisy1UXmn3sayzPTz4Qps9UP3fbXeAnRDN2RhM4IDIApbNDOS2qPsfAQvrmGJrFx09Vj7buHtAHPVAQ+ukjyMDjYjSOH+eSzlzHpz5oKeYNxDYaxGwqPOH9ipHt42+1fTGMYAu5t/dlkNwk2BvqJ2JST3r/LlBL1KcS3diTKfqjGk++TRlsLJBzDNU7Uurpm7KzOvqmzUyiABXcdZhszGLrWCXrk4dP3BPQrq7SON/xLDOp+AIOFHkO4/F4y2ZsDQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cdff27-0345-4ac3-6016-08d84e1f8d0b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 02:34:29.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LixYyNpo4NlQk0t1I6Knr97/JGaSeR1TGkqFfbOQ431k69KV3FV6qL/2cMKZpU7ppoxukIIUdm/rk0tX6iH8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6998
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is meaningless to handle any interrupts after disconnecting
with host

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 03b54c239944..829bc917df39 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -2739,10 +2739,13 @@ static int cdns3_gadget_pullup(struct usb_gadget *gadget, int is_on)
 {
 	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
 
-	if (is_on)
+	if (is_on) {
 		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
-	else
+	} else {
+		writel(~0, &priv_dev->regs->ep_ists);
+		writel(~0, &priv_dev->regs->usb_ists);
 		writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
+	}
 
 	return 0;
 }
-- 
2.17.1

