Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E421DFBB7
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388135AbgEWXXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:13 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388010AbgEWXXM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDPBgZAdnJZQwPaI7u6cKO1xABA59unWtjO99fcK/wOV6DK2ULUgfro6Rr+caqegbCLymZOhS7eKZDfKWx1W2nRayt+nMk7USGf5MeQEiWQ4ndNSXsGhXCfX6/32WhZl9gLnPj9FpGX5EWwsSltJG6FKc26Bgw3eDD/PCWx+CkXGkMgM7lIQj/zfJvx266rmhT9VccJL4sv2eU29gE7NYf0h45O5hgw9sGf2iGBwAflzF0m520bSUXT7wGCE1imfjhbBGMqecHmCbd5VSfM30XwgGMSQe6XtUd8de5p8YO0HzzoDkNybtLy84W611PnQpEesruhcZGGSVDmEqcXOpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL2dfqy33EElH1eL9prBdZEKCxJXKD5C09fQnjD21A0=;
 b=lLLy4Y2OvOzjKU5DfO66TC+6fAzGm9XA263DDhLJl/EkHI8uNmP/J5aygaTWl1LTMsmZz+5mRhMoLqttC08UVYBRH1WIW3o3bzjN1GLwvpMyK8Pg0CvphshCTSuH04vjJMBhD5FL1z9tJyPFWTnZ0yaAHnyA8cha7plNhnvwqqpZSbjNVn1PBcBskrwvp/G3NgmOGNcdTmHW4/3KXLc0YyRRzD3MnIEp0nWSsJPYypGmHOaZS0/GBtvXFGrWrDQKfLDACTBjdWGuHECJlf0ZKQHhc8jb3a9mY9zcySzP2LdRmvTgXMo4rTaq3lzmiLRi+jR5UdOSwP4+j1Ytzr98ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL2dfqy33EElH1eL9prBdZEKCxJXKD5C09fQnjD21A0=;
 b=g5MXQVskZ0Ka/7+pLZcY/VlMtnYp5ZEyvMWdCBPRoBf5tREtXfe9mCWGFjSHwOSipRZpRWqxQWlH6EbWTnJuAO1mIOctQwH665cUtJZ87xKejmmNLxK/tNNmNY0ntn9RBQcoCo4VE8rHWAPU9EGWqtO3a7nI/fVk6ocGzSnh5XQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 4/9] usb: host: xhci-plat: add platform data support
Date:   Sun, 24 May 2020 07:22:59 +0800
Message-Id: <20200523232304.23976-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:23:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ffcb6f1-cc85-4c31-fc8c-08d7ff703e10
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69183EF1D3DB722CBAFB4DEC8BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BO7OqMtOVKIvWlZ7XW/09Hgu33YxFJWBEG8s5+TDjuD+VQmlKbLEyfIYfsbKBC5WVJJkpyWj0XxG7zcpGxuA0G3BL7A1U13PIB7+kwafuezpqoznp8XOIBjNK7ppeUHgcJaZypsx2VA/yj11D4QujLB7IMguXTmKWA2KPA9b+KlbixXN/nNjhQj1PjBTVeX542vpOkBmZDI4dkUM9e2J0wdNsqYEJeHVwaIxzXQox3abByZlk+D2Co5AQIXfxM+koLUhobHQeLHV2etI8qPJEZ5FWQxhd/9v5SgZFSYvZ4TfIl+V/bNg+ipSK6xX0kW/1yslDHllD2aEeZFqEJdKPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(4744005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cg5RwjTd9PaVTVGSqFhxEcXV6rOPLeaXPDa25hGpTae8y9LtDpaYn5FBCBsT0mZ94BVtwEhRvqwYrpGIIcEEi6l231DH7d5HDtSElL+I8pKaYQmPvLvNv+9KMHr0bISvAswgCKu5HpctH9QcxAvfjHjtAcFjR3T0Ews+faSYu+EqSzzFRmUNfV8plctAE7EGMwDHGsb9XHnmxNaYsRBcZOI9kdxnpuXHqCWKkd+07ZGfMjslWI92OViMt41OaavNAYR0TSqtiNgkAjoxOQE0P73nliY8+OHkEG5lgdwrX+LOtgQD1EMZQso5Onl29Lhy2x/p0PsndGbwrck65PAuy5xUp8uGhGvZ/VrBa62kJNEP4sEoU0tyaWtKuQavneFyb0d70yTP5x+ysRMo2x49LTIqjYTyngySew6ggf0fy2HR7oKz4b4oFH742oFpKWD0bGc4aF6zo/V0vPlsEHYSLOZRGBHzr2RLBeqa0uziuyU=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffcb6f1-cc85-4c31-fc8c-08d7ff703e10
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:04.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XPj6q30EorF/8dK7lp+Am46/7dFLbtBVNbLkxdtv0xdRS7MqbEKFRI0TXYEwn2JkDHftXI21lUcHtOJxqphxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some xhci hosts (eg dwc3 and cdns3) do not use OF to create
platform device, they create xhci-plat platform device runtime.
And these platforms may also have quirks, and the quirks could
be supplied by their parent device through platform data.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index f6b4089bfc4a..38bea2b6a17d 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -264,7 +264,11 @@ static int xhci_plat_probe(struct platform_device *pdev)
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

