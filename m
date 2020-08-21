Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8409824CAFC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 04:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgHUCuA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 22:50:00 -0400
Received: from mail-eopbgr70058.outbound.protection.outlook.com ([40.107.7.58]:12708
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725852AbgHUCt7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 22:49:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaPYeQmJp22ybx/PiW1iL9IvGsI/MaeiV9DAAI7oKHRkM++mC844ZnGEtdLYkRIWw9cCAgjknT2MdxgU0FxJUmhI1c5LdKhYCkGJ2NcKJfClzUXalDtgbZ+9Y2g+95u5v2gTOo1H4jmhmRemrLvUavaXyiuEwlculp8GpUpimg5fQ+IWthcyh61xxZZyhCCUxlR7U2DR9PaDvEShHizq3Ouz/k3Ppt135VXEjZwIQ32GPoOeVqKDiT4GeaQZP5dnkpC8WWaknca6kXE+xw10aoMHc90MIA7Nn46JLJKZKtYJmRNhMO3V1/5j9WYoFrbxADWYpky8xqnVcK6AJJpS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m17+vHOB0X1gkoL2+s8FszodHFoIEXnW/nVjKTwQeAI=;
 b=ZLrBZvQNbGasMnbsjyDGk36W1AJzI2rdWz3L+gac4buw03hymwHp9UHVorfsWpgAg/O1VI/Sma1gq3Pd5EcG3YMhQ8IlgfNIk+sn9t0z+5MSyU95Z/zceFH0nijeoi0vdineFmEb8HM6yB5FUBltdbWQbtw9OegIyb1djyU6bCptMeiPuVdEnCEfPHNSqtDEkfC5g7RA2QmH2/VdFz4787Ax5qxkVHFrqKnMzkLwq5IA1hbGkVfbAN+PlxD7vPNX86UBWWzT0m7pVA0X2iRyU4R/ZFHFFRZWsrhAQFnwRLdrmFi6xQeiItPtQGRkOdaYsWbKIXc4rjcgvS8pSR3MBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m17+vHOB0X1gkoL2+s8FszodHFoIEXnW/nVjKTwQeAI=;
 b=A1Yf/mx3XuxBkLG4OZJPa3QptFBDA5X/8ySwU1cXYch6vSoO5HiSy028pRkkHPXUM64fOGfuMBG6FFp3moOCMDQViqZeR6AOTE4TaFQNaVhIp5SNJC/WJCmxt2xqeN7qmdEru3/NoQXbp8IOdJDJCPWRNEcF/Sb3aljuUmhNtYQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB7PR04MB5577.eurprd04.prod.outlook.com (2603:10a6:10:8a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 02:49:54 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 02:49:54 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v6 0/3] usb: cdns3: add runtime pm support
Date:   Fri, 21 Aug 2020 10:48:33 +0800
Message-Id: <20200821024836.4472-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27)
 To DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0195.apcprd06.prod.outlook.com (2603:1096:4:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:49:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d04d44d-464a-4438-fa84-08d8457ce1df
X-MS-TrafficTypeDiagnostic: DB7PR04MB5577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5577645967FB205721E3A7448B5B0@DB7PR04MB5577.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9WJHmI5IeRLOfUooPvsnI7WwCEraFPKKKYrVH2o7fubjIXmNUXuTf7K/EiZ1JNl/C9izb4pT3H9eltumyQ11MPM83NbflxAvSxzQQPjw9wnOzjNnlss+T/UBh3gen/KsPqZywAr9VaSLLYzWXoUSSRd7DCGkoFo+GT9jsM9TnpZ6nrLRwyFpK9QmQc4bA1aU+AnRu1s2fbVYl3BJc1cogIGKf4z5WhavbOxmgY80i3sm9gNQ54w0muB2kS0T1VShiXWeBCLgUbLqoKbxeYzJawLkCe3noPMmoWVi4IdsnfbPFPPCOFMrDEfO0jUGhrk8YtUhIoer3pqPwLw613FSjfKbbh88tvT8xxudTRz9o0EDeqQ/SxIHvXIqHpzmwwPDbAlwL7e+alqTo4Z91MbWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(52116002)(66946007)(2906002)(8676002)(6486002)(4326008)(966005)(6506007)(478600001)(316002)(6666004)(44832011)(36756003)(956004)(26005)(66476007)(66556008)(2616005)(8936002)(1076003)(6512007)(5660300002)(6916009)(186003)(83380400001)(86362001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Vz4poY21Pfp2yhn0l9DeL8Kfcn1tviAA19L+0vb5dUveWTblLo4Wk0hXEDcs7McaXNLrPvWqyRCxEJshwUoFR6zAtoRls4d3ALE4IaMdd6ISIkymqOsYj1DolKQfyaI6NHSh67zPj9w6Zx+ZhmDoqqYWcUgjDnEH6MSglkf+WF1iTR+uUJzt06S0Khct0z5jVWNpgRKuTCF6lITcGyx6DmL2uOMENZNDdmIi7U2IoClsLCxpeKLJBgJ1uLmF9oCKPpU0f/itCQXuBRykyuAmg6KbLc+X0TMWzOv/GKaxaUE1xBSf0GMy1ywUW3KRcSQA5KzjL1WLp5qPeOh/t/5h50DlRuAkcG3nN2J8QH5822IYMiKVBcNkgyXa1plmgK/b5/jDiNzpQUNhRWY1eZtaQeNuy5u9Z6jApdjfHPjsn43xgKqhyGlj0id7N09ELpG/dbvpaSgMXgaufuG0LWSWGa9MfSS+/w8VTXcoi3S8hJ3HY3e8TIPQC+O2V09OdKUgN6dA+gE85CV66gP97RjbvonlCWfZISkQf6KFJTe9GBaa9VX1l/ukw5Ow+N98rAcQ1sKC9HtjyEGpIH2nJRRDb+X2lxiY9f//47A9lJZFofpevuP2zrpLtfNAWaTb5LX+uSsTu+PVMD2vE0kjkygReQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d04d44d-464a-4438-fa84-08d8457ce1df
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:49:54.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUbyW3wG7y1Ia+vezMkwQdSsGhPAYP0BQYNO2meamU00VO/PaDT0MfWKs6sEfIDG9AFtovTvHy+Da1pTxMkKrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5577
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

In this series, it adds cdns3 runtime PM support, and verified at
NXP i.MX8QM and i.MX8QXP platforms.

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
 drivers/usb/cdns3/core.c      | 196 ++++++++++++++++++++++++++------
 drivers/usb/cdns3/core.h      |  16 +++
 drivers/usb/cdns3/drd.c       |   3 +
 drivers/usb/cdns3/gadget.c    |   4 +
 drivers/usb/cdns3/host.c      |   7 ++
 6 files changed, 386 insertions(+), 43 deletions(-)

-- 
2.17.1

