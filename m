Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665772208F9
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730644AbgGOJjQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:39:16 -0400
Received: from mail-eopbgr10063.outbound.protection.outlook.com ([40.107.1.63]:31605
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730612AbgGOJjO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 05:39:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3GGXLGO7lKu5qxvNkIzCWb0iFWmpg0Z75TmbkPksD3yBN1o1Va7ZbUYm/OfTvuRxMtbkVsELxkmJbYvQtO76SeGRdgFy8tTFuTwpYydoAvmVxI8IFv8eBx5k5Vr8JKDVZ9fn0flPCD+Ot8lg9M875dd4pib8ZCfWeFKqPud0hJTpYC1hoDTTanQHEJqKi+ysKgJP936JMdC633Jhr6IxweqqJ/S37ji0xwjChkqdI1IMkrxglpto1ZZpt+naky8dXe+zaOrhcMHzwS7hGqyIAo2dBumolMz9U6IxEfPEmjKIrKwDbsG7lDDhFBlO/WU55l1XT+zNi/mHO7U4ytqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNB1fiZu78+IZVQikpMkxUAKMB+QkfWJiFCGPtGLR/0=;
 b=IebwKt2eby+oP/U4tkxs1GSsFLxBoe95NI05iJwm3CiLAS2Ti8o6a+1nzNnFc4DLplRgSJ+Eaj0srdsgqhaU1TlduNeGyZWMAL55+VHnZQEuUoszVELjaF1v5RiVvTDHYste7pdXOl44+RfZ8l257izBp7O35pQ3QCWN/qJ5F9N+FxBz+PxEocsk88Cdj/5U2VAlZDsqi+N2bdxQc/+sIxv90COP0wnLGRzyHG7oiWgjXpH8gbvxZMPngaCGakrFRuOWOEoOWujBOa3PBjlKgENHL8rdJQ04X8P2nmAk42o4vWxcHSutFUD9VGkBcqmUi2o2+Vz/5Mxjz2qMT41bfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNB1fiZu78+IZVQikpMkxUAKMB+QkfWJiFCGPtGLR/0=;
 b=aF0dbz7TvLA8QLT6vnPIrMR2ahykJ1dw/f07WrQGFVI5q2ZKOPTZ21qiICJqqYeYwMSmqoebYoR/e+y0n3fc4gI73IG+SHirFon7NYzaSExL3vaJlgxMXBxEDJwmTY4wDx+YD0uuWGJcT+FsaHG+8294Um6sXw6a6dVtbCbjp0A=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 09:39:10 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 09:39:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/3] usb: host: xhci-plat: initialize device wakeup default enabled
Date:   Wed, 15 Jul 2020 17:38:57 +0800
Message-Id: <20200715093858.12830-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715093858.12830-1-peter.chen@nxp.com>
References: <20200715093858.12830-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:3:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 09:39:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db975079-93a0-4df2-f7f7-08d828a2ece1
X-MS-TrafficTypeDiagnostic: AM6PR04MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4245C1EB499C6D0A714AA6218B7E0@AM6PR04MB4245.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pHKwtKsebtx2VxudLR2QQJkF+LfPKGnk+nUIeQi/8jmhf3hKaaXwx4K8GlhTCyYYNjQo1vPq6dT1qxaprPJiK9umvbcbwrthmOhl/RP06p+EVFsdBT9B0inC28SJ7DsKhsmCVjl/l5oCRICZp/56Krpp0p/q85m80d69OclIww4+e1oOqgTGe0YteGqwAXKlZFicdl5Zp0Ikj85/QIUf21mdnDKFYW36zInsjC0oWaNqDJ8asW52dRo2WH4a6T4USF6GhyyPY6+JjAuRaMOmd4ji5Y+zPWpPMjW1hiL1a41croK2zYUdea1UODBc4Rn5EqThg+AybPhJcPWyY08reQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(5660300002)(8676002)(66476007)(6916009)(66946007)(4326008)(1076003)(36756003)(6512007)(186003)(16526019)(26005)(52116002)(478600001)(83380400001)(8936002)(956004)(6666004)(6506007)(2616005)(44832011)(66556008)(2906002)(316002)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: wsMhYsrR3KPm6IOBFrtIQbblMgeXElZzu7bqweVqGIW9xwjwtXhoAUotzH4flJID5NtT59Ty1sRwiw7nwn7stj6/NDxLUheFIoRVLUDWgXIIeYnyVbgujLMGnBQ0rUx8KcOpQx12vrWbZcPxZLd8xqPqh3LVYFOOBT+AoBHPAImFjgPGWwvlhuAXAjoo4g2gg6gfv6F/8/xHuqnz4Bfr3R/rmEqLt+6pC4AgO4LHungJ8QF2CWnWXjpbrtG9txy9xBT+V5xCbhnqvvV9NoPWNKhbG8HeiAj7kdKdXMTC2bFuw2uu9Gs9OCU7Lf+jB+bkF5ECvuSC94KfHE/OmPVX0+H2vaH8iu5yGV6l9qRXsJl1X9TDeqdDhhXUPyM1tiVWWSSzlLKUtp0V4teLMlZFqGj9NSMZEs1AJWE8mXDBLvoX9tM8X9jkW9AN94Lfol3WrFGbwRCRnYz1bYyy8ecC241cdvf0W9NiwrKr1lyrixbbf9RJ/q0/ss6mnXS8XgXl
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db975079-93a0-4df2-f7f7-08d828a2ece1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 09:39:10.0315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY5rAjqmheQqfvcQjBY1d38sigAUefMx+gaX3ys7BIzCIuBHnCSXUNobxxN8UH5k/C46wPM9tPkkAII5BHbBkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It initializes the controller wakeup setting as default enabled
unless the user changes it, whether the controller responds
the wakeup event depends on roothub's wakeup setting since the
wakeup occurs at the bus not the controller itself.

With this change, the controller uses this driver could have
wakeup capability due to device_may_wakeup(dev) at xhci_plat_suspend
is default true; without this change, this value is always false.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 53e6f8f69ce0..4bf03aa0143d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		*priv = *priv_match;
 	}
 
-	device_wakeup_enable(hcd->self.controller);
+	device_init_wakeup(hcd->self.controller, true);
 
 	xhci->main_hcd = hcd;
 	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-- 
2.17.1

