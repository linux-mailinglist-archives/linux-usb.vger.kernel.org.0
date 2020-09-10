Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22AEE264101
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgIJJMe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:12:34 -0400
Received: from mail-eopbgr40061.outbound.protection.outlook.com ([40.107.4.61]:49482
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727075AbgIJJMP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbMQPhda7e3bjQCSwGamuOeTadLoX/Q9aUjJKaEr3DfG63Xu9C/ZBeBmtrxKxASAAMDc/fkT/v8JFdwI7V5DU5WsLIuMK/WpuPbnvqFpD70RdUP0TtvP4wWw/0DR1sEAtR/nIpV5dQ8svZvJ2FP1P4zLgeYlJSFa0SG+BpcZUcnOw5rbcp3YeB7MPaCvoaKO0voHm1snfUyiQ1lEROwbvdSzZUYsnFzkd7u9gwXVE3T24N82EdiVwtT2s5RI6EPXsoD6+hL4bqlmu6yokQVel1amP2uRZNLV8iHOBfjlHyejo6pLBK7JhHe61Z9luXe65qzWgV9F7UhXhV+XpqmBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQnQCoxfDZzGcDXwZP0Fboc3D9V0JONxKYcrGeXscxQ=;
 b=T0Pud58o8Rd2BdoL1OZ6AL83X1dNSqTN0+JpJZOcgafqQ6Cko+v05MOftMBKNDogqhC3XgDmDu5nA6+ADKWIGJWJQtzTB/izWqiuU4jv4cv1ZnE1edlQeOS/NnyER7oztNJLESbq5otWIPfsriPwR+snzxxV/IJyIXCgIltMK3s2UP80i1LpwKObeWMw8t4BELx/1mIRTpQMWPd2C5PUnbGliOwkAvaZmCrrOkXkHco6zqi6gJ5jcNRJQwdl8e80m5IQfKUIPGavjqdzEjPA29lTUdWIFLs24J6rcEHWZvIlnImrio+3i7vb+r9/bqFu/UPaJlJdX0OxGYAh8apn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQnQCoxfDZzGcDXwZP0Fboc3D9V0JONxKYcrGeXscxQ=;
 b=QdwWYgtiNnDBngeN1H3On533PCerA5Uvj/YS6W4BZyQCleGlhP8Id8EezJy1N7NQAmOD6V82JMsy+h6Rd/bVLFFiJPpB9lJ3ZBQgA9Tyj8B/qDkbXvIRvVGgW2fO8Pfe1jQYB0pdf0FOFw1PantdU+mNkPKP4XEZEZK4fiukoKQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:13 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/8] usb: cdns3: improve the sg use case
Date:   Thu, 10 Sep 2020 17:11:22 +0800
Message-Id: <20200910091130.20937-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80219acd-d73a-4311-73c6-08d855699af1
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416809C4F8829BB5BBFFFB678B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PiY3ZRgin9nyTenCJLXULOtc7FB6r0RpGGGgiDu+75fKDF3zS3fWMGaz5NO6IhfNQpFSzr7Gd7GxHMHVH01OG3we1GhMU1Vlj7LaGYQzrJ4ITClWtCyk1Z5023wAGqWNrpl3vT1tkDFsziMh7ExXHM54E/R5G87+ZYdwo39HUY8GbNcoV7JRXVjm+cvF8JYykTlbKPBbHazGnoNzyKQye3lUacDU9J7oB9tGl0CkYn1RDvMEpUspv57sznluCIFAc5Tzx+Gq9ONMWPKOnBOKrCZPYhLgN2K/PWvGVFC70W00N2OwHtbjP5JU6a8nCt0HvbXxctbNVkg+5+nCljknRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(6666004)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(4744005)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BfxGqB0fU4M3k9gk9vReipvxWlE4Ydf9qtBMzRruYFy16k88XHMLnQ4mCpx5RxqKPXOKbTW3/LF4qTM5VDLK5WSvrKc9PEGxGljfoV5zR/whg71hD85qk26YZyVEyhaVSL+tHtSE6qjoHfdm0y7askrjBDZ34zzImQNxl+uEMVG3glCdhQSoqowTC3TI8g2YMS/yhREIVCPRdVNgkqXEP0jhfnlYosxC/fqKbhA9TuHnj2z2YqivtFHwtvTnSHr4KVFyelk5VIocaU8JBj1mhO8S/aj4JqjTh+oqrOYrlCBAHlUlh3M8iccVLrkAn3TmFS0NHSoqVU+0Gi6fQzJWrQzD3tM0iRZTuPKFUdZR0AOdqRfe8TSzKUOKcuQFODK4U4JJs6dffzLDLLLFjMEtGXPgpGO+lf92/ux6Myhjw5uPictO2erkuLBDIsroTnp/yKn+GG3xk4tzUBiv1YFdrN1x/Jb45O6Lzu04gm1LE+aorZzyPvFrkv/UkJPnkl2K69bSNziQSOzqkWtTZ9qBPnLunVbKVkSP/Y33uuBcFQeiXAHNB4g6ShAGgiqnVIaG3OAFGV0EaYgVuybAiBFT9WO2aAUjUYXwVsU5+ToLbm4TWQjtWOCl/gdcuconZtPmsJmBtLNNrYq+YulWtYBqqA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80219acd-d73a-4311-73c6-08d855699af1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:13.5403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQj0XzKXgMVXDURgSs0aiV87gv2mrGBjV0T00WUD101Cy0gSqCAa6LUjJNB1C8Q0T6rrIobzff+eRUTL83/pfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For sg use cases, there will be serveral TRBs in TD, and the short transfer
may occur during the TD, current code doesn't handle it well, improve it
through this series. Tested by Android MTP and ADB use case.

Changes for v2:
- Fix some coding style and typo issues. [Patch 1, 2, 3, 5]
- Improve the comments [Patch 6,8]

Peter Chen (8):
  usb: cdns3: gadget: using correct sg operations
  usb: cdns3: gadget: improve the dump TRB operation at
    cdns3_ep_run_transfer
  usb: cdns3: gadget: calculate TDL correctly
  usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
  usb: cdns3: gadget: handle sg list use case at completion correctly
  usb: cdns3: gadget: need to handle sg case for workaround 2 case
  usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
  usb: cdns3: gadget: enlarge the TRB ring length

 drivers/usb/cdns3/gadget.c | 202 +++++++++++++++++++++++++------------
 drivers/usb/cdns3/gadget.h |  11 +-
 2 files changed, 149 insertions(+), 64 deletions(-)

-- 
2.17.1

