Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C997E1DFBBE
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388169AbgEWXX3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:29 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388047AbgEWXX3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmUo9/LkZ525B3bkCV9yzS2g5PbGCENezj1sKbNdDvY7UD1VJ1j/5uC4iyco4ywJ8329hX6gO99bFW1ckQ+L1/hHzJDx+0MPzm44Aqx9HVnj1aF/zTN1gHwUAZU716akkqB9qOCX6NqQ5HY71EeWYnUWcgC1pnMfeh4atAiqU0VX44mYsXyj9FZIePiovnGh64cPGPN9rAxL666jdRu9jQn85mP2Yh5/LbKKLreymB/udwgNZz7doSSi5sV5sazBdT5htt8Qy1DnFIhWIwfNFtUpUAvzC1p7w1jIPTxXR6ycQV/9M1yVpMd6cIv+OqozVs1ai6h2B5o+cYL4JoeA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFEnKAx9z8Nqa3HrPCHrL/GMcHDUpPdw26EiTvUC4Rw=;
 b=PtcdOXOm8wUiArkJCRn0Xc+Tgw3+PG/OqFqaLoA124MDItS3KMYBab/i4qmQjorrSTXR/YKFxEMggMnm2IEBvX8t+YeAo6mDutJxKfyMyDYGYFaB7+3H5wttIjXWMN+Mvl/OPalAlj+tOUYMcVGEZcjytx1QVA5XEmwKGKJ3K4spC5ITQpjuilvI+UsLChQdljzjPYkW4nLd5SqjFvni5zwmQEHSSYI/fsmAmzLAJrgtusYHs4AQz8mxDZn7e5OoKVX6L6O+y19SjnkjJZsAwu13s+lNmMapop0I+BbCUEQUWpxJkwtkYLZ8qzo8B2nuegJTFoCk2rsNinLiNsac4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFEnKAx9z8Nqa3HrPCHrL/GMcHDUpPdw26EiTvUC4Rw=;
 b=TybqJ9zZM+lwXtCYjbuh+2TNgQTNMMAa2yU2sLoGg3ZwlF6OpFUTCuecPH5LIm5HynRo/CO2SJlJxF4371TD5glYQvFsJ7T4nv9QhvMrRR0YT71QZ+Duy0neUwk0eegZU0CudjkFwhi6CPS+ueQjsUYynVKiS7BVhOds71zSNG4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:19 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 9/9] usb: cdns3: host: add xhci_plat_priv's flag skip_phy_initialization
Date:   Sun, 24 May 2020 07:23:04 +0800
Message-Id: <20200523232304.23976-10-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:23:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f5aa70d-436e-4e45-7d31-08d7ff704726
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6918E73B0DB30D79904C2D758BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O5pgUyUSeeFcSdeWpozLbQdW0vZVvnJBGCeh71SlOV9KBprh4jsWyGY2PJb6VEJbQuKvJqspDRmD2gysmwupI7xn9Q5RnH2p+JT3jAOmE1IWGBMfTNyCo+TgMvIUwVqXEFxsr7/UJdnhNoI5eta8jqUDVD+m0JDmSwwC/AqKhj6ZAwtw4oPLl04nurAUi6hn8wL56cswaIg12S71uuvFwtdydjfG6Bu9GW8cskDLPMLKBVoKCyjOsF1PUJU/Bm2SmwUz/1dxwuMzqnxNil0kRd0bL5rFHSoe5RnzVgUdKI2hEVcfi07+mCri/LSTSU0IN2mJL66ZwQyXbvDDfXu/Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(4744005)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: jiFYeJPuZed9uNkNATJm04849k+fdO7ZV0MbAjMZIQveF/Cw0OhmD0/K5t/0AqCU4LE8HXAFUy/cyiSqLpQG9jZEoauVqgGJ17vrsU5tr/2+9NQeIyKtulioFp+msC0JaPG7cgjLt3YgxSWIB3mHTxHgmBRlOFjGJOSFedYs2XF7AClQ3PQ/jG89mPWK6m7ATZXZOEgqEgGnSEzXgcgzmnQ+HDNHCiq5sTz6xJdIJTu8y2m+S6mYL/swaqqvyXeuyMRMk1zt9a6RrMagSeuVZ9vdCFJrIr6wgc30EtEYdl4UMe0i4MlwkppQ6z4Krs6TCNsgtZJ/DmhDYauEMj/lUPFDbOl1S6FkogI3QIrf2pteO2CrUpTM1gBNzuiCEYP5HL6OCHnHyT+0F/1yPzDXEBZDvvzQwMMX+NU/Lyy575KYeT47RpUTXCdVDEdOGScnelv1+zcytbN4UjaT5A06+7O7bGo3yU2qbCaxo3VDEwo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5aa70d-436e-4e45-7d31-08d7ff704726
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:19.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiS7cvYIRJDBnxrxfe6QbSyGZUh4bHvdS19AxzbnkCrIHGswsVrHN2vH4yGMDLQOMrPK9Gm+JLAh626GtDELOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
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
index 030d6421abd3..d681c3db25cd 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	(1 << 25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.skip_phy_initialization = 1,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

