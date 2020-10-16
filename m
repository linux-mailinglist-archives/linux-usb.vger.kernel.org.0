Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36AB62902A3
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 12:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395274AbgJPKRn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 06:17:43 -0400
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69]:41057
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406182AbgJPKRj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Oct 2020 06:17:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4ONsnJxZNIqQBCmhKIdYM0a1wUn2KbTVu8lLLSIVv6Hfmp/arR64TIpUkVp+sFcBzmpkIy6c4wa+k0BRoss6KVk6CYQBQyzOtFxLx50D8mcMbs3wd7bMNj2XxiFhG/Cc7m/ySob8R5XIeHQ/+oq3nFvdSg6o8QUBEpYApK/DaMv3P1TEgy30HRKdPzHtiGSD6G86O62uC9MQWVWHKlTcZDrITP5Dw7l0fFKSMChB+IA5H/bpySG/nkoAIX6PNEIyVIQg3o/7XUDRCBQkGVDj3lPzQ/lZ3O25EKtJ8bSd2R8f0t3QvafDAx2B9N8k7yXIeAJjweH8D22pl68vgUuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+tlXpfuTfl0tumKJ831uiRkJ51TNMp9pnapS2JNf+4=;
 b=YBD0XYIH+TKUCU22a6D/E10z7/ljsnHco7uQi/WlPD3f7NERgcT0tlB0EGE+PR1qs7Da9lCimhYSWTiswrg41i0alpM+r/ApjYJ7eXAL8JrrAdbR7j9Va4CY/RTtrWLC9cnU1+AERK3+uz9JvPFqVSiN5xRJcJuIG7HwG0pk0e3Vdsd9CkqJ9y/OTU7CychsTxzmNQuFsW1VWmL9CnSfEuiJveGX58OFVXFEPOHPTdyAJZFF+3AIGViB3MWG5XroaLZjozbWByeGvWBr+hmgHyKoopgGUB8oVE1Bx+Oklv/+KVbmMa5DUFLE3B0RuUMHNPl/yMWh55U0C0Lk0DnUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+tlXpfuTfl0tumKJ831uiRkJ51TNMp9pnapS2JNf+4=;
 b=nZDa7wfBYx6jaCU0ub+2dBKa4TdIKTkhulqKeUXkOpYpXLsV/9R+yWVyBgWP/2Ti7QVGbJdZ5DkKK77CX0GgdxcHknw9jLMHqAIYGDOxYjH9gOcCGmtOlE1LhIY0HO5zCCIog4QZN+vNMUNhcc/rREJjQCIiBBUkEOAfR8TZVmc=
Authentication-Results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4002.eurprd04.prod.outlook.com (2603:10a6:208:5c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Fri, 16 Oct
 2020 10:17:36 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3455.032; Fri, 16 Oct 2020
 10:17:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     pawell@cadence.com, rogerq@ti.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/3] usb: cdns3: three bug fixes for v5.10
Date:   Fri, 16 Oct 2020 18:16:56 +0800
Message-Id: <20201016101659.29482-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Fri, 16 Oct 2020 10:17:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 421e9577-f8fe-4581-f0bc-08d871bcb403
X-MS-TrafficTypeDiagnostic: AM0PR04MB4002:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4002729B4E682599FF07603C8B030@AM0PR04MB4002.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 55eHKiAYeI4aJNbXK7KaQ0onQwdebROEsjfkEwHSwmEy9XozJCOSO2UokaGUxPHtkmMS1Xae6JYUgM4s7JMJym3OnwHNgwg84/nDNN3guknYz2v3UkaSYFRS6CqYknB2DwkmD5woAChdpohWaU2mLHMYaxnunQUewGu5+0vE9TJKlTzi1nA086y164S6mDFXTTbJcJ9jT52bj5QRrKsEJaYsrr/NP0nBDpMmU5ky70x2Tbdihz9iBiiV8FkN6GV20vvzYimrd1Fo9cPAdtAVYlNN09+m548vcpzK541xuvB/pIC3qr22s2sr+Y2JXpDWyarI759D1ZFz929pUQwVWTMYCcon5DrmJ/V4Kd9nvDCAhTlyBwm5CExw1KKC28up
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(1076003)(316002)(5660300002)(44832011)(34490700002)(186003)(6486002)(26005)(478600001)(52116002)(4744005)(36756003)(4326008)(2906002)(6512007)(956004)(2616005)(66946007)(8936002)(66556008)(66476007)(6666004)(16526019)(83380400001)(6506007)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: bJW9lq9y8R6EvgABZTgz2fQD6O5kJcBWNlCxdij2QhWTOF8bN4qjGAMsgFH8ZsvtCGAR17PKgY4bVPFMHaY7r7L7EQib3wLsoT7DIUIi+R2U3LqaJfWK4aNFQSF8LdSh11bC3H7jp0+M9yjDoBV7oRxEcxW9GjKuw4j1JazSvcoI3eTkY2l++YbtR1R5Zv/cUKETxCIQbhlpV1V/+g1Biv0eDeyBPbLgHDbVzXJbqDtJy+8fQAjgW7Mi4u7nwRONthe7+L5Hq98nDLGUgkOLy7ikzcHrSQf9d48F5L0aQQiB7oV0yS+2Tm1shp/HLq5vzgixU8EsxkaFI4bSaAMHfB3DMeoUx8RRz7ta8b0rkl5XhMlc/ZRUn4xcUZq0BPiYz2smecxmzTrBkVEWWvrYOTGEgi1/++Wtxabsu9f6qSKqutIVunhEYCCRnhSWYyIyg5VvLBVp+1fMjRF0ccwBrlMsRZdukDdgC0P3BPb+mwRao2tcoZ6ZK0ZNbm0wVFN3QqeHBK1w+SWpQaIlkG+7QnEG2JsuBgDZ6VcFJAUcN1e1lnyOhUdERiHj4gk3/pv+FO9vCFJz+IZVFp7IWAFn93QtEb6k6rUq+OmdopAspcD9gad9msyD0NGwyWUUxAmlmITd7y/W1cFn+AoP8E1adg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421e9577-f8fe-4581-f0bc-08d871bcb403
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 10:17:36.3969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t4MtbFPzazIQG7Pq4yaThfooQtmSTjeT5iNes9z1x7+v1SE0RGrWC+wfX333JCGqMcLpLx5E6Q6tzWTbVScYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4002
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

