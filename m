Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFAB2167BF
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 09:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgGGHts (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 03:49:48 -0400
Received: from mail-eopbgr40068.outbound.protection.outlook.com ([40.107.4.68]:30791
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726540AbgGGHtr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 03:49:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX0uydmrXDpiMRRV1EHnQlldgxOmS6ex8MkEImG5bjJ4p26sqHJYoHNO+i3EeOqyPNA1quvqD9uXJZveYmkulg7fXVoG1+tr5ccxmhD1UbIiAJweqMWqC/yN+zVZwqK1ThK1FQ4iCmBjZAEFlz5vB/EfivdmVyjiUVSoe0p4aXKNcLhrmjruSMIObjlupmNmdFbBnmlTwG9xOVAl0ZBEhx6Rka7AJYiTAG3ZAs/gRIU1L+YYMuJ4FpAgF0UhyzLAwHxCddz1sFoLyElkAcK6TQB3Qdsil2YoG9nie/wwSxW7kaV6PJeOMBCw0LGhWm9EXYOFESyJPlbex1lYmve10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBBWpuSqhfCAOsKBqrXXDxOSv9C/oKEC1Q5AzU32lnk=;
 b=Id5fLeehYQIgrn3eAB/zD/v8ziU7yehwd4rN7kKd7cL/4fejV514iuEx1OriQkJfi5QVkChFbs7BLzZI+NwQEp6lzi+vHa76xjWPEGpPz2l437UgKDolXDHSnN6JJASpKwpzft/QwFOiJQn51sou+BzfCkHZz5tSQYoyt+ElWKJ23lFCScnJMOWtCJp1dihoZzxLJjZ9/TztWUi8BSk3Z7a039ftC9hz+gpMR9lKH98DmGSTP075SaZf+X/7siiKawjUc/CfFpYUaOlQAQJ9JbqmyteYyCzrWPlZtxGNVunjoxfxuFibrmC3JGZhtbBoukSAEDsFWWenqL7AjOJxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBBWpuSqhfCAOsKBqrXXDxOSv9C/oKEC1Q5AzU32lnk=;
 b=Gah82OtUPjdPVEVBRtmqvPraUq89ociuO5c9p05zafAZBmW0aZgf60DNVv8PNWA5N+gbGZGM5yY7iJA7xlsfAG709XERELOn08f8TAsoUsbTmFbeXCGrKgb3wzvn9BvI2FhuUUxGG8sACQt/i7mPfrgbc9ys9BNDD0C79A9BItU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3138.eurprd04.prod.outlook.com (2603:10a6:206:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Tue, 7 Jul
 2020 07:49:44 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 07:49:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 0/9] usb: some PM changes for cdns3 and xhci-plat
Date:   Tue,  7 Jul 2020 15:49:32 +0800
Message-Id: <20200707074941.28078-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:3:17::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend Transport; Tue, 7 Jul 2020 07:49:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a89d05f1-a42a-4f6e-729b-08d8224a4fe5
X-MS-TrafficTypeDiagnostic: AM5PR04MB3138:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR04MB3138359F74D48EE7B33ED25F8B660@AM5PR04MB3138.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKyzui/e8DWlseHnRf8uoyCjdfFSzGtoheIeyjWQFHJ7jPwVYuSkny3xtnAdnhN4yhmPVEhFvjga1eJ6t5pd7YRoxO1gpMYFRbTNPulEnl2Sjk8yJaRcRwH0X0ElCkbyCJ3G/zPWqfJ/bcPc3ezvm1eebnDMoW/rN1uECI536xxxw6PVEHXPqCXHxOLSxNt2QUbnJlUpL1pFSZ7bohTEQEcmWspvGJULIMf6J4n6emV3LrXrdE5XtCyUrBtcYK8AN8nZTa/wcPlm8FbtOp1PXsfNqntcwAfbhK3d2E4AgXUOfHwjVKYQtEF6lO1atOSN4gypJvvoz30cV53Zk08VVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(316002)(6512007)(2616005)(956004)(44832011)(1076003)(6486002)(6666004)(2906002)(5660300002)(8676002)(26005)(16526019)(478600001)(52116002)(4326008)(83380400001)(66476007)(66556008)(66946007)(36756003)(186003)(86362001)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kDi/zOmtt3opDkzZQHql7X8MCIA+dj26h/DQLFwYLFafrQrny4RdbiSrpTcEktJpsWSYXszUuzaG3YC2pkHCLtAr9eyhAG3QslJoG59O8bTJHm8q7YKB/yLf8dAj9o4puW4v/zXnhHcRGcx/i2f+jWPSNmLaOB5X7Kpw69lFYOr4IFknJUsj58cPGk/tEV3gTH5Hc+iDHMi4lL1KHCgN07eiWP805QXLgtmDAmy+nqdxnD5mGWFcFUOmjWcqA/L7a0pdLj2I2CYsJTjul+ouwUV70k5Q/1SeYRUL8Jk7ceiGjaorsIP9+uAxO/4ZbjEzicMhzvVSrZLEtwPKM0j6R1IHaP90VXYylU1o6uPLBU+dtodZBHsJovWppWoh2ViyP9RThtpKZKK8fZvlko/6WOTOYilJJpX9qtTDipO1hezYSMGXxI0J1SrOX5IFOfXg0TzCElZ5rKPnG4XYE8+KNF2/GY0juoafiDDv8KbRsjKRL7tACDY8X7G65kvU1jet
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89d05f1-a42a-4f6e-729b-08d8224a4fe5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 07:49:43.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFI20N583YFMy/IlmR4tYlfnZPi34XP/J0riXFnUtGtDeNIgxg7PsWq7vw3oIsQgKoExrY6yFXc3XpgCCF/vcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3138
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

Changes for v5:
- Address Greg's comments for more obvious PHY power controller APIs [Patch 1/2]
- One build warning from kernel test robot

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
  usb: cdns3: introduce set_phy_power_on{off} APIs
  usb: cdns3: add runtime PM support
  usb: cdns3: imx: add glue layer runtime pm implementation
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv quirk for skip PHY initialization
  usb: cdns3: host: add .suspend_quirk for xhci-plat.c
  usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT

 drivers/usb/cdns3/cdns3-imx.c   | 203 ++++++++++++++++++++++++++++++--
 drivers/usb/cdns3/core.c        | 196 +++++++++++++++++++++++++-----
 drivers/usb/cdns3/core.h        |  16 +++
 drivers/usb/cdns3/drd.c         |   3 +
 drivers/usb/cdns3/gadget.c      |   4 +
 drivers/usb/cdns3/host-export.h |   6 +
 drivers/usb/cdns3/host.c        |  48 ++++++++
 drivers/usb/host/xhci-plat.c    |  36 +++++-
 drivers/usb/host/xhci-plat.h    |   1 +
 drivers/usb/host/xhci.h         |   1 +
 10 files changed, 466 insertions(+), 48 deletions(-)

-- 
2.17.1

