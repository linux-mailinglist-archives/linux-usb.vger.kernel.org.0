Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E482432E3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgHMDi5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:38:57 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726609AbgHMDi5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:38:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3ShJ4STc57qaZlNNdQKp2FO7KlSCGDZQoyJLjlUvzh9RybiZHVLKzNKG8I1ipgmZF52C38+Vle58XrpUhDJAxj6NWo1SBo6x1EHFNtlYEjrYLXiCFgXa4wLIsOCkDEVJBAL1eeK4GWaYoHl5cAxc3neJelyMJrEqf6S1FG5ht2ywA5yxQLR5iv4BMzE6CMYICHyLTq8X3Wvib/yH+Tx/UZOSdFI6fizDCxaj6zcu0N2zaf3YNww7ixnklqmb/cEYVb2jR85OrgbGBwdxQWvTwqR695t8tMHZZSrpt6YHb8zi0SbH7KfoDalZkVBjBVv11UFLXT83S4GJGirlAPWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRl/ylQG2aONhGqipVD7pQ6fmtBbrKFA9Bxxno40V2U=;
 b=nZGM5XtoNDlekYejANsYgYtQ6Y0uBjWwm4mTPkbWwdklmAFdru+AMefsMPo+7f3nq/xe+ECS9UpjxmZwHQxeBb9UI8otitaM+qr04LoAle0ADIjL31SyTmB0pM1t1eVlcTm7S38k12skmchDWVZ6W7qleUhh80sT2ZC6v1faKW56ywneILJOlg1vvShZSV4DPeZRHqdDygiONKlslVvKfUFBYX4cwTeYtSGU0AkDxTNvz4zKn80TSlPBLKoykAgChht04bqZos50P7ixq2VjjJy6abpltHOyuKnETbeNyyZML0HVmqys+qs4Nfcl/0pSfkJJFvpXOk5PvlksC6ldJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRl/ylQG2aONhGqipVD7pQ6fmtBbrKFA9Bxxno40V2U=;
 b=KvLDm6AqcH9ZvuEvTwedsp8/ZITzB1aaG6ZmdoWhYm9cV6uoIYTNPl0P3fTmJwmgpTlPyLw6wcAzpzfzobi0WNbE5kfZcxFPFsWnZorz7Pu7Rw2vFsucyyfG5u0xz/DVEXTI/vgbkNzuJv7zRan+65zkP9CeRjIMvq0sfH134WY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:53 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:53 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 5/7] usb: host: xhci-plat: initialize device wakeup default enabled
Date:   Thu, 13 Aug 2020 11:37:39 +0800
Message-Id: <20200813033741.13982-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813033741.13982-1-peter.chen@nxp.com>
References: <20200813033741.13982-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 695edd2f-8c62-4882-52e0-08d83f3a66a1
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB36544969759996B6A85648E68B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695edd2f-8c62-4882-52e0-08d83f3a66a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:53.8174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ed+lcFY1nZvxsvpQi0jR9lO7gGz7Sc0Reyms2Yyz3ASo4V/vmWGkbanJNW7I2+3biCtu0AWn/2sOPcCNxPtWUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
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

Reviewed-by: Jun Li <jun.li@nxp.com>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 14ff65a387e8..0ef28b2caea3 100644
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

