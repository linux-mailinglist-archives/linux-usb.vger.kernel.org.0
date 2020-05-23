Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849661DFBBA
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 01:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388147AbgEWXXW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 19:23:22 -0400
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:23517
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388010AbgEWXXV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 23 May 2020 19:23:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqK4RycBphjoUhiqiBXEm4Cp3HyHhrLAjkp93WA+lWl68zFXtTrxn/MPLXxeODp55AB/CYJC5+vQOhHxvcvfVEZ6KUCZexAPNGRlNnNZRRs2TchAQ5eE28EicbsW4/cbB8fDAOiqclqZ8XwWLxHQKWgXfViL3u6fm7vP+2frzFAth87rr4QCDqwB94JUCCiK18xj4fGICNIst22JmZ4EgmvuRLJgmHDZMKFXzGxyAaP0PrAGxv5LCgVUsdFBvcOmQI/5HqujD8QhoYYYxSITDNhyOMoo4zBOl1hINKKRa5Yvm6WLF62RB+HjHhte2MhiMrctXcbq2reZcQjC8lxrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1YZzZ589G2IRz/LzrnhKmir3H0rRq/adHtpX3ezRlE=;
 b=TwIe2GJ1VwQCuAA/0VhoS6/jPBCPMS18WmqDdA8HsYXgEh3wd5Vqja2r9Khl60LJI0M3zN5xF7MYUVknget3wzDV0xuxkj3S/RCgXTpkfQg357bP4L9LuOhi8J8WvapgZzWWpCov21oBU9/hPpAoKsULA4HvX0b/nwB8oNIWntTLDLzau+1khor1tw1JNnvn78clb1IALEFQnQdExsothwncL3M5dp9ntZ2I3jfOD9YW8AgTaNa1EQKB4GenhFGT62NFK6POnyzbiAS1rCwUalWXSKmsEA6CNCujflurbGttnRyW5YJ6mOc+y4+tpsmo/q8WYdZ8sToWSJSkuiyqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1YZzZ589G2IRz/LzrnhKmir3H0rRq/adHtpX3ezRlE=;
 b=JOLv3sDVyBzeJSWoGBh6uCbULuum/1pM5n9rkI62heEUZBncwlFCY0r6mGjr4rOH7UzbEPtfkBfvTDyMwdE66g49bS2SDAN9JkXzWuBWxk6yVdBW0e7uZcG78IKQS70PFNQKyrvXSZPKyp10kL5Mh+Zb6fXs9sy8nGNm4xOr9es=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sat, 23 May
 2020 23:23:10 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.026; Sat, 23 May 2020
 23:23:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 6/9] usb: host: xhci-plat: delete the unnecessary code
Date:   Sun, 24 May 2020 07:23:01 +0800
Message-Id: <20200523232304.23976-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200523232304.23976-1-peter.chen@nxp.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Sat, 23 May 2020 23:23:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 226645f0-7da3-413a-f3ef-08d7ff7041b5
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69187285F462EF27AC2F9A958BB50@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0412A98A59
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QICih1DZ3NFaajkSogbBfTPNTu5WreuatHk1KfqqpCrj8X90jFmznBneg6DOZHiCP8i3YqFCUT2ST+/91QV9jtVVEa5fTTBtrCdsHnPkG+yfeCX55ngxBYzQTBPaEzGrA77iCE+4qCg9PtyPM5F6RYU74UuFTZg9pSnHAROgAt9ByHaMujz6qSXhGthwZk5WQv9ztxzYjwt6D1oS0Xs+GgMKNxMSN4iWFJ5mnrRRWC6T+qDKYvPK7ByHMCZCB1iNWYa3DQ+uvhguBaV+fFOxO2yR52/VXRWGBywWv/xQtaBGQ7C+uFBPB6f91Ndj3QKfSwARevbD9yK2TSEzMfkXtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(8936002)(2616005)(2906002)(44832011)(186003)(6506007)(8676002)(6486002)(316002)(478600001)(66556008)(36756003)(16526019)(6512007)(52116002)(956004)(66476007)(86362001)(26005)(5660300002)(1076003)(4326008)(4744005)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Sk+H3c/mNw/L/GIvEr0t1cUZZu0MAnKI8U0teNxTj/4a1B97Ms4YKmlga4BRg0Ro5Ui6lV2voTCjA3+TNJG0bFA7kKyRpeTs5NfYTdC4t/ZdDT3lXopwXLVYVHcTtjdOoFqE49d1jnNxFyhebwpTjwRJ6IpHx1Wyp7Vxdm1gPFNAYydfgLfRBfKTE6iMpY0HlARwLyqAdPQf46c7oQkELP5mLZcvunMC+Hr+iOUCHUep4MwI3H3xG/Yx7nHIL+ObPgUI1Uah20TDHHQo5A4Mp6AqOUiUEiJljMy39NisSWnc7dDKgqqceglLKp95XuVLMDaWTjJyCYpvD+/8lawSiXiXSWcGBn+f8o0G+iseAVoHeeIzUUaINFdXUCImWmSHNViUqv/hYwnCKmRx7hzFMovpaoVmjA/DzzvDgilSZwG96PPeIApI9fw58icrQ2kl7XwrKGRGQBwywskNn5KWy9vFkwOZcEERJOad01mhD68=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226645f0-7da3-413a-f3ef-08d7ff7041b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2020 23:23:10.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vyf1GERnXXl0rqDx69Kx333IwMdsr6nQ0l+RqoB9vSH04dfm1OkzreEN9A8SOBkptDT0X/pzQL7jdo0vHVSRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The if {} condition is duplicated with outer if {} condition.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 51e20464fe0a..03d6bbe51919 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -283,8 +283,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
 		struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
 
 		/* Just copy data for now */
-		if (priv_match)
-			*priv = *priv_match;
+		*priv = *priv_match;
 	}
 
 	device_wakeup_enable(hcd->self.controller);
-- 
2.17.1

