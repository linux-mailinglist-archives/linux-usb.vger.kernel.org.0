Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5B8250EC3
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 04:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgHYCMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 22:12:52 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:56846
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726878AbgHYCMv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 22:12:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iI6VpJII+pgSa9FfDDPwXJ7XvrU4xAiszTrmD1vg+LHjQIw8JrcPCtBqIa144LS9184haHMRjg/DQiuQ9CPQOmIxdsX83Ncj8imF0d24jKoUuLyXHLUJ1D87L8BRuJVjJF8nasSxIlT6H5II9sbHsU1/p0RmnAOzu7ObnHph41V79V0aAgkY+LZgOTdJI6HEDgoXFbyPqdguCpVZKR7Zy+KoCBNVVS2fLpvGbdyCtnd4pOGRglkYbR58be69E1BddDUIzeYRKllVDVPshv1Pdy6Q2gnyU8FmEP5m2kXRngJpAUkHK8EE+2ipyW296whGm27jH/tdiikcH7WBmJbzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgIkCupD4S32r9LhQCotrC79fIOwuxc3zm0vmhkD09w=;
 b=Q622mdi2uuegIvdXXOLK7GVo1qHLZJJCBb2YHt1irPiS7Y3yWMyJSE4dow98i5e9d2CSFQV+0V35Z5Nulz/o+Fn7BRM79Db/qTB5Vhc/LVSmdGlB59v+qdE7DNIRPTmnXfxOrRB5rIDUeP6F5C3Db1zdeGNkKGRK1Wdd+1SqAhURA8zvl9N2FLgGClMX2OSFDfCvTZ42iBn4j5wFrZ/8lf/LxB34GQ5fAEoSl/IcNzIXtLifQabBvf8avoAq0YtjyKQm4utfzJyM5FnEQ8Kdz1bXPDvvfYCEBCDs3YmH/AObr1Xh2Mf1/ZVSrna3V+vyqqyJxJ5AODmkLfWdirYRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgIkCupD4S32r9LhQCotrC79fIOwuxc3zm0vmhkD09w=;
 b=FOger4OYD2JbMMNR8gHsrewNnWb7SM76kIBUJqowtBW7OCOKD9dbkECQxoskDw+gGRdQu6uNZsJVG+00Cb+lN4hq48riUylhfJYmN0pfY7u2m8HeT7ojA+/fjqnm2Uo2y0bqGSlr2QmzladSnAgXso9D3442WOUNWXI3GghPrCs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2851.eurprd04.prod.outlook.com (2603:10a6:203:99::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 02:12:47 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 02:12:47 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v7 0/3] usb: cdns3: add runtime pm support
Date:   Tue, 25 Aug 2020 10:11:17 +0800
Message-Id: <20200825021120.4926-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0160.apcprd03.prod.outlook.com
 (2603:1096:4:c9::15) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0160.apcprd03.prod.outlook.com (2603:1096:4:c9::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend Transport; Tue, 25 Aug 2020 02:12:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c642430c-1fb1-4e87-c136-08d8489c5c45
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0402MB285195A0AD8F593012E498498B570@AM5PR0402MB2851.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: edQLnzSR3HIJbVC17izb+baC/NYq8iW+vKFHJys8GVczzI2tOK2H9mKiZaUnfj+QQ0Z3LGCMwXPpemN5conCu/lnY7BJpPLa9v1tIcgTO6onOwnPdfCtXJbeJnQAulNjjyHH2cwHMrIXGzfEhA0TUNDvbsRkSDBsL9RvAVxsZKFGmwHy//FpXKOmABTubM29Ps6jtD+IEHLWDHnQfU6/Gj5GLyRdHFSbnaSxjxIyR1VugrCZsqNHwJu+vYpkACmn2B+Ut628YZY0sRoulkU98ZZsnM6o8mnZxO41eSBLgYGNL4DDrrvCZSaD4XItinLYiTCqrvbqjGYHNYI61fFLt1BLk4cOjSJep7kB6Ta0zdHOWGDd7IBUx5RRWERBJle6/VGhThryARsyJB8MipKy4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(6512007)(966005)(6506007)(2616005)(4326008)(956004)(6916009)(44832011)(36756003)(52116002)(26005)(16526019)(186003)(478600001)(8936002)(1076003)(66556008)(6486002)(83380400001)(66946007)(2906002)(86362001)(8676002)(6666004)(316002)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mml+3SPcE04kRA9SMtFwxohG2fq2S9y9pf3jKBiAKEIydrkB86+/+W97PYb9EkaZfa0/13lJCPVpxJME1RauRJ6alBGuZnnN8x8qHNJvuIsQGyeg7NlyePDu/JoXQ0CcjPu8BEilvyjp5tkgFQXvWSQN9qtRfs+WDY8X05q4yM7gvgeAaShQ9D4MBBsYLGSpbofVUuygErPFy2fQ0tGl5NJEsaCCNqOIGkroond9fBYbNAes1p36V36zoxFhjhE/w673a/S5uu/vuh+liwWwI8UD+VSuU1aCmCdiNL8ib2RN/O9HuBcYrzHzaZ90YfnJ3W1HEsEF0gFrxIu2bpzjf/3J+Uga3TQUzSALpaPjDMsXlfjagk6xNQ7feO1+QksfcWD07LqHEnCNT16x2c5zMPDgE3dLLOkGOISeSdkagEZtApE2ioOhpgcN6soGWU4beHYXOSN1lEjhYNH9d1KzFwk/wxQ1NlfvEkGW9156bPbB5wZs5X1nhb0v8AetsXRamBnJ77co0D4ub0BSAMD7yW7fEpmh2rkIXxfsyKsqZqVvitD5028fxKJO7bh/4wMm0aOiHn6ubc/hDCrNt69soYFawLRfj4Ds56Y9icmQfEDTsfzCKddhGL9CzcRJjv6++kSug/SKNdMjNDsG06T10Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c642430c-1fb1-4e87-c136-08d8489c5c45
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:12:47.5328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjYTG8EmqY7RrPWJTxe5wU6kIXiuwRVbtrjXF2U9tgmhyKHaAmi9Ad2yTA/goxqJphT61khcLdRrOd/EpTcHew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2851
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

In this series, it adds cdns3 runtime PM support, and verified at
NXP i.MX8QM and i.MX8QXP platforms.

Changes for v7:
- Fix one coding style issue [Patch 2/3]
- Fix one sparese isse Reported-by: kernel test robot <lkp@intel.com> [Patch 3/3]

Changes for v6:
- Add Pawel's reviewed-by
- Remove xhci-plat patches, which was sent by xhci patch series [1]
- Rebased on the newest usb/next

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

[1] https://www.spinics.net/lists/linux-usb/msg199399.html

Peter Chen (3):
  usb: cdns3: introduce set_phy_power_on{off} APIs
  usb: cdns3: add runtime PM support
  usb: cdns3: imx: add glue layer runtime pm implementation

 drivers/usb/cdns3/cdns3-imx.c | 203 ++++++++++++++++++++++++++++++++--
 drivers/usb/cdns3/core.c      | 195 ++++++++++++++++++++++++++------
 drivers/usb/cdns3/core.h      |  16 +++
 drivers/usb/cdns3/drd.c       |   3 +
 drivers/usb/cdns3/gadget.c    |   4 +
 drivers/usb/cdns3/host.c      |   7 ++
 6 files changed, 385 insertions(+), 43 deletions(-)

-- 
2.17.1

