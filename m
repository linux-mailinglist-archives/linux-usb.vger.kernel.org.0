Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2C71DE477
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgEVKcs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:32:48 -0400
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:48672
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728362AbgEVKcs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:32:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChOFq4aTyI37WgV17lwUo/Ua3FHjmZs/ROCbr6Ci9yfvNr0TfRguQHy4ppJ3oqzqdEfYxgjaTrrIlrxZLw72ZY6hYhzkIoZPVsoD9VS8e6DCh6YyEvZ1rycH7rJWm6Tnn0an7hqIMnMgQ510+pmzrO528nRpy4t0mNDAa2PGWc6rwkW6KTcrH8CSc+UtTVLUTA17CAc2LcezxRoXBqdvhmnzpbNc4pjyY9CJZ3yg3rKli1BcOIEavwkZsH6ZqQo7bqyTvGagju4byddUsvwJkrRz28o8kuk86p7gXmo6YOaiHu4YwJUqByGb4pds1RzDHKtSAGlLhjOFZTp3lTnNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nsVlBuA3vv5gVLnIpYua7IUj5jHCAy/uZ7dduOGk9s=;
 b=MjXqGSkJ1xaj+6+Mf4OM9I6JTkFSrnF6rwwNa+oQgkD9nEITiAd7g0M/5dDcBlXNlpZey5CPdncife+PWIBYmOdQ7dFnNI9cxVmLz3VaU+soWBDGmIR3YWbMfdp+QuKYrBsUpGzW5qEtZz0jcxmU9VlWxhqjmQN++1i8+HScpyuSX4YuDeI/496ioC4HSJiz115VUCZebaP918yCMcwbWgQRQLPyNol6aAG1kL8PjDAEFpiOG6OVY+JAAiJcYfHt5HtFqc0xdKhImnKGYJ7+JNVDT81z3vhjCi6b2kHa9axd9cDjEOibuOkn7y5uZDwcn0blMx1j6n+dyQPWFk0o6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nsVlBuA3vv5gVLnIpYua7IUj5jHCAy/uZ7dduOGk9s=;
 b=QM1P4TduLyLWkynjqkl5QNBL2YIlqvsypTry5Qoeg+0+gthzPpaJACaq/bxEAWQi8vhhzjkFsv+PHRwfQ95ycPjLj2t9FQG9Gm5tALs5q813cGAmPY8vZQ56lbxFy+HXUZxAqDIbAdQMBnkC2nEHDSf8eSQQXXI2MohgpaHqM6E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7111.eurprd04.prod.outlook.com (2603:10a6:20b:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Fri, 22 May
 2020 10:32:44 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:32:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/8] usb: cdns3: add runtime PM support
Date:   Fri, 22 May 2020 18:32:48 +0800
Message-Id: <20200522103256.16322-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:32:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8835426b-14c7-4efc-6eef-08d7fe3b7684
X-MS-TrafficTypeDiagnostic: AM7PR04MB7111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB711191067FAD7B5A7762B3F38BB40@AM7PR04MB7111.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzIeDMCgtxekVqj3G0SDjHotlX3HIenIYagTFNJcti8h8tl8bJCgC64q6i4WU4YaFgnHAlf/kBRQBQFjbCNmSUGo+dXoZNfDyx7/R/DFr0XMF+i1JKckWPQ/QM0/Wl7Nz1TAGJOjOgchXX1/dCR+XogyYGkDFXMea/LrZiaikyZceKYAqrMcJpg0m7rWl4w3JFctQi62zOIryHKEsF9m6A8/6cwzYyBtt4RbQ060ZolswUoUUYh3IX0PjFrcDt3zNzqR9B9Gn90JPwcjDFNK/qDKi0mx6xPo16faZ0pZ4AK1UIrVYljkZqzepVhv9OUSU7f41w7pdjSfwJzzYvsspg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(8676002)(6506007)(1076003)(52116002)(26005)(6512007)(5660300002)(16526019)(86362001)(8936002)(66476007)(66556008)(36756003)(66946007)(186003)(6486002)(2616005)(44832011)(2906002)(478600001)(956004)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +LmsK4JT3dg1NDjlgRstGQ1YdxReV8CpcdCuUGaEYM4YhEpdOAVAfu6LRUmzicn+MwHDTHzpK22N9LTZNoceupYPkvvwwjJ9lGxRfAi11r3+QLdC17YHaDfKA04WpK4o1ZcL0fse8U/V0lx1S7BlNc9woIUxDiX7DMe6xoi+jpj3vtRIalHqqpoMgxvm04x91OS+gCnvHkfeZyelj/OvCWJN/+ifBFmaTgRWKkn523kK3xdoX98xviwDBfPhB5wP2vw78wSr0Ol1zub+4DbdLvKXRr9xKg/udft5RVWmI9ySwb1huidXcMen09xKiupCntwPoc4CGPEhS9PS2Ax2E2kG+xRCkitU3v8+bdXKyzA/8bfJeXGDUy0WaH/Z3yx6myGhRPZHjzTlzG9vmubZDWvC7uRb9wZZbe5dYNWuELGyQ+fH7PSitQO0f4vJSZvW9rNfB2gflUK02HPuExze1Jn+pyMpNpMpJPMfXF8QMg0=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8835426b-14c7-4efc-6eef-08d7fe3b7684
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:32:44.3370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfM4dW+UDUYJwRjXSs4+DWmtTeNHry/CrPhjqU2XwYvuaJL+FgSlvM0DRHUwSEduHv0d95/FbY5goxPQYMo/cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7111
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe & Mathias,

In this series, it adds cdns3 runtime PM support and verified by
NXP i.MX8QM and i.MX8QXP platforms.

Patch 1-2: add main runtime PM support for cdns3 core and imx glue layer
Patch 3-8: add two quirks for xhci-plat.c.
- .suspend_quirk for platform special sequence between xhci_bus_suspend
and xhci_suspend.
- skip_phy_initialization for skip PHY management from HCD core.

Peter Chen (8):
  usb: cdns3: add runtime PM support
  usb: cdns3: imx: add glue layer runtime pm implementation
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv flag for skip_phy_initialization
  usb: cdns3: host: add .suspend_quirk for xhci-plat.c
  usb: cdns3: host: add xhci_plat_priv's flag skip_phy_initialization

 drivers/usb/cdns3/cdns3-imx.c   | 179 +++++++++++++++++++++++++++++++-
 drivers/usb/cdns3/core.c        | 119 ++++++++++++++++++---
 drivers/usb/cdns3/core.h        |  14 +++
 drivers/usb/cdns3/drd.c         |   7 ++
 drivers/usb/cdns3/gadget.c      |   4 +
 drivers/usb/cdns3/host-export.h |   6 ++
 drivers/usb/cdns3/host.c        |  48 +++++++++
 drivers/usb/host/xhci-plat.c    |  36 ++++++-
 drivers/usb/host/xhci-plat.h    |   2 +
 9 files changed, 391 insertions(+), 24 deletions(-)

-- 
2.17.1

