Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B406F15D298
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 08:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgBNHOl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 02:14:41 -0500
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:29637
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbgBNHOl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Feb 2020 02:14:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB53WNn7SfoKwlkGLKwTURQQy/THe81gebEClGJ8DygeW49S0S9wecco7XCl0xA0fu/gPou4M9U+Py273g0MjsHtgLGzHkFlv9eSWa7SHBSbI85vOIs0kMkMo9zFbWSsGiKTFAv93rvjInKlsOSknw1RM03FCRSew64t5fAgeC6PQdRAQmJBCnK6sJLpm7pW7ajErqNgkL1HmFLbkPc8YG8lO8D+w1+hRIs8w2meGipWRofwyQ97+FCyuhH7Jgz32hJbqGQ10FBTdh0I9COdRO06Z1SB2sgbM3i78am1tGO+20ldwkaU/Qlm7+fPZYSTR1I1rQkw7XwfuVqCIEO7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyQ/mhxsrUdAgKx9e7r9jaZepNnNiDS5ArmC0wx1DC8=;
 b=itS6iG2MatLajlTsqbSKYD1ub0nM2sWVhEO6BkiQVJkwhiNxXTko15qDIZ2RKB5epiF6vohpVsUp5Eh1eCmQvdXykh6S4dr41nAVNYDxxPaJ/0GQEEAl8hMi3JxUhN06QzTgxTwMXtpTN1Jy+QDaRXRwcqRvArVQXwp6aJkqjZuOx8bSJqX9sDplXG8Ut4f9OZzqtdRy3JXXItb1RCfTyey2XTyxaOOcju3QRGVPYI49xipsmVui0vtLxSb5o7+Zrg5TLy3/WUaw332zNVibMoCJz2TCUr6t6pGG6sFMgwNJRVZE5RTM16sDFwCJu+BmaxOG9UjiDpHL04TMvKAE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyQ/mhxsrUdAgKx9e7r9jaZepNnNiDS5ArmC0wx1DC8=;
 b=GmKHOe1G24qhzf+3PN2pi5MGHX334339jHufcprmkg5cJfWv2RVIgcl+1nH4ZZ2B5yAulfNWLX+Y/gMUqZeAozNfuFdejdF1RMtbCWrF+/J9bTaCzwhqC0fzVLcAnb4Uy5QCANjJLPIl5wIyOhbXRVWNdTSPgvSBOS0IxxSI6tU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB3261.eurprd04.prod.outlook.com (10.170.228.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 14 Feb 2020 07:14:38 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 07:14:38 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/2] usb: cdns3: two fixes for gadget
Date:   Fri, 14 Feb 2020 15:14:12 +0800
Message-Id: <20200214071414.7256-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by TYCPR01CA0111.jpnprd01.prod.outlook.com (2603:1096:405:4::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 07:14:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d545539-4f85-4165-e5b3-08d7b11d8d83
X-MS-TrafficTypeDiagnostic: VI1PR04MB3261:|VI1PR04MB3261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB326153751EF86248F3F15A028B150@VI1PR04MB3261.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(199004)(189003)(6916009)(6666004)(86362001)(478600001)(36756003)(8936002)(1076003)(26005)(81166006)(6486002)(81156014)(316002)(8676002)(2906002)(4326008)(16526019)(6512007)(44832011)(186003)(4744005)(66476007)(6506007)(66946007)(66556008)(52116002)(956004)(2616005)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB3261;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHpxZUW0Dj2ItWnDcZ0/XMXyC24MZM0FftfUuKFmXILnL+HTHkOZZgaHZvbKlTnzW7fj+JdmzQR7dVqEs2MSuQjSIWbyNDX9EbS5wFPmFgWYP4CIlyQW1YZ08OPrJWVo5YcsAQxSc1qoy92FKSgdx2Yn9Czp1BhP9gVZ2/cUe19699lJUo6u6RgYLbXOK9xORyLnS6rcX0h7B0Du5fwOOTQzFB32ycaAmNKhY9KBfqTK3aOpMtNMhM1MRsDPWn3qkqabKzRw9ar9RpBkFK8jKqv8BA8iPnLpVjPWd0sM5v54vcw78XBIVa/TIJVUYDfDM/dEfdNW3NQoYJZY0XOICobAx3KHyMcvdmZqR+JY0kk0+0zBn2lBwuoob5QtZY22OUS8qqJWZ5EOcQ6Roemo1A2Zbf/6dcpCrpMpTAq2cxhwzT46QIMAD+Yrq4v1sj6s
X-MS-Exchange-AntiSpam-MessageData: YCwG31avMHJwYxGqlRNENurr4vlKwWCkWUwPcRfatYzuSWrmiE1FOE8qkr8Lpm2HvAhmjztBo+2tJn3IUi5sZ5ZpfLwqB7prcmIqZJSKy1x7I70ob3+cUdeJE2LDXN5uLTW/cd2V/X8vyCWzRo7NSg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d545539-4f85-4165-e5b3-08d7b11d8d83
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 07:14:38.6801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWeAhpLtBgWjvbtzGgrzCuVJFLMIVwckiyezifgEPejsiQD2uyXUah5qr49M2jt9p7jpS2hhTCe+Ixz34ghyEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3261
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These two issues are found during run "Error Recovery Test"
for the latest USB CV MSC test, the TRB doesn't advance correctly
after dequeue and clear halt. With these two fixes, the test
can be passed.


Peter Chen (2):
  usb: cdns3: gadget: link trb should point to next request
  usb: cdns3: gadget: toggle cycle bit before reset endpoint

 drivers/usb/cdns3/gadget.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.17.1

