Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDA32955D9
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 02:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894508AbgJVAzt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 20:55:49 -0400
Received: from mail-eopbgr140040.outbound.protection.outlook.com ([40.107.14.40]:38030
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2894505AbgJVAzs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 20:55:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7kIqUn/mgfOEd8CcIMR2wnaW/oXYsRr3rpoKqJObusrddmKojtXvRSv+ibu+uI/WxHFKOJjeU1ZHe1czApvgj1vvLA6BDX5yCMbsO23GRg7+uDgglKCgjnB3NWVTe+ZGxmHIPPeii4vnQ2GRjdUY3bsZUifWPjrY3WT4S9FQRvwVM10jaTNvPlk2NVD+EYGlR5ef/Xq325pQmj0tqqOPUWZHcuWYYANoIhPODVX5xRf/hYv3m9gbvkrrzZ1gMy8val3X92a9xkjxNcVS5qy1wSXv+/LPXIKMip0PFcO+zNFU0OgiLwOG75dmi0cPmP4dwEP8q+8j2y5p3s4wCybWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urLhz21XYK6mt5XmuXeEmcxwYjMVJMRC6hCq/MCP5rI=;
 b=Ak7SitKdnDy/N61zu5edCA7aEQpm0KXEW0SO49osVz/g/wTb9RlG+CGsYDayQ1DVmAEnRzRmgKYk223ttjJeYM+ygfP0nIwfaDTUwyDa8iG/6m8oSNiI0yqSk+YOjBungz7XMaOv1QUR/7PwTkYTIbrUsHVqJ/oC8OuMbiEsM2ddSlNGJUexV8Se2yLXlQ6JE4ofhPbfowJ57aNGp21h8dUyys6oYQ6EuTsVIAgjoANjzy3uufo5GrFRNVVLc6QyrGOk0U2CrRo8YQ7XhT/0LlCGQCuGsvHSd8JD/0KruZJ6eoYbilhBpxIoSm/ntxPuoAYd3grpBJt5PxR2iu2a5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urLhz21XYK6mt5XmuXeEmcxwYjMVJMRC6hCq/MCP5rI=;
 b=FuCoFDI9hrHDtD2DzpTEhbbVkGSxDYUIacTzMD6Tddfwm8BgfuY5ELzj6k8Up8c3/w4wWLBCgkFtjtJKx9+nncRUAdc4wzVgYT3PwVr7jlbgmyQHSSwtjJqefO+WzwopzOI2BJYKcFk2FnMSALoeK4/EmBQ6wTAR42ZOfm5uJiY=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4355.eurprd04.prod.outlook.com (2603:10a6:208:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 00:55:44 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 00:55:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/3] usb: cdns3: three bug fixes for v5.10
Date:   Thu, 22 Oct 2020 08:55:02 +0800
Message-Id: <20201022005505.24167-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To AM8PR04MB7300.eurprd04.prod.outlook.com
 (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 00:55:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c25e407-dd7b-408c-4f9e-08d8762534b1
X-MS-TrafficTypeDiagnostic: AM0PR04MB4355:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4355BB38B830304BD9E86CA38B1D0@AM0PR04MB4355.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VFU5d6bhNz2BIbdbYvZsxaz/UV4L5I3SYFSgvhEGPzy/JShK+4xbTfgOHXR25prB396l4wklT5h4rrNP+rTOPuKq7X5vUk7lQVc2GP701puQjB0u7qMweVHwPcK7W/H3allFyUsMfD/XxrO629F9qniQtStEBjXk4bmD+zSPUepexqWzVQ4dYZOdbQlMCkuzPSsfFeW/jGa/xfEdH/I4LptewWnpcwk7TxMDeXRuw+01B+dlD5pUaWrU512J9sjQhnkdgmO3VLdbcSrLm9wmnBckFVvgVdejgZe/A0sbZ+loT6oV38LuckgOYW9EiYhLvrPscOe2/Kg3Vg7OcElz4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(86362001)(956004)(8936002)(6486002)(2906002)(66946007)(6666004)(66476007)(66556008)(4744005)(5660300002)(1076003)(36756003)(316002)(6512007)(44832011)(2616005)(16526019)(26005)(478600001)(8676002)(52116002)(83380400001)(186003)(6506007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 9/vBoLazcHFdFUwsvPcdIp0d/e0YvRv/PneGs3TSlaSNHtE9/Omo0GqKzzAdRgCqR47ZxNdTuNcTt+DQ5GaU4WaqhP6xHy23r5NHPnH7hSwpbVI8vl1RJ+P9C3LC7roLHYC6CuS7tVx2nEWuEHmip2kHy2vRwB/3kDCMHGKyJrs2JGCHVxVTUPyXQQoSfDuoAMEJM848pFTbGjp2vPhohTMUQhBxj2JJWcRFyZRbTRtFdkOYulM22Ag8dOMg69W6cBx2GtUgjGz0WF2NxWfTv/p0PzHw1tmenju/5uiRahdlLiSACKBwaP4oyFyLYdBecsLnGuSruplt4YpYZeuS/9S8fe4NcKu34HUOb1AU5voWW/CZGaTkaRuGioG8Ks7PdXH0UEifVPHiVp1ZeQa8eX3x3MMYcMenB903MydjeaO+IQ6jQOk7AUOdouXF2ye0kfOZa3IvSebwOa8Ya7nBt1ueHH1py1bp6npxTMc9fYla2Xlwjnn1k7M6BajGvpGcoE+uWrcEAihfxvKgg2tvTlvU+lzJdN1mhWqlF17Bf8/OFi6LKSp4eKBOYcxx5I8/bH25boXRJhXdKyzjSLoxQI3UTPM454c0qB2WEHMw7Bg3Loj0zVoX1RAxO66XcAROXeurR4XD5XKf/fQCdMnX+A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c25e407-dd7b-408c-4f9e-08d8762534b1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 00:55:44.8005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRIwGA23tZAsn9fEOxX8J0BTa5GB4uYt4mQMi6XcUAzWha2nRpAmLD3SVmsEj9tFa/DmT8wkz4/PbO0I0oNBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4355
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes for v2:
- Move position of explicit cast to unsigned int before ((p) << 24) [Patch 1/3]
- No changes for other patches.

Pawel Laszczak (1):
  usb: cdns3: Fix on-chip memory overflow issue

Peter Chen (2):
  usb: cdns3: gadget: suspicious implicit sign extension
  usb: cdns3: gadget: own the lock wrongly at the suspend routine

 drivers/usb/cdns3/ep0.c    |  65 ++++++++++++----------
 drivers/usb/cdns3/gadget.c | 111 +++++++++++++++++++++----------------
 drivers/usb/cdns3/gadget.h |   5 +-
 3 files changed, 100 insertions(+), 81 deletions(-)

-- 
2.17.1

