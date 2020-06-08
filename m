Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA331F1345
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgFHHK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:10:59 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729000AbgFHHK5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:10:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+zWNz4axgPgdcGBeTWWvYrQEw166RISlvB7VXBRSovLEyGYtgkJ+N8ty9DTDXafss19hFvwaMj6WW3qwC4BsSXbSjUUnvXBPd9B44o5furao9Be52jhnooMU15qWg/dnqEM7FouYZVI3ww7uhLVvSiaDBcNtVSPlB+TVNt0jVIRVIhw0wgSASF0+RbwCPxK5pzDjB3bUKlQQw6yFoOH9z/rRXKDWPh6Ugh+UnbrwYcIkpw10hCSwIEcPRl90vc30tlBfIlVwGDXu/rQapvkXrsIH0TzMVkBnG8ZEe/NJ6soZ+DfRTIvKq/S92vcgcGitjSjaIWnpdOsF2o2PO5lnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msAFvKLNvfOe6TnVk946Y5HIWsKxo1gfV8VVdNp+aac=;
 b=kYgwpeLJOr5TCt3iRWOx2OwF/EzFnVJpXjeuEf68FuqtdUAU19eS6+WRelHyyU2p310LTyncx223w6molgEBFNxzRsUfyzB3vJWtrYF35LOWAZ8dCjCmdlojaC/BPYriPVeKlqPkP56jHlFX4DyFFX7Xi8ogHOD2NO8udDid/x6oFadpBB0pQ2axEAx5+g0Z0U4Hfr1zPbKi7aOBMs0AFqQN+74VpcoyOfCxULnUotSP9HQ2k5/haHYwbgHkQu83xg4Re2GJJ4NCYjTd5ci/0xzamhfVQv5fwgiRvbSCBwHjPiZfftzJz1r6oQ3tRaXfwmmbHpWoFpFqKAWRAV/Hng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msAFvKLNvfOe6TnVk946Y5HIWsKxo1gfV8VVdNp+aac=;
 b=H9FlT2RSUNFSv3ZG+n8OjSMHFLXmvKpxoQ5HbLkAYy5R2NgEE0VOCJCXNCFvl1/xIpNNbzf0x0Cds6yzhAE/9y3fjwq3OAxY9mzK0sysg85qfgGdH+eo9REycS9Q9PmsEqniKj/Rzw0YpNfYFoQJCrT+5WRt/j5yTljaFpmv3dU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:10:52 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:10:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 4/9] usb: host: xhci-plat: add platform data support
Date:   Mon,  8 Jun 2020 15:10:47 +0800
Message-Id: <20200608071052.8929-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:10:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d0e4e6a-d9f8-4e6d-1f52-08d80b7b142f
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB687091EDE6E7BDB3F44087548B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hcwqzSpLia2QeoZMCxJxscpGlmbeElN9JJfHJQlt5inPe5OrS80cYHiNiSxoLY/A/I1arrl3UD33+6TsKkECV3FrBKf5rkQa0y/gZhF6J6ERaK56hUGbDIVOkZQSgbB6eULSq/rJYIZs78Ziuqg4v/qlI0XhtduT5vm0eUIgCx5+z7MFKTnnEW0807JLnYPoNvOpUgM73nQBuhhbSDbxO1617t0AX+4pnSz2GOtTDP/NVr0Npez/Rbu2vKMyWnPelQ2I3Krpw9sMJwYCs0xCBvNVMc/t9VOSGW55OXxH/FGupszJpwscFdF6Bm3xcRQOj4juLqisTR6cwNHwcQjDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(4744005)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 79FqZR4uiz5QyiuIYhvRdTSW0o0An81GwTGMk3kd+5h7gxk3L7KWgvO6BhGB/cDIH/UYF7L/iEQFisxFJiLXUadL+7eeL+aTHpl1Udf3vyClUmfS0E2FXRov49uNEzamuKuBy2B2p8bvAKB/v0HAhqj06xABBzZ8r4zWTouuP+laxAt927EkOmzpAYPzl1/9dnB6h1aNTDawpXmtLhLGLbSLwHfd8CvooLXl98GLPYERKiV6jxPx/4QV+mqbuEJ2IvZtRN2AsgUKFRWv0bNlUoD6SurecYN6KRuSYsQnMhyAOLLZsbrzA/xTRchXkO4c/JqZ5adUNqRfsy7XO+Av4soOUqn0hXtWfNTmnqKqxUgebP1JStQ3+Wz+dqYNzoEO8q4i2JlbYFeLpmoMyQpDDrLR0+2Ch8WGhgBZOHicO6t33kmlhfcpJPidOb6/0L3onOYxMRkeX+3pPnqEYaX+WeIXK+PTBOhV2/27m0caRaA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0e4e6a-d9f8-4e6d-1f52-08d80b7b142f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:10:52.3766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xp+MVoVoS710/m1COAwB7ee+clxT8Er6lElg6FCsguI0Bo2zG+oAMI3O4zmMJM7mIplr0p2UyYSOONhxW74OCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 0b4cdc5af130..e00efd84ea1a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -255,7 +255,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_reg_clk;
 
-	priv_match = of_device_get_match_data(&pdev->dev);
+	if (pdev->dev.of_node)
+		priv_match = of_device_get_match_data(&pdev->dev);
+	else
+		priv_match = dev_get_platdata(&pdev->dev);
+
 	if (priv_match) {
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
-- 
2.17.1

