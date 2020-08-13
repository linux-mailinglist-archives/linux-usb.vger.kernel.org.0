Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D4B2432DE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgHMDis (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:38:48 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbgHMDir (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:38:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixGIO0kAqsltQ6qZYxjCmtHOn+VALoaSLe+n2vSToTj0uZgj1wZhcwzZPpkQX9Bg+z+m/baLPwr3Ai/D46a5u1A0QkTkPRyLo6HDaCd0aLydby/tVvdCfQ698ynhiURp+e/lIQlGPaonqw6fbSnAlc+mcTNrRszCbWyzx0OxQFB0o3/UgpEwe6f0dXXHmEESvmtRNtmjePzaCVwbo63CM9mqYq0jGoqBYM7bxlvXe2vJ0wTGoB18qjYCzuO44vmyGL9CHSO8Ho1rsC2kN2iEgOVrYk6YOM/o2+0bCVw3OumPXbnZE85PvSdz+5/IEX4QhYlqmXp/zRTvN0lLHjKaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKuDBMCArirpq/LD6gy8IRiyVOzJQ52UD8vLQHrH1tw=;
 b=acr1GCcn+7UYvjZs0MV8gd/gwiIncAHWXfLFaQLHaSG3pgb8TOnjPGjAZ7XnUEl7U+/s+EZHExwW/lPsE+T1nwFZcSoYuSSCXX2sEGSzuLdlaac8o3KXqp2fE3zptrxp5zpjrlmVMbR446n/7qJZkF5UJHbMKF1heTy4Z6Qo1H7Z3ftvCI6kxQn/c+MVg8uBmPgbg/2eE1DmUuFvlJc+LlhuvBGo6a7/mbVg6MecFM9eEM9MW0jTvNyup7n+yXfHV4xYuzDypYtnyHtSGlFTfxbjYNVlTeisUoaTR6dILbIylNbNJxzJV+vptwDzu6bSA5AdVKCqoDmv5EtPVMVhew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKuDBMCArirpq/LD6gy8IRiyVOzJQ52UD8vLQHrH1tw=;
 b=mYY3Y6EHbSM/bhQ+iP8w3B3t4uC0zILz7e4fYoegGUBBPNLKr82D67PMwRGw3hXF+mXUO61cNh2t8qUJJIfjcvZmZ8ifcpemD8VpvNPGyjbytyZb1+Iv4rfFsxT40DN6auiKeXqPmZ8Is85Yf6R5MO4DjOjbaWO2sLwlpbkxtQg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:43 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 0/7] usb: host: xhci: some changes for xhci-plat.c
Date:   Thu, 13 Aug 2020 11:37:34 +0800
Message-Id: <20200813033741.13982-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3786c66a-0536-4b91-24ae-08d83f3a603b
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB36542BE37569BB1E48CF75818B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(4744005)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3786c66a-0536-4b91-24ae-08d83f3a603b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:43.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JABEPC/cQuDApFut21DwHL/K2JUawsgg7Ds9sItlThmv4k3PKJf5gt/O3mxwuPDwujr0ks4Q+TNbsOwl6qKCyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

This series mainly includes some changes for xhci-plat.c. Some of the
patches were reviewed by you, some were sent during your holiday. To
easy your review and save, I re-send them together. The patches are
already rebased with the lastest usb/next, thanks.

Peter

Peter Chen (7):
  usb: host: xhci-plat: add platform data support
  usb: host: xhci-plat: add .suspend_quirk for struct xhci_plat_priv
  usb: host: xhci-plat: delete the unnecessary code
  usb: host: xhci-plat: add priv quirk for skip PHY initialization
  usb: host: xhci-plat: initialize device wakeup default enabled
  usb: host: xhci-plat: improve the comments for xhci_plat_suspend
  usb: host: xhci: avoid calling contineous two times for xhci_suspend

 drivers/usb/host/xhci-plat.c | 44 +++++++++++++++++++++++++++---------
 drivers/usb/host/xhci-plat.h |  1 +
 drivers/usb/host/xhci.c      |  7 ++++--
 drivers/usb/host/xhci.h      |  1 +
 4 files changed, 40 insertions(+), 13 deletions(-)

-- 
2.17.1

