Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B398D2432AB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHMDU6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:20:58 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:52133
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726578AbgHMDU6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:20:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIjmJ5Say0ajYPTlDAf65KDQWNX17RYFy5kchkMF0OrWQo7OLKSq1HWc3XLswuDKP8fXiYgI40onuiud+yGgwHvLUat+fYCvN1NaFM56mrQ9czYWzoOcQCPwlk1J2nbtGx4T4osizRQTWduMGIBXB1H3oCDY6DIYmwApZWs/uQ2GandqY7dnV03ZTavJGEPcj/O1WUnFn0en288FFo6va14c6gfioHg48iSwPc0R8rJCXVBb6ivwmdGCo3IG0MFEoq9DIuWviQHZao+qYyWQpcJcW8aViUJUXxCmtwvTtzI7dSUaGlqrnZKZ1eyspsNn/FecuGlzB7IrH499rVJ3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYt1Ffon+pX5JjApBTcDAKpwZbbYv+sWiu+ezZhKJXQ=;
 b=IW87ot7JXFoUpgtlRIiwp4xp7N4T8EW2Xxt/oEpIrJoNXV2VcBqr+VNY/1Be/7fDmUBg6P7JOd8ooJujnBows7lzasn1loEnc0jDXoZ5BoncVrwpE80x8xOCDx+5IB15tw3fkMBSBFmAJLDf7xF9+62KssB9jLuBWrb1vtf5eP0goI6Ea4RdgDQqifmKGP/9GULFhmP3IHrwyZRZEm8kGwLL5PidZi/Y1LRQEN35B+P6GX3s73vWHm63RL90g0lsxu15iOdF0tvU2uw1NAumV243fQbwle7gcIzEEj2LUcpiKwqJE/lS5MVQ32hn77OHesKpno+U8ok+W/EU7uMSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYt1Ffon+pX5JjApBTcDAKpwZbbYv+sWiu+ezZhKJXQ=;
 b=dUMzwri60voSRIQPkmyZzhP3QxgJwaRDjEv+JHQVWpAOJvvyDB7FIY5Jvd1ohwrV9WqEd12zn1bqyEoNxQL7znAvwSye7auBmO+n8AOvvLsdESaAsiByla4RkIM9DjbgwpILxz1venHGOc+y0RDzhGbF2DJPesTUlEHGzo1zK3M=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 03:20:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:20:54 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 0/6] USB: UDC: Fix memory leaks by expanding the API
Date:   Thu, 13 Aug 2020 11:19:47 +0800
Message-Id: <20200813031953.13676-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:20:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07c48051-7e1a-4ba4-3089-08d83f37e370
X-MS-TrafficTypeDiagnostic: AM6PR04MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5911E22DFACEE11052CE85B08B430@AM6PR04MB5911.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcX6ScpWGvSmYBGBkNZE7Gx3xk4QxFE48ozcZ1oEjYZ06B+EnTBoeJe4E6Lleavb8Z94cFXQGfnO73ytBCbIUS8odl+X3Bh6MHnvLrXxomruipmaK/r+VbrCLdo0RuP5ObSHj1wRVIaeFm+yW0cY0Fltx3hIaM5qT2THNchMP1JCsiMuElz7SQxE8m1604K+p23ci6qj/08wppZ+rTaJxSw7rR0FM6OHuwIPmkg791npsAjDJu5RbBeWTh++qZ1oP+sBTHfrPIc2q4w4NFN9EFWD+B9NLXy9m3g17IMyAQWI0UnLuQ0z9fXGOPCDIhdVI6/0lk8dNqmZH5A2xKbITg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66946007)(316002)(66476007)(186003)(6666004)(66556008)(16526019)(44832011)(956004)(26005)(2616005)(6512007)(1076003)(8936002)(52116002)(6506007)(4326008)(86362001)(6916009)(2906002)(6486002)(5660300002)(478600001)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: XEPChL+RXH4OcP36ryvYLO11zMWxwm/smpTGD2WioGxKOfOtM0lRRgfD9PBxkvntsX3P7miq4Wu5LftP/xp8XXQpYfBP5BRytQzCg2s8oSlZBPdYuJpk9RJipXWecAbctfDWDsN5hlnumaXDAHK0nGGVEQnu1+P9gSfOqR//7zto3audJ61gmmwoQ7G+gpfgLZeSsOn76qpNuUDuzD7BN47q893Yn02WJjTUEWGpW7zwqMh/C2XE63JhZQU2+npfykdTNUh4/IG1LhtB8vuInowqmVqjeoDQSbdXpMwJRrzSTZF+rsU5cXz2GApnd/e40Wfvg9OjT78iLdxWSq9H/hfdQyAHVtzIyea7yCuHg8FcpUM9LJGVdMruk73afMNDHl3KITsMR8MDvU6ZCWYkcQNoYmgvuozE0+nUOdrbwvO9dg34587z/DYXCQpxBTgioycKa6EXgO3ZgeUu/cin0ZvxgCrodyc/C/McFGj1Yppq9X5x73JjeG7DJfQnNZukZVR/C4Jgkv8UFPwp+CV8MR9vvFBdDUmWuBMm89XeSxjlNZgQUJIreAeL5TOZUFNBGkmc4fMTXm7wFvCpYGdtwgXsb+MvKAcVQzjP1cSg1r8vjTQQKmJ5t6jKdc32UH06YAnyc2oGWRJ2sz8PavASXw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c48051-7e1a-4ba4-3089-08d83f37e370
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:20:54.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pI/0UWiW86jvJIPcjlssk3WoeIknRfF2hZfysUczBWryYiHlscdQirr4dp/x4BzgrbHDgiYNcBApXDXaraw9kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series expands the UDC API to fix some long-standing memory leaks
in the net2280 and net2272 drivers. And with expanding APIs, it could
manage cdns3 and dwc3 gadget device memory better without the hacks
at UDC core.

Changes from v2:
- Rebase the latest usb/next, and fix one build error for dwc3 [Patch 5/6]

Alan Stern (3):
  USB: UDC: Expand device model API interface
  USB: UDC: net2280: Fix memory leaks
  USB: UDC: net2272: Fix memory leaks

Peter Chen (3):
  usb: cdns3: gadget: fix possible memory leak
  usb: dwc3: allocate gadget structure dynamically
  Revert "usb: udc: allow adding and removing the same gadget device"

 drivers/usb/cdns3/gadget.c       |  21 ++++--
 drivers/usb/dwc3/core.h          |   2 +-
 drivers/usb/dwc3/ep0.c           |  26 ++++----
 drivers/usb/dwc3/gadget.c        | 108 ++++++++++++++++++-------------
 drivers/usb/dwc3/gadget.h        |   2 +-
 drivers/usb/gadget/udc/core.c    |  79 +++++++++++++++++-----
 drivers/usb/gadget/udc/net2272.c |  25 ++++---
 drivers/usb/gadget/udc/net2272.h |   1 +
 drivers/usb/gadget/udc/net2280.c |  13 ++--
 drivers/usb/gadget/udc/net2280.h |   1 +
 include/linux/usb/gadget.h       |  27 ++++++--
 11 files changed, 204 insertions(+), 101 deletions(-)

-- 
2.17.1

