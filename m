Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695B92EEFFF
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 10:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbhAHJqd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 04:46:33 -0500
Received: from mail-am6eur05on2051.outbound.protection.outlook.com ([40.107.22.51]:19936
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727525AbhAHJqc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 04:46:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pwf+oQNRrOui2CVg3kcJxwjYDu50dVHGz+ZbhodWApOP00c4Nd9DtkjPzDYJ2UCSU4LigZK8cirobziUhV1Cqi45yVnFkvrtjk3FtDI+pc42ocAiVhqPZqZnmNgrnBdYFZXJQimuH8cb9Uak+XKHRE1rY5q4iuV6+CP/V7tBfoMzqZgBAyKrpPwMJx04rivPo/VAXhxWqp2Dn4hcfyiyi+UoGkF46KwrEOpsDYucouN8SwE2DtpTJpEibDL1ERC5kjd4WkmBX1RqmWfmF6b1vOOeNgQNMdf61M7OIZM4YOnWLvDJYI6wGHWHei3I9mEY1ezPgyzGU1QdXeh0g7IOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgUEiHm7smP//4W0CGvgoOsGsPlkKbeKzmIkYpc+hg4=;
 b=CdORIZ7aWQMx9Rtg/uBrz+XG07YEaXEtED/qdUgrFm1M4vOHwfwDDa+bfKVN9lBYLt4i72WB3FiaXjAhK0UdGVx/KBubRBucnXwesdTUZB7mljP/5vvxbnE2BJhJFuir+0pJ867TxARivS2KfzjAJ2Q5C4I2UNgSG2pwOjUeU2KslitoaymEg+fA/tOFQMcDTGfhvQL4j0dtdcaP3s76X1yfzjot1PRJ6pTrBvM0pMymEQWYRDsaUmkykmF3atPY7EMvBAVnfijfExKHsxAywMM7mWYjCjU9ngfL3hQUYVpZ+GjOF0fzlTHjOJFeztOap0HUclhFgUC/lbf71Ul7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgUEiHm7smP//4W0CGvgoOsGsPlkKbeKzmIkYpc+hg4=;
 b=q4Dc+rUQG7zmIN44KUefmt6keW669tokcKewvqmJn49mwdi+vId/FZCQJbTb5+DBShQyVFr7WOonPOV5+qXlNreBNh+V8eNWXsW+jRR2BC8UVGjvk/vyjathGN8Y0e9ShHaXl+EHjLE8sVJ/cBDJAKe5JqKN6ZDOoacc5xn+NfY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 09:45:43 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139%5]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 09:45:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH RESEND 1/1]usb: host: xhci-plat: forbid runtime pm conditionally
