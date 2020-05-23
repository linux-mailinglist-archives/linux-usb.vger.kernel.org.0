Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA271DFBB2
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388094AbgEWXW5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:22:57 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388010AbgEWXW4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:22:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgy6V8rOXlRZXfkX9NlUD4djfOEuBL/BOt7c1s3oQejagXFF86spEcEf1uXlMBtyuSwyy0ncrEvX4ui6Tf9VG48J5DT9DCs4s2b42qUlih8f86OgKOGojj3yoTS5vIHcfPDHzv++yXgPcfsjCO09mwUbD9p3/H76YKjMPQ49to5+joC+Nfb/lBMPDKEV50GG5luGnYpR+/qRrvb7ORUO6gWx46+HeEeikg3o6WtZedkL9QF0ezbghaEiKzN16+4K1E7+u7jS4Kawt9A3eYRBPUNVzts4CCxvJVZRcYpSyDTkJskGW90MAaWkFODJyLJ9C20M6O/+m5tTfkyEtw/53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb9GucR8UJFVm/GgDUEtWnAcfrRXrCaOu1VFRNiSgmQ=;
 b=LGBk5fNIfw3vccTGApULNGgPsuphp8zU1ldamdF+XGLnTLU3zuC6Q5MPjHWtdBYcItB4XpbdpYG2jKNnYmb1AJFR9sbRVbBqrZpXALKv83aoUn5I+E+IVfmxLVsgiq/Qcj4e9OfOcYTYAn/lXq4+DoGpOZk8EN2zdMSr6INu9KTyt3arxQVSTImEm9n4opUSsRxDEJp5RFVCYiiWhEEkNAwyRDwi69KXffbCOiBwXYIQSctzSuMom1zIkfQ8Y9++J7LlObXUu4kuYVNLW9vOx9sheWYBPhxk1GqhmdByfj1C03ftFYlXKunLBdHyL4ohMfnnbPrJ0RPcw8IfIlCsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb9GucR8UJFVm/GgDUEtWnAcfrRXrCaOu1VFRNiSgmQ=;
 b=gfrxdsF41ts/wknc0SDbh30ITa0qaEqF7YnuzqN0ZMtwXsUaRx4QMJi1NEhoF48Jl1TgFnPNgBQC7bDnuCo2VrtSqsaurN4yIQVUpL5h6aKtm2CTCSJ0fPQcpcJuky9W4pXA/1cv3ilDA8ZhkDYEJvjGqiH/PGIJJnIz6GDkqXY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:22:51 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:22:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/9] usb: some PM changes for cdns3 and xhci-plat
Date:   Sun, 24 May 2020 07:22:55 +0800
Message-Id: <20200523232304.23976-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:22:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7563040e-5245-44fe-4428-08d7ff7036bc
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6918139E208D17578C3DC1F48BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9IT1sBuBR0gCe+V4CGXLg115d4TR8HAY4nNBasWE6Jxh9h9b1vgZZaJbKLWhKeV1Feh8/RIUxGr34IoNQt8Ypg6r0kdEd4VhUtHyfaCBULEejXuYeQEy2mzUaHHarqrrhJ3DAFUi+hjU22GrgBlLYYwkqaa1KYPNjc0hecCMxTrFxmwmfFSDLyeILPpvsO6dLdeS55GYeEJAEryKalWTA0mK58MOLQuEcHByQhpedpwGwpGdCfcH+iWymy8GNCKdHtVeWGNmBs+3ipjgY2Wn6y5+pBqL8MgbcwfZBXHGDCbaLmY0O+cVvg4WRzU6pJRhitNheHipYRyA7fOvCoPSgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 27c/ytuPl7fJQwIc+nwhETcGSCiZM2eCDhddGIti8R7lIuELfya0HNYQLy04DCsFILEbNJv6fJ1yW3nIKA1G3P1U6/uFEPIJEc8rZ2gbKrhzW0dPkFf/nhHahLL9aBo1LkHoT2NlVJSxCllg84dFMdF9TLNgUrthyvTUM1+6v79cygYYjFckoqjtvfCwN31BNBVa2Hsq+3AVX+RNESJqjPSMgX9arW5CW3dO04D50nVS7FNbgoh3wxlJwOTPZEimuAB0rgzqi0t+QhVGhR2v88lQR4C7BF7J5gMxqaUP8j9K+f9lrnpyQlbJdnoNJcaaOoWqt2uwLnx21dfwfZa7WbY0Bvc9Z4Y1hrJs7tOpdcUJORL5IfadKQZv8NDW0dXphyDMvD/Y8XuV2UWLXwqYhcGIKpo+ms2KSHC9NgTwM7l35sPsc5/VuTXpT7aoftHVCp07MpNAQa5s2YKDhJ7MOrjNvu7jxSwezbE4BqxDFrs=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7563040e-5245-44fe-4428-08d7ff7036bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:22:51.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9hzTK6fIValK3JA+GIlClJgy60/Ei4kNb8wBkRWKowGE1ISjxjyLUM3VH3SWNcVAs8r3iN/RDR0jtBDNbceTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
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
- skip_phy_initialization for skip PHY management from HCD core.

Changes for v1:
- Add the 1st patch. Without it, the build on the usb-next will fail.
- Change the subject for cover letter a little to reflect all contents.

Peter Chen (9):
  usb: cdns3: introduce cdns3_set_phy_power API
  usb: cdns3: add runtime PM support
  usb: cdns3: imx: add glue layer runtime pm implementation
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv flag for skip_phy_initialization
  usb: cdns3: host: add .suspend_quirk for xhci-plat.c
  usb: cdns3: host: add xhci_plat_priv's flag skip_phy_initialization

 drivers/usb/cdns3/cdns3-imx.c   | 179 +++++++++++++++++++++++++++++++-
 drivers/usb/cdns3/core.c        | 163 +++++++++++++++++++++++------
 drivers/usb/cdns3/core.h        |  14 +++
 drivers/usb/cdns3/drd.c         |   7 ++
 drivers/usb/cdns3/gadget.c      |   4 +
 drivers/usb/cdns3/host-export.h |   6 ++
 drivers/usb/cdns3/host.c        |  48 +++++++++
 drivers/usb/host/xhci-plat.c    |  36 ++++++-
 drivers/usb/host/xhci-plat.h    |   2 +
 9 files changed, 420 insertions(+), 39 deletions(-)

-- 
2.17.1

