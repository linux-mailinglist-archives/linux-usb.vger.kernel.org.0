Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02641F398F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgFILXl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:23:41 -0400
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:15630
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727002AbgFILXk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvAqLHG1vHqS9ze0oxIFTgVs7h5Utj7J2aTjhb8iwLamcESJfkEmJjXMdghysdP0qlJ7XLbWyiYGPcelB+wLxKiLyTcoP6CBfZTU9vWIkYLY8j+HITW1oBenrE5R16q1J8GSzHBuuTGUg5usttlLmeelht1qlE4y2nyZGUZhdvZxjz4ikKQr1D8H7gD4cutiWps7X4QC4I9KQ2TLb0YaaeQU6YAqvwihDFUkkBhWRSlV9fQUJlEyFSHgDLmUgtcfvPkcPmXFn9A+nK0nMZTxcHLKUquDvMYSfBnPuHziQ4QAa4JITyLKdW9GCOB2PXKWukcmjGZNxD4PDnNVYK9rvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL08SX8hcrkb8eCwvF3PVaHOTsY9yVgpEWR1bJY3NIE=;
 b=J5Nq/s3WvNERBE/ZHHmBgFJSO1vgBe8mAd43HmTLeMF/BC4skXwCuD7Y4SzJ5X3q3JD5J4DLON8XGwreVdyJuFpwCBPFBXlRNGhR6vQYLEFPvax2UaA3czm3bjsb3rWJj7QFsCYqEXoxF5cjZH1u26MATt/3sqyL4JNf2YjedlbHymCukvd/1ZOuxM4180PGBPSG7kmvQEh0JNHGgyCuGCV5i/Vfu5xGjIpu0OUCcWD3ziwv/Ctq1Pa4cvKY66c+FOMkNmAC44XM3YtSfwzGkCKf35+rQBLUBfMaCQ85StXqb8UY0Uw/kKtSVYmWoNhMmS1UGesidPUr26VonVeMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL08SX8hcrkb8eCwvF3PVaHOTsY9yVgpEWR1bJY3NIE=;
 b=N5SmyOfOBi5eDfbswmyGAlE1/3/e83QuVrkXYOPVs3JEogrqWcndVRaFSzeUvqrzGuuhKxxIiEy0IjtdvCQqlc0LZTpr/HidQfKMMNcrIUGf1/2FbCtX/CNpoGDYkbGERvSZM1hKsrTYJViP/JDrqUGpJn4poCd4h3eE1tZtUD0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6589.eurprd04.prod.outlook.com (2603:10a6:803:128::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Tue, 9 Jun
 2020 11:23:34 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:33 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 1/6] dt-bindings: usb: dwc3: add property to disable xhci 64bit support
Date:   Tue,  9 Jun 2020 19:12:40 +0800
Message-Id: <1591701165-12872-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:30 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c22d46b9-71ae-44ab-d7c6-08d80c678b85
X-MS-TrafficTypeDiagnostic: VE1PR04MB6589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6589955C634B9851922DB93589820@VE1PR04MB6589.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xseajbf1z4AGIpwOFVi7GnBq+2ydpcb8eDBqbkstK5g0kfTIHSCj3De1mfar8xxUcrw7/btVWleIKYUGqhyhQfkuv5G/lA0p8ajDGF6xfX7yFXsIG79XZrc3LW25Ql1nEpJ1LdDCzKN1eK+OPjxFpGoYtsXNcofEK5ebB5CDvk6feCHM9ennCXtVEgHPt1HuR2xB/2esLk+tVrCM874sG+sWK6APnepOceL4gao/DCA85PDpenTHO1mF5DJMdL7yGnrAd6wBHLRLvpnRLxU7rQMjW4gkwqusJ3vu1yx1pYBc7UFXYw+gqlvRt8itdPZB2VOhaCJz1FaCcmSa001/bA+AmsSHUdBCinniogf8gWSC/6THRGrNE0KZM2IgTbX3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(8676002)(4326008)(8936002)(66556008)(66476007)(5660300002)(66946007)(86362001)(16526019)(36756003)(498600001)(6506007)(69590400007)(2906002)(6512007)(26005)(2616005)(6486002)(956004)(52116002)(6666004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yt4j/eLc0PELDZrJO/bNPwz3gjAm7QANAOd55xkPzqZHM2t9RxPbCzevNgXvTsPBrtAEcq0xprbnvXWQNRtYwwfgcktu0OOWgMr+JsqRPU2kwxtYLuit3xP6ZTthJIAKRkxvyWeOKJt8kPv9L9R/0ASlBSQS91mzQSSmY9XabD96l6vP8mK4jxSkAffeYwJX9E05xZB/aKYoxVMD+k/bi1ViM60EwSKescwjVIJSbDUBVQj9lpXJuzvmlhsqWDzGthAd0qzdzqvlXa0klE6Cep4MMDhJa+DAWslNKTiyJwpRXAKPbrrrCPFnz9M8g5x95e3Wk22tqRSP8au5/0EUKBBhlfHdPQflifLW+ljz9dbuBWwGDan1sQV3nyxdlWwE+y0J8eoc/X0xHC9ylLO/E1SaxeR3soiJqxJMtLpYDb5et5JkyoO7ZwsbIyE/F7WMvWJSqqh7Bj1wZ6ua3sbBoBseZrznSAJbmbtuwnmUVqo=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c22d46b9-71ae-44ab-d7c6-08d80c678b85
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:33.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jF+Hrzgk4oF7GhVYu7IbKr0hUCKehPcWZZeuA2wk1mpLx5iHz/+gmltItiZoHVNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6589
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a property "snps,xhci-dis-64bit-support-quirk" to disable xhci 64bit
address support, this is due to SoC integration can't support it but
the AC64 bit (bit 0) of HCCPARAMS1 is set to be 1.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index d03edf9..d16cba7 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -109,6 +109,9 @@ Optional properties:
 			When just one value, which means INCRX burst mode enabled. When
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
+ - snps,xhci-dis-64bit-support-quirk: set if the AC64 bit (bit 0) of HCCPARAMS1 is set
+			to be 1, but the controller actually can't handle 64-bit address
+			due to SoC integration.
 
  - in addition all properties from usb-xhci.txt from the current directory are
    supported as well
-- 
2.7.4

