Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D621F398E
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgFILXf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:23:35 -0400
Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]:16387
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727002AbgFILXe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJKAoNPA++pJxi9YS9TNhoI8L9Sx0ezX40eUUz69QHcBUwkBpJFMbvnAKJqURxatjPblhh8v0aJFVagx+ePsGcH6mv6kpduNWZlZPbf9/9IvAX/iftmhGo13uhVvMHuGf5Wyxd/2w/OooP8ZCrzY5j9lAVz7Of4jZSHMvNTVFdPmOO6wwovtKjms3uzfx/bXH4M0qBcybNWI64Zf2qs8C82Mr+TQGvvr0cDmLMpbvNJBttma9Fdh8Hre41OklZ77rcVl8SmvCcCHZTAcXdeej02L51eZCvyQMr9BOYp6zAhQqSvASJjUZkRL/XPRAdM8V7+qdKaLap+dK3vqPmu8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv3XB6qa56EONpEJriDStQuzzAVRkNHkwbq3EQLSOrA=;
 b=oClf2DvL1RHr5xOYjIeqoooEqcNkNEL8Pm6+F5OHyQPUz5kmpsuDpKftqq1cFqI3h9DGcUZIzQ7RnwsrrF+9fMiF0+413/4P05Js4pFW0j9acE84tZN4UDdaCGy/Ljg/K1G3wxPIrd7N5IVGT2NN4sf8/y72efdXKy7fUEbhWb8UQAK6OxKznR9wcIZWMgpErQW8Vk6OFv6DvBvy+FDsLZ+ZPygIFJSsy42mxQINo6OYF4xRs30GoSBmZSz8rSK7QjwSCLHMgy74sc60kRa5BCi84/w6Wjn8/7dbBffWvV4MccE+qE4+6LN5m18ghI12d9+1fJx846QE1U9mtmLzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv3XB6qa56EONpEJriDStQuzzAVRkNHkwbq3EQLSOrA=;
 b=WlbKWVuI63VZ2hSfqnEk0SICGBuhnRp8O9w1r81ZV4aAu7Lq4TqehTEPnQC5yUnSjDg7p94Cu4NfYjtjMlXCA7bmvveB7d3xl4Z3fl/bWJBLEomC8GVVuM+eWZDIdEiTrjR111bIA/4HFO4M/aVmaiP/UZhYLO78oVzPRKuSZRo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6622.eurprd04.prod.outlook.com (2603:10a6:803:121::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 11:23:30 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:30 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 0/6] add NXP imx8mp usb support
Date:   Tue,  9 Jun 2020 19:12:39 +0800
Message-Id: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:26 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0ffaf8dd-0e9c-49ed-bb5a-08d80c67894a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66226179542B87567D4DB34E89820@VE1PR04MB6622.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3fiBR7iHRMoiv/aSxG2Yt1msnLanSIVZzIouLR5on+y9bBtHaSzgLojUk/k3fzuARMrcIkUnocd+JEyanYB/jqiTzmnSVr/Eo5SjTkzOa1CobQ/85OegpzLKQu4kmkdnsAHqLJY8bPGHbTuL7dYABgldF7FyU8omex45Da17TEaLcj1Vkdr14DAWG8egFTQhbeunrwMzJ+wLC1OW0HlrInvrFOqBQOUt1K53UdKHCy+nGQ4rGnPEP6Lrrn17Eggk2NC6m0gDZv7j7kpv8RPeTEFkE/nbltNBUz93Vbv7Df/F9GX0l8SoycPIWUZMFDo9lEpDLEdFmfI/OZN4Ldksqn84rlKY36BLeuzbhI7ryt46Qgo7fSdhqnH5RkDhs8/0O9yXmxcErw+uiZFFMpdyZZ9KrRsZxuew8+FfGRi1gYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(6486002)(66946007)(5660300002)(6666004)(66556008)(2616005)(956004)(6512007)(66476007)(6506007)(36756003)(52116002)(2906002)(4326008)(186003)(26005)(16526019)(8936002)(8676002)(498600001)(69590400007)(86362001)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ZLjHyvMqpkFMGhq1VbUycdjOnuwYZXkQ2UxygkoBaXg1/RGO0dTCClSrAD8lr9zb33pSQ9V9zIkNnXUSy7lCJMiHpTOC+zmA2YwCAy2UbeCYx6JOW3VjW/ZSbMRb3PzYoAwmBBQ7STUkRN+DSyjTJ6XGg7aJ+tKeFmZVj0Ztjr5y+jDP/bRjl1Cfd2iApBtY/NDFdTfYY6OmlvSdsYGEDb4JE7Uir6cuKWvDoatp8UCfbtb1lImH6RczrpXITVRLrFP2+cF6PXRjBa+lHOd3bffk6CsGbwqWRMgVEc+gDVUzFUCbfQEjsPBNPDMW5rYkA6xRBCHLYfQ8K321sGB6U1s/2DIQXppzDRYIdEHkjpxxcM+v6wZWEYu9eyvmotc+kiMmByEM6Uel9vLstgAT8XbTAqneHdZxv/O7SAs8fpD1PFqBWHjAQBoGUmx34piuD4xwbTX99Mwjq+wFckRFsdWcls+UvgIX+fkOOCpjq84=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffaf8dd-0e9c-49ed-bb5a-08d80c67894a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:30.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0monRi99rU5z/hg9XkW8GsQ4dc7hOpAiCAhEgYNaV/itOUgqYzK6Qfto7/uJ3IS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6622
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

NXP imx8MPlus integrates 2 indentical dwc3 3.30b IP with additional wakeup
logic to support low power, this wakeup logic has a separated interrupt
which can generate events with suspend clock(32K), due to SoC integration
limitation, 64bit address can't be supported for host controller, but the
xhci capability register HCCPARAMS1 AC64 bit is 1, so introduce a new
property snps,xhci-dis-64bit-support-quirk to enable existing quirk
XHCI_NO_64BIT_SUPPORT for OF platforms. 

Li Jun (6):
  dt-bindings: usb: dwc3: add property to disable xhci 64bit support
  usb: host: xhci-plat: add quirk for XHCI_NO_64BIT_SUPPORT
  usb: dwc3: add imx8mp dwc3 glue layer driver
  arm64: dtsi: imx8mp: add usb nodes
  arm64: dts: imx8mp-evk: enable usb1 as host mode
  dt-bindings: usb: dwc3-imx8mp: add imx8mp dwc3 glue bindings

 Documentation/devicetree/bindings/usb/dwc3.txt     |   3 +
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  87 +++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  32 ++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  79 +++++
 drivers/usb/dwc3/Kconfig                           |  10 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-imx8mp.c                     | 352 +++++++++++++++++++++
 drivers/usb/host/xhci-plat.c                       |   4 +
 8 files changed, 568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-imx8mp.c

-- 
2.7.4

