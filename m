Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49D51DE483
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 12:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgEVKdO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 06:33:14 -0400
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:22662
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728362AbgEVKdN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 06:33:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaB8cp2uz+VSGE41AiUNHFNpKKLtpWBXd34YvLloKGQ3IQeTC8nOX5Vyirb/Q7Xp4itd6WKlIhIlPYQ7ogw4ETx/P65GtOzoa+/0QgAXHdoJ0OAbCdltcUAE6CKLB5tcw5eAXC0RL7j66In3UODwXPQKh1Q07jSXj/wT/bNUuFW/VwndkEtwSZyRGEx6DTZWWMnA6bxU9Cw2FtYdR3jkQDK/pDoC0BzXv+1cCHmm52ZjUBMETA7jJ8RPMfTlM8ZZE+7+hodOrTIahErji5Xg3iYc4861OmAAAJcOJMVyFBGY30zfFhViUz2JoIVlC2Hu1HmGv4Na8G3j2rpjQPaNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFEnKAx9z8Nqa3HrPCHrL/GMcHDUpPdw26EiTvUC4Rw=;
 b=ffI2qRpdYfnnwY4UzJJIaG6WlyNPULYFaLcmpv6/likJlq/A+p6AjprdawMgX3jpExcNshJ2i7aPCORBjniNJf2LJh9xfJXGFBg3u2hiGhpIgeSvB9eG2U0SwdEKnOwplfnWwK16Zmj66AxrRs0gXZWi4tWVsjNPEJpcpt0Q4etJMLbocs3V4damwd04F4+9k8a5DRR58N+bsT6oth7KxkPufbvMQr9HUHFJE42IZ3zx9AhDSHbxDMhgofpgYvKckyrH0ZJNEED9q8O1lUY34aB51BAQvN0Rw/XS5SjXH9QsqoqiX0w8tJfvC+2NPvJ9UIbVzZylJlw8mj0JuZ+i2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFEnKAx9z8Nqa3HrPCHrL/GMcHDUpPdw26EiTvUC4Rw=;
 b=c68gpQgBqM10CmJHnkHckiDg91gnXzehpLsHHasW4+Ew/tnxI/rJXwJySYaMwxZGKo/IU95zYCDW68b/IQK/SojtmGI6o9v/CRkxdWRvLtK+vgwOXvEgKB+KCVkaYFK2Bo8HxfiFCG/qtV/AOXAe9Agq7RcPumiJQGLwbzybuZ4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 10:33:10 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Fri, 22 May 2020
 10:33:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 8/8] usb: cdns3: host: add xhci_plat_priv's flag skip_phy_initialization
Date:   Fri, 22 May 2020 18:32:56 +0800
Message-Id: <20200522103256.16322-9-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522103256.16322-1-peter.chen@nxp.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR0601CA0019.apcprd06.prod.outlook.com (2603:1096:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 10:33:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5deee71-488b-453e-71e7-08d7fe3b85e9
X-MS-TrafficTypeDiagnostic: AM7PR04MB6984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69847EEE9EFD383A337739978BB40@AM7PR04MB6984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITHQbJRUazh/nqxF5r1LpCLh55dbdw9jbS3JTZ2A6RF2qmmyLPVJoDnNLVq0/gYucXpXiGl3WZPfTJjm0HKPgryek3tShj/hJdYlKC3VHBokfn8Rp0CgnqPKF1TDxgtaFR1sSWVuIcTtnuILukbT/AhdSubDoEHlTFgmD0yqAq0bfkQ/06Dp0B8iWP3VrEM6C4ekKS5wxXMopHqOB/v/5hbzmQao9+iimrzeVJhhoZrLjD/56539I45MItpknwmuLOY2b+acF0jX5oIn5vy7oACsxtsvNCbTfQE4Rgx0TmVYiVlCIR7DFvm0z+4Fm64yS7SgFMU/UAp0bBL676R6Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(2616005)(956004)(316002)(16526019)(186003)(2906002)(6486002)(86362001)(52116002)(44832011)(4744005)(8936002)(5660300002)(6666004)(8676002)(6506007)(6512007)(4326008)(36756003)(26005)(478600001)(66946007)(66556008)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 14oFFs4T26lITFBdmFnYHQPoAJrJiBFdGqfy5NuXbQAcsAicp0+lb7JrEw/1iD+hwLTJ8UHtYiiYbKhsIKkrenhmGQbJ6mMiiKaBCkAh3feOsX/olYzc29psT8xqHXb5aLggl4xA8hdkaAe4RnewqJyzGlSx+VVByAWHfkUQAOFP5JshQUI1SvKGwFLqZmNOJSJet5NxdYZvWEW5dSvqQ6Zwes1kP1r7FC4FbuAHFqmEXkE2gYbLs/CzSWnKhrS1IzsrNFzCardX0oVbj7p10F+sCr+ep5iwVpCM0f5JY8aVArr64TKDK8N2dTujfGf9KoGkgunJRCaVZxan/OmYQfTZCHUdhbG/bQHOTXmEZVcHu0Ky9hsGg0pPteMJs3PT/4WhEQ9ZRJL4ebx/g9NrdlIrsyo/ydPgn9ZCzwd3YvTKR57iq+wR2DtEnxzpVVtj3hTaAoYiXn+AKlCVK8IN6+mFMeBWVtNYF+FpWDN+qus=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5deee71-488b-453e-71e7-08d7fe3b85e9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 10:33:10.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwOwn4VjVHnuvR5IE7RAkpy3btpQF58EgkiYa4SbaXt3+F24XTBmenFrIAiu1Yrq0g3cDx79PkVx1G76Xe+pMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cdns3 manages PHY by own DRD driver, so skip the management by
HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 030d6421abd3..d681c3db25cd 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	(1 << 25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.skip_phy_initialization = 1,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

