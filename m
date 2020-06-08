Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25BE1F133F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgFHHKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:10:43 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727966AbgFHHKm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:10:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiJTX0qiH9wNRFJAtjYCoJf6tSvbCWoDWBJ9DbyyUUqVYQoMkfFYCuvzFcb7d6NXCF4nwsX8RlgzC4JvHnSnq3zlW5lVNaLP6oVUjvQV2/FllPqTmvEJLB8Yjc5VYF4Ar6onuo7WAyrPSxscPB+c5DJ+risVZ4UEDve8SA5OvT/FGLtKwWcdzjR75mITqYF65NYR6X5JzXYCedwjVWybW7MJYJkD6kZdxjPPvyX3FIQk4yagboKL+ehbWNZjxrgEhrnoZJL6wRf+l3UHt+YmSWPfQZM1vCqnXBruuvPf6FWI5AFb8LckYbQQUnmg2nk8n+VuvMqR/ugBzM7l0KzIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeOqj7XO3ykGc0YefXeIX5fJ47dvK2vCMjBGmwK6Wfs=;
 b=ZO+YcpTyNYqfE5Y0Ss8Y5W3BNtiJdFyO7msBQDyjKGAiAk5V8j0iP3ehxT8qeuf3eZ7XsBPoL4Cq+r63jLkzh6JzgAyJGb52goOmmFKzTtz6DGsUaMIY/K43m/5P1U2Up5zbMdAyb9ZN23EJlQ0MRbPW/YmBjIQdJQsfP5N+KbdyG/fHaiHy+9JIRQJHxlqhTy51aYYzOYKa+mOEsed6cZ/8QhxQkQYc8mAdk0XtD4WOpzeUu6ZaqSDA2DARDyviZXrcWsHSptL/lqXoWq8ltggJ6vkIxa2MuEoLkFBDfq5N/GMuEKM5cJSB/TiQCe3vVKBA14s/bw7S1Yxn1V4W+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeOqj7XO3ykGc0YefXeIX5fJ47dvK2vCMjBGmwK6Wfs=;
 b=D+gTAZSe6u2p9XnFcrwOjLr3A4j6AJucrgz0/clkB1lClS1A9417fMwesChOLUtLYlic37VHnPP5iOVwP1npd5uGBBBKKTj3Hojkyaub6POXLf24h0F6D1utkUVILMSvHzwn7nyDNWEXmvtBUae27jr6Gs1nAJeUx0JKyoLcJTc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:10:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:10:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 0/9] usb: some PM changes for cdns3 and xhci-plat
Date:   Mon,  8 Jun 2020 15:10:43 +0800
Message-Id: <20200608071052.8929-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:36 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9f84f594-0b80-434a-2148-08d80b7b0cb6
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68707BF8BD657AD62F0E447E8B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: giU6usn23f0GrGxGPI/26gPNCTF3eqVSDhxThLHH5K3Z8wJleWPzG8gEEnOBOMI7N5IIlXXq3VGKnnD8EfI8zLYlL8TYeuskCAhkodAgLeiC6/rL8XH/s3F8/NoboCv2djN6HmanZmfu7RdKm/2xUrPbony3pRVABtDtC0g+Q6D0loArkZ5JYe9UJZl+utGI+KqOgBaYQ8W+VkZB8ktpdt+WK5z+3Qmzb+FHsW4TB9eF8yp+cWtN66K3Mjl+qbA119MZQ1ClmAyE+c/JJkkyM3zjipJdG+7uKlAnbHnkqKDpVVufxEnV9DlJxHdrSrvqas1rkn/MToN4D/GXa+lAgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Zp53ZF/2L6/fWFkk1Pj6KvgzW9eAEcwG+4JN5jKhL/f2CgkVYCZuYXYp10okySG+MZCslt8mkDOGvQ7cYzH3Qzy+5YxWT+dIEC48Ox/+Jyk4/hZGEnZDLOJm2ieVm4THtpeiE+L/NR84G2PFcRVoNtEsfxwb66F20/6dFiVDvibupYrO83xPmGp3yiJ4x1ZFfP5nTEA36orPVUJ8WLuegUWdhEGrxc/cogmjopr8WmXI/sxQS+Rlzy1MbCHoX+n5/+Y6nZ97eR8clpPNSf9hfFIH6BEqQcE6rJcV5pdgdXDGSTKorg1D0L/z0ZnwxoQF9tOqq09xqUa2waenV4vmYLFZNN9Vz4urFoxoX3lEfNT9hewfScpu7DmoK7tJ5FCcjJ/mHEyOuUAcPwPuF2bPvMjfZscy8K3IR5b9uQkBeRewv5+IinZIFLhvTBPRSKQ9+sK5dP/u4dfKmeJKZNuJQNCRnAgyQDSEvrXaiuxJk+s=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f84f594-0b80-434a-2148-08d80b7b0cb6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:10:39.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajK3AcUUbWkIBFBoEVf0IQgPsuVmbtLnhvqsysS6KoNfigCiPRs66RIac7aOEUL9Mb1K91G9QOzKWBdlpi72+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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

Changes for v2:
Add Jun Li’s reviewed-by [Patch 1 and Patch 6]
Add Mathias’s acked-by [Patch 4-6]
Some wakeup logic improvement [Patch 2]
Add dedicated wakeup interrupt for core, and improve the commit log [Patch]
Fix build error found by kbuild test robot [Patch 3]
Using xhci_plat_priv quirk for skip PHY initialization [patch 7, patch 9]
Some other typo and tiny improvements

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
  usb: host: xhci-plat: add priv quirk for skip PHY initialization
  usb: cdns3: host: add .suspend_quirk for xhci-plat.c
  usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT

 drivers/usb/cdns3/cdns3-imx.c   | 203 ++++++++++++++++++++++++++++++--
 drivers/usb/cdns3/core.c        | 199 ++++++++++++++++++++++++++-----
 drivers/usb/cdns3/core.h        |  16 +++
 drivers/usb/cdns3/drd.c         |   3 +
 drivers/usb/cdns3/gadget.c      |   4 +
 drivers/usb/cdns3/host-export.h |   6 +
 drivers/usb/cdns3/host.c        |  48 ++++++++
 drivers/usb/host/xhci-plat.c    |  36 +++++-
 drivers/usb/host/xhci-plat.h    |   1 +
 drivers/usb/host/xhci.h         |   1 +
 10 files changed, 469 insertions(+), 48 deletions(-)

-- 
2.17.1

