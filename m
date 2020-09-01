Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2F02585A3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgIACeZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:34:25 -0400
Received: from mail-eopbgr150077.outbound.protection.outlook.com ([40.107.15.77]:50118
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726020AbgIACeX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 22:34:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i78Ae6/o3LSkWdrBI1azZDdrirIgze09lymyrUE8NUUkbOw5ZQMBX4ygu/sB0gsJSogYRvpKoNMTgDENvyNmdzNYaqZasVXHpRozoz9IMPruM9H70lD3sVxveEvxbruRAm961Pev8v0H4p8qLVDSnAbchlgJvKme84Q0Ra/fFKgiobTa5JSFOTOg/iWqg505KhWNW4xsCVi5GnrXZRqNvw8JqaQadTE87WWa/+0IrMeont1Si7vGLfJdoLf2SGfNaSWG/Y2y+SILftprIJfHZpFQ2GFMo4nh4x8zaIG/pTq/Y6xz9TE5jGpAxEHH5i+xbxeMPTRZ8j51re0WMVMwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=askAiLjHDWTHSvDZ671aCCkq07dUFIHbrn7BtbKy2U0=;
 b=QqT4Eey3efNDmnrHxmjHzHfFcqMXRSNdP4v7QTuvDQrHTYwOlMbGpJ8eLle43H83/lruG48Gtr692e9JSSyU4YvV9TwBWox7jzaD48F7v8k/raJ+jz2dP9939xKAy7Z9eixQwsZnZWsEH8F71WZdV8Evq6jG6M5BDjTifbvxYkUHuVgV6phil30hkC9JgCMN1pWlD663n5NgZo6uyf/xzLE+frtNLsS01phSvni86whmmNFoP87/UDof+/YI5cxQFPpCQAbXDHiP91flDbrvbg0IdRmLUpuVclDnU8sS3H81PlbRhetv1MGFVQyuCkJGio7TMy8VEsWT/5CtPWmfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=askAiLjHDWTHSvDZ671aCCkq07dUFIHbrn7BtbKy2U0=;
 b=SAxeZnVw/g1Gq343rLKEcn5e2vbZZkcZ4ZE6QEV7et7aeb8YCgftQbK3h79ORCKZaiPtOk2/cIa+ue0Ilfv3/aKNuWZ2mBxn4G5itI4MPhVjzDySxcHJnFIWvHPbvwO0BprG+2YlTnOYMwuffJlqhmWOj7R/mA+w6xxmgzw1sTA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6150.eurprd04.prod.outlook.com (2603:10a6:20b:71::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 02:34:20 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 02:34:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/5] usb: cdns3: misc improvements
Date:   Tue,  1 Sep 2020 10:33:47 +0800
Message-Id: <20200901023352.25552-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:3:18::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 02:34:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5009534-8df5-4e93-2ea0-08d84e1f87a5
X-MS-TrafficTypeDiagnostic: AM6PR04MB6150:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB615091CCD166C603DCE66FB98B2E0@AM6PR04MB6150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFnBNLOAZPvL68lHu9BXvXofaTKHPsMvRdDifmm2X7pUcjY+x2CcJohKXpJO5o8EYvYvIun3sGZkb5ZJyfKoMaWiByH+OEqCvk9pocTLgqVAUVjpllkA3WMufCW3E1MqdPrxcSqj6fYp4hFPT6Mi6DxUQ89IcdyyZY+OpXziG59qKulpZoJQbsKNU3YfD2SkaGTtT3eCEujflVV6SekT7LfMCkM5KLdpp7T4YYZfh84FOv/w6lhw6bstp+d/wH8jFCbdLvU1q9+ueVsHhMNNK76gqnTzjZcv44dLAY7Yk9yf0HJMZs7db4/eNVR+AGAQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(36756003)(478600001)(6486002)(2906002)(1076003)(44832011)(8936002)(8676002)(66476007)(6666004)(5660300002)(66946007)(316002)(6512007)(66556008)(6916009)(26005)(2616005)(956004)(16526019)(52116002)(186003)(83380400001)(86362001)(4744005)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2m6zTPlpDiSs3GrOaoKbA47itvuyYvqELkxwJvy/QM+A7LEWfyAdTU3qeIe4am51Uze5px2ikFbhV339hy63DtmkhiopJU1AZtxHqECSBeU8OCOpaytdp24qIjG7UzmIMxY0PmGbpLhp9OVwy7LOEZ94fKTBkEzJsEmWTXRRgA9tYukRNxWLdzHvuN3ZAgnl1VO7h9v40MX5IE4r5yz0fNwzyOUfY09qt0p7C29Ei39oIRVK7Sue3tekbu/1sOvG4Js9PSbQnpclM6H7slSUg6kdh6lTDB+7l14mmlycYi52PQL+sNGhNAhXAsso9oe+zs80XF3lMwFdmEJlMBacwCs1EIXxBPKK5G5ZpqZN1DRdkyEn2JTWRbPmSYPbBJQf0zDhqr0B6BNKpebTeeK3A3COoiZwO48rU4xw7jWa0t0ixlFDw7oyFNwrxEQpiQpnXbMEr3ZhfdhFTY1zUqu5g9wRp/pe4qG6GfoTDsg/zVFVnqpkFEsSEOjKe1E39EsEsKqdt1bnbMhInSV6T3G0h9wlnOE5iPNEQDwYWYDbSAL5DN1aIm6GHxy3b4KAvnFai67X3ArZ7CXh/7UwLY987t1e95bYB3v3ehbiuzVItRThDzvBJL+F/asrZhDHtjOm1mKRWmCmWQoCAfPaczodTw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5009534-8df5-4e93-2ea0-08d84e1f87a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 02:34:20.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mk6hLF8J6Xh8AMyvomfgrnGMotNCvXxA8kgIjgM1zsUFq/PoZJlSMKeyGQQM++t7L3rcJGnlHZFt1mN9aU6og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6150
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter Chen (5):
  usb: cdns3: core: quit if it uses role switch class
  usb: cdns3: gadget: set fast access bit
  usb: cdns3: gadget: clear the interrupt status when disconnect the
    host
  usb: cdns3: drd: call PHY .set_mode accordingly
  usb: cdns3: gadget: move wait configuration operation

 drivers/usb/cdns3/core.c   |  4 ++++
 drivers/usb/cdns3/drd.c    |  5 +++++
 drivers/usb/cdns3/ep0.c    | 10 +++++++++-
 drivers/usb/cdns3/gadget.c | 15 ++++++++-------
 4 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.17.1

