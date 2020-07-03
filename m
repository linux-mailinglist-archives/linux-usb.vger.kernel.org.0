Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AED021346B
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgGCGqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:46:06 -0400
Received: from mail-eopbgr70081.outbound.protection.outlook.com ([40.107.7.81]:53710
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725786AbgGCGqF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:46:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BClq8tnTEDvNWIXDrvMXpKgoCqdgZ7ldjZplTJD82ok20X0ucjW4CQfPqMycwPepKznn4woF8tz1CH7jWlx/WXCw0z8ZE4ZtFOXhckOSZKTtLSg13ccjwmQW0IFp7xn1G9QX3ivwntb43ZUUb0pFgQGkWmSlVdKzlxc11N78eUyy240pRQMQRQw+Q4TbdKCMNK8gGnGKzAWyPe/J/mOLy3mm+FSfT+e/yy834A9BQUjYxpNxCyi0avdp5O+oSQADmTXT4CehI4BHAtvUSAbOpSly04dG2hHpLrKtmNEPe5dVUdRAqfHnCTWvqJ0etgJC2FY6zv2UmQpFgbcBnY5R6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOWszD8Er6id43LYYhoEhQPQY3ZX5eO3uhvTWOuUB40=;
 b=I4h5PKx/zRkl5z4B/uuTOnoZ/bb2gNweAmNgkVN3Z4KLYpKm4XkoRL7489Vd465mrGpUv1uLYiZrJcwidf+o3rlhKYqZ/Rqp2sXlH52lTOuET0pjWYwkWUN2r6Uk5e3lLM6SWJGUsaJ52ELPLrt5FMnKAGOvhpxbgoGS/4OfEN1F9ISGn5HYnU7b96fzT7qt/7JMxDZ2pBmw2GAK8302PGv03XUYYgBFbnSLH1fbcFkQzRXd8gCSjIZzLjhC2ujadAKmzQVShjwiAW0rFfG85QCcARKVWrtwU8RWuzg3GbIRsvJaZSH0ujkPk5rfRqu+mAj2SM0X1i5GVRjirjM1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOWszD8Er6id43LYYhoEhQPQY3ZX5eO3uhvTWOuUB40=;
 b=hd7oPH5R8WvMDh8mWTnOK3WNca+32yp2/PdbHKtERuzL3FpyA9MmBslfSo14X9fnROk7UROsLhjN0xei2AvMEabzcH3jP+JgbIoqRp48lc7txJUWECQIdUCpVlhuBUybyCyghTjEwaYK4NJp8W4nzr7XYS5vKj/9h5Y67NqzBV0=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5493.eurprd04.prod.outlook.com (2603:10a6:20b:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 3 Jul
 2020 06:46:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:46:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kishon@ti.com, vkoul@kernel.org
Cc:     linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] phy: cadence: salvo: fix wrong bit definition
Date:   Fri,  3 Jul 2020 14:46:00 +0800
Message-Id: <20200703064600.14181-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::32) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0152.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Fri, 3 Jul 2020 06:46:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d77978a-b1db-4939-322b-08d81f1cc06f
X-MS-TrafficTypeDiagnostic: AM6PR04MB5493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5493D7A045BF72081B78AD3E8B6A0@AM6PR04MB5493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hwcIirNBai/++KzBeNBK9edACfXhJwW/US5AFuV2EQLCMrCaEMuOoovY3ObRGdJwthS/c1ww4wouVOVazVyoeeku5WEhnwTRQJVKfRBASlEYJdxuSK4dudmS5qk+sG5bUUoywXhXdKPIhKwzuClK+swqYheKn0+QQomNu6lN4wwiymJV1NCh8ypUeW4AUdo3JGj9k541xWgzPxqMhnHv4CmJUTLQ7fLHwVdLP0arYUMd4xTmnpyr28obTyxmk7NMOdCg3ZXrwLiYPtkHh2xxT1G2G9wKYngnYkXtM5V4VtEBrhdWGKtvWVIbYu0ytTz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(6506007)(956004)(2616005)(26005)(4744005)(52116002)(66556008)(1076003)(66476007)(66946007)(86362001)(8936002)(44832011)(316002)(478600001)(8676002)(5660300002)(4326008)(2906002)(186003)(16526019)(6486002)(83380400001)(36756003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1G0hm1447avp26Zd3iSAyJD0tUCXd/5tGaDWFuoD+Irph+yhXSK1HFtx7jxMjqB1tWmWgxc9zUvPgnePQ106/XDGeo/gzvo9GdEs3S/HuzaUPPen11/WITcBgF8JUlMaJAAvUtjOk+EVRVNm5PFgeGQum14IQv6eeI32SzE2KjCko8Ey++87/dXmL8wkh4vak1i6Qy36S+yuwuOdtvsx+126Qr4MM8T/jI5Jv1PVFtliXHLYUApJS2DSkQJzf9FNNiaFhWlplNzHlfG3JBx/8S9R7KRONfWG364u/xCU09mZ254C6IwVmVoAezYqGg7xlQRLliUETKiKd8PSUN2AbLAdjdliBUbU4PEdkg4mHYdnZV7LTp8GHu8Q4H5basVsbkfW8vgrbetWZJXRiBiHaePAZb5oCGUyI1fPvCYQ1DY8AJ8QiOSCP5Oxh0zwx3cgGYIXfoFnq9bzZoZMYtQlr2oW5cYhScL/Dh7uol1rviS+Ij8FAN6GnxGkWXkb0BJx
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d77978a-b1db-4939-322b-08d81f1cc06f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:46:02.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFktgHeK5Qcl7qIGSNo+1vbzTaD/OemQmmmcqJeLPsVfyNOlC+aDR5RWOjL8rlwel9a5EJ039Lu5Sw+tIUKSQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5493
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It fixes RX detect wakeup using USB3 device, otherwise, the USB3
device can't wakeup USB PHY when the PHY is in 32Khz clock.

Fixes: 50d35aa8c15f ("phy: cadence: salvo: add salvo phy driver")
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/phy/cadence/phy-cadence-salvo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
index 1ecbb964cd21..016514e4aa54 100644
--- a/drivers/phy/cadence/phy-cadence-salvo.c
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -88,7 +88,7 @@
 #define TB_ADDR_TX_RCVDETSC_CTRL	        0x4124
 
 /* TB_ADDR_TX_RCVDETSC_CTRL */
-#define RXDET_IN_P3_32KHZ			BIT(1)
+#define RXDET_IN_P3_32KHZ			BIT(0)
 
 struct cdns_reg_pairs {
 	u16 val;
-- 
2.17.1