Date:   Fri,  8 Jan 2021 17:45:01 +0800
Message-Id: <20210108094501.18903-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To DBBPR04MB7979.eurprd04.prod.outlook.com
 (2603:10a6:10:1ec::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR03CA0089.apcprd03.prod.outlook.com (2603:1096:4:7c::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 09:45:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12e854dc-9807-408a-e15e-08d8b3ba2a84
X-MS-TrafficTypeDiagnostic: DB8PR04MB7180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB718077BE81BA9D0EE63DFF4A8BAE0@DB8PR04MB7180.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9YNJeGv5tHHqo46CkC8b2Qm9h2pLb9XsAFijMzcLfNLWkOmoMGYw9YIDj4dpYQ2z3XF6HRfL7Pm2IkT4YXekK3wBzWHrReOJyEFh2FNNcCEUNLtULyru36vywUokBI8ATZklRZdJ67ZTo9JAkaepaKJ6oRMb8tiWde8vUc/BqBlDaxx+povu4KINUFT/z+TQtTQLk25s2OHcql+M3/cNjG44lShr7pCYy0TwIhUopPSrXtpXB4KtURbKQgklopCGfhwHxOaEz+AQTJnRZkIn9Tii0zJV5/SEiDOO6xKml6k2m6xO0Y9L6OJB1075yrW5DJFJNNQGqKnD78mIlsLb8WZeHnYVRyM7bQDc64+WZupMHGcsI2zWlJkdRVu0KLrTaMVSzKopSf99auNiNmAUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(6512007)(52116002)(6666004)(6916009)(6486002)(36756003)(8676002)(83380400001)(1076003)(6506007)(66556008)(2906002)(2616005)(5660300002)(8936002)(956004)(16526019)(4744005)(86362001)(44832011)(66476007)(186003)(66946007)(4326008)(478600001)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jGNZZSZPhYr5nJVlHKNimjNR4whFobQmYl7Buls4E5GucaVR7ogZb8uKwtoO?=
 =?us-ascii?Q?vbYOqJfWHeeZjJ4Lurl09zeF8z+aqdrGtS492DQ4e/r5GZ3RPrmIR60ZWOjD?=
 =?us-ascii?Q?lE9BwrI1O2+ooQjxouqHyimlxNnVtTl0oY1tuFx0/W1hWC+rbRjCJXdpfq/4?=
 =?us-ascii?Q?sGfuDZ6sDEcl/koialJTgtkDbN3d1uV6YumsZSLXIPt8DilUQG51x9L/fK7J?=
 =?us-ascii?Q?vbFyK8Pe6BegYjPRd9Bz8Kfc5E0vmz1yTZA4F2uiEDEMZSVJnWCa+ScW2xp+?=
 =?us-ascii?Q?WhwyqxDuO5W3ioaGFpEzMMjz8d3BtjlUots3IuTeMozdMemHgsgKwdDDANVP?=
 =?us-ascii?Q?27IgdzfY6fYNpNG7V1pEPQjcrDe+Oxx6PbvUUIV4aCF2Pyte+ck2bwpo+yx0?=
 =?us-ascii?Q?oNjazLvpsc9N6oGixZ57BwpszvcQh/x6vA/mXl4vpbDL/65CbQ9RBH3GY1AS?=
 =?us-ascii?Q?UA1jrFWBJ2EDkNNE6Xiq5dhMiTOSOB6gqPmRy2n+fcSCtMWgcPOEHAr/a7il?=
 =?us-ascii?Q?GOTn1Z+wgSKz7+lIUl/KK4RrArdwnEkJPJ2F5SBJdTPDOl+gfWNmD8XdK1t7?=
 =?us-ascii?Q?eV6NnO/iBkaJCsGzW8o9Y3MUFdioV0XrZfYZ87CEPDkZcBY4HYewTt7HjbKP?=
 =?us-ascii?Q?tPUu3kJ85rV96Wq5lDZ2kReuPE2M3hnW5sHSejADJvDyAfsRZTRoot+i1kxd?=
 =?us-ascii?Q?CGsK4MhxorMdcjT1JIl6A5kOD+Hih6FxxGf3vJ7fK3utimxHNoDN2j23hL/D?=
 =?us-ascii?Q?ejeJLqYsBpA/dFm26eUNYry0A39fyZFEXvcdsMW9L9clEpTr0zdE0j2V03IN?=
 =?us-ascii?Q?xeN68C0HgXCg/Rst+S5iwbVrWjbAnYSrSLHx1Dt7ML38KO6t486R/d0jE+mu?=
 =?us-ascii?Q?92pKL+wdo5cjisJICADkSD5kTOFiEC/5WiCxhxfWGD5oqvgCqAcL60DPst/i?=
 =?us-ascii?Q?qZWGUAZUGyUy2LrFh+J6wCQEGoaD1LNli3kNcfsWUim8TIkfBLtLY8y/AodH?=
 =?us-ascii?Q?zH46?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 09:45:43.1207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e854dc-9807-408a-e15e-08d8b3ba2a84
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZz8dXe2O5RQ7RZT18VvRypZO+24JeyqBfM6WxPKhIVTj5FtjssJCVwa9svU28OxCNckKwCXKk38/e6Tx3FBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some users may want to enable runtime pm by default, using the quirk
to judge it.

Reviewed-by: Jun Li <jun.li@nxp.com>
Reviewed-by: Ran Wang <ran.wang_1@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3ff84a489ce5..00f98243f6cf 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -355,7 +355,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	 * Prevent runtime pm from being on as default, users should enable
 	 * runtime pm using power/control in sysfs.
 	 */
-	pm_runtime_forbid(&pdev->dev);
+	if (!(xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW))
+		pm_runtime_forbid(&pdev->dev);
 
 	return 0;
 
-- 
2.17.1

