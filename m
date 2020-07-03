Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4A821341A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgGCGZn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:25:43 -0400
Received: from mail-vi1eur05on2061.outbound.protection.outlook.com ([40.107.21.61]:44736
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCGZm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deeCbHkFzPvhmVxqe1KFT8XV2Gx6P7z1gKYkwWOblG281oQv+7a3FqG38ZRXOlCWVQDJcfvpIsCwy18MSoFboUHNZPBp/MpQhyyGDtpJHtFbDwGBRoczQNYCdp3dSPqoJn9tkY1PLDiJ0/xZ1psakgL72BW4tojv7+DoZkzKRK29CA7G0jNjG6bbzqmlvyuvL8984G5mjNtXIK4oOWd/zWDysrN6EGmboXD7xT/UxWvMlqjiRw703otP9Iv1kx1euzGpeBeKYoUdWpl5mIryOExSyifbeabum9HT1zWWcTySm2ihAEgZ58mKI9bIa3ktKtHgAsGkltqliDVo3mCk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2BMQNTNf9FpeV9YJxt0NtBbY5k9Zi1d6+76PHiAhlY=;
 b=XBTWlHBMXXZMOLmAhHtAZQ30anMmE8TVhJ42Z+EcW4p6bhewwxmXYhgf2dabsGbi1LOftcco2X5o1NFxCWRjeyQFtQvQxMJNEqJIcNLup9EDIXMIxWahwbOfud6//VYSpHSg4lMJsbRTe7ENZMIzMM2thYDqyXUyyV33IUYT5Zlagrv/lEOZGK250oAyM78HHT1EPl5tu/XNzI7Yo1zUI+M8YpH946jFL0ewHWO/ZWKJnqEkswj4aq4GlU7a7/Cq0nrSPz5tFOJ87wsFyoUzCHKIQg5OF7uvMaobmOycmpi03exO9//P06R+76yATrq7AE3TPu/DAlEUBM8Np70u0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2BMQNTNf9FpeV9YJxt0NtBbY5k9Zi1d6+76PHiAhlY=;
 b=jmrvXm/He0TzJSVfi5gTqSwYO53NwHZeNtsNCUwOgbzzWnvaycKHj+5oLGVsGs/TaYQZkfTcPPGMNbgiqkliftNtpFUaRsc6Wg0nWI8DAT4FGNBKoD9u1suX7OfjrcNL7wOeUqSZO23TqnoYUy0mtYtF1fiCtx273hDDk+/BOpQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4758.eurprd04.prod.outlook.com (2603:10a6:20b:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Fri, 3 Jul
 2020 06:25:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:25:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Date:   Fri,  3 Jul 2020 14:25:32 +0800
Message-Id: <20200703062532.29076-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062532.29076-1-peter.chen@nxp.com>
References: <20200703062532.29076-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:3:17::36) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:3:17::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 06:25:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65011ca1-f7d6-40c1-fc6e-08d81f19e740
X-MS-TrafficTypeDiagnostic: AM6PR04MB4758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4758BA16CECE85DE2A61A9168B6A0@AM6PR04MB4758.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GxNc0+aA7IEPy1yw0VwX5wszz14Eyf3R2ZQLz+L9Oxu8Pj0yMsNG0L+6mQCglFnnJtSXqwuuDyVhqC0gQLXjzvQlzrQp/FrGXxV253DmN8yBflskLm0DIUdTs7qelybXCfzQYPn+pjZyeabrLuvjoXkIfvEt4R3K/Qrkr/Ifi0Pt8ed4+1c/BfN0L9gnViG+NT5ZPJ9CdP6VWjb3yuQlTaiH35wvTNphgy+hwMiyqivwrYvDrBBSm/5t9rHMSDWHrXYgzby6qbBC3LFv4lwW5JD2Hx/ySAPdkpSGnebOx1AUQrv6PwOR4qLF82GrYLZbQiOgXDxUuZqBPElslEWJvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(316002)(4326008)(478600001)(6512007)(956004)(2616005)(5660300002)(6486002)(36756003)(66556008)(66476007)(44832011)(1076003)(6666004)(52116002)(4744005)(66946007)(6916009)(16526019)(186003)(86362001)(26005)(2906002)(6506007)(83380400001)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2LnV2qTFXv6xHKB5Tdu1Idmp0iu5knwsnb4nHBVBn8mFilte/uXZAGBBR4hEUDXfrHEJxoAyFm40K8/iuDWQtQrePc+Y3nDKNTMzuuj4BkQH+rLhj4tXxN1PXbcD0+pyynH7a6tJW1pDmMOiGR8lMP8purnbBiv9YQ/z3o3PMh0AsQqoftd8ssgjxPKfI6BxPUuVA2ikuwGW6/kcFWPuaeUCsgISiNIbF16OhGryV8IFIOFoZlv1mvl2JIY4ZluiOCA0bzzfVOHoyllXHe6cQ0NZzbdmA6u1a4Ew1PzhXj3r6Gd2t4SZtP5t8Dz0zPqOYcqMk8ezJiI3oFS+eJqqjDBYNpu2Dst+l7oj9NMbtuEZDeyWqqOjvPbP68SL09Ywy4d+GcoTN0RqcZGk46scCF+YgUf0nbcgSzN3cg1qzU9NmmYLh0/05kwgHtzyqSsfm5gHmRwLz/MjvTqfzCg8QJ0xFU+0hsMbMEZ7v0FDMWw=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65011ca1-f7d6-40c1-fc6e-08d81f19e740
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:25:39.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ewgMtwoby3AloWxNEbJFse3weUTj5ba83JbQNdSZj+is6jHXv68fumUt2rxJ3S4O3XQIVHMxaWVJ0WibpeMaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4758
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After that, the user could enable controller as wakeup source
for system suspend through /sys entry.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index cebe24ec80a5..bb5d73f0a796 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		*priv = *priv_match;
 	}
 
-	device_wakeup_enable(hcd->self.controller);
+	device_set_wakeup_capable(hcd->self.controller, true);
 
 	xhci->main_hcd = hcd;
 	xhci->shared_hcd = __usb_create_hcd(driver, sysdev, &pdev->dev,
-- 
2.17.1

