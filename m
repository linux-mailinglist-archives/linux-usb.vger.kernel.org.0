Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E2B21341C
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgGCG07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:26:59 -0400
Received: from mail-eopbgr00087.outbound.protection.outlook.com ([40.107.0.87]:65506
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG06 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:26:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evZbAobqmvHF41geyBEMuenL2MOIPwekPodUDe3idZmhdn4NQ+8S4EoPeaWO2WbW3YXym3LtY6SNJpJYh5MWUIlBxK+6LgnWX+SINLLVJz33mq8A5LsHBQaPxhocPPIv0NpKzornMhT7GUsYMPblA7ipIqjcD36Xs95SmzdhXZX/m6LHMnNIzg7WRHuhBrWIN2H3AgAS7bQnF75TcJlGmzKxYSNI4Cyasl/RnxIS5nxHndSMtePBISgJ4fPih8nkBE6muGvlHH2XoCSX5gHheRWlAYcQVKpKggveUmWsk5DtvkfUCLi1G+JzYGW5x9e1O3gFbSGt//YAfmK2T4gXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU4nAjUfnS8x93/F9ExbDdu+Q7IirsgbZX5Z8Xc4hVw=;
 b=eAyw026pw9BISJMnWZ/06RoPKvbZrumnb3rr4QkJKZ+hP+t3pPr1yMIjPVilU4oBN6ylvKoIlfabYjCLEo1HYk/WcAxZsspcfyL5P1CA4E3A77EMqGKNgxM2+TJFsYk44qk9Gj2rcqSRF9ZdsyYENzBXTwXdbuY3yydT3E/OxbE6h9R+XW4dYUDv7ZaQB/QWp0AH8oDVRJpF4Y/YDapep64SKZP433lEYSWg8K2wEVJVuv2CICMxyFlJcxzY7B+YamHYm0QtTpPsHzf1X1j6POPMLvkw9qwr8NRYuHl2flF8Rf9CK3vsZXQ6IKKByvpnLhwl9ZQvI76yYj5z949gUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TU4nAjUfnS8x93/F9ExbDdu+Q7IirsgbZX5Z8Xc4hVw=;
 b=BrZXxEGAKQCLrxtLKIDoFh7QNQMKHboGjTSBE/WaxPt+omMGc9TXH82e1n410+V0M90aUSTjr1R7AYSJosulWkiqfC3VHKsY4KOyV+NhADinIW+4bxgvTS1AObR5LqTPRHElJ+Tb76WP5cq8HT5aEQ3r6kf3ffybQFQPtf5kr+s=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4758.eurprd04.prod.outlook.com (2603:10a6:20b:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Fri, 3 Jul
 2020 06:26:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:26:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 0/9] usb: some PM changes for cdns3 and xhci-plat
Date:   Fri,  3 Jul 2020 14:26:44 +0800
Message-Id: <20200703062653.29159-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:26:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6fb9b3d-2265-4f47-ad88-08d81f1a14de
X-MS-TrafficTypeDiagnostic: AM6PR04MB4758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB475857141D5F1C6927F208B28B6A0@AM6PR04MB4758.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OY0w3xVT8lLEWD3MuQRMP/dQ96H4exxLXOwDyCX5XMYfJmS13YEQizIFQ6K+DJ7LlYQ9ckMfruFaG3usQMmKLSmpk0LdS984FMbT8bIQRunMAwvB4lTrYXHqzaGv9Gxzgj1s7rcIt2Ibk9ydaV4aZhhGFR3vLjohnKz1K2oS51DrSwIJN2EWbl2B/L4qXWHHMsr07MH/ox3eJotthCJ3KGOavUHklMsZU3Qi/CsB9wvW+x9vkTthEJaaV7BNcnjc2MpcYYm/GJykDGQZUuCzMQ2ktJ0iQKDYTDE29o3UdD2ABT46U7OS2gRlDa0/P04j6ywN0+MQClHGdh+P03hiiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(4326008)(478600001)(6512007)(956004)(2616005)(5660300002)(6486002)(36756003)(66556008)(66476007)(44832011)(1076003)(6666004)(52116002)(66946007)(16526019)(186003)(86362001)(26005)(2906002)(6506007)(83380400001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sx3gvAggDfxeMSj0FEHRmfoXTxqpc7Wim80TxDPSaaRyQ5Yg9VXPFV0VOxHTng1h2LwBAf+oL1s6R5F8cN2UROgAVX5knY8fGgLyUPL5R1azwedjgadJSIsl2X6NUsJ9uYx/bemAFxzOSA/YZi+HrBNBaGNbKPbTTyWBXDd2V6eOT4N1ECJ99oXrUy5uFCFDG8bgawyP5BgQOqE79qNsytcbKZC43pXkBpEm7GZs76SZkIS4aJRo48e83BPnn8iYLSWRjHOrqreAqsUTgzfhWmHDw//MnWrvltzrhC5+vreJ1bHG8mRqzDt7/MLqopgjkrWtVd7u37X6PrWH5UuMvzPgvZgv62MD90H7NBtOrIND9i4GFrqAiyql8mDBgnsUXuSf4bYTUCLm8AlUn/vUK1ZKzzC/5N1w1uIwG1k9HWnxhqcY/wAkIRCK4EKj63CBCPL/ra2L/bClgpzVHePWXZrYd6mDJ2ifEU7q4A4p7iU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fb9b3d-2265-4f47-ad88-08d81f1a14de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:26:55.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc177bUXE189KwU5dpSWiMlL8hmoilSLeaMp3llaZqxkURSWQxg6O6WPM8KET6lFLnBf+RGunoUxV8wictZ3iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4758
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe & Mathias,

In this series, it adds cdns3 runtime PM support as well as some
xhci-plat changes, and verified at NXP i.MX8QM and i.MX8QXP platforms.

Patch 1-3: add main runtime PM support for cdns3 core and imx glue layer
Patch 4-9: add platform data support and two quirks for xhci-plat.c.
- .suspend_quirk for platform special sequence between xhci_bus_suspend
and xhci_suspend.
- add XHCI_SKIP_PHY_INIT quirk for skip PHY management from HCD core.

Changes for v4:
- Address Jun Li's comments for cdns3 core changes [Patch 2]
- Some small fixes for cdns3-imx for CLK_125_REQ bit
- Rebase the latest usb-next

Changes for v3:
Add Jun Li’s reviewed-by [Patch 1 and Patch 6]
Add Mathias’s acked-by [Patch 4-6]
Some wakeup logic improvement [Patch 2]
Add dedicated wakeup interrupt for core, and improve the commit log [Patch]
Fix build error found by kbuild test robot [Patch 3]
Using xhci_plat_priv quirk for skip PHY initialization [patch 7, patch 9]
Some other typo and tiny improvements

Changes for v2:
- Add the 1st patch. Without it, the build on the usb-next will fail.
- Change the subject for cover letter a little to reflect all contents.

Peter Chen (9):
  usb: cdns3: introduce cdns3_set_phy_power API
  usb: cdns3: add runtime PM support
  usb: cdns3: imx: add glue layer runtime pm implementation
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv quirk for skip PHY initialization
  usb: cdns3: host: add .suspend_quirk for xhci-plat.c
  usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT

 drivers/usb/cdns3/cdns3-imx.c   | 203 ++++++++++++++++++++++++++++++--
 drivers/usb/cdns3/core.c        | 197 ++++++++++++++++++++++++++-----
 drivers/usb/cdns3/core.h        |  16 +++
 drivers/usb/cdns3/drd.c         |   3 +
 drivers/usb/cdns3/gadget.c      |   4 +
 drivers/usb/cdns3/host-export.h |   6 +
 drivers/usb/cdns3/host.c        |  48 ++++++++
 drivers/usb/host/xhci-plat.c    |  36 +++++-
 drivers/usb/host/xhci-plat.h    |   1 +
 drivers/usb/host/xhci.h         |   1 +
 10 files changed, 467 insertions(+), 48 deletions(-)

-- 
2.17.1

