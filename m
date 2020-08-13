Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940372432E4
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgHMDjB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:39:01 -0400
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com ([40.107.21.40]:46849
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726576AbgHMDjA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:39:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgHgIfeLxtxRfJuMsTdywNKcqbc6vG4yyPiWEJuOff4caBIQ6HDhHex7/EIyJFEKX7eLU/0lL6xsGVcG+3PtiVJtX6fNY17XkN4ayo3pFxg63TDYAS/B8Pta6WVoNsbEIRVUmtUrT03o+N9n5qBxeidrRms4bHJ2zGNsEiuuu9DKQnFRNoC4khqVOcoMrS3byY9s4uq3toKJK8wGXLOIiRWi1UUvW7jQbq71kqliMo4Y7hTB2cYO8PSR50OiitjpvwxmN8buQDFlS1/DeIeKa2qywCTdE8oTh13DlJ876oWXHYcwYnHos/5JY+KkhaHyg+Q9pByHZDqps36USfsjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAMDPVNMui449JSukPWPPS2D9k5beTUCvuOBplnFeGE=;
 b=bpL6NQ0mIyorrgmUTW31ZxHalq2cyka5pzP3CnWCbEYbHyWbpSnjk5cvfFy5+kfOiU+0l49UBek5xVn6HIdcTKYKXdqL/QP0sZs6dGytWvsB/7TfOXXo4Oc+fms6/bpH23o2qmluy7SUeEerl0DUsLrMBz9rcRMhV2YCmjEBHNh9ffhQ4GT5hRc8yZKTponEL3mHKiUl5oF7kce+xjmiujUkj0kpJC7Vae0JwJlkCGQ/I3VyddDUiZTKlOl0IYA7EmwehvTndnP/VJwcDn9v8M/jJWDsv22Vx2Cpegi4ctaRuOU+DwEEHmbXlxcT+ZgWYTKexICxp23t6B2FkHnOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAMDPVNMui449JSukPWPPS2D9k5beTUCvuOBplnFeGE=;
 b=q1IpFj2uOXT53B7sDkHJhB7Ttvpx8Byf85kZDiwnhdSNM24657LBeOtDxbX8y9aCqP66SJGTg/mkcYEd/gR8/Ssk0alppbn3IOjHaNXVI6+0OYZpsZch6IYAZMPvGNKOVQYTTWt8LtLfS/SPXBeI1g8t2ofizVzUeiQGr9bpSzA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3654.eurprd04.prod.outlook.com (2603:10a6:209:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 03:38:56 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:38:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [RESEND PATCH 6/7] usb: host: xhci-plat: improve the comments for xhci_plat_suspend
Date:   Thu, 13 Aug 2020 11:37:40 +0800
Message-Id: <20200813033741.13982-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813033741.13982-1-peter.chen@nxp.com>
References: <20200813033741.13982-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:38:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd7abeda-cecf-489b-fed8-08d83f3a67ea
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3654CE5A6996AE4B48948D5D8B430@AM6PR0402MB3654.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(6506007)(478600001)(316002)(26005)(6666004)(36756003)(6486002)(86362001)(4744005)(186003)(6512007)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(5660300002)(956004)(2616005)(16526019)(8936002)(8676002)(52116002)(1076003)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7abeda-cecf-489b-fed8-08d83f3a67ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:38:55.9829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7smKU7bjXgu6KQZ6S+2ccib4bdxUV3I3BhgR6V6HJhjZDhmlFwE6oT5p5QbmaSJHAAhSN0aam2UXrXmzRTKjCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3654
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To reflect the current code status.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-plat.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 0ef28b2caea3..7e2eb0439c03 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -421,11 +421,7 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 		return ret;
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
-	 * to do wakeup during suspend. Since xhci_plat_suspend is currently
-	 * only designed for system suspend, device_may_wakeup() is enough
-	 * to dertermine whether host is allowed to do wakeup. Need to
-	 * reconsider this when xhci_plat_suspend enlarges its scope, e.g.,
-	 * also applies to runtime suspend.
+	 * to do wakeup during suspend, the wakeup is enabled by default.
 	 */
 	return xhci_suspend(xhci, device_may_wakeup(dev));
 }
-- 
2.17.1

