Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED76274002
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgIVKyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:24 -0400
Received: from mail-eopbgr60085.outbound.protection.outlook.com ([40.107.6.85]:61895
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726601AbgIVKyX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5U7QGMQoWlkm5WiT8nhQquC6/YiNpUdawUbSthq5BPIxAJo295mI2yMhRQ8WwN40nQrJd9J18MQBHBWk8DnkoZO7GHdJzvqS4/FBCYWWxRRnT5Jvn0iLI9YJpdkbQmimmQYHA7jrrDSIZWVRSXrO+UOYn4CRf3e47/SDTWSILYdbHD7tueCF6TV1cfY+nCvn4UnMI97xT1S2cF8HerVZmtngH9fBy/x/2tO+AJ4Aev9xSeaGIGrQoFT4C3whSU9UlQY+8cnlZE3ei8qQTstn3KNfUb6wLba1YReD4sCj5GSLLjXEq9l6dl20xg77SzvFUY1kZUzGV3Byx6U/K14gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bgdhs5OoBZnz7BF//YAw/NcT+QQ36Us3UjmjwbIHks=;
 b=I8FJm30Hb+/H2c3X69PGG8Z0a7Go89V5dlFTyR06Gzo9lUY65V+f5oY+A+w6GhwfLs1bp04oEgnvnhKo3TE/R7dzv6207NyTHP1kqDLOm5BD04V+AiPkvENNNpdudi4WblKklq282ifByDwGhn9BN8UAQjG27XB+kILVhFO5t9Ca2f6LuX3ZJ3gD/Vt8pm4vGvtAIG8NlzSGRIdGcv4Vw31Hwpeo4SmdceX4zUwBczdn+e4ZLo30c5tn2JfiQCI9l1EsXCh6swREs1ccwCcb22NuKDyjRgB8nh5I8N/R6x8yq1UJliF+phqec5/Cx8Q4oIvNVFBjNPiE4VOhv8qy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bgdhs5OoBZnz7BF//YAw/NcT+QQ36Us3UjmjwbIHks=;
 b=D2nW5oSIfRUI0goMK5TyihufTXwBRh6+kPhzkGARkyW55/8ceXP+QLb0afosKqlzaab1p6IohZXMDfQdaYPqNKB8an7g8zFxRzn9Fe07R5HkqWe8fb7wsNhG9e732ozcBBUfywS6h1wYZLgH3nFq5hdnD5TdyOVkPXXr0gMrAGc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 22 Sep
 2020 10:54:20 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3391.025; Tue, 22 Sep 2020
 10:54:20 +0000
From:   Li Jun <jun.li@nxp.com>
To:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, jun.li@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, qiangqing.zhang@nxp.com,
        horia.geanta@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/6] usb: host: xhci-plat: add support of XHCI_NO_64BIT_SUPPORT via property
Date:   Tue, 22 Sep 2020 18:46:48 +0800
Message-Id: <1600771612-30727-3-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:3:1::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.66) by SG2PR0401CA0017.apcprd04.prod.outlook.com (2603:1096:3:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Tue, 22 Sep 2020 10:54:14 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6d99bb3-2dbc-4530-2439-08d85ee5db77
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4255DD0CCF1B5E41565C1C2D893B0@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcA2cKBZXB+6hzFYMMzZJowl3xi+QjRCkgzMqoQhgI+pr9m9DCx5k054yFEGAmSnmEabQB07vwwzoshRk+r4pNXF0QXCQ4+QA9QO5jg3ajqUT7bjFHWDyrW2nTnxecKirpttzaR9w4CgBCRMxiQaMUNg4ULKZ6xohR1RxVeYarkoRro9RQR+m0JHuCHc1XlBtEf94fKyP0faVMAJxlMTwTn61srIsyW+U+lfAl/KyUuIdqyGCgbhDztC96IbnO5OvgyutUdHxFDI7IipZiPE+YGtcuN2VEapg2ASzmw64mBChlOu91uqs9o7E4JDt36ldIQB8/QCkgrsvR1Z0h1Ovg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(316002)(16526019)(86362001)(956004)(2616005)(478600001)(8936002)(26005)(52116002)(5660300002)(8676002)(6666004)(186003)(66476007)(66556008)(16576012)(4744005)(4326008)(66946007)(2906002)(6486002)(36756003)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 663BYzMHabYQ/rP5h3Z8GMzuz61V23Ep96FDMMgs/NoBKhGEmZuN4hPlcZY0/1aJwthbgnHVNe0UWm/fjKuGUcxYnRcnCHtGnGM/RHhJYseBG6WkSJQA6M3/jYApihO2XehE2j8Archs98RkCJgpo03tKberIfHtJmU/aqu+d9fFq0FOPIAFJbUzbWASENm7IkbKuCGXsSAlPBaAgSydJI1RiDLn3Cn8P9TMXVKCjITjyxeozkfEvatgo9YYfkPqgiqJuFDwyheRm56BqToriazv5LJFASHX+2QI1OJY/+/J4JTJbEk5u6BBPVu3Hfx5vvY4x0Yl46yvjInxWBAOJ1a7nxBcTjA5BbkFrpnXMMTmDScltt8da+2HkN3gXNr75CcptG4/rkDtL+WcaUPaSmsjzYVL5QC0xkBnBoCyUZcSLiE8NnkikIgEtauckdRnkulbunewMFtafuW0PodUx9RBJSvFIWB4zQ0Zi5o+nDWBOlkMZatB2K2DV9FNd4obwE6Sc2I0q1PdVZttdmssnpgJBsXeYBi/WM9gPwq5CK+yObwDqfhaRKWOhKsLSUuzhmmLwZf62tmFmDnJYPgCaMZgjm+fJhfaO9Bhg/5jqFAg+oQL6GktWDapBwCVYQ71wYF8pSEYRyAE7DrqyT7qVA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d99bb3-2dbc-4530-2439-08d85ee5db77
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 10:54:19.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAU/cajtJ+H2xAiSUypUjg6CyL9Q3QTV+FAn97dOp0aBVRW8OsU2bn1P5kpoRjB1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some OF platforms may also have the problem AC64 bit (bit 0)
of HCCPARAMS1 set to be 1 but the controller actually can't support
64-bit address when SoC integration, so enable XHCI_NO_64BIT_SUPPORT
via dts property "xhci-64bit-support-disable".

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3057cfc..2b63c8b 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -300,6 +300,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
+
+		if (device_property_read_bool(tmpdev,
+					      "xhci-64bit-support-disable"))
+			xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 	}
 
 	hcd->usb_phy = devm_usb_get_phy_by_phandle(sysdev, "usb-phy", 0);
-- 
2.7.4

