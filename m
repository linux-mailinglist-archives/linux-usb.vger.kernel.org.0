Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B5C1F134C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 09:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgFHHLO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Jun 2020 03:11:14 -0400
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:14272
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728953AbgFHHLN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Jun 2020 03:11:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGDi89MUR6RN9Th1JJAImQrqPO/PiHxzTAQ2fzMQKQnG4clC3UKfQDgG+xAiYJSWcvJtqUXvob8ZfTeiBktgd54CM5PFDuMqp0V7X+RcLK8P/8zrWo4anluhgF2Z9N6yIR8LV9f4aoslN66RoVZaGY5nKDiZR0FEpy9ecBhs9wJE+OUEqKRkzFYjVmoXhi2qLvcl7tZxu3KdLpdsGw30BVHciyBoc2flBFlz6QfTf6L2OnoKYPJ6JuH4vJK0gOh9mVZjIRtJNUZVDpfwwrA5A15Pb6hLxr0KMTHJVw5da1bLkqnWuOazd/c0/XZoGRpKS/WPWqTjSH0yNOUP+iHNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSvEBE+KCAkB94M/t9GdktCL2AaLc3cRFmrEspB10s=;
 b=IOevk5X8ZwnFmU+WU0iPF7QzlidB8i6pcsIfsSEJRFG5CcAlCKBo/+UdpkOIrDBAILUQLTRO57MwZKF3GPw11kq6HuzvI+IS95eZhDr8ApXEAZb4qaFLAUj5Q/bqXVh+gb2bSTsW8GojE0rXHJQijGP/CFyNkHHi6e4h9acJr7Gz1Kie/HX74m6jkaRhH1MGybRcz6C/2aT5RRM5U4ueRImUiZYMw4Z6pyfPboz69GJj9vfB0uoDQej8zKgx3BLW+/nsvK2StEfNdsdTXgrIb7luCSeQNHeRTHkoL64K0rRZteu6V1W6dxQ5iRlIlmPSY5gY9B8ZuIqe6atJSLOrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSvEBE+KCAkB94M/t9GdktCL2AaLc3cRFmrEspB10s=;
 b=Skuf1tjwI5fiZ33ZnRLd7WcL4b15lcUdT9lyacsfH4Dcy33LNYWiXU/nuhcX/G4O8ahG/KU+UpoZdMqGTj6ka+Bhptf2xrVgVzPwDSSF+eIDxe5KIXw4O7AgHZaZNK5ImoDfikpF53k3jHMHgoyTknQfvg9NnjiXcsioOu9ZDVo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 07:11:09 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 07:11:09 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 9/9] usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
Date:   Mon,  8 Jun 2020 15:10:52 +0800
Message-Id: <20200608071052.8929-10-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608071052.8929-1-peter.chen@nxp.com>
References: <20200608071052.8929-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 07:11:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e3f66d73-3cd4-4a53-1444-08d80b7b1e0a
X-MS-TrafficTypeDiagnostic: AM7PR04MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68700BF87F1D4B7CA202914B8B850@AM7PR04MB6870.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDovy9/1A3r/gx8MAVLUnFxB99npZINae2OMMSNa9NdtDuXGdrlsJPyQXscDbc4W0iXlIufvyANVFbHEgFM3VZ0+0nSsRQqT1drcKL7JBWONtdR6YKxgP/XMl73NJhjyiLIWjxoM1jwqsTaqOgXcZKnm21N1wu57t+ZDObj/7rB9tyL+zHPl9SS61mPjKnYa+iGIStDMY30sfvB8ok8WoHDWs1Yaw5BA3+ETGEWo56kK02AKJ2OIWSnxKndi1C58OnYQtnOlZnKUEFYXSHZf5Q7OHtizW+fHYhYzAoCkpiSEvzkY8LNmm/qgSpx+BorqjI0UEJUW7Bwb8736eMEHRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(1076003)(6512007)(4744005)(66946007)(44832011)(5660300002)(8936002)(66476007)(66556008)(8676002)(16526019)(186003)(956004)(2616005)(26005)(6506007)(86362001)(6486002)(316002)(2906002)(83380400001)(4326008)(478600001)(36756003)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: oK3IBMSK6gEC7x/cWEfj0Vo/Mn8zrzUcTelp4dTa9pGPUxcdRJwBW1RenbilikB4jVa3ka+8jJ4UKlr6I7OssUvVsteK4eatd/BM+AnFmDKnCQaBikd4dc/ch7jrGRs4/WlJfamcU8FPwLc6zk5OqR9eXe++U/ANnNEm1KjqOYgZ8xvMr3SkKCKL0VqFoNsZxoiDaHRaG4WkmQPQfPWe1W4QhDLGmR7zsV/2WICdrqhbojenIrydcpJ2rPHqUOy5urVy1vqqSUtyYddTCDwRcagtcT8nZvbI87jL3BvTZ4Ne23Q4mUAGtdDDcMw4NaT8MtDSTklL82AUze8wR6oo2OkGqpuENAhRVCXqH3juk86QMm0BFJlhcLDxDpbMOOA6/6CJnmxH+ZaPhxPs2t4AF4yri+2pVp0ROTc8JPsFkrr2nai7pmFZqNLeBXEQnpNM1G4/HxPgdSWvrujDr87wAMqjqj5ckEhtDwheuTctbmw=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f66d73-3cd4-4a53-1444-08d80b7b1e0a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 07:11:08.9449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6h+uvg9EvqyUkvvmo5jtBzGJdwXUmicEmB+D3hR+GjBc1cE7WCIMPaOOWTrqrZre7A0+WtOUS2aVyd3+Y3fBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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
index 030d6421abd3..1dfbe23fa089 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	(1 << 25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.quirks = XHCI_SKIP_PHY_INIT,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

