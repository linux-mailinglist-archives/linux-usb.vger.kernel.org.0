Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB782167C8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbgGGHuR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:50:17 -0400
Received: from mail-eopbgr10075.outbound.protection.outlook.com ([40.107.1.75]:13280
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbgGGHuR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:50:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJM+nc08HdQRwvTVJIJvt8ULGDlg1Jo7RJf8JgQDb6excZGoWuXqEKMYSx+h+UUkefqwxJ9IEnAlNKFApKLxCc1dCy6hPAD2YP+dGoyuOYWsDj4/Gd8iqwNtEpl1bjUHeb9WWlbNmvLCvUA0ILOhPw6rifOhMYkUaSjeWMwP8xlygxe06lEk/v6d87kYRMHrx+cMRI9b6633sHmzj/zMJvQYjQVD41QcvzvqYU+QoIHn3URIB2NjJZYv1GrWRubOcTXBUMVfiXAKT56U4svkHAfAksQtVvDGA26Lw5xk76MDMiHY+NszL52vvwA4EhVJAHppt2DkH+4CzXpWMZK0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSvEBE+KCAkB94M/t9GdktCL2AaLc3cRFmrEspB10s=;
 b=dDrw+dat0KEOQL7mAxjwWCqRh7U7Wo63ym/mOs0Ktqxw62jBVueQowzzxHSAZNNfkth1r0Hv+wkNdE7m9T8zoXxKQAoUhG5qjQFXx12qkCCB9svsV1pXKxl6K9Jn88j66rVHLJCzCIpZbowVEO1Icl13yA2zr3VNly+Zjs2S066/+8PTEAk2Q35/89zuXmcOmv7M5X9bGfMjyuogNyR/YFFG3j40c7K17WZkkqSVbvhUpCi73mldykFee+uyMct/WGcU8NnhId3tBesFvOeeErbnYjVgtOOIBFfiW6YPB7NokGjU6l4ALgmIMX0ieW0cSb4JAZMTZYBSOPd+QO/WOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSvEBE+KCAkB94M/t9GdktCL2AaLc3cRFmrEspB10s=;
 b=jqnsXZLlGXUWqxSAO1/wOecpwJy/wWGVaFKGnMIJK1TdZpHbV1JCpNWkMyw7NzZIpqIq95Z0iBrO6gP7ALsHd1qEuyOuWkCx/cQ5GgQ3AH+KJ7/RvJmoH8QXm3zGoEBGZBbVD2UIEQEMG+Y2oZO3+U5MvRcwVE+/X0b02tuWRPE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 07:50:13 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:50:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 9/9] usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
Date:   Tue,  7 Jul 2020 15:49:41 +0800
Message-Id: <20200707074941.28078-10-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:50:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8b82cf34-616f-4947-12c4-08d8224a6198
X-MS-TrafficTypeDiagnostic: AM6PR04MB6279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB62796CE8D4626CBD8F22937B8B660@AM6PR04MB6279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qZeRMqDTh2Kcuw7O/pXr6ed5EjsVttrZ+PHZdRstmJPIOyJrT1BEi3lAaEghMw8kSYSiY3zeGjtTMJ9lR50zb/4XVcpTZlxwxV1PwPL6VItf57g5YUd9BCJbaixmU9yrchpM8R+Bk/RGeY3GPnzWCbaBP2zJmujyoPgpgoD1dCMHSYwrnBPap+1Ms8rC1mPYrtdRis7nUxVOP4L5hEjvqi9LlU+iQmup5uE9C2dAgdccEeDToikUwFKxIH2M8505G/YhYcULchhNEVzQUV0NAV1MyHW7Eut4j55fr5054hdNNksWXQTNo/mVIaTUQQWvpzMPMVyZ9U+HLOnLItbdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(44832011)(26005)(4326008)(6506007)(6666004)(6512007)(36756003)(52116002)(8676002)(2906002)(86362001)(66556008)(66476007)(4744005)(16526019)(8936002)(186003)(478600001)(1076003)(83380400001)(956004)(6486002)(2616005)(66946007)(316002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: swtkO/2idpzgYGP2tdDQZqM9wvmhjrzNPwNjfCZq9BgP6gRS6YmqB7eIlV7ITh5xGipXJuFDVQMIeB7WwqqQGtk3S8jUFAE9uYcqS+DWnCsqaFBcjMbDQGEB4mh7Dfu1OLBZQ0//b8NFVm94P1K88F2VM9804b4pQXttBaJYXM2m8ZxsPpcyIQxBgCYat/wKfHNGNQy/MLuKidbpAXBmRdWi+OjNqzJFHkvqQWz7cn/yL58F0S15Z/273/8Zm/4foYCPYF90tIRSmQDxSCRrkmH0h+nDR0EWXxMr+e6LHlSkEoNIao+8J362zipwK433ZM1NoeNByOdylW4p4YojuCs7pKUxa2IIQ+kTZVJwGRHV2lMiMaVsNRBKaU5ll/cyRzTbqdgsuOnFlPgErarPZJPNptQxz2/NUcxuH/ZiEmlqsF1uudFH2QqZyStdyA2xWm/CsK/+nmjsX8xL7gc4UXVv3DhKW/+W+hGlaR4agIU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b82cf34-616f-4947-12c4-08d8224a6198
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:50:13.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q16GCXUpd5O8+9p9UI1Hd4bcW+GZllVCs286sN2LZ/LukBBXr0WHHU6H7Zc64DqkcDHBk2DD2LOyeL3CMGAxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cdns3 manages PHY by own DRD driver, so skip the management by
HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 030d6421abd3..1dfbe23fa089 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	(1 << 25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.quirks = XHCI_SKIP_PHY_INIT,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

