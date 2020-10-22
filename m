Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F30429561A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894766AbgJVBkP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:40:15 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:61966
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894762AbgJVBkP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:40:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iibAgo90WFFX6I61q7yTO6yt4+MCrPDYMFj3CWmY0EfpNNAE14mooV2b9WAx7yAPTSTJfoN34MK+rf2jy+NjqpaC8C5W8oPcj9Xo2ZgcpLLD34fpgRiklJNXTwIyIJRqZMLkl5XJiBL9airF89olGenzauM03kukO0L9FhhYfaq/1z+ITj7SuhfcLDAheNWEU1C/3yyMzltA9EWS6a13mYkubqilfXiQJLLv+5f8WnkSWdsTgH89m685TefXBtk1WRbIEKDqYfsNmHpoCCUGeBf/mmLxn9js4CrfZpq58tUagPjZBLOR7KqeOzeqWvjVw7K+7QGRR3qQVhTMqFa+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Bh8tk9eMk01YgIv0e23rRJLEGncWZ3KfQOb0P3iqR8=;
 b=mainJpLwK1A929vslNdu0XBfunkrohDwsSEb9kPaE7kNsXz8eMxUX8m6TjZNl6G/a2XPZskyZo2l5/V6hvFal/Q2xHH9T2Qh2T7IJYwyGr8wS4xfF1whkT32Z9510ul4r/majPu5ha1ritaKQSonQiTKWtb8ef6G/aP8RZRQg78mUSNCVNbbaqzo8FdqtPeb88k7yDLEWhTshe2bqFd037c/cqqcPJexMhyrEm5Mv+aqQQnAnK0pwU1APwf6DOk9fgiH5U4ZEFf8vcdYF/4wR5e9WKNHH87c+OP/Ef4nnfb+1XZKzz3wa7uPj6BKohHuQJEQyA8+4+qn1v2IJrCISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Bh8tk9eMk01YgIv0e23rRJLEGncWZ3KfQOb0P3iqR8=;
 b=WM8qJzjsyo16AzioVOoYnhJG58E9eBLCukY3oc0cO8bWbFySUn3RSSg1W10OJ1Uy92jIAOvCDhvKFNvkrTYJPSozAIUAbmkrbQKxpe93ZI3iHV7KSJLaqA/pnwCFKVLEkL6R7X/lDUtvKdVCI1q5LctU/EQTGUumkp+S9ynX5cE=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 01:40:11 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:40:11 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/6] usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
Date:   Thu, 22 Oct 2020 09:39:27 +0800
Message-Id: <20201022013930.2166-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201022013930.2166-1-peter.chen@nxp.com>
References: <20201022013930.2166-1-peter.chen@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 01:40:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e05649b-a4f6-46eb-3fee-08d8762b6a4f
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB353928ABC7E52822E107A9068B1D0@AM0PR0402MB3539.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVHmE+dgFtuvZw0M5L0fdmhHFaifR4GPinRZmBE7FnA3klLc6e5h9qcbxfpB4ckzAaz/zs4TSE/QYHfdtqcvu1s0q4YrFzjqBLiLGqZqjDUxjwoaiG2nbKl/VBFBuToFuzH86SJq363Cii3z6+OXWf1EN24T8YsdYGIgRuiEGMxVUlomFr7yboTL3lUHdf5OJJXunUoixiHB3YiRg7JZUoBrcBgl9a6R7bndfeDI8S5jxyG9fUVA0IHGQ1eFZKAKBrF8x99keeYGkk1T2kTMhRS3NAN+Jac7Dw3kgFX2xr+HvqM+wsTJVDf5+boosoxx+sK5slVyDD272OK0prAy0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(66946007)(66476007)(478600001)(5660300002)(6506007)(26005)(6512007)(44832011)(6666004)(8936002)(4744005)(186003)(16526019)(1076003)(86362001)(4326008)(36756003)(52116002)(2616005)(956004)(6486002)(83380400001)(8676002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ywrFir/PkoDd4mgo3UAVi0BFae/+XvfJwWHkNg7PbMqv+Yv/V5tC9O2Fy/QNxPef259lfzbA/0yB0CCdkB6lPE2TYvGUhzxp3hZ2ZDcPAhL8tp2U+uCM6uh4BpdPIccbEiA4o0gq71KOWE7oTaxhIPRV4Z7lgLeuELePPaThNO93/0jJiKApoI75sTYu27vv9azDJT4oKllJpe8Qwct0yoxDLUs1vtxT7G2jBqEhvTr5MrecOBVXoL2uhR32qC31CbKUDNsXns1vzOG68ECF6d+4NsoEl3eedflvFCwibomB7Olipk5KF+BIdPuVMGdaPD+2ryjqbG2stUz98vajKaAFrMYBzwJRxhOh96LUbM7YmaEumswJM0JeGN1CubgxISAaemDMstVY3SHlGJfu5VKnB/8Hm3hmGRZnAkMiqI267Uhgtw7cDxmK4WNvmaSMY9lUlerev2za72ANS+8ETnJnZSa60WXVcNqRrhXUVEWFrev1gE6YvY5mLq3oojfNwf99miNON+6O84sBtQxkDBssFw3856R173PNiJ+CXtFTyl+bRXrA5yQv8d9TAp496k1CO80e1sYb+6GIwjTWaS0VDRFp9WktibFblxDrRSLzMLWjTj/cb+79By39+2Ei75KsEjauuRsPXkvE3alr+Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e05649b-a4f6-46eb-3fee-08d8762b6a4f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:40:11.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smtOZ901JO3/iIuQ8GArnPm1KA0ATEdri1Tf+B+b00VPwFaMmTuIJIPq7tAB7/DWpjAxaVKC9KJ2hqHBbcstGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cdns3 manages PHY by own DRD driver, so skip the management by
HCD core.

Reviewed-by: Jun Li <jun.li@nxp.com>
Reviewed-by: Pawel Laszczak <pawell@cadence.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index de8da737fa25..f84739327a16 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	BIT(25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.quirks = XHCI_SKIP_PHY_INIT,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

