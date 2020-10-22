Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6479229561B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 03:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894767AbgJVBkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 21:40:18 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:61966
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894744AbgJVBkS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 21:40:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etiVMYPxp04PcP7VsgZP71AceeTMO5jhRX+cxphDxBRxGB9CTzrIMEbSPdH3cDHjI4ZTkYxVYOuwPixVT5lxgiWbWpwy4jlEk+yPGSsUBt7VTCp/br+/Bh4aXFEOJcpkwVEV2eEUJZlsd7T7KssR7FSXK8bW6vi47rH38S9Mk8tIY21wKoervwOBZAyCAsZhdRKJmHfK5elEeBD4BrwVjaBu+EvFbBNkxtiCIHIF3guiBSfxgzJ3OWHXTrBOTQPsWuxPLFm/xIouV1t8PLYsupTmZt57/eEUvX6B3hiwIAAqVs0zI4r2MHQVUNFTU2ZR9yw3/ZFCwWMX15DO+sYM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1gyZSRk77KS5XfPQ2ePuD2gn4hDkc9lOhCH0pZZR8M=;
 b=Pd5+lGByfDWDyj4VdGLRVPoEK+hOiawydfRTDSYauQhjspiEfNXZp8nNXRWGUbZ9KcZ17ljqNfWFghDz1Zm2Jn5BOYFWUDfbi4bS3dK1JIBHIXjSBFfmKH3FLCgKXtc7jJJbY+YW5GCSxa5wnqFcqLAPL7kQVPpgQsgGzWkc+Xc4o+e3l99x7Jcyh42fqpzjkfQ+x1PPW3hmq58RsgSQi/nhSusTdYxnO9btFfZWDGj+OvX5rM3v89Qk/h1HflU+ftIMbdhpETYH0Xqtiw60ENpZj+2UBhmLGw+mUFlW8h34ztr42lI9YFY4EGkJCfwODkKdWUWmBPi3d/obOPnRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1gyZSRk77KS5XfPQ2ePuD2gn4hDkc9lOhCH0pZZR8M=;
 b=lpf2cKdPHveSZbmpGBvvGNbKTlAYzHzIjs94Vp1qbwhwara1bRthkhylii2P5r6QohoUwOqB7U9Yvhxmr3YFoPejrul8KNYhgz6wpGF60O2bkdVvAe/uPPmvL3YSkoaSK67vc9+X2RT+HAhJYQgNO/kxrc3n/vaY/bfI4fSMGog=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3539.eurprd04.prod.outlook.com (2603:10a6:208:1b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 01:40:14 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 01:40:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 3/6] usb: cdns3: host: disable BEI support
Date:   Thu, 22 Oct 2020 09:39:28 +0800
Message-Id: <20201022013930.2166-3-peter.chen@nxp.com>
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
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 01:40:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00d753a4-6bd2-4daa-fd63-08d8762b6c3c
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3539:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB35396DC8933F473D392EF0848B1D0@AM0PR0402MB3539.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZKwxdJ+EL2C5xVmAMUQ0CfINNxeNKnAAqEYlhOTe0VfWDu59C9LOT0f/rPoq1Xz6drsV/Hwr76+Zw6NF0gUox3qDpEgC6qeTWoYNhaBCZgfpbA6FyX88/YRaqtGa8QUj1HMU2dka5Ch+H4w99L78E1puK34QycoVARmRqJ3vp2qMvS6P0chT0zKl95CIWm4K0dHAEqsIVfSRG9JoqWfu6lTuM5hhtNuXIeSx4mas/VW5Br8pAdX47T2ScApaSEts6eDev+U9qodRaBiV0dMl4exFmOX4EHeNAdrZ8WQJvISUTWWHqEFBSosK+v7XY+tPgC8kmq55PsXniGea3cxTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(66556008)(66946007)(66476007)(478600001)(5660300002)(6506007)(26005)(6512007)(44832011)(6666004)(8936002)(4744005)(186003)(16526019)(1076003)(86362001)(4326008)(36756003)(52116002)(2616005)(956004)(6486002)(83380400001)(8676002)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QQsfP+Z/rLpMkbxE6IM3EOOEWabIuITF2kNZXX2g/IQ5+ZIMoJ5esvbK/h7dQuhbIQvvUwXfjnYCDLLkzW+Xyk0iJzvXt5be2J4f5dx1OtEhF2WhAyO94LcTKFG7CovBbIYqmJKSf5BMTu4TATdCKaHnOHiT/YL0tp3TL7ypAkwSUVenqaz37sC5aaHs+8bpB7XsxzT7ZYH3DIZuZgrJFpen6lrNr+IeIMuV3A5/Gp2bnQFuthJJ4X4Fe/Vk2Xw8LXYKWV4T74XskDRezYdSoUoJujmDfZp86tHOzIYDkywZjpUHr51N3Az6TjDa/TLIFxCMNm6sgGh9R4VPuzIzjWlfSbWuoflePLCv2RPJzWgEwoyB9VT0yoX+oL/suO/Ff0DfOdvUam2uFro+8MygNn+JEsbhCHDEc6wAg9L3xkC6uUtnAFMVsbbw/JC0WrN3pLfTlrFq+GhcHI0TCZVhK+HMuK+1BLWA9g8lkmx5iEg2i1sR08CAHgWkxgvVSlSMUnc+trwPojT6AD1BcY2S+6e6vcbcT7RnxeyKB6PVeOEWtfWJ/SqO8nSuJFE8BYR8iPFeADzPynkaTINpa61tdfRV7b7zq7kIZHHixTPH88+uJq6/+AdR8iXs2sE4zDpAPdHCj1JEKGTsojCgS6TOWA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d753a4-6bd2-4daa-fd63-08d8762b6c3c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 01:40:14.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y++/+fl958eKbedTaxtY55WvRA/Nt7hsYwhMCz9I9rfX8uh6ZZxjb/tyjFX9Fl4spERGkIp3/80vfBIzuZ77wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3539
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Cadence xHCI doesn't support BEI well, it causes the disconnection
of ISOC devices can't be detected, so we disable it.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index f84739327a16..b273ae2231d5 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,7 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	BIT(25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
-	.quirks = XHCI_SKIP_PHY_INIT,
+	.quirks = XHCI_SKIP_PHY_INIT | XHCI_AVOID_BEI,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

