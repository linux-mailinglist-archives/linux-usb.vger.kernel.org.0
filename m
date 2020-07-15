Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4CC2208FA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730646AbgGOJjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:39:18 -0400
Received: from mail-eopbgr10063.outbound.protection.outlook.com ([40.107.1.63]:31605
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728820AbgGOJjR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 05:39:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4u+HswWk9UqvEio9Jb6GZCpJA5lXbfegC3uI+IqTXpLpGnszPfUQanLlyGYafAz+ZwtJSxaPadCGRMRjxkSJwuIxYaNnSQ15I6L4N0KJ3eFenuXhkiBb/pGH5EnSjBRQgjUDvhDrBBsJaaqDKtE8QKX25stXPODUUGt8sHPcBalncBzGLBqXb4woKigyZLYIyKbqtEVDI6Xb44Fw1aMlSGAJNhodTfw7a8ApDfch0MFV859R3ijysOXVff5p82ZVjNeBIGKFPHwbOL2+xO2/fsJFbdRhoz5ytWe++FucTVKv8d0NJW3FQZDfm9ihL/z8opQLCQ1MQAz4Sj0NEOH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSaFzyIYV/gkK0Ukz8YLMYdjsOE2PgBR/Wj4Ao1IWMo=;
 b=RH7fT1kkvB+S6mwKosIK0WfBeQlnPYP6Lp/5rwYUuk791N7h+zuEgclKqUkShbkTGYHf47HMk8KUbQrnly0mrf7aDmrMP8mIX3xic4yHN8ewAdFYiL70V4UwnNstMYbBHNcEaU9bHgpVQpfz3WOUnxbq8cJiTSJnzUETc1wIEE8AD3PH6exyhXrQ0YlnXBqJT/nZ13ZeDNxx8lZ3bf7fjHLuIJt2ZmwyLlQwuVjcpgMdJ9bIGhUOLuhhV2bYRRZRgPlu+KHUszxpyDTNrRKsg5/bdd7C9QBSEPM1XFgyOyfeB4a2VTcUZKImBLQoXSYL0wB/ylCjym/6IQyWgC59pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSaFzyIYV/gkK0Ukz8YLMYdjsOE2PgBR/Wj4Ao1IWMo=;
 b=Idmf4XFgNieVv3GyWptLNPOGdc7qAIdXdBUOu3STkyBpIo/3+crlFpjEJoKyW0ZFTkePIE4IAPGEGKblIOSWzDX1Gbdib4/ti0Cp5A9axLCcSfFGYvT9+TTmvREJX/hDub3UFe+ljzgVuGEpgvJcm1D1jsFpIkoFHy4U2pcPIL0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 09:39:12 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 09:39:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/3] usb: host: xhci-plat: improve the comments for xhci_plat_suspend
Date:   Wed, 15 Jul 2020 17:38:58 +0800
Message-Id: <20200715093858.12830-3-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715093858.12830-1-peter.chen@nxp.com>
References: <20200715093858.12830-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:3:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 09:39:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70c176f2-071b-424a-1ab6-08d828a2ee5c
X-MS-TrafficTypeDiagnostic: AM6PR04MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4245D5919A80EC465B86A3B28B7E0@AM6PR04MB4245.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ur5OqPJnLvDTOKdXdXl7x4QBPJEBCYcupUhl+Ktv21I1uZqDbBxazLTlh5D2PqieZa2iNjMixBJ+Y28O/ET/QvpBVCMLojSMtjlt7AV9CjScw7dH/Xk5YklMh1UjdP8H5s+HfPkNoZgaLQXxIiWTylsM+lMu5umsYR7yUnY9HhgF1wX+M7lcXrFBQITswS8DxztAyzg3fvXyDxalxKRCknXlZIgCDcFRFFbsKF2YKX/HyvyJ5eVm+ON9AeqORa0kURfKxFxFiW7bg5qEGvLSd31+qI/jLAZwcWh3+W9+dT91/VcLkIsTeY3ifn43/2C5JY9tEUWhTz+mxPVkM9iSEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(5660300002)(8676002)(66476007)(6916009)(4744005)(66946007)(4326008)(1076003)(36756003)(6512007)(186003)(16526019)(26005)(52116002)(478600001)(83380400001)(8936002)(956004)(6666004)(6506007)(2616005)(44832011)(66556008)(2906002)(316002)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BqWcLNDegSm34HJBLZl2S3LaGndLceN+qcUOBmi15/MN6/2A26MRGn7NnQUdfPWdy5ZgGHfN/ujCcSAWLw9Nx695ZerGdXYyHvsRt3MExKiaDAFcXmAKHZgJklV58R1rEb5Emssl7QCBk2U8b1iGz6+Ty74oUU6Xkp48HIcWJ8am9vJXsUoWliX63QmG8KD4l1DWGfZpDuq4fVeWD/yeqnKtPqF4A3J3YtYXpcfqQ5U1AMkSGAHuMpeLcs6lNPyRRNMh8DZ1+bUiB/rCiIzyoMwbVW3u4JhGOWsLThs1Krie8yOkxd5S/dsqFQCTlH2nVdq4dPTuCSJT95YNE0LRDnC5jUamYfDWZ0TeDa76cLVCCGvgfRFCpxUk6XV6fCjxg82uP7bHbZ0bqKH/GWzqQxh1CtwCG06elnnBGfb29ehi0Ay3eugDe7gzKeXDICzguWXvHEsr8GERQ84gJc1+jHiPXtGh2Twk/K2OGzP/F1+tUdaey++BSERLv9hldk/7
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c176f2-071b-424a-1ab6-08d828a2ee5c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 09:39:12.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxuXW/hUZm5QRcIl0rxx+9jEa5gVeXWHJZwYnvn8n4qe2IQEJ4EJM3VhNyXpj6HMnsm8c2oQX2IYyQlsx1mZWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To reflect the current code status.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 4bf03aa0143d..abfa85145712 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -425,11 +425,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 		return ret;
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
-	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
-	 * only designed for system suspend, device_may_wakeup() is enough
-	 * to dertermine whether host is allowed to do wakeup. Need to
-	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
-	 * also applies to runtime suspend.
+	 * to do wakeup during suspend, the wakeup is enabled by default.
 	 */
 	return xhci_suspend(xhci, device_may_wakeup(dev));
 }
-- 
2.17.1

