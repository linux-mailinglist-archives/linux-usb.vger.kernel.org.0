Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37E921341F
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgGCG1L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:11 -0400
Received: from mail-eopbgr150049.outbound.protection.outlook.com ([40.107.15.49]:37606
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG1K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrfttDjw6v03CJJOWzHi9faQvtu4CthZD/iQraUV8GdoOhqozfeeuuLrs5Am97WW/mmPHJF4QkwcugNZ7S0fjebcmXEoHDPk4N/x1o3v9zBuEUBQ56jy1LbDF0tujNtZ+WgajVWL/5D/6J+9OCEwwh7Clrxzy8YfGz+4ykBLV6HN118J/r1YICRd/uDYSaZf3mm+YBmLCDhCIADmnCfCBfRCn0fEq5m1wSYR+KZLI/qs49I+LaBmrCxxauOUsHH34jgG/pLuaDTO8Xy1LGasrJOC6jh7DM03S6mVs46xZ41PFEMgIo6tmNLyDdg2zAIrDM7bZ97KmgOxiqzxDwUl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYBwFIPI1hjH7xN7LE8t80TTpuQEDF4qeg1U9pJXluA=;
 b=GB4e57YOGvN08u4VrEV9UGHPQVlZPAzN6aX/6YTbldRafo4T8wzUfkhEZgZJQU+LF+NFZkx234PGm8uukyPj1t8/G4jI/jHEgZBb4ytUD2mM1u+PhCkB3FbJFCebu/XeZ6l0+fM1EXLoUjL1XAfR78Kyb/VSLAkd5krOlNQ6t/WCZT4tcO2ezgBE6lbX35BwvoiQeB7dJ30H2nsgWtRG4J3kc7QvAELiavguWsw0FMLuVCnByf+BgGCsMOvxi3jFoGmo3lcjhTzq42/fIVqqpW0bkrDOR/w9AqcPWeKHcZYWU6XHzQoKYhTwxOzoO9IjjgcBbOVBW2rDDgRTomHEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYBwFIPI1hjH7xN7LE8t80TTpuQEDF4qeg1U9pJXluA=;
 b=rRFKNw13yjVSbee6xj77kgNsYk7I4xVKFF3kYtmaYWj56oKMmEkaTZmzDeXMZrQgQdnOZWkmAtY3xY8Eng0CgTixWURX/jKFp09D2q6NJPkR+RznoIublL1Lol0t9hbsRoP7zy/OxHQiJSscB1LG9d9EYH/PjN/4yriXCHrdjgY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:07 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 4/9] usb: host: xhci-plat: add platform data support
Date:   Fri,  3 Jul 2020 14:26:48 +0800
Message-Id: <20200703062653.29159-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79e4a0d7-05b6-4cc6-0a9c-08d81f1a1c33
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416635DE9731F71414DFAF258B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fA2JN9W47ZB4eGYi40rK62f87VD/wIDezzBxHrIu05ikZMal+zt9U6JHoM1NVRYcLTUy166XlO6ae/VfHm7fyjPEHrrI7TqCuwAnbs5LdwP0QDC53F0r0XK4sfbGEFmxmEmu44Q+ELuU5tR9yGuG9NOfVo3zjAtrMy3Ug2mJ//cgGXTvDhkXngi3dCwlHFUrCdoqjDCEpkD2aoLHjnOLV8zBl2yzvnNRnybc4z+5UY2nbCKVQxwCnTYNAQJUZFyj3T21fqajXfb2DBn/jMWlTpsQpY+OymwCC4hrRVEb93N4s/VMfBJhOxKDgV84JyMV+/OljPswTV8Vryzs7lQ2YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(4744005)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NsJvh+2ugWuLPpaS2miqI4hxwXMnI0MvB63GuqMDcC1iaOP0UZkdpB/8wijAhX2xyMIDAgG71N76hNWlu9KOqr/01LY9NTj8FXuSPtlNKq8F2Xdj899N5q9M3s9PZZZ4l4Kxok0ecb5Ymf8AquDD1gaYMKdUqP2F+B4mbnUImCctKZ4MU+SowUd8/CO7ho9gllJlNCXFXFxlApQxjF207nwmTmPQT6nSrrbkmYWZAx/BvZHIhbeyX9XT2tcfJ8ytmJQwu+9YxXAzo/Uv78TIXLDJh13fYuwoyp1amMQXhrEsKkG+lem2oHs+RgjP0boMgEZ9sX7CFpT1MUnMMR4rm082ctUtqfZjksdNt9/IvZ00nLlccmYtAw8+R4BSiQ99/6RPCfGEJ96MJ2sBnYQN+cfTuumPYrLDmYjXk75KPBrnx7jGkYpEl9Od7r3ChpDoJ8dBRdf88dHLJ3APUYxt9uAuquk3rKc8r6seewPoEgk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e4a0d7-05b6-4cc6-0a9c-08d81f1a1c33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:07.8480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ5VYlD73NyNiPnQFSJhzTXFielu53ZOf2n2ynlwSvtGgMfy9SqxAvQGW3GMLcRtbPECmkxk0KO+SMJYoW5UGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index f6b4089bfc4a..38bea2b6a17d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -264,7 +264,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_reg_clk;
 
-	priv_match = of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		priv_match = of_device_get_match_data(&pdev->dev);
+	else
+		priv_match = dev_get_platdata(&pdev->dev);
+
 	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
-- 
2.17.1

